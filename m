Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2967F1224A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 07:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfLQG1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 01:27:46 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:38392 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbfLQG1p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 01:27:45 -0500
Received: by mail-il1-f196.google.com with SMTP id f5so7489011ilq.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 22:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j8qQazTeYPQdPoVme7emjZiiaLOYVtOqidRg7IlHaTY=;
        b=CWsihZkNVNtPq/SN/NKHowVe5xKMAb4uOARJ+QvJIEf7JBDokni7tWRn9l9BumYAsn
         ixCxWlJo0IpiZ/5CjEdOds3HI9rdCTvBKSWoHXOmoQNpHIo2DNEzNKU/HWo+7mzq75tG
         fIvD9gSKO/dEvrlQ047bpMw3pWUXF2S6q6vWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j8qQazTeYPQdPoVme7emjZiiaLOYVtOqidRg7IlHaTY=;
        b=Ts3RJ/1Ov7ZVzdVtJHW9nJEvkSAjrXkNP5qbmjMTizdVXY5LWekGtyuESqiKrjnLYx
         +DB/AUBY3i+0jb71ue5LuuXV+PJCf7TAo6cX2Y8yrp6DJvUCTg+7BXSK39Xv83MY8HwJ
         cZCAJXnNyT5JicLlyvYf2T8MdUsAI2elPXeClE9C5Ayz+R5SkMe3yx7puELfa9897IsU
         x1IqE8OaA5GjlCEBHxs9z17+JCN9xOYnx13n3PjYwevrnbYlQ4r9wSDhpAOGiY/E4LQr
         lTkigh9c2xeQzxMoEAjEyuSe1xjRIyot/DEhh8AMOdYXdN5FAtYDVJHxrc1xYxde3T4w
         9FLw==
X-Gm-Message-State: APjAAAVMR2lM24RFT9z9ZYaOfGLqtm8TqXqo7emLm1VbNewQ8+wW0CNO
        5givgpK8bnPfvfH2ZheSEFmwcfKuUbY=
X-Google-Smtp-Source: APXvYqy1FENwQp68PlwqN9G+pixZMeD5Vduhmy8/GMNuae+89F21v1jkL3wLTUr0pYbKyoDwSZuDyQ==
X-Received: by 2002:a92:5d5d:: with SMTP id r90mr14241029ilb.284.1576564064806;
        Mon, 16 Dec 2019 22:27:44 -0800 (PST)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id n63sm4828468iod.57.2019.12.16.22.27.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 22:27:42 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id p8so7460003iln.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2019 22:27:42 -0800 (PST)
X-Received: by 2002:a92:da44:: with SMTP id p4mr4502564ilq.168.1576564061839;
 Mon, 16 Dec 2019 22:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20191212193544.80640-1-dianders@chromium.org> <20191212113540.2.Ibad7d3b0bea02957e89047942c61cc6c0aa61715@changeid>
 <5df2b77e.1c69fb81.15e56.4084@mx.google.com>
In-Reply-To: <5df2b77e.1c69fb81.15e56.4084@mx.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 Dec 2019 22:27:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WoNV26QYgADR1u-Fs00mitV9hYwHxt-rCP1agpEoa=pw@mail.gmail.com>
Message-ID: <CAD=FV=WoNV26QYgADR1u-Fs00mitV9hYwHxt-rCP1agpEoa=pw@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sc7180: Rename gic-its node to msi-controller
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Dec 12, 2019 at 1:56 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2019-12-12 11:35:38)
> > Running `make dtbs_check` yells:
> >
> >   arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml: interrupt-controller@17a00000: gic-its@17a40000: False schema
> >
> > From "arm,gic-v3.yaml" we can grok that this is explained by the
> > comment "msi-controller is preferred".  Switch to the preferred name
> > so that dtbs_check stops yelling.
> >
> > Fixes: 90db71e48070 ("arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> This problem is also in sdm845 and probably others.

Patch to fix sdm845 is at:

https://lore.kernel.org/r/20191216222021.1.I684f124a05a1c3f0b113c8d06d5f9da5d69b801e@changeid

That was the only instance I could find from a grep of arm64/qcom.

-Doug
