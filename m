Return-Path: <linux-arm-msm+bounces-8883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 331BC840961
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 16:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56DBF1C20616
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 15:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB99D15350B;
	Mon, 29 Jan 2024 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dhpoJEei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F76460DEF
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706541098; cv=none; b=I1+FcKZu6s+EK7NrXA3XiQpSJjM3Lgu68FmZp/q3CRorPKU9lhfBfoVI4EG8dyCMnBsb/mblB0NRrUOf42HSb7tz5Scs50FRWylg32NsCO1Jr5OAFbGNgE+HWxp5BTXDUBMURiZ9pxviK16Ya40eNJC7B0LrkqhN6v2H1hPiBSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706541098; c=relaxed/simple;
	bh=9nsjKbF44TZVOpRRhZM1tTFEG6Q2yx+wTpzjkefq/BU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjRxMjlFIppSKcvyHlM3o1lDcF3uf7Ym7OfxdRfApDlbXIW6gn/pPyN5YKBR7Fk09xklC+B0t8uWb4XCkuclzDRxnItSOuBVD3r6pKQ8iPjs57w+VBFPOV935R13csb1Jgy0h3h7gNAjrRHzTMS6+2y+8POiL7BhqxmG0N4wYhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dhpoJEei; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dbed0710c74so3029685276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 07:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706541096; x=1707145896; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bzxGAI3uTZ4t8Yu0tkeNdDJhjt+ClUZzfi+ZIweVgvk=;
        b=dhpoJEei9DOtTEllCvaH9j38QWx9poPJhpgV3TvC4Zo1D9/0neIzuRd5+f2iLicbIM
         kY/9E03vPdupbEMBcb8mntVTRBiBKjsDn+Uu75nBb0M5COTaY41oz/Ukji+H4KoDLTOd
         XXTV0yk/sJ8g6BLSykSS59rcTYVYdprtvowfEm/tB9rWCObEBATxoCLWv0FvxKRWvsdn
         yu4OPz/ZASPt/Es601yFVsnBR/FWOgeJJIyOrQ5joMzGs6SruNMatFMDs5wQeOlWABu4
         8lKVBTVNDG3X334w+KV3Nnpfw9MS1O8LbMW7gy/rvS2EmwDpXTMltbbEQ4unEXH4Ljqr
         K7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706541096; x=1707145896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzxGAI3uTZ4t8Yu0tkeNdDJhjt+ClUZzfi+ZIweVgvk=;
        b=pN1w2ipL3gCNBkSnZc9jAFuvkqR9rYDhGYot6AvcxmMGYUP+FSyK7ddnPu0DSedFDl
         5AD5w39xhGVJ9U4lsaEfwiCLhVk0tOMP7EN6YPqWUx2HI9K7OHL3suEkMS9ZVtACRLZs
         wyH81CR9/onpVpon+EozNIwquZhBtI5jLzR+RTLK7L8yOc/RSiLPY4zDuAD50Zx9W3Ax
         6tWCritON0TFwpUBBWEoO3BuKJaeLUGd31VgfxbT6XLztclugzKyMO9QQfbIoZ1IFC+0
         lUmzvyCwam7WSXdfoKPb1VN5IFcjuyKIh9+xMfeeB0mnSLUKPVbhrXNiykJJj115C37Y
         p69A==
X-Gm-Message-State: AOJu0YwU6CkmLkMdOvfuGyVNhtWri6vd6eKrCu1dAdhA/qNqr2fiZQvY
	8RBqDmFKUViBOWng8hQodzXFYlqU/Ny67DrhK8FCzVXkvornqS6KKiCafJJEh42ttOWE0DNNIsj
	Xky8NqCff0ykg4+xPlSjrcxNITpnfV+NN1lP8FQ==
X-Google-Smtp-Source: AGHT+IGTMQ/BAh4UMgioJdLPcXsz/GX4p8hJbTGo1lQCHr2AEV10T3HvflCpK8wmeYx9XsAaaWkgqAghpN7LLUDOvks=
X-Received: by 2002:a05:6902:2808:b0:dbd:ac60:bcd4 with SMTP id
 ed8-20020a056902280800b00dbdac60bcd4mr4890852ybb.75.1706541096178; Mon, 29
 Jan 2024 07:11:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org> <20240129-x1e80100-display-v1-3-0d9eb8254df0@linaro.org>
In-Reply-To: <20240129-x1e80100-display-v1-3-0d9eb8254df0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 17:11:25 +0200
Message-ID: <CAA8EJponbo2vvuj2ftCQuxtrZp0w7JQqJ_ADF80Wd2y1V74BzA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add X1E80100 support
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add support for MDSS on X1E80100.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 455b2e3a0cdd..eddf7fdbb60a 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -564,6 +564,15 @@ static const struct msm_mdss_data sdm670_data = {
>         .highest_bank_bit = 1,
>  };
>
> +static const struct msm_mdss_data x1e80100_data = {
> +       .ubwc_enc_version = UBWC_4_0,
> +       .ubwc_dec_version = UBWC_4_3,
> +       .ubwc_swizzle = 6,
> +       .ubwc_static = 1,
> +       .highest_bank_bit = 2,
> +       .macrotile_mode = 1,

Missing .reg_bus_bw, LGTM otherwise

> +};
> +
>  static const struct msm_mdss_data sdm845_data = {
>         .ubwc_enc_version = UBWC_2_0,
>         .ubwc_dec_version = UBWC_2_0,
> @@ -655,6 +664,7 @@ static const struct of_device_id mdss_dt_match[] = {
>         { .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
>         { .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
>         { .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
> +       { .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, mdss_dt_match);
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

