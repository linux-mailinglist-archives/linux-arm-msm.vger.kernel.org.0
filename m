Return-Path: <linux-arm-msm+bounces-89587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 443DCD3A208
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15AE73035259
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5ED8350299;
	Mon, 19 Jan 2026 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U17yRjbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBA2foa6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F5C34EF0E
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812513; cv=none; b=ko0DI2c0N9bLfMXxRhRXCSQlSRAx1UJrt1YZUY+yKObpYBU2bBzRPxLRV6IAAacOUfgA32U4fVbXSjMIIXdazJ4VDbWS0AFJdHXGvmgDFYoKunfQHpy0IH5mCH6t2Od9+X2cOZ8EIyPD7qxTVBuRAapLwiBkaCNbLE4Kzq8awi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812513; c=relaxed/simple;
	bh=p9bcdSCedNuEUxuUUN5EYMOAj4BCntE3D/nd/04OUbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dsiDkN/rfctCuRL680FZVHzB+8pnqChk5f4BS9+AfsojOzg4je8F+Wp05QyCePp5I+fxOitDKlbEj+EWwS2OeoVcoiaTH1iq6QCuBf4luv8Ik27qUD4w5S0oyyMHxxkaw6jYUqi2TvxqADUuTX2VsynQhudLwL8RI4tOzhP66b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U17yRjbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBA2foa6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J5JP3r1990912
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9Q9mXimxu+dTLNB/G6zaV2BvSAKIJP4T3d+A0SDNV4=; b=U17yRjbnb9quD5nn
	gx/y+7JvxbU1WnU+dYKbuKo4WW5SrC8HxzIVqfTte3KMI+ZlIbexaaVlisKizoKt
	hPe5z0IGZQFockUvOLGVl/r+qrBu8Bn+F3QKMP5Z9Eu8lNi/G76LcwoQwhaM9LoU
	3QB3LZwGUUv/ewb02VcN2FI/X7b4JFDtLSM/V8n72EMbkxtGO7iszQK4+uef/+M/
	GILX3UKDvAR1Iq4kbtv2hkwN8zfKnc3I+U6sfcWqfLl6flG6TcKcR1DBn7K+l7f/
	z/n2qitozQxGyOsdVtXThRYFPMmmhO0B/HXNtvezxz/QyO+nerxkAZz23VAbqL17
	EcLG3g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t74bnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:48:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c549aaa796dso6696230a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 00:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768812508; x=1769417308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9Q9mXimxu+dTLNB/G6zaV2BvSAKIJP4T3d+A0SDNV4=;
        b=TBA2foa6zFtyPhcpDoZemDZi4FH8UNrgctp2+L6ZNCauAAiPONlhHlH9Cmtipqcxt0
         2BqtcusZyypnOWl3VWwyD+WFAfXQ0sDn87XVJfOYiVR27DvudawEFYyaunORJRJkKb7y
         oiSIkpLOpAZgFYGqh2nO/MKeoSJxs5ciFRpFYvB+C0Q6OgHURJ5vO675Nuy7zxREZssD
         3dl05eEZWKxYMmzusBwITcmVi6kJ0e8eaY4bMZdrLFpnAZl/C50WB/CqXGzOVmvWgiql
         YU8ZkOG43PNzml6EQ6eaq4Bxv5zJRakaRlqXInQtZB6jPDD646OV+c0zQmAMVnU827a9
         OcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812508; x=1769417308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9Q9mXimxu+dTLNB/G6zaV2BvSAKIJP4T3d+A0SDNV4=;
        b=lO9AR9ZjOSjZusSMd3WWAHr61Yu+JxbkYAkQkIZKJfNlHZwSjE8b+g/ZBsE51Cw7yM
         jKbwb21PrcqlRnfz1iNe1zI28LAB1fg13Rnf/bonQJZ/ea8oqSwqvIZ2OcIQ48aNe4bp
         /vPIwLoG1rLis3AVsFkC/RbYohn4dCaTuZwh6Db5V/PcvNo6IdvnqO8533W1snIMWmoU
         NqVe9dPBDZH5n7LNtebE1bEdW8wNkQr4HSoDsuQYouZvxg8SA5H7vGyDsh9eytCGpsIr
         Ho56YHIGTvcFg/XeGMBnILuUmBEfyg7dbmx3zA80z12qiMcRQRTXc/Um8dCit2BhRPGp
         73Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWq0EUzPDkVrq+XqBTbUEd09P4d9nTOGRHRy0TQAb+W/v92fgVwVOhWwcIVfINUAOg6UHWFq25QZdvAId2R@vger.kernel.org
X-Gm-Message-State: AOJu0YyEStFqbdfRlNi+n27TsrMOocTrVXKMgcx+WMLC08ngfoRPFJg6
	v/x7N6jn2YW7nCWq175TkteNb+NXwI0kk5SmZlvj9ltC8tesS/CS5ggtmR+kWJ8sNGTb/PYDncA
	gM20oAIgoUO6uji0Pkapy+evCnBd8+AcEm7zZUJYA3LA6w3Z4NgqbShAkbW7+pRpfEIVx
X-Gm-Gg: AY/fxX5uq3caItmlPvdESKSQ7s35W3xkaLTIU0mCpgnvZeFJCL3WnuR2KZDP4OelpUc
	YLIV7/YGPSTa7E+84wTkHVl7DUr92bxSqGfa2n2Ahrxqleb4bxKk1gKC8J1uapGf0Hjxzor7/z+
	zCtynpkGjza1jP4SnMuvtPtC7o1A2VGc7zRwR1RrwVuXbYF9O3hJADiYfWbPvHcBFNpH06oNBM0
	NcMHc/zYYYNO0VbzixaG9HHim/zslA8RgjpzJTx7UBxN2Q1xvYvTXwC+XJiJfoGrArSgmx7Bstj
	+oslIzctn15j0owNYwE3C8u2ehRN/mnV3Dy41gUJrg0b5TFs9+COZnUj4KzXZK8AN58ENFgZSFG
	AkPFQfAVjGENgjyFFF/EJSFmy0aEXa/Knz2trVZMl1Dpp8TDZHD/shwF1HWvIjuFypYckHB1imV
	5cEIg=
X-Received: by 2002:a05:6a20:d8a:b0:371:7fee:7497 with SMTP id adf61e73a8af0-38dfe7c8fbfmr9718637637.68.1768812507748;
        Mon, 19 Jan 2026 00:48:27 -0800 (PST)
X-Received: by 2002:a05:6a20:d8a:b0:371:7fee:7497 with SMTP id adf61e73a8af0-38dfe7c8fbfmr9718612637.68.1768812507295;
        Mon, 19 Jan 2026 00:48:27 -0800 (PST)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527306d30dsm8528150a91.6.2026.01.19.00.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 00:48:26 -0800 (PST)
Message-ID: <e1c00e57-cac9-495a-9d27-f77ceac5c5ce@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 16:48:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <20260116104136.2922032-4-yijie.yang@oss.qualcomm.com>
 <d15bbe2a-a88a-4a88-a685-ecd4f058c3af@kernel.org>
 <3404f2f4-7edb-4bff-925b-0a6a7a450f5c@oss.qualcomm.com>
 <eawxuhblnho4pyeyskvk5s4ouqser7o5jh267ttinzeeowxfxs@y6nl2qbdydb2>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <eawxuhblnho4pyeyskvk5s4ouqser7o5jh267ttinzeeowxfxs@y6nl2qbdydb2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696defdc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1ir06EIKMARb4SxFNewA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: SZfqKPf2ROB7nZyMuItGS99ZXxqOATv1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3MSBTYWx0ZWRfX+1CbOG/xJhn1
 +8ooYF+Uo5HlKeL6dg2ffCW9LY+sKhYR0hXh825JdZmvmb6JtNzMtVniBg3p+IzTVAhsV2gYWfM
 edN+lkTbNY+txiwSAWQ/4jWVS6+yPCK9vUy0FpGZf6Ds9ZNUGfw0IYC0ZHkVTQeautsh2qMGbBQ
 azdP8HXzpqMsKx8RHVCsIrN7ZyKVJ6oai5dJeCQWeColBMy9/jtWPJ8Z6fOMUyrCrPmw3Fp3kdv
 hHhqHMavOAMaYUvf+2RZehdCYSFuluteDuHbESN+GLBAl2vqGN+yKKZYUEZ8WyMczHjgwYWGpAH
 HFt+c1qZLRs0AyByR6REgJwJvj/S2i0Y7z//QO+D5AH7w5AUXJjUvf4NdfPE428/PWD/x3QIhB8
 AyEPO6U4HKw85PDRy3kf4GDmPx3FnQWbQQwbW3fVmujqrFTy2NcTh2w+5PoM+JCU6vxH6szT/le
 UVJlNQrL5ZDb78dbMrQ==
X-Proofpoint-GUID: SZfqKPf2ROB7nZyMuItGS99ZXxqOATv1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190071



On 1/19/2026 2:33 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 11:13:29AM +0800, Yijie Yang wrote:
>>
>>
>> On 1/17/2026 12:19 AM, Krzysztof Kozlowski wrote:
>>> On 16/01/2026 11:41, YijieYang wrote:
>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
>>>> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>> the Purwa IoT SoM and a carrier board. Together, they form a complete
>>>> embedded system capable of booting to UART.
>>>>
>>>> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
>>>> Meanwhile, USB0 bypasses the SBU selector FSUSB42.
>>>>
>>>
>>> NAK.
>>>
>>> Warnings were reported at v3. Did you address them? No, you completely
>>> ignored them, so warnings are reported again at v4.
>>>
>>> What do you think these emails are for?
>>
>> This warning is caused by the pcie3_phy node in purwa.dtsi, which is not
>> introduced by this patch set. Since it does not impact functionality, would
>> it be appropriate to fix it in a separate patch?
> 
> Why can't it be fixed as a part of this patchset?

'qcom,4ln-config-sel' is a property related to bifurcated PHY support, 
which Purwa’s PCIe3 does not provide. Therefore, introducing a new 
compatible with a corresponding binding would be more appropriate than 
simply adding this property. Is it acceptable to address this within the 
current patch set?

> 
>>
>>>
>>> Best regards,
>>> Krzysztof
>>
>> -- 
>> Best Regards,
>> Yijie
>>
> 

-- 
Best Regards,
Yijie


