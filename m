Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1992B9BCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 21:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbgKSUB1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 15:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbgKSUB0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 15:01:26 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904E4C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 12:01:26 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id f93so5321248qtb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 12:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ckDTXWosyha6hrF9pw7rAgIp6P/f7Ug8SYe9JRHLr9Q=;
        b=M/3TmxHzN/mVynLAC6dCAEXGvzmmTZ+pTxgKzrie1Q1H2pTf6NS2X+9MRMLvtAbJjv
         TgwyRTTbo3VukQHt/JbXrvkma9PK5KdS9gIY6uKVLEWi+s9kRT5vIs0bKA7xijAxWaga
         n20zJuYcr/gaXtsSVY7N595lwTp69q8S7E/HR3ovDIxLHkKTjalBfDw8viJ+Tf09ANb6
         3SZATjN9kNotZzHfGkPWFZ2M4EZ8D7+XVPwxq2imeo229P6k/A6yfIGnbbB2qmy7/qKe
         78kJItRTf/Ym6yqhdHDZCLmvHo16zEPdancYBfgZYBizge37SIN7V8MOtVJu1M8Qr1IF
         kvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ckDTXWosyha6hrF9pw7rAgIp6P/f7Ug8SYe9JRHLr9Q=;
        b=GYI2n+tEK9RXoyZO62oyDq6SkMWSsuSo5blyjMd9+4IoSbwtYckg67D0u2QDHEdbH+
         wBgPKvyjdOngAh8wfTdsx6lInjolKd4tOuowCbWO0EiaTLgp6bZ75jSedPFjeUUX6p4I
         cVUALyg8CvNfSF54XlzQ35TnvCUAThV7mPFVNYvDAQf9Aum71yu3bn3vxGzgCU3Kvrtg
         lZ4LJLqhfwzy6BMZWti5Y08LTBOHBfqBbKdgkTyZW3rsUIitUG6DIWOCIZ3twnf2QR6t
         CsB2Kx9Agm7V8gaw6Lv9HRywXmKRCmFz2Yb20fRuemSPmeOOGkbvaMm2sGsCFcCreV35
         2OFQ==
X-Gm-Message-State: AOAM531Kue77vGkUvtxlvYB7mEjTDC+pOO9pa5R6YB2qaM1rlQyLp5PA
        z2Rj/wj7EYtxjIUxoA8kS5an7oz7IJY=
X-Google-Smtp-Source: ABdhPJxxeQnJzHsA5tmMJY4v5W05dHL0DvpHFDQTrqtITAyOdTOR3sOCkJ6yaIQLZI5U5MurKYBZZg==
X-Received: by 2002:ac8:4748:: with SMTP id k8mr12909297qtp.336.1605816085705;
        Thu, 19 Nov 2020 12:01:25 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id b197sm574229qkg.65.2020.11.19.12.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 12:01:25 -0800 (PST)
Date:   Thu, 19 Nov 2020 13:01:23 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, jhugo@codeaurora.org
Subject: Re: [PATCH v5] bus: mhi: Add MHI PCI support for WWAN modems
Message-ID: <20201119200123.GA2360224@ubuntu-m3-large-x86>
References: <1603300699-24481-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603300699-24481-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 21, 2020 at 07:18:19PM +0200, Loic Poulain wrote:
> This is a generic MHI-over-PCI controller driver for MHI only devices
> such as QCOM modems. For now it supports registering of Qualcomm SDX55
> based PCIe modules. The MHI channels have been extracted from mhi
> downstream driver.
> 
> This driver is for MHI-only devices which have all functionalities
> exposed through MHI channels and accessed by the corresponding MHI
> device drivers (no out-of-band communication).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

I see the following warning on 32-bit ARM with clang after this patch
appeared in -next:

drivers/bus/mhi/pci_generic.c:276:25: warning: implicit conversion from
'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value
from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
        mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
                             ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/dma-mapping.h:76:40: note: expanded from macro
'DMA_BIT_MASK'
#define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                       ^~~~~
1 warning generated.

An explicit cast to dma_addr_t would solve it but I am not sure if that
is proper or not.

Cheers,
Nathan
