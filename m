Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAC7D59431
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2019 08:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfF1G3c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jun 2019 02:29:32 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41068 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfF1G3c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jun 2019 02:29:32 -0400
Received: by mail-io1-f68.google.com with SMTP id w25so10167378ioc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2019 23:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yzdMu9wmm3sT//zZC0WGHtjFo3HffuvV4wa2Jufeytk=;
        b=hEf6FU5gQSt2RhXB3QMF6tTZmHNr/2cV3SkScLpMDBVwX+GjqNwijSVRQcysUiAbEg
         I5p4jqappCKkhMJFjnTYsijKCMdbjvTc9XX/Vcc7NWLI7ysJWG+C8srNfPReoAh8wwpY
         lTyVBtgowHU9ND0uamYCDEgzU9fDbn/75zoqU0AEafJIQnpudhWA+TwNb4dqrA0CzkqC
         rDh39Md3WOy6aGJhrWryJtfuJvN1LIxzM/wNxqyYaaXRe2R2uPY50VKvo6ilf3BiIwae
         MH8nIXBfmhho+TgNWCuvF8RJ0tHvCGDgUWMQcpbAg5RjQ913c/rzyYBIhgiY+5TFn410
         B6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yzdMu9wmm3sT//zZC0WGHtjFo3HffuvV4wa2Jufeytk=;
        b=jfNouxppX87Iso7uNJVZGJT56zYd/5zujLpP7dwu3fa9fS6Oe1iG6os91BGAI++IEl
         8sH0+OW3ODNXH5DhMhoPIy4AX1Q3BE15g7fPClxzQlfT+O9EoXlQUO3wREiExPFTRNo6
         1fsvxS+CVPBASjbj4zn4P+hndRzCpmHTHazGSkRQfOrF+dCZl4IRcUaEU1EGfzOiT16X
         MvX1+yBUNEwOXOAV3Fd8MxobhSmWCFJrwakP9y6EZCuj75pGLrZewotVMK3+6y8EcMBE
         4CBWhXIz4vBbV81dQjKE/sXqCwKHS99Ff7IQwrsr6ODpYHcLTeNx6NEpwaQYpwMQN6wF
         +J6Q==
X-Gm-Message-State: APjAAAWeb89XFGHJyp4vbAVNqkq7Lsz6ELvTTNzdiRzTjY7CUroqVaWC
        Hdg1KmCHQwQS+tTO2H0SonyXoX9fvxfzAHypow+eHg==
X-Google-Smtp-Source: APXvYqwBFox1JXGIEl2wH0JghlBvyept7dRaynmj11z4pFrRjtaIr0i0sREvQNzUv7Ybu5uC+ZMeE61et116WVQ9aEY=
X-Received: by 2002:a02:c519:: with SMTP id s25mr9025538jam.11.1561703371334;
 Thu, 27 Jun 2019 23:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <1561700182-18108-1-git-send-email-agross@kernel.org> <1561700182-18108-2-git-send-email-agross@kernel.org>
In-Reply-To: <1561700182-18108-2-git-send-email-agross@kernel.org>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 28 Jun 2019 14:29:19 +0800
Message-ID: <CAOesGMiTrSaWPb8T4waNbHoHVUVAiCpcgor-C-FKuzr=4ZfVpQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm Device Tree updates for 5.3 Part 2
To:     Andy Gross <agross@kernel.org>
Cc:     ARM-SoC Maintainers <arm@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 28, 2019 at 1:36 PM Andy Gross <agross@kernel.org> wrote:
>
> The following changes since commit 489bacb29818865d2db63d4800f4ddff56929031:
>
>   ARM: dts: qcom: msm8974-hammerhead: add support for display (2019-06-16 11:27:45 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.3-2
>
> for you to fetch changes up to e9146339515ece09ee651f122a51a26ae652ab80:
>
>   ARM: dts: msm8974-FP2: Add vibration motor (2019-06-25 13:29:32 -0500)
>
> ----------------------------------------------------------------
> Qualcomm Device Tree Changes for v5.3
>
> * Add vibrator motor for MSM8974 based Fairphone 2
>
> ----------------------------------------------------------------
> Luca Weiss (1):
>       ARM: dts: msm8974-FP2: Add vibration motor

Merged, thanks!


-Olof
