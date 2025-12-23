Return-Path: <linux-arm-msm+bounces-86273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA10CD7C79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 03:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C08153014120
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 02:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBAD230D1E;
	Tue, 23 Dec 2025 02:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQ0RakS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQzNhReC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750D47082F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766455262; cv=none; b=B5P8zEYA1EJTgxuWanO49MpchF5rnHpJY1BTNrfjpRWty8qhQbOpLrX4egJc6w8LyZ8pBde1lL6D/qqZDYtGSWK+/NovcAABmaBd2KjdgFyvy3a6fPDmWhHwrwv96ysJ/oV4wXOio70ayhfasrhiwOduNtfWvIE11rlvZvjmhec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766455262; c=relaxed/simple;
	bh=5XILKwM1zUCkPNFPgBJVO0VqFRH93jWJg6urthwgWBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBHSD2tr36gjZg9atQjE8di9fCbQkJgjfoozEF0gQ93FJVMmIaN6uVCT+M3dvN7VhNZ2DlkMGh4fjzgE/FuILgRq2FHwKXk/NCY/OgBbPpHnGvre7WZbHsbMDu0SErrOQHoKChRX72MSuXesHXgKtEN1aJr9HcdTyDlLqsatwO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQ0RakS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQzNhReC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMECCID2041152
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CnurDZ0wT1xrsan4bndi1j6HFiEONKCW0WPRXigA3Pc=; b=KQ0RakS1bUo1WgHN
	3Xw321kAPJ5DNGP71izy1/VpNVYhT9zNGY3h08fjYFmsLqIt9PkC6HbwR5zC6t9D
	vgE8liJ4C722Bm2sypBQKg0gaPMBJSWdfPDmU5DwPU20Qqk3LNvbmoNu32i/ou/a
	c2SVoYjMxaFMaeQ5hz5SlS6Yf+QdqzABh/iioRCKnh6ZXUo9l/cL3bCNAgAZUFDj
	GFrWKUNjXN/aQYS+WxOAOGru4qNfqGTTIHZsYk51NzfjCpG7CxzPH+P4mCD6IrzR
	/RCp7wnrZLOorf4F/vMBksMMsplCy/Kx3rtloNKTM2pEZtilJ52N3BZ9w/+xKMO3
	o8FNuA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763phw66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:01:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7bf5cdef41dso7785685b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 18:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766455259; x=1767060059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CnurDZ0wT1xrsan4bndi1j6HFiEONKCW0WPRXigA3Pc=;
        b=GQzNhReC89YK0ZesUl6LzE41irIKkyfRcUqyHMaB8gqZcMKySQHXckTCuFCkIb0gj0
         86nICN17UAe0JKDm/3LuhklklR7fkCt9UkAz4FO7SkJL8mKPujJW9Zt1am/xOC3/ZFPR
         4f5AJjUk7yDcmomJojqGXHsThDX30qZz6/MfW1mC5EHAfGQ6Ec7Vru/B6whNMyv6nVlt
         pO5oqcmL8mzAi80t1b8kiuQQds7uH2Yt5lLFwMl47/+/1Bl59/SXxNbZwGU9/TYPWQ2M
         JIfqYhCs2j9S2LV+CvxN8eYj6cbqoRaPhjaVUWE0sh3AYuV5bgGlXe+Pn++Ziv0Ko3rR
         3ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766455259; x=1767060059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnurDZ0wT1xrsan4bndi1j6HFiEONKCW0WPRXigA3Pc=;
        b=CpZvfIl2Y7E6c5q7xePujRGwicsYigyOa5Wywvm0cB4OVdNY1qH+MCbDIeqLDSMb6L
         kPiQcfCEqz1i65F7NNZ5vRrhIIN3/7ylwhov2nnig2OENiKoNJbyQBE9UDFEvPICQgre
         8uYMmi2yLscdqBNTvynCsEMpo+EKMNz497xwlfjbF26TwJFENzpS+PMGEpSaKGNjLjlO
         aiv5yOxnR3fY2swttLy5aNlq0kBxS7vU+wLVTrqyhxyt3v/m2QHKnbTD8RxGm4zwafX1
         uhcGEvNbUH5DZLJ622EN0ox/btfJUul9Bf0xC+TXmlj5v1ogImUTshqOoOhEt7EfKPSt
         H9fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzInx5ezpPKxmoj/z2Wjf0UrbCaeWlTO9MsQcmzRfWZyvc9IqnG/qIIPwRaXjl/aL3SBwUF5vwWZyD3nFc@vger.kernel.org
X-Gm-Message-State: AOJu0YywuFz33WQn2fxuxW1vxHkd7fvWJmu/ru6sPKK6zDSZGnSdiTGw
	Z/E/Bd85AeeOCXV4/yOa+BvfQRCxG7xb85UtPXx+hxqGMHm9lecbQWrZvfN9ImYhuEkp/Gc2sbf
	O1n07wMLc5fL+uZtw7D2fm5rQ+jc3RmCmdjbOjzk9THegx1LofRUYri/wxAT8uX/5rlQF
X-Gm-Gg: AY/fxX68fbJFl7PKEzkrIvmXR2NIJUbsZ6OAoLQbcXq/w2lxdvEHqb8qg8UM4pwe+2I
	9rKUOud9tuK0EcYeqEucWKzMAVdb+CRUVaitOQSITvHmoCTYuUbwMUDWvmah/lLaqQ9QrpLAY2x
	B8GT8H/ttoJ+3CmIBMz6dinb8u4gVXx2umjmXvSmCAEeC8p3VTwa1ZrcLTkUJo4LWQuLeE9LfOb
	WTLY6WSAHTNPUTvUpIIVnXncFhbi+FUv6WRQyFYUgvfxLCwRprzS/FxUWArOyQNQNQlljv0KX0y
	lAKA+fOJlK67awgihEXhWhV7v8xlOHW9lkgRAXbPci6IxpavryM8Ns3yHmPoY6JDdxNcBgmYEcS
	k//iKSon74LbVVeM5ESwu5J+mTNgfHaid4Xgnh6InUaAi2SL/KR8YIFct6//Ewu/7YEwZa9YSfU
	U5
X-Received: by 2002:a05:6a21:6da2:b0:2dc:40f5:3c6c with SMTP id adf61e73a8af0-376aacfc5dfmr11879356637.54.1766455258963;
        Mon, 22 Dec 2025 18:00:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH25vbWFU0p71Tep6FZOAmX7HMXPPX1Wvh0SDZmjWFXpUcRbXxv1IUkjtawMQgiFrIMlNyx0Q==
X-Received: by 2002:a05:6a21:6da2:b0:2dc:40f5:3c6c with SMTP id adf61e73a8af0-376aacfc5dfmr11879305637.54.1766455258383;
        Mon, 22 Dec 2025 18:00:58 -0800 (PST)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5dea1sm107249835ad.81.2025.12.22.18.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 18:00:58 -0800 (PST)
Message-ID: <862aa161-fd99-4938-98c5-73593b03d215@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 10:00:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>
 <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAxNSBTYWx0ZWRfX3mPSRStRBJ/j
 l2W57Y8dvUn5VPOdOaTi0L2/Qsuky3xIv+5beO/E+xdACGSBbrQDhKc+08ScKu+uwhNg2Ssu1Xw
 i8XDqBxtFfIDCtXVm+zXJfs4eSh8L88F2oOxKw1Db+7a9yppUKTJUYS14Tg4XR5y8M1DG8TbO1H
 WmyqL1Mtub4sWsv42OZ7JXKGuSjc82VH5lkZLEk074JIfwKoYcN+AMYI3Gcmorx44QsucYcVZB+
 uQwdHzM1S/gJiLvOaOdQ1feRuB6tzGBWY9txWwjcOajeERZvNat+mP3eFXhW4D2sz9P8xv4HsnK
 GdOY0fEUTzEFnzyUvTmDDvJYOMSxohDxNjIVdy1+LNKgTPtazC8RQsuXaCqyWvYSff8EUZry1De
 ERZlvAAOQlqHwqEE/v5TyQ5BWVQbEc+/RDbwo3NbpjLFmz9iwE68NESj/4dd5dJv2VQ7SpCfLuD
 VmHi1GrA7bq/L54xwXQ==
X-Proofpoint-ORIG-GUID: A7IbS5-Wn5quwaT7Hu7sVnKZmdAI3pEB
X-Proofpoint-GUID: A7IbS5-Wn5quwaT7Hu7sVnKZmdAI3pEB
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=6949f7dc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qwzK7WmDVYCsVKynHC0A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230015



On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
>> the common components into separate files for better maintainability.
> 
> SoMs do not share actual hardware. DTSI does not represent what looks
> similar to you, but actually common parts.

The two SOMs share the same hardware except for the SoC. What are your 
suggestions for the file architecture?

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Yijie


