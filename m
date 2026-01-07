Return-Path: <linux-arm-msm+bounces-87760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BF2CFBCD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 04:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD96A303ADC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 03:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B861C256C9E;
	Wed,  7 Jan 2026 03:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDlxSXkt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwQqZx5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1FE247280
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 03:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767755219; cv=none; b=TYqLdyJ/cKI3hw8XF5pezS1FLTP4FrnALgeUR39VH2XALpjGmG5NUGxaBtFoLyYYH+zlp+8rhyhyEyuXiV7bTcLdeZ9vXmd/TN+ygMOoMOU3Xe9EsHqVPvvpDTMlmfNxL5gJQl9yZH0qjsZE8dnNWveox0BM2gjon1UHqD9UcX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767755219; c=relaxed/simple;
	bh=wWG/+iM60aN6jRFY9oLk0sPaldjfqc6lbv5zT46e3dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2GCi0Xyhg64Ho7EcONPrZVcHOkwc5U9+O5RcusnCqhAysPAKXYOFTEt02StstPBp8O0shoQUrcUc/EJBYwqx9mi5W3yZKhC/wW6sSgPNDDHVNPZKVKUDZNrwdvgBpL4Se3rJfONMQ+8dti2YuS7fHEr90RbZK9DVXIbsnCLivU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDlxSXkt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwQqZx5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606J2A5p1462298
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 03:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/WCZqC1dn94RJMZksnlRPZYt/+qztP8BiWgjfVsWxE=; b=lDlxSXktCe52+TSm
	74/LwSRaXLPkfz/SnuQdXf18csy3SARG2UyW1yOV7TSe7GJhKxN1eGObiaLn6BZS
	EVkzjA/0z/SABcylValnf3PInfPtxTk23hUA8N23w33Dn82d3+8YURQp4Ya3L7GU
	MgyyOxFBiIr0hjOdaFQx/r0PHRT/oZA9nEN/3EFtNBTvlXmBhzB9rBVX340bNzXL
	OvUodKBle4ouV+KyXhr9tyEZmpQ86sGZKEbK/28ZwIEPusRBziBqTjPlEvoM+8bk
	M7/WF9dXXbKJrmUC5gizvVsaxx3gDNgmtyGvaqiHocs/70mAeXAEAfQJg4V5EV/7
	UdQiPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh0vm2je7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 03:06:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24383b680so661359585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 19:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767755216; x=1768360016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/WCZqC1dn94RJMZksnlRPZYt/+qztP8BiWgjfVsWxE=;
        b=SwQqZx5xAA+qzTlpaY6wH2k6GUqAW2Z6His81EaVTbGdFL6VqAGjdeJiIHqbtud4HX
         jIdHdTi3rzFFZf8kUWOUK9Pk4heejO2C3wYxCMmtpDhVhwk8diV/RgQttw7RlsQA/vPq
         uW72xBUt7LgAkvUcSwILmStH/6zyM8y9lPB61zBxyRMEVpJuj6Pj/e6+qUeBXI0DKZ69
         o13oEwFBk1x84D7YRkXNU3cMw6EdSK4TB0n6BJt92u+YYZ5nUAMxkvVqLtfLNpGhw+Px
         rXi6+Zm2xy/NNfuZHgyCOsXnEEVdtM4ctQw3KKMG6Z2Y2AjEhdYpJM0EkiiHXmTQHvz5
         9CXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767755216; x=1768360016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/WCZqC1dn94RJMZksnlRPZYt/+qztP8BiWgjfVsWxE=;
        b=FUnD3EUcC/oa2D9XB10mxeN56G4lYvXCCs3NtG1gAkTOew+5GpUCCCErEtxE70yUbx
         +n3CCazYa8gdxvDHk4JVoU1lPkqKbSo+7CEKeAGLlFfbHk7Y+ODU5SaiSA1GTQXuNFqr
         q68FcSVJrAhKGTvnlcbcTFPMHrJnlP7JetiCiGLWobASl0aQvKTJq9aLcRjrJU0RqJvr
         AmMx3Tj5wPmO6i/Cl9H+lm9t5ma1GdR+78+7bwMHphZbeYKu3M5dyuNdguQFdXRIvqIH
         5e12+BN9ZBeFyrNGlSZ2rcNyQmPV/DY718wZMBm/I1hvEWod1rB+4rk5j+ya6kWL1gTG
         ANGg==
X-Forwarded-Encrypted: i=1; AJvYcCXPWvzLV+/ZVxZ8MBcrsiLNyJN9cCXaPIlbMdqt5x176kXnBLUcrWjBiZYJ1KeJg8DepILyWTFLxdf/Qla0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw94dI367LE2do87fkXWbYE9w3P2s6T4IkWKZDwIWLgnUkxiu3m
	Plpxpq4m9zb8WMIgnK25P/W4RrM6JRQeVmwutW2jRHt3zbCSslynmxQ9mvJFxV3ni45cJu4rIGZ
	EV2RmemmjnIz9skNhDZGNJ38G3gM9Cd1ER5o7uTNaJwuPuvEQF8fZL9KBrzc5llLOrM3OnqipCe
	+dfpc=
X-Gm-Gg: AY/fxX7BI31i+ey31vEz3fC6WNwzQEnXRcZ+k5TcQ2rrzjNkv7mW/IHTsIBQowe/lp2
	gjFSgmMxkXYzmm6v0lxplfVFvsigJ/gh8TRcV/9nfs/jEw5XFCDGydh+wgUTb8zDc5N20i/yo/Q
	gutO3kdvNaHj4mfOSy1ebswZT59aHzXwJyNA7NJhajZC6GvZwk9dvTfvI18uehBW5zjxDIFXMGI
	+Uijv0YpgPLrbH7XsPCu8puuXdm7RkpgbWG1zdd+QTjHGxIKqN6O/DxAn88+ou52dgX/13nHG/p
	3h17EliyIKURq4SPYlMLT2qxET54ek06c+nzuJ8jfQqmlTjNkABwDB4eHWCj5hH9HMqzAgf9aH1
	ZQXb8qG8vsL+ZRZI6wzv8ktIs3BaJSpxNagIo9GUY/464y6f6SzokFQUX20TY5yaciARO/bUy
X-Received: by 2002:a05:620a:4145:b0:8b1:1585:2252 with SMTP id af79cd13be357-8c389379d10mr145747385a.1.1767755216106;
        Tue, 06 Jan 2026 19:06:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkrbOP3pew5z1yemj/keUd/L05CmKhUKWFQIvhbUiGyiMtZnJ4i3zNlrw2hEVMpdT9iDsqzA==
X-Received: by 2002:a05:620a:4145:b0:8b1:1585:2252 with SMTP id af79cd13be357-8c389379d10mr145743385a.1.1767755215591;
        Tue, 06 Jan 2026 19:06:55 -0800 (PST)
Received: from [10.38.247.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907725ffc7sm25347946d6.44.2026.01.06.19.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 19:06:55 -0800 (PST)
Message-ID: <ac431daa-a9d1-4415-929b-87c1b9a08f0d@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 11:06:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Rob Herring <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
 <20260106192609.GA2581379-robh@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260106192609.GA2581379-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pa3yRyhd c=1 sm=1 tr=0 ts=695dcdd1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vx6dLVQq4s5TLBKspagA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JRhqtz4wcsljyT3yonU8lgViBT0Ql-9i
X-Proofpoint-ORIG-GUID: JRhqtz4wcsljyT3yonU8lgViBT0Ql-9i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAyNCBTYWx0ZWRfX8m7v62cSASJi
 GFRxRlbUpGnvh+m+654kQi2vdruHxnCA8H98JblRkRMrE23RTC98pK3f4zarGxK2JNqo4bV6cu7
 ULZJ4Ejagf1yuxm/U2C6WQUfClN3n97kQBtFa118eAZaapdOK5WuP4KZ2LbNunx2mZdC+OeJM02
 6tC9w+RLS+5IWf7ztDLHw3ExiZitGI6dQFEZufba4T/FZEPP1BqhuqTHF6s7p5fgrpM1g8SwkHg
 ZxiHk0oxw0TPA+3RIsc1iBO7dOxGITm6zD4LJF5pmk6krFEkD/YGlvISpDBzMuPXFs+yIyvI7Dn
 IIEohkl2ynapFw2pGJ54eX19uPu/EWhf6zdP7Wv+G4RAgU245MNBDOeyZaicOzzXkwojIvexRkk
 kq0ivv22VgFOG8hPWdNhxQHxUzl5mX7tma33lI6xIUhF3760WfmTL4LGkNmzRm5ixoFUM1ixXkd
 Gds//TheVpZW/6gFQzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070024



On 1/7/2026 3:26 AM, Rob Herring wrote:
> On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>
>> The Talos EVK board does not include a camera sensor
>> by default, this overlay reflects the possibility of
>> attaching an optional camera sensor.
>> For this reason, the camera sensor configuration is
>> placed in talos-evk-camera.dtso, rather than
>> modifying the base talos-evk.dts.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile              |  2 +
>>   arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 ++++++++++++++++++++++++++
>>   2 files changed, 65 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 4258776b71bdba351de8cefa33eb29a0fe3ec6f3..bfaa0b47ab5cabc9aa1c6fba29faa3e6fd18f913 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -333,8 +333,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>> +talos-evk-camera-dtbs	:= talos-evk.dtb talos-evk-camera.dtbo
> 
> You need to add talos-evk-camera.dtbo to dtb-y if you want it preserved
> and able to be installed (via dtbs_install). If you don't want that,
> then why is it a .dtbo?
> 
> Looks like other .dtbo's might have the same issue.

Will fix it in next version.

Thanks,
Wenmeng>
>>   talos-evk-lvds-auo,g133han01-dtbs	:= \
>>   	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>>   x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb


