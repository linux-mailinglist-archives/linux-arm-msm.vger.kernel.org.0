Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48A1413CCFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 20:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbgAOTTt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 14:19:49 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40865 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728921AbgAOTTt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 14:19:49 -0500
Received: by mail-pg1-f195.google.com with SMTP id k25so8645498pgt.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 11:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y0L/6Kcm1GJKcnyPUoPeqUBC5pfceEUnD+q3JyvYAEE=;
        b=A4YVAjQsjO9yS+bZ2p+xPTeFVjMqzAsB1haQHadcdWHedJzXAM6Cy6GYdTg9jS3xnB
         ySSsVnvIo3WyNXb2ttDB6HFq9twxR0X1qjmFtg3RD7vTf9F6+BmwIevAFElHrDLqQ9zD
         XJeHYsPAqifBydAE1iUwj2tew8zcqf9Tb6fQ1BK+RW5saqvk6Qn10yqHoTfOJoq3AhwL
         kVt9GKUZtqLY0kkYedefoKWmKule6N33eUfBZqT4RAEA0HyRUewDbdGrqbskFoSCsdIJ
         MDhHHYM2naLrVzRoZgTt6iOlsGD7mahhutqDgKBq9uusoCVsCClu9Dw5oX4UgOWPyDne
         Hbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y0L/6Kcm1GJKcnyPUoPeqUBC5pfceEUnD+q3JyvYAEE=;
        b=oOJIHHVv9OLgEzOqZ6TT8CESUUrODynSnCVEH2SnAP4gd/SwKlErPovfTPmOB642yH
         lmKvEd47J+qw4ipni3+KTKa0cuhzLkRopCySgbb/hH0AV+iP/sJxoh6k6ME/cLRE4IYq
         izLKjctj15X8N98DsJz9A8jx7OKL4kl3SOvRtHqGYpZrwwJxRILb67/2vEi30MghPV7X
         QBOs8nbFhbu2STAodzuESN2N3iQTpFc82AUAYNQ3flIDDrvtIqD1enJHB4L3El5vyTbD
         BzOoGG8sJhN5dsSd8DLjoKXCga0WQ4HFojNXHTGh2pZItG48KTxyowrAQVrtGFcy5YiC
         ad2A==
X-Gm-Message-State: APjAAAUiqucowvLci2TyPHusVnQpdl6p4GBU1Z6A5o+Jq7l8go5arrLQ
        XSA5UjmYRtVwN6XlRMAokvHkdw==
X-Google-Smtp-Source: APXvYqxONnTtCwwnSki0/OOTTRl5EWXhbKn6I/OQTaLOzJ8xq81wDXDeIljZnF/OQciErxJzcjfMiA==
X-Received: by 2002:a63:5442:: with SMTP id e2mr33667216pgm.18.1579115988269;
        Wed, 15 Jan 2020 11:19:48 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a10sm21968793pgm.81.2020.01.15.11.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 11:19:47 -0800 (PST)
Date:   Wed, 15 Jan 2020 11:19:45 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, ath10k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 0/2] ath10k: Enable QDSS clock on sm8150
Message-ID: <20200115191945.GM1214176@minitux>
References: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
 <87zhevsrwk.fsf@codeaurora.org>
 <87r201xf8p.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r201xf8p.fsf@kamboji.qca.qualcomm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 15 Jan 01:04 PST 2020, Kalle Valo wrote:

> Kalle Valo <kvalo@codeaurora.org> writes:
> 
> > Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> >
> >> On SM8150 the WiFi firmware depends on the QDSS clock ticking, or the system
> >> will reset due to an NoC error. So this adds an optional clock to the ath10k
> >> binding and makes sure it's enabled while the WiFi firmware needs it.
> >>
> >> Bjorn Andersson (2):
> >>   ath10k: Add optional qdss clk
> >>   arm64: dts: qcom: sm8150: Specify qdss clock for wifi
> >>
> >>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 2 +-
> >>  arch/arm64/boot/dts/qcom/sm8150.dtsi                          | 4 ++--
> >>  drivers/net/wireless/ath/ath10k/snoc.c                        | 2 +-
> >>  3 files changed, 4 insertions(+), 4 deletions(-)
> >
> > Via which tree are these supposed to go? I'll take patch 1 and arm
> > mantainers take patch 2, or what?

That sounds good (you take the ath10k and we'll take the dts).

> 
> No reply, so I'm planning to take patch 1. Please holler if I
> misunderstood.
> 

Sorry.

Regards,
Bjorn
