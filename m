Return-Path: <linux-arm-msm+bounces-111462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y8m8DupqI2pCtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 02:33:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C673B64C05D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 02:33:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="eenqV/qC";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VMuHf7ob;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111462-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111462-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B30D301D6BA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 00:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BA521D3D2;
	Sat,  6 Jun 2026 00:33:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F3F1C84A2
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 00:33:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780706008; cv=none; b=mXnaPeNKvulkqUh67+TwufN2Nx5T2Mno2n2uSF+YSANk27GPYy7/ev6qQjHpmia5j9KZbhZCikFNSGPoxXJjeE1gYAra7tkwST2O0mpbdQBCr4KBmtQa3ZIMZ2wmEGchaW2nhLVzq+1K/OoEnZcGk7lWB/mHyc9W705/D+7ae8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780706008; c=relaxed/simple;
	bh=sQRBjDxFXr3SfHUmFdjcdaAOIAmTB/unuKO7H8NrGb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMuenRaSBGBLNEAgnfNI4otzrUX8eUoc2YBVuVnVZhCIfjh54XUf+RRQwM0m+7NWkHpS7cuJhITUTZifZ/Im2k2iLXCpIdT/0X4rncegwtHhPBwnWpVemuUe34lZXcm/QO5Av5YP1CZQwoBvbPnlCS2IjVMPfrFb7+OXM034mOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eenqV/qC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMuHf7ob; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6560JX5v1953814
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 00:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2cEb65BDmKUbcUgyRPqAttYJTDUaCl9UW5rhJynFMpQ=; b=eenqV/qC61m15tn6
	2tffW4cyC3KQEVfSxK7kIVASuL1UPl7EwYf/4xq1Ez9iWzV5/nmPPkG3HR881zw2
	b3DMF+ssQYSKyzF/+dAEs0nXOWo3xsVx66n6rbbmq2rm2Wct49/Uj7eMUiiE/eA8
	DPaYE+2ONSw+I36xZhc57zm0I5PgXd8WaBSI+L04C2jjhPdqlOWnamqpoJ4sumqx
	hYTK22lQDlyTCb6jqcQwLADc1c0MIpaOVSHfYHoqsWIRozfhPapTq6QTsrTDqw3C
	VqAlyhE5VMhcREcIAMszvSDy44VXBXwQcTER/mM/e3caT1McSJnCFvsOf1Atpv7o
	0YxsSg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em8wmr1ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 00:33:26 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137f2083280so9997107c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 17:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780706005; x=1781310805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2cEb65BDmKUbcUgyRPqAttYJTDUaCl9UW5rhJynFMpQ=;
        b=VMuHf7ob1gjvYOlsp0gNfplJ5AP5w4EZus01LMYUbyTU72XliRlpY7Kz/7beKAbD6e
         aj2lb1bVg4fnd4VX3KbGlveT9+kHEvq4Zg6H++LNadXWSzk6+LqfdUQ90QDMCEhsSrcb
         qM7ZlDJRu6s5NSBWA9KIcPvksi+Ktb2zrR8B/PAV5Cl+m4I0N46ZDgVpDf6gU1sLsjtq
         VW8pRz265ytKaB8S4jqX3eqXpSMRI3drBAWfxrdcyGkAldLZql6/vc6RQq2+Cj6oGIj9
         JkNQ7Dih09ckLYUpxucUNFze/J6567QJyzvL33Wo4Ak4LiFwH8rF58jajq+pVm/Kk9fE
         v2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780706005; x=1781310805;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cEb65BDmKUbcUgyRPqAttYJTDUaCl9UW5rhJynFMpQ=;
        b=PjtKuy1pz5UtPTaU5uNTIryK6E9tx3/VWty+VcvOOumygqSJOz0RmPpKcKAoxxf/eO
         oV6UFST8V9N/onypKRMW2udXuUTzV46nV+HtHFG0hQoc/bOfcsUruQUKqWIgzaZL9ktZ
         TjXBXZ1ht/uJ4BgfHiPt4AFu2eRr+DdpYJTpU0aOLZgrT5bOdTyMMTdodwdT9QybVvpj
         GXDXnv7JZ6AajT3iJUHPIKZ7or83kOB1HedUauxvzZPnQqRAhYDBIzI4vVZJtsRJaL4i
         aJmXLu51rUe4TEFuNE9AFyR21vYbVGApWROufHLvlfPvriRqpW54GEqiSBT3MXknwhlL
         imvw==
X-Forwarded-Encrypted: i=1; AFNElJ9hUmaMBrDwoVLQC3sK9qrasni3OlEqQwUou+Gch4QiPa22kaat31aFIM1aFenyEgKFO3lQiOURRmS8nWQa@vger.kernel.org
X-Gm-Message-State: AOJu0YyX5zkoXkKV3HPLGm6Ny29KGR23VMikqrvt29TY6OSbnvxHFVjk
	7DsbH9i7ey80w2ZPdkhugg5gQQBPMeE7Iv84YPPgQvCDw4TpKSJmhWRLn6Fgx1IUBF3OeVGiBnZ
	OHNmfcrmesnE7aTZtsNlb8w8LZy+xeu59HSdAauxxvLU/eg9ZzSKrJ4svByD2GPoYRRBh
X-Gm-Gg: Acq92OF93YbGBhSWY4dTClEFeEtLso3b9gwY7WZvWwpnpO43RiFHC2WXX0Or4eKtb5A
	+YdBoaWs5k0McIxvnrmH/j1RgqrOS1huvn3hKLmg7EThj21PXNAPWBQGNxAJWxVucWbdEH4NJlX
	ODYG7t1uWChuwLBUZsGNjvtz2EUnsj/irVCdl5PfqmE0fj8EgE9yauH7RDTNA+WKB/0FyoTwXHd
	2NooCKHYGKq5uX0VH7Of7eAQ8Q8LRyKZDy+Ktht1bRCK7aml8Y8tdVxWHdhaaIrrxp2en+IbIVC
	oHtZZ3rP0wTPx/WLQE0a2BjWTArdR+TDlpJAJtUq4O4zTLcZ3oJ1GyT3iC1cwSgMdlrc/+3sY1c
	yaBK+KujnlwBiAuT5gyPf0DI9dO8FnbSM97gzVuWzASQ8/n3gCvyEwE9UDeyBRzn4wtb2798Kn5
	CwUcNyvMoKXl2fsCIgCskghQT0
X-Received: by 2002:a05:7022:6999:b0:138:104:439b with SMTP id a92af1059eb24-138067234ecmr3107189c88.19.1780706005094;
        Fri, 05 Jun 2026 17:33:25 -0700 (PDT)
X-Received: by 2002:a05:7022:6999:b0:138:104:439b with SMTP id a92af1059eb24-138067234ecmr3107155c88.19.1780706004568;
        Fri, 05 Jun 2026 17:33:24 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f548ade9sm6695047c88.2.2026.06.05.17.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 17:33:24 -0700 (PDT)
Message-ID: <ecad737b-ea4c-4f32-b519-f338cfd6d48e@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 17:33:22 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] remoteproc: qcom_wcnss_iris: Add support for
 WCN3610
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kerigan Creighton <kerigancreighton@gmail.com>,
        linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, wcn36xx@lists.infradead.org,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260306004344.10968-1-kerigancreighton@gmail.com>
 <20260306004344.10968-3-kerigancreighton@gmail.com>
 <4f94c20c-d06f-48e5-95fb-5380c84a1b99@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4f94c20c-d06f-48e5-95fb-5380c84a1b99@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0xXeJwJNfO4GtIvYGwjDzcutZo_T-L3Y
X-Proofpoint-ORIG-GUID: 0xXeJwJNfO4GtIvYGwjDzcutZo_T-L3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDAwMyBTYWx0ZWRfX4S3DneS9FufD
 CK8pT0sF3hy3CSMYn/1xxEPmV+0oMcGh72DbAawPuvtO1SNmWzXo3zPZ4EfK6P+e2sORq54wEB0
 k4pXApML4xYnzl7cWGoyzdTYy0KknIm9DtlhleCIAp/CG9h+LlXMb8OnqLpeS1OdruqZXL/bqIw
 AT0fVXcpnkWFIGauxQm8XQ/S9VkvAnIVRqOqP+sn014Hsc40TB574XbaZattZFDOk2L4FQz35uD
 3MNhTatSGIceDKmUwfaQtscY69+ctoTadR6h5l0NECiuT1jo70qSS9bo0fk14x95JdbPC/zJW2+
 blQa+LZuYSCbYi+cCK6zO+cRNEyThy1oOEF5Nkhm7tzmM+ZEPwbae7jQzPeDDl7NCAIDMeueMlX
 vpYIzmu2fRheysXTHyHDQFNOWSyZ5RwGBd6PUNBLM/hiZSFMqD3ydA0WGe+ZjZ75SVvAkbZV980
 N63IpK/2++QjeNORcqg==
X-Authority-Analysis: v=2.4 cv=fsjsol4f c=1 sm=1 tr=0 ts=6a236ad6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P-IC7800AAAA:8 a=95oUNTv8Wr7FWHs3mqgA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060003
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111462-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:kerigancreighton@gmail.com,m:linux-wireless@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:wcn36xx@lists.infradead.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C673B64C05D

On 3/5/2026 11:25 PM, Krzysztof Kozlowski wrote:
> On 06/03/2026 01:43, Kerigan Creighton wrote:
>> WCN3610 has the same regulator requirements as
>> WCN3620, so in qcom_wcnss_iris, we can use wcn3620_data.
>>
>> A separate compatible is needed for WCN3610 because the
>> wcn36xx driver uses it for chip-specific configuration.
>> Specifically, it sets BTC (Bluetooth Coexistence) CFGs,
>> disables ENABLE_DYNAMIC_RA_START_RATE, and disables
>> STA_POWERSAVE for this specific chip for stable
>> functionality.
> 
> This goes to the binding description where you describe the hardware,
> how I asked.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
This series is sitting in my patchwork queue.
Based upon Krzysztof's comments there should be a v4 that moves some
descriptive text from 2/3 to 1/3.

Bjorn: Once v4 lands, do you want to take this series or should I?
(Need to know if I should wait for ACK of 2/3 or give ACK for 3/3).

/jeff

