Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFA54C22EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 05:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbiBXEPj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 23:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiBXEPi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 23:15:38 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F1523A1B6
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 20:15:09 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id x193so1338730oix.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 20:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oelzMdYs7Pg9Rl+pgaKSACJUiLmrAGYDWU5DTT17hyE=;
        b=eBvrEF4bIaUxbwXOylYwWAyMfqd5WxpFN888rypI0aHzRyzqHJJpClWMHbDqYiq+3S
         gvIjnqk2XlHwUhdp4xhab0tlYq+RKMbAbat28UhMlPT1vCs7K2KOXLHTvoqAJ/UMO7Wk
         awIvDgdCepgfaE4G06K7DhXLmO+ye5h7KO5ex2/UwcbUgcjUpGNKwiAvhzioZfce/nUk
         8kA5pwGfbcdnRBTdngd7bn8NQHRPvphn/siWBFLhwVepQ+V4kfjIpXYgWH2194OUowMl
         KYMsciEzFFgyvKgE8jJTP4n/3b0mqGMWuKgQXDIBq6cjPTkORRwh2SFY+U5pZWapi+rB
         Rhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oelzMdYs7Pg9Rl+pgaKSACJUiLmrAGYDWU5DTT17hyE=;
        b=eNAUJakUnVNhj5ssKbfC893upSLZiPh7GU5IZgesRz2EFLT6V+9QPwdBItfN5lOh4I
         GjLUVBG88X+T4FokEd3LaJTazUCXYHqBl/u9sL+RPACqmntQ+5mSJcPDLmNPqqFNcscD
         R1ZrzH2tGUaJ5dosQ+CbexaNTsTvd5/dlzm9RVtdoyGlpohWmdCvTZ1e6/PhaQTiEEi9
         2ZCbWHOFl1qnZwcdqKQu5o8v03DWT6OgDKjlzLLALP4qv+WTz883LQgcal2Wjy++ZFXe
         +W+Zl6gX+07sU2Z0ktTcj0UVuVfKkhYrv0pv/xTpRNg7srSxFteeP4Do3BwUq1kIUMjJ
         t/tA==
X-Gm-Message-State: AOAM531EnmTT6cu1bB9UGmv5CdQEQk3CghEdSKy7RIq7R1o8sluDcfsj
        zgUk61b1yKf/m03cf0Qu7R9Xng==
X-Google-Smtp-Source: ABdhPJxITOuU97vSupZI0i1M4HQ1oAx5B0u8OVQz++lLuC7TEEiYLcj5DHfSpKu+S4RVKBWSymiHcA==
X-Received: by 2002:a05:6808:30a7:b0:2d4:fb78:8ab2 with SMTP id bl39-20020a05680830a700b002d4fb788ab2mr408172oib.325.1645676108821;
        Wed, 23 Feb 2022 20:15:08 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id el40sm992150oab.22.2022.02.23.20.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 20:15:08 -0800 (PST)
Date:   Wed, 23 Feb 2022 22:15:06 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 0/5] Wifi & Bluetooth on LG G Watch R
Message-ID: <YhcGSmd5M3W+fI6c@builder.lan>
References: <20220216212433.1373903-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216212433.1373903-1-luca@z3ntu.xyz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 16 Feb 15:24 CST 2022, Luca Weiss wrote:

> This series adds the BCM43430A0 chip providing Bluetooth & Wifi on the
> LG G Watch R.
> 

I picked the dts changes, but would prefer that the other two changes
goes through the BT tree. I see that you haven't copied Marcel on the
dt-binding change though, so please resubmit those two patches together.

Thanks,
Bjorn

> Luca Weiss (5):
>   dt-bindings: bluetooth: broadcom: add BCM43430A0
>   Bluetooth: hci_bcm: add BCM43430A0
>   ARM: dts: qcom: msm8226: Add pinctrl for sdhci nodes
>   ARM: dts: qcom: apq8026-lg-lenok: Add Wifi
>   ARM: dts: qcom: apq8026-lg-lenok: Add Bluetooth
> 
>  .../bindings/net/broadcom-bluetooth.yaml      |  1 +
>  arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts   | 98 ++++++++++++++++---
>  arch/arm/boot/dts/qcom-msm8226.dtsi           | 57 +++++++++++
>  drivers/bluetooth/hci_bcm.c                   |  1 +
>  4 files changed, 144 insertions(+), 13 deletions(-)
> 
> -- 
> 2.35.1
> 
