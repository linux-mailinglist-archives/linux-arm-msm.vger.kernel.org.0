Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C12077E2D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 15:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233514AbjHPNlF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 09:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245700AbjHPNkt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 09:40:49 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3512D61
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 06:40:41 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d63c0a6568fso6290715276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 06:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692193241; x=1692798041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uW3Lzg0G0ukvtpwGKKg+qtuDKg0FVtuflLIlmeo8bN8=;
        b=oZpRJpvRd2EjO2z7st8fP82ZF0z+F8XMZd6CEC4Akp0AyW5oLcP3COxI0/dxXXj0aC
         uGuH/7R26eGcSkIsGoB0PF3OB0kC8lThxICjpcwL1Yc/TZLHnqMlwtpJR3Bw+wxYyuaH
         sXS8SdL5TZstYI3btQdzsTD+ez6/futektEUaHEpD6u2fiQ7f9J4zGkH6a2b/z7ojrdR
         ZE8GIE4fYhyH1IBcFN509pvt6IXev1j4uWirb08syYFzBuASjzXVsNFxfvPXNkAm5RNs
         41eKbZ9m8SV5BTQDUDgSdVz8214YRA9W5+SNwtu2F65ggOFE0GkDUfFuZVwnrp6cTcnn
         gOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193241; x=1692798041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uW3Lzg0G0ukvtpwGKKg+qtuDKg0FVtuflLIlmeo8bN8=;
        b=GmCJ0snawL1BFedoEXwSaSHyzFZviOd+MrdbIVplJHIVexDZsR1POxGDbYEMQhelF5
         ijAmtLDxwQyCauZ7jKWvhHCHdk+g2yjCVETx3D3So/S7ddk343YogTo2Qsxr/1BYvgbF
         W4GPTR5hsRyb9xShsTYBoJBrjHI5c/h7EMFu5ONLVJ4AG8U15kDM1b/MS27t1dizQSVC
         ZrC98KFkRlcfWb4WnBpFgVn8WL99OU74L1NsK/LcvbM/6k3+Wnjppm1Q1zxfkO2ORlxS
         UYsTMwMl/Y2t/KyZe6L1Bb8WgVnLoISDkclGzN5v6rHYQ+K7Ui+HAPev9qezP6140Yr4
         huhA==
X-Gm-Message-State: AOJu0YwUy9QFGXBRQ5Sndzrb8uvNsVRtQKqqxT9zONOY6rpRK1xn+3Rf
        svRbZf7BAmZab7+yrZ0s3wmcacmKVT3/nb/mBUHgqw==
X-Google-Smtp-Source: AGHT+IFNL56vtxDQRoreDk45OGBhvFCcV6wVgeoLWkPDigEeck6H4HmGis5nHvN0MbHwyvDBAYyT59QoiBLg/FrsP3Q=
X-Received: by 2002:a25:d4cb:0:b0:d4c:f456:d563 with SMTP id
 m194-20020a25d4cb000000b00d4cf456d563mr1825605ybf.8.1692193240831; Wed, 16
 Aug 2023 06:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <1692192264-18515-1-git-send-email-quic_krichai@quicinc.com> <1692192264-18515-3-git-send-email-quic_krichai@quicinc.com>
In-Reply-To: <1692192264-18515-3-git-send-email-quic_krichai@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 16 Aug 2023 16:40:28 +0300
Message-ID: <CAA8EJpoi0BkuQZef=v3JxB-axXe+jB0bEWCmsk1ZJYiaWiuevw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8450: Add opp table support to PCIe
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc:     manivannan.sadhasivam@linaro.org, helgaas@kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
        quic_ramkri@quicinc.com, quic_parass@quicinc.com,
        krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 16 Aug 2023 at 16:25, Krishna chaitanya chundru
<quic_krichai@quicinc.com> wrote:
>
> PCIe needs to choose the appropriate performance state of RPMH power
> domain based upon the PCIe gen speed.
>
> So let's add the OPP table support to specify RPMH performance states.
>
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 47 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 595533a..c77a683 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -1803,7 +1803,28 @@
>                         pinctrl-names = "default";
>                         pinctrl-0 = <&pcie0_default_state>;
>
> +                       operating-points-v2 = <&pcie0_opp_table>;
> +
>                         status = "disabled";
> +
> +                       pcie0_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-2500000 {

As a random suggestion: these frequencies are calculated by the
driver. It might be easier to use opp-level for the PCIe generation
instead.

This way this OPP entry can become:

opp-1 {
    opp-level = <1>;
    required-opps = <&rpmhpd_opp_low_svs>;
};

> +                                       opp-hz = /bits/ 64 <2500000>;
> +                                       required-opps = <&rpmhpd_opp_low_svs>;
> +                               };
> +
> +                               opp-5000000 {
> +                                       opp-hz = /bits/ 64 <5000000>;
> +                                       required-opps = <&rpmhpd_opp_low_svs>;
> +                               };
> +
> +                               opp-8000000 {
> +                                       opp-hz = /bits/ 64 <8000000>;
> +                                       required-opps = <&rpmhpd_opp_nom>;
> +                               };
> +                       };
>                 };
>
>                 pcie0_phy: phy@1c06000 {
> @@ -1915,7 +1936,33 @@
>                         pinctrl-names = "default";
>                         pinctrl-0 = <&pcie1_default_state>;
>
> +                       operating-points-v2 = <&pcie1_opp_table>;
> +
>                         status = "disabled";
> +
> +                       pcie1_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-2500000 {
> +                                       opp-hz = /bits/ 64 <2500000>;
> +                                       required-opps = <&rpmhpd_opp_low_svs>;
> +                               };
> +
> +                               opp-5000000 {
> +                                       opp-hz = /bits/ 64 <5000000>;
> +                                       required-opps = <&rpmhpd_opp_low_svs>;
> +                               };
> +
> +                               opp-8000000 {
> +                                       opp-hz = /bits/ 64 <8000000>;
> +                                       required-opps = <&rpmhpd_opp_low_svs>;
> +                               };
> +
> +                               opp-16000000 {
> +                                       opp-hz = /bits/ 64 <16000000>;
> +                                       required-opps = <&rpmhpd_opp_nom>;
> +                               };
> +                       };
>                 };
>
>                 pcie1_phy: phy@1c0f000 {
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
