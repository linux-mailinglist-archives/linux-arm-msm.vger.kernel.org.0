Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 695B25B79CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 20:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbiIMSjB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 14:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbiIMSim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 14:38:42 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328DA861F9
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 11:06:11 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id b23so10160005iof.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=77FonqM53LfQxAH/lSsML9UriTZo3C2heemkDoBv2+Y=;
        b=K9GmwXYL6L8QQ1ZZjfTLdy7TN1xVQSu+7uvNl4kVWC4Hk80q/1mz6am7bivxuvJplW
         iHtHyerJ81Q8hQePa4rM05iavCLz4sxDy7ZuEoiP4ynRiQuOADgnfI8AYG7+/AEhYIuw
         Wb7yws+1GUtQTZtBN6+sqdlc/Z+WQykeSvCRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=77FonqM53LfQxAH/lSsML9UriTZo3C2heemkDoBv2+Y=;
        b=N0cWNlmpo0xKQLmiJLRFoMm9pA5WUhOlrn2S5WRq1/rRkNvIxEjEFGB5U+5XeEHyPK
         AaW7OztsD6MBwcqXmtKQNJ0KmyGKAP3Oo9VEqNIBGtNFOOeHD4HMhJVhOVKJ6geJ5YaQ
         dUGf1WszNp9gDBYIYnqB7kECF0xs6NKzYE+WuS23r2HVQp8CJAKyZhfmBzodSa6Xf1Yx
         CeB0RlzEkpx1kMdwXVVfHcIk1WR65sQp3ztBuUH6CMJdPnojeuDa/0meVWsCfQ8RB3BX
         mMNARBNHodbnZ9cGcGRnvyfR+b1mKz1Hn18OcFNe7Wq+2eoVcpQmxSac1yu/gR5RSCVa
         0MNQ==
X-Gm-Message-State: ACgBeo0UxPhsmK7FcBhVKaT4VQ/ODj15kyGucZJmt3EVQ2BWWabJIHMd
        p9j5hP6ojx6lJ/ms4ZLrVokh+w==
X-Google-Smtp-Source: AA6agR6FBYfAYlMWAJ6EWA+uPxcxOEQoxSMiMeNKQDTpmmFIR8/I9Rfzp17fCsoMEGuFBly2oSIWEQ==
X-Received: by 2002:a6b:6913:0:b0:6a0:eeaa:8d2d with SMTP id e19-20020a6b6913000000b006a0eeaa8d2dmr6809670ioc.92.1663092370648;
        Tue, 13 Sep 2022 11:06:10 -0700 (PDT)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id d4-20020a0566022be400b006a102cb4900sm5263853ioy.39.2022.09.13.11.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 11:06:09 -0700 (PDT)
Date:   Tue, 13 Sep 2022 18:06:09 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, cychiang@google.com, judyhsiao@google.com,
        tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v3 3/3] arm64: dts: qcom: sc7280: include
 sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1
Message-ID: <YyDGkaYtUQIGftgG@google.com>
References: <20220525014308.1853576-1-judyhsiao@chromium.org>
 <20220525014308.1853576-4-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220525014308.1853576-4-judyhsiao@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Judy,

this patch needs a re-spin to fix a conflict after

Add new board revision and LTE SKUs for sc7280-villager family
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=663014

landed.

Thanks

Matthias

On Wed, May 25, 2022 at 01:43:08AM +0000, Judy Hsiao wrote:
> Include sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1 as
> these boards use rt5682 codec.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 1 +
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts  | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
> index b69ca09d9bfb..f68d28f8701b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
> @@ -8,6 +8,7 @@
>  /dts-v1/;
>  
>  #include "sc7280-herobrine.dtsi"
> +#include "sc7280-herobrine-audio-rt5682.dtsi"
>  
>  / {
>  	model = "Google Herobrine (rev1+)";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
> index d3d6ffad4eff..7a4acd3b9ee3 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
> @@ -8,6 +8,7 @@
>  /dts-v1/;
>  
>  #include "sc7280-herobrine.dtsi"
> +#include "sc7280-herobrine-audio-rt5682.dtsi"
>  
>  / {
>  	model = "Google Villager (rev0+)";
