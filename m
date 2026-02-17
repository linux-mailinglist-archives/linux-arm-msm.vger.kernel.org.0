Return-Path: <linux-arm-msm+bounces-93049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNc/IRAOlGn4/QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:43:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9748D1490CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC2D230028DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 06:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E57E2C0299;
	Tue, 17 Feb 2026 06:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmSmABQl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3yJL3b7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB5B2BE02C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771310603; cv=none; b=B0Tb6hW/rpDre2rp2Q+JN5Qg2BZQssgzOOVxPz97nsTWCoHePmhmzwg5IfjAS5rKHArZud4WVCmi6Db9GPp1pIFgCJknzzBDMHKa4oa1GUAyqN5qsO+pOMkO3Miq9oeqyuxPMCagRX9OYPIZfe7EpTTKpWuZVScEp5AzoCDB6ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771310603; c=relaxed/simple;
	bh=N2FhpvHPlWjKFIPAP1HDBoGC7hUdQXI86alOPp1ZYII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCAZ7E0D4Pf0G53bs3BPtHjrNFz4u839zbPlfFoiHaJORQI4RE/LgKKU+SrIdPODXBFbzFej0/8/D6eGJcQHzAt2dDkYbMmILiJ1g2GOSb6olkBWfLwS/7BgtWrU+bos9X5LJrPQmR6bvU510adW/+JGLtvNUSEHfFrovI3ZGu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmSmABQl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3yJL3b7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GNGrHC945797
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 06:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2FhpvHPlWjKFIPAP1HDBoGC7hUdQXI86alOPp1ZYII=; b=YmSmABQloj+SiV2m
	+BXkkrmElvGI6J0ASwHxVek5dYe9fX6ipOCJVyOb22DqD0f6rbOV0ZXXQ7AAS0g+
	PCqYNJyy6Grt5GVQazsKHHNvaiRo9QuwdCf3jrIJDkGyPHlsgsWIw1aNemR4jyvu
	n/wI2+3ceJnlcS3CCX9PUplYHle0eVqTDinFDJQi2HgnHOuNm8Z/2/nlxEd/1dX/
	99cW9TjDJA6hx4Vc6dmYrpc7kYxaQJGlCD6R4Z025yUwIIiLTP2a5K/6HVVjzSAB
	5NHovkDJKicH3OLY/MPrbtLZenO4MogIUl2qglSF0L5S8BaprjJ2fgJl7eksWxMF
	bo76pg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca360wr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 06:43:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354bcfea0e0so2395371a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 22:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771310601; x=1771915401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2FhpvHPlWjKFIPAP1HDBoGC7hUdQXI86alOPp1ZYII=;
        b=M3yJL3b7gv/Wlr0Vf9ssTV2sIYZBcFuap4GqJd2D69b8PkLAG/7nSv1FhGKF7ViaaC
         gZyyjzDxjMwPextB5/j8SJDjCFa09Gn49WwhjsrRiGrqFvIagWZAhm/vXcgtN/458ncT
         aEYV6wU4qgVkMFQ7AgBt63/dcQ7bFoUcAOOOraalV7pSgSX389s0e+74Ani83kXRew9D
         Wz6rRfQUldlRFxqTD1rR2TLeD+iJNQO21qJaVjYsuPjy0ShjOqgpMmLCbX7poq9TAyxm
         yRk106TUD/naiHUr6kZDcWWPJxnVq6tNcUjIupuurlpTuzuWgAknQl3PpE4pym28yGki
         WA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771310601; x=1771915401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2FhpvHPlWjKFIPAP1HDBoGC7hUdQXI86alOPp1ZYII=;
        b=CaAXxhK0mJz15hMHHaxqL/BB7d4yL5nxtDChuO1GdYrgdn7UHqPbhd6yusy2RnYR0C
         TVJyWG9tqnrUtp0okfrLPjowgBQJ9H3o0Yjt2Hvy3LOZn2NxE4GIgHEU4uBCzCZPiWrz
         p457tFWl2nou5m2aKigJFkw4bB3okshZP0vPIaZ/aloNnZ1xFTcbq1lKg5g0EUTZFPCz
         GZEuFtuk8sKmhZqiLa7siLZo8mSSC0LeYwgrcTQYojySsom9S/tmVjOGutb/gh6S48hh
         HcMN5+nVYx21Hrm2fqcdxllX5lC85B0U0k4ccJE0ayWoOez1t2vXHvZDjyspkxxBz5ll
         IVpg==
X-Gm-Message-State: AOJu0Yy9qZNFjG36DdAedX7JXNYqx61XDPT0Bf0+7Jp5K20r01z0TJCk
	XTA3LMRNKNYhWgoDAxab+xTY/Q5XgF7RocxFW7320xUsZSNt5+BN3h1hez91MjfT95KYz3c8PTr
	hCwk69paY2KGg649NiUjqYFwfAiggcNFt6PcN9OH1KdvSke3fGKl69yIFGeV6rlIBczBz
X-Gm-Gg: AZuq6aJvohZWfl4srB9cPcHrKBDCigywMGo16GUz4/1nNB4KVJM2BoghbDPUx1mMb9N
	0Mn5IXfbjh4nOP9ifhYNm1tAt/hWk1SYi9bKqis13RTflJpc7J4PmrPOM4jQS7SXmykcXLeUaqj
	+NO0ZTiLfFdNd9CJD5HJ1GKRPxLkP7p6r1sjF+C0Os9hVzeWeud3urrPVeNc5PaHIAUZPbt+4pI
	d7u4od/QxBoGwF4ABGdGjom/TgBQBtSP0VrEuPQAcd0mkFkSz9QVihTMZhMErWkfJGyM42XmZqC
	IOgPl+Sz2Y8+/Hue/zefZxBaI+rBElE7LGsAWhsBrx72/aCrHYSCrqdAD2vqB6eDhdklYcMYeTp
	T7QJl1Okx943XuU0loy5uoacJeLDTyGrKaM2UGUkPXbj2DyhvDQ==
X-Received: by 2002:a17:90b:2cc5:b0:356:1f2b:7e9b with SMTP id 98e67ed59e1d1-356a6e38413mr9133043a91.0.1771310600661;
        Mon, 16 Feb 2026 22:43:20 -0800 (PST)
X-Received: by 2002:a17:90b:2cc5:b0:356:1f2b:7e9b with SMTP id 98e67ed59e1d1-356a6e38413mr9133024a91.0.1771310600177;
        Mon, 16 Feb 2026 22:43:20 -0800 (PST)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f8cc57sm22053476a91.13.2026.02.16.22.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 22:43:19 -0800 (PST)
Message-ID: <88ba2bd9-e7d2-4a7e-b48d-1eb4d3d40aee@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 12:13:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
 <957d7896-cd01-4864-bf07-e6dbdfff1273@oss.qualcomm.com>
 <2d688258-2e2a-4a86-aa98-eca31627d418@oss.qualcomm.com>
 <af15dfbc-806e-4731-a7a3-6832a781154e@oss.qualcomm.com>
 <be4fc7dd-e7c4-4f2e-ab5c-543d8fedf7d6@oss.qualcomm.com>
 <eec690df-5ab6-42b4-a9f1-ea8588f21713@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <eec690df-5ab6-42b4-a9f1-ea8588f21713@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA1NCBTYWx0ZWRfX4zTDtGfR0pjx
 7oDp7lwn3KEWsamlLzbdi//1VOxNPsVhkEUHCe2Yo4PSfWEGedLxfuAL8U0RUUlqzzSDHYtAg2J
 3fYPyEkRDBq46aCRz3Xb3UHZDQlyUPobmtheYND1m4sjI7b1bfayU9IaEXCUPUZm4rHjA4vG8ls
 x96hbpCudhZEP8bUUI1kebpXBaQeNF7RUZ4fnPKS6fDDBuPDkRt71aoiRcvlB/x79aVgXFP03YQ
 arAryy3UBvqyxZ6yQCYuIJf3BRIPoZNzJL6YrE2Ycf2f+04B2dOxS6HTIDWUOjQNOLaI1V7T45Z
 fujaUyZfzrpSS5jwp6Spse1vQRyGTrhVGAyiGQKHmQbdnAdSsNP7oAIhiyYz0KM03jj+2c47rnL
 4nN0eKS04GMPtfM8BFdRAprWYSSBWoC8QdLVyeD72jyUOv5DuWTH6Dkc/OjoPupXM9TsRNWSW3f
 UkzWdyR4xhy7LPpFGwQ==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=69940e09 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=QtLaxJc4UxdN8FgP6j4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 8ZQ7_9iQwklmdFpqU96I8Tc_guTDokwO
X-Proofpoint-ORIG-GUID: 8ZQ7_9iQwklmdFpqU96I8Tc_guTDokwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93049-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9748D1490CD
X-Rspamd-Action: no action


On 2/16/2026 4:44 PM, Konrad Dybcio wrote:
> On 2/16/26 9:04 AM, Umang Chheda wrote:
>> On 2/12/2026 9:59 PM, Konrad Dybcio wrote:
>>> On 2/12/26 4:50 PM, Umang Chheda wrote:
>>>> Hi Konrad,
>>>>
>>>> On 2/12/2026 7:10 PM, Konrad Dybcio wrote:
>>>>> On 2/10/26 11:38 AM, Umang Chheda wrote:
>>>>>> The Mezzanine is an hardware expansion add-on board designed
>>>>> There's normally multiple mezzanine boards (e.g. a "vision mezzanine"),
>>>>> is there a better name for it?
>>>> Does, Interface Plus (IFP) Mezz sounds good ?
>>> I don't know, does it stay Interface Plus on the silkscreen or similar?
>>
>> I checked the board - there is nothing written on the silkscreen. Internally we call this board Interface Plus (IFP) mezz.
> Let's keep using that name then please


Ack, Should I also rename the DTSO filename to "monaco-evk-ifp-mezz.dtso" ? 

>
> Konrad


Thanks,
Umang


