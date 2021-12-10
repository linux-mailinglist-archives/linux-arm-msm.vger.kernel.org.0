Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D4346FCE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Dec 2021 09:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238652AbhLJIqS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 03:46:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235808AbhLJIqS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 03:46:18 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED98C0617A1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 00:42:43 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id k6-20020a17090a7f0600b001ad9d73b20bso6929740pjl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 00:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iL7mOU+kitDPtrRKqArvbH60/+cnDzNjLmcoW2AtGv8=;
        b=Kn+06usMQB33IwA5I8bQKXQS+e/n3AJWpOKKu7uXCu5+USqg9l4zOket+sf3r2UqKB
         QIEGEw+2UzVdbEO3BjUXZOASgbNP6scRJSWJccO6pdgsyZqxxl6j1KRBqD2LbW0btNED
         T30lqDRPQWXhDLRMNx8wWxNyexfx6zAl+sSCnBOgfbAMAXopP/ZXLSKGOonrgKeaClpo
         4G2grqzyj+JMz2MEq8Auz0MnqjyaPjiXrTFqyRsEyKez6jEnNt5aSBcsa68q7TQF6ajH
         z/1c3AvS2FVkmmfaflH9tqKIOm7+gMYYcC6ht+jnkHSv9lbboUiJtxTeGjM/uwba1Plh
         aVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iL7mOU+kitDPtrRKqArvbH60/+cnDzNjLmcoW2AtGv8=;
        b=1dwd5pWUVr1o95Rgp3f/Vj+M/qt2Th/4WIhr7xU6Zdv3Tgrnxndn/wIj+aQGaIuQQb
         oq6KolZJiYC+V7EgJUIuAYChG+ElD4pPpaHcrC7IPoYoevnorCLjqlmmxDeTmMo6Lbyl
         T5d0oSyC9u3fzW+ZCjY2WGXB9pI4KbRn7D/MorSgA9Xtn5qGMPFOHrz78AV4JooEEXPV
         4MB/akUlPPyaxpb0V1R7gBGy5zZONNNE174EUz5NBpGImUSKT2U98A8wSb00eL5Y9Hia
         NoiOf1SSKkOIFl6ZEuljyr3kS5VBowWctJKUQoSOsNuiC+zXlF67qOOEN7Skt/hl6h/Y
         7Pwg==
X-Gm-Message-State: AOAM531xRt5WBGzCkC+5CTldCHFWofBjuNGMS2sSkXGmdagCdv6uhzMQ
        jzMI8b0agCCXipuS0fq9NLIE
X-Google-Smtp-Source: ABdhPJxCkfYuZGgUkkQZ5vdBcYUkq96FOqKrJjrFMUk0zk2eAVuV+BTHqaenlibjF+gjU3sSZDM5JA==
X-Received: by 2002:a17:902:8544:b0:142:66e7:afbb with SMTP id d4-20020a170902854400b0014266e7afbbmr74471786plo.62.1639125763119;
        Fri, 10 Dec 2021 00:42:43 -0800 (PST)
Received: from thinkpad ([202.21.42.75])
        by smtp.gmail.com with ESMTPSA id y11sm2192234pfg.204.2021.12.10.00.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 00:42:42 -0800 (PST)
Date:   Fri, 10 Dec 2021 14:12:36 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 01/10] dt-bindings: pci: qcom: Document PCIe bindings
 for SM8450
Message-ID: <20211210084236.GC1734@thinkpad>
References: <20211208171442.1327689-1-dmitry.baryshkov@linaro.org>
 <20211208171442.1327689-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208171442.1327689-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 08, 2021 at 08:14:33PM +0300, Dmitry Baryshkov wrote:
> Document the PCIe DT bindings for SM8450 SoC.The PCIe IP is similar
> to the one used on SM8250. Add the compatible for SM8450.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Note to self: This binding should be converted to YAML very soon.

Thanks,
Mani

> ---
>  .../devicetree/bindings/pci/qcom,pcie.txt     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> index a0ae024c2d0c..73bc763c5009 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> @@ -15,6 +15,7 @@
>  			- "qcom,pcie-sc8180x" for sc8180x
>  			- "qcom,pcie-sdm845" for sdm845
>  			- "qcom,pcie-sm8250" for sm8250
> +			- "qcom,pcie-sm8450" for sm8450
>  			- "qcom,pcie-ipq6018" for ipq6018
>  
>  - reg:
> @@ -169,6 +170,24 @@
>  			- "ddrss_sf_tbu" PCIe SF TBU clock
>  			- "pipe"	PIPE clock
>  
> +- clock-names:
> +	Usage: required for sm8450
> +	Value type: <stringlist>
> +	Definition: Should contain the following entries
> +			- "aux"         Auxiliary clock
> +			- "cfg"         Configuration clock
> +			- "bus_master"  Master AXI clock
> +			- "bus_slave"   Slave AXI clock
> +			- "slave_q2a"   Slave Q2A clock
> +			- "tbu"         PCIe TBU clock
> +			- "ddrss_sf_tbu" PCIe SF TBU clock
> +			- "pipe"        PIPE clock
> +			- "pipe_mux"    PIPE MUX
> +			- "phy_pipe"    PIPE output clock
> +			- "ref"         REFERENCE clock
> +			- "aggre0"	Aggre NoC PCIe0 AXI clock
> +			- "aggre1"	Aggre NoC PCIe1 AXI clock
> +
>  - resets:
>  	Usage: required
>  	Value type: <prop-encoded-array>
> @@ -246,7 +265,7 @@
>  			- "ahb"			AHB reset
>  
>  - reset-names:
> -	Usage: required for sc8180x, sdm845 and sm8250
> +	Usage: required for sc8180x, sdm845, sm8250 and sm8450
>  	Value type: <stringlist>
>  	Definition: Should contain the following entries
>  			- "pci"			PCIe core reset
> -- 
> 2.33.0
> 
