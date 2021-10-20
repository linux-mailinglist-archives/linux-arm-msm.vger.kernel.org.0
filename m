Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2796F43516F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 19:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhJTRjb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 13:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbhJTRja (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 13:39:30 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6174DC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 10:37:16 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id s9so8178161oiw.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+Q+LEmepn36HSxPt5uJFp1Yk/izN2yIl7NSlQhJHylQ=;
        b=m0AvpWkfmHJ18/lAG2XLsY9hGW5OCgYp+lOgVrHzZZlOd72L7gdlpZET90ZjjhciSx
         6W6lxzK6oYLFF0YpB1gsUOLBqK4k3jn4i6URBFdTt3/NrpbYuJK55hSfA4mbFWi9uGaw
         UYCPkCWTw9SfBaMWgBSovDpLjJ+D99gpdlNeMV0in5ftGk6n04dP/UP2yiqW6+/BU3Nj
         9nDZFQdvgvHWMhdeh2e719BRVfQqJKsU+bkSmwNHx6rsEbH7l/qR5+r5PuDgvmeOaZgY
         3/n3zGCubw++ikkyabzk0XU9mvDvQoeDOESYyu056DtgxZOfUEDHbHkjmm0b7VD/+/aW
         vuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+Q+LEmepn36HSxPt5uJFp1Yk/izN2yIl7NSlQhJHylQ=;
        b=XKbZBgpYg1yzbZ5ZjTbimGcb5Rufmdhuz7Dc8UqhlUS7kXFDiNbhuAHQO69pWwgxl0
         sTzj0ZLofHe6B6rSlnKHqJD+MQ3Yjfggn+F1lLAgzDIL6K04iLbo9Xqir+AFYTQ0W0Eo
         BdMap2x6tuYIOr8MMV4rYc3Rk7dbp1tqEHKmjY9WE90hnC7oY1uue3TPAkqm5uP3NfW6
         t9P9FpAX0JBI7I1ePrzKCKd5qRec49BM/fUz18R6d0oskU1S6eXTKCf9UZa2sf3sDCcz
         3XSfXoFouTjzWhdgqhYyT8Xjakh6WQrEw4m/eUQ4VSsA894NOXTW5Ugj2H8dgdx1H5Nl
         bRsw==
X-Gm-Message-State: AOAM530sRfCMI9c9Uf0AAKTueuq3I7s/mb7cd7PemSsrCpDX8czL9x1K
        Hlz6ijiOqE3CsGeTVZtdnCzZEA==
X-Google-Smtp-Source: ABdhPJyRbztnB2Ozs88Qk+LtJ2QkLpy4F9RdjwJFGHpAra+QXJr7m0CvofFuHpnSY7lOjm2tumY5eQ==
X-Received: by 2002:a05:6808:2127:: with SMTP id r39mr298456oiw.124.1634751435769;
        Wed, 20 Oct 2021 10:37:15 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id l16sm502070oou.7.2021.10.20.10.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 10:37:15 -0700 (PDT)
Date:   Wed, 20 Oct 2021 10:38:59 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: qcom-qmp: another fix for the sc8180x PCIe
 definition
Message-ID: <YXBUM/SrGHWonh48@ripper>
References: <20211020155604.1374530-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020155604.1374530-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 20 Oct 08:56 PDT 2021, Dmitry Baryshkov wrote:

> Commit f839f14e24f2 ("phy: qcom-qmp: Add sc8180x PCIe support") added
> SC8180X PCIe tables, but used sm8250_qmp_pcie_serdes_tbl as a serdes
> table because of the copy paste error. Commit bfccd9a71a08 ("phy:
> qcom-qmp: Fix sc8180x PCIe definition") corrected part of this mistake
> by pointing serdes_tbl to sc8180x_qmp_pcie_serdes_tbl, however the
> serdes_tbl_num field was not updated to use sc8180x table. So let's now
> fix the serdes_tbl_num field too.
> 
> Fixes: bfccd9a71a08 ("phy: qcom-qmp: Fix sc8180x PCIe definition")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Damn it...my eyes doesn't like these solid chunks of text.
Thanks Dmitry.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index f14032170b1c..06b04606dd7e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3632,7 +3632,7 @@ static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
>  	.nlanes = 1,
>  
>  	.serdes_tbl		= sc8180x_qmp_pcie_serdes_tbl,
> -	.serdes_tbl_num		= ARRAY_SIZE(sm8250_qmp_pcie_serdes_tbl),
> +	.serdes_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_serdes_tbl),
>  	.tx_tbl			= sc8180x_qmp_pcie_tx_tbl,
>  	.tx_tbl_num		= ARRAY_SIZE(sc8180x_qmp_pcie_tx_tbl),
>  	.rx_tbl			= sc8180x_qmp_pcie_rx_tbl,
> -- 
> 2.33.0
> 
