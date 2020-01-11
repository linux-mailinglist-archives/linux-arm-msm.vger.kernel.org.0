Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5515137A9C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2020 01:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727744AbgAKAbY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 19:31:24 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33235 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbgAKAbX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 19:31:23 -0500
Received: by mail-pg1-f193.google.com with SMTP id 6so1772783pgk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2020 16:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YF+XBwmeW7gMU2m1kq2ajUEOp6kfHK6MdHE8gUKg6T0=;
        b=iLFlOeIvGtjXQ6QmLDCHibczQzimWNj1FRpWHLj2tvKQwNn1P3PwnzxbZnewZ7juX7
         UPeLXzmV/MXFgYDr3F1c15g5QD1kfKN+Ac3r8BglOjrUBKbN8Zw6JrWwYElV3jXCVLMY
         hAhcgNhWTVMkslFFcwspQ/Gmp9tW12Z1uiZs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YF+XBwmeW7gMU2m1kq2ajUEOp6kfHK6MdHE8gUKg6T0=;
        b=kdvzIVdhqgaDBiG3qAJfnDaovKmuwxKlHR3SgsBAaG/Q0Sen/F0BBhgj7l2j4DJH2H
         3J83LN9to+ZO6eUcOqdca2VkgPm0HPT1j2v3ejb05BWKU0LlbSZhIlobPFxJH5LTj88Q
         9yPGkpppO3Ltm0MLT3CFsfXozMkN7aTDJBR9XTMpZP8v7p/arVHWfbnWGVWsqLTd993W
         djAGFAJ5oxhh5i6S/40a1YbDInEEgAb+M58cekuVdQkcfVAqy1nN/T1NK2N50u+U+RWd
         x8zRSYB+QjITqfB5hkWiVSDRrRXW7HrlyatJc5o5bKyBVCJfHeMIBW6Py9TgFeodguYr
         QltA==
X-Gm-Message-State: APjAAAXjUirCKehE1Axysc/fnfJ3DQBUYBrGt7AzWWC6ojdE0XLF1zHe
        CsPtC2wubW5Sd4Ua1+36c0qd8a5tKAc=
X-Google-Smtp-Source: APXvYqwM49cGGJmod3ZROpphQDvw/toVhkkiCx9OFDSYmtnGWl3HMu87yJxDPHaHnwwBpmFNyCd4XA==
X-Received: by 2002:a63:4d1b:: with SMTP id a27mr7509254pgb.352.1578702683163;
        Fri, 10 Jan 2020 16:31:23 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id a18sm4061269pjq.30.2020.01.10.16.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2020 16:31:21 -0800 (PST)
Date:   Fri, 10 Jan 2020 16:31:20 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4] Bluetooth: hci_qca: Add qca_power_on() API to support
 both wcn399x and Rome power up
Message-ID: <20200111003120.GG89495@google.com>
References: <20200107052601.32216-1-rjliao@codeaurora.org>
 <20200110033214.16327-1-rjliao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200110033214.16327-1-rjliao@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

On Fri, Jan 10, 2020 at 11:32:14AM +0800, Rocky Liao wrote:
> This patch adds a unified API qca_power_on() to support both wcn399x and
> Rome power on. For wcn399x it calls the qca_wcn3990_init() to init the
> regulators, and for Rome it pulls up the bt_en GPIO to power up the btsoc.
> It also moves all the power up operation from hdev->open() to
> hdev->setup().
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> 
> Changes in v2: None
> Changes in v3:
>   -moved all the power up operation from open() to setup()
>   -updated the commit message
> Changes in v4:
>   -made a single call to qca_power_on() in setup()
> 
> 
>  drivers/bluetooth/hci_qca.c | 48 +++++++++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 82e4cd4b6663..6a67e5489b16 100644
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
> @@ -1553,6 +1564,10 @@ static int qca_setup(struct hci_uart *hu)
>  	 */
>  	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
>  
> +	ret = qca_power_on(hdev);
> +	if (ret)
> +		return ret;
> +

Now if qca_power_on() fails there is no log entry indicating that Bluetooth
setup was running. That's why I suggested to put this log entry before
the call, and remove the corresponding entries from the if/else branches:

	bt_dev_info(hdev, "setting up %s",
		qca_is_wcn399x(soc_type)? "wcn399x" : "ROME");

>  	if (qca_is_wcn399x(soc_type)) {
>  		bt_dev_info(hdev, "setting up wcn3990");
>  
> @@ -1562,9 +1577,6 @@ static int qca_setup(struct hci_uart *hu)
>  		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
>  		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
>  		hu->hdev->shutdown = qca_power_off;
> -		ret = qca_wcn3990_init(hu);
> -		if (ret)
> -			return ret;
>  
>  		ret = qca_read_soc_version(hdev, &soc_ver, soc_type);
>  		if (ret)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
