Return-Path: <linux-arm-msm+bounces-35257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ACC9A69DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 15:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFAE0B213D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 13:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921E31F427E;
	Mon, 21 Oct 2024 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wqZZN1J7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8026C1E884B
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729516446; cv=none; b=fkRMIYV3EYFdsFJpK0BrtsuVYY5N8y+54bUAsfoFHPzEHMVDETIRdiXHMmFOxk99nJRMI+HbFduEVXMmc8fCoJX59T0UFh/hkXF4gkX3OkWStQF9buEear8xTB5DueQrJLcBnNNAS5D3LqcFXUDm4sJWxxqnQ1hgOZtzeqQmX48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729516446; c=relaxed/simple;
	bh=x9yG3MBn1vkK+WDBnEoO/PPa0GRvaGfLCFIBWnUj9vI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEABdOr80QA6/rviFIbRAVqmP9qDvpKbtBBeMvoyDKzdUmIehhx1Z4NO1sHGD9xTi0U7x/66liEMMwSRuXTqPb5Qj+AdqBvXfdw//7vwYdiTV907qQhneJqs+X1qgjrJh9DV08LFGybpywRAiHljp1ngV9TCjz1yhThgfgnOqgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wqZZN1J7; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e38ebcc0abso47462647b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729516443; x=1730121243; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7erg8vrrwhLwTJ4vsjvKgNC1A86srGjOS44RXukUWE=;
        b=wqZZN1J7T1PoLur+u6+vlGPjHezjIbCYdoRPChHqi4jjvv3yCQYaAAfL5rJj4b8p+f
         kOoLjPUbUSjIWxUmOtbLihlqIeELC/8sjmMXazzQomxYrye0qGenutkRX2iwNkUQdDf/
         dCOQFUajW9MVrM+JShWOQwCVl4LU6xfOxaHAFfC95JCGsM5HVkyf/2cCf1uxXXR0Nhr0
         tB/Ca+21SXaLH1R3ohOU/wRokr7wS1Q+X05CIiO0HSMq8BgRMgW/8ZNJvurXFrRvfp9w
         e8zRH12LJb+kUZVd9CeEQSXQ/jSG43y/htey3qfT7acMb03vLlDc1XW3yymS1ZQNPcWM
         8x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729516443; x=1730121243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7erg8vrrwhLwTJ4vsjvKgNC1A86srGjOS44RXukUWE=;
        b=A06Ha6nqPs4swffFXhWUOeQCBkshWEdrFYMW0IdWd7+bQGMju+k6tC8Gw45/jVm0rN
         z4FwRZ0Seh5GxJ4hfFgQSD+mPQ5J0yKnm3bDtFV3l2Jte486OP1xX4LaytcsX20S34ZI
         cPOKRtujBLK28FxWZDdoNkixRLyA+NLNYFaluL3s5i03agx1rqFABgakcUx1k0uTssfK
         +8fC7/WIW6wMYLtJU4ua5CnMUY/87CxPuscwq9Teddamj4FjxJ2PWxZalufxpMWC08C1
         NlDPbObNHlGRQRt895YzQM71mrwc8M8m2xwYx1mTYCAT6BbHEuceH5kMMDw92avBISmN
         f+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWNjPex1NNQeUZnEpNAlaCK/LPXiRocuacbUBY1po2AFpHL6qk420WcHNcjhILqySpD+CoXQZuWKSGMry3B@vger.kernel.org
X-Gm-Message-State: AOJu0YzaFkmTuZUX0zf9LtbW09G30BlJqbo3SE1WdyfMRGQQEW0gdk8u
	NrIWhWy8UB7ikkXIQdI2hKtwbtgIhlzkrvFKNb5/8ztYHzc0bFKylElKUtQqMzXhdpMaIrAFIrs
	/RNQgM5FCH8mWMSvGuAxbY7pBFSAy03i2sf/Zqw==
X-Google-Smtp-Source: AGHT+IGJ9USpRoWSI7sBmA4N3tw//QAZfbQQ0ijGIXzkFPl+Q/rOF3E6ZVe4QumN0Z18GXDkKnNi8cp+VDSqifxCnH0=
X-Received: by 2002:a05:690c:f8f:b0:6d3:f9a6:e29c with SMTP id
 00721157ae682-6e5bf9a0846mr102792247b3.12.1729516443131; Mon, 21 Oct 2024
 06:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019-sar2130p-llcc-v1-0-4e09063d04f2@linaro.org>
 <20241019-sar2130p-llcc-v1-2-4e09063d04f2@linaro.org> <7fa066b6-a214-4866-9d0a-f75896531d84@oss.qualcomm.com>
In-Reply-To: <7fa066b6-a214-4866-9d0a-f75896531d84@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 16:13:51 +0300
Message-ID: <CAA8EJprvQTGABZ6LAq1qXRfPgOz7VzxPuKnRz_EO_4S6tveXgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: qcom: llcc: add support for SAR2130P and SAR1130P
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 14:04, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 19.10.2024 6:26 PM, Dmitry Baryshkov wrote:
> > Implement necessary support for the LLCC control on the SAR1130P and
> > SAR2130P platforms. These two platforms use different ATTR1_MAX_CAP
> > shift and also require manual override for num_banks.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/soc/qcom/llcc-qcom.c       | 468 ++++++++++++++++++++++++++++++++++++-
> >  include/linux/soc/qcom/llcc-qcom.h |  12 +
> >  2 files changed, 474 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> > index a470285f54a875bf2262aac7b0f84ed8fd028ef1..ef84fe3b2af4e777126a8308bfd4ec47b28aeae2 100644
> > --- a/drivers/soc/qcom/llcc-qcom.c
> > +++ b/drivers/soc/qcom/llcc-qcom.c
> > @@ -32,6 +32,7 @@
> >  #define ATTR1_FIXED_SIZE_SHIFT        0x03
> >  #define ATTR1_PRIORITY_SHIFT          0x04
> >  #define ATTR1_MAX_CAP_SHIFT           0x10
> > +#define ATTR1_MAX_CAP_SHIFT_sar       0x0e
> >  #define ATTR0_RES_WAYS_MASK           GENMASK(15, 0)
> >  #define ATTR0_BONUS_WAYS_MASK         GENMASK(31, 16)
> >  #define ATTR0_BONUS_WAYS_SHIFT        0x10
> > @@ -140,6 +141,11 @@ struct qcom_llcc_config {
> >       bool need_llcc_cfg;
> >       bool no_edac;
> >       bool irq_configured;
> > +     /*
> > +      * special workarounds for SAR2130P and similar platforms which have
> > +      * slightly different register mapping.
> > +      */
> > +     bool is_sar_chip;
>
> This is not the only odd ball, please make max_cap_width variable

I'm not sure what you mean here. Moving max_cap_width to the drv_data
/ configuration? Or do you mean something else?

>
> [...]
>
> > +     /*
> > +      * For some reason register returns incorrect value here.
> > +      * List compatibles instead of using .is_sar_chip since there might be
> > +      * SAR-like chips which have other number of banks.
> > +      */
> > +     if (of_device_is_compatible(dev->of_node, "qcom,sar1130p-llcc") ||
> > +         of_device_is_compatible(dev->of_node, "qcom,sar2130p-llcc")) {
> > +             num_banks = 2;
> > +     } else {
> > +             ret = regmap_read(regmap, cfg->reg_offset[LLCC_COMMON_STATUS0], &num_banks);
> > +             if (ret)
> > +                     goto err;
> > +
> > +             num_banks &= LLCC_LB_CNT_MASK;
> > +             num_banks >>= LLCC_LB_CNT_SHIFT;
> > +     }
> >
> > -     num_banks &= LLCC_LB_CNT_MASK;
> > -     num_banks >>= LLCC_LB_CNT_SHIFT;
> >       drv_data->num_banks = num_banks;
>
> This too

This can probably go to qcom_llcc_config.


-- 
With best wishes
Dmitry

