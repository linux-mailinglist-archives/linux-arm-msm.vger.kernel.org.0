Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56DB351720D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 16:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385610AbiEBPA1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 11:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238740AbiEBPA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 11:00:26 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B020F21C
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 07:56:57 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id e24so12902962pjt.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 07:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=verH8/mpz6QCDlwKGNbcJqvMdsAOgvu97l9yQtyQ0pY=;
        b=fitWuBOs9CqUTP65x8QPc4X5oT9vEFjg9gQrZdM2JN/N0UjMRNIQWt2xg0BD4tsTnH
         We8it+fI5EYsfJ13q0sUHq7mF25NBvvqKq8XMk2cgXNbIgjEn40DpZ84Wz6Pid2AtiDS
         YgstX34sbWEbU3zjzezBuZpRZ/KTQoG8oftlgRtFCHhN2wJHulVgr3TcRySFMO9qNa0K
         y/9ouocdIwB9G6d/TJ1lAf9Mz1IDnjefshbro3dUNG7MhpN1R1or87l3OmW0/JmZY7W2
         kciQ5Gzgu7l/qVBqHNSB9yghjNW5HdmF54z6eXW3C7x2h2kvNbiixZlKbjpuqHQyFR8B
         GyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=verH8/mpz6QCDlwKGNbcJqvMdsAOgvu97l9yQtyQ0pY=;
        b=10+++AMnufmrlWpngo+wep1Oy07FNgmWoQ6KLT5w1mHqT5TOsiamCY6EhCOEMM4zIs
         VxdL3Kb5fjVNTiczfa7pW3kEeZO10Zp/jGFnYFpUzsLuGatXcZ2SGVf8gEUuDaS1cnjz
         0OYXt1CZQ7Dgb3XH93hUXqqt+4lr0bO8ai6/7mZoe1g+OxDTuqUCpQo4Rl0VO0NxAjwi
         aKeWKCu3RFMn01FAGgdzvYTkT1WWeukTuL9oMWat2SKDav+kAku8dNFNF4jft25CzHJM
         rt/TiAQvygu4D7JNsq4KCaF2kXAhEJKEElqFyinZAYG2EpsM8HIIkTyPst37NyB+UD05
         LEWg==
X-Gm-Message-State: AOAM530ORLajvc+/ixB8MVbD+0XSFMI2kGqlih7jwqI5U2XJfmiR/wg1
        K2mvEZMcjw7PnRW+jIZ1vDpUFqTKsdlb
X-Google-Smtp-Source: ABdhPJw19yzuEsng4ULSdZNyfAbdxRV76toBScQVXYohDrX74FQuozLZNW1MnQaXHJxfHEE5uD7e4w==
X-Received: by 2002:a17:902:9b94:b0:156:2c08:14a5 with SMTP id y20-20020a1709029b9400b001562c0814a5mr12037594plp.60.1651503417143;
        Mon, 02 May 2022 07:56:57 -0700 (PDT)
Received: from thinkpad ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id z5-20020a170903018500b0015e8d4eb223sm4797473plg.109.2022.05.02.07.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:56:56 -0700 (PDT)
Date:   Mon, 2 May 2022 20:26:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Kaushal Kumar <quic_kaushalk@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ARM: dts: qcom: sdx65-mtp: Enable QPIC NAND
 support
Message-ID: <20220502145651.GD98313@thinkpad>
References: <1651500878-10244-1-git-send-email-quic_kaushalk@quicinc.com>
 <1651500878-10244-5-git-send-email-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651500878-10244-5-git-send-email-quic_kaushalk@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 02, 2022 at 07:14:38AM -0700, Kaushal Kumar wrote:
> Enable QPIC NAND devicetree node for Qualcomm SDX65-MTP board.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>

One comment below, with that fixed:

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
>  arch/arm/boot/dts/qcom-sdx65-mtp.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> index 153ad2a..b0027c1 100644
> --- a/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> +++ b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> @@ -249,6 +249,21 @@
>  	status = "ok";
>  };
>  
> +&qpic_nand {
> +	status = "ok";
> +

Status should be "okay".

Thanks,
Mani

> +	nand@0 {
> +		reg = <0>;
> +
> +		nand-ecc-strength = <4>;
> +		nand-ecc-step-size = <512>;
> +		nand-bus-width = <8>;
> +		/* ico and efs2 partitions are secured */
> +		secure-regions = /bits/ 64 <0x500000 0x500000
> +					    0xa00000 0xb00000>;
> +	};
> +};
> +
>  &usb {
>  	status = "okay";
>  };
> -- 
> 2.7.4
> 
