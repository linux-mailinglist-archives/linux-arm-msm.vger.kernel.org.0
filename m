Return-Path: <linux-arm-msm+bounces-32545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE220986D49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 09:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D5D5B20B3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 07:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F66B18B49A;
	Thu, 26 Sep 2024 07:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bV50kE1W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1FF224D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2024 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727334766; cv=none; b=W0fzHlv97b7VR8fTq6o5zaEFglNGiZ7YxWsdXXhigoBj6ZYFkrzKT5v8rGDo4QQlBWve2OHvyaRc/kXZ9Y8u//r1oo0EC63s83XSLpOBoG+Vvp25lpU5WvGgZf9VIfgHQ2YlNTYsfzjKq/h+9BtMrhHqiB2TfoXGQlm2+fY4Myc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727334766; c=relaxed/simple;
	bh=4E/LOetIXYYf1xhxxq7AjZVsnp9dikavxzLX+hmzCUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gu+1o96dJy0Sdwx1Xcu1teBv+kILjJYwpAuVhpwY+RGSKiBs2/ZH4s69WvZS9U7viSOM3WtKsV+4ZCI1OMo7e72mvlLrWpVEQ+PkjOZQVVDDy1Qfmepb1uPpgr1Pj38lLUX3myiQ0ccXt8u0vYJOpAQQ0Tk15qk7AtcPokh2J6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bV50kE1W; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso915813e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2024 00:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727334761; x=1727939561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8s1pVCKNQ5LijTwwwKbqt+TsjnjxLMGQpEOKi95VGHE=;
        b=bV50kE1Wq5FAiSONd5Gyd3Ztgdq8f96AsygNOvL286/36DQrbBlOa8iKBv/WwKk2XK
         SJwFi2oSqA54dQ6CQsGH+HVuIf7DPo3c3qeWAiMCmIgzDEY39g4lHN6nZC+nu0IkFCCi
         wcdbxCTmlk7xgq2J9LMy7kJ0eNtieiIUeFSzdGT2V8YchS5sb2eTTF2qpve/d35c28HT
         yUNqGwl/GJoyKM5e0npI9GSX6ilnGancpZ98Zuu8pmFA09W0HoyncdmEuJ6aGRjur6xW
         IVA24sEc6mpQ5i2USpzlT7JqpA6hGIxdCUBD2lGFF79wXW5/j6RyjIN/TXButs6zHc+/
         huSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727334761; x=1727939561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8s1pVCKNQ5LijTwwwKbqt+TsjnjxLMGQpEOKi95VGHE=;
        b=kH6N2mdOlJmCUBf1GtIVYaXx07d6hUx025r9/B7lKcGGRMbpEAWDtav4dFGn86lL2I
         q7mPToG3Sma23j3tq+DPQld5MM7WmlycNnYEgPmupkxl1sqoJmqJe5O3Xu7LHbZMvIVl
         MulEQNjPongeDADThW2tE1e23nWcC5RrwPEyOwn2cw9/LM6oq0XI2FyivRYzD0Gh9UgA
         dT1jwsxanBcO1hyjb/kTP0vVwlsSfDMXs7Swg8uwlRPlvxanUU8l2jVt2u62p1t5wsaB
         PzXFYvQEI01bgoaFMWZgvb7KRVsQWU/owqSsxS4Kf/GMEah1+hSC2nhMtt06GWXDIEtA
         +zKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbdLzir5gOvyrQPG/2Ww+NAz/9d+T9g1voaYt9rSXEE00KTCEFYu2PVAIiWFNN1L6XqnvSsI5mOhrPGmGc@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8TpYEJOh66hq7iBdQgIG8amqPwwAldXHO03JT5zAvZ47YP+W
	TWdrpdhV/xLbym5BinlXie5BzLHDJMw5ZXDCQnesH8xyVBnSCVMPwwoxk/KKOPkw5gNUUampqbl
	Hr3HO7g==
X-Google-Smtp-Source: AGHT+IEvLEJJDB6OVRh8ic+vi9uidxlX2tWayQauVJPNPmxbj5VEoP9OS3HkVp0PnEHowSwNvC2pog==
X-Received: by 2002:a05:6512:3b0e:b0:536:7b56:6ba0 with SMTP id 2adb3069b0e04-538775666a3mr4753353e87.57.1727334760529;
        Thu, 26 Sep 2024 00:12:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e0b8dsm720824e87.61.2024.09.26.00.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 00:12:39 -0700 (PDT)
Date: Thu, 26 Sep 2024 10:12:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 05/22] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <w53qtqnbibnw2kekn56afrf75udl3hbrk6kfavv7imqac6eqvo@lpgdvxncpfep>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-5-7849f900e863@quicinc.com>
 <dv5iij6v76ieprfckdjo4yksrjrgqw73v2lh7u4xffpu7rdrf3@zgjcp3a2hlxo>
 <24a11f4c-d848-4f1b-afbd-35b135fa3105@quicinc.com>
 <CAA8EJpraspHpgGvJxe7dXx-hN+yirs_+AacjkrHvPWuEvrLJ-w@mail.gmail.com>
 <b3830573-1f39-4729-be58-c2659a37d689@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3830573-1f39-4729-be58-c2659a37d689@quicinc.com>

On Wed, Sep 25, 2024 at 02:49:48PM GMT, Abhinav Kumar wrote:
> On 9/25/2024 2:11 PM, Dmitry Baryshkov wrote:
> > On Wed, 25 Sept 2024 at 22:39, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> > > On 9/24/2024 4:13 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Sep 24, 2024 at 03:59:21PM GMT, Jessica Zhang wrote:
> > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > 
> > > > > All resource allocation is centered around the LMs. Then other blocks
> > > > > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > > > > powers up the CRTC rather than the encoder.
> > > > > 
> > > > > Moreover if at some point the driver supports encoder cloning,
> > > > > allocating resources from the encoder will be incorrect, as all clones
> > > > > will have different encoder IDs, while LMs are to be shared by these
> > > > > encoders.
> > > > > 
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
> > > > >    3 files changed, 183 insertions(+), 123 deletions(-)
> > > > > 
> > > > > @@ -544,159 +542,117 @@ void dpu_encoder_helper_split_config(
> > > > >       }
> > > > >    }
> > > > > 
> > > > > -bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
> > > > > +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
> > > > > +                             struct msm_display_topology *topology,
> > > > > +                             struct drm_atomic_state *state,
> > > > > +                             const struct drm_display_mode *adj_mode)
> > > > >    {
> > > > >       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > > > -    int i, intf_count = 0, num_dsc = 0;
> > > > > +    struct drm_connector *connector;
> > > > > +    struct drm_connector_state *conn_state;
> > > > > +    struct msm_display_info *disp_info;
> > > > > +    struct drm_framebuffer *fb;
> > > > > +    struct msm_drm_private *priv;
> > > > > +    int i;
> > > > > 
> > > > >       for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> > > > >               if (dpu_enc->phys_encs[i])
> > > > > -                    intf_count++;
> > > > > +                    topology->num_intf++;
> > > > > 
> > > > > -    /* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> > > > > +    /* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> > > > >       if (dpu_enc->dsc)
> > > > > -            num_dsc = 2;
> > > > > +            topology->num_dsc += 2;
> > > > > 
> > > > > -    return (num_dsc > 0) && (num_dsc > intf_count);
> > > > > -}
> > > > > +    connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> > > > > +    if (!connector)
> > > > > +            return;
> > > > > +    conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > > > +    if (!conn_state)
> > > > > +            return;
> > > > > 
> > > > > -struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> > > > > -{
> > > > > -    struct msm_drm_private *priv = drm_enc->dev->dev_private;
> > > > > -    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > > > -    int index = dpu_enc->disp_info.h_tile_instance[0];
> > > > > +    disp_info = &dpu_enc->disp_info;
> > > > > 
> > > > > -    if (dpu_enc->disp_info.intf_type == INTF_DSI)
> > > > > -            return msm_dsi_get_dsc_config(priv->dsi[index]);
> > > > > +    priv = drm_enc->dev->dev_private;
> > > > > 
> > > > > -    return NULL;
> > > > > +    /*
> > > > > +     * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> > > > > +     * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> > > > > +     * earlier.
> > > > > +     */
> > > > > +    if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
> > > > > +            fb = conn_state->writeback_job->fb;
> > > > > +
> > > > > +            if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> > > > > +                    topology->needs_cdm = true;
> > > > > +    } else if (disp_info->intf_type == INTF_DP) {
> > > > > +            if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> > > > > +                    topology->needs_cdm = true;
> > > > > +    }
> > > > 
> > > > Just to note, the needs_cdm is not enough once you introduce CWB
> > > > support. E.g. DP/YUV420 + WB/YUV case requires two CDM blocks (which we
> > > > don't have), but this doesn't get reflected in the topology.
> > > 
> > > Hi Dmitry,
> > > 
> > > Ack. I can add something to make atomic_check fail if the input FB is
> > > YUV format and CWB is enabled.
> > 
> > I'd prefer for this to be more natural rather than just checking for
> > the DP && DP_YUV420 && WB && WB_FMT_YUV. In the worst case, count CDM
> > requests and then in RM check them against the catalog. But I had a
> > more logical (although more intrusive) implementation on my mind:
> > 
> > struct msm_display_topology {
> >      struct {
> >        u32 num_intf;
> >        u32 num_wb;
> >        u32 num_dsc;
> >        bool needs_cdm;
> >      } outputs[MAX_OUTPUTS];
> >      u32 num_lm;
> > };
> > 
> > WDYT?
> > 
> 
> the struct msm_display_topology was originally designed as a per-encoder
> struct (dpu_encoder_get_topology() indicates the same). Making this an array
> of outputs was not needed as there is expected to be one struct
> msm_display_topology for each virt encoder's requested topology and the
> blocks inside of it other than LM, are "encoder" hw blocks.
> 
> needs_cdm was made a boolean instead of a num_cdm_count like other hardware
> blocks because till the most recent chipset, we have only one CDM block.
> Whenever we do have more CDM blocks why will introducing num_cdm to the
> topology struct not solve your problem rather than making it an array of
> outputs?
> 
> Because then, RM will know that the request exceeds the max blocks.
> 
> I think what you are trying to do now is make struct msm_display_topology's
> encoder parts per-encoder and rest like num_lm per "RM session".
> 
> The thought is not wrong but at the same time seems a bit of an overkill
> because its mostly already like that. Apart from CDM for which I have no
> indication of another one getting added, rest of the blocks are already
> aligned towards a per-encoder model and not a "RM session" model.

But we should be leaning towards RM session.

> 
> Even if we end up doing it this way, most of the model is kind of unused
> really because each encoder will request its own topology anyway, there is
> just no aggregation for CDM which at this point is not needed as there is no
> HW we are aware of needing this.

With the resource allocation shifted to the CRTC individual encoders
do not request their own topology (as it is now a property of the full
output pipeline, not just an encoder). Yes, CDM aggregation into num_cdm
seems unnecessary as there is just one CDM block.

> I think the atomic_check validation is needed either way because if two
> encoders request cdm, we cannot do clone mode as there is only one cdm block
> today. Its just that we are not tracking num_cdm today due to reasons
> explained above but basically doing something like below seems right to me:
> 
> if (enc_is_in_clone_mode && needs_cdm)
> 	return -ENOTSUPPORTED;

This check is incorrect in my opinion. The hardware should be able to
support DP/YUV420 + WB/RGB and DP/RGB + WB/YUV combinations. Please
correct me if I'm wrong.

> When we add more cdm_blocks, we can drop this check and making needs_cdm a
> num_cdm will make it naturally fail.

-- 
With best wishes
Dmitry

