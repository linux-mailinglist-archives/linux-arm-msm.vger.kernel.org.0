Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6303AC753
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 11:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbhFRJZD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 05:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbhFRJZC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 05:25:02 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A366C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 02:22:53 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id c11so13106738ljd.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1HcC0x5raBLiZCsopC7121WUquPXp1QqDe2+q9nm5Dw=;
        b=wAiMS/isuPBGlbfVjD1QY6LcyZoRvTqAe29UqoSq87xxZjY7K4FRLtVOIp88Miqii4
         JmoRMxqnzpiDpelikrQ/FOCM7P6dbfYD4/J6tupwor1PqAWKmJKDVlpcKh+uRV+uV1Fm
         P5I/wOKupe6rH4Hc5rxFKqPArGFZImOXpp6y/kJfA3IYxW7WoyBVRjXdIenmjKvO7Y+Z
         gq9ll7k7vlJrv6RLBUzWl5fwHLctO0NfoKv9zq49NVsY0K8sS5WcBwuCRIk3mlOiS5gr
         JDtc48VkhHfUwIP8pN3JGvRUFLflL0IGhhK/O3WsHlZo1vTgW2FB9f/M5ethRsT2QJ1n
         /KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1HcC0x5raBLiZCsopC7121WUquPXp1QqDe2+q9nm5Dw=;
        b=mOQuQvnQHbIE2hdTP/UH5nTb5ku4jovP1qm+T79ApkEKs6cegTUh7Fk3uN8NV2ZClU
         KmklIm/Ln4RgNJRhabiDeHgUNJS5cjG2CyUgpbrbytjUsOiPrU3cPGFzE8s10CPRco2L
         gt8CwRKFQe6cOFQ6KLfKGo77j455QD/DsrhE6NDwq1a31oKuJCAvYk7UYJ0jiAE/YZ1W
         cebg37xC5+gWOosWchkEKxOMQzn11UaQbefDhT3JvsFIMtskifWHFbQNQ/Pk1FQRF/SL
         3tWXgFGyj3UhKlYPVu5J076E54p2XWGhBQuT25Zz+JzB92wtvl8w4TVQe5DXP5U483//
         e1pA==
X-Gm-Message-State: AOAM53253TsdiTfEzkXialqN46fJ89+JvXggCgXowY7hYaAyExfsza8G
        9xw2Wy7Ps+k63NGNIerRKGUVERb2X4JfmO0NyAl7dA==
X-Google-Smtp-Source: ABdhPJxslJKOPj0rEtj2nqttfiHZhLBWzhyz58VAbZ7tJLvtkOtU/BG+NgnU1xP1gKFEpXV2nsh1eiPya0Qaq3v8ZTg=
X-Received: by 2002:a2e:81d8:: with SMTP id s24mr8698429ljg.326.1624008171748;
 Fri, 18 Jun 2021 02:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210614172713.558192-1-martin.botka@somainline.org>
In-Reply-To: <20210614172713.558192-1-martin.botka@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Jun 2021 11:22:40 +0200
Message-ID: <CACRpkdayxdPnhZptR_ZozcXd3+9rtYYhQVKxG_n7vPG-RQj8ag@mail.gmail.com>
Subject: Re: [PATCH V5 1/2] dt-bindings: pinctrl: qcom: sm6125: Document
 SM6125 pinctrl driver
To:     Martin Botka <martin.botka@somainline.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 14, 2021 at 7:27 PM Martin Botka
<martin.botka@somainline.org> wrote:

> Document the newly added SM6125 pinctrl driver
>
> Signed-off-by: Martin Botka <martin.botka@somainline.org>

Patch applied. DT folks have had plenty of time to look at the
v1-v4 versions already.

Yours,
Linus Walleij
