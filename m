Return-Path: <linux-arm-msm+bounces-91767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO3FNmfTgml5cQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:04:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4579CE1A72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCA533030115
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 05:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1976134FF65;
	Wed,  4 Feb 2026 05:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIdDP+2z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQG6tyH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C621934DB78
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 05:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770181477; cv=none; b=Ria8E0LQrx7F9Dn32LMPvAO3pBSdAGKtYpw5ZxHzMsI/wsnqBk4lJ++qEo2AcHh7vDFyCB97vGrciZ2EENLHdqIk7rmPL8Ae3wlK/yXLoUECZ8iQDipTMTZ59YfKcf0df0mK7PIGhll6+cixUQ0vfJBawi68Ib2LepS5s29AX0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770181477; c=relaxed/simple;
	bh=XmFJIuFS/wd5AVgYfDUJizB7VVk4Xa+TsalDeRCDoW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLicXEOANYz2Bd3BWhVTbiUAM+mLGxI3jBCeKwcSFZGG86X2RgDtjKlUTOPIUpVx2bmCOnjx+6OMkaIIc2TGgubtM0X5VQVH6bzyZAZ8whRG7w2D1Nks6/Cf8zTtuinNcPtprDPshtBuqEYpPTuJXhOIt62IFp5x2GOi3NOcMmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIdDP+2z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQG6tyH+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6143uYgm3337209
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 05:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xSAiik096X5jYd7cFTlpkzc3bCH7olj7yaJbqdjszcQ=; b=JIdDP+2zh0G3cinc
	xCiDivaKwRWrpGbRtE0pBRjmA+/EVLUC3ZsS/TziqhA4vcMlP1y/9ffLsxEytEkU
	a9ZX+AGRm73YI38Si24xFkJRQUsoJ3pTdThfAP66+fbI0qevKaPq2UUlwezgKEvp
	X5gkQS7YhPXMw+UyPAn2WVNL6WzHT10dTV6o6UnC87j2BXSGZwlCDDsXON/BLPYc
	Wcs78sqQ/ukfdSIwD8Z8I9QtqhyQV+ztMIpRt4Tu9wQPoJN1N0SvNaq2TBmHi0Se
	+czWIOl7eDIYqGLkXMrc2astUbcgBuqOxBud1dJ8WwKk78jHNhJ69N88Gb32vzM6
	jquA5Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gewb1uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 05:04:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so57766645ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 21:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770181475; x=1770786275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSAiik096X5jYd7cFTlpkzc3bCH7olj7yaJbqdjszcQ=;
        b=OQG6tyH+HJnNvh8V00TtMGNWevbAbLyzj4vhc+AeSn12ZbLFxB1Kmh4dR4s5ISVxli
         3U4mFFPO26Vo8Pftblgw8r1O0vg/3pT0nAFmlP0v5zhpbld9S8sToSJ8nmvi27ZtrHtL
         L3fy8fwlbaQBy1wUSVomkJblqMib9CXSQnbPCPBwOa8l9ojnd6yxu2zcubBHBUrYiDiK
         KXKb6awW42uZczoWGx7IzRwlX2CVIocQpi3E57MoK0QHJq4t7m7uwmGckhsi5a61qGxf
         3IzHPg8/BwPSKdxx+ToJ4JlEo3mt7ThRdkJ0lFpdDWBFvjp9YO8uK4U7sCjW3nPR3e1F
         OlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770181475; x=1770786275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSAiik096X5jYd7cFTlpkzc3bCH7olj7yaJbqdjszcQ=;
        b=sQsxbxgxtk+O5qik5t8wyDKhoUqt79D2Q5m+2z3zCSUdovwRYpqRsKPqOM5vbcv9+R
         dQ3+9S6Pce6tZoWLFp1/GI6iNBjkFZwA5z67XnV/KSDpbvEeaZ+GJDEBsoTvI83gDEsK
         Ni4ZgBFM1ORI86MuUx4dg+Wm39AfX6D/2Rfxz5exSEGpuaeugVtBISDQmgY1l8gHsnp9
         Z9o4LxO/h8eNkedZSPhQ96swuOAhCiPOxuWrzXeuZMAjZon4SuyvgTiNL2IN7u3CJUeF
         X+I58YCk/xJOBdxoZv2XnxWRGif8WdMLXybVUSQIA6AXTlVPdrBye9oa/pfkLs1UfEaF
         opVg==
X-Forwarded-Encrypted: i=1; AJvYcCUPUhz0YV5OdD/UXp4ahcKx6aslM2mBXeD4ChnJXbDDnRdDgCoyjTReDG6IKLBcbFmJkUZCojpROz6yDWHU@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKwoAMZQOmfJ8+Ug0uTisSV4AcQjRQF387DrBbVxWNdkKshOJ
	SSM+5ZTkgFbm5c05/ZGyPF+62U7GiITQnTJZ1pmxhU8q34xMZWj6mECfcujV2qb6QMOpxvQbl0K
	GZvWdPFaC4N1YCdbqo/RYkTXIWV3oHNuzgU8FFk6dbXZBRV35NgDyjuIYznwaZ25isJWj
X-Gm-Gg: AZuq6aIjbDCdRoQj4T0pKSELiuBJHTXG53qwSaSLLEHZ2aydd0Jqr0i0GP4RYZbWiIY
	8CF+8rZi6S1iCjeXu5+3m6HD+mkaiu3X6jl23ygSAvw9k+PmL5reC/aqbuF0Q+ETjsKL9dyLSZ/
	yrJTBnc5D07lTWafHaUbGjgJTnWDVQhVS/F8C7Rl8789W6CgGIyEY6D3wXZaOraVs0xcuj8xaY5
	HDk2zkpzIOOKxDhVJ+6OwcqQFGIHzw+y6MTV3xpi/SDxyHlPSUyNPewJbbbawy2MUFKvCDi4dpa
	Wn/fGRp1Jy9rB+DJjKgaS4D+wgstGj4v99bdJ+Sa0x0DyofJWDVNedr78zmzfVDAFByMXKsw7u+
	NMfu+pJGe/aW0f70IT48j8Im7Q8DF6Kv5dq8ZjeWdJg==
X-Received: by 2002:a17:903:3d0c:b0:2a7:5ad3:79eb with SMTP id d9443c01a7336-2a933fa63eamr19784905ad.35.1770181474802;
        Tue, 03 Feb 2026 21:04:34 -0800 (PST)
X-Received: by 2002:a17:903:3d0c:b0:2a7:5ad3:79eb with SMTP id d9443c01a7336-2a933fa63eamr19784455ad.35.1770181474231;
        Tue, 03 Feb 2026 21:04:34 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d468d73sm954264b3a.49.2026.02.03.21.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 21:04:33 -0800 (PST)
Message-ID: <cf2b7624-eaf9-4ba3-9b2e-81be3adbb53f@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 10:34:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] i2c: qcom-geni: Store of_device_id data in
 driver private struct
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-13-praveen.talari@oss.qualcomm.com>
 <df7cbe46-153e-4959-911a-14600b3bea21@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <df7cbe46-153e-4959-911a-14600b3bea21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7Yqk1ONadzWKHdMRrFLniTjwevYszHtc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAzNCBTYWx0ZWRfXxk0ODlWvQDhx
 IuMv2gW88x1PQ/tpcJvPbU/z/4ULmnrwj7dkfm2G3pGDVu94Go0j6W6Mrlw3PUt9x3sQApuaucd
 zt2GE6TQIIwVXfqMbGaO2dMcHEH9lP2RehVzmpiiQSa5atcAvDRhPy8SdL+s2P4U0K8606fyUVl
 ihm+SbZkZffAVM1yEki+ymrqWX9AiCDtmBTida4NLWVmXsptURck6HwmP0BezeSHXlgzOhRKvO1
 E6te9rHjIdaX5UHG9hsU9iZ4uAbQkTi9rUqrY9M67dLdeNP7XI4KM7Evl9VsywFKtH34SZcGsnE
 dPmTe8LqJjKpgEywTbNlXF0oKUi1OgYrz2K24IEoA5QXhu5HY5sYBgYtqfXRI977BUB/fafL+3b
 K6ik6kjtoImuCwVJzWrd+y9XLdCKbgm9EHy2nh8Vkxr7wmsApJq05PS4oYERis95tJ0UTsEWfRb
 dvToXRJWcfOkRoNJuMw==
X-Authority-Analysis: v=2.4 cv=XI89iAhE c=1 sm=1 tr=0 ts=6982d363 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xoixdy55EFV0JJdjLs8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 7Yqk1ONadzWKHdMRrFLniTjwevYszHtc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91767-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4579CE1A72
X-Rspamd-Action: no action

Hi Konrad,

On 2/3/2026 5:55 PM, Konrad Dybcio wrote:
> On 2/2/26 7:09 PM, Praveen Talari wrote:
>> To avoid repeatedly fetching and checking platform data across various
>> functions, store the struct of_device_id data directly in the i2c
>> private structure. This change enhances code maintainability and reduces
>> redundancy.
>>
>> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>   
>> -	desc = device_get_match_data(&pdev->dev);
>> +	gi2c->dev_data = device_get_match_data(&pdev->dev);
> 
> Because you dereference it unconditionally later, this should be
> null-checked

Initially this was added, but based on Bjorn’s comment like there is no 
possibility of getting a null value here since we are already adding the 
platform data to compatibles

Thanks,
Praveen Talari

> 
> Konrad


