Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B358CE55D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2019 23:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfJYV2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Oct 2019 17:28:38 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36276 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfJYV2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Oct 2019 17:28:38 -0400
Received: by mail-io1-f68.google.com with SMTP id c16so4030623ioc.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2019 14:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5cm2HTCulL3+3TyuWZ4gSGdlFpdZ/BSdgV5mzZa148g=;
        b=kLAme1O9gdFMJve3eoPfNLgWL2/91n8kyzoKWqMViy5htHCxkGgCe9W47TYTkTC3ou
         +HAXh57e1evdu3sotQqgo0q3TlgdkbNn984DOTnVlOuJweMX6IbPzhL5Ah9GrZGpzL96
         YHj8vdyc3tUjecrGpVpWnabQ8BMpnYJbtIMnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5cm2HTCulL3+3TyuWZ4gSGdlFpdZ/BSdgV5mzZa148g=;
        b=ohhfvFaKrcQ2i8iEVyAULTAbB2VTAvkFrJiRaI8WvTi9msbUpAYhdGWzVbs4liPobG
         m8GExCWEsvyp3t5jCWZEt8AhDtccI+SA4HOq1surV50v3Jmi83dQQhXZqm0O6BPOchPn
         k1yI6nnd2ii25fDBocIIlW/INy4vNCh9qosiRgyA0I73zFLWIjrJJi7r6MfqOZqLernh
         0rsA4GfZWe5oDe5qgE51ngPi94A33Zuzoz3VQqS5xTyQFAgKAOQArfCNBaALeB338ukl
         OZTANiLCyyKQMuOAzdlfL8evYlY/IbKKI6b1VYWGqa6l9dflam7pmgeXsocOIiufjUGQ
         E6nw==
X-Gm-Message-State: APjAAAVBMotqftB+4Q4/miNLFBO4L/92vov6URAb6LCqsP40Gkz0Vpy1
        V7YMg9qyRpAhJ960tWlLRpoutJqx+XI=
X-Google-Smtp-Source: APXvYqxPAqn6DenzvDMvEToyjMvAavWLZNkKiAwVEM05t6FlN4QOnxODWw7WmRCClejU+xnmsQznQA==
X-Received: by 2002:a02:b397:: with SMTP id p23mr6054453jan.51.1572038915816;
        Fri, 25 Oct 2019 14:28:35 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id q8sm370546ioh.21.2019.10.25.14.28.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2019 14:28:34 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id v2so3086381ilm.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2019 14:28:34 -0700 (PDT)
X-Received: by 2002:a92:1e03:: with SMTP id e3mr7172098ile.168.1572038914174;
 Fri, 25 Oct 2019 14:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191025212106.2657-1-robdclark@gmail.com>
In-Reply-To: <20191025212106.2657-1-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 25 Oct 2019 14:28:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VqNpttUXQZ7KUd1ahsDrxST9BVoy9NXCM+xhQb9aRb1A@mail.gmail.com>
Message-ID: <CAD=FV=VqNpttUXQZ7KUd1ahsDrxST9BVoy9NXCM+xhQb9aRb1A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-cheza: delete zap-shader
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Oct 25, 2019 at 2:23 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This is unused on cheza.  Delete the node to get ride of the reserved-
> memory section, and to avoid the driver from attempting to load a zap
> shader that doesn't exist every time it powers up the GPU.
>
> (This also avoids a massive amount of dmesg spam about missing zap fw.)

optional nit: maybe when this is applied Bjorn / Andy can put in the
actual error message to make this easier to find if anyone is seeing
this problem.  Specifically:

  msm ae00000.mdss: [drm:adreno_request_fw] *ERROR* failed to load
qcom/a630_zap.mdt: -2
  adreno 5000000.gpu: [drm:adreno_zap_shader_load] *ERROR* Unable to
load a630_zap.mdt


> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)

I probably would have put it in two patches (one for sdm845.dtsi and
one for cheza) but that's more because I'm obsessive-compulsive than
for any real reason.  ;-)  In any case:

Fixes: 3fdeaee951aa ("arm64: dts: sdm845: Add zap shader region for GPU")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

-Doug
