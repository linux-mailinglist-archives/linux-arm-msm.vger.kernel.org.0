Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96E50771A8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 08:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjHGGkY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 02:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbjHGGkW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 02:40:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD9B12A
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Aug 2023 23:40:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 32B6061561
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 06:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA4AC433C7;
        Mon,  7 Aug 2023 06:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691390420;
        bh=nH19bMzfu1oxoSd2MS/m+Uz1OZh9B1bN3liwVOQZFyM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=imBx+f6yhYHc8ZTADVE2FHXYpxOy91GkBPW5jLLU1h6syhp4DQ8ywQzs9j8fSSAXf
         xnhD7yNCopAl8Dcg1C3NbJik3shKvzJZM1+7r2Hqw3yXDjYevIZLejTr0yWSCdG+HA
         ZR7/FpgYh1rbY7PdgX1XXGh2mL7w/PCiPZJs4NLDq22iMJ74mP4OjldnFChlUL7Aki
         ao/5WyVP0DhwJEUpdGKmCw3CgOb0zsvtGeC1FSJfm3TCt1xZxG5Rqtcp8/pO5CeSO5
         KlUqGK8EV12yEiDcDv9YqRIjF2qrPK2svh/cE5YNmZkFVETNee0WgesRrbY85G+1Km
         +9owLmJLqhqKA==
Date:   Mon, 7 Aug 2023 12:10:06 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Duke =?utf-8?B?WGluKOi+m+WuieaWhyk=?= <duke_xinanwen@163.com>
Cc:     loic.poulain@linaro.org, slark_xiao@163.com,
        fabio.porcedda@gmail.com, johan+linaro@kernel.org,
        bhelgaas@google.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, jerry.meng@quectel.com,
        duke.xin@quectel.com
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add support for Lenovo
 RM520N-GL
Message-ID: <20230807064006.GA18257@thinkpad>
References: <20230807030454.37255-1-duke_xinanwen@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230807030454.37255-1-duke_xinanwen@163.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

For this patch, I never gave my reviewed-by tag. From where did you pick this
up? It is never a good practice to add tags without permissions.

- Mani

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
