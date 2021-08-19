Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9226B3F23CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 01:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236845AbhHSXnm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 19:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236572AbhHSXnl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 19:43:41 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B83FC061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 16:43:04 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id u25so10786311oiv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Aug 2021 16:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8LHZxCEWR5/C4vnwOrp7U43kFfte1OHNOyXMODVHA5A=;
        b=eElLfnhKFd3yW9Uwfwg4ay/PWquxMgQp7A3/vCvgyeg+XrrSjsvEM1fvDeQ6ftAim6
         8+ntIVwMzPYywiaGr/seW2o4K+wIinmrS0eHMHyszkSDtqcpnlzpTPiapaoE/U17o7rU
         yO4YU7xRue4Vtzvvg4bq3iNNHFPdCE762BxVmGuSoJno/QV3EEhly0VHleUjEojGJaDN
         dTun/wU4p3/n5/+OkIYIFQNTsuyTK9OZ+uJ14qe0k2CwQRc1Bj4XJEXlNdn5yeAXxgCs
         Q+/WXhEBjdWiXi/qQHavSWMrMZ9OUUiUqa4BO7xZJzc9KQpFYVDqTX7emoc0ycEU6b7c
         wa/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8LHZxCEWR5/C4vnwOrp7U43kFfte1OHNOyXMODVHA5A=;
        b=S4Ubx50FPm/O5Dc6o4aDua0tbnZ4pMpVSjq1bjXGWjbwlz/Dj5V9dA+XnJsLlDomxy
         RM762FXMnBIP684wGFucqr1WUSr51zdKoDiei0X0V1dcZ8rgMQBbvUUQcT5q+HBRgc7D
         OXPeVzt91WhtboktCTyU9WDhURMyVWrwOZ9IQy5JpQOKYQFq4qGempsON5mnOVNFvurM
         al+QSW75epCj5WDQRm47ceaYIcUzgRrBqkV+k6M5F+LIKbemDUEMSbj6F3YQ4vqNaQeU
         AxpJgnuyDocCGKHtTKsTfAiJjXwyCh0142NpnA42Vh7tCFqawvVYhaQ2qge/1mSXQATX
         EPNA==
X-Gm-Message-State: AOAM5328GXR8+DzOpt0ijK3jpZZIM2QT/uNR14NP1/8KkS/cEX9vrJen
        6tbiYNZouLd710052pCkaTmzHw==
X-Google-Smtp-Source: ABdhPJw1Q4apWWBHVYYvewNXXvqK3Xr2GzQSAu+2VXBrcwCXMXMTH9UZhRAI49Wn+01q1dGlrCzfkA==
X-Received: by 2002:aca:1308:: with SMTP id e8mr926649oii.15.1629416583563;
        Thu, 19 Aug 2021 16:43:03 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w14sm1040972otl.58.2021.08.19.16.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 16:43:03 -0700 (PDT)
Date:   Thu, 19 Aug 2021 16:44:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [RFC PATCH 14/15] WIP: PCI: qcom: use pwrseq to power up bus
 devices
Message-ID: <YR7s2vK7jdUssx+A@ripper>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <20210817005507.1507580-15-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817005507.1507580-15-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 16 Aug 17:55 PDT 2021, Dmitry Baryshkov wrote:

> Use bus-pwrseq device tree node to power up the devices on the bus. This
> is to be rewritten with the proper code parsing the device tree and
> powering up individual devices.
> 

How about describing the PCI device in DT and having the PCIe controller
dig it up up from there? Although we won't have a struct device until
later, so perhaps we need the of-based pwrseq_get() for that.

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++++++
>  drivers/power/pwrseq/pwrseq_qca.c      |  1 +
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 8a7a300163e5..a60d41fbcd6f 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -23,6 +23,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> @@ -1467,6 +1468,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  	struct pcie_port *pp;
>  	struct dw_pcie *pci;
>  	struct qcom_pcie *pcie;
> +	struct pwrseq *pwrseq;
>  	int ret;
>  
>  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> @@ -1520,6 +1522,17 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  
>  	pp->ops = &qcom_pcie_dw_ops;
>  
> +	pwrseq = devm_pwrseq_get_optional(dev, "bus");
> +	if (IS_ERR(pwrseq)) {
> +		ret = PTR_ERR(pwrseq);
> +		goto err_pm_runtime_put;
> +	}
> +	if (pwrseq) {
> +		ret = pwrseq_full_power_on(pwrseq);
> +		if (ret)
> +			goto err_pm_runtime_put;
> +	}
> +
>  	ret = phy_init(pcie->phy);
>  	if (ret) {
>  		pm_runtime_disable(&pdev->dev);
> diff --git a/drivers/power/pwrseq/pwrseq_qca.c b/drivers/power/pwrseq/pwrseq_qca.c
> index 3421a4821126..4107f0a9c05d 100644
> --- a/drivers/power/pwrseq/pwrseq_qca.c
> +++ b/drivers/power/pwrseq/pwrseq_qca.c
> @@ -1,3 +1,4 @@
> +#define DEBUG
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2021, Linaro Ltd.
> -- 
> 2.30.2
> 
