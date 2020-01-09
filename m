Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A44A1360B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 20:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388673AbgAITFu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 14:05:50 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34879 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388670AbgAITFu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 14:05:50 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so3665939pgk.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2020 11:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1h4Sxb+MieeqG79O/anoYVYS/Fvr4tCDR567hyL/MDQ=;
        b=bRVH1qQSZskUEz+xtr6c2b/ZTmZFjHckMpN/4buOyA3qTyL3qAS8SAjyz1nHvNSwNX
         gv7BaJ67QLuGPMx2E4Sv+mBpaEyTL84RTEo46nKJJbjbWxQ/d0vtDoZUQbXFDhUsucTv
         tMBAybHqfC2J1ddtlMxt3zCSGBJLBvUUACF9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1h4Sxb+MieeqG79O/anoYVYS/Fvr4tCDR567hyL/MDQ=;
        b=bZim6tTNkXvF5ZiMzTHelhstVbAIAPChRlKiaXraDFVvWnT2jlkY4+QKG8fOhC3V3q
         noap+T5X1IpZ/l27a8HJAJkkJIrirwSJq+9KiHlwG9eR1byg7X1sGILzerDi3AmI9CmU
         fkuQKOm5SfJgtb20G0ZpzsbcyotUnahTyTnWt1390ma2rN1Atvq2/w0BhDxgQ3lEgt9l
         Bbf3jfwKHV1I+qDJ5MlOwhZoX5SGPgXNy/SnqfsCsilwALSmqwzjECKpnOZ3ps03Tw6S
         CKMqdXYmmeAKP7zSAzlD58vqhHNYXfjEDAaoKjmCjQj5oEXhaNDL3KlCUkgmQdPERH6b
         1KqQ==
X-Gm-Message-State: APjAAAUOXmh9LkmL5VRKs7ivXBSgHCSf6nD7h1n9w2PT/A33rRShE/Pb
        27ziwbMRoUdcznvGKF3BkCfapw==
X-Google-Smtp-Source: APXvYqyQ1Gl2Z86WpfhnYYq8e2EvQDgDREDXHK237g9+1Jr3wY4KwJDwd1i/LuX+3K+asdWoqU90QQ==
X-Received: by 2002:a63:e545:: with SMTP id z5mr2490pgj.209.1578596749178;
        Thu, 09 Jan 2020 11:05:49 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id t1sm8692182pgq.23.2020.01.09.11.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 11:05:48 -0800 (PST)
Date:   Thu, 9 Jan 2020 11:05:47 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] Bluetooth: hci_qca: Add qca_power_on() API to support
 both wcn399x and Rome power up
Message-ID: <20200109190547.GF89495@google.com>
References: <20200107052601.32216-1-rjliao@codeaurora.org>
 <20200109051427.16426-1-rjliao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200109051427.16426-1-rjliao@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

On Thu, Jan 09, 2020 at 01:14:27PM +0800, Rocky Liao wrote:
> This patch adds a unified API qca_power_on() to support both wcn399x and
> Rome power on. For wcn399x it calls the qca_wcn3990_init() to init the
> regulators, and for Rome it pulls up the bt_en GPIO to power up the btsoc.
> It also moves all the power up operation from hdev->open() to
> hdev->setup().
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> 
> Changes in v2: None
> Changes in v3:
>   -combined the changes of patch 2 and 3 into this patch

it would be better to actually describe what was done, "patch 2 and 3"
doesn't provide much useful information.

>   -updated the commit message
> 
>  drivers/bluetooth/hci_qca.c | 46 ++++++++++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 82e4cd4b6663..427e381a08b4 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -541,7 +541,6 @@ static int qca_open(struct hci_uart *hu)
>  {
>  	struct qca_serdev *qcadev;
>  	struct qca_data *qca;
> -	int ret;
>  
>  	BT_DBG("hu %p qca_open", hu);
>  
> @@ -582,23 +581,10 @@ static int qca_open(struct hci_uart *hu)
>  	hu->priv = qca;
>  
>  	if (hu->serdev) {
> -
>  		qcadev = serdev_device_get_drvdata(hu->serdev);
> -		if (!qca_is_wcn399x(qcadev->btsoc_type)) {
> -			gpiod_set_value_cansleep(qcadev->bt_en, 1);
> -			/* Controller needs time to bootup. */
> -			msleep(150);
> -		} else {
> +		if (qca_is_wcn399x(qcadev->btsoc_type)) {
>  			hu->init_speed = qcadev->init_speed;
>  			hu->oper_speed = qcadev->oper_speed;
> -			ret = qca_regulator_enable(qcadev);
> -			if (ret) {
> -				destroy_workqueue(qca->workqueue);
> -				kfree_skb(qca->rx_skb);
> -				hu->priv = NULL;
> -				kfree(qca);
> -				return ret;
> -			}
>  		}
>  	}
>  
> @@ -1531,6 +1517,31 @@ static int qca_wcn3990_init(struct hci_uart *hu)
>  	return 0;
>  }
>  
> +static int qca_power_on(struct hci_dev *hdev)
> +{
> +	struct hci_uart *hu = hci_get_drvdata(hdev);
> +	enum qca_btsoc_type soc_type = qca_soc_type(hu);
> +	struct qca_serdev *qcadev;
> +	int ret = 0;
> +
> +	/* Non-serdev device usually is powered by external power
> +	 * and don't need additional action in driver for power on
> +	 */
> +	if (!hu->serdev)
> +		return 0;
> +
> +	if (qca_is_wcn399x(soc_type)) {
> +		ret = qca_wcn3990_init(hu);

Since there is no real need to add the qca_regulator_enable() call from
qca_open() here qca_power_on() is now essentially a fancy wrapper for
qca_wcn3990_init(), but I guess that's ok.

> +	} else {
> +		qcadev = serdev_device_get_drvdata(hu->serdev);
> +		gpiod_set_value_cansleep(qcadev->bt_en, 1);
> +		/* Controller needs time to bootup. */
> +		msleep(150);
> +	}
> +
> +	return ret;
> +}
> +
>  static int qca_setup(struct hci_uart *hu)
>  {
>  	struct hci_dev *hdev = hu->hdev;
> @@ -1562,7 +1573,7 @@ static int qca_setup(struct hci_uart *hu)
>  		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
>  		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
>  		hu->hdev->shutdown = qca_power_off;
> -		ret = qca_wcn3990_init(hu);
> +		ret = qca_power_on(hdev);
>  		if (ret)
>  			return ret;
>  
> @@ -1571,6 +1582,9 @@ static int qca_setup(struct hci_uart *hu)
>  			return ret;
>  	} else {
>  		bt_dev_info(hdev, "ROME setup");
> +		ret = qca_power_on(hdev);
> +		if (ret)
> +			return ret;
>  		qca_set_speed(hu, QCA_INIT_SPEED);
>  	}

It would be nice if we could get away with a single qca_power_on() call
for WCN399x and ROME. How about this before 'if (qca_is_wcn399x(soc_type))':

	bt_dev_info(hdev, "setting up %s",
		qca_is_wcn399x(soc_type)? "wcn399x" : "ROME");

	ret = qca_power_on(hdev);
	if (ret)
		return ret;


In any case:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
