Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27D32C7E2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 07:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgK3GVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 01:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgK3GVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 01:21:46 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C855C0613D2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Nov 2020 22:21:06 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id y7so9729114pfq.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Nov 2020 22:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tJt3eN48isJilaS1ahARMF9GPFqfU0k4n50AceeXDAw=;
        b=wW+2tGVErsweFt+fZEph8cmeFwpim2d4BByDlcLfO4dN+uPkH637cYHksoqfrgSleH
         zW0tE/fQ/amRVA/xp52KCELkP0uXpyQOsUyufXYtFDGbCKcBH2q0lCU0GTBPgLXe0ZiP
         e3LPiibpLcLMAMyjaJGbfqlc/pVFDJCtIpmpHOnW3eSd9zW3RYD9QWVe+Vscx4/+NkhQ
         aTSpDfXGT3YGZZ1S2A3uoY2+RhI2seTPrLJt+7uII/YH2P7eI0HZaRQ+N8gqaF/NfMMw
         BZJ1U1qxxC1aHYzT+a3IJQHQGFnwcifSxBS7MED07zS0hOO7UwejYgyOVgkOtfgDKJV3
         /1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tJt3eN48isJilaS1ahARMF9GPFqfU0k4n50AceeXDAw=;
        b=UEFUl7+xc7tcY8mckcAjn22rePpr7YdiVlmxCQzaZDFBvySV0e82Hwu1ls5CCaOuHd
         DvVEEPwlwQQE7kSrGFx/vKOt+myXMry1Fg1SpjArYz1uNc53aZX80v38+PXeAUNVGkF6
         Jtbn+doLr6ston/dvmu3KwegEeTgSS/FiAej8lZW6/WeM2fU/ymlL7YZ14Z7clLET5cV
         Q4jhObfHfA1UtW3sSm3h45Qm72wBeQHuxhlyIHDMbOqSDt6qcvg2lln4tDdJLKzF1izj
         pvYJhh2Dhbq871r9rCm2cq35+2Umd370UpJ3zzKfTQon+SYmH3el2nepb49n1ZzPQ4HO
         GgwQ==
X-Gm-Message-State: AOAM533PjxDOMkhRuTne1gGNraUryh0db8YglwbmifjdL6LWUJNK/xN8
        Ro8zGBYHqM/H1syVYqOVyDNJ8g==
X-Google-Smtp-Source: ABdhPJzJv3njLVM85xPP/sDPlG5OCeIEuWGjYboKMdtuxHH6YzpB0WEbgWXFIjxRONNYVQlOSl1kjw==
X-Received: by 2002:a05:6a00:16c4:b029:198:a95:a2ef with SMTP id l4-20020a056a0016c4b02901980a95a2efmr17357326pfc.43.1606717265948;
        Sun, 29 Nov 2020 22:21:05 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id o198sm14830393pfg.102.2020.11.29.22.21.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Nov 2020 22:21:05 -0800 (PST)
Date:   Mon, 30 Nov 2020 14:20:58 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: c630: Expose LID events
Message-ID: <20201130062057.GC28578@dragon>
References: <20201125060838.165576-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125060838.165576-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 25, 2020 at 12:08:38AM -0600, Bjorn Andersson wrote:
> The LID state can be read from GPIO 124 and the "tablet mode" from GPIO
> 95, expose these to the system using gpio-keys and mark the falling edge
> of the LID state as a wakeup-source - to wake the system from suspend.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
