Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49F40A88E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730886AbfIDOjY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 10:39:24 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41712 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730153AbfIDOjY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 10:39:24 -0400
Received: by mail-io1-f68.google.com with SMTP id r26so3272081ioh.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 07:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1mnEvqqsMfrK7oL7Uo1VI9bT2jioMINXAPrOrRKIiH0=;
        b=RHWFxoHuWz2c4xr8AV4IKHd/57vBcacJUJLUn57JUPWFRD9gg4UNDc6IMWXrqzqy4p
         4LVK8gP+DuCVhO7cOARO2rfGSB8RGG2/nneL9hVlegItN1ghJQlWdgFVUiwad0bBfCRy
         1CLbkDemHXoVYosFwGRRPBMKIDKn1tO+U0QxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1mnEvqqsMfrK7oL7Uo1VI9bT2jioMINXAPrOrRKIiH0=;
        b=Ys/+HZLeaq5/ub4fWyRvvz1DSgIcYk96+CykQ4WmAKEHUWn7VznTkRMQVh/jk2UEWM
         PwWShC83FHAtNvMldJyTm8F1dM9k7CTpisKe2mHK1cVyC7jXcTSV2sYhLMVHBuob3/F2
         H80M42oP92wq415r6Yy+CuqT1SGRQQmSNmx2pCecC4Jocu6+vT4AGYtT8CH3wqaDSvvD
         3C0TBK+FrR6auIhhRoDYjcA0mwbbk0xOrT+SjOAVFnD/CkmHbSxFYKOGoc2fSUH4SLZL
         x49/pwlquAmBBKLfSb/LwCR0C+DOynX8KGwMS/7E9+ENIge8Wm/5YkkFZnaVPOKd+8Bw
         rkTg==
X-Gm-Message-State: APjAAAWYAUtoECbl3yqIQtNEsTf/o3gwITPyTQL8T2zJCb+Hr6bA/uaM
        QoQ0mhVBCFBN3WZ6WGxeu9WCrWbREs3k4kd8L1tdpdqN
X-Google-Smtp-Source: APXvYqxC4pZPXlChU7BDj+xkfjSh4RHjc+ZGDkCjN1N8VL7K8GYO/5SDMvGIxyFM3p8+/UPlYvDKMHKg8ITPq0yy6tU=
X-Received: by 2002:a5d:8d19:: with SMTP id p25mr37639323ioj.247.1567607963327;
 Wed, 04 Sep 2019 07:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190904112653.22452-1-festevam@gmail.com> <CAP71Wjy3yR4vx-0e4E=EOAeKNaCp0KLyZaYyzRfRk0XefOBJFA@mail.gmail.com>
In-Reply-To: <CAP71Wjy3yR4vx-0e4E=EOAeKNaCp0KLyZaYyzRfRk0XefOBJFA@mail.gmail.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Wed, 4 Sep 2019 07:39:11 -0700
Message-ID: <CAJs_Fx7uYg_qFv1V=-Mt2X+8-WFV==cFmJEdh1cQPOuzUMdmBQ@mail.gmail.com>
Subject: Re: [PATCH] qcom: Add firmware files for Adreno A200
To:     Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Josh Boyer <jwboyer@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Linux Firmware <linux-firmware@kernel.org>, jonathan@marek.ca,
        cphealy@gmail.com, freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 4, 2019 at 5:09 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> hi Fabio,
>
> On Wed, Sep 4, 2019 at 1:27 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Add firmware files for Adreno A200.
> >
> > These firmware files are needed for running the adreno kernel
> > driver on i.MX51 and i.MX53 SoCs.
> >
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
> >  WHENCE             |   2 ++
> >  qcom/yamato_pfp.fw | Bin 0 -> 1156 bytes
> >  qcom/yamato_pm4.fw | Bin 0 -> 9220 bytes
> >  3 files changed, 2 insertions(+)
> >  create mode 100644 qcom/yamato_pfp.fw
> >  create mode 100644 qcom/yamato_pm4.fw
> >
> > diff --git a/WHENCE b/WHENCE
> > index a8ec628..5e46d33 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -4418,6 +4418,8 @@ File: qcom/a530_zap.b00
> >  File: qcom/a530_zap.b01
> >  File: qcom/a530_zap.b02
> >  File: qcom/a530_zap.mdt
> > +File: qcom/yamato_pfp.fw
> > +File: qcom/yamato_pm4.fw
>
> Where did you get these files from in the first place? On which
> devices do you expect these firmware files to work? We were recently
> discussing how to structure /lib/firmware/qcom more carefully. And the
> general consensus that we reached with Rob C. and Bjorn is that if a
> firmware is expected to work on a specific device (maybe it is signed)
> it should be placed in /lib/firmware/qcom/<device> and if it's
> unsigned and can be used on several devices based on the same SoC (dev
> boards, ..) then it should be /lib/firmware/qcom/<SOC>.

fwiw, the pfp/pm4 fw (later replaced by sqe) are not signed, so
/lib/firmware/qcom/ location is fine for these

BR,
-R
