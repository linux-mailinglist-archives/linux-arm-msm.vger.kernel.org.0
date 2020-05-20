Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190301DBC20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 19:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgETR7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 13:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgETR7d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 13:59:33 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33231C061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 10:59:32 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id f4so1788145pgi.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 10:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/VG7JhWId2ggUAJ7+wRERmG2MSvueE8spDk60d1QW5U=;
        b=D1y9kEmRagg+MkBHOCCpJNJssjKuv6p598q1CaQZUkvgjc7ZIuzl7HfeoyDriDdpf5
         XUX858Macf+P23J0DBnD3K3EB6pZl+kLzAnY8pSEGszlAZStoppevWJKHyH8XI6c2Lkl
         pY4LoZaKUgpdyv+oCVW/B14KdWllVyhNSlepCCTInD1fVNR7ArOON/gw7sy5ysf5bxLD
         b7reSqM9I9C1mGAVsW2MCw2G9dZUYauaIZrLSRxO3fMtePQFyExDz+PQuO0YSNow7/zR
         jCvmO25bQ1LLB2IIq2c5jGl9vBpSF3Rw43syAAXdfTV6PHDvgZQYpGJ0+bp92eDgYzPQ
         JUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/VG7JhWId2ggUAJ7+wRERmG2MSvueE8spDk60d1QW5U=;
        b=c+w0j3CbL2wkUyiqNSe73GpldvUpDfDqNG23Qws90pc1LGcVu1O+OHL6ZjdjRkNAqj
         sA4Dtw87BzdQmUxE/ygv2F3YKjcMyQ85rNFAGpzEtN4y4U4n7thbgepk3evYBf0myZvr
         3isrqLfXSG2HMFc5TdCnZ2M4lvXPn2XQA2ulb5yPMXVeNOZfJbIQkcrpw0RW+Q/sYOXR
         I7wi921uiDr5YSyu4/QFCnYmeH1leFZaTEGdqdfATd99eAzGfp5GVy5D5pomrTbzHI2P
         ppG4ZWUo5UOAp02sFbaj7XNF8CqIaqBgrkhiddl58F+q3zp6hCBIIXg3AMCJDFHXiA2Y
         dS9Q==
X-Gm-Message-State: AOAM5320Iz7cINqe+n9Y25Yh9WTd52MhSxdHSe4KNgR1hXnqiC3aE+pE
        sVcw2ajeVuYU8GYiukRIOfyJLk1koMY=
X-Google-Smtp-Source: ABdhPJyLR9x0/4C/6Bal2oDegmfghyP17zolTT91rytHhpCpeg3nWC8M+crqbk74jIh7xZWVPXTlPw==
X-Received: by 2002:a62:3642:: with SMTP id d63mr5499987pfa.222.1589997571579;
        Wed, 20 May 2020 10:59:31 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id n14sm2520666pjh.45.2020.05.20.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 10:59:30 -0700 (PDT)
Date:   Wed, 20 May 2020 11:59:28 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: remoteproc: Add Qualcomm PIL info
 binding
Message-ID: <20200520175928.GA13884@xps15>
References: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
 <20200513055641.1413100-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513055641.1413100-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 12, 2020 at 10:56:37PM -0700, Bjorn Andersson wrote:
> Add a devicetree binding for the Qualcomm peripheral image loader
> relocation information region found in the IMEM.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v4:
> - Fixed reg in example to make it compile
> 
>  .../bindings/remoteproc/qcom,pil-info.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> new file mode 100644
> index 000000000000..87c52316ddbd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,pil-info.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm peripheral image loader relocation info binding
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  The Qualcomm peripheral image loader relocation memory region, in IMEM, is
> +  used for communicating remoteproc relocation information to post mortem
> +  debugging tools.
> +
> +properties:
> +  compatible:
> +    const: qcom,pil-reloc-info
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    imem@146bf000 {
> +      compatible = "syscon", "simple-mfd";
> +      reg = <0x146bf000 0x1000>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      ranges = <0 0x146bf000 0x1000>;
> +
> +      pil-reloc@94c {
> +        compatible = "qcom,pil-reloc-info";
> +        reg = <0x94c 0xc8>;
> +      };
> +    };
> +...
> -- 
> 2.26.2
> 
