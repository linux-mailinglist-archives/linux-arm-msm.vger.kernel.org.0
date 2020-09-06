Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB60225EE44
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Sep 2020 16:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbgIFOg1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Sep 2020 10:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728873AbgIFOf6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Sep 2020 10:35:58 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25CDDC061573;
        Sun,  6 Sep 2020 07:35:57 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p9so14529757ejf.6;
        Sun, 06 Sep 2020 07:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q89aax93ehgqnDpqySkCBxqHYn5Oh9gR6hW/u8LFBr8=;
        b=ovHw4eZBdY3L8OapmuNsE8LMwJhhYdwszsQKROWai2wIn78QnSkp5omaRK6a9PWScI
         M6U8XYgiO4J1uIOy4vzYaxoOOsAQNxzi6sYgj1zUvIMAFnkucTo04lTufCgOVQ5XBn/E
         LAk+OGyN6WuQ06F49ytIQzl1D577655JnUnE10PgYF+p7ay3UUw9wAGgO9aL76tGpn6F
         GPuojurSVSU3jB7FdqSm2Y4IBUx/C65Xi9GBRmPRDSZz0TwEc+xzLXW+9dlfL6lG/ujE
         FWjYhVnsbjCfC+jUa/VQRBoH8SDruTH5HKIm89p644eWTBjfDFmfDlhte/Z8MHSnrOdA
         cYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q89aax93ehgqnDpqySkCBxqHYn5Oh9gR6hW/u8LFBr8=;
        b=j2nKVxa1eG4UV+CMfxAlrfkmHfDiOwXmi5QTL9thXgWPwsEo4wXlHQO5VJ2KdGNJUJ
         1NcPPa+FpvI9EtdXGy9mp6lpnJsJE+csRzqy/vLiSUoF54A0nfjpjaAF5ZrVoUmuo5jl
         ed2iLdsypI+gIhm6J6DkHN8L1ViRjCxaGSY8NHmOycEpUsfsOHY/bz3o3ObzP0TpEw3a
         B6FO6W7D7CrkU0unaZGCfwqPlAObJLafxsVmWd6C7PrVMFOt/y5QywRN33a3Ez9HKc1h
         ilYXg/DDo+NFMlGvAH/j7WQsnULTs1lxrrXS0hSuZzHntJ2JCWGVMJ6Wo9FTys9rQI1n
         Nodw==
X-Gm-Message-State: AOAM53264jbUOiWobdEXeU3RVo47o9XoF+Fcgg/D0pdKCP5f0MIseFO5
        /9DjM+h5KEh3nehcrTkbMScrtVKudLabFs8D+M8=
X-Google-Smtp-Source: ABdhPJwBUn7FkQqOkATGfYcz2f4qyMFSilmgB8JIga3Anw9QHKUw13llcT0tygQd2Jo1U8P9yH0qMB88oMP8Duj/6co=
X-Received: by 2002:a17:906:2c44:: with SMTP id f4mr17092348ejh.52.1599402956383;
 Sun, 06 Sep 2020 07:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <1598851448-5493-1-git-send-email-amit.pundir@linaro.org>
 <CAMi1Hd3n2rfr+k09L8WO1S1Tn1s3xJencmr1q3a6e-FOgXr5Qg@mail.gmail.com>
 <CAMS8qEXcANkb-HoTk8zrXQEzkQO4cnFw4hj5tMp82UEVKd+eHQ@mail.gmail.com> <CAMi1Hd2ZakhXm+qNh-VMF_OndqCaQxxY3CC+UfQ6x2PyL_5sPQ@mail.gmail.com>
In-Reply-To: <CAMi1Hd2ZakhXm+qNh-VMF_OndqCaQxxY3CC+UfQ6x2PyL_5sPQ@mail.gmail.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Sun, 6 Sep 2020 16:35:20 +0200
Message-ID: <CAMS8qEVrSBPqtnMhAMY25yrUJ+M+3UrrGt+yikLaCyFDCUqCCw@mail.gmail.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Thank you for the pointer. I dug around the vph_pwr fixed-regulator
> node used by fellow sdm845 devices. I assume it is safe to copy it
> from sdm845-mtp but I couldn't verify it in the downstream
> device-tree, so I'm a bit hesitant. My main concern is that I don't
> want to burn down my only device :)

Sure, nobody does ^^

> I did find a few regulator nodes downstream which matches with
> upstream sdm845-mtp but since I'm not using any of them in my
> beryllium dts, I'm going to skip them for now.

Looking at their DTSes, Xiaomi doesn't seem to stray far away from MTP designs.

> As you pointed out, in case of regulator lookup failure Linux will
> fall back to dummy regulators, which is working fine for me so far.
> Also I see that vdd-*-supply properties are optional according to
> Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt,
> so I assume it is safe to skip them?

Yes, but keep in mind it would be a good idea to add them later, after
you're sure everything's okay :)


P.S. My current daily driver is Xiaomi Mi 8, which is basically Poco
with an OLED and glass back (among some other minor nicer things), so
thanks for your work, I might benefit from it in the future :)

Konrad
