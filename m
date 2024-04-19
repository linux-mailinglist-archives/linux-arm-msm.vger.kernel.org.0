Return-Path: <linux-arm-msm+bounces-17986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F658AB504
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 20:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB2611F21D04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 18:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB46D13BC37;
	Fri, 19 Apr 2024 18:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xoR5ljCh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BAD13BAFF
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713551065; cv=none; b=Mk5UmeNyJb0iMCEXXLnrIiKaq4TBjxsF5Q/htADWSGPy1m+z6jUlTMLbQN1hqVJpQBqiP1QbVKgbiTahPrJiGMNNpph2nYkEDvVx4eEQweMsP9KGkjT/P4L3k//kPp1bx0AztmvZIIudPU6aj26BVImtWKii0c3lAVl7xovXupY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713551065; c=relaxed/simple;
	bh=NFginpsZQzkc+IUEXuvB4+8n07HoAOpGM65YoepZAhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bxRuLU0eP+lyLkduO/s5Q7hhC2Nqb4SN05ZOpxB641ZSiPHPOIZKvvJPv6ofGwDyD/zFsSEBEHPKWA5c9Bz+O7bdeVavlKbV43XANZDVtxrLk/e7JwZ2nvGzouIqe2UyGeVZVgpr11n+6yyn2okIJ75Awrf+IoyTs68esJ3aWdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xoR5ljCh; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dde0b30ebe2so2396456276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713551063; x=1714155863; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=87JuVh7d4kdUGMIGr1XQj50RY23NW2Pfdz6yDSz36Fw=;
        b=xoR5ljChoBhK6HPp1ByN3dJIMy5j1Zy+YDISDN/HinyewNV4u/cU9LDO1DsOW+vRZ6
         /bVR5SBg09sy6X+EOYTsdM63es2FkRYiWPlddaYOLYcEG6/qR2dIEa38yqi1GOapiitM
         Z/Ws3ws+6Dfshvb4VfS2RNkzlyjp4+FiqZc+hPcXsrwjFyow3dl4J8pjIraMIll+Hfof
         bdAuqiqaur9bh6uq0jtF9aZCzVwURuqg6627G0Ie/HKgW2Gv4EOy1YPmQftdpVENv+zO
         LhB6R5rvFC4mDQ3UZ5Xa/EpNucC96CHJ+yidmgdlwXh1X6l3bOWSzBVYBZ1JDcWouZwu
         Ft7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713551063; x=1714155863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=87JuVh7d4kdUGMIGr1XQj50RY23NW2Pfdz6yDSz36Fw=;
        b=XDOlbZvEqIk1nbgMcSk+MsNdSQSBmr7ArF/K9X2hAP5yG1055/kkBlaEVuRjVqioex
         wmpTXhbPJJqQL9peziQxWMVfpAiFzaysmVk85I6qYdhBDAVki2+MkIVrURXVNElJIH0+
         c1NuDQawlPgNeyLrUlufxczMjxtUx4daayFSYBlj9hjjL30BagSIbDVjxsYbuHlQ2ktQ
         sfmYh+/PpBIGrsD2gWMIVjQYtWS5XkmlVjB82PSLxk8Fv0JQlbrK3uwMqXa8CwJyHa88
         fdK/jyxs5tt/gvcyPV9Meb3ch9upoNnqdI97z2DuRBn0IlLRmqCqm0BIiCIFsO0cBjzQ
         7t3w==
X-Forwarded-Encrypted: i=1; AJvYcCXZdJmvjQXAICSK0TG/duQpK/LQk7+g3W7ff5jtTT89CragE/GT9e1RBix8TP7NfxGxNwCzMUODIVEWJUzICtDu9elGPevdl146NKPaKQ==
X-Gm-Message-State: AOJu0YyJdIEXglN8nE84+dz0Oz9Dd32IHUj1SwuhYboYIGroeEzSmzX9
	JXuo5nsXKCG8NvwJKsuuf00H4tMGRFHYH0e8tMUM8V1QXOurNkzPLCb1MdmTIZ6P14NjkJWaIF3
	UcGGos8SOAV0xB6fe+7as27oSZhhe228oCZM7zQ==
X-Google-Smtp-Source: AGHT+IFpMOU9P8TRzXmES00IWuLolBBXz5tvSFP4Qt4a7k3TIVrR/znKc0JzfrdqBNkCdGC7KYzfYQLtCNrrrTy20s0=
X-Received: by 2002:a25:9c83:0:b0:dda:aa3e:73fc with SMTP id
 y3-20020a259c83000000b00ddaaa3e73fcmr3011290ybo.41.1713551063123; Fri, 19 Apr
 2024 11:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
 <20240419-qcom-pd-mapper-v5-5-e35b6f847e99@linaro.org> <b26b5d54-d04d-41e1-abe1-600633882989@kernel.org>
 <CAA8EJpoyTXWY5uxJs2gt1Rths-HdgskuQFyw5dJSL66mxQOv7g@mail.gmail.com> <67c90fcd-df2f-40e4-9507-dcc9340f2319@kernel.org>
In-Reply-To: <67c90fcd-df2f-40e4-9507-dcc9340f2319@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Apr 2024 21:24:12 +0300
Message-ID: <CAA8EJprQzp+bmTa9CFoev_vk8Xf-H+ZAc-dFsqev76WOB6GtJQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] soc: qcom: add pd-mapper implementation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Xilin Wu <wuxilin123@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Apr 2024 at 21:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 19/04/2024 20:10, Dmitry Baryshkov wrote:
> > On Fri, 19 Apr 2024 at 20:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 19/04/2024 16:00, Dmitry Baryshkov wrote:
> >>> Existing userspace protection domain mapper implementation has several
> >>> issue. It doesn't play well with CONFIG_EXTRA_FIRMWARE, it doesn't
> >>> reread JSON files if firmware location is changed (or if firmware was
> >>> not available at the time pd-mapper was started but the corresponding
> >>> directory is mounted later), etc.
> >>>
> >>> Provide in-kernel service implementing protection domain mapping
> >>> required to work with several services, which are provided by the DSP
> >>> firmware.
> >>>
> >>
> >> ...
> >>
> >>> +
> >>> +static const struct of_device_id qcom_pdm_domains[] = {
> >>> +     { .compatible = "qcom,apq8096", .data = msm8996_domains, },
> >>> +     { .compatible = "qcom,msm8996", .data = msm8996_domains, },
> >>> +     { .compatible = "qcom,msm8998", .data = msm8998_domains, },
> >>> +     { .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
> >>> +     { .compatible = "qcom,qcs404", .data = qcs404_domains, },
> >>> +     { .compatible = "qcom,sc7180", .data = sc7180_domains, },
> >>> +     { .compatible = "qcom,sc7280", .data = sc7280_domains, },
> >>> +     { .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
> >>> +     { .compatible = "qcom,sc8280xp", .data = sc8280xp_domains, },
> >>> +     { .compatible = "qcom,sda660", .data = sdm660_domains, },
> >>> +     { .compatible = "qcom,sdm660", .data = sdm660_domains, },
> >>> +     { .compatible = "qcom,sdm670", .data = sdm670_domains, },
> >>> +     { .compatible = "qcom,sdm845", .data = sdm845_domains, },
> >>> +     { .compatible = "qcom,sm6115", .data = sm6115_domains, },
> >>> +     { .compatible = "qcom,sm6350", .data = sm6350_domains, },
> >>> +     { .compatible = "qcom,sm8150", .data = sm8150_domains, },
> >>> +     { .compatible = "qcom,sm8250", .data = sm8250_domains, },
> >>> +     { .compatible = "qcom,sm8350", .data = sm8350_domains, },
> >>> +     { .compatible = "qcom,sm8450", .data = sm8350_domains, },
> >>> +     { .compatible = "qcom,sm8550", .data = sm8550_domains, },
> >>> +     { .compatible = "qcom,sm8650", .data = sm8550_domains, },
> >>> +     {},
> >>> +};
> >>
> >> If this is supposed to be a module, then why no MODULE_DEVICE_TABLE?
> >
> > Ok, I should add this to the commit message.
> >
> > For now:
> >
> > This module is loaded automatically by the remoteproc drivers when
>
> Hm? How remoteproc loads this module?

remoteproc drivers call qcom_pdm_start(). This brings in this module
via symbol deps.

>
> > necessary. It uses a root node to match a protection domains map for a
> > particular device.
> >
> >>
> >>> +
> >>> +static int qcom_pdm_start(void)
> >>> +{
> >>> +     const struct of_device_id *match;
> >>> +     const struct qcom_pdm_domain_data * const *domains;
> >>> +     struct device_node *root;
> >>> +     int ret, i;
> >>> +
> >>> +     pr_debug("PDM: starting service\n");
> >>
> >> Drop simple entry/exit debug messages.
> >
> > ack
> >
> >>
> >>> +
> >>> +     root = of_find_node_by_path("/");
> >>> +     if (!root)
> >>> +             return -ENODEV;
> >>> +
> >>> +     match = of_match_node(qcom_pdm_domains, root);
> >>> +     of_node_put(root);
> >>> +     if (!match) {
> >>> +             pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
> >>> +             return 0;
> >>> +     }
> >>> +
> >>> +     domains = match->data;
> >>
> >> All this is odd a bit. Why is this not a driver? You are open coding
> >> here of_device_get_match_data().
> >
> > Except that it matches the root node instead of matching a device.
>
> Yep, but if this was proper device then things get simpler, don't they?

I don't think we are supposed to have devices for software things?
This is purely a software construct. It replaces userspace daemon for
the reason outlined in the cover letter, but other than that there is
no hardware entity. Not even a firmware entity to drive this thing.

> >>> +
> >>> +     if (!ret)
> >>> +             ++qcom_pdm_count;
> >>> +
> >>> +     mutex_unlock(&qcom_pdm_mutex);
> >>
> >> Looks like you implement refcnt manually...
> >
> > Yes... There is refcount_dec_and_mutex_lock(), but I found no
> > corresponding refcount_add_and_mutex_lock(). Maybe I'm
> > misunderstanding that framework.
> > I need to have a mutex after incrementing the lock from 0, so that the
> > driver can init QMI handlers.
> >
> >> Also, what happens if this module gets unloaded? How do you handle
> >> module dependencies? I don't see any device links. Bartosz won't be
> >> happy... We really need to stop adding more of
> >> old-style-buggy-never-unload-logic. At least for new code.
> >
> > Module dependencies are handled by the symbol dependencies.
>
> You mean build dependencies, not runtime load.

No, I mean runtime load dependencies.

>
> > Remoteproc module depends on this symbol. Once q6v5 remoteproc modules
> > are unloaded this module can be unloaded too.
>
> I am pretty sure you can unload this and get crashes.

If for some reason somebody has called qcom_pdm_get() without
qcom_pdm_release(), then yes. To make it 100% safe, I can cleanup
actions to module_exit(), but for me it looks like an overkill.

-- 
With best wishes
Dmitry

