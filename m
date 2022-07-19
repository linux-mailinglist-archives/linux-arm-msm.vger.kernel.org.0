Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E54578EF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 02:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236618AbiGSANB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 20:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236620AbiGSAM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 20:12:58 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D203133E0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 17:12:55 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id g20-20020a9d6a14000000b0061c84e679f5so7916336otn.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 17:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=uQR+n69n3dnYzqYwl3ly3mEn2ZxY8NPwKeE+kxZpS2M=;
        b=fJcui/2VkpHokc0d1YV8OjT923oZ5Oc+KoVy7FjZmyH1L/6cmgxWpbexuOmc0YKmZk
         QDyyZc7KOfterT0xRHhb4S5PTWC2f+MIFb0+d3F3b3jmiii9CDrUVfi8zFGi+DpWYrSi
         LylhOa2dqucibVAMfjQS8IJGOkt8dNfjrC9NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=uQR+n69n3dnYzqYwl3ly3mEn2ZxY8NPwKeE+kxZpS2M=;
        b=D6ET7iBnCAzQWCno3GoMwYKGCegs1/lYwXkyZ4Y9yYwuoi8AndBymje0dPTg73MZJj
         Oug1+GttH9WSMFZDfnmynVk7E4uvUoAgxD5RUO4KiXiY9FKYjbkTzQkVea40FBloPbqF
         aV2eCfmN/1+hfPVsDEjUZsgkRJqfC1s1LnsiCBeGjhMXlW8Fp7sSyxze0Oy8UhIHXoaA
         +11iMO+64nHxFajdF6tR/usdeLRPq1XwLtPbBNNODxlCY2OpAqW9dR2oR5NN8HMZH4PE
         QsQ37rZI0jL1YNbGBCskKTk0XHJdTwtv5IX2WgG/l9R8VuXfcuy7686S0+5k0kyLwtgn
         3pgQ==
X-Gm-Message-State: AJIora/zmTgi7rZ2VzL7LWYxeQb0X0fpSgnsJ3X3wyDDFSv/RotHKj7O
        +JOyAhJRglraGQArXqjmxl2gQTeEVtaqmCaVC0A1fw==
X-Google-Smtp-Source: AGRyM1tj45Y8RF+Rd3jNFk+0LcP8DpTPSuHkSuaqNuMLN/z98asVBWyEOSMFjlQpphhLUMzVXQGKWxbYTin3OQ1opFA=
X-Received: by 2002:a05:6830:2aa0:b0:61c:9501:bb26 with SMTP id
 s32-20020a0568302aa000b0061c9501bb26mr5172172otu.73.1658189575184; Mon, 18
 Jul 2022 17:12:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Jul 2022 20:12:54 -0400
MIME-Version: 1.0
In-Reply-To: <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org> <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 18 Jul 2022 20:12:54 -0400
Message-ID: <CAE-0n53StEjfWrNwmSZ5U-6M-EqEbaXHU+A69a-9-CTxw5GdiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: sc7180: split register block for
 DP controller
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-07-10 01:41:25)
> Follow the schema for the DP controller and declare 5 register regions
> instead of using a single region for all the registers. Note, this
> extends the dts by adding p1 region to the DP node (to be used for DP
> MST).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
