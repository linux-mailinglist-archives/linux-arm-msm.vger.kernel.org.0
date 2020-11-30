Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552982C80E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 10:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgK3JXm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 04:23:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727011AbgK3JXl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 04:23:41 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EC3C0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:22:55 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id l1so6160681pld.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fTOXN4nxw5TCY//Kufrm2+0NCBKye5gOZMTx2MWbE3Q=;
        b=kPDmDSvmOe1LUwMD057KVz880ZgDeHJqCPM+G3bTMa8feuuA3nShhW6zQkYUBhYeZX
         JuWHwxsm2Bwrn065rczlppAgg4Oms3tqEz/6al/htP+AFGlnbkjqbJhX4rjWDUeyxhcp
         HXaaNBKNpPKAcbYU0rIXRX3aRS4DsoXuyUnHtPUyE3CfhSebYId3GOqTYMEJ+CT2e4M2
         2vrDM0NLwchQ+fz4BlrlSqCTwCW/mhTPqn0SpViKwj8E+PkRNiI9QRUAW11KeUITR6dU
         rIEH79WOr+gZhEv/KUGH82XYJ3yz1s6zf/Nk8y1B7srfv6On72ePR0Qn4zpQJKECuY+l
         ly0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fTOXN4nxw5TCY//Kufrm2+0NCBKye5gOZMTx2MWbE3Q=;
        b=EWJZ3sXeALo4/ruZrFo39My3QEeplnpiEKsrHvd1JtUwNhsY/+nbRO93XpWZh7XoaM
         LSNb/mLPrT6sab2Ell0Mk4YgMxX7KwCMDQP2B2uobntWPdR+vP9zOKQdDZ7IODlJsIEm
         qiO9kyNMkKjuFQEEE792wpUvoPWFNQioepzZXxZHW2cnYNdrIf8d7WWh+VUrFF7aOG+3
         /8TzQU0XzUbQPnfUECtgLfhVbkP0c1f2gPswORW0lOc4raDrIj4S47u5burR7PQ7QCiM
         K1Idll98VaAqJa4VI7YYq1ABKw7twpSE+Q5D6pO5OQkZXp5clzzsVL6ApCE15Sg1DegV
         cgYQ==
X-Gm-Message-State: AOAM53087jxr9GlOUthGQp2N6tecz5Omm2tpLTcMxv7cVgC3oIzTxYRc
        HfuvsHKSQzqr6BJcVzAnCngxhQ==
X-Google-Smtp-Source: ABdhPJxy4D6dNwwXsBZTU0pXZ8cZvZC5SlymPK1fx4G/w4qYP/g6IOG4OO5q+O+OSYXBpLuJN6n7fg==
X-Received: by 2002:a17:90b:a17:: with SMTP id gg23mr7649257pjb.129.1606728175106;
        Mon, 30 Nov 2020 01:22:55 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id t9sm16046133pfq.39.2020.11.30.01.22.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 01:22:54 -0800 (PST)
Date:   Mon, 30 Nov 2020 17:22:48 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: c630: Define eDP bridge and panel
Message-ID: <20201130092247.GA4245@dragon>
References: <20201128034231.89750-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201128034231.89750-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 27, 2020 at 09:42:31PM -0600, Bjorn Andersson wrote:
> The Lenovo Yoga C630 drives the Boe NV133FHM-N61 eDP display from DSI
> using a TI SN65DSI86 bridge chip on I2C 10. Define the bridge and eDP
> panel and enable the display blocks.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
