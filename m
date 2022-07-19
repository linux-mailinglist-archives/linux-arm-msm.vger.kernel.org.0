Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1AC578EA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 02:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235114AbiGSABB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 20:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234262AbiGSABA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 20:01:00 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A2FE56
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 17:00:59 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-10bf634bc50so28201493fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 17:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1FnYzVMiek+SlAzgVB4w6TNdP3JBRcRzdvMKcgUPF7Y=;
        b=CYO0h1QjLiXX58sLhGBr/WMWfMcMp7XUUC3E71/2erVeeB3PEq7HzlgPmXcaqDqqB9
         27ouDs23+xD+E8CseNTLTteZtqNesuoef3yokyaex7SFQUy/+Dii5yvhMciK+YE+k8Pr
         zbD9yvwhtXUhPUHRUBQCpHSAXaRUDOaDjnwwrckZGwt6sZZaKeFkQd2vJErDX737FA7l
         0W6zLgGJIGAAdqG8ifYHsCFwNoxM9nCb6+q+R5L2yfGMeaysgoWQrHRfe2v2Di6beOwO
         Ga1tP6bc+mipfETjtiJ9SffLSCQVuXYfWfa5ya0QhVjyifEt/e1o+GaZW5Ih7haT2P/U
         Ve3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1FnYzVMiek+SlAzgVB4w6TNdP3JBRcRzdvMKcgUPF7Y=;
        b=hAQ+yO6BFNblLI6zB66rk6Nq7xQf9VPxNHVA1tq5qGoWSzN1Y91JaV3qrmZBDafzwY
         HuadDED6LCepqopC2F9Gk20KDSaaD11/XsqIBu6cFgUhyj2vx+g5M6n3goH1pY548WnB
         a+FA4ndaiMr6P6/2/aX6zMcrM/oQAFrGHGrF+CMf09M8YyD6oXtCDf0Ui4SoHWoLa82V
         kKKjYEdQTuSbWXDltN6slg9Aowk33s/t4vSWY2ZBwU08ZTFwt654W+HpZJ1s4TZ3/xw6
         nTOeWMtbiwvGS1La430vqXYNnahza4KWxdxt/+5gLQD08RFWVSegqq+C/JLMW+Ogmm99
         6RuA==
X-Gm-Message-State: AJIora+s9exdqENeOs1hWu46URXsb673BZnhMeLhfhQ0rMUSX9ilfzWt
        0jM9op5Y/u04zJRlS+NUpKoOqSEKHo2cZw==
X-Google-Smtp-Source: AGRyM1s8zLIArx9kCVPBZrk37/t/2i6H01CV57jyxV4+CuXkMf6keiVbJTEX2CdHL/jrA5GmrZa2IQ==
X-Received: by 2002:a05:6808:d4f:b0:339:afb0:ccce with SMTP id w15-20020a0568080d4f00b00339afb0cccemr14400991oik.53.1658188858777;
        Mon, 18 Jul 2022 17:00:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z15-20020a056808064f00b0033a422b39b4sm4480419oih.49.2022.07.18.17.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 17:00:58 -0700 (PDT)
Date:   Mon, 18 Jul 2022 19:00:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, quic_mkrishn@quicinc.com,
        quic_kalyant@quicinc.coml, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dta: qcom: sc7280: delete vdda-1p2 and
 vdda-0p9 from both dp and edp
Message-ID: <YtX0OP2EprFRJ/wx@builder.lan>
References: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 Jul 11:23 CDT 2022, Kuogee Hsieh wrote:

Please double check that the subject prefix matches existing changes
next time.

Thanks,
Bjorn

> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 --
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi     | 3 ---
>  2 files changed, 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index ed800817..3f8996c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -435,8 +435,6 @@ ap_i2c_tpm: &i2c14 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&dp_hot_plug_det>;
>  	data-lanes = <0 1>;
> -	vdda-1p2-supply = <&vdd_a_usbssdp_0_1p2>;
> -	vdda-0p9-supply = <&vdd_a_usbssdp_0_core>;
>  };
>  
>  &mdss_mdp {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> index 4c25ffc..7adf31b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> @@ -311,9 +311,6 @@
>  
>  /* NOTE: Not all Qcards have eDP connector stuffed */
>  &mdss_edp {
> -	vdda-0p9-supply = <&vdd_a_edp_0_0p9>;
> -	vdda-1p2-supply = <&vdd_a_edp_0_1p2>;
> -
>  	aux-bus {
>  		edp_panel: panel {
>  			compatible = "edp-panel";
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
