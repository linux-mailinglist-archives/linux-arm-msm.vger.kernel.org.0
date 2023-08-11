Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368CA77930C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 17:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjHKP1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 11:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbjHKP1d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 11:27:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3C830D5
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 08:27:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ACA3F6752B
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 15:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9944EC433C8;
        Fri, 11 Aug 2023 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691767652;
        bh=wIE4vbh0AneyUpoS4kBL64opYSG1KdIy+uogO0XCkW8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qsqnZ5VUF9Cb/NSm6bENgrPHlAjVw2qXkfMVFEAQK+OQ709EDhkSAM4JdQC+/9Qi3
         L9WQM0IhV3YOuHdoTEKrLL/Ry3HMliOng3HB4vwd/83g2syVc33bF8kLBsuP/kaIug
         sDxTpebpK+mbe0FTh/LDay9TNE05j4LBH5rNRJCQdam5A8AOC1X5xPd94/TNGLYH/h
         6OFI43YQE74kwUIsOBamCkT0BhJtI8MYOZ4NJpNI+oVG8DPVR7bEoCLNKnf2f8DeH3
         QeJHE+VI8sHQ0PnhUuZFxCTcCoCZAhwrc3OlcwuViFc1dFX4jFSLiAK3aN7489EhbR
         MIuQF3RA8UMuw==
Date:   Fri, 11 Aug 2023 20:57:25 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: add support for Telit
 FE990
Message-ID: <20230811152725.GC5296@thinkpad>
References: <20230804094039.365102-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804094039.365102-1-dnlplm@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 04, 2023 at 11:40:39AM +0200, Daniele Palmas wrote:
> Add support for Telit FE990 that has the same configuration than FN990:
> 
> $ lspci -vv
> 04:00.0 Unassigned class [ff00]: Qualcomm Device 0308
>     Subsystem: Device 1c5d:2015
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Applied to mhi-next with suggested changes!

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index fcd80bc92978..676f3ae33ae9 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -595,6 +595,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* Telit FN990 */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
> +	/* Telit FE990, same configuration than FN990 */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
> +		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */
> -- 
> 2.37.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
