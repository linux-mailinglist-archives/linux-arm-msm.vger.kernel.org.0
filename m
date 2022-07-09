Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE6556C7C3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jul 2022 09:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiGIHua (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jul 2022 03:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiGIHua (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jul 2022 03:50:30 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 413AF3ED5C
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Jul 2022 00:50:26 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id r22so757527pgr.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Jul 2022 00:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yMfpiE9grWAGWTOlyBH6CFYlcFupIx5Mf4UNkVo3g3Q=;
        b=Vlek+yevX1Ayy2RxpRcADiBJMyxptQdotOEAbiPPZlSpAuDRSHZQUbMGvXCdWvXcM6
         61fRPwhNDjGsOirYSsuV7Dh+tpcqvR2/1b46fZOVHspGx6FPFn1ByH6XL6N/O12pCtzl
         U29gdhuN3pZH91DyeHOq9+Zw7KZdK5m6dWo3Igt+THctHV8THGoiqDNb8pD2ynwJ+P5F
         dZglCk7lYAQCTOOnB45nj530SaW6tSlTFVQYlWNG1DmManJhx+UujqKKq/nDR5M29utH
         eRqGwYggXi5E8Gd1vLekFwYj/4kHuZpOJgCCWSF4RUta9HJuqX0ZMSxaj2L91aZaV+EG
         TQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yMfpiE9grWAGWTOlyBH6CFYlcFupIx5Mf4UNkVo3g3Q=;
        b=WqkP4p/+0a+tjwtcj5b8Hkhiz7ezyvAZyUkE4seJWOXsxCMAlX7o+a1X+o66XjkP24
         vtMxrck3+1AeBQ8vy2e1A/kYp7eo5GGn+f3Lez4AASQplBBXdgqj9p+0J/XPC+FKyPEQ
         YuUori2vAZOfNnOblz1wYJwxTqtMzCKM2djS16GIZcbsIH0ZsZlcsCSHYiHczuL53qAA
         gZiCeNKa1Hr8EthTQxmGKeOamsO2nsgMiRGYQispwWgK1sfBxEVEWTRjzhxZGmgFLXeq
         pBHijlpeBKXFBvr90uKgBtk7QhTqKatCU2a0PtezGgLJz0PobLFo7VByX0o19pR/IFGN
         x7LQ==
X-Gm-Message-State: AJIora8+4eCaCfi3cBWKTRCD7Cwt8gflmejyMLn4bEBoIXtvw6bXpUvj
        /U4xwVR4HV8qrA+uxELZ5yed
X-Google-Smtp-Source: AGRyM1vPoOQg2mf4YJs9uorcFuSPAoAm6lnOZgF1aeZHQrjGq3y0Dt/z46mNPVnqVaaQrse1Jbe4Pg==
X-Received: by 2002:a63:de04:0:b0:412:b0b0:88a2 with SMTP id f4-20020a63de04000000b00412b0b088a2mr6474955pgg.585.1657353025697;
        Sat, 09 Jul 2022 00:50:25 -0700 (PDT)
Received: from thinkpad ([117.207.26.140])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902dace00b0015e8d4eb2ddsm703844plx.295.2022.07.09.00.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 00:50:25 -0700 (PDT)
Date:   Sat, 9 Jul 2022 13:20:17 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: PCI: qcom: Fix msi-interrupt
 conditional
Message-ID: <20220709075017.GI5063@thinkpad>
References: <20220629141000.18111-1-johan+linaro@kernel.org>
 <20220629141000.18111-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220629141000.18111-3-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 29, 2022 at 04:09:52PM +0200, Johan Hovold wrote:
> Fix the msi-interrupt conditional which always evaluated to false due to
> a misspelled property name ("compatibles" in plural).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index ed9f9462a758..a1b4fc70e162 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -628,7 +628,7 @@ allOf:
>      # On older chipsets it's always 1 msi interrupt
>    - if:
>        properties:
> -        compatibles:
> +        compatible:
>            contains:
>              enum:
>                - qcom,pcie-msm8996
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
