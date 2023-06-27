Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D71373FCCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 15:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjF0NYX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 09:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjF0NYQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 09:24:16 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E72B294C
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 06:24:14 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-666e3b15370so2810482b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 06:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687872254; x=1690464254;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y02hN0PNekjOd5szuk9Ub9WcGYvupKGth45H8Ct66UY=;
        b=IRjeNnOm4E4Z+pIzRr/Di7z/oSbw5+dbir8tihAqnEil/TvIC7fsGDSw2X/YZLPFqo
         GAZ+hSGoAgUCgnlB3sS5kstebfnK/iSKbUWe2XyxZuYTHbo+mBws+m+EM2MlmTIY54/R
         vgXH2d7Nu6b49+mRnvDN6OPuRyLuPsjHHzLlcDAJuM5yGJ7ud/XMPItYri16GetafB8j
         z6lY4T9sCyHz1GrTJnHsHqMSXi3hHEKLK9nIsJp2cma02Te9I21k24fotjDqzmJ2MdaV
         Qxbr2ZI36ctG3umjd/xKHbol5V7lZMXcKOJE/jiU7a5GG5cLdY2tzR4F9TOeISJiM7tA
         T7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687872254; x=1690464254;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y02hN0PNekjOd5szuk9Ub9WcGYvupKGth45H8Ct66UY=;
        b=K2X6iNsj1I2VGt4EfyvMSlM/ZKYuF9wjwX4ye6dbpAxnbF5w0bzLj9X3pl9iMljW2b
         iCs+lQUKL0Y+RN85Uf6/w+QbdZhUb7gOSmBpqW8i+L6frD+dUgrIqgBWFtN9tGoaQHvX
         fBUF5qRnIzTCXRWPbvm10wJ6gq+BpKWU6hfYswYTpo49zXdQqqV6ky29+rBkfj5pxyip
         ARTt+AZ9Mm1WjcHIbRiQFywycdtGWYgFud9MNbb5/debJ39Fx3ynVhmMPPMlo7E+XQ0a
         S6FO+cR0BKg7mMVFtsFnVKyv+pdUr0rECJKlD1v7SdImwv37eBvTt8RGvOf2IXqPRitA
         cZAg==
X-Gm-Message-State: AC+VfDydtbGogHntq+Ldb1Hd8CASF6F5/dxRrzl+cRWYFpT+pxRWfgEz
        lhc7GMTopBUCEtywvGqIRTZC
X-Google-Smtp-Source: ACHHUZ7Aa5yD/wVIoF86iX7X1j+YPhnUIsDI1+AG6UNtVTQSxUdTQ0x7XC0A3hZK+P5lJoGx4wIP4w==
X-Received: by 2002:a05:6a00:398f:b0:64f:aea5:7b49 with SMTP id fi15-20020a056a00398f00b0064faea57b49mr30320035pfb.17.1687872253752;
        Tue, 27 Jun 2023 06:24:13 -0700 (PDT)
Received: from thinkpad ([117.217.176.90])
        by smtp.gmail.com with ESMTPSA id u23-20020a62ed17000000b00668821499c3sm5416179pfh.156.2023.06.27.06.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 06:24:13 -0700 (PDT)
Date:   Tue, 27 Jun 2023 18:54:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Patrick Wildt <patrick@blueri.se>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-pmics: add explicit rtc
 interrupt parent
Message-ID: <20230627132406.GA5490@thinkpad>
References: <20230627085306.6033-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230627085306.6033-1-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 27, 2023 at 10:53:06AM +0200, Johan Hovold wrote:
> Unless explicitly specified the interrupt-parent property is inherited
> from the parent node on Linux even though this may not be in full
> compliance with the devicetree specification.
> 
> Following commit 2d5cab9232ba ("arm64: dts: qcom: sc8280xp-pmics:
> Specify interrupt parent explicitly"), add an explicit interrupt parent
> also for the PMIC RTC node for the benefit of other operating systems
> which may be confused by this omission.
> 
> Note that any such OS must still implement a fallback to the root
> interrupt domain as most devicetrees are written under the assumption
> that the interrupt parent is inherited.
> 
> Reported-by: Patrick Wildt <patrick@blueri.se>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

It is good to encode this in the binding and fix other such instances.

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
> index a0ba535bb6c9..80ee12ded4f4 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
> @@ -101,7 +101,7 @@ pmk8280_rtc: rtc@6100 {
>  			compatible = "qcom,pmk8350-rtc";
>  			reg = <0x6100>, <0x6200>;
>  			reg-names = "rtc", "alarm";
> -			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
> +			interrupts-extended = <&spmi_bus 0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
>  			wakeup-source;
>  			status = "disabled";
>  		};
> -- 
> 2.39.3
> 

-- 
மணிவண்ணன் சதாசிவம்
