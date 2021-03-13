Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E58B33A1BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 23:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbhCMWmG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 17:42:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233219AbhCMWl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 17:41:58 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92117C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 14:41:58 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so12850404pjg.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 14:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=lPGZyZSN3cvc2AXmn01ONhM8UWAaY37UnRKkI2tZg7U=;
        b=ZisgLC94xRi1JAIKks676jkLRFFNEOm48rgcpcPneDZJuEa9KL50KmfHgeJchDrMqa
         rA75lAx/boIHw7ShULiQQAJr3yNYHqxJELaIidHz45mwDCDgCZxV6fSWNXeSh9Omsp3D
         0UsHamBfmPzbLTMJ/H7ftqB4h2CiXn/byNFkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=lPGZyZSN3cvc2AXmn01ONhM8UWAaY37UnRKkI2tZg7U=;
        b=rdyeeEKNCVJlYTnpfxinoy0su4L+RcQ1yemiMggh4VzrVpDpWA+98DP0NrvZeDI9/k
         0Ejxa0RXX4lsPEDhayhcmKSsymmcGzuEl7C9VrgPgGZ2401cT2G/LV1dK9H0YKWF4XNm
         lFYrGgj6+sgTrFIJxAVG8vDxBIjGGJ6owFSkOZVpHS1QA6pyOY4Hf8b1bUgaJfxJ7Lrx
         0A16hFr5a/OIkqwYe265DCUM+/SY9zj2zm+fcq+VEvJAaDsiFMUvZLmpblUUFJ/M8HT7
         qhtYdI1VA4W2qtGM/SARaxlkkzbsMAdcRjV+3PcMAmi9/L032YTJvh+fxeJd3n10V3Z3
         1wtg==
X-Gm-Message-State: AOAM532URPo++UQn74wT7VZ9qtIgtpC3G6B/df8jDVBQiJpaxbiWKumo
        JWJZWj2efhF/DF2O2i+ndfcZgw==
X-Google-Smtp-Source: ABdhPJyIJH4g13m0PoUF3rDDX0NoC5zNlMx6+ipxE/XBZV/wBxn0iXDaWXM3KQ/ZIEj8C5Q8WX6Gtg==
X-Received: by 2002:a17:90a:de90:: with SMTP id n16mr5535769pjv.10.1615675318195;
        Sat, 13 Mar 2021 14:41:58 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e859:c7d5:7d7b:5ed8])
        by smtp.gmail.com with ESMTPSA id c24sm8648314pfi.193.2021.03.13.14.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 14:41:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1614950952-13351-4-git-send-email-mkrishn@codeaurora.org>
References: <1614950952-13351-1-git-send-email-mkrishn@codeaurora.org> <1614950952-13351-4-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v13 4/4] dt-bindings: msm/dp: Add bindings of MSM DisplayPort controller
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org, Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Sat, 13 Mar 2021 14:41:56 -0800
Message-ID: <161567531621.1478170.4771514732839720956@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-03-05 05:29:12)
> Add bindings for Snapdragon DisplayPort controller driver.
>=20
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>=20
> Changes in V2:
> -Provide details about sel-gpio
>=20
> Changes in V4:
> -Provide details about max dp lanes
> -Change the commit text
>=20
> Changes in V5:
> -moved dp.txt to yaml file
>=20
> Changes in v6:
> - Squash all AUX LUT properties into one pattern Property
> - Make aux-cfg[0-9]-settings properties optional
> - Remove PLL/PHY bindings from DP controller dts
> - Add DP clocks description
> - Remove _clk suffix from clock names
> - Rename pixel clock to stream_pixel
> - Remove redundant bindings (GPIO, PHY, HDCP clock, etc..)
> - Fix indentation
> - Add Display Port as interface of DPU in DPU bindings
>   and add port mapping accordingly.
>=20
> Chages in v7:
> - Add dp-controller.yaml file common between multiple SOC
> - Rename dp-sc7180.yaml to dp-controller-sc7180.yaml
> - change compatible string and add SOC name to it.
> - Remove Root clock generator for pixel clock
> - Add assigned-clocks and assigned-clock-parents bindings
> - Remove redundant properties, descriptions and blank lines
> - Add DP port in DPU bindings
> - Update depends-on tag in commit message and rebase change accordingly
>=20
> Changes in v8:
> - Add MDSS AHB clock in bindings
>=20
> Changes in v9:
> - Remove redundant reg-name property
> - Change assigned-clocks and assigned-clocks-parents counts to 2
> - Use IRQ flags in example dts
>=20
> Changes in v10:
> - Change title of this patch as it does not contain PLL bindings anymore
> - Remove redundant properties
> - Remove use of IRQ flag
> - Fix ports property
>=20
> Changes in v11:
> - add ports required of both #address-cells and  #size-cells
> - add required operating-points-v2
> - add required #sound-dai-cells
> - add required power-domains
> - update maintainer list
>=20
> Changes in v12:
> - remove soc node from examples (Stephen Boyd)
> - split dpu-sc7180.yaml changes to separate patch (Stephen Boyd)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
