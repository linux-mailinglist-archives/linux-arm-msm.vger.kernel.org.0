Return-Path: <linux-arm-msm+bounces-5395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 374248188A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 14:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D912F281381
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 13:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D3418ED6;
	Tue, 19 Dec 2023 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EBm0c7M/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AFE1A585
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 13:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dae7cc31151so3090694276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 05:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702992384; x=1703597184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PVGuPQrWl+LmYikQej8Pn8i8g8HVkB+WF5yC7NXZyGI=;
        b=EBm0c7M/GKxdsxRUVvon8TvOVvc2JfrYMI3IFgnvnZn1GXv/hlo9ByTKJnmlDrJDwL
         ZVEPYtGEaB1fTVXDC4lVUEmrlldiM5izhInNKFFt4PCMkoGa0xVFsnmEf1gmQVtGIivC
         1WSGbFumDIfRYvQ70wDeW7yXEnXudhsoHlO1M2kr1MhOFID/J+enCyrvgSzOGM/eq+Mm
         96s0Zq8FOm7txm8LdSoe2qFCWxksV4ALMXsxhNUkZIbrgo9PjEjBlq3PZfw8s9nJf7yM
         rJzVNXOHK9JlIwjsjpot6qKEzFEnw1uUzTKxOkvJa4MUoVVEcgw0f0PAUbNkSuEEehrl
         GXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702992384; x=1703597184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVGuPQrWl+LmYikQej8Pn8i8g8HVkB+WF5yC7NXZyGI=;
        b=Im2Deaz294Kr8C2XNyqPMXUWsbrlzNvHXwIqcDhREeSCOKKBTxohoCMnteViVRBTLO
         uvvup4FHUkXSzD6Gh+t5Si0zSXDo7pxOUqBItltBvtCvPKDWg7k79eiT75ubgVrdoPKj
         wDdFW+AmCSeqjgD0LUf6T8tnU1whF3ywZ+kdhAcngEBvkNEEGiXLBpRXmnYKKKpI/DBk
         iLn1MGuHhDsCkAZ/iTz7R4T/rExJhYYE16OJWgjM1T4Z1T/dZRrhdqtFShdF2Qjr4Kqy
         2k3dFLlS+PiOGSXw3BAuggyTmw1ZB7OnpTNNTkTe3oe+h538T+2tn2uLRczF2iEOug+/
         9FmA==
X-Gm-Message-State: AOJu0YzK957WvOZkIFo4jobrDwVvJs2QKaKUCOHx5gvRdjWECl41zHRf
	6pAM/B17HhAREHaLSyXDBY2oYKfna8jRf2AfPW1VAQ==
X-Google-Smtp-Source: AGHT+IGotqSKoQXCFGIcuwlkQPZB72NGgPaU4wZmUji7gO4rCFm7wa0NO9LuviWkbp6wfwVM6mQfX4wP3zyE0VI3f4Y=
X-Received: by 2002:a25:6903:0:b0:dbc:dbab:61ab with SMTP id
 e3-20020a256903000000b00dbcdbab61abmr5881855ybc.12.1702992383748; Tue, 19 Dec
 2023 05:26:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <1702899149-21321-2-git-send-email-quic_dikshita@quicinc.com> <e08f54cb-5b28-497b-9484-b691dce0acff@linaro.org>
In-Reply-To: <e08f54cb-5b28-497b-9484-b691dce0acff@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Dec 2023 15:26:12 +0200
Message-ID: <CAA8EJpojYFRcO32wXc9B5Q1D1oSMbx3GP1d9qdtppar39-2=Qw@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] media: introduce common helpers for video
 firmware handling
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stanimir.k.varbanov@gmail.com, 
	quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_abhinavk@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 13:40, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 18/12/2023 11:31, Dikshita Agarwal wrote:
> > Re-organize the video driver code by introducing a new folder
> > 'vcodec' and placing 'venus' driver code inside that.
> >
> > Introduce common helpers for trustzone based firmware
> > load/unload etc. which are placed in common folder
> > i.e. 'vcodec'.
> > Use these helpers in 'venus' driver. These helpers will be
> > used by 'iris' driver as well which is introduced later
> > in this patch series.
> >
> > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > ---
>
> This is a very large patch, I think it needs to be broken up into
> smaller chunks.
>
> #1 Introduce common helper functions
> #2 Use common helper functions

This will make it harder to review. It's usually preferred to have a
single 'move' patch instead of two (add + remove). But I definitely
agree that the size of the patch is big. Somewhat it is related to the
fact that this doesn't only introduce helpers, but also reshuffles the
rest of the code.

>
> Its alot of code to try to eat in the one go.
>
> Could you consider making patches 1-3 a standalone series to reduce the
> amount of code to review here ?

This sounds like a good idea.

>
> * 77e7025529d7c - (HEAD -> linux-stable-master-23-12-18-iris-v2) media:
> iris: add power management for encoder (21 hours ago)
>
> * ceb6a6f023fd3 - (tag: v6.7-rc6, linux-stable/master) Linux 6.7-rc6 (2
> days ago)
>
> git diff ceb6a6f023fd3 | wc -l
>
> 21243
>
> Also I feel it wouild give more time for the changes to "digest" though
> upstream users and to find any unintended bugs.
>
> > +int load_fw(struct device *dev, const char *fw_name, phys_addr_t *mem_phys,
> > +         size_t *mem_size, u32 pas_id, bool use_tz)
> > +{
> > +     const struct firmware *firmware = NULL;
> > +     struct reserved_mem *rmem;
> > +     struct device_node *node;
> > +     void *mem_virt = NULL;
> > +     ssize_t fw_size = 0;
> > +     int ret;
> > +
> > +     if (!IS_ENABLED(CONFIG_QCOM_MDT_LOADER) ||
> > +         (use_tz && !qcom_scm_is_available()))
> > +             return -EPROBE_DEFER;
> > +
> > +     if (!fw_name || !(*fw_name))
> > +             return -EINVAL;
>
> The parameter check should come before the qcom_scm_is_available()
>
> No matter how many times you -EPROBE_DEFER -EINVAL is still -EINVAL.
>
> > +
> > +     *mem_phys = 0;
> > +     *mem_size = 0;
>
> I don't think you need this, you don't appear to use these variables
> before you assign them below.
>
>
> > +
> > +     *mem_phys = rmem->base;
> > +     *mem_size = rmem->size;
>
> > +
> > +int auth_reset_fw(u32 pas_id)
> > +{
> > +     return qcom_scm_pas_auth_and_reset(pas_id);
> > +}
> > +
> > +void unload_fw(u32 pas_id)
> > +{
> > +     qcom_scm_pas_shutdown(pas_id);
> > +}
> > +
>
> Do these wrapper functions add anything ? Some kind of validity check on
> the pas_id otherwise I'm not sure these are justified.
>
> > +int set_hw_state(bool resume)
> > +{
> > +     return qcom_scm_set_remote_state(resume, 0);
> > +}
> > diff --git a/drivers/media/platform/qcom/vcodec/firmware.h b/drivers/media/platform/qcom/vcodec/firmware.h
> > new file mode 100644
> > index 0000000..7d410a8
> > --- /dev/null
>
> ---
> bod
>
>


-- 
With best wishes
Dmitry

