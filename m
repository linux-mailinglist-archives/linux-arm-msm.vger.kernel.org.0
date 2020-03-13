Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88E46185276
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2020 00:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgCMXrE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 19:47:04 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40642 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgCMXrE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 19:47:04 -0400
Received: by mail-pf1-f195.google.com with SMTP id l184so6226073pfl.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2020 16:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QqSV3LpUI3XKUkmQyfNi1UamAdu5bkgGpHDrMQfv4MU=;
        b=HNvgMOR2I4lu6ZzQhLaqLLWdM+2GtFd3IZ4AuPpce/zw9p/2oX7gHoLKNpj8pDJ3Pj
         Jij9sP4ezR342y5fuAI/xYD8IyVYpsAdH5FWh6dW9U0DC3yQUz/e9eRPDExe1KhgW0Vy
         rO81pgsWwtIIwk0BTd+z1VJ8I3vFOlSR9xbrp8wt4bH003euw1llVcV39hsIheW0NLZH
         3rH6dYrHUjz0+PDZvr/zh1CgPjpt1cZDRUdc3a/09XwqbDnHLO2Cgy/KP6Q7AQwDMqYy
         lLUX9NU/nAHYdBHqteUHrygCelftfNMsp+AxKPno4amYs3qpLBSFr+4snMF5NW7uHOCj
         kNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QqSV3LpUI3XKUkmQyfNi1UamAdu5bkgGpHDrMQfv4MU=;
        b=NMt7QAts1PF7bfqODp34xNpusRLPUOTQ/syx+MzWuyMdTM/qQ3GRi55r726eTeOQfM
         SDnnzZWzB8Ud0PWTXng9aJhI7qRU756Y6jkNsiS9FLugki9Y4NsxsjoXVhEPZbJF+ApO
         MZxT5tTk5BPdsRShZcQYX23XCRi0jfMKdowqTyHtG6KoQQXF4eblahQGfzBTrBfnH3rT
         1MZYR81VFJgENpbhHwxhd2je42Omo5/SU3LuO0JC24fs5HTiEfU1zvENTXII7YzxvQ6L
         SyGTu4wf6W7EUrTOaYXfMzQDlEvtE3or+uE1g9JPIKCzBYwtPwiDkzpgURUbmkMF0U3d
         uIPg==
X-Gm-Message-State: ANhLgQ2aa9bOOZYq5J1us90y76CIxMSudY6/XgZT+UDwhKcsezDu9W7V
        gJdpWeZiIKcgmiFgqlt1Zbo9Fg==
X-Google-Smtp-Source: ADFU+vsW6m1GL4wfPHL5s4jhGiDzBkhnb+8gcvRgTtKjWKHSrkQbWzNiNxyD247XMBP14NBXaEZ10A==
X-Received: by 2002:a63:1d7:: with SMTP id 206mr13645799pgb.99.1584143221655;
        Fri, 13 Mar 2020 16:47:01 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o11sm10927883pjb.18.2020.03.13.16.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 16:47:00 -0700 (PDT)
Date:   Fri, 13 Mar 2020 16:46:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     ansuelsmth@gmail.com
Cc:     'Stephen Boyd' <sboyd@kernel.org>, agross@kernel.org,
        'Mathieu Olivari' <mathieu@codeaurora.org>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Mark Rutland' <mark.rutland@arm.com>,
        'Michael Turquette' <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: R: [PATCH] ARM: qcom: Disable i2c device on gsbi4 for ipq806x
Message-ID: <20200313234657.GD1214176@minitux>
References: <20200313195816.12435-1-ansuelsmth@gmail.com>
 <158413179776.164562.8295974225127853050@swboyd.mtv.corp.google.com>
 <014101d5f987$82790c90$876b25b0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <014101d5f987$82790c90$876b25b0$@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 13 Mar 15:34 PDT 2020, ansuelsmth@gmail.com wrote:

> > Quoting Ansuel Smith (2020-03-13 12:58:16)
> > > diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> > b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> > > index 554c65e7aa0e..580aec63030d 100644
> > > --- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> > > +++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> > > @@ -21,14 +21,5 @@ mux {
> > >                                 };
> > >                         };
> > >                 };
> > > -
> > > -               gsbi@16300000 {
> > > -                       i2c@16380000 {
> > > -                               status = "ok";
> > > -                               clock-frequency = <200000>;
> > > -                               pinctrl-0 = <&i2c4_pins>;
> > > -                               pinctrl-names = "default";
> > > -                       };
> > > -               };
> > >         };
> > >  };
> > > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-
> > ipq806x.c
> > > index b0eee0903807..75706807e6cf 100644
> > > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > > @@ -782,7 +782,7 @@ static struct clk_rcg gsbi4_qup_src = {
> > >                         .parent_names = gcc_pxo_pll8,
> > >                         .num_parents = 2,
> > >                         .ops = &clk_rcg_ops,
> > > -                       .flags = CLK_SET_PARENT_GATE,
> > > +                       .flags = CLK_SET_PARENT_GATE | CLK_IGNORE_UNUSED,
> > 
> > A better solution is to use the protected-clocks property so we don't
> > try to touch these clks at all on this device. So this whole patch can
> > be routed through arm-soc and remove the i2c node and add some dt
> > property to the gcc node.
> > 
> 
> Should I add a comment where the i2c is removed or I can remove it
> directly?
> 

It's fine that you just remove it, like you proposed above.

The commit message should describe the reason and per your description I
don't expect that anyone will miss the node...

Regards,
Bjorn

> > >                 },
> > >         },
> > >  };
> 
