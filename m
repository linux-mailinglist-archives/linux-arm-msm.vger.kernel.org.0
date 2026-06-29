Return-Path: <linux-arm-msm+bounces-114993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6oDJLmVUQmqO4wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:17:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D676D94B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:17:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HSuOCJ+z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="P/FU0TRv";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114993-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114993-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA4CA302EBA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A656936C9ED;
	Mon, 29 Jun 2026 11:11:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B08367F3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:11:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731472; cv=none; b=PhUip8/ZcZ5NL47bQ5ro6+ZenS4Du00Teimh+WoXE7+eegdRZ2y8b/FYKxMpwlb6XYrQIVC0MMt75VAg5rSOGjJNjchTBXE99zMTtYLS01KOPSLa8L6ArdmKrybcSX/WYQ6XJ/Yq2TYMWCgS7G9zIBNu4VdrLxrK8fyOKhPAV78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731472; c=relaxed/simple;
	bh=6VI1cOI4DIVFsX2jNSg2ArLpeV8w/QTRo+eIPG6eK40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MpmJWER9H++rhMIoHAKnWe81q259/XlldRb+VVLlPJzA/sNCMo+VToPcwe5OjMo45lvCZmgQgnoywx1/y3iQ2g9H4q8aYGLE/RrBoQTQO0PozpWtbZ6zPxO8UZRhsyatSpHB2AVkL7WmNjmpzm95QjGmSL0e5TJiqbJ2yf8vJYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSuOCJ+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/FU0TRv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB5FQ02728575
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f1/vVI7Vg0u7tOLjpfS+RD3dzgmvmflgooRpiBzzZwk=; b=HSuOCJ+zxyreW0Hk
	IyDtB9ytcO3gjFdlN1o5A9tsQZ00nr5VO/Zl0oxoWn6IHiwtq2vXO3rDTYhCri5A
	qm0S/QSFeST0yw289rrveeZhA3CRBNVd/nmJphq8qeaZ8JxE/5QcI/3qJpTunv3f
	5KDnrEt1AlmiHWTtZzxkviB9bWjsSKcaBfrLMllOvSKV2DjxNL6y7WXIian91fZE
	CTSUoBcK6u7JhftAS1BqldyeBeUfruSPMfZfQ04ZrAsT6BpbDDIqwm1bOyeGq4hd
	Cu0ILbeffTMdQ7L7CK1x31iVhYuXXXqMOCkPFTCey7mvxkRm1E4YrJkjTMLazMs6
	KeeZcA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha80k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:11:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9ae1da340so33096395ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782731469; x=1783336269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f1/vVI7Vg0u7tOLjpfS+RD3dzgmvmflgooRpiBzzZwk=;
        b=P/FU0TRvmrNd7f6WKU5sOzzBIc1JrV7vN04OTDt0IZICm3+mn/VWO0F4wHyEUYgyFW
         tS5p9lVjm38ydIqLadD9DvhcZUoCFWF1gYHz5yU57U+X+62agv2WaPaIwjL0UNm5CU8g
         btb3O4ym+4IjkP2veb4FKuGLgYm8sGRL++jAumQlnhSl2iZFTxL6msFYRP/PBs9dh6lr
         wK6IZj7DRb6mD8ER3y1UH6GJ8obFJqOStlwCr9MzTn6BpaeVBFmkOf2JzVdQtvm/bEoB
         TSGk8H0s8CQGUDxV5+Yndxwv1L/yyww5StBlvqMtuBzeqH0rhXszAJenzUbkfDcqJm8R
         9tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782731469; x=1783336269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1/vVI7Vg0u7tOLjpfS+RD3dzgmvmflgooRpiBzzZwk=;
        b=DVXFUgMspViSa20Q9XtE0JX1EqiQLCLj2kvS5imwUwJLIPMFhEaXzvHsitKsYC0w7q
         C61YG8jgmI6EhY0rBFp+SIpNieCxPGt36IfzxG/goRlugmRI/dCI73VnCceouEm0BvAC
         oGci0u4bQ/rG2CiNXITZblWmwxQ0IUbskSWNRd/Gpfs9+KgRfLkfmpbzKBFHwMR1GwEH
         xlZt+38HMaEQvgYf4nOs7UKOOSkRMzk+bd05BjjuQLDFdICArXRs3c5TPoRmbbnhiu1y
         9xqwqlqNHFK7NtUnyCj+gLzX001Qp2L9aZD+Tl62OZBiwq8YDxh4QbuOvkSeN1ntuPdw
         s6bQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpdh2XnDEthl7lsk4PWA8WcgMRRA/znMeUyWLWAiokRakPBVcK1OfwZPVj0fnWon8UhadCUKDZO6QA3m03B@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo444pMUB8dNZepIdfshQMYkdJ7E1dq7rxqfsLs1SBg7CmVv6W
	bkgWhdPfcr0YIeAW6IXtUGPJ9D/zfH0ZBS/3jV4wYJ5GyGDa6P3+51k9iOU+8fjqL5sSiUwyq4M
	XHisc/IvHDmY8eLu//pR4kRwm/mgSeotXEcv6MwYw5iM9gwDzHLhIOiZJkUyzPpuCZuid
X-Gm-Gg: AfdE7cm1/MB9WQIWTagWqRk+KtK7CodxQZT85e30cOLgBqNBayIyiHrGJhqKHPbwv4J
	cOfGQetxuUunSIoGIAOAKAz+dPquMATc+gZnW1FYk12KkZKT2xslLkFuWhTYozbySlieGkjGZt3
	jIRPfyded5x1IvdJcRU1yqu7epXWbLE83ZVYe4phttuCZNatY+bVF2B5Lp/WS2yhw68Pxo27W5B
	0Ipcr2FKXIHGXY/Syi3KI4wrkrIRdbG0W4NaJy2cyAV4P//uLrc0CFFKvh4Pw/OW22URKJw2NhU
	WIOO8PBMOIU554lRCRUy+pEvkdsCBIWHqmlCTGAYc1pxaohBu0lX1Ea/lL8d7YwyaMii5Uk50Jo
	f3yRpFXqtI7ggjYYsOc9yGklOpgVLIKQtP7721w==
X-Received: by 2002:a17:902:db04:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2c9c46b131emr62759005ad.34.1782731469367;
        Mon, 29 Jun 2026 04:11:09 -0700 (PDT)
X-Received: by 2002:a17:902:db04:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2c9c46b131emr62758755ad.34.1782731468960;
        Mon, 29 Jun 2026 04:11:08 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9f452ccfasm22477525ad.17.2026.06.29.04.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:11:08 -0700 (PDT)
Message-ID: <11514281-234b-470b-860f-e7c620ca28ec@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:41:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <050d47ac-9089-4a72-be89-d61fa695c00b@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <050d47ac-9089-4a72-be89-d61fa695c00b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DgdKyyZtRuFtk4HAlHl8SSCm3TlUyxhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX32TWcFc+Ab4/
 10EoIgj6hBsfSrI1Gi4/1F9DYmj+nH2/0E3tTgqrTrUPgDkh65qZCilRrUSVwvM3ieL76k5wWvo
 WCLpNUA8rYeQ4qGIPtabybcVC/ZZMx/NaHfQ/Dn2Vbg5Jx3BbkaXcAkgDpiXE/H0XNVVIHmX7tb
 kTa4nAAnO99z+x37SLGuPLJkQbL7Zez/kUcTmeAgXNBTDYFg7oxgFyZmdi8tZGQYtMc630QSCoB
 0QC5M0fwcu+fcQO+i5vNqZwqCYv4MUJLsw2WTH0oiqeUmMBY7SVKn8W1zUPVURW1buhY0/rFiW6
 rChSwvCcSM68dg11X+Y6Z/to0B7qCDAzCAIXrL6y0eS5OAcE1YLTk5PaN/cXObsLSlep719B32o
 1YfbGRzPWhw1wx+m7psBlI+kwrmfZ5plpo6tpwhrPPb97DswXLejkLtH9m6m39UqdN3szULsNJR
 IHTfh8IUDkj8MITjOTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5MSBTYWx0ZWRfX4HcuTHCOLG1r
 JMV2V9BL3w+N483RhhQqBJe+AVd9JTm6ypxsjEde6qsswGLfzJbvZD1Ua0AGZPdWJerEry8iFyi
 jIJC0eAA28uSiXJlL1ayRKQJwj/fmI4=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a4252ce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DhQjvcdHTzzIjdopfFIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: DgdKyyZtRuFtk4HAlHl8SSCm3TlUyxhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114993-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7D676D94B7



On 29-06-2026 03:21 pm, Konrad Dybcio wrote:
> On 6/29/26 8:43 AM, Imran Shaik wrote:
>>
>>
>> On 25-06-2026 02:14 pm, Konrad Dybcio wrote:
>>> On 6/4/26 7:26 AM, Imran Shaik wrote:
>>>> Add support for Display clock controller and GPU clock controller nodes
>>>> on Qualcomm Shikra SoCs.
>>>>
>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +                      "gcc_disp_gpll0_clk_src",
>>>> +                      "gcc_disp_gpll0_div_clk_src",
>>>> +                      "dsi0_phy_pll_out_byteclk",
>>>> +                      "dsi0_phy_pll_out_dsiclk",
>>>> +                      "dsi1_phy_pll_out_byteclk",
>>>> +                      "dsi1_phy_pll_out_dsiclk",
>>>> +                      "sleep_clk";
>>>> +            #clock-cells = <1>;
>>>> +            #reset-cells = <1>;
>>>> +            #power-domain-cells = <1>;
>>>
>>> DISP_CC also needs to source power from somewhere!
>>>
>>
>> The Shikra bindings aligns with the existing Agatti bindings, as it is a re-use. And the Shikra/Agatti DISPCC is on CX rail, and it will be always ON when APPS is active.
> 
> Yes, it will be on, but currently the genpd performance state requests
> (i.e. RPMH states) go to /dev/null because DISP_CC is an orphan
> 

Sure, will check and add the power-domains support as well in the
bindings and update the DT accordingly for Shikra and Agatti both.

Thanks,
Imran

