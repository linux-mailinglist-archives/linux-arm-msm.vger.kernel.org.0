Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7282C6ED9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 05:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731565AbgK1EyY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 23:54:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731499AbgK1Exb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 23:53:31 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34094C0613D1;
        Fri, 27 Nov 2020 20:53:31 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id b23so3592517pls.11;
        Fri, 27 Nov 2020 20:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MNLKIBMH7ybUpHig1eG9Mv/94KwRp5IA7CDnO20AI+I=;
        b=eNDcQV7juXZXD+kS1/WHfMBrSFI1u9gs/e9hpZSCr1dbt9ZV1DBy7H/6qnKeRK+aYT
         7ESboMUuzzboMsrMq+f0gXNFgtL5ZZ+yu54eer0dJQhxcUZU8AmpNHDqeN+nHibfyTgS
         PnQehFaQaIVRDGuaAw70Z0ABGUMH5Og4wH3/yPUlAVPxSY9MBozg4IGO3XLwM7f7mRYr
         9hQY63j5IiI+porBB01dROcojZ4nyd8jvIDNs4AZGBy06FvI7ZeHoo44tFGfTECIjS3n
         bPhfJsdQbRTIcQmxdYvxNfrE097XLCUCcsC9IL3/VMswS90Mykfb4jUONNBr6LiEihxI
         h/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MNLKIBMH7ybUpHig1eG9Mv/94KwRp5IA7CDnO20AI+I=;
        b=OSwt0SX04ONn2JnUoyfkdOPZIhvZJrmdBraRoiQjkFkkH/ElSr9wZn3nyhqU4LLPnp
         MY9G5yOPuQRl90c7PnhScyeCz6UPCHmSADHqBAdrIsr5xQK2CGiYhwwxAaE+k84uGkq7
         /MbxQWdxpQMlyAbkh8VGrNk02lPrrbl5DE/z77nreXTaYo+mrCbFMv8okRLpI2PeqL/L
         yK7+OShd7RqLkuN+Kbz3ZgO2K/k016LdihhY/xcsnOrkLM1yX3bebRMMwENrhdaORlMk
         /uizRLHytgssQMJpRFrmOkcztWYlRRNc5gHLbH5nwK45xzUVE19izah7L/JxNLmMWD3x
         iVQQ==
X-Gm-Message-State: AOAM531zgwadUTYsHi/3157B4DpBt7HWaYzz3TycvGZobK8xs7firuLp
        V9kxB6eEZD/knw4eMajCN2vsAKZERPM=
X-Google-Smtp-Source: ABdhPJzTtKXHxFliVYzhcmuN8zuZYmbZ0pQDhH5YpmjJJBcZ1CW1JyfHju0cgiP24fYhISGO6xQM4A==
X-Received: by 2002:a17:902:bb92:b029:d9:e9bf:b775 with SMTP id m18-20020a170902bb92b02900d9e9bfb775mr9958801pls.24.1606539210764;
        Fri, 27 Nov 2020 20:53:30 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id g16sm9190473pfb.201.2020.11.27.20.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:53:30 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by empty dma-ranges
Date:   Fri, 27 Nov 2020 20:53:28 -0800
Message-Id: <20201128045328.2411772-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016090833.1892-2-thunder.leizhen@huawei.com>
References: <20201016090833.1892-1-thunder.leizhen@huawei.com> <20201016090833.1892-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 16 Oct 2020 17:08:32 +0800, Zhen Lei <thunder.leizhen@huawei.com> wrote:
> The scripts/dtc/checks.c requires that the node have empty "dma-ranges"
> property must have the same "#address-cells" and "#size-cells" values as
> the parent node. Otherwise, the following warnings is reported:
> 
> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
> its #address-cells (1) differs from / (2)
> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
> (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
> its #size-cells (1) differs from / (2)
> 
> Arnd Bergmann figured out why it's necessary:
> Also note that the #address-cells=<1> means that any device under
> this bus is assumed to only support 32-bit addressing, and DMA will
> have to go through a slow swiotlb in the absence of an IOMMU.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---

Applied to devicetree-arm64/next, thanks!
--
Florian
