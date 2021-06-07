Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2472D39E871
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 22:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhFGUcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 16:32:12 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:8956 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230251AbhFGUcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 16:32:12 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Jun 2021 13:30:20 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.134.64.25])
  by ironmsg02-sd.qualcomm.com with ESMTP; 07 Jun 2021 13:30:19 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id A3DE4210F1; Mon,  7 Jun 2021 13:30:19 -0700 (PDT)
Date:   Mon, 7 Jun 2021 13:30:19 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        lee.jones@linaro.org, agross@kernel.org,
        dmitry.baryshkov@linaro.org
Subject: Re: [PATCH net-next v3] mfd: pm8008: Fix return value check in
 pm8008_probe()
Message-ID: <20210607203019.GA11347@codeaurora.org>
References: <20210605022446.4119978-1-yangyingliang@huawei.com>
 <YLxCGLALLlO4i14n@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLxCGLALLlO4i14n@builder.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 05, 2021 at 10:33:44PM -0500, Bjorn Andersson wrote:
> On Fri 04 Jun 21:24 CDT 2021, Yang Yingliang wrote:
> 
> > In case of error, the function devm_regmap_init_i2c() returns ERR_PTR()
> > and never returns NULL. The NULL test in the return value check
> > should be replaced with IS_ERR().
> > 
> > Fixes: 6b149f3310a4 ("mfd: pm8008: Add driver for QCOM PM8008 PMIC")
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Guru Das Srinagesh <gurus@codeaurora.org>

> 
> > ---
> > v3:
> >   return PTR_ERR(chip->regmap) instead of ENODEV
> > ---
> >  drivers/mfd/qcom-pm8008.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> > index c472d7f8103c..fb8915a682ad 100644
> > --- a/drivers/mfd/qcom-pm8008.c
> > +++ b/drivers/mfd/qcom-pm8008.c
> > @@ -228,8 +228,8 @@ static int pm8008_probe(struct i2c_client *client)
> >  
> >  	chip->dev = &client->dev;
> >  	chip->regmap = devm_regmap_init_i2c(client, &qcom_mfd_regmap_cfg);
> > -	if (!chip->regmap)
> > -		return -ENODEV;
> > +	if (IS_ERR(chip->regmap))
> > +		return PTR_ERR(chip->regmap);
> >  
> >  	i2c_set_clientdata(client, chip);
> >  
> > -- 
> > 2.25.1
> > 
