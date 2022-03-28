Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 175F54E993C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Mar 2022 16:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243749AbiC1OWD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Mar 2022 10:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240693AbiC1OWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Mar 2022 10:22:01 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C86F5DA78
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 07:20:18 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id b13so10892324pfv.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8JYmDY7pw6HG4IIvhyF4KoEeJvcY+xeCNEOxCuitmQg=;
        b=zuljtzggTSZp4bz2amzqxW3YPXs1lXrTI5+3qF5/e1ZWyzanX3Ehx8U+Oaqxp/6rwL
         63L7FHhObGNK8R8NVG9c6r9JrNEDm5qmUekqJl1PEgHDSW6cYFvnZ3o+pHP2ROs7hDXu
         +zMbK6p+bwfVSsVf0iurvi1DWVnPagyAEmkJa4TDlwO4s7Afm6hj75lq4ZQRGujF7cvC
         KuPTP/8K8UXEwi7b9bew6L24TLo4xkIi5jN6nvC25inl2zqygkz1myMnzuvcyJ6cSjzI
         nrYdFfYvbMCLUmQcMKmXYOW4DDiRULFMdiRcfX5TvIGrgCfk/M9veFkOo8CYHXhMAJJi
         Y03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8JYmDY7pw6HG4IIvhyF4KoEeJvcY+xeCNEOxCuitmQg=;
        b=AnOBkmyxo68Oi9mDgCPuu6qDKB2W7CuuFzOZgO2g+31Fxtyl96A723mQdO4hW4t5Ot
         xeCSCJXFvlt5ncTJVEy8ywgmrAVReMkDUvumu0D/hjk+BkVpGhQ/suH6lw0+M1afnQiA
         10tj+GCMltQ6fy7aJQ9YxOypOhenAf+XsHIn8E6RUjHcMPDiUmN+VUnI4d+4U0z9nMV1
         dE44W+M3mpSQoMbr5Zs8CHGPcBFSxE5m0SMzq7+1YigSHNdFZ6/0hRlc4vB7tnf6DYa5
         1F1RAzYMprSwk+ZeV2WRuBxS3RuwdHR9h5NySm0dsK9ULzo2zrYq45rbHYrlFL5mjgM+
         5jFg==
X-Gm-Message-State: AOAM530B4fQVDFQNAaFK908cEP0ZCcYrWDZmCZYBIoCZ6qtfam8rufYx
        Rh5qfOYWkuyzgOWf9mIPE6qd
X-Google-Smtp-Source: ABdhPJyRXehrqWCFnk/gIwqnV30MtOO5cWThfFqS66kHzbM+NvWWe3TdZAsOuAG1+kMM7Io8oCzc/A==
X-Received: by 2002:a05:6a00:1312:b0:4e1:58c4:ddfd with SMTP id j18-20020a056a00131200b004e158c4ddfdmr23169664pfu.65.1648477217907;
        Mon, 28 Mar 2022 07:20:17 -0700 (PDT)
Received: from thinkpad ([220.158.159.124])
        by smtp.gmail.com with ESMTPSA id l4-20020a056a0016c400b004f79504ef9csm16322604pfc.3.2022.03.28.07.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 07:20:17 -0700 (PDT)
Date:   Mon, 28 Mar 2022 19:50:12 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     bjorn.andersson@linaro.org, bhelgaas@google.com,
        svarbanov@mm-sol.com, robh@kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Add support for handling MSIs from 8 endpoints
Message-ID: <20220328142012.GB17663@thinkpad>
References: <20211214101319.25258-1-manivannan.sadhasivam@linaro.org>
 <20220223100145.GA26873@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223100145.GA26873@lpieralisi>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 23, 2022 at 10:01:45AM +0000, Lorenzo Pieralisi wrote:
> On Tue, Dec 14, 2021 at 03:43:19PM +0530, Manivannan Sadhasivam wrote:
> > The DWC controller used in the Qcom Platforms are capable of addressing the
> > MSIs generated from 8 different endpoints each with 32 vectors (256 in
> > total). Currently the driver is using the default value of addressing the
> > MSIs from 1 endpoint only. Extend it by passing the MAX_MSI_IRQS to the
> > num_vectors field of pcie_port structure.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Need an ACK from qcom maintainers.
> 

Looks like this patch was not applied eventhough the Acks were received.
Please let me know if I need to resubmit it for next cycle.

Thanks,
Mani

> Thanks,
> Lorenzo
> 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 1c3d1116bb60..8a4c08d815a5 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -1550,6 +1550,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> >  	pci->dev = dev;
> >  	pci->ops = &dw_pcie_ops;
> >  	pp = &pci->pp;
> > +	pp->num_vectors = MAX_MSI_IRQS;
> >  
> >  	pcie->pci = pci;
> >  
> > -- 
> > 2.25.1
> > 
