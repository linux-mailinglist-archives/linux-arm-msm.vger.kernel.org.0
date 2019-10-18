Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1DEDDC3DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 13:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442588AbfJRLTM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 07:19:12 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55400 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442552AbfJRLTL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 07:19:11 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5AE3D611F7; Fri, 18 Oct 2019 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571397550;
        bh=Ap6n/vQKc5gnW7MdPd1IseW/FlTz2vMaGwjVtmCKHKA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TfTtx6HetWy61B5tHSj0NjKZyveJk2Vomdl1J0xHWBCP6hlDFdn011yQoc/SqzOVB
         zX8x+IFkvxQwPRUZBq+fztuOsbVMOO4+l1z/mEZCsQstSt7Un3v2cknaTif7xJYL1L
         3DG51xzOeXF/BUroPhHE4KPcPXvU37rvQMucxolI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 5B9A9611E2;
        Fri, 18 Oct 2019 11:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571397546;
        bh=Ap6n/vQKc5gnW7MdPd1IseW/FlTz2vMaGwjVtmCKHKA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TK7gX3ocKrCKRXTrgOL0jvMqr6PryBjmyeWa1tJEKzMXShiYFObO5O2mE0Ho9ZhnA
         wSVWEQqD4tmVQTJ117g/7+yZ0hevX2ycp+LdNxzlS51w8UlNyn5YxefsfP7rajVA8T
         a4iQf4WDznwuqdOSBHt7iPeTetcERVcyCPSbqeE8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Oct 2019 16:49:06 +0530
From:   Harish Bandi <c-hbandi@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH 4/4] Bluetooth: hci_qca: Split qca_power_setup()
In-Reply-To: <20191018052405.3693555-5-bjorn.andersson@linaro.org>
References: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
 <20191018052405.3693555-5-bjorn.andersson@linaro.org>
Message-ID: <401f2b07e3c4404f3e0e3603900a9836@codeaurora.org>
X-Sender: c-hbandi@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-18 10:54, Bjorn Andersson wrote:
> Split and rename qca_power_setup() in order to simplify each code path
> and to clarify that it is unrelated to qca_power_off() and
> qca_power_setup().
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/bluetooth/hci_qca.c | 61 ++++++++++++++++++++++---------------
>  1 file changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 01f941e9adf3..c591a8ba9d93 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -160,7 +160,8 @@ struct qca_serdev {
>  	const char *firmware_name;
>  };
> 
> -static int qca_power_setup(struct hci_uart *hu, bool on);
> +static int qca_regulator_enable(struct qca_serdev *qcadev);
> +static void qca_regulator_disable(struct qca_serdev *qcadev);
>  static void qca_power_shutdown(struct hci_uart *hu);
>  static int qca_power_off(struct hci_dev *hdev);
> 
> @@ -516,7 +517,7 @@ static int qca_open(struct hci_uart *hu)
>  		} else {
>  			hu->init_speed = qcadev->init_speed;
>  			hu->oper_speed = qcadev->oper_speed;
> -			ret = qca_power_setup(hu, true);
> +			ret = qca_regulator_enable(qcadev);
>  			if (ret) {
>  				destroy_workqueue(qca->workqueue);
>  				kfree_skb(qca->rx_skb);
> @@ -1186,7 +1187,7 @@ static int qca_wcn3990_init(struct hci_uart *hu)
>  	qcadev = serdev_device_get_drvdata(hu->serdev);
>  	if (!qcadev->bt_power->vregs_on) {
>  		serdev_device_close(hu->serdev);
> -		ret = qca_power_setup(hu, true);
> +		ret = qca_regulator_enable(qcadev);
>  		if (ret)
>  			return ret;
> 
> @@ -1351,9 +1352,12 @@ static const struct qca_vreg_data
> qca_soc_data_wcn3998 = {
> 
>  static void qca_power_shutdown(struct hci_uart *hu)
>  {
> +	struct qca_serdev *qcadev;
>  	struct qca_data *qca = hu->priv;
>  	unsigned long flags;
> 
> +	qcadev = serdev_device_get_drvdata(hu->serdev);
> +
>  	/* From this point we go into power off state. But serial port is
>  	 * still open, stop queueing the IBS data and flush all the buffered
>  	 * data in skb's.
> @@ -1365,7 +1369,7 @@ static void qca_power_shutdown(struct hci_uart 
> *hu)
> 
>  	host_set_baudrate(hu, 2400);
>  	qca_send_power_pulse(hu, false);
> -	qca_power_setup(hu, false);
> +	qca_regulator_disable(qcadev);
>  }
> 
>  static int qca_power_off(struct hci_dev *hdev)
> @@ -1381,36 +1385,43 @@ static int qca_power_off(struct hci_dev *hdev)
>  	return 0;
>  }
> 
> -static int qca_power_setup(struct hci_uart *hu, bool on)
> +static int qca_regulator_enable(struct qca_serdev *qcadev)
>  {
> -	struct regulator_bulk_data *vreg_bulk;
> -	struct qca_serdev *qcadev;
> -	int num_vregs;
> -	int ret = 0;
> +	struct qca_power *power = qcadev->bt_power;
> +	int ret;
> 
> -	qcadev = serdev_device_get_drvdata(hu->serdev);
> -	if (!qcadev || !qcadev->bt_power || !qcadev->bt_power->vreg_bulk)
> -		return -EINVAL;
> +	/* Already enabled */
> +	if (power->vregs_on)
> +		return 0;
> 
> -	vreg_bulk = qcadev->bt_power->vreg_bulk;
> -	num_vregs = qcadev->bt_power->num_vregs;
> -	BT_DBG("on: %d (%d regulators)", on, num_vregs);
> -	if (on && !qcadev->bt_power->vregs_on) {
> -		ret = regulator_bulk_enable(num_vregs, vreg_bulk);
> -		if (ret)
> -			return ret;
> +	BT_DBG("enabling %d regulators)", power->num_vregs);
> 
> -		qcadev->bt_power->vregs_on = true;
> -	} else if (!on && qcadev->bt_power->vregs_on) {
> -		/* turn off regulator in reverse order */
> -		regulator_bulk_disable(num_vregs, vreg_bulk);
> +	ret = regulator_bulk_enable(power->num_vregs, power->vreg_bulk);
> +	if (ret)
> +		return ret;
> 
> -		qcadev->bt_power->vregs_on = false;
> -	}
> +	power->vregs_on = true;
> 
>  	return 0;
>  }
> 
> +static void qca_regulator_disable(struct qca_serdev *qcadev)
> +{
> +	struct qca_power *power;
> +
> +	if (!qcadev)
> +		return;
> +
> +	power = qcadev->bt_power;
> +
> +	/* Already disabled? */
> +	if (!power->vregs_on)
> +		return;
> +
> +	regulator_bulk_disable(power->num_vregs, power->vreg_bulk);
> +	power->vregs_on = false;
> +}
> +
>  static int qca_init_regulators(struct qca_power *qca,
>  				const struct qca_vreg *vregs, size_t num_vregs)
>  {
