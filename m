Return-Path: <linux-arm-msm+bounces-21338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E42828D6827
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 19:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13BB71C2489D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 17:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8553E7BAE7;
	Fri, 31 May 2024 17:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YUsMRg9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED75955E4C
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 17:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717176594; cv=none; b=UjZHFH0cjFtz5y66LV6Jh59M+yz76gpom45fOYQz3Vm1DmT5tDybTy3Wd/+Qqtwr7r6YG59bV025mFMdv+CaW7ib/kd4ymUFrQP2H3hchZ0MA2dGVL9WYLbd52lv4N4NOivYvcYnWfeNB5Dw7DHQDWRiMTJpTqDc/pA/UypeBkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717176594; c=relaxed/simple;
	bh=Ocg7q0Va02+8OuCbKzPdbCjlO9z/WVg+JwJKRjv2Xek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7WjQ8S1N1PnOppVxzK4OB89B79RR1YpIUpcMmno5qaIDFVh6OfXDmtxgaQ6ImOtAMbqF+GrkRaUEAHc3p48j55j1/uxQ7zRnfut+NdFknOO/fv9Vm8q3CbS9BrgavSkwvGbWHEpAx7Jxmu5Phl+PG0cPKzLEBxLgv3HY89eeZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YUsMRg9G; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6f8e7b6c5dfso505543a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 10:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717176591; x=1717781391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm7zqDMgip+WJ2XM2t5p8Qmnl2zluKwd7L3ZaHXLQCo=;
        b=YUsMRg9GB5G+3ft6NgQfVZig8GtdwWcP/ruK6iE+/uXSEa7u07pvp5CJzw9Ci8BQI+
         5NR2/VPzaXf6qogEdWIKLAmfa+8QyPzop0CX6LPFK+PncJO76ooNIJ76ziYyB5AfKCm7
         CDDONoP13deAfu8cV64dIqr3cuU7eCLUHhfJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717176591; x=1717781391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm7zqDMgip+WJ2XM2t5p8Qmnl2zluKwd7L3ZaHXLQCo=;
        b=GMVaztJrq3QNJZg6KOnouk9ZNAO3BgiEKb3T7DIcN8waD0dUS9ji/Xp+POLiQJdiIW
         3M5DoVhjb/gnabjmB0+ZmHlGTMrDzWhZkTtQpp+sgUsHa8MRt/HqmtWZPapi083FUfDa
         JH0OS5PFIL5K6Z786ijZfhNeYZIM49dPXmerSKbb0e7aT3N1ImA+eehbrXwXAsNnC43k
         7fLVDjRuQXtpqUz1ftr+iEJ42TrMgEcafl4JNESL669Dt+GP2lNEb5QC/B9DnGS9BuQV
         xLGgCHIUSZJlhlzT9qs4PmZoJi3ZHNFKmbIwlzJnkYlldKhnTI5QhY01C5D+ww53b3PW
         4/ag==
X-Forwarded-Encrypted: i=1; AJvYcCW0LUvhw4EUOG1HezHcI89QsNpaPV5TWCAgmqgHMAa3nVoAnh7x9eSBDI+7kWIb2VubORE87D+QHjS9elYqTh6S3615NibceOxtySGdAw==
X-Gm-Message-State: AOJu0Yw1hMCujqRw0YKEw8El0CY8iEmJbrwqOoxa+lnewgSlEjcWarsd
	1N3msngQkyuWAnag7sI20BeRvoaM6gZwNoWVoOQx/YPIE1iRjICBRkC+QUh9FTvKadsgV9c/GBN
	wCU29
X-Google-Smtp-Source: AGHT+IGXTsTR1XWhmpTLJKfdkipWDwh4w4CVDmhjWkKyb2qlaSyDiDQSSIwPFOrj8jYVeQDffG/FbQ==
X-Received: by 2002:a05:6830:18c9:b0:6f0:4365:c43a with SMTP id 46e09a7af769-6f911f35631mr2836306a34.9.1717176591149;
        Fri, 31 May 2024 10:29:51 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43ff23a3dcasm9956961cf.17.2024.05.31.10.29.49
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 10:29:50 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43fe3289fc5so15741cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 10:29:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtQV08jXK1Nd77p41PUOKIdjrx+qdkNAsEEsXCrcVJPmd87hpnwYTn29XqsoYT2OuamVaFKMmdp+yV8K7miaG2NcQYNy4vkH22f12O8w==
X-Received: by 2002:a05:622a:4ac9:b0:43e:33f7:600c with SMTP id
 d75a77b69052e-43ff4f8dc64mr3254021cf.19.1717176589297; Fri, 31 May 2024
 10:29:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
 <7428a2f7-befc-6db8-76f4-3ca8dc12d31c@quicinc.com> <CAD=FV=Xcq-p5OxSnDJVF-Wp88ZfXOaOKJmh941ymy-f0wkhdhw@mail.gmail.com>
 <197777e0-e6e1-7004-be27-edb98f8a235e@quicinc.com>
In-Reply-To: <197777e0-e6e1-7004-be27-edb98f8a235e@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 May 2024 10:29:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UUmnKuBCwLLjrg69kCi7MTjMDYAVtdWEb3yqeZc=-5iQ@mail.gmail.com>
Message-ID: <CAD=FV=UUmnKuBCwLLjrg69kCi7MTjMDYAVtdWEb3yqeZc=-5iQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 31, 2024 at 9:51=E2=80=AFAM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> On 5/31/2024 10:20 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, May 31, 2024 at 9:18=E2=80=AFAM Jeffrey Hugo <quic_jhugo@quicin=
c.com> wrote:
> >>
> >> On 5/30/2024 5:12 PM, Dmitry Baryshkov wrote:
> >>> There are two ways to describe an eDP panel in device tree. The
> >>> recommended way is to add a device on the AUX bus, ideally using the
> >>> edp-panel compatible. The legacy way is to define a top-level platfor=
m
> >>> device for the panel.
> >>>
> >>> Document that adding support for eDP panels in a legacy way is strong=
ly
> >>> discouraged (if not forbidden at all).
> >>>
> >>> While we are at it, also drop legacy compatible strings and bindings =
for
> >>> five panels. These compatible strings were never used by a DT file
> >>> present in Linux kernel and most likely were never used with the
> >>> upstream Linux kernel.
> >>>
> >>> The following compatibles were never used by the devices supported by
> >>> the upstream kernel and are a subject to possible removal:
> >>>
> >>> - lg,lp097qx1-spa1
> >>> - samsung,lsn122dl01-c01
> >>> - sharp,ld-d5116z01b
> >>
> >> Ok to drop the sharp one I added.  It should be able to be handled by
> >> the (newish) edp-panel, but I think the TI bridge driver needs some wo=
rk
> >> for the specific platform (no I2C connection) to verify.
> >
> > Is the platform supported upstream? If so, which platform is it? Is
> > the TI bridge chip the ti-sn65dsi86? If so, I'm confused how you could
> > use that bridge chip without an i2c connection, but perhaps I'm
> > misunderstanding. :-P
>
> Yes, the platform is upstream.  The 8998 laptops (clamshell).  It is the
> ti-sn65si86.  I suspect the I2C connection was not populated for cost
> reasons, then determined its much more convenient to have it as every
> generation after that I've seen has the I2C.
>
> If you check the datasheet closely, the I2C connection is optional.  You
> can also configure the bridge inband using DSI commands.  This is what
> the FW and Windows does.
>
> So, the DT binding needs to make the I2C property optional (this should
> be backwards compatible).  The driver needs to detect that the I2C
> connection is not provided, and fall back to DSI commands.  Regmap would
> be nice for this, but I got pushback on the proposal.  Then I got
> sidetracked looking at other issues.

Crazy! I'm sure I've skimmed over that part of the ti-sn65dsi86
datasheet before but I don't think I internalized it. I guess if you
did it this way then you'd instantiate it as a platform device instead
of an i2c device and that would be how you'd detect the difference. I
could imagine this being a bit of a challenge to get working in the
driver.

