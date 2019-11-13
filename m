Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 822CEFB624
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2019 18:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbfKMRQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Nov 2019 12:16:52 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37582 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbfKMRQu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Nov 2019 12:16:50 -0500
Received: by mail-lf1-f65.google.com with SMTP id b20so2613392lfp.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2019 09:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tbmpc8I08dUNbz0TweIhlLBpMYWo1Ddtf0bugPdpg4o=;
        b=GpRaz3WzKyv4b6el90Iz4gY68k6ZMkDSEh2Hm5M0XVO2GvGiQXYLuOeRblysRbV95O
         /o9QxM7Dr9VjPZHJbmlPD+v+xOjqiSGlLuBd177bF9Y5icVTpiZRrTKok3ZZTQ/wDtBz
         OD0/VdGCoCIgoImm/TAEY+RuYIVJBGoif7u3rV8vKwf2bmxMkH46wFW8r/B8lLgHUY/j
         AYfLYXuLFlbVDpa/kxWt9gdsZixvnBRgFarHNgasLVY1VE/8+aqZM1tiw/DA61fKvNnp
         rwq1i9Eyg15IRctXukzSqaoYhr16QJbzTuSfXkLs7LUDp3Zvi+TCTQ1gaTePQTg2eWA7
         0sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tbmpc8I08dUNbz0TweIhlLBpMYWo1Ddtf0bugPdpg4o=;
        b=Ke6FltwxXPluDwQPylir2SDXX6uXOe//9uhIR5lixa1+3fRAnuO4W5n7zin2Zgh8ak
         7YAEYxKufIxEzCoahdLGPkMi+M4DcnDdr8VAcAX7BqiLqNR8p1FIaU90y+TB0LiPB7aF
         AmvJXpVAN5ty51lURUf2U0XQzfojr9pdzpTJuCFnhBmCL5kkVSCLrPHWuudMS1HrAlWl
         rprnfrPLddrIbDRe5HwR7q/aVdsOZnxOzTRph4Dx0t1TDpT+9w8LfgUXJ62accj2op7W
         db1bpYtnmu6e9AhV5pj4VebagB5zEXuMqYwGXQxvPcrXRzKQy0IpjemuF/CgZvO3cDZx
         0S9g==
X-Gm-Message-State: APjAAAUIhN/+KnfEhaICjPq6rj3NNmdMY3EcbnvcSI5MtW4cpg9jqddO
        7QjoRUCL7jumlI/eivrFBpBTuUIHelFGvlWgg1LiSCa8o/0=
X-Google-Smtp-Source: APXvYqzIPzbgpPUyvUtrneet0HOhaTTyNY9TeCNaIXTIuQ/Kcp/SiKtz7hsji0MJix60noP5lG6p8beaOSZpn4+OlKA=
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr3446808lfp.5.1573665408550;
 Wed, 13 Nov 2019 09:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20191113094256.1108-1-peter.ujfalusi@ti.com> <20191113094256.1108-6-peter.ujfalusi@ti.com>
In-Reply-To: <20191113094256.1108-6-peter.ujfalusi@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 18:16:37 +0100
Message-ID: <CACRpkdZ=xM2GYTDDLKoFwwdqp09-UDOyqogDW5pLvg4QaZXR6Q@mail.gmail.com>
Subject: Re: [PATCH 5/9] spi: pl022: Use dma_request_chan() directly for
 channel request
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Mark Brown <broonie@kernel.org>, radu_nicolae.pirea@upb.ro,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andi Shyti <andi@etezian.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vinod Koul <vkoul@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 13, 2019 at 10:42 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:

> dma_request_slave_channel_reason() is:
> #define dma_request_slave_channel_reason(dev, name) \
>         dma_request_chan(dev, name)
>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
