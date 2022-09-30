Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F1D5F1380
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 22:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbiI3UTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 16:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbiI3UTn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 16:19:43 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDA312A93
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 13:19:40 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id a41so7385379edf.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 13:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=OCnebJynSrbcXhmt2sFtynLekZNoI+ENUjG4/Iv4I8g=;
        b=bxPqEInaZEWWzFT8rVnv4HClcvizZtxYsL1G2Gy7PfaelpNFzp1M3jaeahTlo2RIqU
         q3ouehTqScAN00/Z0FdJ4FzOTaRyVLbR95nVg+8o4s5Ev9iQDr/TerW6WEGAdbZx0dqX
         SlafXHF+VptrzpSSqKu/ergwarlgNwfpQI7SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OCnebJynSrbcXhmt2sFtynLekZNoI+ENUjG4/Iv4I8g=;
        b=jmRtqU/WrQftB4++nO72NZ9Vd0EBZu95chj5ZZkynzX8V9uiuKUqEYrgQ1tBPevXsz
         XsPRZrcJLU11patuEEGSI5IqH2bOMNduo0wckFwD4u1iP9dTt4r3eKcE2w8o26+6omop
         wts97PwetK2FyAI1o/WyjUzMf/p5YtU35MfvDLttE6x+4RNrBg8TJ2COkvGmLLTOkWDW
         vX2GvnsKuX3zDJWpmVMA6dZaSBGl1G/bdpw6vs+ukwcm4gezTODQI7HJvGVmR4OEg+1Y
         oVetqhHSP3Zr7JtUnT8t9b2UhZg2dozP+CZzgdYw11SebsIkSXf6pCTuY/AuyHLk/vn7
         29/Q==
X-Gm-Message-State: ACrzQf1UZeTifSn/r5pnM/eKXB9h0QT5T1Jo4Xct5ZcUV/8S64SrPcy3
        MM5M7repxgHaQxfmAYtH0f+wBx7PDdsHFYfI
X-Google-Smtp-Source: AMsMyM7kbvS9sii5ezjnk118zlkpjIcadoyJjV2EBP2Imay4JBo1r9uzbMrYZSHXsdHVhpHOR4lK4g==
X-Received: by 2002:a05:6402:254f:b0:452:be91:c0d3 with SMTP id l15-20020a056402254f00b00452be91c0d3mr9013244edb.314.1664569178637;
        Fri, 30 Sep 2022 13:19:38 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id g24-20020a056402321800b00458478a4295sm2285533eda.9.2022.09.30.13.19.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 13:19:37 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id s14so8479724wro.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 13:19:36 -0700 (PDT)
X-Received: by 2002:a5d:6c62:0:b0:22a:2f59:cb7d with SMTP id
 r2-20020a5d6c62000000b0022a2f59cb7dmr6839764wrz.405.1664569175910; Fri, 30
 Sep 2022 13:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220930182212.209804-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930182212.209804-1-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 30 Sep 2022 13:19:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WHmGi0yxFNbdQ=BXjypDWkW9iS3jBnr2gUhTa5qch90Q@mail.gmail.com>
Message-ID: <CAD=FV=WHmGi0yxFNbdQ=BXjypDWkW9iS3jBnr2gUhTa5qch90Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm630: fix UART1 pin bias
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "# 4.0+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Sep 30, 2022 at 11:22 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> There is no "bias-no-pull" property.  Assume intentions were disabling
> bias.
>
> Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Not tested on hardware.
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This does change behavior and has the potential to break someone.
Thus, without a bug report or someone to give a tested-by I'm at least
moderately worried about this going to stable@

I would also note that convention on Qualcomm SoCs that I've worked on
was that bias shouldn't be specified in the SoC dtsi file and should
be left to board files. This is talked a bit about in a previous email
thread [1].

That being said, it does look like this was the intention of the
original commit, so thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/lkml/CAD=FV=VUL4GmjaibAMhKNdpEso_Hg_R=XeMaqah1LSj_9-Ce4Q@mail.gmail.com/
