Return-Path: <linux-arm-msm+bounces-40892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A85249E83CD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 07:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C2B31884857
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 06:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07E228377;
	Sun,  8 Dec 2024 06:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7tZYAjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16A13D69
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 06:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733638826; cv=none; b=aFnzSP+t034OOUZMUnas4U7l8aX89mpDjQ1y5fLskDWn3G1GmJcNTN21S6QmiVFFVNPY1UOgPohyBbcVem/9tLKPNQpUKb1gOYu0uVqd7oMlc1TKLgS0oWW09rK0HKYOXRWWa94XAVcahvtc+5xK4VO+gwbFnLKr6+a157DTaW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733638826; c=relaxed/simple;
	bh=3fiK5xpOs/3MMK3l9oFjiRimQNH4kk/slTL8dPbJeEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCKKNZuZLSd2/6EJe3e9I4m4Fdj05KDTmLmY2NcxPzBBvZ9yAIjGGERouXHiUqYv2cxllrn748rZX+25RviKX/8B+xUM+lLW2siTHVLW8XiLC7Q8CBSkTOmjRbGBNbNVooEC9hz5/qkxuJNtgo3VbViMZxasMxUCPswDiRS3IEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7tZYAjR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so1783290e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2024 22:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733638823; x=1734243623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3wSwCt3nKeuuPfdzyH1suAvu05oEqo8AcKRL8aHLAI=;
        b=b7tZYAjRE0kjzr1sK1unZ7YnKukvXG3X3So4wYHEAWKIbYd2PgPFBr5sls7K7r+lEK
         2Rp/Yd0lF//6xF/Z2N8FYzy5Tdwi6bfnkoavTtwbRex+tDm4w6iu1x8Hzk9zNZI0YHKQ
         SBEu4k7a/gakxygwdaIq/yC1O/0DsnMfFUakuk/bnmqWvGyPC3d8FGEg8FKPkq+aoBan
         koOX5ZvlOgtqA5isE3ohNDUWDvHIXw28lzq7ZQnL3+GusKarvcDmNL5ZyZOGGcucbUVB
         kdoKPx/7tC2Z1WcpdJeTfILWVoZ8jPHKWgJdqqJAwpn+S71f3fbjf+WOkVJKLZyhar6r
         vY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733638823; x=1734243623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3wSwCt3nKeuuPfdzyH1suAvu05oEqo8AcKRL8aHLAI=;
        b=drkD7WVex23MfSzLMYVtntbYH36b4ac9KeBKUUNHBMbYgi2GeRZeffp5qW9niSkpbH
         Onk56vTKyNBWP6+1nsKGBmVz8y90QPGQ8ou6A5nKpUj+4Z3GCV9wu8aI+9r2Y41360pg
         KeAK0A31rMImMoj1KKNUc+yQybc4LYQMNhZpAgNUcbqLxLnKPntjT16961R3RsyzCNhi
         EbH5JTwbhK8LnKtwo47YL2hv7Aie9eWSfcqmlZR/UA4KJLEYlOTB3zf7fBPVIc3/fNc5
         oxao1y3Ci/vzQUIMl6NE4AYhpq373hvd2hL35PFL45Dt4ZWwabq+oXaspGpMZG27nrD+
         4xXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+kCFvgMGrTrzCTWhdGbGp15NO0Tavtm/n0R8+d502AEG8PTAEOstPaUZfr/kO8E3SiRljbp/W8D6Lo4QO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw94oKLmH+gRusbBfGjaHGwGmyfFybo1E+UnZnm7uMsWpgGW8+H
	fPC6DKDH6e14+B1EJLwh93GYY7DiIUoG6vWP67fOXj9Ig3g8htVa3Tx88XwBDKE=
X-Gm-Gg: ASbGnctBDvPoGge+HIJXAyFOr7DVYVE/9Y0uaTeAq7M2TWtYhy+dNP2j+qKFCzREZ0t
	m/aM2PLlW10aT/eAWWL/K1wpVaFu/9ABHQyNy+Tk1S1ojOQHkkWAtOsqHUkuT5qJbJksO2UmDsm
	4yEa7MsnQ54WhoWt8MeSAlz4WBbK4HXi9h3pe4V5/91xaBYAsVPJdqCPHU/iVFuYFojO/mPnrUs
	ddtp6/DGNj5S8hl94ROFLLsbU/r95J9MA34N0ByMAfhB6p93fSX7U9A/1cVFyZAgpjzbFR7uk7+
	0hwmzhGmp2yzkFQavu5+x50+mvC30A==
X-Google-Smtp-Source: AGHT+IFtDegnYyy2d+nTJaRADWEp+LFhxCsAwHtfkRa6kEJEsstkB9Dl/Phdlpt1fq4uhf+/TTKexA==
X-Received: by 2002:a05:6512:402a:b0:53e:39c2:f02b with SMTP id 2adb3069b0e04-53e39c2f164mr1605041e87.42.1733638823022;
        Sat, 07 Dec 2024 22:20:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3836ab8bsm573224e87.251.2024.12.07.22.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 22:20:21 -0800 (PST)
Date: Sun, 8 Dec 2024 08:20:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 22/45] drm/msm/dp: add support to send vcpf packets in dp
 controller
Message-ID: <myumofurrdyjpfs7k6m2q4wmfcot3pdnymtoj4wd3zwlgmkhtq@mjtlpsb5by2j>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-22-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-22-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:53PM -0800, Abhinav Kumar wrote:
> VC payload fill sequence is inserted by the DP controller in the
> absence of stream symbols that is before stream is disabled. Add
> support to send the VCPF sequence for msm dp controller.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 25 +++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  4 ++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 40 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c |  5 ++++-
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  3 ++-
>  6 files changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index f9d21444d7891bcd043d282b31ae75711add4817..4826a698979ce7c37112812299879411c5743fa9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -50,6 +50,11 @@
>  	(PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
>  	PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
>  
> +#define DP_INTERRUPT_STATUS5 \
> +	(DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)
> +#define DP_INTERRUPT_STATUS5_MASK \
> +	(DP_INTERRUPT_STATUS5 << DP_INTERRUPT_STATUS_MASK_SHIFT)
> +
>  #define DP_INTERRUPT_MASK4 \
>  	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
>  	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
> @@ -694,9 +699,12 @@ void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
>  				DP_INTERRUPT_STATUS1_MASK);
>  		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2,
>  				DP_INTERRUPT_STATUS2_MASK);
> +		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS5,
> +				 DP_INTERRUPT_STATUS5_MASK);
>  	} else {
>  		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS, 0x00);
>  		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS2, 0x00);
> +		msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS5, 0x00);
>  	}
>  }
>  
> @@ -850,6 +858,23 @@ int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
>  	return intr;
>  }
>  
> +int msm_dp_catalog_ctrl_get_interrupt_5(struct msm_dp_catalog *msm_dp_catalog)
> +{
> +	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
> +							      struct msm_dp_catalog_private,
> +							      msm_dp_catalog);
> +	u32 intr, intr_ack;
> +
> +	intr = msm_dp_read_ahb(catalog, REG_DP_INTR_STATUS5);
> +	intr &= ~DP_INTERRUPT_STATUS5_MASK;
> +	intr_ack = (intr & DP_INTERRUPT_STATUS5)
> +			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
> +	msm_dp_write_ahb(catalog, REG_DP_INTR_STATUS5,
> +			 intr_ack | DP_INTERRUPT_STATUS5_MASK);
> +
> +	return intr;
> +}
> +
>  void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog)
>  {
>  	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 560016e2f929d4b92d6ea764d81a099c09c0e668..323858c587f85996d296156c7b8b201cdb7b7eb4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -28,6 +28,9 @@
>  #define DP_INTR_FRAME_END		BIT(6)
>  #define DP_INTR_CRC_UPDATED		BIT(9)
>  
> +#define DP_INTR_DP0_VCPF_SENT		BIT(0)
> +#define DP_INTR_DP1_VCPF_SENT		BIT(3)
> +
>  #define DP_HW_VERSION_1_0	0x10000000
>  #define DP_HW_VERSION_1_2	0x10020000
>  
> @@ -103,6 +106,7 @@ u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog);
>  u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog);
>  void msm_dp_catalog_ctrl_phy_reset(struct msm_dp_catalog *msm_dp_catalog);
>  int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
> +int msm_dp_catalog_ctrl_get_interrupt_5(struct msm_dp_catalog *msm_dp_catalog);
>  u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);

I'd prefer some uniformity here. read_psr_interrupt_status() returns
REG_DP_INTR_STATUS4, get_interrupt() returns REG_DP_INTR_STATUS2 value,
Now you are adding get_interrupt_5(). Could you please make that similar
and logical?

>  void msm_dp_catalog_ctrl_update_transfer_unit(struct msm_dp_catalog *msm_dp_catalog,
>  				u32 msm_dp_tu, u32 valid_boundary,
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 14562def1e70b769434243d1ce72661a7b4d4c6b..2288c379283c721a01c81302f8d307d0b3c76527 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -27,6 +27,11 @@
>  
>  #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
>  #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
> +#define DP_CTRL_INTR_DP0_VCPF_SENT       BIT(0)
> +#define DP_CTRL_INTR_DP1_VCPF_SENT       BIT(3)
> +
> +#define MST_DP0_PUSH_VCPF		BIT(12)
> +#define MST_DP1_PUSH_VCPF		BIT(14)
>  
>  #define MR_LINK_TRAINING1  0x8
>  #define MR_LINK_SYMBOL_ERM 0x80
> @@ -144,6 +149,34 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>  	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>  }
>  
> +void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
> +{
> +	u32 state = 0x0;
> +	struct msm_dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	if (msm_dp_panel->stream_id >= DP_STREAM_MAX) {
> +		DRM_ERROR("invalid input\n");
> +		return;
> +	}
> +
> +	if (msm_dp_panel->stream_id == DP_STREAM_0)
> +		state |= MST_DP0_PUSH_VCPF;
> +	else
> +		state |= MST_DP1_PUSH_VCPF;
> +
> +	reinit_completion(&ctrl->idle_comp);
> +
> +	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, state);
> +
> +	if (!wait_for_completion_timeout(&ctrl->idle_comp,
> +					 IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
> +		pr_warn("PUSH_VCPF pattern timedout\n");
> +
> +	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");

??

The comment seems misplaced or wrong to me. The msm_dp_ctrl_push_vcpf()
doesn't turn link off.

> +}
> +
>  static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl,
>  				    struct msm_dp_panel *msm_dp_panel)
>  {
> @@ -2332,6 +2365,13 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
>  		ret = IRQ_HANDLED;
>  	}
>  
> +	isr = msm_dp_catalog_ctrl_get_interrupt_5(ctrl->catalog);
> +	if (isr & (DP_INTR_DP0_VCPF_SENT | DP_INTR_DP1_VCPF_SENT)) {
> +		drm_dbg_dp(ctrl->drm_dev, "vcpf sent\n");
> +		complete(&ctrl->idle_comp);
> +		ret = IRQ_HANDLED;
> +	}
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index b126651da24b3abdaf540268758b37dca9fe1291..9ad7022d6217572395d69294c3cc4d4dbaddf0ac 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -52,5 +52,6 @@ void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl,
>  void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
>  				      enum msm_dp_stream_id strm,
>  				      u32 start_slot, u32 tot_slots);
> +void msm_dp_ctrl_push_vcpf(struct msm_dp_ctrl *dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>  
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 2a4a79317153817cb24537ea95fad07c9bc20715..1dfc82211c50bb4ed239f9730b91c33c4897c78f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1646,7 +1646,10 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
> -	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
> +	if (msm_dp_display->max_stream > DEFAULT_STREAM_COUNT)

Same comment regarding default vs SST

> +		msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
> +	else
> +		msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
>  
>  	if (msm_dp_display->max_stream > DEFAULT_STREAM_COUNT) {
>  		msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl,
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 8bc2a431462fc1fb45b1fe8e43a0a0ec7f75e5b1..c7532217b369c6235b2fe5fe9c86642d5c2712cb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -24,8 +24,9 @@
>  #define REG_DP_INTR_STATUS			(0x00000020)
>  #define REG_DP_INTR_STATUS2			(0x00000024)
>  #define REG_DP_INTR_STATUS3			(0x00000028)
> -
>  #define REG_DP_INTR_STATUS4			(0x0000002C)
> +#define REG_DP_INTR_STATUS5			(0x00000034)
> +
>  #define PSR_UPDATE_INT				(0x00000001)
>  #define PSR_CAPTURE_INT				(0x00000004)
>  #define PSR_EXIT_INT				(0x00000010)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

