Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D691639BF17
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 19:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhFDRwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 13:52:44 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:24316 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229690AbhFDRwo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 13:52:44 -0400
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Jun 2021 10:50:57 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.134.64.25])
  by ironmsg05-sd.qualcomm.com with ESMTP; 04 Jun 2021 10:50:57 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 4C04F210ED; Fri,  4 Jun 2021 10:50:57 -0700 (PDT)
Date:   Fri, 4 Jun 2021 10:50:57 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        lee.jones@linaro.org, agross@kernel.org,
        dmitry.baryshkov@linaro.org
Subject: Re: [PATCH -next v2] mfd: pm8008: Fix return value check in
 pm8008_probe()
Message-ID: <20210604175057.GA13362@codeaurora.org>
References: <20210604013824.1040775-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604013824.1040775-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 04, 2021 at 09:38:24AM +0800, Yang Yingliang wrote:
> In case of error, the function devm_regmap_init_i2c() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
> 
> Fixes: 6b149f3310a4 ("mfd: pm8008: Add driver for QCOM PM8008 PMIC")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v2:
>   make the change correspond to the changelog
> ---
>  drivers/mfd/qcom-pm8008.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index c472d7f8103c..476171455d32 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -228,7 +228,7 @@ static int pm8008_probe(struct i2c_client *client)
>  
>  	chip->dev = &client->dev;
>  	chip->regmap = devm_regmap_init_i2c(client, &qcom_mfd_regmap_cfg);
> -	if (!chip->regmap)
> +	if (IS_ERR(chip->regmap))
>  		return -ENODEV;

The error received from devm_regmap_init_i2c should be returned as-is and not
-ENODEV. Could you please do:

	if (IS_ERR(chip->regmap))
		return PTR_ERR(chip->regmap);

Thank you for this patch.

>  
>  	i2c_set_clientdata(client, chip);
