Return-Path: <linux-arm-msm+bounces-45700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC255A18187
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 16:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7C6B167D85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 15:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943801F470E;
	Tue, 21 Jan 2025 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xCvOw6Q1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E71F2C57
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737475110; cv=none; b=jsScqnARz7vKYktdUpQfvLLLRWZKsj9T2mCJ2RFrxfo4VcAnNW8hTXDzZU1/FFbngaQYIAdDoqkR61bMRJSZM9x7Cl1J5kPgRIbpCfDtIwo56vJWa6JQvRXqH4dUiZGwwC5bv1MrjJwXRBi8CgQ6yBcWwAMh07Ncgm+3xtzIZWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737475110; c=relaxed/simple;
	bh=0AT5DFNqyVVmFrfi79RxIQMPFDeYinAriV9rO6Mup8Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dtfw7wxNwsysvIlbaVPfBlLvBN9JptrCgekLTSZWHhksLCTiIx4McFjunGWK6R5i/L9ABeGQcWujwLhDyi3SKJBSK3XM4wVrPOCmoW2aIGO6pDZsHW3FK/2YgU8a/UYcnxf+qh84tfyETPXZTUFguMJEPMa8V9tViMNxAFkSSb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xCvOw6Q1; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaf6b1a5f2bso1327575366b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 07:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1737475105; x=1738079905; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdJdALCpfMsPW8b2vvD3iTsNvqpEAESXqA78u2jp51U=;
        b=xCvOw6Q1snKk8DXNCdHf7i9y7WknK4oPVY5fIz/ouqfw7CfyDR2LGi6H4WUyS7S2NI
         76BxpbNrUuKFGPMcnsW59HCmrGD423U0mmuE4t0ZRKd2uw0QIP+h6ZrY738jpWyBldyi
         dcNu77r2Mf9c+jlB5XlDYYH73UQZBeoSwYfH4UdHGgbTsK3xs4SAFD+1Dl7EkKbw/U1o
         tPA55GeRaskVII+d/S7gjeDGTVwZZbH0bqNnkUpVtY9UKBM35kAebrrs4KeKxp9+x3A/
         V36il2Y6rmHw0FpKY+r7WgcnhqSkmG0QWClt+SY4cy44M1NKdSz9l6A2yLLsIQTgynVz
         WY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737475105; x=1738079905;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XdJdALCpfMsPW8b2vvD3iTsNvqpEAESXqA78u2jp51U=;
        b=hsHPEPSJ1ScNS91PHxt0pza+DfIdS5q+2DGTIOkIgx8Ze6a+Iuf+oVEHxQ1VTjfiJD
         8C89cu9ETGS5+89FHV+IoTTKKTOUV0vQvv+kg/M30hNEPkGx2DKzmD6zLg+ur6hJ4OXK
         hIx5lk3Op3yrWj2orDuothBxuzapaNoSmuIeOcGZW205Abxhhm0oj/+cXJnxRdofpo1K
         R21u3dzxF3T7pil90sSwmwe8gtzc+VMCrA05olnYCIzQUZBy5EordxKHANvKG6nXI1FA
         Sy0QxK9SqerWnnoenKVaC/PHtMwCSeRzGF3eDIZ39H1RpbPTLnKghznjoFbEWhOecaGH
         HAAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcxLxOZVZdKEORe7VXgihMB/sQriid2HycNFsRMs6Celai3e+rZdTEMU4HDqbHMM2heBAHYBcrTcl+gSzH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyzw2libhpOqmUUdoKm1NSitN38cPzPvaWfKmlzBtdJLqbIgSJ
	UqPwCPqaKjL4xSmpZ65em2sQldgufBSGMcn+FMhtpEm8I3TA6QYQwsIk03g9Bso=
X-Gm-Gg: ASbGncs5RWe71987yt3SyFQSlYPFV391rT4m4f7heDTp3UbTzE1ASh7cvLB6NP8kSQP
	JXqcBKSKSOkF8PYs1cFtM2ipWd+w8/xw/la4g/7tbBso7WyLGCkvA5LwerfqEYyBbuQLHFtDW1Z
	DeKQsS49A366nKTgYRO71ZjmriqRrt47XXF/YMS2vnxSIjim5Xs9mCGkwy8SUVkeeCOn8dJvpzB
	ATXA32zQqpwCHgnnx6GVDG05wcRgNhZ56jEQ+Zt5nT4MSvfW+EE6sWmrjr/aIDvcEgrvhnvqvd0
	wx5K0zfmVx4lOjxa2XdB61cOVhvyHlSj3khmCGM=
X-Google-Smtp-Source: AGHT+IHdkDoF53x8l2SOkiELIyNRQWLeK1YwI2eN4KFrJeV+1D+AZglekd0sHFlT9ypnhGbNQmdg/A==
X-Received: by 2002:a17:907:743:b0:aa6:75f4:20df with SMTP id a640c23a62f3a-ab36e241bc1mr1900254266b.9.1737475105126;
        Tue, 21 Jan 2025 07:58:25 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fc35b9sm758783466b.161.2025.01.21.07.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 07:58:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jan 2025 16:58:24 +0100
Message-Id: <D77VIRU2Z0L9.20OBL2OMAIA7I@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Martin Botka"
 <martin.botka@somainline.org>, "Jami Kettunen"
 <jami.kettunen@somainline.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] drm/msm/dpu: Fall back to a single DSC encoder
 (1:1:1) on small SoCs
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Marijn Suijten" <marijn.suijten@somainline.org>, "Rob Clark"
 <robdclark@gmail.com>, "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Sean Paul" <sean@poorly.run>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org>
In-Reply-To: <20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org>

Hi Marijn,

On Tue Jan 21, 2025 at 12:06 AM CET, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the FairPhone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the FairPhone 5.

Nitpick, if you send another revision: s/FairPhone/Fairphone/

>
> By loosening the hardcoded `num_dsc =3D 2` to fall back to `num_dsc =3D
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.

This unblocks panel enablement on upstream without any hacks on top.
Many thanks!

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 47 +++++++++++++++--------=
------
>  1 file changed, 25 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_encoder.c
> index 5172ab4dea995a154cd88d05c3842d7425fc34ce..dcf17b5e8ac8eb76f5ba038fc=
ce48e47f32299d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -622,9 +622,10 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *d=
rm_enc)
>  		if (dpu_enc->phys_encs[i])
>  			intf_count++;
> =20
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
>  	if (dpu_enc->dsc)
> -		num_dsc =3D 2;
> +		for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++)
> +			if (dpu_enc->hw_dsc[i])
> +				num_dsc++;
> =20
>  	return (num_dsc > 0) && (num_dsc > intf_count);
>  }
> @@ -664,7 +665,7 @@ static struct msm_display_topology dpu_encoder_get_to=
pology(
>  	/* Datapath topology selection
>  	 *
>  	 * Dual display
> -	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> +	 * 2 LM, 2 INTF (split display using 2 interfaces)
>  	 *
>  	 * Single display
>  	 * 1 LM, 1 INTF
> @@ -686,13 +687,19 @@ static struct msm_display_topology dpu_encoder_get_=
topology(
> =20
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
> -		topology.num_dsc =3D 2;
> -		topology.num_lm =3D 2;
> +		if (dpu_kms->catalog->dsc_count >=3D 2) {
> +			topology.num_dsc =3D 2;
> +			topology.num_lm =3D 2;
> +		} else {
> +			topology.num_dsc =3D 1;
> +			topology.num_lm =3D 1;
> +		}
>  		topology.num_intf =3D 1;
>  	}
> =20
> @@ -2020,32 +2027,32 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_h=
w_ctl *ctl,
>  static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  				 struct drm_dsc_config *dsc)
>  {
> -	/* coding only for 2LM, 2enc, 1 dsc config */
>  	struct dpu_encoder_phys *enc_master =3D dpu_enc->cur_master;
>  	struct dpu_hw_ctl *ctl =3D enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
>  	int this_frame_slices;
>  	int intf_ip_w, enc_ip_w;
> -	int dsc_common_mode;
> +	int dsc_common_mode =3D 0;
>  	int pic_width;
>  	u32 initial_lines;
> +	int num_dsc =3D 0;
>  	int i;
> =20
>  	for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++) {
>  		hw_pp[i] =3D dpu_enc->hw_pp[i];
>  		hw_dsc[i] =3D dpu_enc->hw_dsc[i];
> =20
> -		if (!hw_pp[i] || !hw_dsc[i]) {
> -			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
> -			return;
> -		}
> +		if (!hw_pp[i] || !hw_dsc[i])
> +			break;
> +		num_dsc++;
>  	}
> =20
>  	dsc_common_mode =3D 0;
>  	pic_width =3D dsc->pic_width;
> =20
> -	dsc_common_mode =3D DSC_MODE_SPLIT_PANEL;
> +	if (num_dsc > 1)
> +		dsc_common_mode |=3D DSC_MODE_SPLIT_PANEL;
>  	if (dpu_encoder_use_dsc_merge(enc_master->parent))
>  		dsc_common_mode |=3D DSC_MODE_MULTIPLEX;
>  	if (enc_master->intf_mode =3D=3D INTF_MODE_VIDEO)
> @@ -2054,14 +2061,10 @@ static void dpu_encoder_prep_dsc(struct dpu_encod=
er_virt *dpu_enc,
>  	this_frame_slices =3D pic_width / dsc->slice_width;
>  	intf_ip_w =3D this_frame_slices * dsc->slice_width;
> =20
> -	/*
> -	 * dsc merge case: when using 2 encoders for the same stream,
> -	 * no. of slices need to be same on both the encoders.
> -	 */
> -	enc_ip_w =3D intf_ip_w / 2;
> +	enc_ip_w =3D intf_ip_w / num_dsc;
>  	initial_lines =3D dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
> =20
> -	for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++)
> +	for (i =3D 0; i < num_dsc; i++)
>  		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
>  					 dsc, dsc_common_mode, initial_lines);
>  }
>
> ---
> base-commit: 1573c8d4cb206a2d1454ff711e79f8df2353290b
> change-id: 20240204-dpu-111-topology-b12c1de82c8a
>
> Best regards,


