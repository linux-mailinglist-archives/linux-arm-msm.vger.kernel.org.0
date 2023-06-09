Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA349729EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 17:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240625AbjFIPiK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 11:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjFIPiK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 11:38:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FBB930E8
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 08:38:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BF5B65936
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 15:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051EBC433D2;
        Fri,  9 Jun 2023 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686325088;
        bh=Ub8kgtuLOXlB1lZplho9yrsG0peukzicGmJk6zEpSVc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T8yt3prnNjCsrGiMvS11FWobI5iNrsGllORRPLqIpwtbpOp8uc4o5ovNcmX+Ipuui
         Ys3qO9WElHQ4W+/AWoW7Fn93ToDMS1oyt+AtATAmrzD7nQ5EK/TA4cOcJs4XhxhlaM
         lyd6MDH353FHNPMFGk1DwPBzUMPlA6/0SdF4ikecTmtSnIc5i7XiAVcBV429WzUfMp
         mn7MP0m137vXrcVipiqyNiBw6qbicPuOsyT6yjome1veFMoe3PuyN/EAoJv7ISvxG7
         mW2ZkExFx1F5UYeeiwyocMY+A6BiJqcqWRA9UaNVSHpxr8IKPRZ+MovsMO2zLZF2em
         KShZq5H6uKH6A==
Date:   Fri, 9 Jun 2023 21:08:00 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>
Cc:     loic.poulain@linaro.org, slark_xiao@163.com,
        fabio.porcedda@gmail.com, koen.vandeputte@citymesh.com,
        song.fc@gmail.com, bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
        duke.xin@quectel.com
Subject: Re: [PATCH v4] bus: mhi: host: pci_generic: Add support for
 quectel's new EM160R-GL product
Message-ID: <20230609153800.GC6847@thinkpad>
References: <20230608092927.2893-1-duke_xinanwen@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230608092927.2893-1-duke_xinanwen@163.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 08, 2023 at 02:29:27AM -0700, Duke Xin(辛安文) wrote:
> The product's would use the same config as previous EM160R-GL
> 
> Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>

Modified the commit message and subject to reflect the usecase and applied to
mhi-next!

- Mani

> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
> Changelog
> 
> v3 -> v4
> 
> * Update commit message to include the changelog and reviewd tag.
> 
> v2 -> v3
> 
> * Add patch CC to mhi@lists.linux.dev.
> 
> v1 -> v2
> 
> * Remove Space before */ and "for laptop" description.
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 70e37c490150..5f204b819e95 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -591,6 +591,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> +	/* EM160R-GL (sdx24) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x100d),
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
