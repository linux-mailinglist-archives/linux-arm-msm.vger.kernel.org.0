Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 915251CC97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 18:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfENQL6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 May 2019 12:11:58 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37391 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbfENQLz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 May 2019 12:11:55 -0400
Received: by mail-lf1-f67.google.com with SMTP id q17so1834356lfo.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2019 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PFgQt6BW2pIoMsM0lCcv9vdjEyov9kr04yFP2mWeZfM=;
        b=YmXRWFM7VxahkVGZN3+5ZvbjiZ09JClcYGdbAQxSqxO449WgZ2BzdVLc3XU/4bvo3V
         dWnluPTo2V6V2ArC6gmUMDcJADsW4Y4/P6s+uNNXudme6j/TUkNjmDHo3qg5KMnOVipK
         epTijDwOTpV7gwKUW/w8mGmR/mgxMYoMdNS20QjcmgD6ONOuw3iWrR/NLoH/6lpJsPzl
         awDuQp4UU5IQsPMgD63VYMBDwVNqWM6qoiLUBwRAZnwNzUIRj1FhdMJ8znml+RUoL/iy
         /03cpZXc+liWkKM7CZMbC8f8belR2Xa4+ptHQA+VSFF5j5VxdMRCefmlGbNNeM13grD+
         8lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PFgQt6BW2pIoMsM0lCcv9vdjEyov9kr04yFP2mWeZfM=;
        b=agtRzv39Wsx7otBnCskrH6GEtSMO2+G8yKEKmgkAn9fcj/mBDvOgq/q9TnqPNYczzL
         FjWOOVgcV5KQfBBGUc2QE3oLBaP+ProVt0nHKUx/5Jc5L0VolEWfgmsvVtMI/I59ahq5
         njEOIPd54j4GMd5qXXTzz9lIe/RLieMWKyoUVwk6aFMysgN0V8rEZx3G0hMfhRY9dFGL
         /ummbR2WpaS/1YPI6Zsx29WnZewIYojfmpZ8WF1ZV9NcemK4ekWOGijw7uo+xNuMTUkU
         Xb8Tte4iHqjFecKyRgBrt2Fobx0V3WcwJjI3nz1AMQ0K5rm1DHoxYoHfRg66MAmIC5Rd
         FMQw==
X-Gm-Message-State: APjAAAVHBser5sb4Z7jkkMqQkS2BxVrh0dfrhAJiafIFSrdcTIumZXFu
        Ce0sFKkb4IepB/s5Yy/Q4tR5lSYQ6+c=
X-Google-Smtp-Source: APXvYqxUGvPXQ7Qq4tpSwPhp8W3XwJW8r6LU07ubRPD8vQNCN8xqRM53UxJbMv4Q7yRTfB+GMmwtag==
X-Received: by 2002:ac2:4899:: with SMTP id x25mr13100139lfc.44.1557850314156;
        Tue, 14 May 2019 09:11:54 -0700 (PDT)
Received: from centauri.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id s26sm3588430ljj.52.2019.05.14.09.11.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 09:11:53 -0700 (PDT)
Date:   Tue, 14 May 2019 18:11:51 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCHv1 0/8] qcom: Add cpuidle to some platforms
Message-ID: <CAHYWTt3LAmT4=a9=e6Y_bP1okH0-3zM4i64p0ot+8chDG-DLhg@mail.gmail.com>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 10, 2019 at 04:59:38PM +0530, Amit Kucheria wrote:
> Fix up a few entry-method="psci" issues and then add cpuidle low power
> states for msm8996, msm8998, qcs404, sdm845. All these have been tested
> to only make sure that the C-states are entered from Linux point-of-view.
>
> We will continue to add more states and make power measurements to tweak
> some of these numbers, but getting these merged will allow other people to
> use these platforms to work on cpuidle, eas and related topics.

Hello Amit,

Your subject looks a bit weird:
[PATCHv1 0/8] qcom: Add cpuidle to some platforms

No need to specify reroll count if it is the first version,
and there is usually a space between PATCH and reroll count.

git format-patch [(--reroll-count|-v) <n>]
it should take care of this for you.

Please also add all that is on either to: or cc: in any patch in the series as
cc: for the cover letter.


Kind regards,
Niklas


>
>
> Amit Kucheria (6):
>   arm64: dts: Fix various entry-method properties to reflect
>     documentation
>   Documentation: arm: Link idle-states binding to code
>   arm64: dts: qcom: msm8916: Add entry-method property for the
>     idle-states node
>   arm64: dts: qcom: msm8916: Use more generic idle state names
>   arm64: dts: qcom: msm8996: Add PSCI cpuidle low power states
>   arm64: dts: qcom: msm8998: Add PSCI cpuidle low power states
>
> Niklas Cassel (1):
>   arm64: dts: qcom: qcs404: Add PSCI cpuidle low power states
>
> Raju P.L.S.S.S.N (1):
>   arm64: dts: qcom: sdm845: Add PSCI cpuidle low power states
>
>  .../devicetree/bindings/arm/idle-states.txt   |  7 +++
>  .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  2 +-
>  arch/arm64/boot/dts/qcom/msm8916.dtsi         | 13 ++--
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         | 28 +++++++++
>  arch/arm64/boot/dts/qcom/msm8998.dtsi         | 32 ++++++++++
>  arch/arm64/boot/dts/qcom/qcs404.dtsi          | 18 ++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 62 +++++++++++++++++++
>  7 files changed, 156 insertions(+), 6 deletions(-)
>
> --
> 2.17.1
>
