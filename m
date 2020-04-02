Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 215D119BBE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 08:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387403AbgDBGp5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 02:45:57 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46243 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729274AbgDBGp5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 02:45:57 -0400
Received: by mail-pf1-f195.google.com with SMTP id q3so1282869pff.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2020 23:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QnW1FRwTH4xbg6LjM8uAuRTxGm5LQR9zZzf7WroNXlk=;
        b=KNE5T8qnOrg8DU2Uf0oSMAWQslv7RAp37B4JyeQ3UXi+xSSIhp/xde1qIF/pvqxL9J
         uxZGuNG4rugzfgwvQE8KO6Q9zN4Gn2dem01V61dEZ4+yTTmhAUzhQuxb4qetrbd2QzQ9
         VZ/5M5Ai8cumWOzOutq4YrufW5MGwo0BkntamiaU4X7bIamT+y67fMt8yADlN9TylaUH
         K8F9HomtVYyoxklKUgsWeuDhjNcxaJbb5dhX4UFj73+0sZW+WkOrdQTHhP3RSnke6AVV
         0GUCdQa0Egz+xressXuZyWEB+f5tjVbuymp2GuRRrw4Q0lliCdINuQjSevox+BOjLR+G
         QQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QnW1FRwTH4xbg6LjM8uAuRTxGm5LQR9zZzf7WroNXlk=;
        b=XOa7m5jCFmHeWPACqJQO+97sxyHb+WMhWZNKt6UqJfTGHNuZEEkMtG6jLFQ/txEZ+v
         OEfRK/cyvNV1Ue51oYN/GZ0z8TaZy4wIRnUlKGXCQV9n2W7JsZbsnPfBImlCsEtE4MoQ
         XJX6qfTtOwcSm/7QORsxjb5Klg/5HTc7ELDMEa2kDw5vwaLBMIw+ZIGlKuSYhbpJKSTY
         oP1RLA+rAq28OXL0WWJbOQpn2qyab3vnNBM4ZRttXOZAQ7JqF80T96ULfKwo40ZOJb7C
         hniMztuQ9FCxM680daHWQKGEimqmJ4JF2pXoMn7mMEiE3Mp43DoB6UQyS/2Oku/nR/sB
         3Hpw==
X-Gm-Message-State: AGi0PuZWHNzKIcee7eMKzqvBz2E+RvF4DRDM7RM8yTCcEuJT3yGXhZA1
        XLQX2QK/iZGRml69muRonAOoTw==
X-Google-Smtp-Source: APiQypLGCELqQ+CVBf3q8b/1bk+rBZgF5Fqa4XWZ5iwiVgkfN8O0vF2RVSrCHg3HEEPGfX83+uu63Q==
X-Received: by 2002:a62:cdcc:: with SMTP id o195mr1696130pfg.323.1585809955390;
        Wed, 01 Apr 2020 23:45:55 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id ck3sm3006406pjb.44.2020.04.01.23.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 23:45:54 -0700 (PDT)
Date:   Wed, 1 Apr 2020 23:45:52 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom:fix local_base status check
Message-ID: <20200402064552.GG663905@yoga>
References: <20200402063302.20640-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402063302.20640-1-tangbin@cmss.chinamobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 01 Apr 23:33 PDT 2020, Tang Bin wrote:

> Release resources when exiting on error.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  drivers/iommu/qcom_iommu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 4328da0b0..c08aa9651 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	qcom_iommu->dev = dev;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res)
> +	if (res) {
>  		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(qcom_iommu->local_base))
> +			return PTR_ERR(qcom_iommu->local_base);
> +	}
>  
>  	qcom_iommu->iface_clk = devm_clk_get(dev, "iface");
>  	if (IS_ERR(qcom_iommu->iface_clk)) {
> -- 
> 2.20.1.windows.1
> 
> 
> 
