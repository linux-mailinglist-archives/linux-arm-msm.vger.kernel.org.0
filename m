Return-Path: <linux-arm-msm+bounces-90896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBOJGm+UeWmOxgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 05:45:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CAB9D119
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 05:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34ADF3006395
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 04:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA352264A9;
	Wed, 28 Jan 2026 04:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVOnesXb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XQyyrRWs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C795B5AB
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769575532; cv=none; b=tb/pwby+fCoAgyCe/MOFJA5d3uS7dil+/dkygwyLKhn5W7SYzOLaUlyZpTbYdchaqa+zDGrP8fb/4riLajC96Vk8elT+NJoUxCCUlp1vvuX/SJ/tzrsNSa663EhdVhTkGjUkHUrKriG6Y2Z9ECeHk7jKOmMTamib2xpPaML/aMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769575532; c=relaxed/simple;
	bh=qM7NljjhHdYDIhu2MSdg9x8aQktTixlDl4gatJ7l52w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KAhIHVv7YytHIV2ll3BPlngv68rg01umw7smMy/gE4/V8WSe/h4MfXT3C8n98s0uqUEdQYn8hjnokYMmaLjSK+Ch7wVYonudO0YaDUpajE7qIDvb7IVpC74xpuvhFNl7Pc6icGh62gfpTD2w9exifV5Z8h79wkcbQ/1CpOd82D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVOnesXb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XQyyrRWs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S3X36X2728735
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	auJ/PlTRhtolvAGmR5TD2Sx0KYFDmugMFWIX8xUnYjo=; b=jVOnesXbbpKQ0KnE
	9TCVoaRmkCIyfFXLFaVkBHaFGipX/koCiqohkfMziGZ/WrQIi4kzxuYNpPCM6Vsv
	t3k7oWybCCsKvHwEloiGZ6joqtWktJTebvyOkQM3cMIqX1aBdGFEYWL5ioZk9TPa
	ZJXi6CvPa2AWPLDvP7jwk48BrcMVX2MRGh35NzuRq550WCNoyj8p6QmNSun6WE/T
	NeANQPfT1+KK2JXFJGm/1cWtzVsinBxu6rd1tmkXXVdVYql/WwIZtO7cog+cXjkk
	5A4oMOq8GJiWsnvLCrq5zbBKlL4jwzyX8uKWumvqon93sBwYhls7IYDAMH8+HnuD
	E2t2ww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byanag5qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:45:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7a98ba326so8843875ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 20:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769575527; x=1770180327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=auJ/PlTRhtolvAGmR5TD2Sx0KYFDmugMFWIX8xUnYjo=;
        b=XQyyrRWs0sxL41Z1vJIgaiKoaxk1Zq0+GXe/eg9e58FGxT/+164weWulD2Zu5e9n9l
         /ydBG3pD6klCi5aa18Dki8lL4zNuH1xk4zGBncwTM+CRFTgE0WwX97uu/cXMTX02ATv9
         ymxeWgvlCXhOgdoZGwUD+XuOwMRod8ReNr/XT86oho5GfkU6pCP2tBPeSYVXWY0knoYc
         9tacRpwOKvOk6eAvp2jCRNTrQiHsonOBmK6t/gjv66Oc/P5sJYHzZTH43BMtSnzO2e4u
         ytq9pAk2A8syCIO1VzJGjJgelVKpvoQ+HiQVktGr27OccyrgnqiER9AwtMIjPYOhGpPJ
         JKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769575527; x=1770180327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auJ/PlTRhtolvAGmR5TD2Sx0KYFDmugMFWIX8xUnYjo=;
        b=DSL5JEjCysrLUvU3oJquFs3ei7SIpwyTqsFLGyZ0RJDHUQp1/W+5dmh23QT/Jmsyvt
         LSV+ozlNlyUnM2jrNNdOUcvprsCup2mcvhN5KX699n2xqgd4O53TsICr02J4KiFJFqHS
         ka5CuQWs1JubCzQLoW5d2gtkG09OzqA1cvdXSXZBxkTQm2Svw9vhQx0o81EzTQw2rJa9
         D+ILZqHmitH6rrYkaO8MYC4zvzMYyU92e9Jy4EbtK7F2zNNV0yXJdzoRzYGLmapijBr8
         Q+JPVv18EyUeaLU+E5ywv/AnqkhPwE/TkAhh+MbhZHIZZxbgc58k2tpJfpDSRluzaNDe
         X7pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrLvAEWjURtzWmBcY04E87+g0EkVPeYDrFRD5MSet2YON40e0qCx7ilAoxNE0HHcTqqMCw/iNfY/9MgXay@vger.kernel.org
X-Gm-Message-State: AOJu0YwWhoJVWRJrCBVRYmy3Fzykf+YJ8KPNPQFmLkYwth5dmQoV8rM8
	/jN7PTxBtSCkC5dIaErcIB0XLbbanb7lg+z86ob2xzgbYEuxEoXg1/b36Hba/XYgDs1MdjlLnQ7
	le3JShBcyrqiBkaN7Y2KlGtmZuVbGOX4JY1IxaO8b8cx51pNfDfv5y49OCdi/xYXYQhus
X-Gm-Gg: AZuq6aKMwWilSIpLD71bgY7dtCqnojnkqA2zg2M0i0WxXHXQZPGNpBD0uBSAncUkyMw
	N8Xvv5nV5OpaSMPmYJ4PHzcek6iOQUE+ulzJu4F47+XiRnA71W7afsgjJJctzJPjp9GywvS13D1
	ZskbS6K3i8Ta7BIYsNkw02qPZduDfuFdxxLMYpIH33mAiLRYvQdI7GwiZM0lp2hZdZ39TLvBObT
	zFJMA+9c3f8K0huty+dUPA7n7PbZ9ZqOZ9Ld+ligoCYYuHRzzJaKwnIlsCgkzrrosiP7J5Ly+zH
	H0JF0IAMWDTS9pWNPeAT9gZSQJ29sOzXSP/aRGfdXjXO8n/CpeXRDRkEJaJVB868gYHorWGtZcx
	gG6LevR8DZJOlVpOojp9ia0cihuK1ukuJYG5fbg==
X-Received: by 2002:a17:902:d512:b0:2a0:9238:881d with SMTP id d9443c01a7336-2a87130a499mr42154425ad.15.1769575526126;
        Tue, 27 Jan 2026 20:45:26 -0800 (PST)
X-Received: by 2002:a17:902:d512:b0:2a0:9238:881d with SMTP id d9443c01a7336-2a87130a499mr42153565ad.15.1769575524765;
        Tue, 27 Jan 2026 20:45:24 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d9a7bsm8701925ad.79.2026.01.27.20.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 20:45:24 -0800 (PST)
Message-ID: <8c4c24f2-0fb5-4a11-a315-5fba196d409b@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 10:15:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-5-b23de57df5ba@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-5-b23de57df5ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fvIiYqz-Fkw-Ag8fBhr3ykDFPXraFU7k
X-Proofpoint-ORIG-GUID: fvIiYqz-Fkw-Ag8fBhr3ykDFPXraFU7k
X-Authority-Analysis: v=2.4 cv=N58k1m9B c=1 sm=1 tr=0 ts=69799468 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=t6YGDF_9UKWoJj6e8T8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAzNSBTYWx0ZWRfX1Ebs+dUV2kOu
 ZDJl6fioi41og8Xml/TEnKAix+/4ewy7SnQpcPZeujNpsiPmncopm4uRrMYMWYPc+VSmYx82mQG
 kfzURFhWVq1A2IbV2drMebZ3cthabYOU1WW1e1t0qDDjyKBeMtrBbh9qcmcfYXRRW3GIUEHdNHb
 eUEX0j/hQL7A2uezJc9pLuLPnRzqKh2jkHtoZJY4AU0JFey33unEPjV4rlDrD97blEGaLUQ1pzj
 lcE8RFBHr6lZ0TUaLw02kU2HFRIgFIWhig2FzH0dCwDrb9r44cIvf5wShkc4JbwAjrioL88dMEr
 xlfFX/Aa44SLZrsu3zpaKNeCGh51CBmOBzSDW4POH1qIHVXN+DOa/qOAZmHDQewDyNOHfpazffG
 90DzfBbugoX1Cy9nOcAG2gZ9FPlS8cOnYp1N7yoepazMnVxwTLmW2aCxwt1kz2WI+OkD1+hetL9
 qW3Kb35UwXakKeIke8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280035
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-90896-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81CAB9D119
X-Rspamd-Action: no action



On 1/28/2026 12:56 AM, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on X1P42100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          |   10 +
>  drivers/clk/qcom/Makefile         |    1 +
>  drivers/clk/qcom/camcc-x1p42100.c | 2223 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 2234 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index b1b1ed70871c1b348985d6f5149152e57637d904..0fe2e690a104095adc3f218d67852aaaedd852a7 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -146,6 +146,16 @@ config CLK_X1E80100_TCSRCC
>  	  Support for the TCSR clock controller on X1E80100 devices.
>  	  Say Y if you want to use peripheral devices such as SD/UFS.
>  
> +config CLK_X1P42100_CAMCC
> +	tristate "X1P42100 Camera Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_X1E80100_GCC
> +	help
> +	  Support for the camera clock controller on Qualcomm Technologies, Inc.
> +	  X1P42100 devices.
> +	  Say Y if you want to support camera devices and camera functionality
> +	  such as capturing pictures.
> +
>  config CLK_X1P42100_GPUCC
>  	tristate "X1P42100 Graphics Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index b746e5046774259cebe3da8dad1f226561268a8b..2735036df906cd8192fe20bb2a026fca3a457bf9 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_GPUCC) += gpucc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_TCSRCC) += tcsrcc-x1e80100.o
> +obj-$(CONFIG_CLK_X1P42100_CAMCC) += camcc-x1p42100.o
>  obj-$(CONFIG_CLK_X1P42100_GPUCC) += gpucc-x1p42100.o
>  obj-$(CONFIG_CLK_X1P42100_VIDEOCC) += videocc-x1p42100.o
>  obj-$(CONFIG_CLK_QCM2290_GPUCC) += gpucc-qcm2290.o
> diff --git a/drivers/clk/qcom/camcc-x1p42100.c b/drivers/clk/qcom/camcc-x1p42100.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c1a61c267919976d2d869fef4cd3659433ad2993
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-x1p42100.c
> @@ -0,0 +1,2223 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_IFACE,
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,
> +	DT_SLEEP_CLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_BI_TCXO_AO,
> +	P_CAM_CC_PLL0_OUT_EVEN,
> +	P_CAM_CC_PLL0_OUT_MAIN,
> +	P_CAM_CC_PLL0_OUT_ODD,
> +	P_CAM_CC_PLL1_OUT_EVEN,
> +	P_CAM_CC_PLL2_OUT_EVEN,
> +	P_CAM_CC_PLL2_OUT_MAIN,
> +	P_CAM_CC_PLL3_OUT_EVEN,
> +	P_CAM_CC_PLL6_OUT_EVEN,
> +	P_SLEEP_CLK,
> +};
> +
> +static const struct pll_vco lucid_ole_vco[] = {
> +	{ 249600000, 2300000000, 0 },
> +};
> +
> +static const struct pll_vco rivian_ole_vco[] = {
> +	{ 777000000, 1285000000, 0 },
> +};
> +
> +/* 1200.0 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll0_config = {
> +	.l = 0x3e,
> +	.alpha = 0x8000,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x82aa299c,
> +	.test_ctl_val = 0x00000000,
> +	.test_ctl_hi_val = 0x00000003,
> +	.test_ctl_hi1_val = 0x00009000,
> +	.test_ctl_hi2_val = 0x00000034,
> +	.user_ctl_val = 0x00008400,
> +	.user_ctl_hi_val = 0x00000005,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll0 = {
> +	.offset = 0x0,
> +	.config = &cam_cc_pll0_config,
> +	.vco_table = lucid_ole_vco,
> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll0_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
> +	.offset = 0x0,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll0_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll0_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll0.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll0_out_odd[] = {
> +	{ 0x2, 3 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll0_out_odd = {
> +	.offset = 0x0,
> +	.post_div_shift = 14,
> +	.post_div_table = post_div_table_cam_cc_pll0_out_odd,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_odd),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll0_out_odd",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll0.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
> +	},
> +};
> +
> +/* 728.0 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll1_config = {
> +	.l = 0x25,
> +	.alpha = 0xeaaa,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x82aa299c,
> +	.test_ctl_val = 0x00000000,
> +	.test_ctl_hi_val = 0x00000003,
> +	.test_ctl_hi1_val = 0x00009000,
> +	.test_ctl_hi2_val = 0x00000034,
> +	.user_ctl_val = 0x00000400,
> +	.user_ctl_hi_val = 0x00000005,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll1 = {
> +	.offset = 0x1000,
> +	.config = &cam_cc_pll1_config,
> +	.vco_table = lucid_ole_vco,
> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll1",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll1_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll1_out_even = {
> +	.offset = 0x1000,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll1_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll1_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll1_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll1.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
> +	},
> +};
> +
> +/* 960.0 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll2_config = {
> +	.l = 0x32,
> +	.alpha = 0x0,
> +	.config_ctl_val = 0x10000030,
> +	.config_ctl_hi_val = 0x80890263,
> +	.config_ctl_hi1_val = 0x00000217,
> +	.user_ctl_val = 0x00000000,
> +	.user_ctl_hi_val = 0x00100000,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll2 = {
> +	.offset = 0x2000,
> +	.config = &cam_cc_pll2_config,
> +	.vco_table = rivian_ole_vco,
> +	.num_vco = ARRAY_SIZE(rivian_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll2",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_rivian_evo_ops,
> +		},
> +	},
> +};
> +
> +/* 864.0 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll3_config = {
> +	.l = 0x2d,
> +	.alpha = 0x0,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x82aa299c,
> +	.test_ctl_val = 0x00000000,
> +	.test_ctl_hi_val = 0x00000003,
> +	.test_ctl_hi1_val = 0x00009000,
> +	.test_ctl_hi2_val = 0x00000034,
> +	.user_ctl_val = 0x00000400,
> +	.user_ctl_hi_val = 0x00000005,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll3 = {
> +	.offset = 0x3000,
> +	.config = &cam_cc_pll3_config,
> +	.vco_table = lucid_ole_vco,
> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll3",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll3_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
> +	.offset = 0x3000,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll3_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll3_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll3_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll3.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
> +	},
> +};
> +
> +/* 960.0 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll6_config = {
> +	.l = 0x32,
> +	.alpha = 0x0,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x82aa299c,
> +	.test_ctl_val = 0x00000000,
> +	.test_ctl_hi_val = 0x00000003,
> +	.test_ctl_hi1_val = 0x00009000,
> +	.test_ctl_hi2_val = 0x00000034,
> +	.user_ctl_val = 0x00000400,
> +	.user_ctl_hi_val = 0x00000005,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll6 = {
> +	.offset = 0x6000,
> +	.config = &cam_cc_pll6_config,
> +	.vco_table = lucid_ole_vco,
> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_pll6",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll6_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll6_out_even = {
> +	.offset = 0x6000,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll6_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll6_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_pll6_out_even",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&cam_cc_pll6.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_lucid_ole_ops,
> +	},
> +};
> +
> +static const struct parent_map cam_cc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
> +	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
> +	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
> +	{ P_CAM_CC_PLL6_OUT_EVEN, 5 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_0[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_cc_pll0.clkr.hw },
> +	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
> +	{ .hw = &cam_cc_pll0_out_odd.clkr.hw },
> +	{ .hw = &cam_cc_pll6_out_even.clkr.hw },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_1[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL2_OUT_EVEN, 3 },
> +	{ P_CAM_CC_PLL2_OUT_MAIN, 5 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_1[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_cc_pll2.clkr.hw },
> +	{ .hw = &cam_cc_pll2.clkr.hw },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_2[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL3_OUT_EVEN, 6 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_2[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_cc_pll3_out_even.clkr.hw },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_3[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL1_OUT_EVEN, 4 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_3[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &cam_cc_pll1_out_even.clkr.hw },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_4[] = {
> +	{ P_SLEEP_CLK, 0 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_4[] = {
> +	{ .index = DT_SLEEP_CLK },
> +};
> +
> +static const struct parent_map cam_cc_parent_map_5[] = {
> +	{ P_BI_TCXO, 0 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_5[] = {
> +	{ .index = DT_BI_TCXO },
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(200000000, P_CAM_CC_PLL0_OUT_ODD, 2, 0, 0),
> +	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
> +	F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_bps_clk_src = {
> +	.cmd_rcgr = 0x10278,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_bps_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_bps_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_camnoc_axi_rt_clk_src[] = {
> +	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
> +	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_camnoc_axi_rt_clk_src = {
> +	.cmd_rcgr = 0x138f8,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_camnoc_axi_rt_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_camnoc_axi_rt_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_cci_0_clk_src = {
> +	.cmd_rcgr = 0x1365c,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_cci_0_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_cci_1_clk_src = {
> +	.cmd_rcgr = 0x1378c,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_cci_1_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
> +	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
> +	.cmd_rcgr = 0x11164,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_cphy_rx_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_csi0phytimer_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
> +	.cmd_rcgr = 0x150e0,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csi0phytimer_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
> +	.cmd_rcgr = 0x15104,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csi1phytimer_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
> +	.cmd_rcgr = 0x15124,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csi2phytimer_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
> +	.cmd_rcgr = 0x15258,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csi3phytimer_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
> +	.cmd_rcgr = 0x1538c,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csi4phytimer_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_csi5phytimer_clk_src = {
> +	.cmd_rcgr = 0x154c0,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csi5phytimer_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_csid_clk_src[] = {
> +	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
> +	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_csid_clk_src = {
> +	.cmd_rcgr = 0x138d4,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_csid_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_csid_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_fast_ahb_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
> +	F(200000000, P_CAM_CC_PLL0_OUT_EVEN, 3, 0, 0),
> +	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
> +	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
> +	.cmd_rcgr = 0x10018,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_fast_ahb_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_fast_ahb_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_icp_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
> +	F(480000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
> +	F(600000000, P_CAM_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_icp_clk_src = {
> +	.cmd_rcgr = 0x13520,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_icp_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_icp_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_ife_0_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(432000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
> +	F(594000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
> +	F(675000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
> +	F(727000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_ife_0_clk_src = {
> +	.cmd_rcgr = 0x11018,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_2,
> +	.freq_tbl = ftbl_cam_cc_ife_0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_ife_0_clk_src",
> +		.parent_data = cam_cc_parent_data_2,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_ife_lite_clk_src[] = {
> +	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
> +	F(480000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
> +	.cmd_rcgr = 0x13000,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_ife_lite_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_ife_lite_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
> +	.cmd_rcgr = 0x1313c,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_ife_lite_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_ife_lite_csid_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_ipe_nps_clk_src[] = {
> +	F(364000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
> +	F(500000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
> +	F(600000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
> +	F(700000000, P_CAM_CC_PLL1_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_ipe_nps_clk_src = {
> +	.cmd_rcgr = 0x103cc,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_3,
> +	.freq_tbl = ftbl_cam_cc_ipe_nps_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_ipe_nps_clk_src",
> +		.parent_data = cam_cc_parent_data_3,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_jpeg_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(200000000, P_CAM_CC_PLL0_OUT_ODD, 2, 0, 0),
> +	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
> +	F(480000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
> +	F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_jpeg_clk_src = {
> +	.cmd_rcgr = 0x133dc,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_jpeg_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_jpeg_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_mclk0_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(24000000, P_CAM_CC_PLL2_OUT_MAIN, 10, 1, 4),
> +	F(68571429, P_CAM_CC_PLL2_OUT_MAIN, 14, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_mclk0_clk_src = {
> +	.cmd_rcgr = 0x15000,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_mclk0_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_mclk1_clk_src = {
> +	.cmd_rcgr = 0x1501c,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_mclk1_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_mclk2_clk_src = {
> +	.cmd_rcgr = 0x15038,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_mclk2_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_mclk3_clk_src = {
> +	.cmd_rcgr = 0x15054,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_mclk3_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_mclk4_clk_src = {
> +	.cmd_rcgr = 0x15070,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_mclk4_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_mclk5_clk_src = {
> +	.cmd_rcgr = 0x1508c,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_mclk5_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_mclk6_clk_src = {
> +	.cmd_rcgr = 0x150a8,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_mclk6_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_rcg2 cam_cc_mclk7_clk_src = {
> +	.cmd_rcgr = 0x150c4,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_1,
> +	.freq_tbl = ftbl_cam_cc_mclk0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_mclk7_clk_src",
> +		.parent_data = cam_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_qdss_debug_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(75000000, P_CAM_CC_PLL0_OUT_EVEN, 8, 0, 0),
> +	F(150000000, P_CAM_CC_PLL0_OUT_EVEN, 4, 0, 0),
> +	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
> +	.cmd_rcgr = 0x13938,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_qdss_debug_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_qdss_debug_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_sleep_clk_src[] = {
> +	F(32000, P_SLEEP_CLK, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_sleep_clk_src = {
> +	.cmd_rcgr = 0x13aa0,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_4,
> +	.freq_tbl = ftbl_cam_cc_sleep_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_sleep_clk_src",
> +		.parent_data = cam_cc_parent_data_4,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_slow_ahb_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(80000000, P_CAM_CC_PLL0_OUT_EVEN, 7.5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
> +	.cmd_rcgr = 0x10148,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_0,
> +	.freq_tbl = ftbl_cam_cc_slow_ahb_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_slow_ahb_clk_src",
> +		.parent_data = cam_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_xo_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 cam_cc_xo_clk_src = {
> +	.cmd_rcgr = 0x13a84,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = cam_cc_parent_map_5,
> +	.freq_tbl = ftbl_cam_cc_xo_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "cam_cc_xo_clk_src",
> +		.parent_data = cam_cc_parent_data_5,
> +		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_branch cam_cc_bps_ahb_clk = {
> +	.halt_reg = 0x10274,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x10274,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_bps_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_bps_clk = {
> +	.halt_reg = 0x103a4,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x103a4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_bps_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_bps_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_bps_fast_ahb_clk = {
> +	.halt_reg = 0x10144,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x10144,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_bps_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_axi_nrt_clk = {
> +	.halt_reg = 0x13920,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x13920,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x13920,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_axi_nrt_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_camnoc_axi_rt_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_axi_rt_clk = {
> +	.halt_reg = 0x13910,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13910,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_axi_rt_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_camnoc_axi_rt_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_dcd_xo_clk = {
> +	.halt_reg = 0x1392c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x1392c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_dcd_xo_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_camnoc_xo_clk = {
> +	.halt_reg = 0x13930,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13930,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_camnoc_xo_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cci_0_clk = {
> +	.halt_reg = 0x13788,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13788,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cci_0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cci_0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cci_1_clk = {
> +	.halt_reg = 0x138b8,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x138b8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cci_1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cci_1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_core_ahb_clk = {
> +	.halt_reg = 0x13a80,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x13a80,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_core_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cpas_ahb_clk = {
> +	.halt_reg = 0x138bc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x138bc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cpas_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cpas_bps_clk = {
> +	.halt_reg = 0x103b0,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x103b0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cpas_bps_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_bps_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cpas_fast_ahb_clk = {
> +	.halt_reg = 0x138c8,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x138c8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cpas_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cpas_ife_0_clk = {
> +	.halt_reg = 0x11150,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x11150,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cpas_ife_0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ife_0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cpas_ife_lite_clk = {
> +	.halt_reg = 0x13138,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13138,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cpas_ife_lite_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ife_lite_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_cpas_ipe_nps_clk = {
> +	.halt_reg = 0x10504,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x10504,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_cpas_ipe_nps_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ipe_nps_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csi0phytimer_clk = {
> +	.halt_reg = 0x150f8,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x150f8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csi0phytimer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csi0phytimer_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csi1phytimer_clk = {
> +	.halt_reg = 0x1511c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x1511c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csi1phytimer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csi1phytimer_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csi2phytimer_clk = {
> +	.halt_reg = 0x15250,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x15250,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csi2phytimer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csi2phytimer_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csi3phytimer_clk = {
> +	.halt_reg = 0x15384,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x15384,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csi3phytimer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csi3phytimer_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csi4phytimer_clk = {
> +	.halt_reg = 0x154b8,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x154b8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csi4phytimer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csi4phytimer_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csi5phytimer_clk = {
> +	.halt_reg = 0x155ec,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x155ec,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csi5phytimer_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csi5phytimer_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csid_clk = {
> +	.halt_reg = 0x138ec,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x138ec,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csid_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_csid_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csid_csiphy_rx_clk = {
> +	.halt_reg = 0x15100,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x15100,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csid_csiphy_rx_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csiphy0_clk = {
> +	.halt_reg = 0x150fc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x150fc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csiphy0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csiphy1_clk = {
> +	.halt_reg = 0x15120,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x15120,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csiphy1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csiphy2_clk = {
> +	.halt_reg = 0x15254,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x15254,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csiphy2_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csiphy3_clk = {
> +	.halt_reg = 0x15388,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x15388,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csiphy3_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csiphy4_clk = {
> +	.halt_reg = 0x154bc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x154bc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csiphy4_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_csiphy5_clk = {
> +	.halt_reg = 0x155f0,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x155f0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_csiphy5_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_icp_ahb_clk = {
> +	.halt_reg = 0x13658,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13658,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_icp_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_icp_clk = {
> +	.halt_reg = 0x1364c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x1364c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_icp_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_icp_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ife_0_clk = {
> +	.halt_reg = 0x11144,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x11144,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ife_0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ife_0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ife_0_dsp_clk = {
> +	.halt_reg = 0x11154,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x11154,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ife_0_dsp_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ife_0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ife_0_fast_ahb_clk = {
> +	.halt_reg = 0x11160,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x11160,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ife_0_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ife_lite_ahb_clk = {
> +	.halt_reg = 0x13278,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13278,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ife_lite_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ife_lite_clk = {
> +	.halt_reg = 0x1312c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x1312c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ife_lite_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ife_lite_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
> +	.halt_reg = 0x13274,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13274,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ife_lite_cphy_rx_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_cphy_rx_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ife_lite_csid_clk = {
> +	.halt_reg = 0x13268,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13268,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ife_lite_csid_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ife_lite_csid_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ipe_nps_ahb_clk = {
> +	.halt_reg = 0x1051c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x1051c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ipe_nps_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_slow_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ipe_nps_clk = {
> +	.halt_reg = 0x104f8,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x104f8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ipe_nps_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ipe_nps_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ipe_nps_fast_ahb_clk = {
> +	.halt_reg = 0x10520,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x10520,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ipe_nps_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ipe_pps_clk = {
> +	.halt_reg = 0x10508,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x10508,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ipe_pps_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_ipe_nps_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_ipe_pps_fast_ahb_clk = {
> +	.halt_reg = 0x10524,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x10524,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_ipe_pps_fast_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_fast_ahb_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_jpeg_clk = {
> +	.halt_reg = 0x13508,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13508,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_jpeg_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_jpeg_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_mclk0_clk = {
> +	.halt_reg = 0x15018,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x15018,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_mclk0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_mclk0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_mclk1_clk = {
> +	.halt_reg = 0x15034,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x15034,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_mclk1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_mclk1_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_mclk2_clk = {
> +	.halt_reg = 0x15050,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x15050,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_mclk2_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_mclk2_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_mclk3_clk = {
> +	.halt_reg = 0x1506c,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x1506c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_mclk3_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_mclk3_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_mclk4_clk = {
> +	.halt_reg = 0x15088,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x15088,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_mclk4_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_mclk4_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_mclk5_clk = {
> +	.halt_reg = 0x150a4,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x150a4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_mclk5_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_mclk5_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_mclk6_clk = {
> +	.halt_reg = 0x150c0,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x150c0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_mclk6_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_mclk6_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_mclk7_clk = {
> +	.halt_reg = 0x150dc,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x150dc,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_mclk7_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_mclk7_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_qdss_debug_clk = {
> +	.halt_reg = 0x13a64,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13a64,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_qdss_debug_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_qdss_debug_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch cam_cc_qdss_debug_xo_clk = {
> +	.halt_reg = 0x13a68,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x13a68,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_qdss_debug_xo_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct gdsc cam_cc_titan_top_gdsc = {
> +	.gdscr = 0x13a6c,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_titan_top_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc cam_cc_bps_gdsc = {
> +	.gdscr = 0x10004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_bps_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc cam_cc_ife_0_gdsc = {
> +	.gdscr = 0x11004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_ife_0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc cam_cc_ipe_0_gdsc = {
> +	.gdscr = 0x103b8,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_ipe_0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &cam_cc_titan_top_gdsc.pd,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct clk_regmap *cam_cc_x1p42100_clocks[] = {
> +	[CAM_CC_BPS_AHB_CLK] = &cam_cc_bps_ahb_clk.clkr,
> +	[CAM_CC_BPS_CLK] = &cam_cc_bps_clk.clkr,
> +	[CAM_CC_BPS_CLK_SRC] = &cam_cc_bps_clk_src.clkr,
> +	[CAM_CC_BPS_FAST_AHB_CLK] = &cam_cc_bps_fast_ahb_clk.clkr,
> +	[CAM_CC_CAMNOC_AXI_NRT_CLK] = &cam_cc_camnoc_axi_nrt_clk.clkr,
> +	[CAM_CC_CAMNOC_AXI_RT_CLK] = &cam_cc_camnoc_axi_rt_clk.clkr,
> +	[CAM_CC_CAMNOC_AXI_RT_CLK_SRC] = &cam_cc_camnoc_axi_rt_clk_src.clkr,
> +	[CAM_CC_CAMNOC_DCD_XO_CLK] = &cam_cc_camnoc_dcd_xo_clk.clkr,
> +	[CAM_CC_CAMNOC_XO_CLK] = &cam_cc_camnoc_xo_clk.clkr,
> +	[CAM_CC_CCI_0_CLK] = &cam_cc_cci_0_clk.clkr,
> +	[CAM_CC_CCI_0_CLK_SRC] = &cam_cc_cci_0_clk_src.clkr,
> +	[CAM_CC_CCI_1_CLK] = &cam_cc_cci_1_clk.clkr,
> +	[CAM_CC_CCI_1_CLK_SRC] = &cam_cc_cci_1_clk_src.clkr,
> +	[CAM_CC_CORE_AHB_CLK] = &cam_cc_core_ahb_clk.clkr,
> +	[CAM_CC_CPAS_AHB_CLK] = &cam_cc_cpas_ahb_clk.clkr,
> +	[CAM_CC_CPAS_BPS_CLK] = &cam_cc_cpas_bps_clk.clkr,
> +	[CAM_CC_CPAS_FAST_AHB_CLK] = &cam_cc_cpas_fast_ahb_clk.clkr,
> +	[CAM_CC_CPAS_IFE_0_CLK] = &cam_cc_cpas_ife_0_clk.clkr,
> +	[CAM_CC_CPAS_IFE_LITE_CLK] = &cam_cc_cpas_ife_lite_clk.clkr,
> +	[CAM_CC_CPAS_IPE_NPS_CLK] = &cam_cc_cpas_ipe_nps_clk.clkr,
> +	[CAM_CC_CPHY_RX_CLK_SRC] = &cam_cc_cphy_rx_clk_src.clkr,
> +	[CAM_CC_CSI0PHYTIMER_CLK] = &cam_cc_csi0phytimer_clk.clkr,
> +	[CAM_CC_CSI0PHYTIMER_CLK_SRC] = &cam_cc_csi0phytimer_clk_src.clkr,
> +	[CAM_CC_CSI1PHYTIMER_CLK] = &cam_cc_csi1phytimer_clk.clkr,
> +	[CAM_CC_CSI1PHYTIMER_CLK_SRC] = &cam_cc_csi1phytimer_clk_src.clkr,
> +	[CAM_CC_CSI2PHYTIMER_CLK] = &cam_cc_csi2phytimer_clk.clkr,
> +	[CAM_CC_CSI2PHYTIMER_CLK_SRC] = &cam_cc_csi2phytimer_clk_src.clkr,
> +	[CAM_CC_CSI3PHYTIMER_CLK] = &cam_cc_csi3phytimer_clk.clkr,
> +	[CAM_CC_CSI3PHYTIMER_CLK_SRC] = &cam_cc_csi3phytimer_clk_src.clkr,
> +	[CAM_CC_CSI4PHYTIMER_CLK] = &cam_cc_csi4phytimer_clk.clkr,
> +	[CAM_CC_CSI4PHYTIMER_CLK_SRC] = &cam_cc_csi4phytimer_clk_src.clkr,
> +	[CAM_CC_CSI5PHYTIMER_CLK] = &cam_cc_csi5phytimer_clk.clkr,
> +	[CAM_CC_CSI5PHYTIMER_CLK_SRC] = &cam_cc_csi5phytimer_clk_src.clkr,
> +	[CAM_CC_CSID_CLK] = &cam_cc_csid_clk.clkr,
> +	[CAM_CC_CSID_CLK_SRC] = &cam_cc_csid_clk_src.clkr,
> +	[CAM_CC_CSID_CSIPHY_RX_CLK] = &cam_cc_csid_csiphy_rx_clk.clkr,
> +	[CAM_CC_CSIPHY0_CLK] = &cam_cc_csiphy0_clk.clkr,
> +	[CAM_CC_CSIPHY1_CLK] = &cam_cc_csiphy1_clk.clkr,
> +	[CAM_CC_CSIPHY2_CLK] = &cam_cc_csiphy2_clk.clkr,
> +	[CAM_CC_CSIPHY3_CLK] = &cam_cc_csiphy3_clk.clkr,
> +	[CAM_CC_CSIPHY4_CLK] = &cam_cc_csiphy4_clk.clkr,
> +	[CAM_CC_CSIPHY5_CLK] = &cam_cc_csiphy5_clk.clkr,
> +	[CAM_CC_FAST_AHB_CLK_SRC] = &cam_cc_fast_ahb_clk_src.clkr,
> +	[CAM_CC_ICP_AHB_CLK] = &cam_cc_icp_ahb_clk.clkr,
> +	[CAM_CC_ICP_CLK] = &cam_cc_icp_clk.clkr,
> +	[CAM_CC_ICP_CLK_SRC] = &cam_cc_icp_clk_src.clkr,
> +	[CAM_CC_IFE_0_CLK] = &cam_cc_ife_0_clk.clkr,
> +	[CAM_CC_IFE_0_CLK_SRC] = &cam_cc_ife_0_clk_src.clkr,
> +	[CAM_CC_IFE_0_DSP_CLK] = &cam_cc_ife_0_dsp_clk.clkr,
> +	[CAM_CC_IFE_0_FAST_AHB_CLK] = &cam_cc_ife_0_fast_ahb_clk.clkr,
> +	[CAM_CC_IFE_LITE_AHB_CLK] = &cam_cc_ife_lite_ahb_clk.clkr,
> +	[CAM_CC_IFE_LITE_CLK] = &cam_cc_ife_lite_clk.clkr,
> +	[CAM_CC_IFE_LITE_CLK_SRC] = &cam_cc_ife_lite_clk_src.clkr,
> +	[CAM_CC_IFE_LITE_CPHY_RX_CLK] = &cam_cc_ife_lite_cphy_rx_clk.clkr,
> +	[CAM_CC_IFE_LITE_CSID_CLK] = &cam_cc_ife_lite_csid_clk.clkr,
> +	[CAM_CC_IFE_LITE_CSID_CLK_SRC] = &cam_cc_ife_lite_csid_clk_src.clkr,
> +	[CAM_CC_IPE_NPS_AHB_CLK] = &cam_cc_ipe_nps_ahb_clk.clkr,
> +	[CAM_CC_IPE_NPS_CLK] = &cam_cc_ipe_nps_clk.clkr,
> +	[CAM_CC_IPE_NPS_CLK_SRC] = &cam_cc_ipe_nps_clk_src.clkr,
> +	[CAM_CC_IPE_NPS_FAST_AHB_CLK] = &cam_cc_ipe_nps_fast_ahb_clk.clkr,
> +	[CAM_CC_IPE_PPS_CLK] = &cam_cc_ipe_pps_clk.clkr,
> +	[CAM_CC_IPE_PPS_FAST_AHB_CLK] = &cam_cc_ipe_pps_fast_ahb_clk.clkr,
> +	[CAM_CC_JPEG_CLK] = &cam_cc_jpeg_clk.clkr,
> +	[CAM_CC_JPEG_CLK_SRC] = &cam_cc_jpeg_clk_src.clkr,
> +	[CAM_CC_MCLK0_CLK] = &cam_cc_mclk0_clk.clkr,
> +	[CAM_CC_MCLK0_CLK_SRC] = &cam_cc_mclk0_clk_src.clkr,
> +	[CAM_CC_MCLK1_CLK] = &cam_cc_mclk1_clk.clkr,
> +	[CAM_CC_MCLK1_CLK_SRC] = &cam_cc_mclk1_clk_src.clkr,
> +	[CAM_CC_MCLK2_CLK] = &cam_cc_mclk2_clk.clkr,
> +	[CAM_CC_MCLK2_CLK_SRC] = &cam_cc_mclk2_clk_src.clkr,
> +	[CAM_CC_MCLK3_CLK] = &cam_cc_mclk3_clk.clkr,
> +	[CAM_CC_MCLK3_CLK_SRC] = &cam_cc_mclk3_clk_src.clkr,
> +	[CAM_CC_MCLK4_CLK] = &cam_cc_mclk4_clk.clkr,
> +	[CAM_CC_MCLK4_CLK_SRC] = &cam_cc_mclk4_clk_src.clkr,
> +	[CAM_CC_MCLK5_CLK] = &cam_cc_mclk5_clk.clkr,
> +	[CAM_CC_MCLK5_CLK_SRC] = &cam_cc_mclk5_clk_src.clkr,
> +	[CAM_CC_MCLK6_CLK] = &cam_cc_mclk6_clk.clkr,
> +	[CAM_CC_MCLK6_CLK_SRC] = &cam_cc_mclk6_clk_src.clkr,
> +	[CAM_CC_MCLK7_CLK] = &cam_cc_mclk7_clk.clkr,
> +	[CAM_CC_MCLK7_CLK_SRC] = &cam_cc_mclk7_clk_src.clkr,
> +	[CAM_CC_PLL0] = &cam_cc_pll0.clkr,
> +	[CAM_CC_PLL0_OUT_EVEN] = &cam_cc_pll0_out_even.clkr,
> +	[CAM_CC_PLL0_OUT_ODD] = &cam_cc_pll0_out_odd.clkr,
> +	[CAM_CC_PLL1] = &cam_cc_pll1.clkr,
> +	[CAM_CC_PLL1_OUT_EVEN] = &cam_cc_pll1_out_even.clkr,
> +	[CAM_CC_PLL2] = &cam_cc_pll2.clkr,
> +	[CAM_CC_PLL3] = &cam_cc_pll3.clkr,
> +	[CAM_CC_PLL3_OUT_EVEN] = &cam_cc_pll3_out_even.clkr,
> +	[CAM_CC_PLL6] = &cam_cc_pll6.clkr,
> +	[CAM_CC_PLL6_OUT_EVEN] = &cam_cc_pll6_out_even.clkr,
> +	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
> +	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
> +	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
> +	[CAM_CC_SLEEP_CLK_SRC] = &cam_cc_sleep_clk_src.clkr,
> +	[CAM_CC_SLOW_AHB_CLK_SRC] = &cam_cc_slow_ahb_clk_src.clkr,
> +	[CAM_CC_XO_CLK_SRC] = &cam_cc_xo_clk_src.clkr,
> +};
> +
> +static struct gdsc *cam_cc_x1p42100_gdscs[] = {
> +	[CAM_CC_BPS_GDSC] = &cam_cc_bps_gdsc,
> +	[CAM_CC_IFE_0_GDSC] = &cam_cc_ife_0_gdsc,
> +	[CAM_CC_IPE_0_GDSC] = &cam_cc_ipe_0_gdsc,
> +	[CAM_CC_TITAN_TOP_GDSC] = &cam_cc_titan_top_gdsc,
> +};
> +
> +static const struct qcom_reset_map cam_cc_x1p42100_resets[] = {
> +	[CAM_CC_BPS_BCR] = { 0x10000 },
> +	[CAM_CC_ICP_BCR] = { 0x1351c },
> +	[CAM_CC_IFE_0_BCR] = { 0x11000 },
> +	[CAM_CC_IPE_0_BCR] = { 0x103b4 },
> +};
> +
> +static struct clk_alpha_pll *cam_cc_x1p42100_plls[] = {
> +	&cam_cc_pll0,
> +	&cam_cc_pll1,
> +	&cam_cc_pll2,
> +	&cam_cc_pll3,
> +	&cam_cc_pll6,
> +};
> +
> +static u32 cam_cc_x1p42100_critical_cbcrs[] = {
> +	0x13a9c, /* CAM_CC_GDSC_CLK */
> +	0x13ab8, /* CAM_CC_SLEEP_CLK */
> +};
> +
> +static const struct regmap_config cam_cc_x1p42100_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x1603c,
> +	.fast_io = true,
> +};
> +
> +static struct qcom_cc_driver_data cam_cc_x1p42100_driver_data = {
> +	.alpha_plls = cam_cc_x1p42100_plls,
> +	.num_alpha_plls = ARRAY_SIZE(cam_cc_x1p42100_plls),
> +	.clk_cbcrs = cam_cc_x1p42100_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_x1p42100_critical_cbcrs),
> +};
> +
> +static struct qcom_cc_desc cam_cc_x1p42100_desc = {
> +	.config = &cam_cc_x1p42100_regmap_config,
> +	.clks = cam_cc_x1p42100_clocks,
> +	.num_clks = ARRAY_SIZE(cam_cc_x1p42100_clocks),
> +	.resets = cam_cc_x1p42100_resets,
> +	.num_resets = ARRAY_SIZE(cam_cc_x1p42100_resets),
> +	.gdscs = cam_cc_x1p42100_gdscs,
> +	.num_gdscs = ARRAY_SIZE(cam_cc_x1p42100_gdscs),
> +	.use_rpm = true,
> +	.driver_data = &cam_cc_x1p42100_driver_data,
> +};
> +
> +static const struct of_device_id cam_cc_x1p42100_match_table[] = {
> +	{ .compatible = "qcom,x1p42100-camcc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, cam_cc_x1p42100_match_table);
> +
> +static int cam_cc_x1p42100_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &cam_cc_x1p42100_desc);
> +}
> +
> +static struct platform_driver cam_cc_x1p42100_driver = {
> +	.probe = cam_cc_x1p42100_probe,
> +	.driver = {
> +		.name = "camcc-x1p42100",
> +		.of_match_table = cam_cc_x1p42100_match_table,
> +	},
> +};
> +
> +module_platform_driver(cam_cc_x1p42100_driver);
> +
> +MODULE_DESCRIPTION("QTI CAMCC X1P42100 Driver");
> +MODULE_LICENSE("GPL");
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


