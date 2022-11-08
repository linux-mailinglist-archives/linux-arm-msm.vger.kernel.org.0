Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C91796219A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 17:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbiKHQlm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 11:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233472AbiKHQlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 11:41:40 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4769528B9
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 08:41:39 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id k2so40160697ejr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 08:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O2Ws9Qx69GuD1J9J9bmsI82Gf3KYLXPK5jGr7y6CVC4=;
        b=VALpYz56XXVunOxbSeS184Gb3GWoGIO0NvdwMmt4TbW2If0Yr5HY1eyLJ1rJSxVb5D
         zw/A2a/LhqueQSmD37NaaOlRNFez3SbH1Ca0cG5pjDq67X0vV6xnwl8k65n/U3exReM2
         2O5uiZxjcc1kz5FhU8CmntwfP11xhwHSiY72c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2Ws9Qx69GuD1J9J9bmsI82Gf3KYLXPK5jGr7y6CVC4=;
        b=FoM7EMD5CUTghzzhlYrArCw1u2CayPzGMgKQjIFCcgdX/oWSnxBTiktgTXG2QS1cRh
         9iMOxMnyMVqlPGZhcc8P8/T/H08M6Het2VjPxPSIcB1QbsaJvslGDCqwTc5v21cBF5wI
         eumCB8jRCCX/66bb0g7tZa6jf21EsOMi4WyZChU/Kl49ypo9fK9zjgTlZDtkMLIUN/jg
         8iJphAQW7dHIe9l/194pat+rIZXHnAHNnGo9eVItS4HtGQI7+bcKVTTKuV2Q+jNPxyma
         mbPTKaKGVme/+iENs34JFXv/nZQK6YSsaYU0wv3H4dZGZm24pi2s3n765kIQQCG8Du6W
         QH/g==
X-Gm-Message-State: ACrzQf2vtEMv4NclMx6hsVT4f3gyBMgH7zqwW2BcZT14egevR3XLxwle
        eLmeeOJXLr07XdKqR/cbgyrbVHsguww2V3IK
X-Google-Smtp-Source: AMsMyM7Ksu2GTyLYYx44F1BdUQGJgX0ZdLoBWIyw/XX1U0w80G692ZQSk3FwPcJmm1XC1yzFgWCsRA==
X-Received: by 2002:a17:907:a46:b0:782:1c1c:8141 with SMTP id be6-20020a1709070a4600b007821c1c8141mr55041941ejc.549.1667925698078;
        Tue, 08 Nov 2022 08:41:38 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id n20-20020aa7c794000000b00459012e5145sm5715512eds.70.2022.11.08.08.41.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 08:41:35 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so9441775wmg.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 08:41:33 -0800 (PST)
X-Received: by 2002:a1c:4c16:0:b0:3cf:6f1a:9038 with SMTP id
 z22-20020a1c4c16000000b003cf6f1a9038mr34826018wmf.151.1667925693341; Tue, 08
 Nov 2022 08:41:33 -0800 (PST)
MIME-Version: 1.0
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-14-bryan.odonoghue@linaro.org> <CAD=FV=XZ79JjmCW7wYoc0eEhMsAtqxb+p40x2f4mH+kdb0byow@mail.gmail.com>
 <7a0c6afd-e757-46f6-5837-576070e966ec@linaro.org>
In-Reply-To: <7a0c6afd-e757-46f6-5837-576070e966ec@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 8 Nov 2022 08:41:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Up7yFEG_5JRBOOzpeQWBhXhoceWszO7G91zJKOUDSMpQ@mail.gmail.com>
Message-ID: <CAD=FV=Up7yFEG_5JRBOOzpeQWBhXhoceWszO7G91zJKOUDSMpQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] arm64: dts: qcom: sc7180: Add compat qcom,mdss-dsi-ctrl-sc7180
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 8, 2022 at 4:16 AM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 08/11/2022 00:24, Doug Anderson wrote:
> > This seems fine, but I don't think it matches your bindings. Your
> > bindings says you can have one compatible string. It could be
> > "qcom,mdss-dsi-ctrl-sc7180" or it could be "qcom,mdss-dsi-ctrl".
> > ...but your device tree has two compatible strings: the SoC specific
> > one and the fallback one. You need to change your bindings to make
> > this work.
>
> With the update in this series the binding has a required const.
>
> If you drop back to just "qcom,mdss-dsi-ctrl-sc7180" you get a warning
> like this.
>
> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: dsi@ae94000:
> compatible: ['qcom,mdss-dsi-ctrl-sc7180'] is too short
>
> If you just have 'qcom,mdss-dsi-ctrl' you get
>
> arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: dsi@ae94000:
> compatible:0: 'qcom,mdss-dsi-ctrl' is not one of
> ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl-apq8064',
> 'qcom,mdss-dsi-ctrl-msm8916', 'qcom,mdss-dsi-ctrl-msm8974',
> 'qcom,mdss-dsi-ctrl-msm8996', 'qcom,mdss-dsi-ctrl-sc7180',
> 'qcom,mdss-dsi-ctrl-sc7280', 'qcom,mdss-dsi-ctrl-sdm630',
> 'qcom,mdss-dsi-ctrl-sdm660', 'qcom,mdss-dsi-ctrl-sdm845',
> 'qcom,mdss-dsi-ctrl-sm8250']

Huh. I must have missed something then. Ah, I see the problem. Since
you didn't CC me on the bindings change I searched myself. I found
patch #7 in your series ("dt-bindings: msm: dsi-controller-main: Add
compatible strings for every current SoC"). In that patch everything
is flat. I didn't notice patch #8 in your series which changes this. I
would just get the compatibles right the right time. Looking at patch
#8 I see that Dmitry already suggested this.

So that means this is fine with me. A slight nit that I suspect Bjorn
would prefer you to blow past the 80 column limit and put both
compatibles on one line, but it's not huge in my mind.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
