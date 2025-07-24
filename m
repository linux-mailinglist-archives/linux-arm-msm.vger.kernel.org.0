Return-Path: <linux-arm-msm+bounces-66489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1BBB107F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 12:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12EE01CE3A02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 10:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A62267B15;
	Thu, 24 Jul 2025 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDj68H2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C9926772D
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 10:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753353717; cv=none; b=PQvYxtThiTDvyGo+iKW+m9MTOTjJY9g+oCkLrh21szteAz/urwreTgWy5zy8j5CtroHHkvpak5Z1JjghAuGSvcVLv+Cf5v6olQgFES/I7H0CBnf1ITc4stDwFlai3ekIRiRZQRKnll4OuSHllU1JleUUdfLbBgR3tHDB+YnP1mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753353717; c=relaxed/simple;
	bh=45mxVuaLRc67oFbJfFBmp3p91vP0zbO/KNdSVJZ7lHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NpT05eunobPyJKa/4J4YwxDnLNbjVWAG88qT9RnIrbd8aY0Noawy6qXR+VvLSHdf/f+vilE81iwVP2OCHwnfF2SQ9N4f9x+HLhwjrurDrzlNLZ0866tYxHddN0zbqR7AqquCkGVL5acA7YbcDAu07qLwxpg+tiJ3A5/bkgOKF2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDj68H2m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9sww9018153
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 10:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h8c+hQ4SGUWWF7MgOg6CDaNDYEfThSf+pDJc/IkTmMk=; b=LDj68H2mJ4QU76gx
	FeTWzxShk0rMghYpScaiJEVC/Hkazps/jGjeXKM4grfNDy5/1H/rtlpJOFpOvR5Y
	nrion1dPZidgS4tbrARhgsPTJwVLLHbQiR+N2B97b1Gs6RafWrgNuLZVNWPTk3jx
	ZPlQdxwo5KhnIwdNm4BqgzeVxuIfht6m1qvMIDXofak6ONSjYalhKqCOLXZgPqM1
	Z+UeFH+LB6N8+qmkoDy+IrBtL7AEiYDCvnBIk/ZdkZ1Yfyluns/TV2fNVu0AZgZH
	qNbfVwK9UpDm1dUfqVqpZ+4WvMu/AlA6XdpshwXXwPm7NWlsOam4rjNwTzxaM9Yc
	oZU9jw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3eu80e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 10:41:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70708748fbaso13343446d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 03:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753353712; x=1753958512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8c+hQ4SGUWWF7MgOg6CDaNDYEfThSf+pDJc/IkTmMk=;
        b=uR+6jHAiQY57RA2rGI2/uZf+HOvjNppzkqVlIMmVALDaovKmkqunKgNMTR9G6Tx46l
         tAmJ57FSiBQaFnOf/MAxefo/qPvFdw22EfQu7ewEOy2lGXIOI0XfEa0zyHgF3jGM/OeB
         g9M2Ma6i4bW8y+LWxzzRmo9WJoUDHjc4qEXR44aYamhFUdEHghkTLpPdzHweSG8jq/Hd
         RS5usPRgiU0js7K1HjlnyOe4J7//Jyj2mtCB6zCoFPEGhqvjiyBfmNzc5jvxfMgrYvo6
         WPSgpkfxBMXU5uIfjZ8XoYAUJAEsLYeWCZMlOdEcFFzCDtpvP9CEY/93JaOI5f008c4W
         uLAg==
X-Forwarded-Encrypted: i=1; AJvYcCXtNsqISOZk4U6/3n/8pPJXUn7PRpXN7aLDHVzX9/EqdOuAGIXPvOFGaTRXWTunK4c2FUwbff3f+zbswmrh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/xPzMOT96QbOplQe7E1rbepEECE0FRwAbA5fBvfdbQ70WGJL7
	66sC8qUK3YDLx220EJoa+v0zetpV7mBBCGb+fY38/T0qGySh/v0GOsg3TyhrzST6JA7w+pHNfZa
	BhNRQe/TWSJHFIlZ6PYWEz9ScNM6c6DPIfqQkMJZ81B/MxmghCRCWHOrimXqzwv0/YzIM
X-Gm-Gg: ASbGncu1PnSd5ZtNBA3fWXoFo0tCAWCScMNYqWbv/w25MLYIPzgxKx16bC6G9bHvshx
	crUu+XBrVovnhSkwO+sm07TdA0MC8IJPWa6Gl3kez1MLpe+iHfJ84YXeZKYg41OJHv9kr4Po9Dg
	tqj6gxNz9F9Dz6ZAeh5sGbwmRQltK5+VY9f0S0w/SXdOq6yHDVUvUN2+7/M1gR3xRSOXLQAZsxT
	m1mUupmhvE7RD6tNxMS/HMxpKuwHjOPomvhOm8xXaqzp3RHyDyoxj23pR+cXGkAWoWQoGf2sCVN
	d/B8XvjF8knYPuahYP89cBxUC4/zUFLPEvqOCfPe9baer1YQMdbi0tcd0xxDJnPMPIY=
X-Received: by 2002:ad4:5cef:0:b0:704:8aeb:f918 with SMTP id 6a1803df08f44-7070058cecfmr82340646d6.6.1753353711793;
        Thu, 24 Jul 2025 03:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuJmYhWmwFTrg+fHs/E5rNOHK9w/JHH2Isep7h44OroNrmgC7EQsO7iUpSdkEZcKrPa8GQCA==
X-Received: by 2002:ad4:5cef:0:b0:704:8aeb:f918 with SMTP id 6a1803df08f44-7070058cecfmr82340216d6.6.1753353711191;
        Thu, 24 Jul 2025 03:41:51 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b76fcc2b8asm1790768f8f.74.2025.07.24.03.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 03:41:50 -0700 (PDT)
Message-ID: <f6c837cd-97de-4908-9d8b-c12d6cc4cfe0@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 11:41:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/23] arm64: dts: qcom: sc7180: use dedicated elite-audio
 dtsi
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250723222737.35561-14-srinivas.kandagatla@oss.qualcomm.com>
 <aIHi5uPxAtYARc7O@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aIHi5uPxAtYARc7O@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XU-FVlDZ6GBXZzac_zsEF976NGIbNzja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3OSBTYWx0ZWRfX30eH1w/FJkSK
 /53ZHE0FLxzpEEDS8eblR4i6dhkE/s2xSxgZyJ7SQOb1GwkJdtBWBP5E6/U9baSQIEDgvcm4VrP
 +lFiVlIEEPYAphEs13LoB4c/asTjTeSJtuFW8dCEMDIwRUo28lQXNub6ChVE2X8PBRJcseTv29L
 GN6kvpP6sBOzDxuun9QxOMB5RiUFn4WRlWVL35DbLyM4Cf9LijK/sNltP8d16hmM4YK23lzNDBq
 LnClCg245wsQg+NDPA1QrgCpPynhrQCJ/Xwm47rE1qFMOxnRSVKoKDs6O8mle6S2J6H4NitevMx
 rrCIzXSe6QTnBK7SryKcNtJeDjTaNpSC8FsqUOIyDprHB8ILHKvFPMzlTJoQ63IAJPoDSmxZcNa
 +/McHU41aX9T9Odw9+omMUaz6GSphXZLJk5kUmbKIxX/KRALWUxBcBMA/qNK8zmOy4aBk6AF
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=68820df1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=xLGpAxj0MuNPjuNy5_YA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: XU-FVlDZ6GBXZzac_zsEF976NGIbNzja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=665 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240079

On 7/24/25 8:38 AM, Stephan Gerhold wrote:
> On Wed, Jul 23, 2025 at 11:27:27PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> Make use of elite-audio.dtsi and remove the gpr nodes from SoC dtsi.
>> This move removes duplication.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../boot/dts/qcom/sc7180-acer-aspire1.dts     |  1 +
>>  arch/arm64/boot/dts/qcom/sc7180-audio.dtsi    |  8 +++
>>  arch/arm64/boot/dts/qcom/sc7180-idp.dts       |  1 +
>>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  1 +
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi          | 56 +------------------
>>  arch/arm64/boot/dts/qcom/sm7125.dtsi          |  1 +
>>  6 files changed, 13 insertions(+), 55 deletions(-)
>>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-audio.dtsi
>>
>> [...]
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-audio.dtsi b/arch/arm64/boot/dts/qcom/sc7180-audio.dtsi
>> new file mode 100644
>> index 000000000000..d6d41ba93195
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-audio.dtsi
>> @@ -0,0 +1,8 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +#include "elite-audio.dtsi"
>> +&q6asmdai{
>> +	iommus = <&apps_smmu 0x1001 0x0>;
>> +};
>> [...]
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> index 74ab321d3333..0e267b9fdefc 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> @@ -13,6 +13,7 @@
>>  #include <dt-bindings/sound/sc7180-lpass.h>
>>  
>>  #include "sc7180.dtsi"
>> +#include "sc7180-audio.dtsi"
>>  #include "sc7180-firmware-tfa.dtsi"
>>  /* PMICs depend on spmi_bus label and so must come after sc7180.dtsi */
>>  #include "pm6150.dtsi"
> 
> ChromeOS on SC7180 uses ADSP bypass, so explicitly including
> elite-audio.dtsi for Trogdor is a bit unexpected. It doesn't use those
> nodes at all.
From DT PoV nothing changed, its same as before, for ADSP bypass the DSP
services will never be up.


--srini
> 
> Thanks,
> Stephan


