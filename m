Return-Path: <linux-arm-msm+bounces-67711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F11B1A916
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 20:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B46F188FCFB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 18:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361C922A808;
	Mon,  4 Aug 2025 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="laDINb6t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E792264B4
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 18:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754331532; cv=none; b=II0USITFOfPLB31azOn2+eAfdWXGOf6DCvoyFNUFX4vgcLgJWODO3spvZM4hd3xiGpMJXszibbhJ7NXJjxtB5rhxriYVoUl29VI8MTOrcsQhIQMXYTzY5I1TyLXAMRy9PslcAmvFufTJufVddBqDkiebD/LrqzKRNmBP72pSRRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754331532; c=relaxed/simple;
	bh=7K1JJRpveNfg80TmuSLcXf/fCpRuzAmUJgIt0nUbHmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pa5PZvD8Rf8pDqCvZGO+iruMYVtpGibq0B8zLwOPFihoOp0nL5CptumrwjFhTAYEBALIkcqFg6y4+T+lD0Z+cMjts5sW0XnNYabuvZolrHyn8KKCuhvMG2xaeY8uOr7qGfuRFL8qhDdDo0SVJqSibIGzomLCH21ng0H/tLIBciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=laDINb6t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574GAdFN029274
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 18:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yt5mi4p22WNYCmgL4pLlpxDR0rYiRxhk5KHLynsxrC8=; b=laDINb6tmIBio3vq
	zkPKbr5L7/spnlTsUkP3s/Ahthc9e3X0OrQq5SZVTZf252MK/6NrNHa9OaYkzxvL
	2VvaeQufjQC/gK/At4GQrH1bRSAo+vODMYjpGYbyTFRXrmuJXaWTsCZRzTCpZoeZ
	rMBQxbbkkBTgui908nWVOC5nGQBxWd/yhoeleOJeDJ86kvg7wWhBaBfT1I2GCXA4
	jq35LeNNL+3lAhxbYOPO8VP6j/dqvuyyzVYhxbuppP1AgG8u/qDdKZhoBjHP5rBy
	HQNGJfRrYqZ6xU8qoJPEoMkP8s1zVpUs88dHeSoI01/+uG/IywDap5cvw5L//2oK
	kc/WNw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke43cu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 18:18:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76bcb53711dso379191b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 11:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754331529; x=1754936329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yt5mi4p22WNYCmgL4pLlpxDR0rYiRxhk5KHLynsxrC8=;
        b=aMXK81MSBkl+jEBVTUlBUWv8vvQLMa2RkvwlOOaUx1qAoTi5H7o9qbC+M+H+3BIJrR
         zNTfdt8W3cvot8kjqbfAh6vNOOj9X6icDSj5aBWzBXMoeEdgSJBYzRWHZ0ZFCJjOXMD1
         uTLWAAh/z0aozLJFPGU82ROlOQkLhDemrTS0rB2IdJa7aILXb6R0bA70GxcGTqAARlZS
         hPY+DQTRelV6PNjjk/JrO2qgKFgYea7YidhBbTBup77dCdY0yKLOvb1W0s5DL/Vh82Qi
         llggS7q3l0c2fkb3x2i+/Oq2Rcsb/dQsm13lSsTEkP6oa4tVddmOurv5gQL1GmD7o4Nv
         CSIA==
X-Forwarded-Encrypted: i=1; AJvYcCVPTOZeGMz+iJ/RvQSXRwLQw8oNY7yHf3lcECWYdPwrcfGCoUyg4Ach6O7iPCFq7AT/oX4Ej56oQDuc7Nis@vger.kernel.org
X-Gm-Message-State: AOJu0YxZfSc7en82EQX7dsSmyWg3Xgi6XNbSgiBaDkn6aU+REAtG/INa
	qWi4M5kaWeaQEY1MymsxA2SliIB0+m29zwxPfw8+PS+taIb1wfJhP3OdIXIdKVPHxuLmaY2Klkz
	++4GpAHWDbypmLRla1X6Ks9j3Tyg73jan9DkJXudcilycd9Ny2PrsQy2vQe0JqtZ2N0J5
X-Gm-Gg: ASbGnctfCRiplfSnu+T75Zl4JizM37Oruhn9Z2MhVqPgbKCbLIC0ZkiWGKi/qT6sWuR
	AFl4EeLuvcIBWkBTJ/whk/AWyRsxcdHtvecBuF5XEV5nQ4Kd+QYdnTrTIvqaV8i6BMkh95TRmOu
	dTdWxGa6v4gJm+sjr1m2+epJWDmMHgaJUJ2hjPXKKEl1Ta4P3CJZWy4IQIHiy7R3U8vAuSvhGt5
	zT2H5rmh3ethIstrh32B0d/4TzQU7yxcFLowCBlTSLFnshxpB47CJ7X5uxAteJraKDjRhfIXUro
	fwPFWHYZTch66PmcC+A/PCG8JX2/muyBjA79iUQccKUB85h432yx6L7bD6UU6YX0MGubeucwRJj
	l8+5tTbCU+ZnEqWE5AKgoxVXUoHEVu7Ht
X-Received: by 2002:a05:6a00:1d26:b0:755:2c5d:482c with SMTP id d2e1a72fcca58-76bec47847cmr5134767b3a.4.1754331528625;
        Mon, 04 Aug 2025 11:18:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvhGBzOxgi/xKVgQhhPoJg28ueZWZWVcj10/Q+74coA0plQKiU+Q2o13fdZxk56/jThGn0Mw==
X-Received: by 2002:a05:6a00:1d26:b0:755:2c5d:482c with SMTP id d2e1a72fcca58-76bec47847cmr5134751b3a.4.1754331528192;
        Mon, 04 Aug 2025 11:18:48 -0700 (PDT)
Received: from ?IPV6:2401:4900:1cb5:a9d1:15b3:77df:1800:1497? ([2401:4900:1cb5:a9d1:15b3:77df:1800:1497])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd7d1sm11162496b3a.80.2025.08.04.11.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 11:18:47 -0700 (PDT)
Message-ID: <588f29a8-827f-412e-b525-a1bd3f6c2d87@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 23:48:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: Add Monaco evaluation kit
 initial board support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rakesh Kota <quic_kotarake@quicinc.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
References: <20250801163607.1464037-1-umang.chheda@oss.qualcomm.com>
 <20250801163607.1464037-3-umang.chheda@oss.qualcomm.com>
 <4rxy4iuqy3dstfuv744gw327gf5n5g6notjpmkspjme2w4sd3j@5sbqfoumb5y7>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <4rxy4iuqy3dstfuv744gw327gf5n5g6notjpmkspjme2w4sd3j@5sbqfoumb5y7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J-phLRqIfJq-zbJa1qEbLurpav5Ksn4y
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=6890f989 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=-WHn9-XdheHXZOC3f6YA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEwNCBTYWx0ZWRfXzUzc/xk7S0xp
 TfJw27fimdL4pXAowKrihGUeYmB1LYvafhhSag47M0FwajpIjQCxKCiSshKuUUqUtg8HWyb/v3t
 WA4QGZ7OJHekNY3uHcr69sNGvAhiDXakcbbK6PfVWUJ3zIuR1xZJ6ggjPun4Io46OK08/R1rKey
 OvNV+JCfRIPj6lIzUBzxTdWg5ch6+NrzzL6hZhylTgy2VWmiwg0gnGXIyH4y/vqzgmGXyoRMSZ0
 52MEPs7442/YUYJXXDqs1lqHUFVgydB5WVqXgBbomaWFLA83z9xyh/uZz83ZlW1BF/DiJFpzRb+
 yxpCorJZjzrg8kLfkb/j/GJkx6v2EhbWitAAo3/fE4tYfXXA3uGvaIl4/3vH5WLsJCdQ36Etfac
 Zciu6NWvgyibcL0PUsw+/4Vppn3r18kG4ymvYQ6rz+b37Jqexps+5EIO7RyEcAr3HI0TFmas
X-Proofpoint-GUID: J-phLRqIfJq-zbJa1qEbLurpav5Ksn4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_08,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040104

Hi Dmitry,

On 8/1/2025 10:44 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 01, 2025 at 10:06:07PM +0530, Umang Chheda wrote:
>> Add initial device tree support for Monaco EVK board, based on
>> Qualcomm's QCS8300 SoC.
>>
>> Implement basic features like uart/ufs to enable 'boot to shell'.
> 
> "boot to shell" only makes sense if the platform is new and not all
> devices are enabled in the Linux kernel. Granted by the current level of
> the platform support, DT files for the EVK should have much more
> features. Please submit a full DT at once.
> 
Currently upstream aligned changes for other peripherals are not yet ready
for this platform, hence posted base DT support, will subsequently post other patches
when they are ready.

>>
>> Co-developed-by: Rakesh Kota <quic_kotarake@quicinc.com>
>> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
>> Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
>> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 199 ++++++++++++++++++++++++
>>  2 files changed, 200 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 4bfa926b6a08..e78f56762b6d 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> new file mode 100644
>> index 000000000000..1e0635c93556
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> @@ -0,0 +1,199 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +
>> +#include "qcs8300.dtsi"
> 
> No qcs8300-pmics.dtsi? Why?

Ack, will add this in the next patch version.> 
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. Monaco EVK";
>> +	compatible = "qcom,monaco-evk", "qcom,qcs8300";
>> +
>> +	aliases {
>> +		serial0 = &uart7;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +};
>> +
> 

Thanks,
Umang


