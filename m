Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13CB36246CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 17:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbiKJQWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 11:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiKJQWf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 11:22:35 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096261A076
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 08:22:35 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id v17so3835526edc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 08:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l2zQjV69cVqfMg9UmNwS5DMRljPslOxp55HiAK4Gclg=;
        b=Lu4vI/oqFw0QnjtBCApP5VmT5fxeRK8EHWRX6ExQxVOG3595l2etuZETq5ZKLkgChJ
         lIm54cezWKfRNes/WNG0LM0hvm3PbpjK9WwMHnvUR7UA56wy0MGf3gc0kUJZNNmclmvA
         Zwr9wVYAA41rykOFiBh4azDpzhzl2U7ZPRgB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2zQjV69cVqfMg9UmNwS5DMRljPslOxp55HiAK4Gclg=;
        b=CaJhay70m9swTpBVwNrQRLY9AfkYmTwU8lkntHZKpodYLjgF/+LW7CHcq7MBxYvmmi
         PdPF3zirQRwCGrN+itJBcDNXf8wb/KlzwJcnJWcfMcGU/WR/aLa1we1a62CXVReF3hvq
         MvMSIn+f2jleZkMHEjqahRGlr8f5+kUg0HbQSdeeHXV0x5PjfowMy9RdcDUJbwPnxqsJ
         TLUe34yJRKdXmGBwfB7ZxK6d+mzs6w8MjmofGzHcVUVDxIXMT4YSIZ2TTfSoF6aD1hJ9
         rF4R5qsmdWXTwsKE8e6QsxWsdUhBlQkZoNpCIPEp8UrvOm/B8chL1JjHVkRk8kQSzNR/
         cM9w==
X-Gm-Message-State: ACrzQf2cZbP+AoKHjI5YrWCclbNByplvvb62PAdo9xTWE1NurvuBV5K2
        EU/P9y5v/28+SUy7WHu1TMMslwm8KgRx4bCv
X-Google-Smtp-Source: AMsMyM69ZvJSiZxthEQKn11dFqKrk/uvTfBpsEsczJlwG6+j5FFfCOnvfnXeVjRmIRJA8Z85MBHkVA==
X-Received: by 2002:aa7:d858:0:b0:463:12ed:3f86 with SMTP id f24-20020aa7d858000000b0046312ed3f86mr59215139eds.281.1668097353208;
        Thu, 10 Nov 2022 08:22:33 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id cq27-20020a056402221b00b00461aca1c7b6sm25844edb.6.2022.11.10.08.22.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 08:22:32 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id l14so3031581wrw.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 08:22:19 -0800 (PST)
X-Received: by 2002:adf:d1ec:0:b0:236:880f:2adf with SMTP id
 g12-20020adfd1ec000000b00236880f2adfmr42499149wrd.617.1668097333487; Thu, 10
 Nov 2022 08:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20221110070813.1777-1-quic_sibis@quicinc.com>
In-Reply-To: <20221110070813.1777-1-quic_sibis@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Nov 2022 08:22:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vb54LpX7P7qJt4TNHVv13muaR0Me9SYskOg5N8ZN9RkA@mail.gmail.com>
Message-ID: <CAD=FV=Vb54LpX7P7qJt4TNHVv13muaR0Me9SYskOg5N8ZN9RkA@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] arm64: dts: qcom: sc7280: Mark all Qualcomm
 reference boards as LTE
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     andersson@kernel.org, jinghung.chen3@hotmail.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Nov 9, 2022 at 11:08 PM Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> When the modem node was re-located to a separate LTE source file
> "sc7280-herobrine-lte-sku.dtsi", some of the previous LTE users
> weren't marked appropriately. Fix this by marking all Qualcomm
> reference devices as LTE.
>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Fixes: d42fae738f3a ("arm64: dts: qcom: Add LTE SKUs for sc7280-villager family")
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>
> v4:
>  * Remove duplicate lte source file [Doug]
>
> v3:
>  * Fix incorrect tag usage [Krzysztof]
>
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts  | 1 -
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
