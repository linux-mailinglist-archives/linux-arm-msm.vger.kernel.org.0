Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C48B8577387
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jul 2022 05:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbiGQDEq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 23:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232970AbiGQDEp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 23:04:45 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C291114014
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 20:04:42 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10c0119dd16so15624534fac.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 20:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hpo48E8sj1DuK2c49zytJWXoQg4RRXwX3plQ016SBF8=;
        b=L2c0lxLjMSR6pXr9J9CN5mx5OC2RgUZPavMO5F4XMyTvpRrXKi3dTpKE0/VFJ5mjLK
         OlPeIzxqCRGZoY+k5BLWPKfQuLCJRAFt/jk6gRH9dMeTKsAlBO1DNyf6mjf/XKp2F/gL
         qOPmsTNpPX5OA3bJ42ifPEFBgBMoEtI/vmSkRoDi8oDfvIgzDTbVMeelPwloVkKXJ+hp
         yr7O8pw+v7hbJkDxJwmwtECOnw+wHRhqXjzRGrTx6dKS0GeOSHf8hZssQJYpien5n6H5
         8aa03hDMjRZYKKQR5MQiY70TSvUdb5mqMLjxYCOKwBqkypbAERhwnE0wcC/bB7/pYKs4
         QAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hpo48E8sj1DuK2c49zytJWXoQg4RRXwX3plQ016SBF8=;
        b=jeEkVbWqRa4hLO55j7gcDTs2XYou9IWxmlR5bW3DDYX+IO7xMb+YH9eQp6ZfJrET3C
         Ha5AUxwfgxYA7JsFjDTxf4QkKsu97CdiCdlVItK+MzoH8oPvkWA08irChc6rDLCOn6tu
         8MlLGnl2lJCBi4jXhupagNP7HjYPpas5tvtYHT/pl18xEGALLQyJHw9T6ilpUTxQJaUM
         9POiHE8o1XbVbGxCpK0OUpk+ke95QZx9evTv0x3YetuZBXjCIfp5pIduCRQSXa0Or6R5
         uTbqtI2X3i81Z0WLYy6XjRyp/OJlbIKbLjAlPz59B0OlL+2qzACN84ZqXAHeM3tiW3ZE
         +xew==
X-Gm-Message-State: AJIora+9Wy6LzqPZLLdoDnMcID2zBll09yEcErjIRX3D/HBFQwPj4bxC
        jAOFK9vbAgfujOM2G8B/z3yR1Q==
X-Google-Smtp-Source: AGRyM1vi7sSPETLwZXXm4NqV9z9s8VsFaKMm3xfvdQshZauQuoyl2sneX/Yol14OfG8iVaLDvZbpPA==
X-Received: by 2002:a05:6870:b40c:b0:10b:8a3c:b13d with SMTP id x12-20020a056870b40c00b0010b8a3cb13dmr11838436oap.108.1658027082070;
        Sat, 16 Jul 2022 20:04:42 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k20-20020a056870571400b0010c275b6376sm4479708oap.38.2022.07.16.20.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:04:41 -0700 (PDT)
Date:   Sat, 16 Jul 2022 22:04:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: qcom: add missing hwlock for ipq8064
 dtsi
Message-ID: <YtN8R1eRTccJ+dUn@builder.lan>
References: <20220707102040.1859-1-ansuelsmth@gmail.com>
 <20220707102040.1859-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707102040.1859-2-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 07 Jul 05:20 CDT 2022, Christian Marangi wrote:

> Add missing hwlock for ipq8064 dtsi provided by qcom,sfpb-mutex.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 4b475d98343c..cd1b43e2cab4 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -1224,4 +1224,11 @@ sdcc3: mmc@12180000 {
>  			};
>  		};
>  	};
> +
> +	sfpb_mutex: hwlock@1200600 {

This is an mmio device, so it should live under /soc, so I moved it
there while applying the patch.


But it would be nice if this file followed others and kept all nodes
sorted by address (or name if they don't have an address). Also if
addresses were padded to 8 digits, to make sorting easier.

I would much appreciate if you could find the time to prepare such a
patch.

Thank you,
Bjorn

> +		compatible = "qcom,sfpb-mutex";
> +		reg = <0x01200600 0x100>;
> +
> +		#hwlock-cells = <1>;
> +	};
>  };
> -- 
> 2.36.1
> 
