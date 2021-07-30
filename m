Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFAB3DB6AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 12:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238374AbhG3KEC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 06:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238414AbhG3KDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 06:03:44 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF6AC06179E
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 03:02:25 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t9so3819682lfc.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 03:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yrQFmPSsOocu2SRwmrh+oMoqHYk78zWUjrW9sn+KFu8=;
        b=oYxd3h6+XDaGKJsgHhkayzoJMa7ogz8odwMrcV4t1ibAg04dNdvJLETsYmmfrkSseV
         fxC/+cc/g5SPKMCajUrG9GAdrHha0IDA+oh25ufXCtSGPbhjJgS/lHTfN+PWvDaNZbAd
         YnUOJSt/covDyIQWEoSx7UeltkeZ1gsyidlXfXeH+PC/MV90c2nV+3LPejmS+xIfmF5X
         j6bKumV6Vc1tQ98o7B/06dQH9eO80WArYKzCamWiSFuOQSDmSDIToN9zLD405Invsy4z
         YT88a57yRD9YucDPaTPDdG8Kr3ogscFeED3zOjI7M7nSrQz585OFskj4YIGXGgezNdZU
         LTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yrQFmPSsOocu2SRwmrh+oMoqHYk78zWUjrW9sn+KFu8=;
        b=Jpozuv6S6qV+v3oiwDfJWWGDE0JHwdNf3ZerIRIVTmRnCCY6ARYFemQna24Fy9L+AA
         oxNZSLdtugnvz39qGE0RoOnxxCGXJEsQN/fDmd7wD5xWp7bvethwAkVE3tq/mMEkdSWh
         JJ+QGEr8I6O4wo47lzFW+99vBCKTcEZ/m6/guSNFmwGQdHNFfNFCtxV9C3xQDcsuUGkQ
         HnrrB6KfRMck5yHlAL4icP7tVXb8iGp1j5Cw0iQrAZ/cRfUKwj/AxP0aBuzw1PQBiC7c
         N/RHmuy5tzS9xX65icrI2wD2qJ+WWueeecMguPbzG1bCgyU1dZbWTN0/hrgpKC9fNzmj
         UAgg==
X-Gm-Message-State: AOAM532g/ko1zmFBNXy1L0VXqa43MSB89/2PvBfdxcRK8XaBkGq1WGpN
        Yhzf7oOoGF48EkMG57nqWK3USmaUu45IS/zoAYs6jRGbwBQ=
X-Google-Smtp-Source: ABdhPJx3kzOTrIVzHNFiv5EZ/V73fXl2Hn/oaV3vs0g/lVAyoet+DXaSEX4BPoAvgqkaX+OYaNJkKMx3tMkX3MJDMq8=
X-Received: by 2002:ac2:5312:: with SMTP id c18mr1253533lfh.649.1627639343457;
 Fri, 30 Jul 2021 03:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626987605.git.quic_vamslank@quicinc.com>
In-Reply-To: <cover.1626987605.git.quic_vamslank@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 12:02:12 +0200
Message-ID: <CACRpkdbqyi93Ncr4ANCV4ZVeZzNMMxumTJ4byu2vFZa=_0WhRg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add pinctrl support for SDX65
To:     quic_vamslank@quicinc.com
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 22, 2021 at 11:19 PM <quic_vamslank@quicinc.com> wrote:

> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
>
> Changes from v1:
>  - Addressed all Bjorn's comments
>
> This patch series adds pinctrl bindings and tlmm support for SDX65.

Looks good to me but waiting for Bjorn's review!

Yours,
Linus Walleij
