Return-Path: <linux-arm-msm+bounces-45672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1FAA17B88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 11:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF6D118809C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 10:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2382E1F0E2F;
	Tue, 21 Jan 2025 10:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODxH49ou"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BC21F03CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 10:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455196; cv=none; b=bmtnQYBsVqYWNefimwuoySngpHp95BxPNlLYCVy/L0y/p0/Sxu5zOaBhkcU/TTvCKRpQlaz1diYo/0IeBUUy7ILJnw3bCYlthnmjLxNAiLW8LFGPYxX7rCB8Yvh3rRywMVHnIru2fexQLAFKPqio1Ggd/w2IGk/MRlcHxOg2Gio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455196; c=relaxed/simple;
	bh=EJHg9leZIf2u+ogCzkjWe4mcTM+p+Z+zI8oiId3Ifs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lChSNPciGd2R3Ux0bryvTvOPknIBDwDveiQ3rfwb/ZfSp5tUQP4nhAuRv86pTFKA2c/IJOnd/E8cRLDZs4RChgjlh3cUVYxWTBWLHZq/0yctMLZhTu8OFV4jJp+V3hQrTGajp7MNsn8dgKKrG35r+l0fWTUZg6EZHRglJCSgxc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ODxH49ou; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30738a717ffso26522821fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 02:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737455192; x=1738059992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1nSBa8IUGU1nXN+b49dNchKcptNoPhFRCdZoshvrmc=;
        b=ODxH49ouT8/ezIS6VtKoM+0jTn5CrX09MTgo8phhWk6aNYP3/OlvTWoZU4dDrZxPCK
         3kD67ycyssgRrmBO4T6wLJJf/u9+PKFyg2rrl9dWgdlTyz1pCrUps8vT9mEObvXADltH
         TcgYJZ78bkCn+cBta5UG342MzSuG9F7aYUD3cH+31DeVvvx8e0prF/YGSbBUYIBGhHqp
         eX8UoAdMj0uacgZVMQGAFbKl5BF0Xx4jkwdCCBOcX0bkmUF6q9vC7/EI9LOPxljRg/FB
         1aaCS/sgWS1rnWg0dwHCHbypqlIz6bxiYMitI4CBv4IwfbBgPoVndmmhIffiub8/I9fJ
         zblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455192; x=1738059992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1nSBa8IUGU1nXN+b49dNchKcptNoPhFRCdZoshvrmc=;
        b=DbdBF1draG4pSfla6hRmL55g8rnaevmoir/ED9wxZfaMnxuLz7sDiGjTNryGVbEhmh
         f+mnWVvOx5GZlr19HuM2cjBYadYpwbE+VKiiG+3z6NLE3tIZXi9JntX1ENii7OUBrlD+
         2RqEGdbbU0KCL2vusTKTwvoxlUQCqk/ZOugs90NwK09zR2PbS36YwI0bjCWslKmHjk3+
         8lpNGxWTzwmmaJ2fH+t7KgptPN+HJXWQCVbGhxWS21TwPm/IkwfaIBZVV4AXTWEQwYlC
         FWllPmDPtB/JjFZ6WEarToBqwsNGq+OBIydpp/PvS8Bd88/DsHESeLmX94PuTsbREjfr
         y4/g==
X-Forwarded-Encrypted: i=1; AJvYcCVScoihg7EObmZ5X6kuAIGux87Rh5fvEoU4XFGK0oOP+ioyuOUyLZ92dCHu9mY4erWZAzhH5ntUt1J/L8pw@vger.kernel.org
X-Gm-Message-State: AOJu0YzrVffYBmnks4YJ0dcGfGDWfmvfsVIrSfjcxctCmiapJXJ/Iwvd
	AD2eauauvVty9cIzjjCpigsW11Cng8g9IrgGASLdAJeWdN+MTG7wmko5ca9ji80=
X-Gm-Gg: ASbGncsU8feGeRFMI71EBvEzjrnBCED9vmdrze+IwsH5Rzw9LzSR31z3XlnZsTIaw/N
	kwGGT7UpCWw6gL4GDBNea+JG2nlHu7IlrLKeLWF3uKuGnkYSER/sIjSJEeDuNKVxdvxXDRTAxJ1
	D4Ie8ksAPEnTzmyoLmQ/YlHRLM6WboyzFoaNN1BDZHqDj+SnAgbpgv5ZaaBrxDl2UQmI937PPCF
	OLTJTDLOob7nSJvh8ASdBT4vfp4oF/kCefniAjflrAbI8aQftStckptFX7M8owzdA5EQzqak6U6
	QVoI2ixnxMQrEzubkc87kXhHUY7lHfoB2C3uMmvImoez0pS5DA==
X-Google-Smtp-Source: AGHT+IHwpSv6PSJob8zZEfFgoHp8qXCKuhKpxTniHhj/dzNZxxonuD6++xWoOecAu8un1w8M2/tW4Q==
X-Received: by 2002:a05:651c:2c7:b0:2fb:58b1:3731 with SMTP id 38308e7fff4ca-3072ca60bd0mr44221831fa.6.1737455191768;
        Tue, 21 Jan 2025 02:26:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a331124sm19977171fa.21.2025.01.21.02.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 02:26:31 -0800 (PST)
Date: Tue, 21 Jan 2025 12:26:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH RFC] drm/msm/dpu: Fall back to a single DSC encoder
 (1:1:1) on small SoCs
Message-ID: <7luldid54shuyywuzfidxf45oknh5iuxaibbb77hur6qpury7i@33wsjwdphrxq>
References: <20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org>

On Tue, Jan 21, 2025 at 12:06:15AM +0100, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the FairPhone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the FairPhone 5.
> 
> By loosening the hardcoded `num_dsc = 2` to fall back to `num_dsc =
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.
> 
> Cc: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> Note that this doesn't paint the full picture in case there are SoCs
> with more DSC hardware blocks, but when multiple virtual encoders
> have already allocated most of them.  My initial plan was to code
> ahead for dynamically tracking and reallocating these blocks in RM, if
> some virtual encoder could potentially be using too many DSC encoders
> which, while "power optimal", may not be able to support the number of
> requested displays/interfaces.  Such a solution would automatically
> ensure DSCmerge is *not* used when there are not enough hardware blocks
> available in the first place.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 47 +++++++++++++++--------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5172ab4dea995a154cd88d05c3842d7425fc34ce..dcf17b5e8ac8eb76f5ba038fcce48e47f32299d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -622,9 +622,10 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>  		if (dpu_enc->phys_encs[i])
>  			intf_count++;
>  
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
>  	if (dpu_enc->dsc)
> -		num_dsc = 2;
> +		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +			if (dpu_enc->hw_dsc[i])
> +				num_dsc++;

I think you can skip if (dpu_enc->dsc) and always enumerate
dpu_enc->hw_dsc[i].

>  
>  	return (num_dsc > 0) && (num_dsc > intf_count);
>  }
> @@ -664,7 +665,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  	/* Datapath topology selection
>  	 *
>  	 * Dual display
> -	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> +	 * 2 LM, 2 INTF (split display using 2 interfaces)

Irrelevant, please submit separately.

>  	 *
>  	 * Single display
>  	 * 1 LM, 1 INTF
> @@ -686,13 +687,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  
>  	if (dsc) {
>  		/*
> -		 * In case of Display Stream Compression (DSC), we would use
> -		 * 2 DSC encoders, 2 layer mixers and 1 interface
> -		 * this is power optimal and can drive up to (including) 4k
> -		 * screens
> +		 * Use 2 DSC encoders and 2 layer mixers per single interface
> +		 * when Display Stream Compression (DSC) is enabled,
> +		 * and when enough DSC blocks are available.
> +		 * This is power-optimal and can drive up to (including) 4k
> +		 * screens.
>  		 */
> -		topology.num_dsc = 2;
> -		topology.num_lm = 2;
> +		if (dpu_kms->catalog->dsc_count >= 2) {
> +			topology.num_dsc = 2;
> +			topology.num_lm = 2;
> +		} else {
> +			topology.num_dsc = 1;
> +			topology.num_lm = 1;
> +		}
>  		topology.num_intf = 1;
>  	}
>  
> @@ -2020,32 +2027,32 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
>  static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  				 struct drm_dsc_config *dsc)
>  {
> -	/* coding only for 2LM, 2enc, 1 dsc config */
>  	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>  	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
>  	int this_frame_slices;
>  	int intf_ip_w, enc_ip_w;
> -	int dsc_common_mode;
> +	int dsc_common_mode = 0;

Please drop =0, it is done later.

>  	int pic_width;
>  	u32 initial_lines;
> +	int num_dsc = 0;
>  	int i;
>  
>  	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>  		hw_pp[i] = dpu_enc->hw_pp[i];
>  		hw_dsc[i] = dpu_enc->hw_dsc[i];
>  
> -		if (!hw_pp[i] || !hw_dsc[i]) {
> -			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
> -			return;
> -		}
> +		if (!hw_pp[i] || !hw_dsc[i])
> +			break;
> +		num_dsc++;
>  	}
>  
>  	dsc_common_mode = 0;

Could you please move this line two lines down, just before the rest of
dsc_common_mode statements.

>  	pic_width = dsc->pic_width;
>  
> -	dsc_common_mode = DSC_MODE_SPLIT_PANEL;
> +	if (num_dsc > 1)
> +		dsc_common_mode |= DSC_MODE_SPLIT_PANEL;
>  	if (dpu_encoder_use_dsc_merge(enc_master->parent))
>  		dsc_common_mode |= DSC_MODE_MULTIPLEX;
>  	if (enc_master->intf_mode == INTF_MODE_VIDEO)

-- 
With best wishes
Dmitry

