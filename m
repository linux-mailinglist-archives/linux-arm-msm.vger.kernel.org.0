Return-Path: <linux-arm-msm+bounces-82497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AB2C6EE5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 262D129746
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 13:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FBD35E531;
	Wed, 19 Nov 2025 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFIhR5+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1n8AQaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4693612E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763558976; cv=none; b=c0mNTfUV9hvKF/IMBgHBSxF1XVPVXxF09aeL1D0Ln1EMzHNDvsfCdb/HDa+SYRmC5wjquaoYItL+eJv3f/1BthEvNvVTXHOR0zFH1mWP5NT3+sYWGWnRglGem8RF0Z/rniAGRwvrXkhqFKcAMIjwFTYDCnNNZ3msiJfuZF4FbZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763558976; c=relaxed/simple;
	bh=P5EFCLkeVjIC6Db2GqTKOtDPyJqdrP0m/jjUMLaPTxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRwaKQZb/XWyGYOH/0TjJ8K94U05rO0EErWNWFV14JmB6qYFh+etkXMKZphsB3Q1e7nw9m272QF6nSuNdA2LYACENhZL4jxSBiRG2BUTm/gCyeJzssd0ARDu/lQBZhmYoWh40KZ6wl+MLlJVaHrhGw4tfnKH9jZPby8josvYY+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFIhR5+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1n8AQaz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJB6VfG536936
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QGGdogWgWUImr0gsxTERgdARrL1T0foOXEeAjf5Gy4k=; b=hFIhR5+ZLQA0eZY6
	hfK8rCmhNC3dJnIcq/cGWW64yyvKOhawlXz5jh4MvQQ/Dt57jDBH/plsxlbMUlUE
	qHQFhY4EoqWGgZnUBCm3z5fdQC2GFW1XtaCwjfsO3ie1khQQl3QnXnqjqKX3jhCe
	ry+1ofwv8b38Yu3tkC8Hk/Dmt2/kU/nP4b/Qp2s8Ng1+BNyzyXF3tNiTAn3uOFgk
	RUXbhmBcRbJUjT0/b4m/JdrAR9AUP+ptjAuNIcWv6pJc1u1mmH6nw8lM4fWDQZ33
	7hbenEYV0qHQqJV3SQKVzfEKzBfoG//DkgOAYFq/oJ7PB1tkk5K7PTiT8sX3Rh+G
	612Nsw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah65t1nap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:29:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso13626227a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 05:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763558973; x=1764163773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QGGdogWgWUImr0gsxTERgdARrL1T0foOXEeAjf5Gy4k=;
        b=i1n8AQazbIjcDtydNFu6xJGk2epLydb3gDcZHElo4DcnJ2F3J5RFxatQRNEnZUtzkG
         JKtcSyFv2pujW0gqXIC1Lf3Lc1DXYHPaYuSBU8KkAsedbjy6f8mgLY4/ae38ALSrd39R
         jD0LR7UscSAj0eHakijHcR6l1wkoiUYIwt8hZAvL3rpFEDRlqQJC6dgy49FlXWR4PbBb
         byUCA6uBnT5iRyl/8yOTpsAU2ea/F9GRlyARHAReRWqqrPCq7Cs6W9bCowtKPzNU1CMj
         9NNSrztZpD5S9o1LDCa2of8zEEKZNu/dm/e0E+iaB1msiFBk1tHxoWFjnHYLgq8ZukWn
         lOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763558973; x=1764163773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGGdogWgWUImr0gsxTERgdARrL1T0foOXEeAjf5Gy4k=;
        b=ZcWRhSlAa3SnUsITcn5MXyT+K3+bzaw/Us4F/x16xPkbDLmTWR8tsRM9I9/27STPu+
         PdG139hcmagG2IztkTKT1zHPV7FaZG2RuOb3IB4KnEfvHd62vGHwowz6hkOWXUHWTCEn
         9KiUNpOExFxzU+3FkZMdPDh5M+7nzLUPieoM4X3zipPs0TPfcCkAI1JSZZh8+SI9k93R
         luzLzWgb5qUoKXRcbXp0TZFkVcxLZB8lc6L3n48EcYHgYVVlzrvw1PzR1XI/bWmu4RSf
         mjO5t7zJyTMtxqjU+sDFdfYxPIdxak50+Tl5ctKb9NiOrqQZjQkAz61piqfMLn8nyM1X
         aKeg==
X-Gm-Message-State: AOJu0YyDiDJvTsUY7Hk8vRgitzI3NnMUhzTLFMKXA1MXKs3OMbgEWlHC
	uuNxKRAXpuTzDn7QHzbiGov+sVe0s8gJ+4Is0h6c/ebMHvDbRbDSgwkrBJMkJzSNRbxylUVnyoa
	199ZrBdiYI+840pCYlm+AaicS/QuvB0ZRtGnmtzzW49nH0M7lKImTvlYQynZY0AxBdA/+
X-Gm-Gg: ASbGncswEuPHRFum/uhuel5NHeW20tkuy7p8asHlhcNQ0gES3x0KdJziLkGkkJdLDlX
	B4DTpeE4DMX6F3CMY54pm6hKnz/nm/HFmP+eLJM+Ai+cyqSnAnX6MoHwJBfkKuLHCbQg82albuV
	EpZUAxcCyGjBcPfVqj/KVFDQBzY0OD0LEc7nHANSPP7UXl7W4s0ypHArn8emUJ0R630pGWVX6e2
	qLfvLEX6P+VHmswqVf2fzTkPwVygLaAh91pSTxHDDLEW04Y0oTBTeSbK4DaFsv7rOIoPUebh7VG
	crSQNvznoTVNK++o0GorAfM9P/0onNCiDzsKZY1X5VfKGXnWC6nKVuoKin0DoI++xt0x8xwj4i3
	iju8m2dzs1lwNpj0A1jFc7bcD3qshyKPGS1dUWeg8
X-Received: by 2002:a17:903:18b:b0:295:8c51:6505 with SMTP id d9443c01a7336-2986a741aaemr243774345ad.33.1763558973175;
        Wed, 19 Nov 2025 05:29:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVtsrHwgS9TdK2Xnym6543vqIpxNswUiEHoeYWVo4V8hSYs944J/eKrb2JYQw0iM9JjQMPMw==
X-Received: by 2002:a17:903:18b:b0:295:8c51:6505 with SMTP id d9443c01a7336-2986a741aaemr243773935ad.33.1763558972808;
        Wed, 19 Nov 2025 05:29:32 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c24229bsm208073505ad.30.2025.11.19.05.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 05:29:32 -0800 (PST)
Message-ID: <ce15589e-f389-43f4-a671-4f7bf3894f86@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 05:29:30 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
 <1f320bc6-ba7b-476a-b9fa-b5333f66530f@oss.qualcomm.com>
 <fa8ddb59-079a-41c8-b75d-c7a9d40e7da3@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <fa8ddb59-079a-41c8-b75d-c7a9d40e7da3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=avK/yCZV c=1 sm=1 tr=0 ts=691dc63d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pKwLnlz3lkq_G46TUYIA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEwNyBTYWx0ZWRfXwfbALnVsB8yP
 VWfhj/V7kyU2J3RtijlQfvIB/8g2b57oD9qu5xIi7Sr6LpZ2CihzAch+cpjz0wXWtrdfcHFwhIn
 QqsKqI/LCyuzW5xw6NdpXeIwKqG4ti5rRhi4MutdaZ8IRMDrmD9/AGF9X6nfL07MysD2svopzMD
 8xTJLCx6u0qUIUTvLJvAlKObeKXKlkwEkVenROX1IDi872vqCYRdQxeeUCBNxf8pTEFItamCcH/
 glqiCE7kpKtepGB1undTyuzV6jb/W/C5M0rlP7OuA6OBUbivRg+nXJ51I3Somjt/vv7Rivc7NzN
 qcI7SGiYdOtI5jCncqCvHwqIpjhv4va6gtQhRL0nfZB58Vawi9r1TkD/+pLCm2iv6t+EC5KGgJD
 7EfIsQXzE7GI1N+c7ljAdagZgaPmNw==
X-Proofpoint-GUID: YXEREwMPlWbe7rWsAmC2fmF9YUUmxj94
X-Proofpoint-ORIG-GUID: YXEREwMPlWbe7rWsAmC2fmF9YUUmxj94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190107


On 11/19/2025 1:21 AM, Bryan O'Donoghue wrote:
> On 18/11/2025 21:45, Vijay Kumar Tumati wrote:
>>>> Hi Bryan, HLOS does not have access to those registers. They are 
>>>> configured by the Hyp.
>>> If that's hyp, please add them. We already have platforms without
>>> Gunyah. Remember, bindings are defined once and for good and I wouldn't
>>> call it impossible that someone would want to run that configuration on
>>> Kaanapali some day
>>>
>>> Konrad
>>
>> Sure, if that's the standard. But even on systems without Gunyah 
>> (say, KVM/PKVM), these will not be configured from HLOS in the 
>> regular flow. It will be done from TZ.
>
> By the bootloader/s or by runtime TZ app ?
>
> ---
> bod

The proposed architecture is for it to be done by the TZ (Secure EL1).

Thanks,

Vijay.


