Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D26026623B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 17:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgIKPfI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 11:35:08 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:34435 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgIKPev (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 11:34:51 -0400
Received: by mail-ej1-f65.google.com with SMTP id gr14so14415951ejb.1;
        Fri, 11 Sep 2020 08:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rv8Uq4Yh5DeMvinWPQeAnG3AGmpR0//uZ7bahTCq3MA=;
        b=fBCXLhQwqrOv0pQfJf1y+MYbej+W1b8afBKPcx+bN33I15Jh/Gd2qOk+/GZixNboSs
         +wVEG3Eh69m8uObPoxKqPrEhbNhjgjVDpDi9qJs38jCoBMt4V+bYIT+FnEUVN0XffPax
         W1AlwFSK393PL6XaP8SSAsszefrmJk2Mc3U9THxTiIBDPWLNDlqkJltgCFNN4P+4RyYa
         Yz7wfClH/SeqfTd5ACzbGI0zEm6utDWrXUREo6KHFOwtpna5TvBF7uPRomrLd1cIwEWd
         KqnMAmfkGugb3dsrdQfsxYxziW7NBWTDkCr1SKlG2fxGwG8XxS+dDO2q0s9Ywg52CW87
         wILw==
X-Gm-Message-State: AOAM530Aubek8yJuqH7N77Ne8TZ8gEkUlohpXXRPyqo78Uj+Z5cmu0XX
        Vc7On/xZBHUpAIlMnLfDkqM=
X-Google-Smtp-Source: ABdhPJwqMxehrWj5AIk6bwgWo/6J4nFSeUNA+neqTDckmCySfnip8jOFjrj8I8PS1NPWYbv5f2Tj9w==
X-Received: by 2002:a17:906:7d0d:: with SMTP id u13mr2745908ejo.448.1599838484902;
        Fri, 11 Sep 2020 08:34:44 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id 16sm1970663edx.72.2020.09.11.08.34.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 08:34:43 -0700 (PDT)
Date:   Fri, 11 Sep 2020 17:34:41 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 01/10] clk: at91: Drop unused at91sam9g45_pcr_layout
Message-ID: <20200911153441.GA18190@kozik-lap>
References: <20200902150348.14465-1-krzk@kernel.org>
 <20200902163558.GA4137028@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200902163558.GA4137028@piout.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 02, 2020 at 06:35:58PM +0200, Alexandre Belloni wrote:
> On 02/09/2020 17:03:39+0200, Krzysztof Kozlowski wrote:
> > The at91sam9g45_pcr_layout is not used so drop it to fix build warning:
> > 
> >   drivers/clk/at91/at91sam9g45.c:49:36: warning:
> >     'at91sam9g45_pcr_layout' defined but not used [-Wunused-const-variable=]
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> > ---
> >  drivers/clk/at91/at91sam9g45.c | 7 -------
> >  1 file changed, 7 deletions(-)
> > 

Hi Stephen,

If the dev_err_probe() waits/skips/goes to /dev/null, then how about the
fixes in the series? This patch and few other?

Best regards,
Krzysztof

