Return-Path: <linux-arm-msm+bounces-107311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJpzN3Z5BGqpKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:15:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8912E533D2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F5AD3012CC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091CF44BCBB;
	Wed, 13 May 2026 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1Hkqw/K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8I+oll9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D09444B69C
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676763; cv=none; b=ZtUFQTQoqnSEI/waWcAzkvzBjLIZtkhfy/rmw+2GYkA2SnKUXWo2UMK0+NBgbF2G/Z0suHPcDVUL3G4A7Szn05xeQIXPfy6q8gNHG38+ORKYz4Q8+L2XjSpxO2S9DNz9J6aHFQSByLEjt0lJymaxJx1rBYeEnldJ3oLn3QS/QRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676763; c=relaxed/simple;
	bh=gTWoMY2meEbg8/YZlWNxLM/90BqNWJc6npiMbglFr8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P06vpplOZ5nX/BqZB70vUHlwcax9NBYOSSPk8Qeb/UCt2pxMEyryIUgYg8y/Kkz2QRD91faOD3JHwUSJg/dBDB51dTfWqmJCYkTtA4t4RtPMNNiXE2GmZi6zrDa7FfiCbNwxgHikkrlPvrCT3KVjqL/7x3sF2j9YlK2FLzFgyLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1Hkqw/K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8I+oll9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBqFLG3324658
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V2Glk+J1smJyB218askkSHc3
	dZ7oIdnyYG2LwbcHoos=; b=E1Hkqw/KhqnCGRqcH1340GhoqSGbTVOjn/w4InR6
	SYfqNaH1CBxXYMrmx0GL5B9gB5VsRNen0u81513Y6D6QV5+f9+DVODYVmLJOQq5F
	TOzE6xVPgVobo0QQ0vB/ElBisLrCa5etkxrY53QgM00NP2xtx8FdZo6gNQQQa6MN
	BX3Wv1MXMa8lwX5pBCetff4kkgeVq3gzzLOCKY024EaoCqZtBdLokmlM2pVmxJaG
	TzNWU2jsx9J7qCoKhtBSkZMmS5dohLSdTMsLdpojmvhRbYUPeiXLwN+4nl2OFwdy
	rYvX6tgDKLbfmBjDAvvLGovNKfa6BZ50uHKLXoeoIPgDvg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9frf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:52:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e575a50bcso52469961cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676761; x=1779281561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V2Glk+J1smJyB218askkSHc3dZ7oIdnyYG2LwbcHoos=;
        b=H8I+oll9hkHANiWxxKt4pqj1fKp57FWBDaaPkXUHSU7MMn7eutW66JrAKA9mymoei6
         h9FcRaxGzIoJwtXffhZFRfrDbCWGnZl7697oZX/vnz8Z7JB3ZaGAJAVKk9/LWHOdS/FS
         aAV+ygH36lInoiUTKR9OkKIYAXI56VUAXvDt9UxdfUjxF4TIcmVOwi/HdTrmgow5IdmU
         K162QXm1ehnGQVFLcUji+DfYe5eNZ6uEDTTXzw0P3xoR6fgO8K/Mwsw1E7PXFBRpF6BB
         4LQzWfuPZ4uiX3AQOSIquq8mE0serFymHOW5ROrxwdO7l/bnpbfTlqimBH9ziubyDZqU
         DFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676761; x=1779281561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2Glk+J1smJyB218askkSHc3dZ7oIdnyYG2LwbcHoos=;
        b=IINo8EbBlOLl67x168JaTf/2OktQDNOl2sj1Ygx9vI0WFQNx2Yj5yS2ginCDWU/0IV
         GcPWMNghThyUYLeI+Zkkg4KUHUeprzO2+6d4at/uEl4B1E5ul/JhS4dylvy9+aza7U/+
         FEadhwK/w6id6rpasnO0pxxZMZTrFdxtUhCkP3Tuv3AZK1wH0Bh8+qw7XsRo6+1SOTHz
         8v4gL9ZQMTPtmOZJGiyWQp7CxO8qVCTSuOf3DuBZXwm9WCPItJqvJT19+JlJWbcRhkat
         oIDbwW2RkEv/K8TXGFcgjJKT5EuR/+/FKIupp3TuRD7nkaQNI+v4JFBZhyS5/vnnB25l
         pcRA==
X-Forwarded-Encrypted: i=1; AFNElJ9+gwp7AnkKA13bkTqiYgPhwlfu44qJfHkhhVinXia7r7uzXs3Yo9/eWhjMbAqy/HthfosVd36vsCyefLLr@vger.kernel.org
X-Gm-Message-State: AOJu0YwuZBkBS7A6dHA8RWJGiUuKzXN00tnpw9LV2W6MCW1OL2k/znQM
	j5ONl/L6chYhGnA6N8YwSiwiHopSK4Rneok3mrL1X59kHAR2FW3Q9t+z9WySsGHdP4tRN50wfW7
	TtGNSqcE8RR89O1Zvr1iBJXzxCshEQ4RF+A0FlCmcZLaxR7J7Cv1IgdsPxc4iVN62SUMqOA+AsY
	cX
X-Gm-Gg: Acq92OE5Ow8YxZY6mEjXCkIbVJhYlhkXE8Yd1BH1/W2VeJZTT9dcHkqHag/KJE+fju0
	OVG3TX6Xssy55IFWzTqmbntlQDCAsdQ7rfL+AC98UD9AGj76vs0VoxIYcmUuX28vmzsn4Wd9pht
	RKM18yCn2XfQ9wYI+E35dEfEkifx2jLkQyoFAg3t5H2akw+InpJvH4kAJq22DHdoPUSujrVZ2zO
	fwoeB6dXZgeq0V8I00maf1xr46TeF1wE9yEHnwz9MfCffHHwJn6VPU6kx0WYLaXdm4GlpggmfBk
	Q4Q7ODFu9kgTIF6dNI1js2l/5/mx/upWtvdMRU3A/zQRthmaUWw02fiOtAkWAYiwQRebhJvGMcn
	S4YdjFRnwHb7rvnxJlEJua8ylxoBaycgDoJ9TIG4juzUz71G+qxT410IMaMuubrPUCX9r/EGMUb
	vqQWDw8+OL62hXlUtq2iwa9R4C8GUUlxwq67M=
X-Received: by 2002:a05:622a:610a:b0:50d:65ec:a071 with SMTP id d75a77b69052e-5162fe3dac5mr34929701cf.5.1778676760521;
        Wed, 13 May 2026 05:52:40 -0700 (PDT)
X-Received: by 2002:a05:622a:610a:b0:50d:65ec:a071 with SMTP id d75a77b69052e-5162fe3dac5mr34929331cf.5.1778676759974;
        Wed, 13 May 2026 05:52:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4042009e87.23.2026.05.13.05.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:52:38 -0700 (PDT)
Date: Wed, 13 May 2026 15:52:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
Message-ID: <ucmpc5hkbjruix2ftxys2zfk5blntfsap3fbspqta6ihyigrgg@3nyghgnonxvh>
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260513122542.3726319-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513122542.3726319-2-ajay.nandam@oss.qualcomm.com>
X-Proofpoint-GUID: mTRBJa3GQmU8wi-20WfK591v5lY819gw
X-Proofpoint-ORIG-GUID: mTRBJa3GQmU8wi-20WfK591v5lY819gw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMyBTYWx0ZWRfXzsI+XGJwMrMD
 /eJH5geVHsbT4FuGxGyL8JACTn3gk6UFdLJ4aF+YMNw/0sMuM9HDR6336+GOFz/1PfSSgw1o4Nd
 k3Cty26FviplD9ARKXD4FMSf9/WrU77qw2JvWVxwF3w5DpktyXpil82/A7HBJqcmLjkV5Fu1qKb
 umHGoraR2LO1mLn8q95yIRH9YN7FiQrUFM4xL9rUgRuoGKdEqaG70l9+2strmR6sdBykE4vlOEv
 V0OH5Z44xLuB0YxaQkC7VeYE+RYc4fAumUvmACsGOIWHMPSF0ffSI98BOHIyfKMBlkQzTcVAOFn
 yy/OIYR+afP5zChihozpl5wPg/Ezgsw30PMCOn6GkQFw4+xwHGwvlpR+Dzxtn9XrJApoxiCAgnk
 RAu5CKyBtZTS+SWPVlPO9lgm2bkkaCMVGCOgRcuTPphvgKNX/Fj8jHOLV1qpeJQSW5G+o3TVmEE
 y4d5tn5FYMoEqUMtpNQ==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a047419 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=RfFmp6mFNQ8jP_shwQAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130133
X-Rspamd-Queue-Id: 8912E533D2E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107311-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 05:55:26PM +0530, Ajay Kumar Nandam wrote:
> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
> runtime power management.
> 
> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
> improves power efficiency on platforms using LPASS LPI island mode, and
> aligns the driver with common runtime PM patterns used across Qualcomm
> LPASS subsystems.
> 
> Guard GPIO register read/write helpers and slew-rate register programming
> with synchronous runtime PM calls so the device is active during MMIO
> operations whenever autosuspend is enabled.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 118 ++++++++++++------
>  .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |   7 ++
>  2 files changed, 88 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 15ced5027579..d95e28926d38 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -15,6 +15,9 @@
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/pinctrl/pinmux.h>
> +#include <linux/cleanup.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "../pinctrl-utils.h"
>  
> @@ -22,7 +25,6 @@
>  
>  #define MAX_NR_GPIO		32
>  #define GPIO_FUNC		0
> -#define MAX_LPI_NUM_CLKS	2
>  
>  struct lpi_pinctrl {
>  	struct device *dev;
> @@ -31,7 +33,6 @@ struct lpi_pinctrl {
>  	struct pinctrl_desc desc;
>  	char __iomem *tlmm_base;
>  	char __iomem *slew_base;
> -	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
>  	/* Protects from concurrent register updates */
>  	struct mutex lock;
>  	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
> @@ -39,29 +40,47 @@ struct lpi_pinctrl {
>  };
>  
>  static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
> -			 unsigned int addr)
> +			 unsigned int addr, u32 *val)
>  {
>  	u32 pin_offset;
> +	int ret;
>  
>  	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
>  		pin_offset = state->data->groups[pin].pin_offset;
>  	else
>  		pin_offset = LPI_TLMM_REG_OFFSET * pin;
>  
> -	return ioread32(state->tlmm_base + pin_offset + addr);
> +	ret = pm_runtime_resume_and_get(state->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = ioread32(state->tlmm_base + pin_offset + addr);
> +	ret = pm_runtime_put_autosuspend(state->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

Just `return pm_runtime_put_autosuspend(state->dev)`, no need for extra
ifs.

>  }
>  

-- 
With best wishes
Dmitry

