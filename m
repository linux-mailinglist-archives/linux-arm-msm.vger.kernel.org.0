Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF08D13CAEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 18:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729025AbgAOR0j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 12:26:39 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39703 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728913AbgAOR0j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 12:26:39 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so7112002plp.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 09:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yVipBSsh5+WhhTDox0hQWUQ5mqLsA3VpUlWy4/WLk9c=;
        b=SzSDkVJOwGN5g11CJ0bvDk2k3o9XkbKQC9adW/cKkYW+Caa8MIMyMc90EM3KsGscep
         nQJ6pR1CzLyFpvt7g0U8waOuNUa6H/CTufY2GYAc21QbdeqJvkwKk7Z88wCRVZVeGJbL
         0MJ0AUrpzHmJ6VREswpGP4X5i/CwzQZX9hx5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yVipBSsh5+WhhTDox0hQWUQ5mqLsA3VpUlWy4/WLk9c=;
        b=CHUAVogkyy3OoY68mykRzCndujL3wYsRvPObJTHqH56l4qfKEeguN9q3qfgRqHER7u
         l3Mce95uNItk6HbXDeL9njs2kEESz1WOGkszIQ58WgPag1VP+z07usyWwL/qrp15dd8Y
         ahfs9pdeW0L4Xdg2+RY6mxrFsHlHMtgPAGqwdruisXSuVZZfoKxhHZQyHEUHC58YazRS
         F5qE7TlCzKCpPgMj4jP8zfDpGaSuOiN6toY1Q7D8z3RGkevKqHLJ81PBQWQylubvVrVP
         alkL1Np04xpUrOGO7JS5439hq1sUAnGO+0Z0uVKsjfXVOtjBZljHBh+6EJeP37guiGmb
         zYFg==
X-Gm-Message-State: APjAAAWvt+JTT1P/RUcVw0hHNFm+lVIZK+oUSmbVxhoa3VqI5FYdhsKT
        TsIiiq5nP7hhMMHIlFuGeeaOig==
X-Google-Smtp-Source: APXvYqy272HK6rPPL3Qfp/pmCyr1lY9GAJPRpsY3XC0oPfve5oiWbCfSwQWAHq4NCihBDd2WXpNsoQ==
X-Received: by 2002:a17:90a:868b:: with SMTP id p11mr1090472pjn.60.1579109196890;
        Wed, 15 Jan 2020 09:26:36 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id y128sm22005122pfg.17.2020.01.15.09.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 09:26:35 -0800 (PST)
Date:   Wed, 15 Jan 2020 09:26:33 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        hemantg@codeaurora.org
Subject: Re: [PATCH v4 1/3] Bluetooth: hci_qca: Add QCA Rome power off
 support to the qca_power_shutdown()
Message-ID: <20200115172633.GM89495@google.com>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20200115085552.11483-1-rjliao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200115085552.11483-1-rjliao@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 15, 2020 at 04:55:50PM +0800, Rocky Liao wrote:
> Current qca_power_shutdown() only supports wcn399x, this patch adds Rome
> power off support to it. For Rome it just needs to pull down the bt_en
> GPIO to power off it. This patch also replaces all the power off operation
> in qca_close() with the unified qca_power_shutdown() call.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> 
> Changes in v2: None
> Changes in v3: None
> Changes in v4:
>   -rebased the patch with latest code base
>   -moved the change from qca_power_off() to qca_power_shutdown()
>   -replaced all the power off operation in qca_close() with
>    qca_power_shutdown()
>   -updated commit message
> 
>  drivers/bluetooth/hci_qca.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 992622dc1263..ecb74965be10 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -663,7 +663,6 @@ static int qca_flush(struct hci_uart *hu)
>  /* Close protocol */
>  static int qca_close(struct hci_uart *hu)
>  {
> -	struct qca_serdev *qcadev;
>  	struct qca_data *qca = hu->priv;
>  
>  	BT_DBG("hu %p qca close", hu);
> @@ -679,14 +678,7 @@ static int qca_close(struct hci_uart *hu)
>  	destroy_workqueue(qca->workqueue);
>  	qca->hu = NULL;
>  
> -	if (hu->serdev) {
> -		qcadev = serdev_device_get_drvdata(hu->serdev);
> -		if (qca_is_wcn399x(qcadev->btsoc_type))
> -			qca_power_shutdown(hu);
> -		else
> -			gpiod_set_value_cansleep(qcadev->bt_en, 0);
> -
> -	}
> +	qca_power_shutdown(hu);
>  
>  	kfree_skb(qca->rx_skb);
>  
> @@ -1685,6 +1677,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
>  	struct qca_serdev *qcadev;
>  	struct qca_data *qca = hu->priv;
>  	unsigned long flags;
> +	enum qca_btsoc_type soc_type = qca_soc_type(hu);
>  
>  	qcadev = serdev_device_get_drvdata(hu->serdev);
>  
> @@ -1697,11 +1690,22 @@ static void qca_power_shutdown(struct hci_uart *hu)
>  	qca_flush(hu);
>  	spin_unlock_irqrestore(&qca->hci_ibs_lock, flags);
>  
> -	host_set_baudrate(hu, 2400);
> -	qca_send_power_pulse(hu, false);
> -	qca_regulator_disable(qcadev);
>  	hu->hdev->hw_error = NULL;
>  	hu->hdev->cmd_timeout = NULL;

This is now done before the power off and not after, I suppose it doesn't
make a difference.

> +
> +	/* Non-serdev device usually is powered by external power
> +	 * and don't need additional action in driver for power down
> +	 */
> +	if (!hu->serdev)
> +		return;
> +
> +	if (qca_is_wcn399x(soc_type)) {
> +		host_set_baudrate(hu, 2400);
> +		qca_send_power_pulse(hu, false);
> +		qca_regulator_disable(qcadev);
> +	} else {
> +		gpiod_set_value_cansleep(qcadev->bt_en, 0);
> +	}
>  }

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
