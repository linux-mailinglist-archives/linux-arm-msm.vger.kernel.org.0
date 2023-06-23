Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD1D573B0A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 08:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbjFWGUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 02:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjFWGUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 02:20:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260A4189
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 23:20:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 90A1B617DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDB8C433CA;
        Fri, 23 Jun 2023 06:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687501206;
        bh=FtwUBUkE52aniaJ925qwThgDJFolU0qE9HDu4ZkAcGE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H40VgCNm1QExIadA9ef3FJs0UrU6S3Q8edKTBw1UniFBKqT2g0rB75EI38RBaigpy
         +b1x7pCg5gmJYoZyhA3I7JFyoNLtTa6nft3H05IEazk1PMUZGLKWufd/nt4fdAsBUt
         atGgmxnYwII+Nn1fkeZk0cs9eBy0Su4tXrP5CKEx/8Wla449ra6LDG05J7131AOWJf
         /z/0+8NPGSaUuw/egRUkgdulU1u9I3h76pqN8PHRNSiNZLo72Ib+DZKGKDL2oK57EQ
         quYYeM9B3CtV6cgVq/UWWstXnqUJ84uerK2zZtBNDy5MmCfyOOCoPhb8sAlcK8rU5l
         x+MCIrV4zIBkA==
Date:   Fri, 23 Jun 2023 11:49:54 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc:     manivannan.sadhasivam@linaro.org, quic_vbadigan@quicinc.com,
        quic_ramkri@quicinc.com, linux-arm-msm@vger.kernel.org,
        konrad.dybcio@linaro.org
Subject: Re: [PATCH RFC v1 0/3] PCI: EPC: Add support to wake up host from D3
 states
Message-ID: <20230623061954.GD5611@thinkpad>
References: <1686754850-29817-1-git-send-email-quic_krichai@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1686754850-29817-1-git-send-email-quic_krichai@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 14, 2023 at 08:30:46PM +0530, Krishna chaitanya chundru wrote:
> Here we propose this patch series to add support in PCI endpoint
> driver to wake up host from D3 states.
> 
> As endpoint cannot send any data/MSI when the device state is in
> D3cold or D3hot. Endpoint needs to bring the device back to D0
> to send any kind of data.
> 
> For this endpoint needs to send inband PME the device is in D3hot or
> toggle wake when the device is D3 cold.
> 
> Comments and suggestions are welcome.
> 

As Kishon noted, you should also submit the EPF change to justify the API
addition.

- Mani

> Krishna chaitanya chundru (3):
>   PCI: endpoint: Add wakeup host API to EPC core
>   pci: dwc: Add wakeup host op to pci_epc_ops
>   PCI: qcom: ep: Add wake up host op to dw_pcie_ep_ops
> 
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 11 ++++++++
>  drivers/pci/controller/dwc/pcie-designware.h    |  2 ++
>  drivers/pci/controller/dwc/pcie-qcom-ep.c       | 34 +++++++++++++++++++++++++
>  drivers/pci/endpoint/pci-epc-core.c             | 29 +++++++++++++++++++++
>  include/linux/pci-epc.h                         |  3 +++
>  5 files changed, 79 insertions(+)
> 
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
