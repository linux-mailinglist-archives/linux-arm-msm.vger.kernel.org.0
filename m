Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA0491851AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 23:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgCMWeM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 18:34:12 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35807 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgCMWeM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 18:34:12 -0400
Received: by mail-wr1-f68.google.com with SMTP id d5so13725609wrc.2;
        Fri, 13 Mar 2020 15:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=u2/KsbMRst5bOqjjozeqv6hTnglC4BshRp2rjl0jtkE=;
        b=J+TIiwsKperfrX263SHYpVChqgx2ehGPtuTPCxNhG61/OgzX0SeZROV+/dZCwtr0UL
         iQZm5u345orMAsMTyYca+AHmpt7gL8VOm7ijkJKezhhW/iUqOwWa64hZfI2TT4M+OQ5w
         +GNCtW/wxOyQAEP2qsJog8CdrpPRNg8NAN2Qv4h9vPcNJgbKNbdwWvNY/9ujuPLNB29t
         O3y2tzPrHhfQ9oojPZ2C3mNhtXjGydVi7kdkJ4joFq1S9GhS+YbzFMUZ6c+3K9hRNk5U
         OhFRXx35CcfyIkEDhJDiTyyHkrJVSoCFtRnXy6C32sR3x4QRvhHrASLMB6ls3CaG6MCE
         tXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=u2/KsbMRst5bOqjjozeqv6hTnglC4BshRp2rjl0jtkE=;
        b=cjaLJ530orLqSUMw+uLGJSdQY8KkzXU9oqP+g1mOtPvzi2LZsw87K4ZdslmHdipVvg
         BfY3Qc8O1GU9ki2bv1g7BKYRy+YLI7yhnuJpFD1DEYmBzV6LGWvCnwIGOPk9Mf3Qu8ti
         Y78vebQkv3N76vTMLJ0rWMxuAl6aMLny8BEcVIoG1KI67nbs9h1QHzzAjeQflJ3+iVU8
         uAnShiBl8eUo1bLFHqj+cmUMU7vxU8CPRi3JFuQIGNnTEZhaCnM2E8X34QQT9wITrLhT
         P0T9p/qEIfWFT+837doki3J5DNocTcIDF3T1kiq621Q5mJ02aj8GF95cXAiqyLVJLBsa
         5p3w==
X-Gm-Message-State: ANhLgQ0CcOhQnjuCK0BTRCH10RGPkf23n2K1Mf+jjkvXY3GMRnIfTCM2
        i/Ve68pENr/xNqSPlBYjHkw=
X-Google-Smtp-Source: ADFU+vuwl9wZQqUu+AK3esARk//0MO9KcaK6BM7g9CGUYNYklmt4SgOYLGnFRB6MFLNXN1F+2JzSiQ==
X-Received: by 2002:adf:e98c:: with SMTP id h12mr20476792wrm.345.1584138849748;
        Fri, 13 Mar 2020 15:34:09 -0700 (PDT)
Received: from AnsuelXPS ([2001:470:b467:1:44af:5966:96b9:9aa4])
        by smtp.gmail.com with ESMTPSA id t1sm36023991wrq.36.2020.03.13.15.34.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 15:34:09 -0700 (PDT)
From:   <ansuelsmth@gmail.com>
To:     "'Stephen Boyd'" <sboyd@kernel.org>, <agross@kernel.org>
Cc:     "'Mathieu Olivari'" <mathieu@codeaurora.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Mark Rutland'" <mark.rutland@arm.com>,
        "'Michael Turquette'" <mturquette@baylibre.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20200313195816.12435-1-ansuelsmth@gmail.com> <158413179776.164562.8295974225127853050@swboyd.mtv.corp.google.com>
In-Reply-To: <158413179776.164562.8295974225127853050@swboyd.mtv.corp.google.com>
Subject: R: [PATCH] ARM: qcom: Disable i2c device on gsbi4 for ipq806x
Date:   Fri, 13 Mar 2020 23:34:05 +0100
Message-ID: <014101d5f987$82790c90$876b25b0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFhpnVMu9aClkJmE4H4ViqLWFkkBwJI+//GqR16BZA=
Content-Language: it
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Quoting Ansuel Smith (2020-03-13 12:58:16)
> > diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> > index 554c65e7aa0e..580aec63030d 100644
> > --- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> > +++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> > @@ -21,14 +21,5 @@ mux {
> >                                 };
> >                         };
> >                 };
> > -
> > -               gsbi@16300000 {
> > -                       i2c@16380000 {
> > -                               status = "ok";
> > -                               clock-frequency = <200000>;
> > -                               pinctrl-0 = <&i2c4_pins>;
> > -                               pinctrl-names = "default";
> > -                       };
> > -               };
> >         };
> >  };
> > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-
> ipq806x.c
> > index b0eee0903807..75706807e6cf 100644
> > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > @@ -782,7 +782,7 @@ static struct clk_rcg gsbi4_qup_src = {
> >                         .parent_names = gcc_pxo_pll8,
> >                         .num_parents = 2,
> >                         .ops = &clk_rcg_ops,
> > -                       .flags = CLK_SET_PARENT_GATE,
> > +                       .flags = CLK_SET_PARENT_GATE | CLK_IGNORE_UNUSED,
> 
> A better solution is to use the protected-clocks property so we don't
> try to touch these clks at all on this device. So this whole patch can
> be routed through arm-soc and remove the i2c node and add some dt
> property to the gcc node.
> 

Should I add a comment where the i2c is removed or I can remove it
directly?

> >                 },
> >         },
> >  };

