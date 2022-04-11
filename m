Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC9504FB377
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 08:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244842AbiDKGLo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 02:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiDKGLn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 02:11:43 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BFA18353
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 23:09:26 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id s8so13668530pfk.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 23:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eYsU7WRE93drZwpg2UmtM51iMD33Wv0zBhClOLennSo=;
        b=Mz07erur6e2ikl+2ye9ThqP56D56aL72/pPMeastiEBlqU4fJyPFvkRjb5Ew2ZCwiF
         J17RUCBM/7MlDhjHmG9G12MSoK4Q1DocMN5JgwCa5l3072EJYGNnxo3iZCM4FOf5gsFt
         vPaeCMClSHwzjxsXkS8N59UPxIjK591oLxDwZIJI7Peb6LemPbXkmLfQbyDGwvUxikoD
         Z2RUH93uZCPrD/P0LS5y9qm7o4RcYbLr+q6WESmSpdqdY4sNo4bcRTxyVVLFIez/EI04
         CGpS5+58uIUX3zjCuIYzhkcvDGKpOLd9Ne6LC+qebGgDbnLoTE9+S19kFfjCtfBAxl+Z
         x9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eYsU7WRE93drZwpg2UmtM51iMD33Wv0zBhClOLennSo=;
        b=30+IzjKqTprhVLmxTim8qAwoYAXlJr9xrGSx3IsIBKTGuN/4WfJaRTOkBG++YKVNuF
         RxcDUyQRFBlP+MAAgfxe1oFxeYYOVe71m7DOBkohq6sVyWC4SwpGn1cl5siiqA6C178I
         /gxLym+rzEcMMNJFkJ1kaRyI4LyDPU2qII3tmnQwvUv2oqnBbIt1mgVyoVRomw0lpGSK
         x9MkBchl6T/r28yKB8AJjCoQuvm9/503s8tpW+5e8d9VlJ7XQWMOTrCvbyQZbufk1oQP
         PtLKzocBwnd3sytQYXa1bIBL5M3LlpWVIr6uKH8FbfPPI8uXaWLJtsGG5Zdh0zG3rn/O
         x6zg==
X-Gm-Message-State: AOAM531pEsQiR2xuTYhqoNyWzSE93gd49xtbDVMJQXOP5ZTmtdy+BRo4
        cMmtM/TWTh07GIXYCPiiFsp2
X-Google-Smtp-Source: ABdhPJwvcNOCbDiYurnD9wBA0ICQ8RITifSEinUCTPZXqdyKm+Kk7yV2hvDKolvn9dV8HelyuRRzAA==
X-Received: by 2002:a63:f642:0:b0:386:53e:9cd4 with SMTP id u2-20020a63f642000000b00386053e9cd4mr24814896pgj.265.1649657366381;
        Sun, 10 Apr 2022 23:09:26 -0700 (PDT)
Received: from thinkpad ([117.217.182.106])
        by smtp.gmail.com with ESMTPSA id a9-20020a056a000c8900b004fb37ecc6bbsm34922659pfv.65.2022.04.10.23.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 23:09:25 -0700 (PDT)
Date:   Mon, 11 Apr 2022 11:39:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Flush recovery worker
 during freeze
Message-ID: <20220411060921.GC16845@thinkpad>
References: <20220408150039.17297-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408150039.17297-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 08, 2022 at 08:30:39PM +0530, Manivannan Sadhasivam wrote:
> It is possible that the recovery work might be running while the freeze
> gets executed (during hibernation etc.,). Currently, we don't powerdown
> the stack if it is not up but if the recovery work completes after freeze,
> then the device will be up afterwards. This will not be a sane situation.
> 
> So let's flush the recovery worker before trying to powerdown the device.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5f0c2ee1fe8d ("bus: mhi: pci-generic: Fix hibernation")
> Reported-by: Bhaumik Vasav Bhatt <quic_bbhatt@quicinc.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
> 
> Changes in v2:
> 
> * Switched to flush_work() as the workqueue used is global one.
> 
>  drivers/bus/mhi/host/pci_generic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index ef85dbfb3216..541ced27d941 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1060,6 +1060,7 @@ static int __maybe_unused mhi_pci_freeze(struct device *dev)
>  	 * the intermediate restore kernel reinitializes MHI device with new
>  	 * context.
>  	 */
> +	flush_work(&mhi_pdev->recovery_work);
>  	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>  		mhi_power_down(mhi_cntrl, true);
>  		mhi_unprepare_after_power_down(mhi_cntrl);
> -- 
> 2.25.1
> 
