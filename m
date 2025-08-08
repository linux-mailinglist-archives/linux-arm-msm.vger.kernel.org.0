Return-Path: <linux-arm-msm+bounces-68135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6C4B1F0AA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 261C55A13F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 22:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF7A289829;
	Fri,  8 Aug 2025 22:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOEOtT19"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F822289819
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 22:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692118; cv=none; b=eS2Q7vkcIvs0zClKEhigjOc1MDCcfYLJHuAzjCqi6HHFlxGc79GH8m1l5Oq+A0ApACtoUFiQ8yxJKiIhbJjJr4ZaCfEJJU2IE+7hh3oMOo5FXXGGThAfhXg2Ny8UR5AH8SIcbiciW3uefpgK0e/Y/3DSyx3U1k/EApV/PQAnSF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692118; c=relaxed/simple;
	bh=uaHfEqDd/Vc7Vg2XZAn7x4HzGyqtpzws6/5+aFC7Elo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5tr6wISke5pWqogsjKTtGvfhAJdvIP88juIgK6T1InHgGABCBnBsc+4d+O9tg3KnXc0hoQCdENYj4yG8nnh8EjTJkceagJ08GnkbcPov3EQOoQt7eroCuaTqmLW9sSIN3oPR84dlnuG2UnI3m/d7tjnpmu6dB2Sw3+x3vB9dCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOEOtT19; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b8db5e9b35so1373037f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 15:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754692115; x=1755296915; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bk4Z92vldvgPQRm+g46xxvwEKtrsTK5zc7BqRXD51dg=;
        b=QOEOtT19wKrtBOYLQiPirGTfz1xxJcBfhoCP26yr/MkvhnKh1CGZY8AL9DmQ8z8yT4
         4MMrULA87CTsCnzS3J0e1Afu298Vx7AqVavTkwKkMGZewRvCXK5mMxyvv1x5uVAL8Jdw
         K48LVWcDfO8GEYDvlgFEMRadmRKWWIv5zEj+rY4o4syq80JMSL6DTL3K6myTywXAX/SH
         3MXDJS8Bui6mzMcJLgdRYtYwowTlchSCa0FuQgBNiQFrCdmuKF4BFXP6XG9A2iRpAJvq
         TXFS2VkP8jBSjb1VyzBmwWxbQLnyAYBHbX/qKVroP3FaO1ZeBDh2kXUX8OAniTvLvTlM
         n4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754692115; x=1755296915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bk4Z92vldvgPQRm+g46xxvwEKtrsTK5zc7BqRXD51dg=;
        b=D0od0TZ8eA6Xvuook22dfIo8mSbOwlJbM5EFMhkb4J/5jF9CmHxpl5EC8oT5SYu2rc
         pRibK/LLigT8lpoRCHyMLqX2NiruptvMTZX+x2EWarn7ir+4/lD5lSMICLf5GUhnPUaG
         1xMrYNkDpnyQopaPTRjs1VINzNEPd9GkvDKLBfRXYJI0bizn75DNLGdyVKpnlcsSFp6O
         dPpZaJuE6CzEJfw9wInliK7oVv3C+oP68G3w7Ko8BHvFVMgH5lQDHFHaYboxk4T4sM5t
         tHNG7gfh6R0zI1osMnnHsNcyfWAnkc+i3TsWIp2dNC1dInhgx3uItn2EQBmMj5/yx+E6
         l39Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0rQYPtglU12UjZ8PMM+JhWfy0MbZq/okMIuqHcv8UGrN7QDKW6QkQY3ytF9ax90A91qYM+7Mx9fe/+id2@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8hFlR5pTgoz/qmQ7v9h6rlwaXzd4Q/N10vY4Nysx+tFXAm81
	CgHki5CuVLv6bfjJ3yidByDZzNdf5t7FLv1TdgUuRq8E3cyCqaDdu3nTlLjoE4zwkjFfm4aZ/xK
	qfIxKbdgcvDf7VheqQfLBKvTvwJ3cQ8QLrnppwZwKSw==
X-Gm-Gg: ASbGncvydk6iNCI59/83h75qsw9hQQTUB3WJSBB+CmVqCfpiuZmxI/mfQuMXemyem/Z
	Z+CVzsHenFx87CqGbEOctuZLrRw6S8XzHUIuTMOSWtGohHaQW1DQbmaG7ZHWTLVUZgqI6fgoIwF
	Bpi7fq3cP0U0N/3Tot11d9hqDAecpH+jbsxdYVJi1ioXWMBU6aNDSWuWjfOekGw5kdlbv5nU/ja
	XtHUjW1Ng==
X-Google-Smtp-Source: AGHT+IGy+JfWioN1EZvauRq8fNVKD77kq7pV11eEmcSqXqQw+Ty2x4MuKZfeT7+cYgy3zueauhd1kIbBdcArMua29PY=
X-Received: by 2002:a05:6000:2f85:b0:3b7:8d70:e0ad with SMTP id
 ffacd0b85a97d-3b900b4d8c1mr3401099f8f.32.1754692114271; Fri, 08 Aug 2025
 15:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
 <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org> <aJCyBbwNjZvTHnjT@hovoldconsulting.com>
In-Reply-To: <aJCyBbwNjZvTHnjT@hovoldconsulting.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 8 Aug 2025 23:28:23 +0100
X-Gm-Features: Ac12FXwR4FUrET6jv0_EOtK5Bc-B0SWbGu_iG6JN5BJKVMzOvOl3cxeCMpqOk-Q
Message-ID: <CACr-zFCq08Pu2=eLfe5=sYdGWEHmy7w+=Eo++9AjP96uCLCNcQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 dp controller
To: Johan Hovold <johan@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Johan,


On Mon, 4 Aug 2025 at 14:13, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Jul 31, 2025 at 09:51:26PM +0100, Christopher Obbard wrote:
> > The eDP controller has an HPD GPIO. Describe it in the device tree
> > for the generic T14s model, as the HPD GPIO is used in both the
> > OLED and LCD models which inherit this device tree.
>
> > @@ -5779,6 +5779,11 @@ tlmm: pinctrl@f100000 {
> >                       gpio-ranges = <&tlmm 0 0 239>;
> >                       wakeup-parent = <&pdc>;
> >
> > +                     edp_hpd_active: edp-hpd-active-state {
>
> The node name and label needs an index as this SoC has two edp hpd pins
> as I already pointed out.

Sure. After looking at the schematics this should be called
edp0_hpd_active. I will fix this in the next revision.


> > +                             pins = "gpio119";
> > +                             function = "edp0_hot";
>
> And you also need to configure the bias somewhere as you should not rely
> on the firmware having configured things for you (as I also pointed out
> before).
>
> On my T14s the internal pull-up has been disabled.

I am still unsure of what else needs to be set here. Can you help me
with the correct settings?

Thanks,
Chris

