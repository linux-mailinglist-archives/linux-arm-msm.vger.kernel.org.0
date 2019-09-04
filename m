Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33B03A8922
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731143AbfIDPAg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 11:00:36 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:42211 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731105AbfIDPAg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 11:00:36 -0400
Received: by mail-qt1-f195.google.com with SMTP id t12so24702091qtp.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 08:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BrZmXuHo4AF0UcOLw8/NF0lCnpsHtln47XiOQdt4A7A=;
        b=ds9Yz3B5SPZONJGmeXTmIqzfAU5G0hrRdPalTZW1jB5WscBbFXH3Xm6ZOyuTaHOKDd
         ZXvVPpW1jEQRdmXfKeMNOOeKt3k00bitFVwY+nVIj3ByRY0ICL2+zVj0P1bLVAJnCRsS
         s54ATSZ0z2j2DKqJJdr7Ck5wIcXxuKlNwRH/4voGxvpMqC2OqEiQKOfSZ6horjT3YxFM
         Xa9MFPkNFtjduvYIZoRK1nzZVoQH/SV2fQgTkv4I0Nd+jx1MLsHKMMWtFmsEjouOcwWS
         eDO3+OxJq3/kwh6S5NRUQy6B827QX57k2k6NpNPM4chQQB0JaqCtKhQTWQktqV+wnAjM
         yP9g==
X-Gm-Message-State: APjAAAUBGq5GbVGuleIHmBm/jNRkWmK0meB85p2abY5gGW14Iq3JzPVj
        UpmcJWgd7o9NeRX/iOaUOsYXkNVevbGBKugGXsA=
X-Google-Smtp-Source: APXvYqx+15fewnibAIDQDgcL+c1CXYo+KUDNM90MF7Hm9nDdl9Rr2/5xG8FrS5RJlDFDgCuH+9s6NNzv7u1e/0lxqP4=
X-Received: by 2002:aed:2842:: with SMTP id r60mr30145389qtd.142.1567609235063;
 Wed, 04 Sep 2019 08:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <1567317285-8555-1-git-send-email-agross@kernel.org>
In-Reply-To: <1567317285-8555-1-git-send-email-agross@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 4 Sep 2019 17:00:18 +0200
Message-ID: <CAK8P3a2YW-kod3wEAr3WB+1vfq99KiBnU+mEBBypu_mokYRr3w@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 Defconfig updates for 5.4
To:     Andy Gross <agross@kernel.org>
Cc:     arm-soc <arm@kernel.org>, linux-arm-msm@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 1, 2019 at 7:54 AM Andy Gross <agross@kernel.org> wrote:
> Qualcomm ARM64 Based defconfig Updates for v5.4
>
> * Enable Qualcomm MSM8916 clock drivers
> * Add DRM_MSM to ARCH_QCOM defconfigs
> * Enable Qualcomm SM8150 clock and pinctrl drivers

Pulled into arm/defconfig.

Please remember to send pull requests to soc@kernel.org to have them
linked in the patchwork instance at
https://patchwork.kernel.org/project/linux-soc/list/

Thanks,

      Arnd
