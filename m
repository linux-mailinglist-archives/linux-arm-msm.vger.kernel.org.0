Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 557FE55AE46
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 04:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbiFZCvD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 22:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233777AbiFZCvD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 22:51:03 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4B211A3D
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 19:51:00 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-101e1a33fe3so8810363fac.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 19:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FWO45eIYFBQmwmscjEO8obu5eF0m7SDwa2uDfj2lCtQ=;
        b=kNeXyQ+bY7oXYtqNCldU5st/KY8gDUnZellzOC74iz6rmOFKtz4QADeBtJLwUwzJxw
         Vonxli42R0/RnTOoU8eKazgrYfCEFM1qQjVhoc22sjmUlHn+dq57JA12zw3TIxYMZZeR
         3MoEy3E0WaJuBXHdEN6Pr4Ah6PqpISRRWEc34afLT/AuotYzFL83UD+6Z9v1jq45XrX0
         jbVut31AyYORTHW+30MS7JcPky2ksQhw+2AA3JC8qf6zZxcHzFKdlNgxUvOLF8vEUfC8
         LsrfN7j6qSVW28T2LODeOAKn2WOHbDDb32MY+oPsveBT8te16B4yXDw0d1er71lZClWc
         oLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FWO45eIYFBQmwmscjEO8obu5eF0m7SDwa2uDfj2lCtQ=;
        b=o7Qgjc+gjFFhUjuxEpmcbsJ8SP+0vYKuxhWPdzRk7v2fgzAjpwji5lWLSHlBbh/Z17
         LwfvI8dPq2ZTid7mlCAtvLB55+zS3jQtBScb9qZX+IXh0rAJw9WWV/J26S5dP5O4Crzz
         altKrOtWxFayBLAwBlK2FoF53lKx3V+6FtD/thHpVpPWwOHrP8UkhkYPaWpU05mA3gCj
         dt23uU9VJb38dxISq9ogcqUlLbXl+Tz/wgZjOmD8+ITiTYw+1i40GPBNUwXL/HL4fEe1
         P5QLWPegoxl8d88H5N2fKXBbsmRorxNdQXRkeNc8o39Om2t1YaWQgHXdrKwUuNT77YXW
         slZQ==
X-Gm-Message-State: AJIora8ddAfP/SQ9zYtK+8naIPoecpROIhO2kdQ1H1cK3PilA0xMaqc0
        OUNGEUP0OZtn8nOEwUjOAIs+Vg==
X-Google-Smtp-Source: AGRyM1tAYBW3863GYNQjAozn1ppqNTY1kF4OWUYjYm5F61IMBqhsJcDqOoSxpX4dFnVRkb6IZ8Y8QA==
X-Received: by 2002:a05:6870:4390:b0:101:ce58:7f53 with SMTP id r16-20020a056870439000b00101ce587f53mr6945293oah.8.1656211859902;
        Sat, 25 Jun 2022 19:50:59 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l4-20020a056820030400b0041b87a7a654sm3866487ooe.37.2022.06.25.19.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 19:50:59 -0700 (PDT)
Date:   Sat, 25 Jun 2022 21:50:57 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v3 0/3] Add dtsi for sc7280 herobrine boards that using rt5682
 codec
Message-ID: <YrfJkQYFCsxPpUzi@builder.lan>
References: <20220525014308.1853576-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525014308.1853576-1-judyhsiao@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 24 May 20:43 CDT 2022, Judy Hsiao wrote:

> Put sound node and lpass_cpu node settings for boards that use rt5682
> codec in the sc7280-herobrine-audio-rt5682.dtsi as there are different
> choices of headset codec for herobrine projects. Common audio setting
> for the internal speaker is in sc7280-herobrine.dtsi.
> 
> This series depends on:
> "Add lpass pin control support for audio on sc7280 based targets" [1]
> "Add soundcard support for sc7280 based platforms" [2]
> 
> [1]
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=638776

Afaict this is applied.

> [2]
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=643589
> 

But [2] doesn't compile and hence this series doesn't compile.

Can you please submit a single series with all the audio dts patches you
want me to apply, where it's possible to run "make dtbs" after every
single patch in the series.

Thanks,
Bjorn

> 
> Changes Since V2:
>     -- Add bias-disable for i2s ws line.
>     -- Fix typo in the commit message.
> 
> Changes Since V1:
>     -- Remove sound-dai-cells in sound node.
>     -- Add dependency list.
>     -- Update patch subject.
> 
> Judy Hsiao (3):
>   arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
>   arm64: dts: qcom: sc7280: Add sc7280-herobrine-audio-rt5682.dtsi
>   arm64: dts: qcom: sc7280: include sc7280-herobrine-audio-rt5682.dtsi
>     in villager and herobrine-r1
> 
>  .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 121 ++++++++++++++++++
>  .../qcom/sc7280-herobrine-herobrine-r1.dts    |   1 +
>  .../dts/qcom/sc7280-herobrine-villager-r0.dts |   1 +
>  .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |  15 +++
>  4 files changed, 138 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> 
> -- 
> 2.36.1.124.g0e6072fb45-goog
> 
