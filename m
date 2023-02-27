Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEEB6A42B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 14:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbjB0NdV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 08:33:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbjB0NdG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 08:33:06 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE209035
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 05:32:54 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id p6so5845601plf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 05:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=URqe1dE6GDBSL5K5ua0uDBAeYqEkfW5tE/SYJGuf82k=;
        b=PkMX2eaV/wlZmoA2f7yuF/Ra7MJy1jAaZT4S/fDagDYogeDasuZ3BFjIyRu0zm7x0c
         2pPlxI0hxZWnsTx0RjwaGA8YRdpxI3MuVbxWGbSj6kCUaozZ7yHsXc49l51G2bPAq0gZ
         3zsmdI2q8QB+wy0gUnJ3d7hpjNBiOrkyS3TmF2cWzBiCPXXIqYDsdI+gTTmPl6ZHGDIt
         +AAB29AlsBwcyh3tNtr2cPMf5AtZYPiG5/Eas9Xn620NoZLqldG1SrgORz6PCluTAmrs
         xHSKrMiv9zmATs4ATLXsSFES61Yn9C2DPtwpjNjUzom1QKizcFD4blU0CmQkg3jnvQcK
         mVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URqe1dE6GDBSL5K5ua0uDBAeYqEkfW5tE/SYJGuf82k=;
        b=7R7u7KF3JBZrNhuc92rAFV+YuvgjEeWl649SXYjciaiFZVd7ZSCE57R+Ly7ETT6KXG
         T6TcjaRUoFiwIgcCL1bwRLQC8BUh8//+oIm/MyhGrTwYA8Tzv5Qq+H1cYuxf7owNfZ9Y
         ORzFsM0Mth/QiLV1klKfMQXaXa4p207xaLFv0xtdlE3e05nzhIYHAgZehMm386DvspV0
         F11CRHJWJ9ozcOLNI8TdzlaKdF2xt+hinWZH/mgwEK8/GUUBzWs2jqLjgi8jRZ3zUlwO
         BChtcqP1IprvBxSJt5Tm3oCOxKwyO0TQmVh58yFIrKeLc6UQzKE3J7ZJtuq03rrGLLLD
         M7/w==
X-Gm-Message-State: AO0yUKWgGmBhs4MIBb/hRAo/KOSeWKVcP2Pf0IIfgM1hRYL8/kBY0jGe
        iEfaUVw7f+W+k0bL4lfYZFgR
X-Google-Smtp-Source: AK7set/e+a2DpEFO/UgnY5ozJ1GeqDmYcpR84mWWJJPHxN9/B6VO9HajCRnMjQAz6FOHPiW3MI/LdQ==
X-Received: by 2002:a05:6a20:4b1c:b0:cd:36a3:3beb with SMTP id fp28-20020a056a204b1c00b000cd36a33bebmr3479100pzb.30.1677504774385;
        Mon, 27 Feb 2023 05:32:54 -0800 (PST)
Received: from thinkpad ([117.202.191.60])
        by smtp.gmail.com with ESMTPSA id x26-20020aa784da000000b005a8f1187112sm4239936pfn.58.2023.02.27.05.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 05:32:52 -0800 (PST)
Date:   Mon, 27 Feb 2023 19:02:41 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc:     helgaas@kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, quic_vbadigan@quicinc.com,
        quic_hemantk@quicinc.com, quic_nitegupt@quicinc.com,
        quic_skananth@quicinc.com, quic_ramkri@quicinc.com,
        swboyd@chromium.org, dmitry.baryshkov@linaro.org,
        svarbanov@mm-sol.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, lpieralisi@kernel.org,
        robh@kernel.org, kw@linux.com, bhelgaas@google.com,
        linux-phy@lists.infradead.org, vkoul@kernel.org, kishon@ti.com,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH V1] arm64:dts:qcom:sc7280: mark memory of PCIe as cache
 coherent
Message-ID: <20230227133241.GA3647@thinkpad>
References: <1677490575-29092-1-git-send-email-quic_krichai@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1677490575-29092-1-git-send-email-quic_krichai@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please fix the subject as:

arm64: dts: qcom: sc7280: Mark PCIe controller as cache coherent

On Mon, Feb 27, 2023 at 03:06:15PM +0530, Krishna chaitanya chundru wrote:
> Mark the PCIe node as dma-coherent as the devices on PCIe bus are
> cache coherent.
> 

But this is a bug fix actually. If the controller is not marked as cache
coherent, then kernel will try to ensure coherency during dma-ops and that may
cause data corruption.

So please add fixes tag and CC stable.

Thanks,
Mani

> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index bdcb749..8f4ab6b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2131,6 +2131,8 @@
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pcie1_clkreq_n>;
>  
> +			dma-coherent;
> +
>  			iommus = <&apps_smmu 0x1c80 0x1>;
>  
>  			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
