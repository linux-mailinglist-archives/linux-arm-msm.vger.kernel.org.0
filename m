Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618BC2853C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 23:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbgJFVQa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 17:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbgJFVQa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 17:16:30 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3408CC061755;
        Tue,  6 Oct 2020 14:16:30 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id md26so19729670ejb.10;
        Tue, 06 Oct 2020 14:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OUkZ8Np/B9A5Tr2kvzOhcQInYr++ig9zgQwFFSAu5tQ=;
        b=HbRX7gi1rPpzW3Kg6eXahbjwIJfYemIFBUgMPBCH2QT+LuGRdW4faXr1lXwhww5TJB
         DMMp+Scow7tWo1hnPmsh9A+I56TOloNz3sRkTtDTaKCBzcMPvQ2djXJTmsB2M5gqQnUX
         QAg+1sfZ/x5vO3dnoDkz0+UyGjXDgk+5Y1aQ4yqhXryiveq6b/J3vYdFUaPJhKmS0mr2
         HpnF8ZjwoPam+RwZQFMg+seI1epJQ4cSeYkECArsvnu9ly0CY8keC4QMyTIDT7wXGzBR
         BBBZCj7LY6QNVcXbPFQBnR9elvR2s+ba7uybvfH/feLSVnh6GwgLTFGUUl2gREjfb36O
         KGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OUkZ8Np/B9A5Tr2kvzOhcQInYr++ig9zgQwFFSAu5tQ=;
        b=I7YpOZNt9hguGeC/H9TCMyoRXvCmXM6GgNZBrKgM0KgVqPJ7QsOZ0LYrbCNf3XbRWh
         OcQjmdlk9m3vnOO/BDqLWbrq2BIJlxxnb96ienSjbn/Ilwn9+Qjwgo7Fd3Lm9XSKAguL
         uKvrA1hBCDdwoMpVJEcs6v3XuVoaUizhTIn+QO0U+r/EKH0dfhgcHf+f/akQMReOjnJj
         H6Rm6bgKqQmdixUcRS4q3DF1cd0lfBQlFJ5cBN+7BvtwdoemMEOgqNpF46YYtDWZPNg4
         oGNwAY4jhb0Ajfe92dtrj2LGd10k4b73ApXsT80yL39VLLxPCANTPdrFeJFxlsf06kXS
         iCdg==
X-Gm-Message-State: AOAM5306N3PEicRvKKv4rADWfRgqfgsiKp2AgH7WaZBYbw/zVig7vmp7
        UGvkvhH+Sq/kmZFQ3Izox0zxvis7UqKetdsTFwk=
X-Google-Smtp-Source: ABdhPJw+dQle2HSBoAZP866K10e69otfUfs5n0PUaiC38bdzpVNq1/8RsU6nmsKWYrXTaBvgzbPZnYzHdmqPsjI+uNw=
X-Received: by 2002:a17:906:3bc9:: with SMTP id v9mr1518941ejf.340.1602018988897;
 Tue, 06 Oct 2020 14:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201005150313.149754-6-konradybcio@gmail.com> <202010061559.8KJNEgYi-lkp@intel.com>
In-Reply-To: <202010061559.8KJNEgYi-lkp@intel.com>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Tue, 6 Oct 2020 23:15:53 +0200
Message-ID: <CAMS8qEW=4_+-noGH+eyqJ5qPF3Ap06aF37aY2tsFPRwSOPRR0A@mail.gmail.com>
Subject: Re: [PATCH 05/11] arm64: dts: qcom: msm8992: Add support for SDHCI2
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please note that the bot is correct (this patch does not build if
applied on its own), but I mentioned its dependence on a clk patch in
the cover letter.

Konrad
