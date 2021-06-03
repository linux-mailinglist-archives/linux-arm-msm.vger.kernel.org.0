Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E1539A90C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 19:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbhFCRUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 13:20:32 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:64397 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232814AbhFCRTA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 13:19:00 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Jun 2021 10:12:54 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.134.64.25])
  by ironmsg01-sd.qualcomm.com with ESMTP; 03 Jun 2021 10:12:54 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 1ECC9210E0; Thu,  3 Jun 2021 10:12:54 -0700 (PDT)
Date:   Thu, 3 Jun 2021 10:12:53 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        lee.jones@linaro.org, agross@kernel.org
Subject: Re: [PATCH -next] mfd: pm8008: Fix return value check in
 pm8008_probe()
Message-ID: <20210603171253.GA25742@codeaurora.org>
References: <20210603141357.572347-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603141357.572347-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 03, 2021 at 10:13:57PM +0800, Yang Yingliang wrote:
> In case of error, the function devm_regmap_init_i2c() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
> 
> Fixes: 6b149f3310a4 ("mfd: pm8008: Add driver for QCOM PM8008 PMIC")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Acked-by: Guru Das Srinagesh <gurus@codeaurora.org>

> ---
>  drivers/mfd/qcom-pm8008.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index c472d7f8103c..dfefa60d693b 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -223,7 +223,7 @@ static int pm8008_probe(struct i2c_client *client)
>  	struct pm8008_data *chip;
>  
>  	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> -	if (!chip)
> +	if (IS_ERR(chip))
>  		return -ENOMEM;
>  
>  	chip->dev = &client->dev;
> -- 
> 2.25.1
> 
