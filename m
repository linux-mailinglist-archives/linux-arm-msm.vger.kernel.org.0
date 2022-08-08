Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEE058C4B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Aug 2022 10:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242136AbiHHIKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Aug 2022 04:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242030AbiHHIKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Aug 2022 04:10:40 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCE41115C
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Aug 2022 01:10:38 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id f28so7483454pfk.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Aug 2022 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=61wTd6iB1lutkPoWBA+yNb5GJiX4LQ0YZJHDvzEfwJo=;
        b=rYf8fWuSN/mCGpRIDR8FhDoVZlKtDJhkYAdROcl+ijtu5VN5vqTbOkZjPrVMf53rBi
         ul4xuoXnAnwGC3tG+B1tgq1xqO09Ku/8U6W5mxyEc0w4kQfJ5CvE1qXCH7vCDUnFh5JV
         u/GaONj0Ji6aVghQWWK3hK/iD2oerRnBt5Y/kKZr3nUlgVb8CSOkFyeNDtfMKR9QV5fj
         DUZJdY5wUdhTIoZRChlmjDMU7aWZILR8bnv8lBoxFuu9qebl7/nicPEEauKAURUbEXTh
         BYQTzw7BCZkFzoasBXZpzJ6seOYy+Tr8D+MUQZTgIsl8/cTP4ynXniJth6hVrCv0Tgii
         x78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=61wTd6iB1lutkPoWBA+yNb5GJiX4LQ0YZJHDvzEfwJo=;
        b=mbOdPBPme2fuWOBkb3748RJAwF0UDRja2xkqBD/jkJkA/Qb4Fekb7OANwZmZBbebAB
         9hHW61Ur5G0RMpV7oZiofiNeD0IoaE+i+pgye8TEz88bPr+o7F8YCmQLmnCUisbC9pDU
         l/lOHOIaurF2LNBbCFfrWWEFORrVEN0ejTSaPoISFyRBRPP3z7GJVQrd1nKSSiN/FQLY
         FGTEuFcHBvHgizrY9kRGZUjyjh5g1Z99+aZu7hNsRHaS2yGFkFFWtvySECGoBIj66zao
         TzhRdIwqYn4+Ldl5DdVxVmn7TEpqoRzaWii7Zmdix1oyPne/tww48yyldMhLRSyCjkTw
         TJPQ==
X-Gm-Message-State: ACgBeo1ZrtNZot7n/5GI2z0yXkoFCp79gTkDDxBk5ESwxDu4vhRo3ASM
        0tfRqbwO0lLcOyWUkWq9lZLj
X-Google-Smtp-Source: AA6agR7erfXbt9N0hJC1f6BSSrFufGw7URJVj+V609D1DFTG1vKqT9PN+25+gpi+NpxGg3Eu6DkF6Q==
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id d10-20020a656b8a000000b003db7dc5fec2mr14133518pgw.223.1659946237660;
        Mon, 08 Aug 2022 01:10:37 -0700 (PDT)
Received: from thinkpad ([117.193.212.254])
        by smtp.gmail.com with ESMTPSA id bd15-20020a656e0f000000b0041d2966a0cdsm4303833pgb.23.2022.08.08.01.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 01:10:37 -0700 (PDT)
Date:   Mon, 8 Aug 2022 13:40:31 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sc8280xp: disallow regulator mode
 switches
Message-ID: <20220808081031.GC7601@thinkpad>
References: <20220803121942.30236-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220803121942.30236-1-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 03, 2022 at 02:19:39PM +0200, Johan Hovold wrote:
> A recent change in a USB/DP PHY driver that started specifying regulator
> loads caused the regulators that were also shared with the PCIe and USB
> PHYs to be put in low-power mode, something which broke PCIe and USB on
> sa8295p-adp.
> 
> As was discussed in the following thread:
> 
> 	https://lore.kernel.org/all/YtkrDcjTGhpaU1e0@hovoldconsulting.com
> 
> regulators should generally not be allowed to switch to low-power mode
> unless some of the consumers can actually support an idle mode.
> 
> This series disables mode-switching for all regulators on sc8280xp-crd,
> sc8280xp-lenovo-thinkpad-x13s and sa8295p-adp except for the ones used
> by the UFS controllers which do support an idle mode.
> 

For the series,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Johan
> 
> 
> Johan Hovold (3):
>   arm64: dts: qcom: sc8280xp-crd: disallow regulator mode switches
>   arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: disallow regulator
>     mode switches
>   arm64: dts: qcom: sa8295p-adp: disallow regulator mode switches
> 
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts              | 11 -----------
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts             |  9 ---------
>  .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts   | 10 ----------
>  3 files changed, 30 deletions(-)
> 
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
