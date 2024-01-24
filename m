Return-Path: <linux-arm-msm+bounces-8100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32D83A3A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 09:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C09E3B21114
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 08:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFC8F501;
	Wed, 24 Jan 2024 08:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XHYGjxFF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46475DDD6
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 08:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706083225; cv=none; b=IWeqkI7Q4VqANFssTFGwSyoEuhqyKsf7+tcKtfU+e6gREzc1tO8Q+/AAQxsk9LbkraW36eOzedzzX3yCpMNA9M9fxYGMHQd5ZkGAceiqnzy7puDYOztTxmj+0bt/IX6ez6fkPXBvpUNhhXxSGmmpI5/8fCb14e1OCthjjn0/Vhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706083225; c=relaxed/simple;
	bh=/bEI6exRXbMrKlRchtaF047fyMak5R6T7QRu1XvTVtM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=c+CdNvpCQZRn4RpQpcQhF/rfcpzXsBpIs7zoEHV21GOIfDJJVE3PVoOIfOSiH6tfYObYS8LpbYu44KeuM2Rge7F9oScLPZxU43efJBHiLMth8nzlbaKKiu/stQiFO0Cb0gSxKem9JUHdbui6yJYV7ofeisx7OcTAffe3mg0pFN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XHYGjxFF; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-559cef15db5so10901004a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 00:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1706083221; x=1706688021; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1iNsBQtek6e9skYq9Z1rL6ps6zVCkkZxhyX4dVD9qQ=;
        b=XHYGjxFFgI1fRsvplyYlecOOva0RicQzptTGHR977f6pRG/fdopNdmtBCIzT1KgPEM
         CRyHmA4hn+MU6fE0Ky2whDo/faublpfFwRJCHqwiHGoW0yPkFxOrVaUvZGjUKnvMxLAD
         bM+dxzMS0TF9jDozVHUUfSnIGPv8erHVsSNHdC/D6or4+wS7zjgzcV0WBGAetU7GZ5kK
         211PT2wof/QgoPR3rbY1dL0huKEyarS+FxFsN6Kmh/jUyuUCvi/oPyyPT627t9Czt6KP
         Saug+/Bt5wwTJ49kjZow1VEUkK+F8GjU0U5YlY3b856vW7VWvVWDA0KxJtfsssWYNYQX
         XKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706083221; x=1706688021;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1iNsBQtek6e9skYq9Z1rL6ps6zVCkkZxhyX4dVD9qQ=;
        b=fSmPTkFfEnIbYIVHwll1RLuqM4lIgAJmiTe0PSQfpbvHzzi7wQZt3Cu1DWQHM9HvqT
         IK9PpgprZqrrMW5mkwElvIyu2cPm7p5AXmIb/co5yQ1LtKCodssJbDq21pyxHW37239e
         VHHsNcyzWsnf7EhrXYEFIqSTlXCEi0ufldYb1JYl+O8DNwWIfGE6OtmPTLkm8kGfAelR
         wpbzwISChH3uz+OPFFKwQbNLwnyeg26QWVZxn5TOPXQNrW47KXIUiFCFNQUUeI/lyQBu
         IFRb2gf31E8loOqBWpRwCcFmxTRq+Ei/UB0zlZ3etTkThgz7HEVZ9f+lcNtYD8bo7PSX
         qEiw==
X-Gm-Message-State: AOJu0Yz+sLCNJIsklt5/a09Qgmnu16NvMnjvN85BmPOYLmbC2RKBv4yO
	2QOGHahKWfWLHVpw28PK20Cx40+rcCt1CF/nDeEFzpV80AJH4B5eEFDpEPa8CR8=
X-Google-Smtp-Source: AGHT+IGOfgJbOSQadnKGAiNooVHILk9J6Hx2PXu43Sowz5rh6eYZpKwjo0pLYhmByPKFPLpipcWFRg==
X-Received: by 2002:a17:906:9c88:b0:a31:2ebe:38af with SMTP id fj8-20020a1709069c8800b00a312ebe38afmr355681ejc.8.1706083220933;
        Wed, 24 Jan 2024 00:00:20 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id cd6-20020a170906b34600b00a2c8e9918casm14572641ejb.198.2024.01.24.00.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 00:00:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jan 2024 09:00:20 +0100
Message-Id: <CYMS0ZCCYW70.2S0E9NYRR6YPR@fairphone.com>
Subject: Re: [RFT PATCH v2 4/4] drm/msm/dpu: enable writeback on SM6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>
Cc: "Stephen Boyd" <swboyd@chromium.org>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Bjorn Andersson"
 <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
X-Mailer: aerc 0.15.2
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
 <20231203003203.1293087-5-dmitry.baryshkov@linaro.org>
 <CXSF8ZPWKRD9.9CMJU31KG4KP@fairphone.com>
In-Reply-To: <CXSF8ZPWKRD9.9CMJU31KG4KP@fairphone.com>

On Tue Dec 19, 2023 at 4:39 PM CET, Luca Weiss wrote:
> On Sun Dec 3, 2023 at 1:32 AM CET, Dmitry Baryshkov wrote:
> > Enable WB2 hardware block, enabling writeback support on this platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Hi Dmitry,
>
> I've tried this on sm7225-fairphone-fp4 but having trouble testing this.
>
> I guess I'm using some ID wrong with modetest, could you check and see
> what I do wrong?
>
> libdrm is on version 2.4.118 from Alpine Linux/postmarketOS, kernel is
> v6.7.0-rc6 plus a few patches for hardware enablement (like display).
>
> See log:
>
> <snip>
>

Hi Dmitry,

I've tested again now and made it work.

$ modetest -M msm -a -s 38@64:1024x768 -o test.d -P 45@64:1024x768

Then display the image with

$ magick display -size 1024x768 -depth 8 RGBA:test.d

As discussed on IRC it seems the byte order of R and B might be wrong,
so it looks like BGRA is the format we get the data in, not RGBA.

Anyways:

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

>
> Regards
> Luca
>
>
> > ---
> >  .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/d=
rivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> > index 62db84bd15f2..3c179a73c030 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> > @@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6350_mdp =3D {
> >  		[DPU_CLK_CTRL_DMA0] =3D { .reg_off =3D 0x2ac, .bit_off =3D 8 },
> >  		[DPU_CLK_CTRL_DMA1] =3D { .reg_off =3D 0x2b4, .bit_off =3D 8 },
> >  		[DPU_CLK_CTRL_DMA2] =3D { .reg_off =3D 0x2c4, .bit_off =3D 8 },
> > +		[DPU_CLK_CTRL_WB2] =3D { .reg_off =3D 0x2bc, .bit_off =3D 16 },
> >  		[DPU_CLK_CTRL_REG_DMA] =3D { .reg_off =3D 0x2bc, .bit_off =3D 20 },
> >  	},
> >  };
> > @@ -146,6 +147,21 @@ static const struct dpu_dsc_cfg sm6350_dsc[] =3D {
> >  	},
> >  };
> > =20
> > +static const struct dpu_wb_cfg sm6350_wb[] =3D {
> > +	{
> > +		.name =3D "wb_2", .id =3D WB_2,
> > +		.base =3D 0x65000, .len =3D 0x2c8,
> > +		.features =3D WB_SM8250_MASK,
> > +		.format_list =3D wb2_formats,
> > +		.num_formats =3D ARRAY_SIZE(wb2_formats),
> > +		.clk_ctrl =3D DPU_CLK_CTRL_WB2,
> > +		.xin_id =3D 6,
> > +		.vbif_idx =3D VBIF_RT,
> > +		.maxlinewidth =3D 1920,
> > +		.intr_wb_done =3D DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> > +	},
> > +};
> > +
> >  static const struct dpu_intf_cfg sm6350_intf[] =3D {
> >  	{
> >  		.name =3D "intf_0", .id =3D INTF_0,
> > @@ -219,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg =3D {
> >  	.dsc =3D sm6350_dsc,
> >  	.pingpong_count =3D ARRAY_SIZE(sm6350_pp),
> >  	.pingpong =3D sm6350_pp,
> > +	.wb_count =3D ARRAY_SIZE(sm6350_wb),
> > +	.wb =3D sm6350_wb,
> >  	.intf_count =3D ARRAY_SIZE(sm6350_intf),
> >  	.intf =3D sm6350_intf,
> >  	.vbif_count =3D ARRAY_SIZE(sdm845_vbif),


