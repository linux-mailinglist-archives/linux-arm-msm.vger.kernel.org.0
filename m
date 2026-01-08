Return-Path: <linux-arm-msm+bounces-88052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9708DD04147
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F8C2339E8ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A409E399A7E;
	Thu,  8 Jan 2026 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCXlvB3H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UkyRo/D3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3269A38735C
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 09:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864849; cv=none; b=u5td1ZbL6awHbNcY9dFoIT6RCK6F0UuklgLrTnBpWTBVOfu+NZBZFiGpdfmHCAbhsgQsYUKIAmEypFTLdqTeWGC4vGBjaIFdQptmMH2Po4REfQJXCwe5LlA2VVSB7sLLEqEwaZk+cbXr6XIyUSyec4JOE1vgFZF/rIIcgikyW7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864849; c=relaxed/simple;
	bh=gS/Yhv2jIPc52+WzNNAVh7Z4IQsEjRBJdMYWcF8NAhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gPC5zVNVIk5kNGfJU8SgIIQLihJ9VsoOWBHuo7YOxxnpNxcoaZ8uQ6LLPW9ksXfJiaTz/G1tc0qE502cIVuEwV6EM6HXYYPfloDn/iWHjeuhg0vV4vYjlydHCHxe9SuhuFxWgCVOriXb2kcXDjsncP8pPD+34WCqDeVVUeKc0Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCXlvB3H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UkyRo/D3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088wYRx1571617
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 09:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1DiYhb9ihKkjmA0sqtCTALf3H2WcBWrR3tqr+W2gaOI=; b=lCXlvB3H0Q9M29+n
	T8sRjEvgs27UY/I6JVuGM7Y18EfVFKBl3lgt4Yvw4wDV8Bdl8zrzvUVrgFVcJ+Ti
	RLtAYeKrvCMvodscvqBRNkEdn9A1ZEsBYeabmfXIWjuh5M5nvi/URxR/4zK/hW2j
	JJEF90Z/CC+jkyJdzxP4DEAI7zkRzRaMhWfsyopheA89Eku3z+FIeRBNdRNe5C2a
	dXyQwldc5KwY/SrNop2Q6BKI3OfynwhypQOGxnqxv7f8r9KubpFhWfitenfLmT3z
	/A/EfT0IO/d2mt9FQ+WgUAWicpL7IbHMZQwWxcJWgcyU5zLdL+WL1bgPOoyKTwpE
	QZ9l7A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj9hqr4he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:33:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a090819ed1so22677415ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 01:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864839; x=1768469639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DiYhb9ihKkjmA0sqtCTALf3H2WcBWrR3tqr+W2gaOI=;
        b=UkyRo/D3bD0Z+oQJVRhNQy6hTToesJ3Won+TRgtKazhDPJeiMama3AVel1jHUXVBX4
         RudK7VY/ff2s952l01Zij3+jJLK58wVruckCvyLYOvPtgUBVVyt71GqoMEFROYBjSMcX
         /7Sq3TRx/0IR2OYNzSDYpt1TxRGAt1EXujiccx9/QkdpZO+o57RIKqTUotooB2ncfneK
         1bLtMNWYT/MNx1tTcSN4+Ed29qHyWs+tsKn+tiRQVPFttlF/lE2Inuqd2lQQVi/5qKrc
         x12919k6hf2vhOGHJjl0AAWKCvvYdlXCsESRSk9NkXkgPtjVjMLSL2rgowilLCgPg9nE
         1zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864839; x=1768469639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DiYhb9ihKkjmA0sqtCTALf3H2WcBWrR3tqr+W2gaOI=;
        b=r4Ha1oEnRqEtF4nWLSCd0TE2K894L33aiFZbKDNsTf06u7pMux+OPYU4n1sNW5LHUM
         rAjZ9LsPBFuBfq9+6mk7rcRVsqnd0IQVpOWyG6W7GTsqCN+xvty4OZWO++6DMLWg0nOJ
         wdkPgng4inbSFnxTBuJkl2tSKsXLAc8Uf+EExv11U5tQ1hsnOdpdmTJYOjRy/rQY9UeE
         faeJ52TFxMr7Bi25bHhUWlb/qHZ+J8I1IRGyg6YcmT0EWGM7MNfCM82fDC0E8rLSRN2t
         irm3x3+s9ylAv5xcqkeWctYJy7j4TUWrPUjize2TRbpBzHs/Y/giX7a50+W5bTFh+Bvq
         0tdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt2REmp4yrNdbg8tvRdspWe8Hw75TrLRWZKmA2uKtk9Uq0u1Ss2OGxgTkJjLykZGhjqWGtiw51KYOAHfoP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Tp7DFaH1F2PgoYMGXQlifUL/BEwqcCIn59Vet4YiWKWVKXmY
	uutCa0v+c6QdPoAS1n0l/JgjTojv+W+gYHZOekhRhba3l25ZU4HgeRBPPYlkvu1qmLRqpaRChae
	okSWPaCfTVPkr4luqHVjdaPDbDNqhaWCQk2H9UqdgVf0qTDK/PNrAQp9gtAeQ7yJP6hgQ
X-Gm-Gg: AY/fxX5NxWns8yPiCkDkG9Aq461ZNN3DRw4K77KCX0D9zMmoMHL5JVYZ+EtiDNkTk4i
	rDH6RtsPrTVjRy5cXbfzWOK4LhSHf4HKJAPsUktMPuyNGaeC0HYk5AUhX0KzwzwPuWK3gJTBzVk
	1pJm6LweiaxQlODGi+xqtVAD1n4MBIlJdx0sUDX0zcQbMgkZHJxCjeM3F4yxae7k8XztV3WK5KN
	lgdEa/MDVsNy06f/DKoRgUSRaVHiAd8rpdJi60jHkDqBz962zNbcDByVHg9B/Firxl7P7i1z8ia
	rXK2oy2AADL2qWVm093CrxSwyINi1AI5tnUUcN+iMhtlXLP4F391d0UgXRKXRYKYTXyxwqttYpj
	NVEOCVYsqG+rAK93Bd82yujeAPMLiiZHvx4WOqhr0Ee48dL4k
X-Received: by 2002:a17:903:3c30:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a3ee437a5dmr51484145ad.10.1767864838589;
        Thu, 08 Jan 2026 01:33:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEaA0ClvObVURRXM5032yF9VA1oq0sdi1HK7Y/r0En0OGVnnw0/cXYn8b3u3Yjhv5blQBnhA==
X-Received: by 2002:a17:903:3c30:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a3ee437a5dmr51483875ad.10.1767864838085;
        Thu, 08 Jan 2026 01:33:58 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2de0sm74027745ad.50.2026.01.08.01.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:33:57 -0800 (PST)
Message-ID: <d5f4aa46-4c23-45d9-8c31-64d10245d913@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 15:03:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P
 LPASS pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260107192007.500995-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260108-archetypal-potoo-of-felicity-8ac479@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260108-archetypal-potoo-of-felicity-8ac479@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GN8F0+NK c=1 sm=1 tr=0 ts=695f7a07 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IbrVKMQAunHM5E1sM0oA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: y83o6GPnjicLOCyObp7vklt89zo0EBTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX1sPER8O5e3A6
 uWf2bcG1KksdXCfNWKpAlIspD5DbG2fwO8G7lqtDnbytxQR++2gbKsEgksz7hDuwtc7zBeYcwS9
 pkW/hvtvLM9E0J4uVYSWWbGoe0njgVfentLKdmh/V7RlrXDkLFHBpROYq/v23/PioPS34KhxxCu
 Pwg5ry+pWAv2YyABrlQGPXKD2xWqrqli1G91QeQwnCa5lJH964FSg3uparik6XPv2i6sht0mDhD
 /zDLiirLeoxLJZNz7hm467P1flIc7+ay32vNplejI7jp2VHPiI7EAVdsdqWuIg1tWN28kumyFAu
 355ZOyMdD+VLqgL0MJFUWRr+HVP0y3ihZx9XT2lJbI0fWNgT51k1OIOfgyzuRgTxJd95ljW0BbH
 6yWd4lqlAn+YLz2ZSZkUmGptxtu2d+5QWR6dHYx6TUeo1Li/MdY7WxqxBlkSqiPziZcRIuBSB60
 8rMwdTR5S2lKD5YVbyw==
X-Proofpoint-ORIG-GUID: y83o6GPnjicLOCyObp7vklt89zo0EBTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062



On 1/8/2026 2:34 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 08, 2026 at 12:50:07AM +0530, Mohammad Rafi Shaik wrote:
>> Add pin control support for Low Power Audio SubSystem (LPASS)
>> of Qualcomm SA8775P SoC.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/Kconfig                  |  10 +
>>   drivers/pinctrl/qcom/Makefile                 |   1 +
>>   .../pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c  | 216 ++++++++++++++++++
>>   3 files changed, 227 insertions(+)
>>   create mode 100644 drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c
>>
>> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
>> index c480e8b78503..bb1524243906 100644
>> --- a/drivers/pinctrl/qcom/Kconfig
>> +++ b/drivers/pinctrl/qcom/Kconfig
>> @@ -60,6 +60,16 @@ config PINCTRL_LPASS_LPI
>>   	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>>   	  (Low Power Island) found on the Qualcomm Technologies Inc SoCs.
>>   
>> +config PINCTRL_SA8775P_LPASS_LPI
>> +	tristate "Qualcomm Technologies Inc SA8775P LPASS LPI pin controller driver"
>> +	depends on ARM64 || COMPILE_TEST
>> +	depends on PINCTRL_LPASS_LPI
>> +	help
>> +	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>> +	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
>> +	  (Low Power Island) found on the Qualcomm Technologies Inc SA8775P
>> +	  platform.
>> +
>>   config PINCTRL_SC7280_LPASS_LPI
>>   	tristate "Qualcomm Technologies Inc SC7280 LPASS LPI pin controller driver"
>>   	depends on ARM64 || COMPILE_TEST
>> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
>> index 748b17a77b2c..b2a23a824846 100644
>> --- a/drivers/pinctrl/qcom/Makefile
>> +++ b/drivers/pinctrl/qcom/Makefile
>> @@ -39,6 +39,7 @@ obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) += pinctrl-ssbi-gpio.o
>>   obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) += pinctrl-ssbi-mpp.o
>>   obj-$(CONFIG_PINCTRL_QDU1000)	+= pinctrl-qdu1000.o
>>   obj-$(CONFIG_PINCTRL_SA8775P)	+= pinctrl-sa8775p.o
>> +obj-$(CONFIG_PINCTRL_SA8775P_LPASS_LPI) += pinctrl-sa8775p-lpass-lpi.o
>>   obj-$(CONFIG_PINCTRL_SAR2130P)	+= pinctrl-sar2130p.o
>>   obj-$(CONFIG_PINCTRL_SC7180)	+= pinctrl-sc7180.o
>>   obj-$(CONFIG_PINCTRL_SC7280)	+= pinctrl-sc7280.o
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c
>> new file mode 100644
>> index 000000000000..4579a079f7c6
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c
>> @@ -0,0 +1,216 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/gpio/driver.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "pinctrl-lpass-lpi.h"
>> +
>> +enum lpass_lpi_functions {
>> +	LPI_MUX_dmic1_clk,
>> +	LPI_MUX_dmic1_data,
>> +	LPI_MUX_dmic2_clk,
>> +	LPI_MUX_dmic2_data,
>> +	LPI_MUX_dmic3_clk,
>> +	LPI_MUX_dmic3_data,
>> +	LPI_MUX_dmic4_clk,
>> +	LPI_MUX_dmic4_data,
>> +	LPI_MUX_i2s1_clk,
>> +	LPI_MUX_i2s1_data,
>> +	LPI_MUX_i2s1_ws,
>> +	LPI_MUX_i2s2_clk,
>> +	LPI_MUX_i2s2_data,
>> +	LPI_MUX_i2s2_ws,
>> +	LPI_MUX_i2s3_clk,
>> +	LPI_MUX_i2s3_data,
>> +	LPI_MUX_i2s3_ws,
>> +	LPI_MUX_i2s4_clk,
>> +	LPI_MUX_i2s4_data,
>> +	LPI_MUX_i2s4_ws,
>> +	LPI_MUX_qua_mi2s_data,
>> +	LPI_MUX_qua_mi2s_sclk,
>> +	LPI_MUX_qua_mi2s_ws,
>> +	LPI_MUX_slimbus_clk,
>> +	LPI_MUX_slimbus_data,
>> +	LPI_MUX_swr_rx_clk,
>> +	LPI_MUX_swr_rx_data,
>> +	LPI_MUX_swr_tx_clk,
>> +	LPI_MUX_swr_tx_data,
>> +	LPI_MUX_wsa_swr_clk,
>> +	LPI_MUX_wsa_swr_data,
>> +	LPI_MUX_wsa2_swr_clk,
>> +	LPI_MUX_wsa2_swr_data,
>> +	LPI_MUX_ext_mclk1_a,
>> +	LPI_MUX_ext_mclk1_b,
>> +	LPI_MUX_ext_mclk1_c,
>> +	LPI_MUX_ext_mclk1_d,
>> +	LPI_MUX_ext_mclk1_e,
>> +	LPI_MUX_gpio,
>> +	LPI_MUX__,
>> +};
> 
> Isn't this entire driver exactly the same as sm8450?
> 


ACK, thanks for pointing this out.

Yes you are right, the GPIO pin mapping is identical to SM8490.
I checked SM8550 and SM8650 earlier, but missed comparing against
SM8450. Sorry about that.

I will re-check against SM8450 and use the existing driver instead
of introducing a duplicate.

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof
> 


