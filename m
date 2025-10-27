Return-Path: <linux-arm-msm+bounces-78842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E10C0BCC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 05:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F24BD189DE9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 05:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA612BD5BC;
	Mon, 27 Oct 2025 04:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JuzDYkXv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60711DB377
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 04:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761541188; cv=none; b=TmtnFN0VzGz4zt8bX3mjgwY5N1r8PwDmHVaMVhhzXXZlYnYL/RggnD+dvVNSxX8g4C5ypqzrqcyla6gNNwwHIB90IjoKJciR/NMRrRTtpvF2M8ZYXqJL7iKdZu6aF4FbPeada2OC2nfhdWa2dKc3iNrTmHtGzl+Tvsft+ACHtzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761541188; c=relaxed/simple;
	bh=NXOAHiSNmxOiOS7HVDbazr8bykt6LWHHKDDuEoEkaxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1CPlH/APCEsWEoD1NoOu2zbbhgdJhr7TPlX4ZEUcUoLo+kU4GJGhkNAWU3t8phWv7xLtQ7vFI45cE8JwCzAwGfcl0IuLZITtB5GF5oF7cvgcEePErmhrzF9oMezneDSnHhBZq7pdajXBJePwerHx+jHrM84wXlO/zf65BeO7/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JuzDYkXv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QIokLB604725
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 04:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mD3eW8Q+X7VqXorSBBv6tEIzWjDaO0115Pe6L0VYuqQ=; b=JuzDYkXv6gvnOp2i
	bK+BXGbJDxdjchicRRYIHbQ1csoaD+b4m21NwrkVWU7HoTQrrkF5EYjM3AXnfg6p
	HHyUTlbCviz1Fizj2hsUNS5576oD8yGOcZZC3hsFysMaEJhCNexNSgbGMl31QPn9
	QIjiUmTrX/lFkQn9RVRh4PscGam0ACJcccjhKSwcWGsKfu98ws14jKzhDMYhBIT4
	YVvpIbyhghJrGb0hkuOrjde5y08ZlGmca+RANhjIXB2uatOLB173dmrpLNuMCqdd
	cQsn6g0Rh9Y64CqwM6k74zssKDhJ4pvkZMDFvlJbIpKSb3jwAProYA0Ruxw12M42
	nKArdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnb3be6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 04:59:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290c07feb72so33954135ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 21:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761541184; x=1762145984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mD3eW8Q+X7VqXorSBBv6tEIzWjDaO0115Pe6L0VYuqQ=;
        b=vrydQDRFUEcHJe3MNVC5IEF4QFChuqz4fC5rhaO1RwTIzsQByIPtvFwdDkqu5p6RJl
         QCgjD8J0nw0kNtkx761UOqvaD3fE9qsMlgcGYS/ILkoK5k7hQERdPoW92t9+aYuiwpq+
         nwK4yLpDT/Lu87tqtK4xkcQ0G1MM7hGAgaISSbWTw3BTBegCscxVlM+oxWfYeQtk+UMl
         JZ5u/UaCPwkwCE5+5V300gSXEtm0017YO60RIKMC5E78/zD4VIXO/3gG56tfH9irQ3R3
         Syxx5N/FIEr40jzhhB2nkst6DslotcHu6Pj/W7JsVgxVPFrBDOdYWFf7GHlwDuZOg72e
         QKTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXoz6E3fo+gtRfbi2k5X51Z7K8EHebwyKEPRsTBPSQ9VkWj7JiQMqZUnLzQjK1AmgCJz8rW/4dyO5uxHzU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr5cVzJwGoqK56n5XHC8tSV+elRNTgaFEphqCi1gjyBQeXPGcb
	XsFjEPI0Pd8/GCV21pnHJmWQHeMac0VsgkRCnD0OPOZJ3gRKjyLFxpBgSNv6bVfJ/6/D7TxfjQF
	tUiRHkGij4Snq3Sh4Haj0Nktua5LicuVicrL3O1NpgYLDeSMpU2OsbIM59p4RkMT2NV1O
X-Gm-Gg: ASbGnctrWgdj47Msjv0CyAHv44c0yTcz56GOwLWBHtPfpxJNoIp847ANmCmxaVU1Dn7
	tAVC0qSBZkDRm86Q+odgtimGJa03WdxE/Tv0DRFuKPbDnfqP19cQPv+W/UmH3lY9I8nV3ti6LSL
	XDDaZpoF7VJJZySZq3ab1rb01HgGhklozFHwgdHaODsura7bBQscmC55Adt+U/6OSGV8mXYnFYv
	jAszimey+tbt8jM2lLMVfmOeUiJxY/gYXq3S1cTj0Z8R2RtVtW+VTZb8U3GXM+zsylRnI/jATti
	WKDkEFLfGNyRWxmDJFcEyJTJTazNrdxDtazp2x5Sbr48PpHVPF+DmDxCscXvUyOB9lr6s7Lt7qD
	x0KhaGq9mprkvUKcn4Bq+2+d8LUimqawkGAfimiL8b8A=
X-Received: by 2002:a17:903:2f88:b0:235:e8da:8d1 with SMTP id d9443c01a7336-2946de3ddbcmr113941275ad.8.1761541184083;
        Sun, 26 Oct 2025 21:59:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2IPsDoUoRRbxLruyTRMj23/2P6SPWPhK/AySX1U9OdkkR/gxEhSC6+HDgwzasnTw0x5TNow==
X-Received: by 2002:a17:903:2f88:b0:235:e8da:8d1 with SMTP id d9443c01a7336-2946de3ddbcmr113941055ad.8.1761541183628;
        Sun, 26 Oct 2025 21:59:43 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d09a59sm66527395ad.35.2025.10.26.21.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 21:59:42 -0700 (PDT)
Message-ID: <cfb94b1a-7ad0-4067-a08b-2af358edb768@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 10:29:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: sram: qcom,imem: drop the IPQ5424 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251015-ipq5424-imem-v1-1-ee1c1476c1b6@oss.qualcomm.com>
 <20251021-quaint-hopping-tuna-0dade2@kuoka>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20251021-quaint-hopping-tuna-0dade2@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PxTGb5tf8U_WMSSwYsAEsT6G9QuVI2Ks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA0MyBTYWx0ZWRfX44V7R4+8ScWR
 cbFciY+9UDB+NryCMzkWpWXiRelc+H8Hy/WkBqvEMgud4N+5s4QGiGUEmry5bG4rQ84fZEENfPB
 clJ+GwkA7N2BH3yZdfuEAOf6VZjASJhEtN7qhrdTDrBsfpu/Ep2JAICJnKezx2qUDI3oIaVyMbc
 jaYjUmtj7VccDUB4r3yDeFo3nzLw6bJN/P9kjgzaRhZtlKZjziaxSjwqIhQsPPWt0oWoXKkE3Zw
 xVX9ve/Qr/Bz8oXuBmoB+HMmwlHK3okfugFbUrL4TEXv9LukpFDmHthZ0hArtaW6g/UFvJTLpnF
 WWDHx2Z88ElWwzxG+sjTzYw3YBuRku+E6ZcgWX49r5MMaQ7eWNeAm+PPImqJ2+CJE3LLw53YUCw
 HelJ9accW3Aitc/21fO6e3oOEI4l2g==
X-Authority-Analysis: v=2.4 cv=AJoZt3K7 c=1 sm=1 tr=0 ts=68fefc40 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=og02JtxI0NfJW1qUVyoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: PxTGb5tf8U_WMSSwYsAEsT6G9QuVI2Ks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270043


On 10/21/2025 12:32 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 15, 2025 at 11:46:58AM +0530, Kathiravan Thirumoorthy wrote:
>> Based on the recent discussion in the linux-arm-msm list[1], it is not
>> appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD. Since
>> there are no consumers of this compatible, drop it and move to
>> mmio-sram.
>>
>> While at it, add a comment to not to extend the list and move towards
>> mmio-sram.
>>
>> [1] https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sram/qcom,imem.yaml | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> index 6a627c57ae2fecdbb81cae710f6fb5e48156b1f5..3147f3634a531514a670e714f3878e5375db7285 100644
>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> @@ -14,11 +14,10 @@ description:
>>     transactions.
>>   
>>   properties:
>> -  compatible:
>> +  compatible: # Don't grow this list. Please use mmio-sram if possible
>>       items:
>>         - enum:
>>             - qcom,apq8064-imem
>> -          - qcom,ipq5424-imem
> And where is qcom,ipq5424-imem added? This is supposed to be one patch.


Kindly excuse for the delay in the response as I was out of work.

This is supposed to be added in the sram.yaml binding, but I haven't 
completed that yet. Between Konrad has done some rework [1] on removing 
the imem.yaml and combined with sram.yaml (in his dev tree). So I hope 
it will be taken care along with that.

Konrad, Can you help to share the plan on when the patches will be 
posted for review? It will be helpful for reviving my other series[2] 
and obviously yours too :)

[1] https://github.com/quic-kdybcio/linux/commits/topic/imem_sram/

[2] 
https://lore.kernel.org/linux-arm-msm/20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com/#t


Thanks,

Kathiravan T.


>
> Best regards,
> Krzysztof
>

