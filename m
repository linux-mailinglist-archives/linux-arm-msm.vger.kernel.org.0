Return-Path: <linux-arm-msm+bounces-31809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7604979D4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 10:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7D961C22D79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 08:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6A3147C9B;
	Mon, 16 Sep 2024 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lW82FDGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A20E13C8E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726476925; cv=none; b=JkLYWFEADvDzyxTCQ4a6t3d0agKN2YFASOdQYkCQg7TYJhGNFS/eZa3EfT/YrL8UnFrykUujyQM3cyveDH4L3B28NW00muALPkutfhaEPcI7rmyuacIzZk2AD9JoG525u4t3chl+VIZJzTsbIb77rLPMhcgUYl1Ulo9kNiYmOcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726476925; c=relaxed/simple;
	bh=E1VyYQAQurwU8p+dmCtqZx+FfsqwR9JKSuHmyzm/i8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ms0MIhwTZwAFgP/llbJ8fNCbcMuh2SLBeKR/66VaWvKT+zQDRZy5I2h63Z5IUlOD7wrXWn1Kp/Pywaqo1CZ9/It3cpawpu/zk9UFDcH5HxqeupOntw5FvsWJsZjJf9OtxAzMPK7tH1YcsjQ023q1Nk5uIVfvLFqztOunTRDpGrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lW82FDGa; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53658f30749so4248112e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 01:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726476920; x=1727081720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xR2jDKAsU3oH2uxMnF0+jo329Pwfq7dBz/E22uv0AZQ=;
        b=lW82FDGa3Xyz94la5QhkwSNbbQJupNC4HqxsS5tVX7d6oc6O8DnrARB/hcUppr4y+t
         qYrWQb+MkP8uliAyDBV1S45P89S8FS/G0MQljSb2zDbGIqOlnqfTiIEAE2H43njv9PzQ
         /qadxxUe3gdL+pHKBcl1Okv/tUwU00h4eVIoDWInC4/JgM8hiPzdqDfNQksyrsdRF/8M
         EDJCgUciXVmB1hydOlrmmhXo6krhWYN5QPcS230BHYdO1spSxGGelHg6zFegntk5bmsh
         AUIDEfZ3b4gf8VRJ5+gmR4LwCAd7iw+sKdBcSdBDSO7ymwYuF4l4W4OYlL8ueUdY9h8r
         E/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726476920; x=1727081720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xR2jDKAsU3oH2uxMnF0+jo329Pwfq7dBz/E22uv0AZQ=;
        b=oMC+LTn7xHkNWWl9jBgRRLtC5wDm+Q0J9XMojhj8TBlfMz2ahbeoscARnfiFE9Hf9k
         8PJYVaI2tyBmJCOaMUzPSyQxQHm2dXaQGj/1E4h+Ynh6SH8uYyN0yRJQPxRe6bx0YZGq
         STS+avKuRzB+nBbcVzPjAxNesJta3cYsaHcF6XDebQHehsT+uty+76TsJu2NS8XpFnnD
         ijFusNfiUFZLO/5b+rYFHVfPbb0hWGOgxnZ/WZr3wv6nJaNKtHW7K/eDflIGdvS19E8N
         bFw7R8F2ELvnuh6Kh8DW7gYvUI55lJxC0U/p4JBzlXckJkdrw5KN+D8jHrGbkNUuov5+
         JC4g==
X-Forwarded-Encrypted: i=1; AJvYcCXwSmqpPd9x7nawVfSdatsNVTUFgjT5iTp26wtg9eIieMZ+aJNqV3PVbVDHaiGKGmX8mwLgxe+3ah9B5+Wr@vger.kernel.org
X-Gm-Message-State: AOJu0YxYtKA7g+vJAbGLgsqEcqE/Bu+xpIPn5NHgu4Jh19hdpEYxb/jB
	nfQgRUDO07l+jsJEdma0UI4xmI6YjDLBkNvkzFu66gKVBfc2cAJUDmVPCOkiUa4=
X-Google-Smtp-Source: AGHT+IHDgMPI5T0jfG61Jbaz3vU73dD+DIaHA1ZXDycd61JvCkYD4pYWwuEBP/jGdSBOxVH4v/LUsQ==
X-Received: by 2002:a05:6512:2352:b0:535:3ce5:6173 with SMTP id 2adb3069b0e04-53678feb5e9mr8380576e87.37.1726476919287;
        Mon, 16 Sep 2024 01:55:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870466ddsm809521e87.25.2024.09.16.01.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:55:18 -0700 (PDT)
Date: Mon, 16 Sep 2024 11:55:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, quic_imrashai@quicinc.com, quic_jkona@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
Message-ID: <ya6aqhq27mizdozfhaa6evwt6kqjdryafozdxvwdm3l75cfd24@wloodcwrgkyu>
References: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
 <20240816-qcm6490-lpass-reset-v1-2-a11f33cad3c5@quicinc.com>
 <67819a53-8e99-469b-a458-8c00034fec4a@kernel.org>
 <936f151e-6951-4dea-95ed-35374ab249cf@quicinc.com>
 <9b3350ba-eafe-4bb0-a6cc-f1b0a06d623e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b3350ba-eafe-4bb0-a6cc-f1b0a06d623e@kernel.org>

On Mon, Sep 16, 2024 at 10:33:21AM GMT, Krzysztof Kozlowski wrote:
> On 13/09/2024 07:31, Taniya Das wrote:
> > 
> > 
> > On 8/17/2024 2:55 PM, Krzysztof Kozlowski wrote:
> >> On 16/08/2024 10:32, Taniya Das wrote:
> >>> On the QCM6490 boards the LPASS firmware controls the complete clock
> >>> controller functionalities. But the LPASS resets are required to be
> >>> controlled from the high level OS. The Audio SW driver should be able to
> >>> assert/deassert the audio resets as required. Thus in clock driver add
> >>> support for the resets.
> >>>
> >>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >>> ---
> >>>   drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
> >>>   1 file changed, 19 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >>> index 45e726477086..b64393089263 100644
> >>> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >>> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> >>> @@ -1,6 +1,7 @@
> >>>   // SPDX-License-Identifier: GPL-2.0-only
> >>>   /*
> >>>    * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> >>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>>    */
> >>>   
> >>>   #include <linux/clk-provider.h>
> >>> @@ -713,14 +714,24 @@ static const struct qcom_reset_map lpass_audio_cc_sc7280_resets[] = {
> >>>   	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
> >>>   };
> >>>   
> >>> +static const struct regmap_config lpass_audio_cc_sc7280_reset_regmap_config = {
> >>> +	.name = "lpassaudio_cc_reset",
> >>> +	.reg_bits = 32,
> >>> +	.reg_stride = 4,
> >>> +	.val_bits = 32,
> >>> +	.fast_io = true,
> >>> +	.max_register = 0xc8,
> >>> +};
> >>> +
> >>>   static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
> >>> -	.config = &lpass_audio_cc_sc7280_regmap_config,
> >>> +	.config = &lpass_audio_cc_sc7280_reset_regmap_config,
> >>>   	.resets = lpass_audio_cc_sc7280_resets,
> >>>   	.num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
> >>>   };
> >>>   
> >>>   static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
> >>> -	{ .compatible = "qcom,sc7280-lpassaudiocc" },
> >>> +	{ .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
> >>
> >> That's odd to see sc7280 reset added for qcm6490, but not used fot
> >> sc7280 at all. Didn't you mean here lpass_audio_cc_qcm6409_desc?
> >>
> >>
> > The resets descriptor(lpass_audio_cc_reset_sc7280_desc) is not part of 
> > the global clock descriptor(lpass_cc_sc7280_desc) as these are part of 
> > different regmaps.
> > 
> > On a non-QCM6490(SC7280) boards the resets are registered after the 
> > global descriptor is registered.
> > 
> > But on QCM6490 board we need to register only the reset descriptor and 
> > no clocks are to be handled/registered and thus passed the match data 
> > for QCM6490 boards only.
> 
> Yeah, but why this is sc7280?

Because it's more or less the same HW, different TZ and hyp firmware?

-- 
With best wishes
Dmitry

