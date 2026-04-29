Return-Path: <linux-arm-msm+bounces-105247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIoqE48l8mnKoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:36:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C67E49710C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A76230553AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E25433F8A1;
	Wed, 29 Apr 2026 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uos2pxMS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1wgZhnb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0104D371CE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476651; cv=none; b=UIibho/fCIkOz/sF3gMDWOzIZjicP1vxXyUV3+bOx2uC8jCrAl1KCCRnTWzRT0duzi3Tk95UwPdAbk+V6IO/43Z3ZdNW34jQZiC0gXfWcybEH7zT9+sVF4HPt1n4vN0lfLgUBMaLVKcD5TsFumlGO++Vs2uXN5KwMtOKdix/tOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476651; c=relaxed/simple;
	bh=R3srIBKAbTbKGzUr15oWFYlOxY+vh72VFa6GtQ0vnO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQdeDXbZpJHkTdgi2KEru/DCxm0dALNaOrEaTCP8mGj3PsPmLX3d3qOaj98Vb+l6BCaFFmOF32abjc+yGMEGHrdINoClDWCk6LuylhIiIaTO7CmL6GuPhuwy1OGNBVRSm8CtVWj2m937rnqBn2MFvqRo64J4lfTX7Uih7nD/YcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uos2pxMS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1wgZhnb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TEte8D3752354
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHRrET32SHTb1DTgOtLIV+Q9B0HVXrLCoeH+mBoYE9w=; b=Uos2pxMSCeW96Zky
	zgv/apY3jYlg6UrZiRUBEevWJVC58Hv4opNzuRyjrNlcF12jjWIv4eHNrIu3KQht
	qnyCycnPFlQZ3vMU6PRDp/k+xo5WJYufy/sjgL2IieO0ApRV9eQvR59gdc2aw9jS
	ZKsXt3Ydfztlw3w2JzYHWf7C/igXhIMDGAAlvSe++Nm6FiH4LS0jN356PhftB6lY
	LqlTg2QFJZDnLMW2QwDbrlmkE2hXEA1dAMRk9b0qIratuusVIsxq6yLr6i5QeUeJ
	qIfbMWe73Ar1sPjwDeIoE6vFwiWPZqM23XisHwWpA9uDqgTpW5NxLCcCBlidLHs0
	xsD5Dw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1j6pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:30:48 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-956995b87e6so11715440241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777476648; x=1778081448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uHRrET32SHTb1DTgOtLIV+Q9B0HVXrLCoeH+mBoYE9w=;
        b=h1wgZhnbwRH5DiecCD7Fdv+ZTykjV6+1NQs+jSL46i3YC5y6erALjtYs4Ge2GzpzsX
         emEiI7fK4sr5xTYnt1BA1zTd1p4VfHYN/Xi5qBonCw0rz4BLbKgrYUo02x7UAuEimXMn
         DEomSYRWokk15ioLN+ocRC17FwrB4Cpgw/5sAeGsEHigojDYOfN1PgHCJ9oNddacLS2X
         4EZh9kafky8tY0LaU/j63a8evFQicvrGVG+VqMQqJl2XlfW4UHRXKdncW1//xZIgY6SE
         93biV/0cW+jFTG5Jg4kzzRlb8SqogVXN223goHk2SyoTJSnrgvoO4qo7CTc/y6jVuLAr
         fbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476648; x=1778081448;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHRrET32SHTb1DTgOtLIV+Q9B0HVXrLCoeH+mBoYE9w=;
        b=X1h16uqNtVHGzSRMy50QOgDDkr65H/tuHgxNq+fUp5zT9vmwiRIzwYMkOnW48ZUmi9
         ppBLpFu8o8emNgPOT9yzDmdRodXVOBcs0dHzb2NsfKNpaO592Nds7eibEZXbwYzfFOqj
         Gl1FKrO5OBUC8jqmHDbnVEw1DbxVaysA85xjVzZv0J8nIpUFrukx9EpxVI06+t1+QfDi
         nCzVNq4vMJVljyJQo3FBbqMjpE5V8a4DnxO19PNJ1V7GLxzle/mFzLj/7iATRdIGGSse
         WS/khC6ohlKZAkTb7siLTRuDWFWnN7FC9qMx+mnXGfjQnepvaj4Q9wBBjmkrCJeu6N4j
         lEoA==
X-Gm-Message-State: AOJu0YwvYKs0W7kzlbVu+KVdD6rvhtYhyY5XZJTAPMhfda3TXbCEPK0y
	3DTBsrtuI0JuSwOTutgc//2kYpbcv+er263G1FUvhUhH+J4Djspx63xAOHGkULwOhVYE1mam0w5
	6sqlglh3pX3qLsRIBWcPMgPWXZvu7wYtXM0pQHcJjaxWIHa1jgZ2QBw/cEbf6d5AqAp3J
X-Gm-Gg: AeBDiesksqPdOOY5wOvxxSTAzQpor4yuvJF3VqyQFfhXZgNxO6zS+a9tRFg9cSGIlQd
	P44ZQ5Rj0Kcvp0IoBXN02lLkpKuWICdvtTk0TFAA9Npct5SNw3TRlrokqUCOtVyI5nlV/dSRbLv
	CCTSPuWRodyAO/Ef989q1mnjbvQUvY3IEgnDUekI2ZrMnd66af7QYxWBLWuVSzPjkHg3IK9hIX8
	kGK5QFNU0CQisUe57smdv0DcbdmWYuJqDJIFlVXO6oCv4GzI4poC553D04muD8DogJR+AFDOsR3
	EzNvwB2cz44mM3cxTPrP4mT4z+ywYpKtGer2yhfCh9Xld72kBUboN+hTJRnqAk4v2pGX6C2+LaS
	TeUcai6Z98CMvq/h38A5ZXqoVbb4o6gpedn22odenKQhU4BcJMiRiXZa5A5A=
X-Received: by 2002:a05:6102:c46:b0:604:f155:9374 with SMTP id ada2fe7eead31-6280a3af2cdmr4424592137.15.1777476648182;
        Wed, 29 Apr 2026 08:30:48 -0700 (PDT)
X-Received: by 2002:a05:6102:c46:b0:604:f155:9374 with SMTP id ada2fe7eead31-6280a3af2cdmr4424531137.15.1777476647584;
        Wed, 29 Apr 2026 08:30:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca6451sm6738173f8f.36.2026.04.29.08.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:30:46 -0700 (PDT)
Message-ID: <daaf1ad5-5ba7-4978-9758-18caf829def7@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:30:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soc: qcom: Hide all drivers behind selectable menu
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-1-69ba540b3fe9@oss.qualcomm.com>
 <82602963-6caa-428a-9b39-e0cfd42ae87f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <82602963-6caa-428a-9b39-e0cfd42ae87f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f22428 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=oqn4fRuYruEmQnGXFDUA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NiBTYWx0ZWRfX0NkFdycCiIXd
 NLUdjb/v1isjdR/W88qKSts2/d32gq82ae+vrrDeNsvtLDYY2rRdMRs4si1RNEw9m/bMbqMrVhH
 Gq5XFGwhA/LnT9uKUJwPvUs2Up0X6Efqq0vk1wPN3EsTr33RwEBXDGyQXnrQyaFw5sMkDTlMTsa
 iWPrttHPshCHbUsoQRQa7lJ4PIIwEfuSG2zEXF6jnwtrF7ngAoKL4HREicMxaMoRJ0R1kCSg3jJ
 sh/Z2CgF0xaDaoGGwYbVpo43WqCdgJjAFpipkFXkF6O4ZK1Uviuqr/m9HX7boLjz4X+j9QjYD8b
 +AlwRwrcNCgyG/7g/aCebxpc1T0WGEoQUm1aadiD0MLG8u8l+xcbMYmZjJvtIO9aiiMU8KwKuw4
 tC8vhHNW5/PSFNXZG5qGDykssRzuSqRFrPUs2uj7fCIsL5l9GqpmX7WCR0lik15/iTf4jyiWyYZ
 V+m7ExJc2CB/Ui5hDuA==
X-Proofpoint-GUID: Lih-pLwwrNNadn6r36Bc8P8EMnh3NUvk
X-Proofpoint-ORIG-GUID: Lih-pLwwrNNadn6r36Bc8P8EMnh3NUvk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290156
X-Rspamd-Queue-Id: 1C67E49710C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105247-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 29/04/2026 11:28, Konrad Dybcio wrote:
>> +config QCOM_PDR_HELPERS
>> +	tristate
>> +	select QCOM_QMI_HELPERS
>> +	select QCOM_PDR_MSG
>> +	depends on NET
>> +
>> +config QCOM_QMI_HELPERS
>> +	tristate
>> +	depends on NET
> 
> also:
> 
> QCOM_KRYO_L2_ACCESSORS -> drivers/perf/Kconfig

Ack

> QCOM_SPM -> drivers/cpuidle/Kconfig.arm

Heh, that's user-selectable driver, so I think we should change the
select into dependency. It will make choice a bit more complex for arm32
- the SPM cpuidle driver will be hidden if this is not selected. But
alternative is that this driver will be outside of entire menuconfig.

Does changing to "depends" feel right?

> 
> Konrad


Best regards,
Krzysztof

