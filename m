Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 495755E6509
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 16:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbiIVOWF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 10:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbiIVOVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 10:21:43 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F50EBBDF;
        Thu, 22 Sep 2022 07:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663856500; x=1695392500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qrOCkapsmyXl3UXdsypQQmervF+gwHJltrvDWHBNtiY=;
  b=BwIB/qDFyoJJ/mENn8BQXQCMNuRBfsxM8EHW2AiYDtcG2ODI+dbocJs7
   hi8DjBfYF/x/i5xP2ei8VOv6fm8eo0beeh2R4Gkpz41WXUlurgQDdD3K7
   4KmeVOZsA/h35P2E9ULTz/KUmL3paUkPz452NFhB3vY9HGXtW1wbeGY10
   h7+TOevfNJMYn2A0kZVYY9cMUgHDyYWg1zLlTo/DPxV2jcRows6CHjNWF
   rGFFL02or8ikg3RsbrrTmNCDR3tg+a5ixIfgcwTJZ6uW33XcwVP7hcheB
   Rwxc+jTsexHk8hj2L30M7V+vGyF+gXaIT4IAl14GBZw0he/8tBT78iGvk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="297905880"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="297905880"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 07:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="762200203"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 22 Sep 2022 07:21:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 22 Sep 2022 17:21:35 +0300
Date:   Thu, 22 Sep 2022 17:21:35 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH -next] usb: typec: qcom-pmic-typec: Switch to use
 dev_err_probe() helper
Message-ID: <Yyxvby8nzHYVRk2u@kuha.fi.intel.com>
References: <20220922135708.2212249-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922135708.2212249-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 22, 2022 at 09:57:08PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/qcom-pmic-typec.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/qcom-pmic-typec.c b/drivers/usb/typec/qcom-pmic-typec.c
> index a0454a80c4a2..432ea62f1bab 100644
> --- a/drivers/usb/typec/qcom-pmic-typec.c
> +++ b/drivers/usb/typec/qcom-pmic-typec.c
> @@ -195,9 +195,8 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  
>  	qcom_usb->role_sw = fwnode_usb_role_switch_get(dev_fwnode(qcom_usb->dev));
>  	if (IS_ERR(qcom_usb->role_sw)) {
> -		if (PTR_ERR(qcom_usb->role_sw) != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get role switch\n");
> -		ret = PTR_ERR(qcom_usb->role_sw);
> +		ret = dev_err_probe(dev, PTR_ERR(qcom_usb->role_sw),
> +				    "failed to get role switch\n");
>  		goto err_typec_port;
>  	}
>  
> -- 
> 2.25.1

-- 
heikki
