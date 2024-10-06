Return-Path: <linux-arm-msm+bounces-33271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F12839920F4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19C531C208A5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAA718B467;
	Sun,  6 Oct 2024 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jGQlmBjy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A3B18A936
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728244312; cv=none; b=Xjq9LcyebfxiMdVS+9YBXErEqScpdArYl+wWTlaZe5AfGxOssjxrrQprXcaqKkiBfr84jXh6l1bkzlIAeAFeJPxafNgbMh0ZyC1vZoK81DduGM6FUS9kfkBlgD6MKSNHz7ndE8ZsdqLKdSSbfX+k/pbezJP3YxGwlhDC/5bFE/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728244312; c=relaxed/simple;
	bh=9lt1no/KUIGnHTDCEfU0YumPhaO03NFlOojFAlgorYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rv6H2KGv5j9+ftQ7X/Va9LANxUv3i1rfyw+80nKJ8kK95tveIrIo8P0uxLYKJGmfhX+zrkerQNyUdkGQett+JXnUwD+28HIlFHEBR53pDWdE6/8aIunF3UJDDIFBvOyAalTsoahW8fsIdxZXkkvInbAa/vfFN07dhaK8BCHE/sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jGQlmBjy; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fac5eb10ceso34125941fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728244309; x=1728849109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HLQ0qGbobuBRSeV4tlw8iWIHrFfzRjusLkYkkaznzmM=;
        b=jGQlmBjyO5RKptN4wC0u3UlLJoZJjv6qEHiAI3X/2cjtfmlfHwlMX8OehMolMT2Ugr
         u5Ni3zqWbRxguR5oNb+DcJhlMikRNGKu7rnx5cyG3O6kAlHqwLbM+M1ivLYIQoZDO08N
         NJW53HxBbbT2AJxaVf1+AtOnYWUecgmGW/OR4Zi4d6bSMOPtE7aiU6wIsepk4L6JZDxX
         lib3sGxjRqR1CRXMnp8TCEw08p1xsXHCO8upmtzfJLeIOvGhaEIrQqNkjcyUB6CMifaE
         d2qqhxS7gYu+OkN5UNCRpkFS0HavP228pqdfv5VfoIGB3SbMyLJwj9HVlc/KTQhQaCZV
         gs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728244309; x=1728849109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLQ0qGbobuBRSeV4tlw8iWIHrFfzRjusLkYkkaznzmM=;
        b=OUD9Sja1h/NVGtl0PlgnlLZb8yYT4lH86csPda2Zj5v+wpLBtBdHzml2ohIMvp4tkO
         s8nPzRlspEz/rgj4HySdaIFBmO5cZ4+PWZDW2Q/7yE6rF8r2xEt7DzNPdARMwq/3aQ49
         bo1XNCTb6uARmcqnbjbjH0sJW8urEMKHcBZmpuGBOv7gKQ6PRlZf+5oxeXNZsKwmfMHT
         U8THriSmKacRKNmXjzlZqxdk40bliCygshWURxblTeMOiAFLLkoh3jNx/VL0iRbdiE0+
         x6pS7OYn9yVX+YhxMwAKH8J3v7Eu7a7I5glFbZNKvesamRA9F4cnDgblDDhWPdpMpP2H
         YhJg==
X-Forwarded-Encrypted: i=1; AJvYcCVLtCRBy3VrjcbCsygC0q9dBF0QJw/+GnXF94lmfvzA8pRYmD9aYoePuHWRKhEHJ4p9zn/GAsY+Um8O5Xmo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3RByfvvU50ILutHs1RZLLmGMJF43ptAI/G/9sJ3oLoaiAUhUN
	NwqqqiFrr4Y09pLRQ1cGIDbexV/X55GetZVk9OMcKJy54/Z5tCdRpD0u3DIUllQ=
X-Google-Smtp-Source: AGHT+IGRatu8NXdtFSTYD4sGTrAK8KQ3y0hxb5hgGzJcApZ29zymfe86p3XYxT0wL94dtWg73UlkWQ==
X-Received: by 2002:a05:651c:b2c:b0:2ef:2c40:dd67 with SMTP id 38308e7fff4ca-2faf3914675mr32011581fa.3.1728244308751;
        Sun, 06 Oct 2024 12:51:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9b329dbsm5920091fa.105.2024.10.06.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 12:51:47 -0700 (PDT)
Date: Sun, 6 Oct 2024 22:51:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
	andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, robdclark@gmail.com, 
	quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
	airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, 
	quic_parellan@quicinc.com, quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
	quic_vproddut@quicinc.com
Subject: Re: [PATCH v4 5/5] drm/msm/dp: Add DisplayPort controller for SA8775P
Message-ID: <wdslr77zwyyyesf47qmem3wmextrjfh5do4ckrk6vvzeqwi5gu@x3sxgiusspqp>
References: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
 <20241004103046.22209-6-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004103046.22209-6-quic_mukhopad@quicinc.com>

On Fri, Oct 04, 2024 at 04:00:46PM GMT, Soutrik Mukhopadhyay wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss, having different base offsets than the previous
> SoCs. The support for all 4 DPTX have been added here, and
> validation of only MDSS0 DPTX0 and DPTX1 have been conducted.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: No change
> 
> v3: Fixed review comments from Konrad and Bjorn
> 	-Added all the necessary DPTX controllers for this platform.
> 
> v4: Updated commit message
> 
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e1228fb093ee..2195779584dc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -118,6 +118,14 @@ struct msm_dp_desc {
>  	bool wide_bus_supported;
>  };
>  
> +static const struct msm_dp_desc sa8775p_dp_descs[] = {
> +	{ .io_start = 0xaf54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +	{ .io_start = 0xaf5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },

Please take a look at other device descriptions in the file, note the
difference and fix your DP description accordingly.

> +	{}
> +};
> +
>  static const struct msm_dp_desc sc7180_dp_descs[] = {
>  	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>  	{}
> @@ -162,6 +170,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
>  };
>  
>  static const struct of_device_id dp_dt_match[] = {
> +	{ .compatible = "qcom,sa8775p-dp", .data = &sa8775p_dp_descs },
>  	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
>  	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
>  	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

