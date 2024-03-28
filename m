Return-Path: <linux-arm-msm+bounces-15639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA1F890DAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 23:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8014F29419B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 22:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3B125753;
	Thu, 28 Mar 2024 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K9BSxo05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13697208B4
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 22:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711665379; cv=none; b=aKl0UjrdraKyBWJStj3kd4CBfhOUINbbqVTQciiK7C3uBv5KBDblxnzyqBwS773gw5MHlLsSiGrE1TRaExrjceQgXg7LkuPaflq6IbU8HegOqE/o+ZhEumS9ac7OTL85z6XPQk88GjFd0OAAwKifrJsQIur8yIjTUejsHve98e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711665379; c=relaxed/simple;
	bh=DyXMPntpHzTM8gI5S4nIpWoHbAT9e7zLas+AdBIkAVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PL28dbwzuvSvRfm+/qvM2znjSlirY3zSR3CmOIImvvDTrFC6NqLAisPM+5c0A+dY7ScvZKJ2ApohNptDybBwg5JdPnnbXmkHhCW7a1jDdgmsw6A5z4h/k/RhLSmLkeWXoHI3WsVkEu4hg2AJsengJEwOzRHOPypGjwMOa0s6Ceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K9BSxo05; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc4de7d901so1369824276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 15:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711665377; x=1712270177; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LjY+wgOUFRoXu57CnEBA1CkVg+Yjx2wYh83Heq0qxKg=;
        b=K9BSxo05EwMlWixUhBUNSqQmHk5Vojr2loqHQi4pHNw0Ig6ZAz+k22xIbN79g/8bWW
         uRGTROIpkGu0ywMRdUbPJGCzFVQYHyJx3wyezBJG3mFxsF+uBNvekrGN662L56frIUOd
         jyp8qcAjKRDoSZHGzCB4Gb7GKn0CH0hszQGJr01HDZ/D5gFwuJc+DrSybP8xTmpejCZU
         aR+AyMc6SK6NS7vS54cZzokfZGgvGPR9b6Li4GUQHrGzLY0TI+cdG68VLmnhmdWmae8p
         9UeGfiuURjLANYIdS5liHV9em0GnGyb5eUK0QeaLGDfYHmHZHFk3vZHMAuMQbLUpheUh
         3Ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711665377; x=1712270177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjY+wgOUFRoXu57CnEBA1CkVg+Yjx2wYh83Heq0qxKg=;
        b=jfCIdj0jvFMIuAqSdRYACwPRLVZbljzEJlKsvkqEisJqKEwVtte6Bh7uWeyQpLnwqg
         SOHJby8HefZjj/Ch8WJlJgylJolLv/ti1N/lm/zxjjZQg6RZncIrg4ldq58hIhdcNsMx
         cn9wGV+rRWEOqtYuL8QlZ32NNt/qjWzyN1WCkqQbaSi9Nz5g5sc4HSRAdc1vtkn9Y5NF
         RtTegERPvFOXLB8xhW/1X4csmjTOgLqFPN9P/uBKMIGqLAljQNLcYRE0R6NP+CRbvayv
         Lj8Fo5BSEpp/72WW88eTxV9oOfQVdPF4ERAGrzFPRzQH1jDdF08AGfvsIcJZCSy0Tjw7
         1qpg==
X-Forwarded-Encrypted: i=1; AJvYcCWE21z0b0HLmOR2+ADib+SV0RXgxf7qEiwtHTTSbTtroR42oMQMo0xp5XmzRLl76a4PD4xxS6Gq8SaacjbjR8uFKduxT6aR4B6lpGGy0w==
X-Gm-Message-State: AOJu0YyS3a2XwqJKaRCQHyWN0fymun5Etg/1wg6DBDh7q1gIqA0923E4
	lawikx6FLKE60w9V8x8iouYiPAA7VqZsAbXYjGzzRbiNq1qFDWxp7iCbm1WwpR3E3QCmQX+Tqfr
	2CoyGAUBIOMqrBe5TCM6Bo8SC32ooXjutv1oe4A==
X-Google-Smtp-Source: AGHT+IHaI+kjiLOUYNKBR/srDk7VFG1X/iL9Lyrl5XxlS/w0akawROX6LC6YYP28982DF251YeuCQALSFyoyvb3mAX4=
X-Received: by 2002:a5b:183:0:b0:dcd:24b6:1ae7 with SMTP id
 r3-20020a5b0183000000b00dcd24b61ae7mr643047ybl.63.1711665377097; Thu, 28 Mar
 2024 15:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1711660035-9656-1-git-send-email-quic_khsieh@quicinc.com> <6641b5c9-1685-3d90-ac15-0b2e9d546bc5@quicinc.com>
In-Reply-To: <6641b5c9-1685-3d90-ac15-0b2e9d546bc5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 00:36:06 +0200
Message-ID: <CAA8EJpoXgtodevy_AHGRR8o3yB08dK1oeHdWUrnx13rsYgY=Dg@mail.gmail.com>
Subject: Re: [PATCH v1] phy/qcom-qmp-combo: propagate correct return value at phy_power_on()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org, 
	dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com, 
	agross@kernel.org, abel.vesa@linaro.org, andersson@kernel.org, 
	quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com, 
	marijn.suijten@somainline.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 23:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/28/2024 2:07 PM, Kuogee Hsieh wrote:
> > Currently qmp_combo_dp_power_on() always return 0 in regardless of
> > return value of cfg->configure_dp_phy(). This patch propagate
> > return value of cfg->configure_dp_phy() all the way back to caller.
> >
>
> This is good. But I am also thinking if we should add some prints in
> this driver like it doesnt even tell where it failed like here
>
>
>          ret = qmp_v456_configure_dp_phy(qmp);
>          if (ret < 0)
>                  return ret;
>
> > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > ---
> >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
>
> Also, I think we should have
>
> Fixes: 94a407cc17a4 ("phy: qcom-qmp: create copies of QMP PHY driver")
>
> If there is a better fixes tag for this, please let me know.

Fixes: 52e013d0bffa ("phy: qcom-qmp: Add support for DP in USB3+DP combo phy")

Otherwise LGTM

>
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > index 36632fa..884973a 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > @@ -2754,6 +2754,7 @@ static int qmp_combo_dp_power_on(struct phy *phy)
> >       const struct qmp_phy_cfg *cfg = qmp->cfg;
> >       void __iomem *tx = qmp->dp_tx;
> >       void __iomem *tx2 = qmp->dp_tx2;
> > +     int ret = 0;
> >
> >       mutex_lock(&qmp->phy_mutex);
> >
> > @@ -2766,11 +2767,11 @@ static int qmp_combo_dp_power_on(struct phy *phy)
> >       cfg->configure_dp_tx(qmp);
> >
> >       /* Configure link rate, swing, etc. */
> > -     cfg->configure_dp_phy(qmp);
> > +     ret = cfg->configure_dp_phy(qmp);
> >
> >       mutex_unlock(&qmp->phy_mutex);
> >
> > -     return 0;
> > +     return ret;
> >   }
> >
> >   static int qmp_combo_dp_power_off(struct phy *phy)



-- 
With best wishes
Dmitry

