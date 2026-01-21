Return-Path: <linux-arm-msm+bounces-89944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHoGC19tcGkVXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 07:08:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A204F51E25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 07:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 39BC8708066
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 06:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98226439004;
	Wed, 21 Jan 2026 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdFaT3hQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yp3OADXs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE91E43900A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768975601; cv=none; b=rC9lSjQNEXd5CU/3Zn6xEGZM8C8i2jacce8lsaWPb3pjerK8hH19/ijOUrC4WUDJVj9hfiklrj0nUFyuspygunFVd7y6vr1/w7DKK+Mc+ZW8wv4Z4ASHby+g3LPsBA6XXzZAWPmXztDwbnEOCvXz/RYSTeTtRFUGacjlDMb7sf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768975601; c=relaxed/simple;
	bh=3dZHRYh4aY8ks8fbc+SukFYFR3LlN2B+5jjPJ3ztFas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYixIsOnpQjkXzVQnQ7fSscu+KncqLbXPjh/wWCHkPrUwk5eGz/ULS4Hs0tRHi/yovEpHW+MP0hIYutHjYqGPKIN0dVSWAnSc3GrZHUDoIrj70Kzs+ubnIIDQPhzwl1nx5i4tbn53QiAJX7HE8nOZzYzH1ms8dSkfK0RAt8dlHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdFaT3hQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yp3OADXs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L5q8gg384402
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UB1AQjjXDgc1rZeP5NkBvlubS9Wr3DsEc4cq9aLaUHo=; b=kdFaT3hQlzkCOR7l
	nuTYV86IbpS87rC/wo1oZD48FQzITSPfciomAdq2MWKMpo1DQ4ETjOHKEmkItKNU
	Ad3V6tUiJag0kWeEDdo3LFzlJHIAiz1v8++xi0ayDMJUDXvPDteVqgKZudyOTPqv
	/in4YyItPTLG9palMCbxrjyRjIbp/vnxCwcNAnQc1hBvPCpd+/UksfcJLAUitkAa
	Zzb+bqXH/48pJwEExwqULbF2jamFNDsdSXkwQ860EtiI8nkqQi3vEW4Ky6jC56DS
	hsT4tS3E0lwNjmHlUie7xwvWON1nqj2btk8kNbWJAR8Kz7gEgBo2AhfcRV/6AZH/
	t7W/Hg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta7qb9tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:06:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352e1a8603bso1121730a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768975598; x=1769580398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UB1AQjjXDgc1rZeP5NkBvlubS9Wr3DsEc4cq9aLaUHo=;
        b=Yp3OADXsOeR7/UwcXfVo0hXydNy2c/R0tB4j5iNPgTKOdJE6vG0GgEg1r7T9V1GF4R
         kBPI8VJCCWxeshsd36uni7fxzK5Qt46FoGjnymrP9N/I9+z0TK9zLibFvWmMbUY74PJo
         Fn0CDG0kshheWqEYn1FMlRYchHzpa7KG3lMaQNZeSAVf4lcmGJ16iVcxyxbYVmSZ3Ngp
         U2cpvGihGoDSD6H9wC+o+M2DHXnxyAbCXx9rbbU21/FqpzZ5LCb0WxZcnzlfzjsH1CzA
         XTL9AyfY4MdrBzUiOFHyPVC89Cd7XReQQRhzLcsgHls80PCpasefC89tu7oafbiQ3NeO
         HtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768975598; x=1769580398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UB1AQjjXDgc1rZeP5NkBvlubS9Wr3DsEc4cq9aLaUHo=;
        b=T2AUPBLI8Orr0d5Q5NnrICY6qKRynKAehrrfcyLjMeb1MWZTES8mOsiToJp5aoymw3
         BXqTyF1Lwe7AYbPwi5ERQuAgFatee7VwM1EmAGJlKJf2Jg0cZhf5k8COIOFJZ7okc+Md
         9Nl6ggGwd35Jb/7qMYxe+z0ttnk1mnIUkiXQPOvoaYDBLjts4GS6xGSMlFjy6DzOe0ZH
         5VBbL4sV7ftg7RBTKYHwOmrBzs9XMzFgrq8hL9PuRwz5xUOPS22p6M7BYDylturf2Whh
         g7pJ7YTK9flofzZq/0hR+EKKBnOEDtAnpTDmYSo/JoR8Z7lsTS866KDZFZkvcAKhHSML
         K4mA==
X-Gm-Message-State: AOJu0Yws5mxrHkfYZ+f4nUPUrBQwtI+AwLr90Qxa96YlDSlKoq7Usiaw
	R8b/LoI6f4q9SN4Nplej3clp1SHvITTbOw/3DqiAi/tcIR2a4/TusAhjK4gK9g9eKgyASJ11Izb
	OpRe/KS0maXnd9M8FPR+Efz0mW9kyig27hnuqil+FSwE6TtkCN5+ePbPGrVMo2gBm7Dby
X-Gm-Gg: AZuq6aJn/ByYFmnPjred5nsqdkjWmnZEuJ6yMLvGrHAQbea5snA0bpeKJbil7NeudTK
	j68IbGb2ZObmFeQetPeEGRFZjMffQl9p+ptsWU6GZ9Emmqzw4ndUjfP/nu4sSbvGKyNEHfVlc1+
	/257ahpbgkDduJkrInUhv/NIqQfM388Ezy+XL3TkB2CnKJrf+qUtbX4VYkjhzJB6+SkJt9xHbE7
	FBLBXgAp1U0bRQ7raosf6jzNu2pR3T7Q4FcjsG6n1optYwUkWxCMANy3wzA14h9mnOZ3gq+h1KO
	Tv3T0Ds3fgJApVP6X3gH7lt5kfWYXTXWHlQPZZAr85rcLa7Kr2AQY7OjKoPq9E996js6jYrmGK0
	deaxaIbSkLTW0iamFk11TmS5XNyiKaO682fbGB0c=
X-Received: by 2002:a17:90b:3d8d:b0:343:e2ba:e8be with SMTP id 98e67ed59e1d1-3527316560bmr12830555a91.10.1768975598442;
        Tue, 20 Jan 2026 22:06:38 -0800 (PST)
X-Received: by 2002:a17:90b:3d8d:b0:343:e2ba:e8be with SMTP id 98e67ed59e1d1-3527316560bmr12830529a91.10.1768975597968;
        Tue, 20 Jan 2026 22:06:37 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352678c6dbesm16408700a91.16.2026.01.20.22.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 22:06:37 -0800 (PST)
Message-ID: <b393f218-df47-4119-88df-9b3ce23180ae@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 11:36:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: qcom,spmi-pmic: Document
 PMICs present on Kaanapali
To: Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <20251215-knp-pmic-mfd-v2-1-1e91138c6fc6@oss.qualcomm.com>
 <176789374037.1117798.14242637055422802029.b4-ty@kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <176789374037.1117798.14242637055422802029.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kn0lEn0y8GAmHoT1szN2pOQM9W_nfcq9
X-Proofpoint-ORIG-GUID: kn0lEn0y8GAmHoT1szN2pOQM9W_nfcq9
X-Authority-Analysis: v=2.4 cv=LPBrgZW9 c=1 sm=1 tr=0 ts=69706cef cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Tpv23YVzy6Rq9URdn3wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA0OSBTYWx0ZWRfXyPZh++DSFYJ4
 8ZCF+jimlK/y93+8/TohFufJjc8rxLMkRNIsF73g8mQhCNt5ZAnMlsUo1mb9CEyLFleRSs1u1az
 oWM6Hr6qlhdcuNqkZ22vcwyVX9dqy10BnANATGW7Vzjw4iLIB/K1WR7YN21l7HpE8UTZx3GRxsT
 7auWNQR/yVfpI66VjOg8Z2rWAzLwHpVYUQfWyB0xqFz/LFcpzx1MsR/rVIUTGZLBi+9FcIX5lli
 +/Uk720fO7u6cX6p3M9gnaytTYErsPyJwdOiwy8tgwIbLePf4bwOvaJVWytwWSE1PZ+Xr3zDL4o
 3+yIp5G2r8d46SKsSyJILTS2yjrgXznsh6lTSAi4Qw13QPD0RfyGGiwT7wE6+35tmUq+5X8YSL0
 Mdv292EDKjyoxH3b9ugZ6yB7F1dCR3rMnyG1TOqa43pCCsC9dlP52zYyhf8Xci3o/rFFGAZg7KT
 3nHNpt4mYmpFekc+qZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210049
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-89944-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A204F51E25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lee,

On 1/8/2026 11:05 PM, Lee Jones wrote:
> On Mon, 15 Dec 2025 16:39:35 +0530, Jishnu Prakash wrote:
>> Document compatibles for the pmh0101, pmh0104, pmh0110 and pmk8850
>> SPMI PMICs.
>>
>>
> 
> Applied, thanks!
> 
> [1/1] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs present on Kaanapali
>       commit: 2a84a41a8c2d3cbc2460d2bc60569a35c4157e76
> 

I had pushed a V3 version of this patch earlier and Krzysztof
had acked it the day before you applied this V2 version:

https://lore.kernel.org/all/7c56b471-5fab-4cad-bf48-4da261d5bd9f@kernel.org/

Is it possible for you to drop the V2 patch and pick the V3 patch instead,
or do you prefer me to send the delta between the versions as a separate
patch ?

Thanks,
Jishnu

> --
> Lee Jones [李琼斯]
> 


