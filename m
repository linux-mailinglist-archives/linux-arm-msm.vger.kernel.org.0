Return-Path: <linux-arm-msm+bounces-17988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EA58AB55D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 21:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C873B22EAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 19:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B52013A86D;
	Fri, 19 Apr 2024 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YnROduV5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA0AC8DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 19:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713553353; cv=none; b=o3LndOrnhAzXcynlgquzzLoeKtOuu8DLOE8MFQKR8QMJdibcRWcCDH3vJU9n91RmxC1UknaJnk7xg7XOpcJSOpN1ljQI6TfEib4UUdd+rKlK68L7GYOnW095NL2fqQ9czU8XO2JoNyxKCRgTvydbChlXPE7Pi/gMe5ULywr4Auo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713553353; c=relaxed/simple;
	bh=UhJcNRMs0vZ91LzrYCNDinJylgWKCou8J7y4IKDWYgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVXj9uTWemrq4aBF/nQPoraM5KFrJjx1mtBcnPb5HPIA95K3JgeYsetuU+OyUooGhjQnLKrqHkpDN8NMaMczsXaGZ4kTkM2cDIyf5ud+cQ5A16JiGtisDuSv4v7tie2NbsZRCBoDQe1tcEfP//vXizMA6Dvos/i/H5eunvnDNj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YnROduV5; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so2493975276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 12:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713553350; x=1714158150; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MM/dgZHXt8FS6OlywG34mVoNeCOlBTkm9fbT/NynvQY=;
        b=YnROduV5ZONNApZYEkX+5810LJvj6a38TtNvsIHsLz7X2s2awUkwkot3ncQgiNukn9
         k9wXbNcR+XRKJTLWB0A5Gq5hcnKMUVB8tHaTc4ji+URWC/gJLS1Wle0dVQXoCEHKUJSp
         j/4uGiTksbvqYnigFLv9nUXSqWxHSIXVXICOejvX9JAl8XQbcxr49ay4RI7Rbu//KUox
         dnPpqOnJmaaI1EfSWCdrjjtJqTiw78vuOFV2n2AoptB0m+8DAaEj+rj9XpkyO2QXcs69
         bxhnK2OLPs0iQbAdPOKqW0JSulo5IDWBE0Jf63Wa7jGNNwCeCLqyKDCWBw8/DeTE341u
         GfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713553350; x=1714158150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MM/dgZHXt8FS6OlywG34mVoNeCOlBTkm9fbT/NynvQY=;
        b=dqv2Aw5hcTscUhnKTj8N3O/ZrxV5BVnltErNzonb+darTzdhsni0ChIbvVzvNsIatc
         eJQGRYpXUQw8KXUO2xh86pz0TYDUxCZAxL2Xmgkl6Of0a5T8WAn92eDDtK7NP5oLdzpU
         nfCAj/eQaHrbJ7yR315okMUUrO3wuFr4XPWw1oV5AXldqgvWMgpUxVSqMfjqeesWF/cN
         3WxAApV6N4026NZFRwjCXtrI/dBowVUnPYLjcTbictLDt0awi0iW224PXQ62AR7VQznq
         ZBNryenFi+su+xHlx3v2GjVYWRUFFgbsBKv2dL3/XFNCoeiSUdqy9WdX0qXOvGOhPLBE
         MMjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpLM5rSamd8rplxrrDlXOILGsa3zLf+656rgJ84h/RSLCDuLjpnhO5x5kqSFZOCaoNdjQj5PDaoLIBj60yNcOAbn7kVn2F/sMYqdAuxw==
X-Gm-Message-State: AOJu0YyOXjG84JmrptxNHBJ6tRqKSBCa2MLeikU6oG4p1jaK/fsugP0b
	yTTGfcpgRaGQYmDszSRQvlGCUqDs3kJJmZOzIYmAeqSRXylhUvM6kZfuGaDcd2ZNqlknY9Q2rkG
	WX3Cb0C6e+u5+YwVzf91ZaCdij4piNiGzE35i4A==
X-Google-Smtp-Source: AGHT+IGYNvztQUdO273upIMXv4yi6iZHNs7ImfnmJnms8A12buCPUZGT0Vn926Qs8QF/zvzemXhWy27eQ6zHFvnA1oU=
X-Received: by 2002:a25:acdc:0:b0:dc7:4460:878a with SMTP id
 x28-20020a25acdc000000b00dc74460878amr3095289ybd.3.1713553348445; Fri, 19 Apr
 2024 12:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
 <20240419-qcom-pd-mapper-v5-5-e35b6f847e99@linaro.org> <b26b5d54-d04d-41e1-abe1-600633882989@kernel.org>
 <CAA8EJpoyTXWY5uxJs2gt1Rths-HdgskuQFyw5dJSL66mxQOv7g@mail.gmail.com>
 <67c90fcd-df2f-40e4-9507-dcc9340f2319@kernel.org> <CAA8EJprQzp+bmTa9CFoev_vk8Xf-H+ZAc-dFsqev76WOB6GtJQ@mail.gmail.com>
 <c255c9d5-f3fc-438c-abbe-64995823e80c@kernel.org>
In-Reply-To: <c255c9d5-f3fc-438c-abbe-64995823e80c@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Apr 2024 22:02:17 +0300
Message-ID: <CAA8EJpoyg1VXzQVU2BBScXXyxbZo+pV1AR52=GcrJ0Z3Sp8iVg@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] soc: qcom: add pd-mapper implementation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Xilin Wu <wuxilin123@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Apr 2024 at 21:45, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 19/04/2024 20:24, Dmitry Baryshkov wrote:
> >>>>> +};
> >>>>
> >>>> If this is supposed to be a module, then why no MODULE_DEVICE_TABLE?
> >>>
> >>> Ok, I should add this to the commit message.
> >>>
> >>> For now:
> >>>
> >>> This module is loaded automatically by the remoteproc drivers when
> >>
> >> Hm? How remoteproc loads this module?
> >
> > remoteproc drivers call qcom_pdm_start(). This brings in this module
> > via symbol deps.
>
> Ah, right, I understand now. So this should not be loaded on its own on
> the machine.
>
> >
> >>
> >>> necessary. It uses a root node to match a protection domains map for a
> >>> particular device.
> >>>
> >>>>
> >>>>> +
> >>>>> +static int qcom_pdm_start(void)
> >>>>> +{
> >>>>> +     const struct of_device_id *match;
> >>>>> +     const struct qcom_pdm_domain_data * const *domains;
> >>>>> +     struct device_node *root;
> >>>>> +     int ret, i;
> >>>>> +
> >>>>> +     pr_debug("PDM: starting service\n");
> >>>>
> >>>> Drop simple entry/exit debug messages.
> >>>
> >>> ack
> >>>
> >>>>
> >>>>> +
> >>>>> +     root = of_find_node_by_path("/");
> >>>>> +     if (!root)
> >>>>> +             return -ENODEV;
> >>>>> +
> >>>>> +     match = of_match_node(qcom_pdm_domains, root);
> >>>>> +     of_node_put(root);
> >>>>> +     if (!match) {
> >>>>> +             pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
> >>>>> +             return 0;
> >>>>> +     }
> >>>>> +
> >>>>> +     domains = match->data;
> >>>>
> >>>> All this is odd a bit. Why is this not a driver? You are open coding
> >>>> here of_device_get_match_data().
> >>>
> >>> Except that it matches the root node instead of matching a device.
> >>
> >> Yep, but if this was proper device then things get simpler, don't they?
> >
> > I don't think we are supposed to have devices for software things?
> > This is purely a software construct. It replaces userspace daemon for
> > the reason outlined in the cover letter, but other than that there is
> > no hardware entity. Not even a firmware entity to drive this thing.
>
> Firmware interfaces are also not "devices" but we create device drivers
> for them. The code lies in drivers, so it is a driver, even if somehow
> kernel software construct. fs/pstore/ram also has a driver, even though
> this is software device to handle ram dumps (it is not a driver for
> RAM). net/qrtr/smd.c is not even in the drivers and as well describes
> some sort of software daemon.
>
> If this was not a driver, then it would be a subsystem... but it is not
> a subsystem, right?

It is a server. Or a service. Compare this to nfs-kernel-server or
historical things like khttpd.

>
> >
> >>>>> +
> >>>>> +     if (!ret)
> >>>>> +             ++qcom_pdm_count;
> >>>>> +
> >>>>> +     mutex_unlock(&qcom_pdm_mutex);
> >>>>
> >>>> Looks like you implement refcnt manually...
> >>>
> >>> Yes... There is refcount_dec_and_mutex_lock(), but I found no
> >>> corresponding refcount_add_and_mutex_lock(). Maybe I'm
> >>> misunderstanding that framework.
> >>> I need to have a mutex after incrementing the lock from 0, so that the
> >>> driver can init QMI handlers.
> >>>
> >>>> Also, what happens if this module gets unloaded? How do you handle
> >>>> module dependencies? I don't see any device links. Bartosz won't be
> >>>> happy... We really need to stop adding more of
> >>>> old-style-buggy-never-unload-logic. At least for new code.
> >>>
> >>> Module dependencies are handled by the symbol dependencies.
> >>
> >> You mean build dependencies, not runtime load.
> >
> > No, I mean runtime load dependencies.
> >
> >>
> >>> Remoteproc module depends on this symbol. Once q6v5 remoteproc modules
> >>> are unloaded this module can be unloaded too.
> >>
> >> I am pretty sure you can unload this and get crashes.
> >
> > If for some reason somebody has called qcom_pdm_get() without
> > qcom_pdm_release(), then yes. To make it 100% safe, I can cleanup
> > actions to module_exit(), but for me it looks like an overkill.
>
> I'll come with some more concrete example if you are not convinced.

Sure, I might easily be missing something.

-- 
With best wishes
Dmitry

