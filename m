Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F02C1DC3D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 13:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442582AbfJRLSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 07:18:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55128 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633429AbfJRLSz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 07:18:55 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8ADD1611F4; Fri, 18 Oct 2019 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571397534;
        bh=Rla08WiJEiUNMaC5J30js6M5FT6EFY2WP11qFIgpQ2Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DsVbzBxJMYucYpLX/9yAqFzmdlZRKNabU67xoQAaeRikA+CPvs26w75/d5Zbt6YYB
         Ivyu1qkUreCJ6h/dq5p8XUQQNQG+Skt+UJajyDEqLlE61ZiYtVJ/WjnR5tuyaLpICb
         fgTZlNYuC98Z5Xvyl1NSgMEKB5vB5C6CmJCQSrao=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 21F69611B6;
        Fri, 18 Oct 2019 11:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571397531;
        bh=Rla08WiJEiUNMaC5J30js6M5FT6EFY2WP11qFIgpQ2Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FNo16zx+OQk84BnPOq3Zupg9n/dNlkvWCilvoHfnK11Goadyoe7Bc4S97iOJ8XcYe
         qt4DZl8D9MUK4RVpw/NNF3jSc6Ln85WBAyzXYiojMYX4Jxola+N7NzI9kcgZ5BKKMk
         fHxePqLGAcTOQpCZRa4PIkVRiz7JeCunOTLRVRK8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Oct 2019 16:48:50 +0530
From:   Harish Bandi <c-hbandi@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH 3/4] Bluetooth: hci_qca: Use regulator bulk enable/disable
In-Reply-To: <20191018052405.3693555-4-bjorn.andersson@linaro.org>
References: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
 <20191018052405.3693555-4-bjorn.andersson@linaro.org>
Message-ID: <bb16286d4a4afb76eb270ac5b1af3c06@codeaurora.org>
X-Sender: c-hbandi@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-18 10:54, Bjorn Andersson wrote:
> With the regulator_set_load() and regulator_set_voltage() out of the
> enable/disable code paths the code can now use the standard
> regulator bulk enable/disable API.
> 
> By cloning num_vregs into struct qca_power there's no need to lug 
> around
> a reference to the struct qca_vreg_data, which further simplifies
> qca_power_setup().
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/bluetooth/hci_qca.c | 55 +++++++++----------------------------
>  1 file changed, 13 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 54aafcc69d06..01f941e9adf3 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -144,8 +144,8 @@ struct qca_vreg_data {
>   */
>  struct qca_power {
>  	struct device *dev;
> -	const struct qca_vreg_data *vreg_data;
>  	struct regulator_bulk_data *vreg_bulk;
> +	int num_vregs;
>  	bool vregs_on;
>  };
> 
> @@ -1381,63 +1381,34 @@ static int qca_power_off(struct hci_dev *hdev)
>  	return 0;
>  }
> 
> -static int qca_enable_regulator(struct qca_vreg vregs,
> -				struct regulator *regulator)
> -{
> -	return regulator_enable(regulator);
> -
> -}
> -
> -static void qca_disable_regulator(struct qca_vreg vregs,
> -				  struct regulator *regulator)
> -{
> -	regulator_disable(regulator);
> -
> -}
> -
>  static int qca_power_setup(struct hci_uart *hu, bool on)
>  {
> -	struct qca_vreg *vregs;
>  	struct regulator_bulk_data *vreg_bulk;
>  	struct qca_serdev *qcadev;
> -	int i, num_vregs, ret = 0;
> +	int num_vregs;
> +	int ret = 0;
> 
>  	qcadev = serdev_device_get_drvdata(hu->serdev);
> -	if (!qcadev || !qcadev->bt_power || !qcadev->bt_power->vreg_data ||
> -	    !qcadev->bt_power->vreg_bulk)
> +	if (!qcadev || !qcadev->bt_power || !qcadev->bt_power->vreg_bulk)
>  		return -EINVAL;
> 
> -	vregs = qcadev->bt_power->vreg_data->vregs;
>  	vreg_bulk = qcadev->bt_power->vreg_bulk;
> -	num_vregs = qcadev->bt_power->vreg_data->num_vregs;
> -	BT_DBG("on: %d", on);
> +	num_vregs = qcadev->bt_power->num_vregs;
> +	BT_DBG("on: %d (%d regulators)", on, num_vregs);
>  	if (on && !qcadev->bt_power->vregs_on) {
> -		for (i = 0; i < num_vregs; i++) {
> -			ret = qca_enable_regulator(vregs[i],
> -						   vreg_bulk[i].consumer);
> -			if (ret)
> -				break;
> -		}
> +		ret = regulator_bulk_enable(num_vregs, vreg_bulk);
> +		if (ret)
> +			return ret;
> 
> -		if (ret) {
> -			BT_ERR("failed to enable regulator:%s", vregs[i].name);
> -			/* turn off regulators which are enabled */
> -			for (i = i - 1; i >= 0; i--)
> -				qca_disable_regulator(vregs[i],
> -						      vreg_bulk[i].consumer);
> -		} else {
> -			qcadev->bt_power->vregs_on = true;
> -		}
> +		qcadev->bt_power->vregs_on = true;
>  	} else if (!on && qcadev->bt_power->vregs_on) {
>  		/* turn off regulator in reverse order */
> -		i = qcadev->bt_power->vreg_data->num_vregs - 1;
> -		for ( ; i >= 0; i--)
> -			qca_disable_regulator(vregs[i], vreg_bulk[i].consumer);
> +		regulator_bulk_disable(num_vregs, vreg_bulk);
> 
>  		qcadev->bt_power->vregs_on = false;
>  	}
> 
> -	return ret;
> +	return 0;
>  }
> 
>  static int qca_init_regulators(struct qca_power *qca,
> @@ -1465,6 +1436,7 @@ static int qca_init_regulators(struct qca_power 
> *qca,
>  	}
> 
>  	qca->vreg_bulk = bulk;
> +	qca->num_vregs = num_vregs;
> 
>  	return 0;
>  }
> @@ -1493,7 +1465,6 @@ static int qca_serdev_probe(struct serdev_device 
> *serdev)
>  			return -ENOMEM;
> 
>  		qcadev->bt_power->dev = &serdev->dev;
> -		qcadev->bt_power->vreg_data = data;
>  		err = qca_init_regulators(qcadev->bt_power, data->vregs,
>  					  data->num_vregs);
>  		if (err) {
