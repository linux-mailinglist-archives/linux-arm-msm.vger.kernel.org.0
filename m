Return-Path: <linux-arm-msm+bounces-62124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9345EAE58F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 03:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 294294A3AE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 01:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B317215624D;
	Tue, 24 Jun 2025 01:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eeyjp6sm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99F579F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 01:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750727188; cv=none; b=kbGxISYFILbNkV0X9ZlV7H3hOdO0kXF8EHt+jNDqEYEsUhsrXfGJuDJv8I1U/23KIMnomQU2NTmH39c0YJRTUOwzTMGkkKOzCwOHiAIGrm/j9UqsJjjARjey+2FvcxCjssGsIMTNwa2SK70WrV6NHdaH6S0hmvyH+k5XHi9KNuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750727188; c=relaxed/simple;
	bh=qkOE2/2wJBY6ZbsynzzM1Mei+Bwd/QCXOVugkkrd7sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1AjyXLEBtm6snlSPXjZbRKL+rQJoVeQQKwDIvdQMJDxXwM6BHa6dntpuxbgEMcL6PJlgUJyBb0pA/Esfqyf0WqVhVmazf1lEX64v3tVUbEhGhDJA+YiDW68FR/xdQcaEnBSO/Nvu+EEjWOktQ5tRXf1Wcy0aF8Xde/UWRxuOGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eeyjp6sm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGeAGX021706
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 01:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I96AeuzRSpWN5lhe5MzY/xvC
	Lq4Px418+nL7dkLE5cg=; b=Eeyjp6smzu6Z5XStnlK2JC6nhI3PZ8yOMPUKqshb
	lX6TtEiUZvxHBcBJ45FPQyoAHFQ37mhmwNuGI7cXrsI5d1iVlrlGeF1AnervcP6z
	Dt1BorVtx0uOWpE7aQ4Q2jERTsJUaDb02jabON3b10QaD3bhUwLCASU+/tQTozdI
	YVTeNHXZAKTJWPuUYWVG3DN/qDgG6B2A5sFHpnMU8u/tQWk5MJAEuNnIZYIbKAwR
	jps0/GTlJtvme165ZH9CSgTH+lWgiSkIc0DkvAwFNmE+VVPJJBy9fzYVpGG+kSHp
	/H6nceAR9ar8+S53pRLJaD342tSJFt8InWK+QwqXMc0xuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rptjcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 01:06:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c790dc38b4so797845885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 18:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750727184; x=1751331984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I96AeuzRSpWN5lhe5MzY/xvCLq4Px418+nL7dkLE5cg=;
        b=cEJY0SFhyXFpL2FE/+hIGwQDrN5pXTGqBreHEfMBcCFkA7GMgUZMPqJsHIJ9GFr0OR
         fkL0al/s8xM1vc5Ybl9OKzX0Xr4w7O5/e38bMJhFb2IjY/TpndY8l95CqO/AxtV4I28O
         Gx96UQnbUIKvK1XuH/xEtZ9GIM8cF4drTEpuT4SJnA52XtduCD7DEf48Ir28GlDkB6lf
         0cyL/n2MPvU3stxxvsonOBFR4D41qaNi0sGZd9UrqkYQDHZP3Q4u45iCbXgYzOxuij2o
         hEhsG41FKYgBu197HUjetZUlrtRI6QQhTHqPcEI3u1n+3KNHLG+3Mpj/0WUJop8rfPgE
         Oaaw==
X-Forwarded-Encrypted: i=1; AJvYcCXtNqj5qqluy6j4unqeI+GBQbYeH2/mxcSXnlDrV1SZmQsTuUAkmQgmCTarCwwLwjQvLT8ZnQY4u5nZBxTB@vger.kernel.org
X-Gm-Message-State: AOJu0YzGqeUQK9J7C0Vk2i3hFmFROnzntP17j0y+Vk4/UQ9YJVm0Q2Mc
	Sk7yXrgE73+hcmL1eqc0nL10t4FrkQY4RLycHNnTZEdgttEdeFz4Uei/Snrh9RaISw5xJCs/5X3
	ekJkkkKolo6qD2dAe88deFswbjDJkfz8Uxx7IqNDYjJ6E+l5u6DiTHgJmzd6sgIL9YPRQ
X-Gm-Gg: ASbGncsA34eiQF9YEyXHw80zkWecJMnc118qju7gZzWhEQmBVap54s+H7fxP/YKGBFb
	1R4c+4aX6MkSVJZsWVAXjxtbYPIm7fFB20uw3zie0UQNRqG4t3XfseQv3Uz0zwSO+ahVn82RgkG
	HPBycJ/QXvpngwLBw9ohZcux/F1WoCkHZf8IKo2fBc/EI2iPAdhsGKb4DjIJ9C8BCdOnxFiQCKe
	oBML8VRg8ZR83cGpNL0/BSXtiGW8ZhbCfOtc7SUTMQANaW0IgKIWbaVdafDUcB/mhzYcfUXZBOq
	9ePE5zCveu/bAkX9WwagMVJWo4UqyyanBbiHtxuPRpMs7Iikl2MbXitQ7mhjmqm/PTIDHYCN0gE
	fq0Tcduoia+P0t4T0SAsFr7ClDo7YvzgX2vs=
X-Received: by 2002:a05:620a:1708:b0:7d3:a4fa:ee06 with SMTP id af79cd13be357-7d41ec6e85dmr215255185a.29.1750727183501;
        Mon, 23 Jun 2025 18:06:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTKBDfEoL6O7wRd3zl9wFu3DyJpaKfvCy8ukvFNelgsEofez8jOHOaqT4/pDR8PFZN/eKBJQ==
X-Received: by 2002:a05:620a:1708:b0:7d3:a4fa:ee06 with SMTP id af79cd13be357-7d41ec6e85dmr215250685a.29.1750727182943;
        Mon, 23 Jun 2025 18:06:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41473desm1604694e87.36.2025.06.23.18.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 18:06:22 -0700 (PDT)
Date: Tue, 24 Jun 2025 04:06:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Casey Connolly <casey.connolly@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 09/11] power: supply: qcom_smbx: add smb5 support
Message-ID: <anawfylnc5afpljxeooruyy3lgxn3wizy57jruvnmro6akfsx7@zdzsnludbl6f>
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-9-ac5dec51b6e1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-smb2-smb5-support-v1-9-ac5dec51b6e1@linaro.org>
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=6859fa10 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=5OhpeUltsOZZNJSkuxwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAwNyBTYWx0ZWRfX6RNdJkSel6Ju
 53jtFcHAGNqMlMGN3LE0queJSna/1wLTY9fqZQwPllFPA8It/UUcj7HoSunCjQvy8UeCzyfD/IZ
 bqQTWSEAHJi8M4qjweYNVxtw4rXLAG9Bc6ueOHmOZ+I4iXhOW9y71/hnixggTMHSa3cWdeHpROG
 6nUGJyol5c4Tmi0UKNv2LzcShXYmI4ZAb7JP76QlHoSanhNMOp/pDr/qYqdXbRxA1+/EFZelG17
 dTILT5h4yDsJvOpc7AGupW9yng8ym3cWX064C/DXzeNVv8bwFKtn9wJRN5mdGPkgaPyazpTbsqJ
 lZpyaa/8SAI72jTI5hmsHJTQ3KeFeg6CtByXcjVZOPyHrRw/nyepyffELo8pfjsRwBnb9OMWpPJ
 Wx8PhjqhgI/M0v1ELfvzUepO4f66N9lCWB885/jRYQ1j/hy0guSfeNVNQsvE6NSt8HTa+4mV
X-Proofpoint-ORIG-GUID: vMiweaMByTktq39zphlNnSsT5tQXEBhY
X-Proofpoint-GUID: vMiweaMByTktq39zphlNnSsT5tQXEBhY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_08,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240007

On Thu, Jun 19, 2025 at 04:55:17PM +0200, Casey Connolly wrote:
> Introduce support for the SMB5 charger found on pm8150b and other more
> modern Qualcomm SoCs.
> 
> SMB5 is largely similar to SMB2, with a few register differences. The
> main difference is the new Type-C hardware block which some registers
> are moved to.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  drivers/power/supply/qcom_smbx.c | 367 +++++++++++++++++++++++++++++++++------
>  1 file changed, 314 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
> index 10ddd33a09599decb23c0f1ccd02fa9b56602543..d902f3f43548191d3d0310ce90e699918ed0f16f 100644
> --- a/drivers/power/supply/qcom_smbx.c
> +++ b/drivers/power/supply/qcom_smbx.c
> @@ -22,18 +22,32 @@
>  #include <linux/regmap.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  
> +enum smb_generation {
> +	SMB2,
> +	SMB5,
> +};
> +
> +#define SMB_REG_OFFSET(smb) (smb->gen == SMB2 ? 0x600 : 0x100)
> +
>  /* clang-format off */
>  #define BATTERY_CHARGER_STATUS_1			0x06
>  #define BATTERY_CHARGER_STATUS_MASK			GENMASK(2, 0)
>  
>  #define BATTERY_CHARGER_STATUS_2			0x07
> -#define CHARGER_ERROR_STATUS_BAT_OV_BIT			BIT(5)
> -#define BAT_TEMP_STATUS_HOT_SOFT_LIMIT_BIT		BIT(3)
> -#define BAT_TEMP_STATUS_COLD_SOFT_LIMIT_BIT		BIT(2)
> -#define BAT_TEMP_STATUS_TOO_HOT_BIT			BIT(1)
> -#define BAT_TEMP_STATUS_TOO_COLD_BIT			BIT(0)
> +#define SMB2_CHARGER_ERROR_STATUS_BAT_OV_BIT		BIT(5)
> +#define SMB2_BAT_TEMP_STATUS_HOT_SOFT_LIMIT_BIT	BIT(3)
> +#define SMB2_BAT_TEMP_STATUS_COLD_SOFT_LIMIT_BIT	BIT(2)
> +#define SMB2_BAT_TEMP_STATUS_TOO_HOT_BIT		BIT(1)
> +#define SMB5_CHARGER_ERROR_STATUS_BAT_OV_BIT		BIT(1)
> +#define SMB2_BAT_TEMP_STATUS_TOO_COLD_BIT		BIT(0)
> +
> +#define BATTERY_CHARGER_STATUS_7			0x0D
> +#define SMB5_BAT_TEMP_STATUS_HOT_SOFT_BIT		BIT(5)
> +#define SMB5_BAT_TEMP_STATUS_COLD_SOFT_BIT		BIT(4)
> +#define SMB5_BAT_TEMP_STATUS_TOO_HOT_BIT		BIT(3)
> +#define SMB5_BAT_TEMP_STATUS_TOO_COLD_BIT		BIT(2)
>  
>  #define CHARGING_ENABLE_CMD				0x42
>  #define CHARGING_ENABLE_CMD_BIT				BIT(0)
>  
> @@ -55,11 +69,14 @@
>  
>  #define FLOAT_VOLTAGE_CFG				0x70
>  #define FLOAT_VOLTAGE_SETTING_MASK			GENMASK(7, 0)
>  
> -#define FG_UPDATE_CFG_2_SEL				0x7D
> -#define SOC_LT_CHG_RECHARGE_THRESH_SEL_BIT		BIT(2)
> -#define VBT_LT_CHG_RECHARGE_THRESH_SEL_BIT		BIT(1)
> +#define SMB2_FG_UPDATE_CFG_2_SEL			0x7D
> +#define SMB2_SOC_LT_CHG_RECHARGE_THRESH_SEL_BIT		BIT(2)
> +#define SMB2_VBT_LT_CHG_RECHARGE_THRESH_SEL_BIT		BIT(1)
> +
> +#define SMB5_CHARGE_RCHG_SOC_THRESHOLD_CFG_REG		0x7D
> +#define SMB5_CHARGE_RCHG_SOC_THRESHOLD_CFG_MASK		GENMASK(7, 0)
>  
>  #define OTG_CFG						0x153
>  #define OTG_EN_SRC_CFG_BIT				BIT(1)
>  
> @@ -73,36 +90,46 @@
>  #define CDP_CHARGER_BIT					BIT(2)
>  #define OCP_CHARGER_BIT					BIT(1)
>  #define SDP_CHARGER_BIT					BIT(0)
>  
> +#define USBIN_CMD_IL					0x340
> +#define USBIN_SUSPEND_BIT				BIT(0)
> +
>  #define CMD_APSD					0x341
>  #define APSD_RERUN_BIT					BIT(0)
>  
> +#define CMD_ICL_OVERRIDE				0x342
> +#define ICL_OVERRIDE_BIT				BIT(0)
> +
>  #define TYPE_C_CFG					0x358
> +#define APSD_START_ON_CC_BIT				BIT(7)
>  #define FACTORY_MODE_DETECTION_EN_BIT			BIT(5)
>  #define VCONN_OC_CFG_BIT				BIT(1)
>  
>  #define USBIN_OPTIONS_1_CFG				0x362
> +#define AUTO_SRC_DETECT_BIT				BIT(3)
>  #define HVDCP_EN_BIT					BIT(2)
>  
> +#define USBIN_LOAD_CFG					0x65
> +#define ICL_OVERRIDE_AFTER_APSD_BIT			BIT(4)
> +
>  #define USBIN_ICL_OPTIONS				0x366
>  #define USB51_MODE_BIT					BIT(1)
>  #define USBIN_MODE_CHG_BIT				BIT(0)
>  
>  /* PMI8998 only */
>  #define TYPE_C_INTRPT_ENB_SOFTWARE_CTRL			0x368
> -#define VCONN_EN_SRC_BIT				BIT(4)
> +#define SMB2_VCONN_EN_SRC_BIT				BIT(4)
>  #define VCONN_EN_VALUE_BIT				BIT(3)
>  #define TYPEC_POWER_ROLE_CMD_MASK			GENMASK(2, 0)
> -#define UFP_EN_CMD_BIT					BIT(2)
> -#define DFP_EN_CMD_BIT					BIT(1)
> -#define TYPEC_DISABLE_CMD_BIT				BIT(0)
> +#define SMB5_EN_SNK_ONLY_BIT				BIT(1)
>  
>  #define USBIN_CURRENT_LIMIT_CFG				0x370
>  
>  #define USBIN_AICL_OPTIONS_CFG				0x380
>  #define SUSPEND_ON_COLLAPSE_USBIN_BIT			BIT(7)
>  #define USBIN_AICL_START_AT_MAX_BIT			BIT(5)
> +#define USBIN_AICL_PERIODIC_RERUN_EN_BIT		BIT(4)
>  #define USBIN_AICL_ADC_EN_BIT				BIT(3)
>  #define USBIN_AICL_EN_BIT				BIT(2)
>  #define USBIN_HV_COLLAPSE_RESPONSE_BIT			BIT(1)
>  #define USBIN_LV_COLLAPSE_RESPONSE_BIT			BIT(0)
> @@ -113,15 +140,41 @@
>  
>  #define USBIN_CONT_AICL_THRESHOLD_CFG			0x384
>  #define USBIN_CONT_AICL_THRESHOLD_CFG_MASK		GENMASK(5, 0)
>  
> -#define ICL_STATUS					0x607
> +#define ICL_STATUS(smb)					(SMB_REG_OFFSET(smb) + 0x07)
>  #define INPUT_CURRENT_LIMIT_MASK			GENMASK(7, 0)
>  
> -#define POWER_PATH_STATUS				0x60B
> +#define POWER_PATH_STATUS(smb)				(SMB_REG_OFFSET(smb) + 0x0B)
>  #define P_PATH_USE_USBIN_BIT				BIT(4)
>  #define P_PATH_VALID_INPUT_POWER_SOURCE_STS_BIT		BIT(0)
>  
> +/* 0x5xx region is PM8150b only Type-C registers */
> +
> +/* Bits 2:0 match PMI8998 TYPE_C_INTRPT_ENB_SOFTWARE_CTRL */
> +#define SMB5_TYPE_C_MODE_CFG				0x544
> +#define SMB5_EN_TRY_SNK_BIT				BIT(4)
> +#define SMB5_EN_SNK_ONLY_BIT				BIT(1)
> +
> +#define SMB5_TYPEC_TYPE_C_VCONN_CONTROL			0x546
> +#define SMB5_VCONN_EN_ORIENTATION_BIT			BIT(2)
> +#define SMB5_VCONN_EN_VALUE_BIT				BIT(1)
> +#define SMB5_VCONN_EN_SRC_BIT				BIT(0)
> +
> +
> +#define SMB5_TYPE_C_DEBUG_ACCESS_SINK			0x54a
> +#define SMB5_TYPEC_DEBUG_ACCESS_SINK_MASK		GENMASK(4, 0)
> +
> +#define SMB5_DEBUG_ACCESS_SRC_CFG			0x54C
> +#define SMB5_EN_UNORIENTED_DEBUG_ACCESS_SRC_BIT	BIT(0)
> +
> +#define SMB5_TYPE_C_EXIT_STATE_CFG			0x550
> +#define SMB5_BYPASS_VSAFE0V_DURING_ROLE_SWAP_BIT	BIT(3)
> +#define SMB5_SEL_SRC_UPPER_REF_BIT			BIT(2)
> +#define SMB5_EXIT_SNK_BASED_ON_CC_BIT			BIT(0)
> +
> +/* Common */
> +
>  #define BARK_BITE_WDOG_PET				0x643
>  #define BARK_BITE_WDOG_PET_BIT				BIT(0)
>  
>  #define WD_CFG						0x651
> @@ -184,8 +237,9 @@ struct smb_chip {
>  	const char *name;
>  	unsigned int base;
>  	struct regmap *regmap;
>  	struct power_supply_battery_info *batt_info;
> +	enum smb_generation gen;
>  
>  	struct delayed_work status_change_work;
>  	int cable_irq;
>  	bool wakeup_enabled;
> @@ -195,8 +249,15 @@ struct smb_chip {
>  
>  	struct power_supply *chg_psy;
>  };
>  
> +struct smb_match_data {
> +	const char *name;
> +	enum smb_generation gen;
> +	size_t init_seq_len;
> +	const struct smb_init_register __counted_by(init_seq_len) *init_seq;
> +};
> +
>  static enum power_supply_property smb_properties[] = {
>  	POWER_SUPPLY_PROP_MANUFACTURER,
>  	POWER_SUPPLY_PROP_MODEL_NAME,
>  	POWER_SUPPLY_PROP_CURRENT_MAX,
> @@ -212,9 +273,9 @@ static int smb_get_prop_usb_online(struct smb_chip *chip, int *val)
>  {
>  	unsigned int stat;
>  	int rc;
>  
> -	rc = regmap_read(chip->regmap, chip->base + POWER_PATH_STATUS, &stat);
> +	rc = regmap_read(chip->regmap, chip->base + POWER_PATH_STATUS(chip), &stat);
>  	if (rc < 0) {
>  		dev_err(chip->dev, "Couldn't read power path status: %d\n", rc);
>  		return rc;
>  	}
> @@ -267,11 +328,37 @@ static int smb_apsd_get_charger_type(struct smb_chip *chip, int *val)
>  
>  	return 0;
>  }
>  
> +/* Return 1 when in overvoltage state, else 0 or -errno */
> +static int smbx_ov_status(struct smb_chip *chip)
> +{
> +	u16 reg;
> +	u8 mask;
> +	int rc;
> +	u32 val;
> +
> +	switch (chip->gen) {
> +	case SMB2:
> +		reg = BATTERY_CHARGER_STATUS_2;
> +		mask = SMB2_CHARGER_ERROR_STATUS_BAT_OV_BIT;
> +		break;
> +	case SMB5:
> +		reg = BATTERY_CHARGER_STATUS_7;
> +		mask = SMB5_CHARGER_ERROR_STATUS_BAT_OV_BIT;
> +		break;
> +	}
> +
> +	rc = regmap_read(chip->regmap, chip->base + reg, &val);
> +	if (rc)
> +		return rc;
> +
> +	return !!(reg & mask);
> +}
> +
>  static int smb_get_prop_status(struct smb_chip *chip, int *val)
>  {
> -	unsigned char stat[2];
> +	u32 stat;
>  	int usb_online = 0;
>  	int rc;
>  
>  	rc = smb_get_prop_usb_online(chip, &usb_online);
> @@ -279,24 +366,29 @@ static int smb_get_prop_status(struct smb_chip *chip, int *val)
>  		*val = POWER_SUPPLY_STATUS_DISCHARGING;
>  		return rc;
>  	}
>  
> -	rc = regmap_bulk_read(chip->regmap,
> -			      chip->base + BATTERY_CHARGER_STATUS_1, &stat, 2);
> +	rc = regmap_read(chip->regmap,
> +			      chip->base + BATTERY_CHARGER_STATUS_1, &stat);
>  	if (rc < 0) {
>  		dev_err(chip->dev, "Failed to read charging status ret=%d\n",
>  			rc);
>  		return rc;
>  	}
>  
> -	if (stat[1] & CHARGER_ERROR_STATUS_BAT_OV_BIT) {
> +	rc = smbx_ov_status(chip);
> +	if (rc < 0)
> +		return rc;
> +
> +	/* In overvoltage state */
> +	if (rc == 1) {
>  		*val = POWER_SUPPLY_STATUS_NOT_CHARGING;
>  		return 0;
>  	}
>  
> -	stat[0] = stat[0] & BATTERY_CHARGER_STATUS_MASK;
> +	stat = stat & BATTERY_CHARGER_STATUS_MASK;
>  
> -	switch (stat[0]) {
> +	switch (stat) {
>  	case TRICKLE_CHARGE:
>  	case PRE_CHARGE:
>  	case FAST_CHARGE:
>  	case FULLON_CHARGE:
> @@ -318,9 +410,9 @@ static int smb_get_prop_status(struct smb_chip *chip, int *val)
>  
>  static inline int smb_get_current_limit(struct smb_chip *chip,
>  					 unsigned int *val)
>  {
> -	int rc = regmap_read(chip->regmap, chip->base + ICL_STATUS, val);
> +	int rc = regmap_read(chip->regmap, chip->base + ICL_STATUS(chip), val);
>  
>  	if (rc >= 0)
>  		*val *= CURRENT_SCALE_FACTOR;
>  	return rc;
> @@ -413,9 +505,46 @@ static int smb_get_iio_chan(struct smb_chip *chip, struct iio_channel *chan,
>  
>  	return iio_read_channel_processed(chan, val);
>  }
>  
> -static int smb_get_prop_health(struct smb_chip *chip, int *val)
> +static int smb5_get_prop_health(struct smb_chip *chip, int *val)
> +{
> +	int rc;
> +	unsigned int stat;
> +
> +	rc = smbx_ov_status(chip);
> +
> +	/* Treat any error as if we are in the overvoltage state */
> +	if (rc < 0)
> +		dev_err(chip->dev, "Couldn't determine overvoltage status!");
> +	if (rc) {
> +		dev_err(chip->dev, "battery over-voltage");
> +		*val = POWER_SUPPLY_HEALTH_OVERVOLTAGE;
> +		return 0;
> +	}
> +
> +	rc = regmap_read(chip->regmap, chip->base + BATTERY_CHARGER_STATUS_7,
> +			 &stat);
> +	if (rc < 0) {
> +		dev_err(chip->dev, "Couldn't read charger status 7 rc=%d\n", rc);
> +		return rc;
> +	}
> +
> +	if (stat & SMB5_BAT_TEMP_STATUS_TOO_COLD_BIT)
> +		*val = POWER_SUPPLY_HEALTH_COLD;
> +	else if (stat & SMB5_BAT_TEMP_STATUS_TOO_HOT_BIT)
> +		*val = POWER_SUPPLY_HEALTH_OVERHEAT;
> +	else if (stat & SMB5_BAT_TEMP_STATUS_COLD_SOFT_BIT)
> +		*val = POWER_SUPPLY_HEALTH_COOL;
> +	else if (stat & SMB5_BAT_TEMP_STATUS_HOT_SOFT_BIT)
> +		*val = POWER_SUPPLY_HEALTH_WARM;
> +	else
> +		*val = POWER_SUPPLY_HEALTH_GOOD;
> +
> +	return 0;
> +}
> +
> +static int smb2_get_prop_health(struct smb_chip *chip, int *val)
>  {
>  	int rc;
>  	unsigned int stat;
>  
> @@ -426,34 +555,45 @@ static int smb_get_prop_health(struct smb_chip *chip, int *val)
>  		return rc;
>  	}
>  
>  	switch (stat) {
> -	case CHARGER_ERROR_STATUS_BAT_OV_BIT:
> +	case SMB2_CHARGER_ERROR_STATUS_BAT_OV_BIT:
>  		*val = POWER_SUPPLY_HEALTH_OVERVOLTAGE;
>  		return 0;
> -	case BAT_TEMP_STATUS_TOO_COLD_BIT:
> +	case SMB2_BAT_TEMP_STATUS_TOO_COLD_BIT:
>  		*val = POWER_SUPPLY_HEALTH_COLD;
>  		return 0;
> -	case BAT_TEMP_STATUS_TOO_HOT_BIT:
> +	case SMB2_BAT_TEMP_STATUS_TOO_HOT_BIT:
>  		*val = POWER_SUPPLY_HEALTH_OVERHEAT;
>  		return 0;
> -	case BAT_TEMP_STATUS_COLD_SOFT_LIMIT_BIT:
> +	case SMB2_BAT_TEMP_STATUS_COLD_SOFT_LIMIT_BIT:
>  		*val = POWER_SUPPLY_HEALTH_COOL;
>  		return 0;
> -	case BAT_TEMP_STATUS_HOT_SOFT_LIMIT_BIT:
> +	case SMB2_BAT_TEMP_STATUS_HOT_SOFT_LIMIT_BIT:
>  		*val = POWER_SUPPLY_HEALTH_WARM;
>  		return 0;
>  	default:
>  		*val = POWER_SUPPLY_HEALTH_GOOD;
>  		return 0;
>  	}
>  }
>  
> +static int smb_get_prop_health(struct smb_chip *chip, int *val)
> +{
> +	switch (chip->gen) {
> +	case SMB2:
> +		return smb2_get_prop_health(chip, val);
> +	case SMB5:
> +		return smb5_get_prop_health(chip, val);
> +	}
> +}
> +
>  static int smb_get_property(struct power_supply *psy,
>  			     enum power_supply_property psp,
>  			     union power_supply_propval *val)
>  {
>  	struct smb_chip *chip = power_supply_get_drvdata(psy);
> +	int ret;
>  
>  	switch (psp) {
>  	case POWER_SUPPLY_PROP_MANUFACTURER:
>  		val->strval = "Qualcomm";
> @@ -466,10 +606,15 @@ static int smb_get_property(struct power_supply *psy,
>  	case POWER_SUPPLY_PROP_CURRENT_NOW:
>  		return smb_get_iio_chan(chip, chip->usb_in_i_chan,
>  					 &val->intval);
>  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> -		return smb_get_iio_chan(chip, chip->usb_in_v_chan,
> +		ret = smb_get_iio_chan(chip, chip->usb_in_v_chan,
>  					 &val->intval);
> +		if (!ret) {
> +			if (chip->gen == SMB5)
> +				val->intval *= 16;
> +		}
> +		return ret;
>  	case POWER_SUPPLY_PROP_ONLINE:
>  		return smb_get_prop_usb_online(chip, &val->intval);
>  	case POWER_SUPPLY_PROP_STATUS:
>  		return smb_get_prop_status(chip, &val->intval);
> @@ -515,14 +660,10 @@ static int smb_property_is_writable(struct power_supply *psy,
>  
>  static irqreturn_t smb_handle_batt_overvoltage(int irq, void *data)
>  {
>  	struct smb_chip *chip = data;
> -	unsigned int status;
>  
> -	regmap_read(chip->regmap, chip->base + BATTERY_CHARGER_STATUS_2,
> -		    &status);
> -
> -	if (status & CHARGER_ERROR_STATUS_BAT_OV_BIT) {
> +	if (smbx_ov_status(chip) == 1) {
>  		/* The hardware stops charging automatically */
>  		dev_err(chip->dev, "battery overvoltage detected\n");
>  		power_supply_changed(chip->chg_psy);
>  	}
> @@ -566,9 +707,9 @@ static irqreturn_t smb_handle_wdog_bark(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
>  static const struct power_supply_desc smb_psy_desc = {
> -	.name = "pmi8998_charger",
> +	.name = "SMB2_charger",
>  	.type = POWER_SUPPLY_TYPE_USB,
>  	.usb_types = BIT(POWER_SUPPLY_USB_TYPE_SDP) |
>  		     BIT(POWER_SUPPLY_USB_TYPE_CDP) |
>  		     BIT(POWER_SUPPLY_USB_TYPE_DCP) |
> @@ -580,18 +721,100 @@ static const struct power_supply_desc smb_psy_desc = {
>  	.property_is_writeable = smb_property_is_writable,
>  };
>  
>  /* Init sequence derived from vendor downstream driver */
> -static const struct smb_init_register smb_init_seq[] = {
> -	{ .addr = AICL_RERUN_TIME_CFG, .mask = AICL_RERUN_TIME_MASK, .val = 0 },
> +static const struct smb_init_register smb5_init_seq[] = {
> +	{ .addr = USBIN_CMD_IL, .mask = USBIN_SUSPEND_BIT, .val = 0 },
> +	/*
> +	 * By default configure us as an upstream facing port
> +	 * FIXME: This will be handled by the type-c driver
> +	 */

All of this needs to be reworked to cooperate with the type-c driver.
Otherwise it might try to reconfigure the Type-C mode _after_ the TCPM
has negotiated some configuration. So, it can't go in in this way.

> +	{ .addr = SMB5_TYPE_C_MODE_CFG,
> +	  .mask = SMB5_EN_TRY_SNK_BIT | SMB5_EN_SNK_ONLY_BIT,
> +	  .val = SMB5_EN_TRY_SNK_BIT },
> 

-- 
With best wishes
Dmitry

