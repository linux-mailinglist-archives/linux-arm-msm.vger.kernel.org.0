Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753A32D6BC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 00:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393125AbgLJXSs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 18:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391943AbgLJXSR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 18:18:17 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DDAC061282
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 14:35:12 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id d2so5542305pfq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 14:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=wAy9QWmSbAjP+1vzLoCprV0JhS6b3tOG3oKCIiePlHY=;
        b=XoppR/t/VsHPixKkpY66yhU1MxaWjuDNxJNdhQnrk/nxTkfsAhaW3JhJt81/Ot9As2
         zilGS/RGnAisEXNhWUIjdpLIYuVEqe4HKXpstyCJVhqHpKc8B6Ziox6EDo4MNLVJiDJ/
         ut7zdSeJiDNd5LIpYZOXcteDS1idKVeUsbgMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=wAy9QWmSbAjP+1vzLoCprV0JhS6b3tOG3oKCIiePlHY=;
        b=er3s5U/e5enEVJL1QN5Bc6eweiCXp0KkFzKTL5FQP0Q673fhIoNFa8BKVkOMrcyFe/
         cVSFftBUGAOrQqnh6wTzbt1+OxYC9o2vK360KxAnLhdDUDqOw1rjAFSTGdxiiQBK4PWj
         ZYgInWWz4l8v4Imoljlr+l2X1yyApjUUgUlz1OwJH55RSwYZoVk1oSPXg/v/qD6BUhFC
         Eu0/iLrA4Zcn7hrpMpGyYDSEfSJ3ziFt9h4x9P58LRjLUzjhDCm0DwEI6LgoWGFMiM6D
         uM5NZA7wfNj58FA8KWwCqImd7pBnl4O98QnSjfZpKt33tvxARap5m37jQcDeurK8fNvQ
         6uvA==
X-Gm-Message-State: AOAM531u1rV3G4EHmEnPLj2pT0Vvv2REdORtcetmg6jyB5qciPI/Ix4t
        +upbTLC3QILc+85JNarmhRwkVvDembttpA==
X-Google-Smtp-Source: ABdhPJyCchftowUz5XPIXXQ53pvevHKPmlYhW+5uT6/c1SRldRP+CzB/QN4Ty5ZkR8Vnub1SqvrbGA==
X-Received: by 2002:a63:2406:: with SMTP id k6mr8556983pgk.453.1607637438657;
        Thu, 10 Dec 2020 13:57:18 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id u124sm7831835pfb.171.2020.12.10.13.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:57:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201210132745.v3.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
References: <20201210132745.v3.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
Subject: Re: [PATCH v3] mmc: sdhci-msm: Warn about overclocking SD/MMC
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     vbadigan@codeaurora.org, Taniya Das <tdas@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
To:     Adrian Hunter <adrian.hunter@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 10 Dec 2020 13:57:16 -0800
Message-ID: <160763743676.1580929.8043645391758481751@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-12-10 13:27:52)
> As talked about in commit 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use
> floor ops for sdcc clks"), most clocks handled by the Qualcomm clock
> drivers are rounded _up_ by default instead of down.  We should make
> sure SD/MMC clocks are always rounded down in the clock drivers.
> Let's add a warning in the Qualcomm SDHCI driver to help catch the
> problem.
>=20
> This would have saved a bunch of time [1].
>=20
> [1] http://lore.kernel.org/r/20201210102234.1.I096779f219625148900fc984dd=
0084ed1ba87c7f@changeid
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
