Return-Path: <linux-arm-msm+bounces-116238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id itg5HRd1R2oWYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:38:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 329BD7002A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:38:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WlqBeQ60;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dM6jI659;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116238-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116238-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59D6D301B5AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3933491C4;
	Fri,  3 Jul 2026 08:38:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1EC33A00C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:38:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067914; cv=none; b=E/wotU3pQhiyTV5rtPlTl8b7UlC9NpyAYy67eG8/NnD6EwqKo+C3JqWQRV7Q8PgsWV+xg5pJcJi0DZjeE07zNfEHZKt641a75SvCQHAAjxKUKxOQqzYRn/DB8aRs4vwZw+y8oR4Ddwkv438klFSrPLR6oTNjkApBZQHZWgKnkE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067914; c=relaxed/simple;
	bh=cdBpJkB4l/ZRo4O9VKG44JGa5I2jAbDW8goIFlmTmp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUY4w362mtbgZcO872CkPd26l/CPQMsc53ojwjNIfAetcExVaUmBEKDSmpBGtNP+Wh+D8wgc5lDWi9A2X38YGLb0eJ1UCLUWc/y6FxcOZwn1TfguFvd8sT0Xfcr5KBqCekWiEKnPn26aXYvDmWvZs/cp+PtHnXJQqKeTsGi/N0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlqBeQ60; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dM6jI659; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rism3147413
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hswMxx9rR2coXNNSZIKHclwuegKHDm4R8y+AVY1VBRs=; b=WlqBeQ60qkIZLhWx
	Kf4n1LSI6Tw0suSiShNTHd8D6b0jay0AG/pBMBgFrS1kQ1LgxiKay+T5CXIFCr6d
	KXz/dMxeHlxCIhPaqYHoH4DRLcjgIyEi07Rslbn0ne32eSoY/rbl1s17FTwyUAzj
	rdsPz48ickOfyZsdL57OwYx06JWoV4teyhunVc/NUHY7RorO9kjHRQ9MnBEj91Fk
	1oxQjDQedUoz0WxfIhTWbCwnvTs7fTnLhZcC3Q8MlOJd/d7GK8TKRO28/44QQ8XG
	EKdLpfHOzWfRFj/ZW3SHEtaEkNX4EqvOAf4RZkbskcb0PxUpCesWqxsgDI6MFsQx
	XznlXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwwa8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:38:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c825562f8bso7137715ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783067911; x=1783672711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hswMxx9rR2coXNNSZIKHclwuegKHDm4R8y+AVY1VBRs=;
        b=dM6jI659XygDcPD9ZihuiG76xg4zPAGD9NmIM9/yB7Nuzn7qKzF7w1duq980gIjqCA
         a8aSf1x3Fx6BftyPJUoPjiUm8XnnqLq65+R9EGax45ABkjUBH4xui3Y8fzFma7hxhOIq
         8yBOkvGQKu/JLn2CHZXG0UFSavc3Ra4KCD8gix4oVF+imLYmMowiGym/I+PwY78mi4JQ
         e09nnPk3SRbufurr/R3PME2Dk5gcRJsuwkaJSIdCqdy399C9hz0rtxJx/pFE8jrqzAts
         EfpMThpCySWX9tz4IG5MNmnRrYZHzkFdvVww0VhYV0gt4lcvVR94VIMMktJmmeFzQsgr
         gz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067911; x=1783672711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hswMxx9rR2coXNNSZIKHclwuegKHDm4R8y+AVY1VBRs=;
        b=Yb14KwLvKDJk9anQnX+KqtIx07IzAkDd7NyfLyNYcYSzI1Yxq0kyCNG8WhgCqThb+6
         sUOrgPDpvtsue8iaCC+DoqIx4STz4RUeOe/Ln62Cjpi/NPEEFMmB0SjzFkkJP5bgCB2s
         5VVQK+16NiCu70AFwMTeYGegPF94wGDfttrbHDtDRneh9C7u1FmuEV/CATkyfDybeZJx
         XPtzyT5O9DO5LQPfbK2Nz5eAo5DUDX5xIvnoP7vBWUhu0zZ8FoaQ6gF0lc08TibAlcAg
         fdi67tMTRwXyOaz45+8tKQla508jpkj8+ReCeY2JIrS3g7qvFQmTfntWCGQMNdPDHzDi
         0wiA==
X-Forwarded-Encrypted: i=1; AHgh+RqJmAc96LsjXsAYnIKHWBjTttpgNOfLd8NC2N5r9En9F08LyvZUpGtJROpUosw5lwbo5QDUPDE2av9/r0na@vger.kernel.org
X-Gm-Message-State: AOJu0YxrSX6J02vHcAiNAZLsepw1F1qq1U2qO6j/bXto8QfHYoITn5hU
	mq5BsJhfzAwg0mQGcFoR0i2tPLDLH7ZAm93ey7MvoeBcgftKBOD3d+j4slkfuem6UDNJA/p2BRr
	yYgXSznZZ96lIBL87q3oPOpWnjhZ3qVIbP6Oh4mXlSmVSgrySyBT0pgx++8H0xay/S7X7
X-Gm-Gg: AfdE7cmWUNBlIp2v5uJJvhf5GOgSPh/mDeUJnd0YcGGY0+7nJQMc0q6K7cBLn1G4RfP
	6LmvmjyTTE+RiZCBSrzYj/L1mutqU451XeRj9dLNTZT1E+sd+olbk5KGc8xcLFBregRvQ1pDQkf
	3ymceMDhFaqVd0dLp9w7lnMQ1HITFQz2py083AYzxX/GnEr1v/NU34IxJb66aD5G6JZLjxUmvzx
	N7yDupTxAS8JRtnzOVuI49kQWNenH8ScifD33M68Yx9fHaBDDLQEXVx4trcPtWcSTJdV8WSR9e8
	R46Rg04Zm27yyOxEGdSmS1mDmL5uxf1jVbjZdKXaZb8rHLkS/ANtIxLQte+WNdlLsbGjJlemMmk
	dal56J7NmSbpmyc7vsSf/rBTvQQLAOCZ0z4sOhdhnoYU=
X-Received: by 2002:a17:902:e54c:b0:2c9:adbb:5862 with SMTP id d9443c01a7336-2ca7e8b686fmr96678965ad.45.1783067911344;
        Fri, 03 Jul 2026 01:38:31 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2c9:adbb:5862 with SMTP id d9443c01a7336-2ca7e8b686fmr96678625ad.45.1783067910779;
        Fri, 03 Jul 2026 01:38:30 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c876ea9sm15875811c88.13.2026.07.03.01.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:38:30 -0700 (PDT)
Message-ID: <e53f9b7d-66f1-4922-ab20-f6e66015c912@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:08:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-5-66173f2f28b3@qti.qualcomm.com>
 <20260703-steadfast-greedy-seagull-ad32ab@quoll>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260703-steadfast-greedy-seagull-ad32ab@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ghjhNI4t4uIYwIqLNNtjEThywlvh3QOo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX+ZFyvvYzWZT6
 s6DUulQpSIPAClTWde1Y6W0+pYpzvLQl0DSuT/h1oGGnS/+7N/5ciYYqtm21WBZgmRfYblPnnKO
 ZH32snEor1AJgUKB0FNmB0o/YBZUbFZS0OG4BxymgJFMEuX+QdzHyMoXZ+okwLRQby7u/vrTGMW
 CMYjAt1GKvt4u4n2NzA0GtYtems3d4x3095QOgg0e6KKQK6wA02kgAHFLfhtbl55O0fLiPibiH0
 a/37UoAXGnS0unfQIZxqWkpceRtGcAud7IBFKiL0E02nt2WOMzkyE5N1V1dG0FSbKDSL1wrPYrJ
 Scj86pqcZHKw9EZpVGr41kdOEpYCQMteLysOHdXTYVyej6mbfI8PAsU/5yHc+nS2z7ftRWEG3Sv
 ViXWhQCU0zRUXdoJq3wGUpgxkY05TmdGMOZUO8f7YVH/q2CWLyN7hGXgQIl7lAOckZRdjPZsQXU
 FW24nZ0DxBi69x5XUZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX4MksZnQWhoda
 aigVayT6B7sjPvA1v1s11tlJT9QM/vcwtKi11PSmTRuzq7747VgqxAwLdwucWI94ysxrIqVHKe5
 eDw+Vphrq8Vfl8rP0TzjSIq7YIqO88E=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a477508 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=B0NKSWsiUjiwxuKyzxsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ghjhNI4t4uIYwIqLNNtjEThywlvh3QOo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116238-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 329BD7002A5

On 03-07-2026 12:24, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2026 at 01:47:15AM +0530, Kuldeep Singh wrote:
>> Upcoming Shikra BAM DMA uses 7 IOMMU entries and not 6, so increase the
>> `iommus` maxItems constraint.
>>
>> Fix below error:
>> dma-controller@1b04000 (qcom,bam-v1.7.4): iommus: [[25, 132, 17], [25,
> 
> There is no dma-controller@1b04000 in DTS. Please drop all the warnings
> which do not exist.

Kindly check patch 6/6, it is introducing bam node with 7iommus which IP
describes and hence, updated bindings before to accustom this which also
helps in avoiding rob's dt-schema bot error.

The same way we add qcom,shikra* compatible before consuming in DT,
isn't this case also similar where bindings are updated as per the DT
changes?
> You cannot add incorrect code, 

Shikra bam actually has 7 iommus and hence, bindings need an update.

-- 
Regards
Kuldeep


