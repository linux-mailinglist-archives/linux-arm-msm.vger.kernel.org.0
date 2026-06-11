Return-Path: <linux-arm-msm+bounces-112728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hiYqOpyaKmqstQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:23:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C32671482
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:23:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gpXraFsG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JAI8RFIF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112728-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112728-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8077E30087FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C2A3E0081;
	Thu, 11 Jun 2026 11:23:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291BA3DFC80
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:23:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176984; cv=none; b=N9457qvrnnOl7W5daWGfFiE+O8mUvKXV35XwWj8fiF+IsdQjb9LMRVRuTSJllhONd3OCnkMS/F5tlM8qa/hhpp6c7kDqwyWQUW7sPLD18zRcW16GebiocujuEDkyOE54lo6fHZb2rzKZZ5ptkpPZpj7W4+BH42+NkKxOas/DdsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176984; c=relaxed/simple;
	bh=7IxRaQGWMti15l16w9inD3a87Oomi9WL8xah4r134G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uf4FDcE3n3DNX5ZkANLDi5oe8pH5wBmClzbcj5ctASp3ReLRYwufvBigIKntkoHP5rBvmeppNr8YLdIKXWpb0xkk4a+ZfQ5vTb0+06VU9WzoQoTSNs7UICvqAIJ08K4jNjgxJ9ZXOoZ2GpgSOmbbNXvl/kRiq2Pd6HZaIMWhh0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpXraFsG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAI8RFIF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xBmq242661
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaKwPTwmtjNWwhHDC+xVFQqCU8K9rJPAsqnciZvdJfA=; b=gpXraFsGVhXUEibG
	X8Oqdpr8v/Qd2tk+V4gV6TWSHum2ZWT3NsVKagjuVEuXt1/NY8UPtpJdcnS/tpc7
	jZS+N05sZA2ykrcGgR+2x/hnEcA/tndCRiX2yEEsXbh0RBsWEH8msmIfe6Mzd25K
	bHzQw1fMEeyij3O0DzHBki22T3zLAa3XVTnOJQ8uhqtkTq17tMciwZlU2Bt/qSVs
	Bea+mR1GBsCg+t5la1dpai7LupH+HnU+DxsNXxQvkbzhzmCsL2TUUkQHOBwl1RO2
	Rt/HicWmMximkEO92PI72HS4qevk/Z616pk7Q/6amIJl5fHJogqvRbzc5mFxg060
	B6YknA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7035n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:23:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517865e6219so17114621cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176980; x=1781781780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SaKwPTwmtjNWwhHDC+xVFQqCU8K9rJPAsqnciZvdJfA=;
        b=JAI8RFIFDHnHH55vucGLs+D1l297sTfMDrHvF38eKo5cqQPYaNYv9J8NnHbYzn8uO1
         05tPxXxOXdY8HO6dLuNgGKe9TZx1Cd6NsQ5p81V3BcFpuYr8IqWmYbwFuzeemzX0Ljsb
         U6z3Q+agIrEIfwhlEpbxCFMTQPX+ulY2mrp2MaV+CA20sfRC8p94VG2ovIdQJD+S751N
         QJkT185rJst303WcSJhCejEf2/nfu7kNXBYTkidUlGaQSdo7WYiOWICPLzu3xLzLyJc9
         e+LzCH+p8kWgfxjlPv77dNn2fno0Ls3aTbQBiMB4cStPpJN8nSqmOJ5B5oC7qkAaoj7p
         pUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176980; x=1781781780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaKwPTwmtjNWwhHDC+xVFQqCU8K9rJPAsqnciZvdJfA=;
        b=DO8Hmk9AOcxMQBkV/oxRCU7cveW9ju677ucP0cqUKk2JawpMiI3MBBQgwwM+m+9erF
         Tn0BxuRju0ZfWGyPV5CWB/R0gDOmRD/gQ48A/JfNK6X1VWHT0mieFTDcz3Tcb+0UYwq8
         CP/BVW/4lgzCRBAJiUXiHLuzbVvWc5SKlVPrvvKAhgbkt5GjW7Hen+uEV3kg1LNzWdBt
         ooR12mJkib8KM//8V7dVBPOhPIqwCJ5qQoxzH5b+O5pMV6pQkUyO0DQ9V7zBxJvDBo4e
         UAW3TDZQ9iWxdH7wvAMMW39JZJGgwDeVpoTkbe2z1avZVuI6tqpg8LR9lI+KZ/eg99AQ
         5EZg==
X-Forwarded-Encrypted: i=1; AFNElJ8uVr9RWoW7ZCDvKKCfJlv+0HoJBBbkGwGaHXpuZg8d6YbwCt7cyq8M11wpCz3syMDC+rSVQW3ppdXMEnGD@vger.kernel.org
X-Gm-Message-State: AOJu0YyQtXy+7uvSAms7PvZnIiOA7GCs7/1RMkckG/SUJBUOoyl5iIFH
	vqvo9SPB+dYxyItNYp9qiX3RvWQUpwFiTHQcXVCO6zkRB1UICY+ckCRDD0+TfkeRBYKGN6Q8S7Z
	rPN8ZnBUQnoz1LG+d4fhJfl4DsZRcJNkLUdk9vwJf83fojWICslmgWYtbXeMQcXF7Pc27
X-Gm-Gg: Acq92OGyThPuufpQq+AHpdBWs9qkJ67d+G3dtdWjVxLeXb1S/C8T3sxyEb6Au9l+gL1
	P1L4r0RnkS1UVDiAnkSV7o5N9ZxgXkrOpWQcUoNUpiDyWa8f7gmV20V4zkvn/U0nDLg7H7YtO0D
	HZf+3vYpp1x3Sq5Cbqh+CJKjiLuDik+JT1BJnWFOqehIjBtq4S7oiB5jk5CzFctR9iBS+2KlQrV
	Z/6Ipdk/BRlfRTBmPX8EBgBQ0eM1UmDymbgk0nHKA3dUxctetp3jx6bYvNqF8q8/LXI5ux3EaNd
	KvErMjLZTU5guuZEdTYBSBUki9XzWXp908bqKs7+UDRV9ex+FTy6nMoLzLpsNBhehffB5nyAZoL
	oB+IgwX+USeHBOIRNcmWuPkOrzNYKehpwpCZiwxQIDaEKBgaDme8BHpHM
X-Received: by 2002:a05:622a:1f18:b0:50b:2875:5782 with SMTP id d75a77b69052e-517ee2375f4mr19937711cf.6.1781176980380;
        Thu, 11 Jun 2026 04:23:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1f18:b0:50b:2875:5782 with SMTP id d75a77b69052e-517ee2375f4mr19937351cf.6.1781176979892;
        Thu, 11 Jun 2026 04:22:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f15621sm52097166b.13.2026.06.11.04.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:22:59 -0700 (PDT)
Message-ID: <02a767ef-0d6e-476e-a535-52b55d082b65@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:22:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add Audio Core clock controller support on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-3-7ee6b5f2d928@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-3-7ee6b5f2d928@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX+Es6lDUk0t2i
 Oi5u1ykgI2Wj2Xbwm5uieHFsW784JID+NVga1+dGODzWGMI97U7vNLbDc1o2l66mP5cKCdG4u3W
 YhZHh+rE04MqXANjkOVCQM50pi1DM/6lfxluBEch1djYbkxOa1DPZ3mbLoJRdb/eYBkpC8ep6yp
 L6QUd6S0n3HcjhX3fAAdnm7NxwC8im/DmFYQt9HiYkidNf7CfL2iv3cAkHBUjm3KhsyqiuHtZWb
 H8NkV7y8IlINkrc//rTzY7LXO6TiUwmMGYIxgL5FXfMVKoHo0gKBuCgYK/KkigHt5rbNbwUTVfx
 XbqAdYaR4zYAQg7IJihCQuw88hVR391SkXDybgQg3Xrg9IC8H1b5H9my03tn4Pt6od9tqaih9eD
 ph6k1UxQbidmDWjhvk7o79Qw3/o7knXiUDgJ9UyZLuWEBq5XzeoCNXwetBx8oDPnwsj5P20ndbk
 L3RVDKPR+A3YFzsdGsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX7XpO9aHNJjio
 +v1yndkx3+xA7xvm3cekS7DwJJLxpd4UJ/YSGLA4SJXTZpY8W+wbWf1s0vYxVronJpi9+1Ax1Nx
 zS8Stv5qcQUTaxj0sHG0eN9dqJFCD24=
X-Proofpoint-GUID: hZf7bs0dSUp14mxf-R6USpdzouvg2s5u
X-Proofpoint-ORIG-GUID: hZf7bs0dSUp14mxf-R6USpdzouvg2s5u
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a9a95 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9j2NjNoUcPKmTTtl3isA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112728-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88C32671482

On 6/5/26 1:26 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AUDIOCORECC) on Qualcomm
> Shikra SoC. The  AUDIOCORECC clocks and resets support differs based on
> Audio subsystem enablement. In the CQM variant, both clocks and resets
> are required as Audio is on APPS, while in the CQS variant only reset
> control is required since Audio is handled on Modem. Handle these
> requirements using variant specific compatibles.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]

> +static int audio_core_cc_shikra_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret = qcom_cc_probe_by_index(pdev, 1, &audio_core_cc_shikra_reset_desc);
> +	if (ret)
> +		return ret;
> +
> +	if (device_is_compatible(&pdev->dev, "qcom,shikra-cqs-audiocorecc"))
> +		return 0;
> +
> +	return qcom_cc_probe(pdev, &audio_core_cc_shikra_desc);
> +}

If the clock list is complete and you pinky-promise to never extend it,
we can simply go with a single compatible and use protected-clocks in DT
to avoid accessing any of these registers (sorta like kodiak GCC), removing
the complexity

Konrad

