Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42EFC5EEFD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 09:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235200AbiI2H73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 03:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235236AbiI2H7Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 03:59:25 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4053F13AF33
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 00:59:22 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-352ffac3941so6683037b3.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 00:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=TleFiMULCLrWLvNlylWhoFkmisHmC2Zdp67g3SAU4jg=;
        b=Exr8y8T89qGAscJtkSSgpHXEf3Ye016uM7i11KffixjmjxKSSKQaSkVNW1vOm05c8D
         SFcTgkKVGQOLmpJm0kKl0ZJJy6wL+cDlw0trr7qIQ/ltsTydqgClVsNzaL56svBk42iw
         kINXtU2yTS/Zy3MwnKjqBq7fFwVKflvKfmun8gKNtJtPCyPq9HTrZc4Vjc67QAoX18Dy
         02Et8f1V6Saz2jS/wiz7teLwryCyCfElvg2bQ90SsiEA2dfmTs9rPN6tzdfaBW9C4DEV
         fUGsmSMcHvTGGdGrsIJJuy/GLDU5jzPcVth98lXruW7Ar7kzNFTf13c3bNfqFWk3dQ5X
         ViTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=TleFiMULCLrWLvNlylWhoFkmisHmC2Zdp67g3SAU4jg=;
        b=hkLB9wyYo8Y3KxWDIs/yHurLtVM/1UmaP90rq46w1Tg1UltI54gEi9551pOYs6DWUk
         rgDQZUjThoEQ+p8X++X7ZrDq9FevfZWf/vqS+LXciD9zD04w11YVaYdj4Vl1YsDpKFbk
         BgWUcHXkmC5BLILi7AQU0w5EpJeoKtE85NkyBlSvOUyZyEeJ+HrQr0kK6aVkHkERQnhL
         m9MV1sHKB/cHqLTxjxLewRmevTl6VTVpv8DU6HCQTmA7JcRu35Y75ZOJnr8yE3rLxus+
         u6iDBjAGFdgYHsEY7xYqaPKNj/9xktTD/jw/+F30lNV3EBBhsG8r0lQz7mvTes8irvyW
         MrPQ==
X-Gm-Message-State: ACrzQf0aDMtrSix7NtnazQuKI5s28oWIZqPI1YfSqO5R4UJbrxQ05o1a
        U8dFF2WxvMzD0BSo6jv81L2vqRFa1C6QeNjMoFPGcg==
X-Google-Smtp-Source: AMsMyM4CWKssnF193igQqTe1mWJqfUNhrbR2AfI4Lg6b8DHTBo/aPgOzoYL5NiaWnFIZ6Im1Gfbr0rS3aIkT7NDyztY=
X-Received: by 2002:a81:8502:0:b0:340:a7fc:ddb2 with SMTP id
 v2-20020a818502000000b00340a7fcddb2mr2003334ywf.378.1664438360917; Thu, 29
 Sep 2022 00:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <1664435628-4011-1-git-send-email-quic_kriskura@quicinc.com>
In-Reply-To: <1664435628-4011-1-git-send-email-quic_kriskura@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 29 Sep 2022 10:59:09 +0300
Message-ID: <CAA8EJpr9pcN-SG-yQNUGEoHCmv74prChprj4f42PKpSAzGzVKQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Update SNPS Phy params for SC7280
To:     Krishna Kurapati <quic_kriskura@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 29 Sept 2022 at 10:14, Krishna Kurapati
<quic_kriskura@quicinc.com> wrote:
>
> Override the SNPS Phy tuning parameters for SC7280 devices. These
> values are common for both trogdor and herobrine variants.

They are common for trogdor and herobrine, but should these parameters
be a default? In other words, a random new device based on sc7280
would more likely use these overrides or the hardware defaults?

>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 2125803..ae2c23e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3310,6 +3310,13 @@
>                         clock-names = "ref";
>
>                         resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
> +
> +                       qcom,hs-rise-fall-time-bp = <0>;
> +                       qcom,squelch-detector-bp = <(-2090)>;
> +                       qcom,hs-disconnect-bp = <1743>;
> +                       qcom,hs-amplitude-bp = <1780>;
> +                       qcom,hs-crossover-voltage-microvolt = <(-31000)>;
> +                       qcom,hs-output-impedance-micro-ohms = <2600000>;
>                 };
>
>                 usb_1_qmpphy: phy-wrapper@88e9000 {
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
