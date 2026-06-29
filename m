Return-Path: <linux-arm-msm+bounces-114940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ez3TLhVCQmqK2wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:59:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEAA6D88D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:59:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m4F7cJSs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="I/beJeHD";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114940-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114940-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E19A30E256D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5483FA5FE;
	Mon, 29 Jun 2026 09:51:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93043F889E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:51:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726673; cv=none; b=XEOpqafOf9rw/0nAlS8gXnKrKBR+pCXfINyNwL19w6rMP0CZMdsTPReQfEZEHW9cfOhmDK+Zdsldj5GpYKdqkOnl3ba87auobWAosQ/YN4vkzbE8zPdwjIrljV0C1UUMHyaZIwFjyWhgwBl/MqKpgDr2NpJNZa/UtasnZ3IvWic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726673; c=relaxed/simple;
	bh=clg0AzGHYAP/V3MGodBAGw/7RE1WclMLvIgKBJ9RdiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pi1QqVpTENQcV5vNcNRIXR7Oiih63w4ZAR4qLSOWU/TeRurRPiyVjtsBmSSnjklGgor7Se6kJWAOdIPoZg9aWPyAypw29nJLD58mFcrSBgmJnz0xrYknsuj3c8Zu95W555+UMFAeAQYf+hI0g7CMyx/A4I49QO72wC+y1Oc7aWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4F7cJSs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/beJeHD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8wabp2391294
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkCQR8MNxV/qrXyojcsgaOniTxZ4r+JBV6h6codhP2k=; b=m4F7cJSsDLVJ8KQR
	xRAK8vfkJtOncPfJ4Of0R2q3n5FwWBzepSVlDxzpMsIADkshZgCj/oeIzaoZviL4
	EwJYZESsriOFsRzC1Lvc6ViLV51T+3U5XK8d4UZXPusEKbgTzAwjFNTL9HH6KWqF
	9CMtL7byypShWGHjRDEtc6EbagtgvlDsr1WRXp13wvizwHAI++aBrGqkomlc0QZH
	nPbxi9zp7wF2+dtDkPXxFq1mgAiTPH/TYmAzKukwgrqbjHiD0jD1PkJYFfNJAmCf
	nFIWDa2Dz9PU6kYAOJjWmleIBu6eBJH/ewzSf+rfAuNy51L7p/302uQpUABPix1l
	y4M4Uw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw87pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:51:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e566bae1bso9773285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726670; x=1783331470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkCQR8MNxV/qrXyojcsgaOniTxZ4r+JBV6h6codhP2k=;
        b=I/beJeHDpjYCrgx2O92qmp1XXZHX8gJJtbuhX6ZIQ8fOGWRxjyxcJzAMsyMFMojVJN
         RvCtH265BIvn3bdFjACupFm0ZfQnGx2VLdNwvcxDz/mzs1MCvpGMsLsT1RSYqy+9TuSO
         9Q/z+D2n2iw1ZwHANQ8S4S0WA4B0KOPT+A4CfFA6LstTUyY3DTf9W+fjMmFnIcOQciAN
         mFku4qkzIjxdLY+CLLbHqsOptlZMtMskm8irnfKIMZO1m4ZFn7+EsHq+Ii2jtbqzDXUI
         UMlcFYBEd3DZu3WnDq3yAwUyWtMcZa4SSfV1opLgqX1JR2M133DxZkzmavvHgLbjm08G
         yABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726670; x=1783331470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkCQR8MNxV/qrXyojcsgaOniTxZ4r+JBV6h6codhP2k=;
        b=UAZYW3F4lPubosV2S/9W1+LbyltrbfmCbm8Lw47kAb/qbKIBCsmD5f4YxigWi+La2c
         Y5LQ8nCP5mRV6tI4CJE4/qgNavztLG6csxupaXympCpZchvVY7QEMGU/Gxz9CIRP6SGw
         2JrV96PvJ8IaAphVM7qEw98Y2VMt0uSgVZ4skBpwT/iBQ2EhwwMz7IQOJlz+0hi/nEOg
         HthjMJVy5fxpfvINkV3YCrD1bsYOlG/wHy8km/NkUkJtF0KsfQWeFtGY8sUpCbKv4oMf
         U5GCtuJ9kaNMtfjzvgMtoQjkGmFBnkTTAdt9KVeyaA90XHtOYcmT70pxpM8Xc8uinYEM
         MYig==
X-Forwarded-Encrypted: i=1; AFNElJ/Ei8YfxLkbpX/imxCRGICXVHove4Gp4kVPfQB+ve787nIneEV6GmhBiohsuElEPqU+khDU8EOuprz91Opf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1wgHUS5P2enTgK6pL4YJC8SIyU9HmDIO5th0yo+c3GmMyjO5Q
	l6PYiuyaF9R3qYYbZ4lK4w1hT6sETt/QFgonCJ+f+pssxKIg6u4mxsEiJc7wbawUd8dYmWCdjwu
	QlJycA/fx4oM5W6hlv0t77huRwhBwXBCtFg4gtsF7iE2I5ecKf3BWbmFTel+oKxm0JyFb
X-Gm-Gg: AfdE7ckdy7zqUFw0S7Si9dQAQkGK6aih3fCthNK581pWYmO56LoilypuBRlRcaz2wBb
	TizGhSRTFSc4RKPP/NLlNyV+jrhg1WZZDhy5zUbjiMTU/9F+doLxBX9NCAs3kTmP4FSJmt07g8j
	spRpYJNZkibn4PBN8JVcHH6NL/EMMslXO9QrjBbfrNonMB30kRnq7qoyjgC0RheTaW4V9Sau36x
	hY1HW+bDoKIS1nlr02Lbifto0mY1N5fO+khY6tNRv8JV8QS/gsjdrZjb+wVzBZTy5beAZ4i2yza
	AHFhjiXiKn7MsafvoZ8tITX2pR0Tmjskt1QPKw3HhC+MrOhMb3g+l48+JeZ6JKuB45QK3QV6JcF
	ocDKxLNRh7i86TaqwxH55jNewIeVwvRx+ow8=
X-Received: by 2002:a05:620a:2b46:b0:915:7c1a:1388 with SMTP id af79cd13be357-9293d8a98edmr1528682885a.5.1782726670227;
        Mon, 29 Jun 2026 02:51:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2b46:b0:915:7c1a:1388 with SMTP id af79cd13be357-9293d8a98edmr1528679585a.5.1782726669775;
        Mon, 29 Jun 2026 02:51:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba677csm744546666b.11.2026.06.29.02.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:51:08 -0700 (PDT)
Message-ID: <050d47ac-9089-4a72-be89-d61fa695c00b@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:51:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-13-8204f1029311@oss.qualcomm.com>
 <77a5213d-6be7-4a86-81ad-3509a499ad12@oss.qualcomm.com>
 <3f8d117c-2ced-480e-bec6-0bd38a60b7c0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3f8d117c-2ced-480e-bec6-0bd38a60b7c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfXxMOVtsynfQoZ
 snxuUw2LKiV2sRpJtDgor8Ccxln4wW6dXb3k25l7ZFrwolqGDhi0NUTz5hhJJzDCeaakSchVA+f
 BSkULJo5zjOkvdRPlu/UQx/vQCVklyk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OSBTYWx0ZWRfX62Z9UAsHpBra
 BsUqSrYAQ9LlNSwhIdR95wmhFT5Xf1BhNUMQw8Dx0W1DjSwc20e3WNYcwYqTrxhS5gRCcClaIj4
 L7h9c0l+vf8G4pEL5qjvH19jiaoX6MUQXvWqhMm6GEExfD13LwgOnKFsMIds7hLHAkQJZH4SyzW
 9Cj0xeXF3sCJSNfFa2SSYaI+iWwbFHM2yW62Q8zGUmEfQ2MkopFtg/sxrv69wAGl52gZdj89/2y
 kWDPLOcbBJwnBHSAx/Q+YO4hNre0kBwzeo7P10EzDBnxm/yScWBoOU+Z9ZpxLXXH7AW4d+rK3fq
 tt4MzuZ6bouUSCuoY550M+tTBJdpETO05MtHN9g3NIMENg6zzZ4yxl8VlCyEvyEUJlQQ/QIOq/O
 7dj1GIB4sUvmCPhXcKh12dGxbFLQrR+EycCbZTUhjUuFcnV7tkpOj0bojCEg5pcYrIkrJ7zOEAp
 7aYLJIj/buZUVfHzBBQ==
X-Proofpoint-GUID: bBUvXkrGa63GtWGmtqDykRbNcDRvaJ6t
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42400f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6UAb0L3E1jN75_jUm_YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: bBUvXkrGa63GtWGmtqDykRbNcDRvaJ6t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114940-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 5CEAA6D88D7

On 6/29/26 8:43 AM, Imran Shaik wrote:
> 
> 
> On 25-06-2026 02:14 pm, Konrad Dybcio wrote:
>> On 6/4/26 7:26 AM, Imran Shaik wrote:
>>> Add support for Display clock controller and GPU clock controller nodes
>>> on Qualcomm Shikra SoCs.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---

[...]

>>> +                      "gcc_disp_gpll0_clk_src",
>>> +                      "gcc_disp_gpll0_div_clk_src",
>>> +                      "dsi0_phy_pll_out_byteclk",
>>> +                      "dsi0_phy_pll_out_dsiclk",
>>> +                      "dsi1_phy_pll_out_byteclk",
>>> +                      "dsi1_phy_pll_out_dsiclk",
>>> +                      "sleep_clk";
>>> +            #clock-cells = <1>;
>>> +            #reset-cells = <1>;
>>> +            #power-domain-cells = <1>;
>>
>> DISP_CC also needs to source power from somewhere!
>>
> 
> The Shikra bindings aligns with the existing Agatti bindings, as it is a re-use. And the Shikra/Agatti DISPCC is on CX rail, and it will be always ON when APPS is active.

Yes, it will be on, but currently the genpd performance state requests
(i.e. RPMH states) go to /dev/null because DISP_CC is an orphan

Konrad

