Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2261520EBCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 05:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgF3DF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 23:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgF3DFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 23:05:55 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F2CC061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 20:05:55 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id gc9so2379748pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 20:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cNEVQy+vICiaQ3dEMjEVUMkRw1CNp3UqW6ADGZMeyq0=;
        b=szix04ENS8s/vNMuSV9gmxw6eDA/gHtPJCmi32AKDZtmQTu3dznzhrEYphazqsUTuV
         SD1LuvDvVW4PVhTqNQR0lQ8s/bE0fcLUu7dY1F+4WnisN/0UIb6GE1KSfXBiM+j9ft7q
         3iBqr8MxTD6kVSOBAVKm7ROP5aQqjOLPul/cWyg6+21Z5+UFZU571T26GNGiF3nYrcef
         wtJU0UjEtuJI9OtB7V78h+IZIMC48jFdlYemLhceDJ8QUmUGJL+kxfIUgAFPz+omWvMn
         7fQszesv9mXKkojzECfYvnGnx0N2NU2b1Cj0u94tyqer7SKrGU4IIREFN0OHnge5CFUJ
         zE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cNEVQy+vICiaQ3dEMjEVUMkRw1CNp3UqW6ADGZMeyq0=;
        b=Cl2AzHkCVmd8bx/tdd9ZRVDfnbpeNui+HDJVoM3vmp6qMgprYcQkYE45e2j4/tcSCt
         Gf+JZDbpJE7NJGTHNHXlo9qbZNrbAznQtBVzcWd9Zbrf741X7dFW1/o8UyanHQH+MoHm
         UdKc0SkLWalG/o8JznnAm8anUz2pJh8VVZk/oAhh0ff3RjN9VfGJLr9xdtfHz1wagjB4
         hiQeoKRUKB5G5QAn97shNiYmlcy7eAZ1isz6C1vzqWlbnUunQgTETPhwMxzTDKSC9XUg
         7w9qetEodNgs8TsqIQ/3+TQfsQIPt4XdUNNG1ssdRFshuUAGC+WWvewJ8ofYhJxLKHd9
         qUmQ==
X-Gm-Message-State: AOAM532UaDPIMptKIoeJPyzpFvv+3TzsOO3L5040FmJAq9LsIxkrByv/
        lR8RF1QZJBPE1gK3Ff8DwV11fg==
X-Google-Smtp-Source: ABdhPJwwYS9W4O4PrjOlLGBl4/OdVWJfaqDpaTLMqlG01WLme1r8xY9RSXQUaUY08Gft6qu0rVWgxg==
X-Received: by 2002:a17:90a:110:: with SMTP id b16mr7674307pjb.235.1593486354641;
        Mon, 29 Jun 2020 20:05:54 -0700 (PDT)
Received: from localhost ([122.172.127.76])
        by smtp.gmail.com with ESMTPSA id z2sm905277pfq.67.2020.06.29.20.05.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 20:05:54 -0700 (PDT)
Date:   Tue, 30 Jun 2020 08:35:52 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        robdclark@chromium.org, robdclark@gmail.com,
        stanimir.varbanov@linaro.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 1/6] tty: serial: qcom_geni_serial: Use OPP API to set
 clk/perf state
Message-ID: <20200630030552.cfp5oh33qde6nlnf@vireshk-i7>
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <1592222564-13556-2-git-send-email-rnayak@codeaurora.org>
 <159347264530.1987609.11350620235820019545@swboyd.mtv.corp.google.com>
 <a3d53f82-b29d-97ef-3ba1-ca9bd650d354@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3d53f82-b29d-97ef-3ba1-ca9bd650d354@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-06-20, 08:31, Rajendra Nayak wrote:
> 
> 
> On 6/30/2020 4:47 AM, Stephen Boyd wrote:
> > Quoting Rajendra Nayak (2020-06-15 05:02:39)
> > > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > > index 457c0bf..a90f8ec 100644
> > > --- a/drivers/tty/serial/qcom_geni_serial.c
> > > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > > @@ -9,6 +9,7 @@
> > >   #include <linux/module.h>
> > >   #include <linux/of.h>
> > >   #include <linux/of_device.h>
> > > +#include <linux/pm_opp.h>
> > >   #include <linux/platform_device.h>
> > >   #include <linux/pm_runtime.h>
> > >   #include <linux/pm_wakeirq.h>
> > > @@ -962,7 +963,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
> > >                  goto out_restart_rx;
> > >          uport->uartclk = clk_rate;
> > > -       clk_set_rate(port->se.clk, clk_rate);
> > > +       dev_pm_opp_set_rate(uport->dev, clk_rate);
> > 
> > If there isn't an OPP table for the device because it is optional then
> > how can we unconditionally call dev_pm_opp_set_rate()?

Looks like some *Maintainers* aren't paying enough attention lately ;)

Just kidding.

> because we have 'aca48b6 opp: Manage empty OPP tables with clk handle' to handle this.

-- 
viresh
