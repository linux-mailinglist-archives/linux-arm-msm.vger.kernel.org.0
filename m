Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A45024FFC9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 19:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbiDMR2A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 13:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237546AbiDMR1v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 13:27:51 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B913AA75
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 10:25:28 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id c23so2568873plo.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 10:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CfH4hnYZTKDMMLfceQBqDJ1Kg4COwkEciCmvmaOTXik=;
        b=Z0GuslnytN5UVYPRl1aE84EU2zbabfasrf2onFpdaxU5HKo+AmsJJFcyYnF+Ofjdz3
         LKTKbR2Hzao8aj+o52QTtP/H4WySHcDKAZtbUX+/r5U1L1pfVGx+2HY9XbLrb67mo/29
         bWtVpUIgafnEz9CbcTZciiTiszvdChdYpr3gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CfH4hnYZTKDMMLfceQBqDJ1Kg4COwkEciCmvmaOTXik=;
        b=DGKAutopV2A092hI0a5QY7q/h0Nrg/Q2JYj3BQYzg1v/xwqMEU/r8JkV345zhxYldR
         VcS7J84H5saOC0cDsl+BaJxwckXfWxtl82CXBbImpJRcuP3wZIYEYK5NphVa0/iObxCX
         5M+TOb1f1zHiKxPGF4Bd0f0qYaWb9RcJwumX/wI5Zsmt14s+j/lLyzt14AZkRQhbmoxa
         n1btxMYHyxIBn/qxpwNeeF+rXvse/iMuQusEzH8FJMrEdZAPHGVUKCYGqvKgozb+tEws
         qkFMTvEHGmAvlF/woj0OCDopORekWg8jJ0ZQoBSTOcjnpjCNEpB2U5NDpj8uND72KZ6q
         BLog==
X-Gm-Message-State: AOAM531zaP3Q+ui4C/VJ2ktyj7sebJNdQ5/YCUxXh7nJMIaNTcnpme8W
        jz3pJ6L1Vp4+vuM0ySSjmLKlDQ==
X-Google-Smtp-Source: ABdhPJzg20qb9a+Ybr7TF4ypEki2FuEqdvc/xuJbZLJAsHcRCb8z666rTPDEit0AaJ/bngQEhb9v4A==
X-Received: by 2002:a17:902:c3c4:b0:158:85b8:1459 with SMTP id j4-20020a170902c3c400b0015885b81459mr10287875plj.10.1649870728392;
        Wed, 13 Apr 2022 10:25:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6a4f:9277:743f:c648])
        by smtp.gmail.com with UTF8SMTPSA id f19-20020a056a00229300b004fb157f136asm44017370pfe.153.2022.04.13.10.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 10:25:28 -0700 (PDT)
Date:   Wed, 13 Apr 2022 10:25:26 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: sc7280: add lpass lpi pin
 controller node
Message-ID: <YlcHhhFLcryXqxEC@google.com>
References: <1649861047-7811-1-git-send-email-quic_srivasam@quicinc.com>
 <1649861047-7811-3-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1649861047-7811-3-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 13, 2022 at 08:14:07PM +0530, Srinivasa Rao Mandadapu wrote:
> Add LPASS LPI pinctrl node required for Audio functionality on sc7280
> based platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi |  84 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi     | 107 +++++++++++++++++++++++++++++++
>  2 files changed, 191 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 6e6cfeda..50fea0e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1987,6 +1987,113 @@
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		lpass_tlmm: pinctrl@33c0000 {
> +			compatible = "qcom,sc7280-lpass-lpi-pinctrl";
> +			reg = <0 0x033c0000 0x0 0x20000>,
> +				<0 0x03550000 0x0 0x10000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&lpass_tlmm 0 0 15>;
> +
> +			#clock-cells = <1>;
> +
> +			lpass_dmic01: lpass-dmic01 {

For the node names the 'lpass-' prefix is redundant as you remarked
earlier, since they are inside the 'lpass_tlmm' node. It's only useful
for the labels, which can be used in other .dts[i] files where the
context might not be evident.
