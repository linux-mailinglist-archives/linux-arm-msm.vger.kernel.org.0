Return-Path: <linux-arm-msm+bounces-105886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJxOGMi6+WmNBAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 11:39:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 009FD4C9F09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 11:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 027CD3010600
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 09:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1F1326951;
	Tue,  5 May 2026 09:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1HE7UKB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M62pFy6Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA32131619C
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973956; cv=none; b=ko9Bacvozorr6vjQrYoB4YSSQCWFVeG2MVg4qw3H6Mjm1k/2bN8FdOErelnBzBIZPmvyVE/OuDPGmKg/6t+5ckhH9bYx0PLRcCyfxVBZjqHkXOVblq6j/Ch7e1Wnw3oTNUtM/rb/ECOdQy0t0GQpsQKIDg/aaG9joFMrowW0wLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973956; c=relaxed/simple;
	bh=LeqjFRigh2j2GHwDPaEHtKy8uW50aNngw2zbqIuDoV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=slpw4XeBOPZxfiDk4ASXXG0KK2miDTBF8z3AsHaSPwzHOOokJlzjroBYVy2nXUuSaZSftgT98wMf98FAZReoZjiINkdqYkywVDts71f40f3ghDBVL0J8zo2c5H8cxb/7CeJIEWlTPUsxFSEGYYrxdPTKapUoGJUyOGpHqfsJ5Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1HE7UKB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M62pFy6Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456j1iY331221
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 09:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lF4uTLD8n/SC7NYcalvAHSCgR/P69KvzSZ5o9SVcbbM=; b=f1HE7UKBi7EZPsKl
	pbEIdxyAOaAG7xxl5aNoewV+PzREtwnRTB0hviaAGDzITzG1GADgEQ0XofUyC6Ir
	uP4X2WAdsBBLWnUjfpxixyy4oDyoCxSRuzGjFERMIB2tBHWPTYrkGfiRnoO4fHwW
	2YwQmoliR7ebqHlgXbbki4AQqWYwpq6+RL2htWD/Zo+amv0AZQAqJQHsBcM4awJ7
	kLAjLhljxCbVaNHmz3xmiuosnIpbtd+CnN4EfsKCJ9iXuOF/nrKFSugpg6h9ekc2
	5ZMWi7DSdluE6dOlsMe1dHDn+l0mJafjM68TbV+7U0QfCgXW8OYj8ggPKTkx9uec
	r9r3hw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1bscj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 09:39:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36514eb1194so5495818a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 02:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777973953; x=1778578753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lF4uTLD8n/SC7NYcalvAHSCgR/P69KvzSZ5o9SVcbbM=;
        b=M62pFy6YwuK9vOCcFds9osTmLxx+kamLGp35GroWIvAdCZEJ/jv8XPX+bH0xaHVSd+
         /w9eJSmTNIXWLi+w3LOjD1ezjm6+6EA9hPavG4iGcDWxrhQK64F8bI8mqGtAYIOIzAbk
         OMh7qpD5sgzUI+Ohcay7lv4NOJdipIGQkn/8iR7gRyWg94bquPzd5mxrWuGiKrUQYs97
         /6X81B5SmlqWEOq11wZbQht8M5fQJ8g8AziBN8D2cYQojv9XTQmdLd7/QkuQq3Mf/yww
         x3uCHrepoQuwWVgsz22sSwaRmQhg1i/djiIxwVnsq8vTVLVlUfK/DeU9XVxNDzTBYf7Y
         LO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777973953; x=1778578753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lF4uTLD8n/SC7NYcalvAHSCgR/P69KvzSZ5o9SVcbbM=;
        b=XIsGw4ucSiNyN91Kdbt2rq4YyKHeKjJHMkKeiczh8inbAADFDMTMnVkaRpCaBLeUR0
         1nWnChzrUJV4amybpzE3yhixBZ7PqGlPEHc7dO126Zu8DJnucI7tfikNgoHuaxMRmXjh
         5EB8Uaxq/HIPsYYPSoqHttQUyySQ4Ou4XQlY2VViT3Azulc5ohjfwzDozwo4p12ZqVBU
         L5f2RoeFGV2Zh+8mTp3b1H9FymNBxjPDjW/Dirm29ykkzBXCRNgYbs3+8T+kyD5GZOn8
         dj7I4Xs06dsGXHVfD1YHkn9KDXJkqSJbHVjU6q4FlC6zCa8MsGqCIuDqoXcKUlLM16+K
         KojQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lB1iuHN3grW7/GmRlomR2dlWC9YCC+ov1BcoucYOBP6XFQ3HInGLIYlq8jZz+pP1wVQLnHpL+LoMvCGNM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9yk7sHGXMNgQR3OZUXOLQUBgjRitcZz7qP2WW6QN6Yn1WG9ZD
	dOe3dJ4hBx/iJwwTjS/hWfIRuuGaxPorw9Mlak4Q+bhr/9Rfu/ptlTTRNTZIX6lpikmIByQPY2Q
	T5dbUl4FEaPoORPDcNHbqN2yVlC1+EIvJ4eKp1Szja2FW62dvJMiddQ56MWvr0/7qEmI7
X-Gm-Gg: AeBDiesh5wwUR7MYIyFlHf60O8pXzRGRdPFFCP2mS7BU931/yySo+VUnXtZvDOYuQoP
	utG3avXSkHj0lP4QoGH13ztYYcl4oWPN5/Ct6Stnx1kqigOgh9rn9K+wAfGr1KH/BwFz98X3zt5
	s0CGZTzGEVkwCrt332Nu+GMkq2HOl5E2UXFS9A+i6pM/sZF3+KOo7ptrlawoLejei1opryO0VBq
	itSuq5Wk/qe1WJ7vKEJJ40a1rXRP9jKgeTgcQhUhD023wgyvJDR/Z8OLnS+xgv/6Zi8qDmhtNFy
	Ma2JQOXnPx2ikajTEJNPBqmznWuCASZ28p/aNNzTyStvvnFhQBrrGhOP7xVMjlUy3LE05e93+i1
	FwSOhpRUc5M724zGmonJBBXO7EeT1ZVuVBIb996LjTrgo6pG92PrzX/GcQEH68Hg=
X-Received: by 2002:a17:90b:4cc2:b0:35a:1762:92fc with SMTP id 98e67ed59e1d1-3650cefe95bmr13046948a91.26.1777973953564;
        Tue, 05 May 2026 02:39:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc2:b0:35a:1762:92fc with SMTP id 98e67ed59e1d1-3650cefe95bmr13046918a91.26.1777973953118;
        Tue, 05 May 2026 02:39:13 -0700 (PDT)
Received: from [10.92.176.206] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36528ad3154sm8656896a91.2.2026.05.05.02.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 02:39:12 -0700 (PDT)
Message-ID: <c07fd488-a455-413f-b25f-9f9f1afda097@oss.qualcomm.com>
Date: Tue, 5 May 2026 15:09:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
 <20260430054422.2461150-2-priyansh.jain@oss.qualcomm.com>
 <bfecf67e-faf2-4889-b29a-2d4d5cd0d1a6@oss.qualcomm.com>
 <e473e26b-f4bc-4044-a893-c0f255de6cb8@oss.qualcomm.com>
 <0d95cd5b-01a8-44b6-bd4c-a7e5fa81e181@oss.qualcomm.com>
 <1dd4746c-e93b-479f-8aed-ea9a21a03316@oss.qualcomm.com>
 <b4972eaa-cfea-4fed-990d-2cd34177d045@oss.qualcomm.com>
Content-Language: en-US
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
In-Reply-To: <b4972eaa-cfea-4fed-990d-2cd34177d045@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: quL07e83NbBKXmjhZAydUK0dka8c5EUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4OSBTYWx0ZWRfXxheGNIkzIj4h
 G3qgcoJzQCZqsfaxg6hJCL1wyk4hik5OpSTx+RyNZZ1b8/fXA3KvxisL+X9dsViCzv9jIr0O218
 aPHTRo9iDyZV+FFyYhnFWiQfZ2kaXRvHzMxKS7S6gkFYh1/Q9JhbP5Suww4c9kfVWTwqZ0XTEwc
 U9XUQd/AEXsPSk4lajFm47Ws3tw8VSJ8JNLLy3/0bDuh1R1TmubO1GP9Yi5xY47J1TbgwAv4ij1
 d1Yq1U3+ofmIC2xr4dKiYLigEd/InYW55c2QCjRHuflAQbSviOxyyFsFCCSgOmqwlUjI0GXrhVS
 8xT/jvNU4gyr8zomIOWO26CtT49YT3FNrYs1ADAsTmkmabBNgqAHUjyFetp5M8V1ZIzl+2p1fSN
 n/XC3JJsRb8dQ9W3quT/XcXeW6ceAV1bvLpr3YMnOXgBs2ypXSADYwF1xMcGqzj/ajTvTrmiMDf
 fE26jJdfwzWgeKy1p5Q==
X-Proofpoint-GUID: quL07e83NbBKXmjhZAydUK0dka8c5EUF
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f9bac2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c_rVVchIZH2FoSNRXpoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050089
X-Rspamd-Queue-Id: 009FD4C9F09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-105886-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[priyansh.jain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]



On 05-05-2026 03:05 pm, Daniel Lezcano wrote:
> On 5/5/26 10:48, Priyansh Jain wrote:
> 
> [ ... ]
> 
>>>>>
>>>>> int prev = INTMAX;
>>>>>
>>>>> /*
>>>>>   * An explanation ...
>>>>>   */
>>>>>
>>>>> for (i = 0; i < max_retry; i++) {
>>>>>
>>>>>      int value, valid;
>>>>>
>>>>>      ret = regmap_field_read(priv->rf[field], &status);
>>>>>      if (ret)
>>>>>          return ret;
>>>>>
>>>>>      value = FIELD_GET(priv->feat->last_temp_mask, status);
>>>>>
>>>>>      valid = FIELD_GET(priv->feat->valid_bit, status)
>>>>>      if (valid)
>>>>>          return value;
>>>>>
>>>>>      if (value == prev)
>>>>>          return value;
>>>>>
>>>>>      prev = value;
>>>>> }
>>>>>
>>>>> return -EAGAIN;
>>>>>
>>>>> (Not tested)
>>>> This approach has some misalignment with the HW recommendations.
>>>> As per the HW guidelines, 3 back‑to‑back reads must be performed 
>>>> until a valid read is observed.
>>>> b or c should be returned only if none of the three reads(a,b,c) 
>>>> report the valid bit not set.
>>>
>>> Right I missed the point the HW recommendations is to read 3 times in 
>>> any case. Maybe replace if (value == prev) continue; ?
>>>
>> We need to store all three readings because, if all of them are 
>> invalid, we must compare the first, second, and third reads using the 
>> following logic:
>>
>> if a == b, return b
>> else if b == c, return c
>> else return -EAGAIN
>>
>> Given this requirement, comparing (value == prev) inside the read loop 
>> would not be correct, as it does not preserve all three samples for 
>> the final comparison.
> 
> I tried the different combinations and comparing inside the loop should 
> work. But the optimization introduces an implicit inference not helping 
> for the clarity of the code and probably prone to errors in case of 
> changes. So probably simpler to keep your approach. Please add a comment 
> above the if a == b return b else ...
> 
> Thanks

Thanks , will go ahead with my approach and will add a comment before 
comparison code .

Thanks,
Priyansh

> 
>    -- Daniel


