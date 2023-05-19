Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEC870917C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 10:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjESIQd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 04:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjESIQc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 04:16:32 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974F310D;
        Fri, 19 May 2023 01:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684484191; x=1716020191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Id5GnFi+b9G0LPMHVhGmB67A8W/8PBqlzXVDTx1zeiY=;
  b=cNkGnZdd2ltM6PQICkOYkZxpzb9KsiPDF6T/wwBwYAJGbZvN0JzgCIWK
   /4XIXHeLYhzLLOavPDC+PTwSCgdT3OeAusiYiQBtWXDMCQ8ChRx7XN2EB
   KnQA/GRBl4TSA2Cp7jBgkyOERPTCD3s8ptnVXM+a08AP3w+Wfd6aMdEJl
   mQ0JGOtsO495LxCZStpjsS/NDk53OKmYAEYTtWqjTRWu1C2dEFbOzYq4f
   yHGNRGmZJrbDXqdZvBRmMzG/4HcR+1r7CAIRH6aHp0csJgYp1BQUITcii
   hOVT5RFJ0Tc6dZQdyYkrkhDGl0sG9xwSeWggYuibGLLUKlBiIrS2DIQjm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="341749172"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="341749172"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 01:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846811378"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="846811378"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 19 May 2023 01:16:27 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 19 May 2023 11:16:27 +0300
Date:   Fri, 19 May 2023 11:16:27 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 92/97] usb: typec: qcom-pmic-typec: Convert to platform
 remove callback returning void
Message-ID: <ZGcwW1SUpQkih0X6@kuha.fi.intel.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-93-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-93-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 18, 2023 at 01:02:34AM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/qcom-pmic-typec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/qcom-pmic-typec.c b/drivers/usb/typec/qcom-pmic-typec.c
> index 432ea62f1bab..924af87fb26d 100644
> --- a/drivers/usb/typec/qcom-pmic-typec.c
> +++ b/drivers/usb/typec/qcom-pmic-typec.c
> @@ -228,7 +228,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int qcom_pmic_typec_remove(struct platform_device *pdev)
> +static void qcom_pmic_typec_remove(struct platform_device *pdev)
>  {
>  	struct qcom_pmic_typec *qcom_usb = platform_get_drvdata(pdev);
>  
> @@ -237,8 +237,6 @@ static int qcom_pmic_typec_remove(struct platform_device *pdev)
>  
>  	typec_unregister_port(qcom_usb->port);
>  	usb_role_switch_put(qcom_usb->role_sw);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id qcom_pmic_typec_table[] = {
> @@ -253,7 +251,7 @@ static struct platform_driver qcom_pmic_typec = {
>  		.of_match_table = qcom_pmic_typec_table,
>  	},
>  	.probe = qcom_pmic_typec_probe,
> -	.remove = qcom_pmic_typec_remove,
> +	.remove_new = qcom_pmic_typec_remove,
>  };
>  module_platform_driver(qcom_pmic_typec);
>  
> -- 
> 2.39.2

-- 
heikki
