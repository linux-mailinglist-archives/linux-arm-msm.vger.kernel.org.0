Return-Path: <linux-arm-msm+bounces-79523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A3C1C487
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCE3E4FA75F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD1733B6E5;
	Wed, 29 Oct 2025 16:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jurMUHDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xp4c7do7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1685733B6E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761756191; cv=none; b=IzrKfJIF3weh4Y35WrGI80qrtxfpfWnNjchIRIZj5UeGo/SfwoARidmIy3yDz77fnKzpRc5GxU7zsfvFr4SXGMyY/g1/aEg/7Su7AQYKI8vCWxWsxCHfg9jkLUkivLwaOoM+Fgl2gD2K73MtmXZ69fiFBryITy8Qkl/grGxLb44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761756191; c=relaxed/simple;
	bh=CMWQj5jtGtAgppiK1n11UOBvfGJAKubZbQAB7EpoUA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uN3hGGm9b+7LqyOcgLTiPvBg553IYbh+NrVUacW8fb3/apJcTeamtKYQ6TGqaG91otrj1cYllwc9CY6a96vl7wB5+gX0H6p5oyyLzUrj3WI/A9/i+Udf7R3GNV8DxyZ6Ds4dRMFrh2BIv9+w36VyeyUjnm4iaRWDx3wXwFuD6z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jurMUHDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xp4c7do7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TCBxdq3692519
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YxIKHvu9IRyd/kr31TQ5+bn3d7b2acGDQxHpx6QiFGw=; b=jurMUHDUf/mNomJa
	+oeZhdG+83i+F9+e+daqj3ssXJGeXirYKNx1u5hIov0RBJSXrbYf5MNDxSmYBTy+
	z5VDwtI3nXmbitvuF4hOr5XGdm8kXpmMFYePm+iChGdGrfne/bEnLFZC+ctmCZmZ
	SCK8zEP6JoFcNZrQKO0fuD9J/xedI4lR7N/85OaAfWTLBuw4QTWI5qliV7S6RDVG
	Z6tfQoptPVHLvTFxiKJqRw/WAd7IevjU99fQo0vRDyAMZSaJYgMJruhXGkjcIh7G
	cECyCPQ0833F7+feQ/JbCBWzlRyHyK6TgYOPpG5mrJBfLK0e1VJafSC8w125m2pr
	L4G/4A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2kbs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 16:43:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78117fbda6eso89213b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761756188; x=1762360988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YxIKHvu9IRyd/kr31TQ5+bn3d7b2acGDQxHpx6QiFGw=;
        b=Xp4c7do7fPSwN5tGsalx1vBkHfecOw3mzsyAZ3zc2cbzZLHzYatllliHdBli7XpkZG
         RKbsvo2hHFwxDG0P9lG0x76jGxZl1T/WQvT5nC4asvX8dgZYbvTgspaVYodIxhhyhAbn
         JSKFUK3ujun79RHbmH8U2ofXdbffznsJvzeHhrpbVXYHna+2lQUP5frFtX+vlHd8rpnM
         IqHLTNGWBCW/cKLH7S9aw/esOdIYgwYHqXllVzYxGAVEqFu4Eh8gcciUK0d0ErBI4UJ2
         eDUVnYBWOzvPVuNjcOH4q4xzoHIkJe9LBgYCrYUgkHs50Q8+5maKVDeJDDzstPyXthb3
         bgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761756188; x=1762360988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxIKHvu9IRyd/kr31TQ5+bn3d7b2acGDQxHpx6QiFGw=;
        b=Q6Z3AfyeLdO8EHEwG3/CTHr8ifIbB3kA6mP1TG4LE2pp7q0tANtc7cmIo67+gGfQsR
         T0L7oKqy3HCln1pypj/rGoH6MdvhQgZkawcP9PB57Tx2K2QZ8BeGSeIzGN5+KgiO+AsJ
         ZFLKTS+wSmrtCdkeOggJTjRWoWpDu3KGpyq6PoReQpI2+y9iWXJ8mXvNyhnK0mm1eD1C
         B0e4A+0/OtITs1y8r4d4PRdOxXvRkzAw344Y/sOKC48byBd6OUgSdr+Q+uelN+B1HZAN
         08taNnHatFVlmFg/M1yZIl12k22kxbEA9BA0pVzfz5NTerOrOVsex1w7T6C9wrewMVp4
         gH0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi5bns8DlxHYFDKYBILZc1eMOoNfYry+2JmOTkA8XGdma4MGOlMoOsfW7wFzrFNrKdAS9s8h7Y2Zkk+04S@vger.kernel.org
X-Gm-Message-State: AOJu0YwNXkVcGt2CjM3nn3J9gRNB+S1UBGNObjeZGPuxtjbCbd/wFKiq
	4500bkRBRFzQ8PmKezuUsBeB4xbdsxAbKYnHcOEMMwVVYGOO0ma3QulfYByJ+Z0AvVwvbe2fOt/
	lM7FfcQakvBiVLJXhRu2tPtp/1ELhAzJT7G5jtB5mKQUqw29ezgajAwHogKLYzqDQ8Zbh
X-Gm-Gg: ASbGncshRgLSJob83Cpx2GrFCumBkmc9RyfRwhRBrugpAvuwkG1AKr4QUDOxwKhc46x
	GusI1qtZe2ddbaBrSEGgImyn2YkZeZ/vw/mEoGWbUmQIhAOlkzjQfrdDvcq7WnnJP7oOA72yUBR
	h+gRpave8LJG7mSB9tq1xCd8yhD7IQY1sOMbdDGCONXlQ+uWW3Ckd3lU0naz5D1qZX9nkYKglTm
	omNoP9kTF5PLltpd4UfPEEVghdRDNoH2MVryewtqlsh2uVJxYn5WOSG4kgVgZ9fsfa/pmbK7WPu
	gM+2bcK/tFNF9bX+PHAPBGaFZPCMQmWpc8k0XmJWguWeFfalx1/tcbt4dboYZrW3S3aQkCQInZm
	TwTQCTYQiptSILmQvta+LEpkgVbKP96cq1Q==
X-Received: by 2002:a05:6a21:3290:b0:343:68f2:3728 with SMTP id adf61e73a8af0-34653334edfmr4521758637.15.1761756187889;
        Wed, 29 Oct 2025 09:43:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa6T49KpR+tP4OKn61E0XyxYqkZWJ0/qeQQmMiqapSzHCPzMBLcjoz5QGBVzIZXALq+pjJnw==
X-Received: by 2002:a05:6a21:3290:b0:343:68f2:3728 with SMTP id adf61e73a8af0-34653334edfmr4521722637.15.1761756187354;
        Wed, 29 Oct 2025 09:43:07 -0700 (PDT)
Received: from [192.168.1.3] ([223.230.47.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140168f7sm15655726b3a.11.2025.10.29.09.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 09:43:06 -0700 (PDT)
Message-ID: <bfc126ad-1443-4b9a-bc8d-3619606294e2@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 22:12:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
 <20251024151521.2365845-3-krishna.kurapati@oss.qualcomm.com>
 <r5zjb7v2ngsbx2y63tmdhnm4gbpla5fki4uzpjhvn7sqmzsqi2@7637rbudt3z6>
 <469fc3aa-9b95-4b30-a704-d568a830452f@oss.qualcomm.com>
 <vmtm6wy2ldvobgl2o7cqdtknyfg4fup2pqpddkftnhzs5tgqrq@vbo4j2gmr4px>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <vmtm6wy2ldvobgl2o7cqdtknyfg4fup2pqpddkftnhzs5tgqrq@vbo4j2gmr4px>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hKHg5Lb9PMNIKIh07kSsCUhz-VozwJFn
X-Proofpoint-ORIG-GUID: hKHg5Lb9PMNIKIh07kSsCUhz-VozwJFn
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=6902441c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Wzgei3/ilxDouSaUxftnwQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FR6T9U9chX6Biide38gA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEzMiBTYWx0ZWRfX1PHzER1CcXGV
 TuHLW2xzYVdtci0Gp6kUqvrj2hk9F+rhhgXTjiJeKTgPSY4xY16Wkm/pCOkC3JE3S9OuclJDMnj
 f9rfnis0hn8OkanVDU++5QWaPP3+on43GSWmY3QR2bL5Wy2n7TvtaF9Ci59ppXivReLo+2Lrcbm
 7yoVD5U+94luOeurTU35zOu/t4fduyLxSNSs1lSKp4mAtnEGUFfHIpiMAPB4T4356YCPtBNJP6e
 mrXtWJtzS5yb7ULwamz/yZ1Moe9it8g+bkGJEPblDPZLsvwflt+ova92OEdoRE1N15SPdLK29xk
 u523HXi2LjaTYXpWmGwHi7BY08tsRZfZcqM2ru40NI8e7KCzOhdllqvN5o44mNX5go8Ltu2ZrNa
 BIh64RtxuqS7H3OtHGZXTUd0pHXAAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290132



On 10/29/2025 10:04 PM, Bjorn Andersson wrote:
> On Wed, Oct 29, 2025 at 09:20:48PM +0530, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 10/29/2025 2:45 AM, Dmitry Baryshkov wrote:
>>> On Fri, Oct 24, 2025 at 08:45:20PM +0530, Krishna Kurapati wrote:
>>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>>
>>>> Enable USB support on SM8750 MTP variants.  The current definition will
>>>> start the USB controller in peripheral mode by default until
>>>> dependencies are added, such as USB role detection.
>>>
>>> Which dependencies?
>>>
>>
>> Dependencies like pmic-glink and adding remote endpoints for otg support.
>> Till they are added, we can enable peripheral mode.
>>
> 
> But this is 8750, Jishnu got qcom,sm8750-pmic-glink landed in the
> binding 9 months ago, so why are we spending time discussing this?
> 
> Why not just add the whole shebang at once?
> 

Initially I didn't add those changes because the series already had 
acked patches and I didn't want to disturb them. I can add them in next 
submission and send them out.

Regards,
Krishna,

