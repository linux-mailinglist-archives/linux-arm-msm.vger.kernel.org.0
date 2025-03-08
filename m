Return-Path: <linux-arm-msm+bounces-50709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A301A57B8C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 16:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2E2D7A7261
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 15:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2680D1DE4E7;
	Sat,  8 Mar 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSkUByCX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B29A1DD0D6
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741447523; cv=none; b=kudL6gVY2nWfPZQ+j5crfRIRy4f+qquax0e+hnjtaMvH5Hzs3vmEnjVYaW8KdNbLR5CjhiChJ5YPtXKzA9ztNUmRE4gQysTZLqNigBreyC/P+yv9L/bU4LnBYfYVbwhp6naBknhDDxEjHmqWSfo2FWI5LMLnNGMPdVdMyA9oSeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741447523; c=relaxed/simple;
	bh=ffB1xJN8TgDrXjwkJtY5En7Rvk6xDEMsDSqKlqlZbog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLfjhCqEA1AuWDdcnN6jUsDlrkidSnalwX0UE5oFZyK5wo7wIWwoRxxxh976eG9nT+vl3Nq7IiD1w3r5KE95J1NBsQw0MtrC9QeuTGhc9H4VXt8u2F8ip+EDry+bbj3UeOP4KifzE9xHD/CNU7Cqx4BZWEAYy0fZiZIZulA3ANM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tSkUByCX; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30795988ebeso29195961fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 07:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741447519; x=1742052319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HKBg6m2ZBD+SRolEbJmxTaEbWBs0aYZ+E9F5kWCXB5g=;
        b=tSkUByCXQsPRcsG1TuKAhV+/EhmPg21UJUzAc1PDNvEmKQbDtnM6UYRRbM9MvOpkj2
         19ALnCVPQSGvtcdwkzLtPMnvMJ+dLzheXYrEzMQ5V5BqQ4L40ytHu1LmLDYksYSLD0m6
         3bS/+loajf0cLj5IMPsPijZOguzLIG3o0sAcncMqVZjcsmtQvDgn/tN/RRrur41wJI5t
         T+nUGexjnCFSHfVAxdSfG7IAOYSgpvGmfree30h1mUxE/YQ7e3+p8zcIh4+fkWwkrRuF
         WPRNa9c5Go0ayC6wpxAyuZqKBdc8a9y1b2wN9IKSS1M9eEK48sBjALB8MfXbXtakZ7Op
         k0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741447519; x=1742052319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKBg6m2ZBD+SRolEbJmxTaEbWBs0aYZ+E9F5kWCXB5g=;
        b=LFvlnlUuDmUhrDbT2GlG+YhCQyKRbQvvvbCuIgEoQxuHIII5c7FLdUH48ARHzosj3d
         tFUpWwHKbM7VHWfU56Amh7y2coAj1cR7ct5RbBktboPsTKVRfyVQzD+fNbxUIsI0gUnv
         7wO6wXWbuQ0qC7iYLF8b1JpOWFH3f3/+pLUTkDhMGzUqDo6EbxIpJzZu9it5J1BbOjEU
         5v7zxEYaIqrqxxvtV54K/4a+XmnW1TGb4ET7AoPU6wpSoHpEY5Y1Jcb5rrQUNTeCh/A2
         Js2utm2f3WKE/qXTS6Q/qh5oin7jNLmCfZ9gb7PUCVkwLJk2zbCHGoU/PZA7xWkrqGuO
         Rwjg==
X-Forwarded-Encrypted: i=1; AJvYcCUvQTEgOG/XQ6bBw8L7rw14IKvxW6l5CKjLSUfiBpkZjI44rDSPaN6+p+6zGUGnndRK3QvkuWBQheDs/5w4@vger.kernel.org
X-Gm-Message-State: AOJu0YyJsFnrE6nDOMbQ9wnQHsyTYxKfk75miQIfpbtjJLBhNoP5JKkx
	nCJvZmTqwxGimmIf3c7bSRFmsGb07OvIhdWxGEjK6ZzcTe8/O0Marqovuq7UmzE=
X-Gm-Gg: ASbGnctqokLCdJOoPxiD0ukesBwSriEgC7NrpLpdZqwtAloKysDiGuig0hNGAJgFVvd
	ZYU5yfuiwHHFjmH4lzR5LbCy4tYBhJtSZfXKSLniFOSXSCK/+PS6SFtPnqp5PtPB4GipU3wFYWx
	ROO5v6jrHnYRsZeBSkQVZZK64HS6f/A8efK897i3eZu+C8awDGuzwmcIY9nbIHEmaK3B9k1TZeV
	JwdEZEYDSou+7VTtIfnZ9rto0QFyMwyexhjKbwWcKHygv5ae9hBPo8+xIU86TrGHwl0Dv8MnIZf
	A1ttm+D7DZctKakbMr3pnzDofglLtAGsUo9QK1T9tq08d0/+wCJVKOyM2ifIrp7GHm2FuOm6oMi
	UKYoswBZZ0nXio0tpRkmheVF/
X-Google-Smtp-Source: AGHT+IGa+Ul+zGmtbtHzOv+NiUo+h+jc38TvQkxrCnLVKsfBxUNjbh9YNgRAJWxI0GRtuRncaHMZ6w==
X-Received: by 2002:a05:651c:19a1:b0:30b:ec4d:e5df with SMTP id 38308e7fff4ca-30bf466dbcfmr32754081fa.34.1741447518937;
        Sat, 08 Mar 2025 07:25:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99c85c0sm9452071fa.87.2025.03.08.07.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 07:25:17 -0800 (PST)
Date: Sat, 8 Mar 2025 17:25:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] drm/msm/dsi/phy: add configuration for SAR2130P
Message-ID: <qextyfjeniihulyilehcldd5x5pdpaxo3etstlcq4a43cka3a4@4n3mqkjjysqt>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-7-1d4c30f43822@linaro.org>
 <53c3d2c3-2bfb-43f9-ad25-0d1fdd96f19f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53c3d2c3-2bfb-43f9-ad25-0d1fdd96f19f@oss.qualcomm.com>

On Sat, Mar 08, 2025 at 03:17:23PM +0100, Konrad Dybcio wrote:
> On 8.03.2025 2:42 AM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Qualcomm SAR2130P requires slightly different setup for the DSI PHY. It
> > is a 5nm PHY (like SM8450), so supplies are the same, but the rest of
> > the configuration is the same as SM8550 DSI PHY.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
> >  3 files changed, 26 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > index c0bcc68289633fd7506ce4f1f963655d862e8f08..a58bafe9fe8635730cb82e8c82ec1ded394988cd 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -581,6 +581,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
> >  	  .data = &dsi_phy_7nm_cfgs },
> >  	{ .compatible = "qcom,dsi-phy-7nm-8150",
> >  	  .data = &dsi_phy_7nm_8150_cfgs },
> > +	{ .compatible = "qcom,sar2130p-dsi-phy-5nm",
> > +	  .data = &dsi_phy_5nm_sar2130p_cfgs },
> >  	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
> >  	  .data = &dsi_phy_7nm_7280_cfgs },
> >  	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > index 1925418d9999a24263d6621299cae78f1fb9455c..1ed08b56e056094bc0096d07d4470b89d9824060 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > @@ -59,6 +59,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
> > +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
> >  
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > index a92decbee5b5433853ed973747f7705d9079068d..cad55702746b8d35949d22090796cca60f03b9e1 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > @@ -1289,6 +1289,29 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
> >  	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
> >  };
> >  
> > +const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
> > +	.has_phy_lane = true,
> > +	.regulator_data = dsi_phy_7nm_97800uA_regulators,
> > +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_97800uA_regulators),
> > +	.ops = {
> > +		.enable = dsi_7nm_phy_enable,
> > +		.disable = dsi_7nm_phy_disable,
> > +		.pll_init = dsi_pll_7nm_init,
> > +		.save_pll_state = dsi_7nm_pll_save_state,
> > +		.restore_pll_state = dsi_7nm_pll_restore_state,
> > +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> > +	},
> > +	.min_pll_rate = 600000000UL,
> > +#ifdef CONFIG_64BIT
> > +	.max_pll_rate = 5000000000UL,
> > +#else
> > +	.max_pll_rate = ULONG_MAX,
> > +#endif
> > +	.io_start = { 0xae95000, 0xae97000 },
> > +	.num_dsi_phy = 2,
> > +	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
> > +};
> 
> I'm squinting very very hard and can't tell how this is different from
> dsi_phy_4nm_8550_cfgs

97800 uA vs 98400 uA is the only difference AFAIK.

-- 
With best wishes
Dmitry

