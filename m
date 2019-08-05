Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 277F682496
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2019 20:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfHESFD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 14:05:03 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44998 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729383AbfHESFD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 14:05:03 -0400
Received: by mail-pf1-f196.google.com with SMTP id t16so40004635pfe.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2019 11:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZSkdc0K+z32xxfAPnuWbM7lfH87BvTZ2fp0ZJPTc+Cw=;
        b=cXmi7mI9gwJdyWlkxh4sZXDNnwqAOM396pNmF+W1i3XDqQTScm/cCqOx5XVa2iLejA
         Okh9/6L40CfVbdqGr5Shz+jFD7Ag4pGdOQ5YZkQHcqPtoaotaiApMZfOYK3K3xpjM8y3
         X6Ed5z/AL5ANJinBmBbc4ZVFVOwIdGw3rVliUR+sERk+XF4QoMsaevs2YWxvmew9VYWq
         Z51shcbd7kkT6yVs5a0PR3kuVZrX6dYOWFQxYHglJWImyoqQ1pWdGm4f/BKeAB29XnvJ
         sDNuequqjPbD5nlB8EN26VK5jKITS6IBWUfs5JnUXPcqfTFCav1mYpLcbnJVOAh5a2YH
         Ztvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZSkdc0K+z32xxfAPnuWbM7lfH87BvTZ2fp0ZJPTc+Cw=;
        b=QAmlGBR7YO/tYvNPDRwr3Ru7V0TeCoqc6EUTj19F+5MQ2vTbetibqoa+kdLhzEFpas
         DkmEdVHQRuldluhXtmrvhLLe3lMHczkfdwwYvKvCAxJCEYkh8osJPD7DQMjN1XvexvDM
         2oxdxoSSM0h3uD2mRMdkKs1RGD+WiOaV9QLgSXWkLCF/SIUPW2/d8ctHzYFcd/Z6orK4
         xtn5ULp780VUo28XJZAemxKdGY70nFT94mY+9c/arHy+c1wyigB+Hhq5W8DtlgXx+8b2
         Fi1/x3A3TbhbrldWMSSRpl0HmEvE4Er+m0p3SMg/BNNkXfY4OJOZyBEQOPxyBgTpVU1a
         TMsQ==
X-Gm-Message-State: APjAAAX5GBbvjP0+/5pCwbwVktmMJ1KpdLu3SWU7nrfVjlvwarnDNCtl
        reXtf0BlkcIT7gPOAtKjWu5Gaw==
X-Google-Smtp-Source: APXvYqyqwv3DLgpNhtnK2vwj2OiJn5Vdw0hfYPmrR/vLdQkSLHUgx7cCtN15F4zNLbLljZ08yl4v8A==
X-Received: by 2002:a63:6904:: with SMTP id e4mr76419969pgc.321.1565028302610;
        Mon, 05 Aug 2019 11:05:02 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j20sm80470011pfr.113.2019.08.05.11.05.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 11:05:01 -0700 (PDT)
Date:   Mon, 5 Aug 2019 11:06:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Govind Singh <govinds@codeaurora.org>
Cc:     Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] ath10k: Clean up regulator and clock handling
Message-ID: <20190805180633.GB23928@tuxbook-pro>
References: <20190725174755.23432-1-bjorn.andersson@linaro.org>
 <196fa4aa63fd5135aead736396fe3f8c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <196fa4aa63fd5135aead736396fe3f8c@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 25 Jul 23:52 PDT 2019, Govind Singh wrote:

> On 2019-07-25 23:17, Bjorn Andersson wrote:
> > The first patch in this series removes the regulator_set_voltage() of a
> > fixed
> > voltate, as fixed regulator constraints should be specified on a board
> > level
> > and on certain boards - such as the Lenovo Yoga C630 - the voltage
> > specified
> > for the 3.3V regulator is outside the given range.
> > 
> > The following two patches cleans up regulator and clock usage by using
> > the bulk
> > API provided by the two frameworks.
> > 
> > Bjorn Andersson (3):
> >   ath10k: snoc: skip regulator operations
> >   ath10k: Use standard regulator bulk API in snoc
> >   ath10k: Use standard bulk clock API in snoc
> > 
> >  drivers/net/wireless/ath/ath10k/snoc.c | 324 ++++---------------------
> >  drivers/net/wireless/ath/ath10k/snoc.h |  26 +-
> >  2 files changed, 48 insertions(+), 302 deletions(-)
> 
> Tested on 845 MTP and QCS404 platform with normal sanity and driver recover
> cases for proxy votes.
> 
> Tested-by: Govind Singh <govinds@codeaurora.org>
> Reviewed-by: Govind Singh <govinds@codeaurora.org>
> 

Thanks Govind!

Regards,
Bjorn
