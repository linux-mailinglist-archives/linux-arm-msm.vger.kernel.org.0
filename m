Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1E448F1F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 22:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiANVQp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 16:16:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiANVQp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 16:16:45 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED687C061574;
        Fri, 14 Jan 2022 13:16:44 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 30so38613238edv.3;
        Fri, 14 Jan 2022 13:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=YrvRfhmO1hiyCxFoGjXY+IVWhPEEmP2piXZZ4kxoAXI=;
        b=iB8+QE4FEx0hL/yYmufZsOJsHduPAtwSozYOmHSoAag7Zi0uO+sH0ZZDKid3Cq9p2A
         qT17SRBjXy+fbEYWK2oOD9PD7aeXvYVHPCy2jCzBgg3IJRz9BFNrAKyJdGWNL6RH5m4F
         5fq7ePCZ1sPz5lAH0J4k2zwdXHma66XfYvaGlbAV/GNm0kEIJPUJz1blYPXO/xmIUk+q
         B0ZhuGmSMJ/3E3vWnexW1Uu8F7TMLU2MFugsN2yBR+bx3QlOnA0qIUgFTp21uS7G+Irs
         3mebAXwcrItj4k33/yeJdRQ2jPEJvtU8ULRjMKoPHwhkF/R8Jrwye8PwlrJSyhSwxifm
         I43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=YrvRfhmO1hiyCxFoGjXY+IVWhPEEmP2piXZZ4kxoAXI=;
        b=G4qrNq3a1yXIhUr58VKYQe29JU607KJ0au2clfKfuO+Fx/WjnmtcSiTBkiTufNXgbi
         WZqTznOQoychm67Sf0COw4EhTMf7utAC7aeC/KV8g0BqpbarHoNiwwFVBD+qTI2I7yN9
         FlURojxWrRQTuXnmOUP4I/EXTWsO9WD14odbJ1qJkQEFLyKa2SG1UhGK6CydUWbl+fQX
         N3RUxvTrMDJHVMHcWTyCyabtsswGDibIim/Kyg3e9UkzEOpoxsY5ZBEuDv4OvIXG5lup
         0FiNxJ2q3+FESmYs340ddcwR4syuZ7vKLtantpxIyTGZCeBImCVQz5mxlGd9MiifB5Hq
         c7MQ==
X-Gm-Message-State: AOAM531N1klH94RnFpXPerzG5+288ex3HSycB9GiFTxkM3Iaqw3+7fY7
        aFvPC8kT8PiAss/xJzUYXmnknlDHMGRcVA==
X-Google-Smtp-Source: ABdhPJwjQ5OsNFr9YSM4lWT4rLEGMdp2CX29Vv5K/TfMbTBAd4ffpVxgosQz0ycJBbJLHeG15zxFEA==
X-Received: by 2002:a05:6402:2696:: with SMTP id w22mr10405102edd.253.1642195003581;
        Fri, 14 Jan 2022 13:16:43 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id t20sm2697737edv.81.2022.01.14.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 13:16:42 -0800 (PST)
Date:   Fri, 14 Jan 2022 22:16:40 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Jean Thomas <virgule@jeanthomas.me>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8994-huawei-angler: Add
 sdhc{1,2} definitions
Message-ID: <YeHoOL7KH01LJ5nc@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20220113233358.17972-1-petr.vorel@gmail.com>
 <20220113233358.17972-6-petr.vorel@gmail.com>
 <YeC4Y+rZrNpubxhR@pevik>
 <b249531e-ef1a-da29-0d3e-eef251b22c87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b249531e-ef1a-da29-0d3e-eef251b22c87@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad, all,

> Hi, please check if [1] can solve your clock issues, as it did for me.
Thanks for info.  I still need my patch "arm64: dts: qcom: msm8994: Provide
missing "xo_board" and "sleep_clk" to GCC" [2] regardless I use "clk: qcom:
gcc-msm8994: Remove NoC clocks" [1] or not.

Kind regards,
Petr

> Konrad


> [1] https://patchwork.kernel.org/project/linux-arm-msm/patch/20211230023101.1122588-1-konrad.dybcio@somainline.org/
[2] https://lore.kernel.org/linux-arm-msm/20220113233358.17972-4-petr.vorel@gmail.com/T/#u
