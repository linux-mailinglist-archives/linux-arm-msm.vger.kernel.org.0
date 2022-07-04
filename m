Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74801564FB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 10:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232832AbiGDIYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 04:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbiGDIYo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 04:24:44 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E53DAE7A
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 01:24:43 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id c15so10216168ljr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 01:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=p+S7IEqIFlGrwa9ha1rZwMS5b6Ko76QLTxmtMVng+o0=;
        b=ET+svROc0kRSBzsphN6lV+fiE99qUBRkFDTdfQO8popcIesv5Sg5ruBoiqhcu2K6x8
         7RKPAfdKNDDR0QBG3UFkyYBFzGMR4gyYSBS8rLl8QSPKD6kwm4UrI59FRhshhrJWxmOC
         Skajcl0T6FHCms5N0tWvuvOsaLt2g1W2cZfeW0wT6we3EZH7rdVD/rF0rQ2Y2Xkuuedo
         lOcZECTBAqV5TmwjAFVll7F31xOIefzV1eauOHjAYIG30RcMTC+b94ibArX4H0OQD4Xa
         VA7RPkaxttRDbYD7J4Gko17dOpW01h1mlXtLBzqrlETjHD+NrF1nyNIIM589QTqmTDPz
         xLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p+S7IEqIFlGrwa9ha1rZwMS5b6Ko76QLTxmtMVng+o0=;
        b=YyN35kngnYFOFnkLZv2p9vtz2eIjr0NUBQNx+sruHbP+WIpYtxoDMAmbADobam/yul
         illYzUJMLBUI5astaQrhftOjHXQ0bzwoFQUeq2onWW2AaMg+thLJawUIAXcNOvqqra9J
         u6MWpdtZTXk+rS35QHVoLhTXDNGoLgt5k9EgVPRl50WAPFGsNfFGrS1fawPDCv1E/Z6b
         zibxDRi9dmdR8iYeYIExPxCWFJ8Fc0ESiZSi31DdP2VhBudKKBAJ1WxCsefadaKlI9pi
         +/P5JJQ5GYH6rinuJZWtH6N+Jy9dWeSxgPF56n9uuGUvxiLwiWTGeiU347Dt757L6p5t
         vNpg==
X-Gm-Message-State: AJIora8Ekimmjt+Gwquy9+PLkUMB3G3xE4LOzLl0R7bP/0makyiZdZQC
        w4mmFdbKIixRuNbnFW652A6rkt3nYEbMvRbu
X-Google-Smtp-Source: AGRyM1tyR7hKl8KZrPk+PELfyl2ZxvulEyV/1280+7zmPSsgQfJMHv8ixxyf6H9rdpKYCTQ+OoNo4w==
X-Received: by 2002:a2e:8795:0:b0:25a:926c:e45a with SMTP id n21-20020a2e8795000000b0025a926ce45amr16058386lji.438.1656923081757;
        Mon, 04 Jul 2022 01:24:41 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id f4-20020a056512092400b0047fb0d5e049sm5038102lft.273.2022.07.04.01.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 01:24:41 -0700 (PDT)
Message-ID: <f7026a86-175f-67fd-2bae-2efaae966a13@linaro.org>
Date:   Mon, 4 Jul 2022 10:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add missing aggre0,
 aggre1 clocks
Content-Language: en-US
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        helgaas@kernel.org
Cc:     linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        quic_vbadigan@quicinc.com, quic_hemantk@quicinc.com,
        quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
        quic_ramkri@quicinc.com, manivannan.sadhasivam@linaro.org,
        swboyd@chromium.org, dmitry.baryshkov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <1656062391-14567-1-git-send-email-quic_krichai@quicinc.com>
 <1656691899-21315-1-git-send-email-quic_krichai@quicinc.com>
 <1656691899-21315-4-git-send-email-quic_krichai@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1656691899-21315-4-git-send-email-quic_krichai@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/07/2022 18:11, Krishna chaitanya chundru wrote:
> Add missing aggre0, aggre1 clocks to pcie node.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index e66fc67..a5ce095 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2043,6 +2043,8 @@
>  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
>  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>  				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_CENTER_SF_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>,
>  				 <&gcc GCC_DDRSS_PCIE_SF_CLK>;


Still no.

Please respond to comments first.

Best regards,
Krzysztof
