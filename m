Return-Path: <linux-arm-msm+bounces-60905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE01AD4A39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 07:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2C8317AAEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 05:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBD642AB4;
	Wed, 11 Jun 2025 05:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gceIcVzP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB221D7999
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 05:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749618346; cv=none; b=dyc7svfeqI3Igkr5d9C3Q/7RbF7BEPmvXPjsJI0wMm+MG7SAmXahgrvLxgXcbocrehX3OC4gi1r0bKF+y8db3E44WzDb112IKoSrjm30OWcyzXAsGXZ64pHeqwJqvuAEWpHIztfjnQKw67N53yJGYNAcSBUI4rlq20ZpPuR0UB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749618346; c=relaxed/simple;
	bh=aQYY6xCCcAYMYix4A5vJaId13rEdEFR2wIi9qkRVWTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cTQVa7rbgICxBEKn2RFs1yXTe2V45x8DLVfb5pl9I3IbqsNbZnb6ORwUpi9uEMOM6VE8HFvh9NyVELs75SMAZxUCU+YHSflsa9/iIpJSkCSd/sjwstx2sifmqS7rlmNJyHWOAMGtIfaPtk6DIoy9bZiwY0EH4O1Lv10c2iAWKwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gceIcVzP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B4t8Cb018243
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 05:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iI9NMDhEkMnV0ltFhVkLoW15tu5Nhk3mtinuC3YUV4o=; b=gceIcVzPl1+9oJHI
	QjtKp9RsK47gzVGU6HlHQ8EKdhG7O3j+Wq6vXEKJawePiZVooHKH5QuFCVYUF+aV
	ImCBHgoj7VoOaJCft632KoQ7CTvEGSp4D2oRha1h9W/VgDYKB/hppM6ydjwj0qX0
	04rHx6RGDiyWJtkr0Jn1kck757jed8kEixC1zChgkmoDxMuVNlX3NWRuwRFwz+kZ
	pnttwuywuGYVF2fX+AhQUpSruB5GjyO+UWc0gagVydQtCnQxGuRhCNtVIdyHg8uf
	8Xq3wjewqUNIsF3BFyXawiZSGQU3FrWQaSAym1zilyLuiHaz0d39oDU4aeIjG2Y1
	F2Iqlw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47736dr0p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 05:05:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2ede156ec4so7553822a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749618341; x=1750223141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iI9NMDhEkMnV0ltFhVkLoW15tu5Nhk3mtinuC3YUV4o=;
        b=tAk79tILMuItxHM/Vx1OL0OJKJCEcZjjviLotGlwEW8qd1rLciFp8B2uoitHAMcb3c
         EH1Kia6+aremcR32m8oKTmSBMmT4vvAKNsA85zSY4CIJ9YSqzbpcCgV5X109BlUoFvi6
         BcBfVj8bMUVLRhpf6FQ8R2JBDUc74vcLVGia+JzqDJT8SzwIji3DMU50HSjYiQ7hCZNN
         FnSbYRM3qWD7ywh8lOTOGqcS5tbsCWuepkXgoVGP+EEdzTq3ckqSHQr/chsYw6X6ci6O
         5HlYqRk6q2M5Jj+OHrpqNWFGm6o95Z5T7yQT7k/iJm32mRnY4vhd+viW2EjTnSgGHS3P
         K8AQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1pDj1Qkv9ki+DJAIdDiYplZn+6wNdceXd8d1LSFyWCSa/SUFEqvJRTKZFIIP9PEyR+keexvBYavubOkXN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5fiy7JA2h089sb6QERZsO0XgqRJpGfw6N0M7YjAHch3a3bY7A
	y/VulfKDWE+s9PzBMF1EWxSxJQgLvu6vtMbJCC+JDIAD4dBaXIgcmUEua7nrCUSs3SkPeckMQ1W
	bidLXorVUoaJnGaTWCMZS/r/cWgKNOdDt5eHLs8fvjPuWu64/5qYzSC55t0fN7PQ1pKxK
X-Gm-Gg: ASbGncuo9WN7v1ZSa2/TlPbrrSRX4Nlq/cFPS6GEwalJUDOlW63vSoTDomT4Zk/Fnxy
	4nIxZeNL5IT7hWKB3wZdcyEMuj8BzM/T456aDDRhArD8J35WH2DBcg2lZAX2O2WAOfljK442uXU
	KDbH7IZ/ujyrMWcejvrVo+TIyr9O9S/zn7X1a/KQ5nMkQwAIzrHesHLHk6TqX4aTIj00RTaknJo
	RHZSTUseC+spWO/X8MfFqXJOmZmdeXGXBGYrejkLr3G/CA2XcfbOYSqkxQtfCmd3cmw3LNx58l/
	bX1B+HIl2S+xBt++f6F4cmGmyQSbARDXpFuV9ageB8qlrPeZaC9qltU=
X-Received: by 2002:a05:6a20:a11e:b0:215:de13:e212 with SMTP id adf61e73a8af0-21f88fd555amr2079340637.15.1749618340575;
        Tue, 10 Jun 2025 22:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlfmx/FndYaMxUj1Mm8zVA7Xx2NEooQKaHlG/FisCHiAXfOwLHC3oXYqQPC02W8mtcz+1vmA==
X-Received: by 2002:a05:6a20:a11e:b0:215:de13:e212 with SMTP id adf61e73a8af0-21f88fd555amr2079311637.15.1749618340150;
        Tue, 10 Jun 2025 22:05:40 -0700 (PDT)
Received: from [192.168.1.4] ([122.174.137.154])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee6f1dfsm7587129a12.18.2025.06.10.22.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 22:05:39 -0700 (PDT)
Message-ID: <9b8ad81f-28e1-471e-a8fc-9e64578aaf4f@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 10:35:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: sm8450: Enable retention for usb controller
 gdsc
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
 <sy33khkakjxi66amjbuugnypjnegvd4z4dyfzvrp72qkuv3roh@dxaymdc6cfad>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <sy33khkakjxi66amjbuugnypjnegvd4z4dyfzvrp72qkuv3roh@dxaymdc6cfad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIYIEvNK c=1 sm=1 tr=0 ts=68490ea5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=oYmrSCt18pvj5yoFrZalCQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CUOy4OKjmV6SWOl3eY8A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: LOGcaFAzuje0UIbLWvOCGjOo4PScC7mx
X-Proofpoint-GUID: LOGcaFAzuje0UIbLWvOCGjOo4PScC7mx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA0MSBTYWx0ZWRfX7YfsjxojSANg
 NlEJYyxFPvPSgrXGpgXolcyZRANI8ptRdrkylXmWK/plKFUzupUmMifrC31mjgTeKL/zFMmnf+6
 ZiCZjedczT65AmY/H8KnThGcpM0U5wistKbc9dV7UFOEglc080YPB1v70EPIwUhfyaF8kjRNv9r
 jTwYyQkmTL39Rgl0OrIg7lC+lPzl6+xDWpd6nUBLfH2Bz6WFhdXRq+JKIIHkb0tDZNE/TuVZCAh
 4RRxhpAIXaP3HmXn8VoP0t8Te0JQQMfBa7b28ar9rbGoXGdmfwabECEy1WzbMLVDhc7GWkjssox
 t1iBR3sJmFW9Vb8ALTaIOZBqgzOCN4zmqatAKVBcDWjdBJMFQXFwMdT+VlFCW56wRRk6Wr3p8Fc
 veg1ZyqVZBpmCMuYsaiTGGZYVvjC4rGUJlzKIXUJdC14tqGmZ8DXHN2WPbKdszEjwNOd9hOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110041



On 6/11/2025 9:12 AM, Bjorn Andersson wrote:
> On Tue, Jun 10, 2025 at 02:52:53PM +0530, Krishna Kurapati wrote:
>> When USB controller enters runtime suspend while operating in host
>> mode, then wakeup because of cable disconnect or a button press of
>> a headset causes the following kind of errors:
>>
>> Error after button press on a connected headset :
>>
>> [  355.309260] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
>> [  355.725844] usb 1-1: device not accepting address 2, error -108
>>
>> Error on removal of headset device from usb port:
>>
>> [  157.563136] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402
>> ,iova=0xd65504710, fsynr=0x100011, cbfrsynra=0x0, cb=6
>> [  157.574842] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF],
>> SID=0x0
>> [  157.582181] arm-smmu 15000000.iommu: FSYNR0 = 00100011 [S1CBNDX=16 WNR
>> PLVL=1]
>> [  157.589610] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
>> [  157.596197] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
>>
>> Enabling retention on usb controller GDSC fixes the above issues.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>
>> Note:
>> The above mentioned issues pop up after I enabled runtime suspend after
>> applying [1].
>> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
>>
> 
> It makes sense that the BCR issue appears after the flattening of dwc3,
> but why would the suspend issue pop up?
> 
> The change matches what we do on many other platforms, but I've been
> hoping we either could drop the retention or clearly document why it's
> needed - so that we know if this should be on all or none of the SoCs.
> 

Sure, will try to root cause why we are seeing issues during suspend (on 
sm8450) and come up with another patch.

But I remember on sc7280-herobrine (and IIRC while testing multiport on 
sa8295), when gdsc was not in retention, after entering suspend, we 
would see a disconnect and reconnect of connected peripherals during 
resume (probably because controller was in off state during suspend). 
When I tested with RET_ON in sc7280, I see the re-enumeration after 
resume never popped up.

Regards,
Krishna,

> Regards,
> Bjorn
> 
>>   drivers/clk/qcom/gcc-sm8450.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
>> index 65d7d52bce03..f94da4a1c921 100644
>> --- a/drivers/clk/qcom/gcc-sm8450.c
>> +++ b/drivers/clk/qcom/gcc-sm8450.c
>> @@ -3141,7 +3141,7 @@ static struct gdsc usb30_prim_gdsc = {
>>   	.pd = {
>>   		.name = "usb30_prim_gdsc",
>>   	},
>> -	.pwrsts = PWRSTS_OFF_ON,
>> +	.pwrsts = PWRSTS_RET_ON,
>>   };
>>   
>>   static struct clk_regmap *gcc_sm8450_clocks[] = {
>> -- 
>> 2.34.1
>>

