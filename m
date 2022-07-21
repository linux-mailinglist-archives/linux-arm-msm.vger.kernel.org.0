Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA4F957C891
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 12:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbiGUKIE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 06:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233007AbiGUKIE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 06:08:04 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E216A9C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 03:08:03 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 23so1209032pgc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 03:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=a9YjzXGdq5669WOd8WnAMplMXRiXL/2vmSMeSJuFMgI=;
        b=bghQzs4KeeC3qf2IwPpeOjfcv8rcRJmxobbTEu1b1LgfoUir1gN0ploWyqiZ/dgsb2
         LjQ5wAhxQocOojaMFuJEIvWhUQLwUTD05e1KfQb0bwQC+dNjhgEO0YmTNHcM3wpsT875
         YFwKCNI/iOvGie/4whVieQ7k2Czb7Gspx3QastMBjK+R6oOaGw1PbGPpwNxmK+nrAn71
         yUEFqXwdGQYxrE4n66E8fGNcd0qdnzYz8g04XTx61zKpEQRedqNajeYwAiEyuWXFaXnR
         nzFsOsg59s2s5mgufW2dwdmktIUBQOa1ngBaXh5fKi+hzzQ57DYS/gik7KPpgltoD+HR
         ItrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=a9YjzXGdq5669WOd8WnAMplMXRiXL/2vmSMeSJuFMgI=;
        b=wJkdukQAJ5HYUzt+4rg7FXaym2t0lrTnhOUzt1WpMLBqaJiLdHIsQBqEjz5+sxKTkS
         VqXgWMRq7iwJJCg7o3hfO97TEU/BJF/9gU03fNUzK/00YQiKdIM/XPiwq5eco+fdvgQE
         EjdA3Z5cPpgnmBWz7FYpQUHhBoAcF/JIzu3YmN0YUmPbqXgnTt0zBFUmmGJIEUf/fM/N
         swiKBG0d1KFjGjZgELelkEUjoEDhOZC9NLBaoofW8N2VoGyl2ZNBtLPmNT0yYW92bmbG
         B7I1vU5Mi7zAFc9c45FcqdvD3HHKM++Lsi16QVpiG0XqA/LYjQwLlsrT1RtGon+4nZAd
         UeXA==
X-Gm-Message-State: AJIora/IUHooSkaAoK/eCiVmI+zohv0y9/4/48FFd1ZvVuZ+F7ULgF+I
        hk49Wxk63+79feg2bwmuGn6V
X-Google-Smtp-Source: AGRyM1sEfVv500oMdF2vFfQRbAZm/PaTgquheMbdnclqX3E0EU7EPtOQjMjqRA0wgnuh4pIx0FcawQ==
X-Received: by 2002:a63:5b5e:0:b0:41a:5e8f:b127 with SMTP id l30-20020a635b5e000000b0041a5e8fb127mr7727534pgm.104.1658398083074;
        Thu, 21 Jul 2022 03:08:03 -0700 (PDT)
Received: from thinkpad ([117.217.186.184])
        by smtp.gmail.com with ESMTPSA id x1-20020aa79561000000b00528c26c84a3sm1293525pfq.64.2022.07.21.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 03:08:02 -0700 (PDT)
Date:   Thu, 21 Jul 2022 15:37:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, y@thinkpad
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH 4/4] PCI: qcom-ep: call phy_set_mode_ext()
Message-ID: <20220721100756.GD39125@thinkpad>
References: <20220719200626.976084-1-dmitry.baryshkov@linaro.org>
 <20220719200626.976084-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220719200626.976084-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Subject could be,

"PCI: qcom: Set PHY in RC mode"

On Tue, Jul 19, 2022 at 11:06:26PM +0300, Dmitry Baryshkov wrote:
> Call phy_set_mode_ext() to notify the PHY driver that the PHY is being
> used in the EP mode.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom-ep.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index ec99116ad05c..11f887a2f7c4 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -240,6 +240,10 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
>  	if (ret)
>  		goto err_disable_clk;
>  
> +	ret = phy_set_mode_ext(pcie->phy, PHY_MODE_PCIE, 1);
> +	if (ret)
> +		goto err_phy_exit;
> +
>  	ret = phy_power_on(pcie_ep->phy);
>  	if (ret)
>  		goto err_phy_exit;
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
