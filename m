Return-Path: <linux-arm-msm+bounces-32293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A719845CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 14:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39DDC28141D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3711A724E;
	Tue, 24 Sep 2024 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NozaKVRr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879AC1A7266
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727180204; cv=none; b=g8vUrw7cUqs29g8K8T98W11aLdFjyh59Pnakgi3VZlbHVNCAnMCe+HQjghlzsV/zVYKqG905mJDZLJ3xDdmstdvphZLoRVthrPwAxcGaIZsRRdBFaUAzUnP3Cd5oPmZUgAZwGYUqpOZcTBne0r2RzNDoCynNO0zyTWPRFNUbZ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727180204; c=relaxed/simple;
	bh=f0WjRCWB3BT+gitlWSkmtisB2gJBrgB3iVCdniaUxQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYe48rBE2caXhG7hctt4m3xE3eAvOlVLQwkVTLw4ww5+sKp1MiiaHpjjrtVivISFarW+L0PCxPpe8ZKDvB1JGMifAgGzWZV20GY+CYp0PypICpVgeJiVooAGxMXPu8+9xkGF9zuLyaLtumG7lOOMamS+XlXyFjM8JbbTfq1kUiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NozaKVRr; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f75f116d11so53643771fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 05:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727180201; x=1727785001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=42yhAa85dOyM6/KIcZ7i6acbWsO2ZQlWeVPvvAFTZxY=;
        b=NozaKVRr1UXp3VoJlhu5U9FdmhlwmVuVYb3yMgVzuPyYFbQ1OFEkGSxHsd1DzmR3Ea
         kJpYkfOlVZqqx54HfmOHtzbedsfHpXhZDLVwD218uXrkG33Fk0DGJ5DHQpZg2RXAhsD9
         urQvlC149XPy19R4w10XVExEeWQUTtoDCZaua0n+lu5+esf2KyCde4tft1t3DKXsLG8G
         UG54WpnmNvDt11VjHQR4o32181ugYBnjD1ztj46Yqand732VDLMYqKikhnuknOYPxpKl
         6VmI6bHf4GMd9v2jSedmb+7qIvTKvyEjIlG3x/IS/aTeUN4KOMq50hrTt6UWqXG3w4oj
         S6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727180201; x=1727785001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42yhAa85dOyM6/KIcZ7i6acbWsO2ZQlWeVPvvAFTZxY=;
        b=HBIEiLvn9PXmeW07r+aSN33/JWgJAsRtKAfmrS9E94WGPdKgPb2fvAe+bHyH7O4GZk
         dihR8EcrGHesQo7HN+XQbnc5oQ6eiLL7ZNU1G0y3fpS1bq+rjXn1KUvFy6PCJDXUZfIM
         AOlg/TSn3LgJ6uhzCWe4vX42bD4jB3a06a266QBT7HcTj2Fu9xlJqzJfwzFGMCRVV0H3
         lK81tAKyeCxNnvWkuqCFRRJ8VcUJ7KKdu6uS625dSGgx2BGRsLdbxzerIR503Nnai5Yk
         Lpz0u9NWsvBuPEKIOdnqbrMsHRS88t1buYQsehSzbXAVhAW+hS8L7gkN61VUdn8iUIjc
         vTcw==
X-Forwarded-Encrypted: i=1; AJvYcCXwsrhkmPiZblXEOo5/ynBO/Rs4k7vmMU2hQTIe9Ovxoir7wwmPz0QgjJkA7d7X20mmr3i9K6ooZLa0VwE9@vger.kernel.org
X-Gm-Message-State: AOJu0YypSRV46DS4CjP3n3ODwSsNDSmXMBn23H6TU0Ou3bfog0xOYDjH
	PEPrxs4PoIr32vHz6l2R1RaFRF4GjXAOe3uqARmUS6W8D8q8Vo/iiWjvq1eNe1U=
X-Google-Smtp-Source: AGHT+IFuf4z94LE9fZPfQs8tAoR/fMpD/Cf1JY8a9sDQGWJuXR7ve1xZQgGqFjGtUQin17Vd+jF8/Q==
X-Received: by 2002:a2e:b8c4:0:b0:2f6:6101:5a63 with SMTP id 38308e7fff4ca-2f7cb2e6875mr89179781fa.2.1727180200523;
        Tue, 24 Sep 2024 05:16:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d282fd28sm2159471fa.13.2024.09.24.05.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 05:16:39 -0700 (PDT)
Date: Tue, 24 Sep 2024 15:16:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
	konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
	neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
	andersson@kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add SA8775P support
Message-ID: <rmndmhq67lajdmva6gt46rqtkvf6jh2afbqazafz6oxv7ep56j@bznopz3aexyt>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-5-quic_mahap@quicinc.com>
 <v4cnmso3nl5oi3scd2lkg6kepb52vjrzgoti42ikds3y2wq6aw@sbn2yu4xeiun>
 <9b47bd8e-6079-4285-a3d7-932178d5bdf2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b47bd8e-6079-4285-a3d7-932178d5bdf2@quicinc.com>

On Tue, Sep 24, 2024 at 04:42:02PM GMT, Mahadevan P wrote:
> 
> On 9/12/2024 1:34 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 12, 2024 at 12:44:36PM GMT, Mahadevan wrote:
> > > Add definitions for the display hardware used on the
> > > Qualcomm SA8775P platform.
> > > 
> > > Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> > > ---
> > >   .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
> > >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
> > >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
> > >   4 files changed, 491 insertions(+), 3 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> > > 

[...]

> > > +static const struct dpu_intf_cfg sa8775p_intf[] = {
> > > +	{
> > > +		.name = "intf_0", .id = INTF_0,
> > > +		.base = 0x34000, .len = 0x280,
> > > +		.features = INTF_SC7280_MASK,
> > > +		.type = INTF_DP,
> > > +		.controller_id = MSM_DP_CONTROLLER_0,
> > > +		.prog_fetch_lines_worst_case = 24,
> > > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> > > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> > > +	}, {
> > > +		.name = "intf_1", .id = INTF_1,
> > > +		.base = 0x35000, .len = 0x300,
> > > +		.features = INTF_SC7280_MASK,
> > > +		.type = INTF_DSI,
> > > +		.controller_id = MSM_DSI_CONTROLLER_0,
> > > +		.prog_fetch_lines_worst_case = 24,
> > > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> > > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> > > +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> > > +	}, {
> > > +		.name = "intf_2", .id = INTF_2,
> > > +		.base = 0x36000, .len = 0x300,
> > > +		.features = INTF_SC7280_MASK,
> > > +		.type = INTF_DSI,
> > > +		.controller_id = MSM_DSI_CONTROLLER_1,
> > > +		.prog_fetch_lines_worst_case = 24,
> > > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> > > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> > > +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
> > > +	}, {
> > > +		.name = "intf_3", .id = INTF_3,
> > > +		.base = 0x37000, .len = 0x280,
> > > +		.features = INTF_SC7280_MASK,
> > > +		.type = INTF_NONE,
> > > +		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
> > > +		.prog_fetch_lines_worst_case = 24,
> > > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> > > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> > > +	}, {
> > > +		.name = "intf_4", .id = INTF_4,
> > > +		.base = 0x38000, .len = 0x280,
> > > +		.features = INTF_SC7280_MASK,
> > > +		.type = INTF_DP,
> > > +		.controller_id = MSM_DP_CONTROLLER_1,
> > > +		.prog_fetch_lines_worst_case = 24,
> > > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
> > > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
> > > +	}, {
> > Where is intf_5 ?
> 
> 
> intf_5 of base address 0x39000 is not supported on this target.

Not supported by whom?

> 
> 
> > 
> > > +		.name = "intf_6", .id = INTF_6,
> > > +		.base = 0x3A000, .len = 0x280,
> > > +		.features = INTF_SC7280_MASK,
> > > +		.type = INTF_NONE,
> > > +		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
> > > +		.prog_fetch_lines_worst_case = 24,
> > > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
> > > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
> > > +	}, {

[skipped]

> > > @@ -1464,6 +1464,7 @@ static const struct of_device_id dpu_dt_match[] = {
> > >   	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
> > >   	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
> > >   	{ .compatible = "qcom,sm8450-dpu", .data = &dpu_sm8450_cfg, },
> > > +	{ .compatible = "qcom,sa8775p-dpu", .data = &dpu_sa8775p_cfg, },
> > Wrong sorting order
> 
> 
> Sure will move below sm8650-dpu.

What makes you think that in a dictionary sa8775p comes after sm8650?

> 
> 
> > 
> > >   	{ .compatible = "qcom,sm8550-dpu", .data = &dpu_sm8550_cfg, },
> > >   	{ .compatible = "qcom,sm8650-dpu", .data = &dpu_sm8650_cfg, },
> > >   	{ .compatible = "qcom,x1e80100-dpu", .data = &dpu_x1e80100_cfg, },
> > > -- 
> > > 2.34.1
> > > 

-- 
With best wishes
Dmitry

