Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595B73AE34E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 08:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbhFUGkN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 02:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFUGkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 02:40:13 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4C8C06175F
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jun 2021 23:37:58 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id n12so4599052pgs.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jun 2021 23:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SdHCWHmqfliDzlV9ZOK2KuWxyewxQ9Y5zNRLDj7+lE4=;
        b=MeQZQmVrHod7mNQDewlaXFTyiYmIsl033nKWBNc0WtwaZFVcBU9zVZOqZy8u9gHJKu
         l4K6zCqO0gxwys0LnVTGQTk4X0lxbUyMsKGiLDJ6qblZ7gt30oDurcJhRNv0Rsz8Z5G3
         doIb4NefOV48/SIyjGjbH/N9WAbHXSI7S3SNMYjX2jslF5ICOANAS/59Z/WPEpCc9KSp
         g8Kzf4USuVCkFBC2rHLID0Yr086ZKIH+vA/FQWsXh2klih/RtqedhBXFlnSrquFQA5OC
         izBZxCRArORroI3pYl+qAmcVgEEkdpcn1e1bRvl8W9No73xF02NiOSfV5XaAKKfXVC12
         SpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SdHCWHmqfliDzlV9ZOK2KuWxyewxQ9Y5zNRLDj7+lE4=;
        b=Gm72KOuWMpT/Te4136ODVfYGfzMJkIENHEgczUO40rlrtrYty5qEOQg2NUi0FsODuJ
         fDZyu64FxHVxdsqerU9NkoWy4oYQXz456Iie/JN6tNsM1i4/H3vLOHlTqgl6r/Li2Cc/
         Ksqwvp8QPIDST187WlaX+Q6hN0OsYc1zrbCY385fFHe93d0anwfDW/MRKUSk+Z9hPQm7
         7YhvO2mVf0PUpARhsb8MAGOJr1RDYKjLSAo4nBDQWJqpydWkgJ+5JWozlMG7DZz28i3t
         7C0dwsJNEh6tIojLzkbMQiFOITNd4+yfAa6KlzIxq2vyQsswrLltwllNxmjNI7ZTqYjG
         QPLQ==
X-Gm-Message-State: AOAM53128eUYdAtPSsyRDn9hC83S7YsfLvS4Zl+qkSL5HIbUOMdNrWX8
        tz2EP+ay0XRp+HGCGEUPsMBtfg==
X-Google-Smtp-Source: ABdhPJwMLC4F9jwSAm8Hcb7YBqwOeprhCOojsTRC0R49gO+EaApiBs8Mqs2fYaKHuS709r4a9V6vFQ==
X-Received: by 2002:a62:7b0b:0:b029:301:40a6:9e64 with SMTP id w11-20020a627b0b0000b029030140a69e64mr11326692pfc.33.1624257478203;
        Sun, 20 Jun 2021 23:37:58 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id v6sm16343060pgk.33.2021.06.20.23.37.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Jun 2021 23:37:57 -0700 (PDT)
Date:   Mon, 21 Jun 2021 14:37:52 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/5] Add MSM8939 APCS/A53PLL clock support
Message-ID: <20210621063751.GB8666@dragon>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504052844.21096-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 04, 2021 at 01:28:39PM +0800, Shawn Guo wrote:
> This series adds MSM8939 APCS/A53PLL clock support.  Most outstanding
> thing about MSM8939 is that it integrates 3 APCS instances, for Cluster0
> (little cores), Cluster1 (big cores) and CCI (Cache Coherent Interconnect)
> respectively.
> 
> Note: the first one is a small improvement which is not specific to
> MSM8939 support.
> 
> 
> Shawn Guo (5):
>   clk: qcom: apcs-msm8916: Flag a53mux instead of a53pll as critical
>   dt-bindings: clock: update qcom,a53pll bindings for MSM8939 support
>   clk: qcom: apcs-msm8916: Retrieve clock name from DT
>   clk: qcom: a53-pll: Pass freq_tbl via match data
>   clk: qcom: a53-pll: Add MSM8939 a53pll clocks
> 
>  .../bindings/clock/qcom,a53pll.yaml           | 34 +++++++++++
>  drivers/clk/qcom/a53-pll.c                    | 59 +++++++++++++++++--
>  drivers/clk/qcom/apcs-msm8916.c               |  7 ++-
>  3 files changed, 93 insertions(+), 7 deletions(-)

Hi Stephen,

Did you get a chance to look at the series?

Shawn
