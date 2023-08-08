Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56A6773F2A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 18:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbjHHQn7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 12:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233262AbjHHQnH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 12:43:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD01855B5
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 08:55:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3354B623FF
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 06:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D477EC433C8;
        Tue,  8 Aug 2023 06:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691476162;
        bh=Pf7gAL37CB/b6eio3krc89yYnkMomtpSi3buynizaJM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gv59IaPvTzk/ZCQjrVmXu6ljIfTvdkFsTehnIGnKWtjJisWz1taCgpe63tfBlJfZ6
         I24y/Z4Bol4q90WLvqPZ4Ja4xM7SszXozv/Eopl/flv70AFEsOXHvnd5A4FGMdOUMr
         /PP1g0wH/nc+5aE7j2bwy56B3SHigcFPdRkfuMxaWngIZoJGn8rYjDyWVwNmGsBCFr
         8RMaKPsg68EPifcz1cXPvndeipVXvcmX2Af4yjbIiM9vEJbiIg/sFUM+UTBB69mSuh
         /oRIqNWBlUJ5rC+DNwkrbMIoNKQt8uAoL/OxPzuaa8IcHScDjn5mJorqFD0Ypr7kEO
         qYOq+7fhq7k9g==
Date:   Tue, 8 Aug 2023 11:59:08 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>
Cc:     loic.poulain@linaro.org, slark_xiao@163.com,
        fabio.porcedda@gmail.com, johan+linaro@kernel.org,
        bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
        duke.xin@quectel.com
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add support for Lenovo
 RM520N-GL
Message-ID: <20230808062908.GB4990@thinkpad>
References: <20230807030454.37255-1-duke_xinanwen@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230807030454.37255-1-duke_xinanwen@163.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Aug 06, 2023 at 08:04:54PM -0700, Duke Xin(辛安文) wrote:
> The Quectel new RM520N-GL product works with the Quectel's existing
> RM520N-GL modem settings.But this one is designed for lenovo laptop
> usecase, hence Quectel got a new PID.
> 
> Signed-off-by: Duke Xin(辛安文) <duke_xinanwen@163.com>

Tweaked commit message and applied to mhi-next with my reviewed-by tag. Please
do not add tags on your own.

- Mani

> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
> Changelog
> 
> v1 -> v2
> 
> * Adjusted description of quectel modem and limit character length to 75 characters.
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index fcd80bc92978..e4f2fb67dfaf 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -604,6 +604,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* RM520N-GL (sdx6x), eSIM */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1004),
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
> +	/* RM520N-GL (sdx6x), Lenovo variant */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1007),
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x100d), /* EM160R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCCL (sdx24) */
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
