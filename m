Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156693DAC7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 22:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbhG2UIR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 16:08:17 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:36637 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232864AbhG2UIK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 16:08:10 -0400
Received: by mail-io1-f52.google.com with SMTP id f11so8663433ioj.3;
        Thu, 29 Jul 2021 13:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QQQE8wWlUIc9jiUxGY8Y8++FTSFD3WIxkiSG4sJyF+s=;
        b=VMK+wiXkziaVR3kieMKtBkkGlCkOIleGhxBBkLA/q34pOi8PpV+lrzJKxCHYCsz3Q3
         kZbjhMyHdegM9r4r3wd29cxQ8VLy2BO58t9NnTk0XdzCYjjm1GKQww0xrwv3L4GZSu9Q
         G96BG+tmANSUJ+g4OpgyjSSVbh+vSeK3XoFYxdi/voQ17SBzvf9a/QohWORxgV7W+k/i
         dW3krsQj0oikDn/3dl0L0h3c7SnKM+uYIk1OBYlsVX7ZpMk0ZLIMR1xf6Atiev0hFeNW
         E5sAupDLv2gnNcg7lt9uK/eFyl7dJfb/kQXMyAWC2JcgxUSankcmqKetkYzakJNxOzBZ
         eehA==
X-Gm-Message-State: AOAM531kH6nNEyaPKAnzIfYZIPy0KEAw3j/vBEpNfadeFLnqgfLJ3GXb
        RIGSP+zbnkQRxtfwuW5qQA==
X-Google-Smtp-Source: ABdhPJzAu+OpfTXKpkGXmhFqSElEoX+tIuPr82w4zZVOYw+Dq5t0e5Zkt4fXkqFXIrPUeahzQCI+Vw==
X-Received: by 2002:a05:6602:584:: with SMTP id v4mr5410517iox.181.1627589286001;
        Thu, 29 Jul 2021 13:08:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p9sm3065255iod.18.2021.07.29.13.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 13:08:04 -0700 (PDT)
Received: (nullmailer pid 798323 invoked by uid 1000);
        Thu, 29 Jul 2021 20:08:02 -0000
Date:   Thu, 29 Jul 2021 14:08:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     quic_vamslank@quicinc.com
Cc:     tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        Mark Brown <broonie@kernel.org>, bjorn.andersson@linaro.org,
        Vinod Koul <vkoul@kernel.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        devicetree@vger.kernel.org, maz@kernel.org, robh+dt@kernel.org,
        Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 6/6] dt-bindings: clock: Introduce pdc bindings for
 SDX65
Message-ID: <YQMKomcbjahYYNgy@robh.at.kernel.org>
References: <cover.1626986805.git.quic_vamslank@quicinc.com>
 <c9ac6fa07e81cb79c1eb8f2760a040eb0c72f0a6.1626986805.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9ac6fa07e81cb79c1eb8f2760a040eb0c72f0a6.1626986805.git.quic_vamslank@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 22 Jul 2021 14:09:43 -0700, quic_vamslank@quicinc.com wrote:
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add compatible for SDX65 pdc.
> 
> To: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Kozlowski <krzk@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
