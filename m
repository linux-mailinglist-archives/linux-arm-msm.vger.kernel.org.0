Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75E3484BEA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 14:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387598AbfHGMon (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 08:44:43 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41071 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729781AbfHGMom (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 08:44:42 -0400
Received: by mail-lj1-f194.google.com with SMTP id d24so85329640ljg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2019 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9qAcXQ74wnq9lBV8xI9DKWSAH0H5RLjm/S1lKOmaMBg=;
        b=SyTkcf8dDd/qJ1huE2tGq5vti9WUJZR3c6pp88zP25SXfE+qr2KqpJJ9EnCu/6TW0i
         pi/EIkp0XiLke82zXZTC9ZdinmSM5ek00WFxEbo5FcJDxK4L82VQk2N+LlNRyXQnq2g4
         Sf69bBUT7mBcpzqievikQZqqrefRNeLI/r3CF3jMQ1dO2+cFCJrGhkaJIbrwe6egMhHv
         jYN2htDTwwTy1gjLmP5I8KWpk1BoxLQyIBVZCC7Fn+JaAOzLSh2vy/7Tr0ovkid1ZQAJ
         UZGx886EoY98kJdFo+JuBpTVWRCnmp5zRNE3mNzGeRp719fnJ8K8BU0xtAIKh3XexF47
         YZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9qAcXQ74wnq9lBV8xI9DKWSAH0H5RLjm/S1lKOmaMBg=;
        b=gcGpP/dnixkPZ3CuZSdvc8reaAjlY/SyWGqsViMP+thO+yvpD0QQJIB2BYNCfezzEK
         o9vnQMvcn9l+ldjyy1tIp6HBthJq5v0O3a/SHcu2fHcpbtG3piCuSu6dmQjTV3VibMrW
         iUOCPdWdZ9fjJJMNqTZRcqMU/WHtpa95yJUSeuT5snxJorEtRsyC+/WzcDGj0DXJY7Rx
         l6Onsk964rr017giTSoXcs7ieouaCsdY08j8d+crgPwhuv9Yt5LmoQl1nD8boAYX+yA7
         ta/ZD61NmcynrvIetoeYJbMQKWO5Q+xcB3B+z8DJtqU6o5uNj3fDTOBBVk7dHAbMZwsm
         wUhA==
X-Gm-Message-State: APjAAAUEKqUrtQ61p9XWl2Je0GRCtt3aLHj9HSi7O2hzlqr63Q7ad/Sm
        nm+mWdBygW5IOwYd8swIxvDRxOXEnKyYJKjtjJsMqg==
X-Google-Smtp-Source: APXvYqw0QLiekY2Wd3n7wub8yhIsoTVDzI2YudUSicPG1Sk8vAgOz3VhLcQ5SkSAoa5cDuQiW4DnULWNGV5eM841Z+Y=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr4756592ljs.54.1565181880879;
 Wed, 07 Aug 2019 05:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190806060536.18094-1-rnayak@codeaurora.org> <20190806060536.18094-2-rnayak@codeaurora.org>
In-Reply-To: <20190806060536.18094-2-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Aug 2019 14:44:29 +0200
Message-ID: <CACRpkdbUqZ+Jz1c2eS1s4Hen5mzDfrkN_Hn=U_0u3nOo43bCAw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Add SC7180 pinctrl driver
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jitendra Sharma <shajit@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 6, 2019 at 8:05 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> From: Jitendra Sharma <shajit@codeaurora.org>
>
> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for SC7180
>
> Signed-off-by: Jitendra Sharma <shajit@codeaurora.org>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> [rnayak: modify to use upstream tile support
>          sort and squash some functions]
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>

Patch applied!

Yours,
Linus Walleij
