Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0104B1E3374
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 01:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390327AbgEZXIO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 19:08:14 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40072 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389565AbgEZXIO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 19:08:14 -0400
Received: by mail-io1-f67.google.com with SMTP id q8so22542453iow.7;
        Tue, 26 May 2020 16:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=goUKTiNTd28aVhlMgReATZt8At7zsBIhXSxmCg39VVM=;
        b=Q12/AGxlAFb4wwYwjZOYrxxiLAGxJNJf1tyYqH/XvK6VPzXZARS9GVeqw3/k2mUUYL
         zDi/eQVALye4Ww1Jl3nyFnBLAzsHNzF4mqSM6O3tg4DM++1tPHH+7t+GxhMDOaKiYq9i
         A9fJ3d/yEnBbzBoTSJYXirdh+iHEneRBatbDEuNgLN4y2gC1Lv/q/CI32PPXpCfZVKTB
         VKit38RR2HisP9ncmNcHyEL2SBrTEoWNuEdDUC4fr4B61fJe28G9lMXuz8aoZCZ1TvTB
         6E27hNGQ3bGBSzZ3gO9PpjPT1mJAB5SRqDJNSPADba8ot25Udion8pvGvUBalxSUns3e
         Ynhw==
X-Gm-Message-State: AOAM532Yz8HxSpDkTTsUDgrEFTVCty1p7kvM36WfhBW9JikvVjiFS1El
        KnhaQD8ZNt5sHyogI6vK7A==
X-Google-Smtp-Source: ABdhPJzgct455rUcPYuwMbVDYtvAPnamONIEjsrICAgjuK34DaesWzcMgvr4zkS1ezNMWXfBqPnHjg==
X-Received: by 2002:a02:ccb3:: with SMTP id t19mr3326167jap.20.1590534492888;
        Tue, 26 May 2020 16:08:12 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id r9sm666651ilm.10.2020.05.26.16.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 16:08:12 -0700 (PDT)
Received: (nullmailer pid 562221 invoked by uid 1000);
        Tue, 26 May 2020 23:08:11 -0000
Date:   Tue, 26 May 2020 17:08:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 2/8] dt-bindings: clock: add ipq6018 a53 pll compatible
Message-ID: <20200526230811.GA560545@bogus>
References: <1590314686-11749-1-git-send-email-sivaprak@codeaurora.org>
 <1590314686-11749-3-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590314686-11749-3-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 24, 2020 at 03:34:40PM +0530, Sivaprakash Murugesan wrote:
> cpus on ipq6018 are clocked by a53 pll, add device compatible for a53
> pll found on ipq6018 devices.
> 
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
> [V5]
>  * Addressed Bjorn's review comment.
>    now the a53 dt-binding represents ipq a53 pll as well.
>  .../devicetree/bindings/clock/qcom,a53pll.yaml         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
