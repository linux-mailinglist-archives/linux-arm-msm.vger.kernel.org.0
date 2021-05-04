Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE5B373128
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 22:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbhEDUDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 16:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232693AbhEDUDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 16:03:39 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD842C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 May 2021 13:02:42 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id k127so9877079qkc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 May 2021 13:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OQZCBZa+DL4hkqaW8G2In/CkuXl76YVF2oGiLQ+6dDI=;
        b=Wpq5ejVrP9YM1gsTemrlmMP7Q2mn0VOB7h7YsWC+mn5e4Jr4jHi1ngCnhAIF1BYNNR
         Zk+DJuuRFBwEGDQs1HwsXKWJVLDV6goV8+IRs7tBG6I2okLDGOHw+33AEGkaf8rEy3lM
         NZIOE/q+miK4dIRqYiD5L0RLPiT3NDL1+4MKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OQZCBZa+DL4hkqaW8G2In/CkuXl76YVF2oGiLQ+6dDI=;
        b=dZkpFvPnvBJvKl9rGFfSaUs2ZNrzx6ViK8tK5MgIcjfLrWo97m7S+gc6iYycY1e4RC
         9u50NGouEQAGgZS7/TqZVkxff6pshsNXgg1OiZtplfQK3/7bm4WmV0YUVH2Du2yffJR2
         xm1S5GPGsOz7CLFnwDlJspR2MG1wmoPH51UKAKpim3kLKtayrl9ddxvLmzhPoQ6r6Tim
         KkZjE9lIHPLkzEd82LcQVx1dYB6idEFUyGrymOKiOf9Vna5KSAJskYTzbTvAec6EKz8m
         aa7liChcsp0718P8eqV/xVhSPTQikZwsLO63q+oNLjtlgRIK0ChhSzvk+52RMu9e9AcN
         RUtQ==
X-Gm-Message-State: AOAM532vnLV7Wut7+RDmbCONF8kwApGfZru/yhRaj2dqGsK3NbhjKDOb
        eTa4O2XyRvdvcOjuqo/caxmm2xJE02AmuA==
X-Google-Smtp-Source: ABdhPJzI0b+Rp+0yBSSFx3eNE7+NjDOKTQj9aw2/TzHVrNh7U9M0Ljudaiw5LqccqE4FA08PEKlcyA==
X-Received: by 2002:a37:7043:: with SMTP id l64mr25977304qkc.358.1620158561610;
        Tue, 04 May 2021 13:02:41 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id a23sm6115682qkl.6.2021.05.04.13.02.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 13:02:41 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id h202so4797294ybg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 May 2021 13:02:40 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr34873607ybp.476.1620158560412;
 Tue, 04 May 2021 13:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <1620111510-31455-1-git-send-email-sibis@codeaurora.org> <1620111510-31455-3-git-send-email-sibis@codeaurora.org>
In-Reply-To: <1620111510-31455-3-git-send-email-sibis@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 May 2021 13:02:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vng40b05F2_i7qqXC+yN=ZBgRXsio-86sBA+QdoMMGaw@mail.gmail.com>
Message-ID: <CAD=FV=Vng40b05F2_i7qqXC+yN=ZBgRXsio-86sBA+QdoMMGaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7280: Add cpu OPP tables
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 3, 2021 at 11:59 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> +       cpu0_opp_table: cpu0_opp_table {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               cpu0_opp1: opp-300000000 {

It seems like it might be nicer to give the node labels a less
arbitrary name. How about?

cpu0_opp_300mhz: opp-300000000

That has advantes:

* If, for some reason, you have to mess with some operating point in
another dts it'll be less fragile.

* It'll make diffing easier between SoCs.

* If you end up putting a new operating point in the middle you don't
need to rename everything below.

Other than that, I can't say that I'm a huge expert on the
interconnect stuff and whether those make sense, but I'm still OK
with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
