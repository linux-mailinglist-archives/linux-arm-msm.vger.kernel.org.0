Return-Path: <linux-arm-msm+bounces-114835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SRlsC1IBQmrAyQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:23:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB56D6026
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:23:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nKv15rIA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kQrGs6we;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114835-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114835-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1119301DAD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFB92EA75E;
	Mon, 29 Jun 2026 05:23:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5775C2DC321
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:23:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710597; cv=none; b=gbE6PRBjBIFBat6KfhUaH9P4BH3cP49MupQEY+Livim5TFJazkLhpLzPS/mpqdcIMq/uQiiwJdUOEtOqX667DVvIfbi3y2Hnv6eSSFRs1ZaLaZsTSLHa9B/mE1XzZmyFJeRgrLCgmcbFg/fm5SUWv5MJcHcElSfc3YfI1rNrLuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710597; c=relaxed/simple;
	bh=ZxqfMVDg3FWeOpe+56ZRiDWXBu8hxTAQ+YpZ4xQsA5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKPBCi/XMlJuXebJ9GP1QlE1Vf3V3SgRQvX1q9Rc4aq88tkp/nYq8vI6IeumshmvVB7FuY/Uxo6Egjr0fKK+f5qDI2jNFBJkS3BitBqUK8QwsfbGU/7f8yTZ0zKp7STJBtGwDqk63ZlsevNZ9kSpB2orh9v4qjAqyhAO2ZtO7Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKv15rIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQrGs6we; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NJ0X1787776
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cu36DmfqEkFszFBjI/w/JiRPAOrfBwPdCWBBCaxyZ1A=; b=nKv15rIAd8eiPma+
	Z2C/yaUcZrVUsUBqftISqyK2WzWM/2uOaBt+BwSqrcbnfKik5mu19W3hOg5FG0bP
	WqVhG6pW1gGYsTDGz0FRm7K+hbiI5DF8Y2LoZpEtm5dDFjcKg7wGJJH46BHsDtjT
	wm7ihNakcGvFD2KqzDIj4sgl/iwWEyU8U8nuNmpnwTswGPBLcnexub+YeijjhtyB
	JGC3DTDVHu/Yi3LOYycYmwl7TD2WAvletgksW/qZRgz+0AllpoUDog8pgQ1OHcDK
	tWNDEwOItWXh5iBZ1Fne2QSBKxWKY7pdl+MlmrDkBCyy2VKPz77ghguGVkYd4kgB
	rZiebw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuvn1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:23:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9e994869aso4399705ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710594; x=1783315394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cu36DmfqEkFszFBjI/w/JiRPAOrfBwPdCWBBCaxyZ1A=;
        b=kQrGs6webdMBF/KX34hKylACdYKeXtDl3kw6MnsWWe0JhBa2vqDO09IR57KeIzhoRA
         cyd9qjy76WSGW2ZZ/cR+zW8qHHtOUuoGo1/FHHJQNK/xcqFlegyVf/ghPnxEx3hBWr3u
         emneoohXGf/eq1nkQ4bNQPUQT4xJc+V2aPuaSnXdd06vqsTpPmdLLqVt+G3vRxNzQN6j
         pNESRDTcWKO+b6bkT6oW092kE0nN19EW6NSGl4Pe7u2NLDfA+/OQF4eUYcnGcdtMZQfx
         +k4mjSiZl32zftgXIvNcX2aF4sN6QmeSm99QEfEu6ikegrnnmjf9q/9FaMzPngqtPK6c
         SA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710594; x=1783315394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cu36DmfqEkFszFBjI/w/JiRPAOrfBwPdCWBBCaxyZ1A=;
        b=SFNs80QzF+4LPr99CRB4mXc+0rN8euP9QwXQCUW8oSjIJtu1CaUr4TsozH3yvJcTgY
         NglHedFRl32E9OqjI7kuK1owfqVMajNSVt0LcCCMw8qDPgtHIaHjREYa/q75wcNIJPFg
         uzNPxFX73ABcYsXUjw5bQIO3y/oRl/tTTg8qBqO/E2qgREBFkw0bPNNj8Lxp5Seqrp6a
         cTae+fjQ3EPeGNl71CxS9RLVPa5IpzA/EkrA2F3keyJ+P1IMi6I/AKgE6ag8OLfOmWPS
         I0cCh5zRLyButPgK74ObpwIe55++4avLI1uaYtAuXc3bqN6T2HbPERoYqPRuwC2gxasr
         6J1w==
X-Forwarded-Encrypted: i=1; AHgh+RpfWU3hLk5vYi+D5/FUZt18ZDjRUDSvot7jvjhNXagATS+OaQAKe0iAgODdIZf3DDL9e8e/7F+lTF84x5Eh@vger.kernel.org
X-Gm-Message-State: AOJu0YyMf+i3sFcCfPv3wO+igGTnJY9kAdBHmXGaexRNl1zS0EF1tnDW
	ig0cMpaT9vJBFu9k+rReBlYTFqQHfUBFcejopkdTFgrFayAvyLKrtQdNDiYG4G83tyR3SsVsAuz
	ZMgjVOTmxSaTUQ+Z9fk+Ljuu2ZC0QqcKNOW7CWdrQrsbA35Yp5h06G12ZIG+IxGxRF0LH
X-Gm-Gg: AfdE7cmXhWH+7bzuPFelQoZvw36iI/AuWxJdsItBay8T495mAK1Rfc4RJ4fR+oW2htw
	zdz3dRd8jvZej6ATuify19DSzidbzFNg4YRrozkgm3/3xzSINwT6MEMMjj4hpr27qktJjL+TQ8C
	QGxM+zLgm+TI/HogBgnTVT1u2Ss5EqQLB0GIWmu75+TbyQGpw2j2FIYFq99963aDZtXQ+HxsD30
	tHVYI6zvG+w41lx/LN8YboQ7GSfPBitM0qabYZhvplu/0Lbv3IluTQrkRIpY7U4ruU1qDAHYCRq
	zGH8U44blM5tuebrKlkCXGQyuPVi4vDOmgJMu9eZeRAcl7Ac8rX/qysEtLPop7EhU8qJnS9hq4w
	3DQU35mrC5ppTyyQc3YuK76QF1as+W0FL5s5YiG2hnIE0cCX3vQ==
X-Received: by 2002:a17:903:4b03:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2c9deed0010mr38516645ad.13.1782710594245;
        Sun, 28 Jun 2026 22:23:14 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2c9deed0010mr38516445ad.13.1782710593804;
        Sun, 28 Jun 2026 22:23:13 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9cd6916e3sm29479155ad.40.2026.06.28.22.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:23:13 -0700 (PDT)
Message-ID: <1aa30528-6cec-41cd-9289-a3979c989740@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:53:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] arm64: dts: qcom: shikra: Add gpr node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <7ce8356f-ec09-41e2-a57d-60d20a08e850@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <7ce8356f-ec09-41e2-a57d-60d20a08e850@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX3Xhr/8VhRL8R
 yXEPyiA81nI3AFbKkGNDu3rRws9SjFiiSko+wuPy5yzIBQdCvpBNU++0mq/oqKgYSLQfhb4s3lH
 Y2ZfJBYZandK/8YA7NBsGU6MWH4NWO0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX3SuID3BUOSiQ
 pbUes3BfLzcib6VQTh7WqvFPSgyjDRUZPrA50puuAhnXRY8ec5rVaN0EFmInKWAfNd+BNVYg/uU
 gEOApTmSXe6MoNCYWNmr5eqCo3LcA3eYi3+EC21XUtsg8JhkBkeWFCJ3whVmyXRzut7SVwsB7m9
 YgSmTeYGJlmLLwbULvLfz6eHZFDnRQU7wZO1kG8zHnwnZNpY2WTXkvVeMmRuJdZmRmLjO9K4Qcq
 zjw29lTbd+BNNgTuDenKEgGhhwgJCb45d364FdtfthXHdLG2poER9fWIeTo5L4HPTfDjrMYum2F
 TVgy68Sq1Y8EemWM1cqdOTyrEGiIxwrN1scDQ5L0uJhhvUhdhhNjQ45eSxZepWFq/Ap4N1xyRCY
 vgKJ2piezXdAeHCwW0Vv701OaDZzlpdNK8BjjDBuXPPeqtZJmF7R7lIcVY6wl46doeYOvXjBD1G
 dHPd5v+8wGw5qEaFHMw==
X-Proofpoint-GUID: uAcz-khYCUxackFY-kTRwDlVIcgeMvzU
X-Proofpoint-ORIG-GUID: uAcz-khYCUxackFY-kTRwDlVIcgeMvzU
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a420143 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=KLxTuU9TmGYBU-aeN2AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114835-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mpratyus@qti.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77AB56D6026



On 6/22/2026 7:14 PM, Krzysztof Kozlowski wrote:
> On 16/06/2026 22:13, Mohammad Rafi Shaik wrote:
>> Add GPR(Generic Pack router) node along with
> 
> Missing spaces before (.
> 
>> APM(Audio Process Manager) and PRM(Proxy resource
>> Manager) audio services.
> 
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 

Thanks, I’ll fix the spacing and update the commit message to follow 
Linux coding style and wrapping guidelines.

> 
>> @@ -1851,6 +1854,42 @@ glink-edge {
>>   				mboxes = <&apcs_glb 12>;
>>   				qcom,remote-pid = <1>;
>>   				label = "mpss";
>> +
>> +				gpr: gpr {
>> +					compatible = "qcom,gpr";
>> +					qcom,glink-channels = "modem_apps";
>> +					qcom,domain = <GPR_DOMAIN_ID_MODEM>;
>> +					qcom,intents = <200 20>;
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					q6apm: service@1 {
>> +						compatible = "qcom,q6apm";
>> +						reg = <GPR_APM_MODULE_IID>;
>> +						#sound-dai-cells = <0>;
>> +
>> +						q6apmbedai: bedais {
>> +							compatible = "qcom,q6apm-lpass-dais";
>> +							#sound-dai-cells = <1>;
>> +						};
>> +
>> +						q6apmdai: dais {
>> +							compatible = "qcom,q6apm-dais";
>> +							qcom,vmid = <QCOM_SCM_VMID_LPASS
>> +								     QCOM_SCM_VMID_MSS_MSA>;
> 
> I don't understand what is happening here.
> 

Apologies for the confusion. I will update the commit description in the 
next revision to clearly explain the use of vmid,

> Other patch made a change like:
> 
> -qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
> 
> But even here you do not have it.
> 
> I don't understand what is happening here, but for now it looks that
> this patchset is incorrect and incomplete.
> 

I will also incorporate that change directly into this patchset to avoid 
confusion caused by multiple parallel threads, and ensure everything is 
consistent and complete here.

Thanks & Regards,
Rafi.

>> +						};
>> +					};
>> +
> 
> 
> Best regards,
> Krzysztof


