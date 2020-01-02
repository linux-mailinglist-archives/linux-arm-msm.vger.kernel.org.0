Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F92312EA28
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 20:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgABTHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 14:07:30 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38088 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727951AbgABTHa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 14:07:30 -0500
Received: by mail-pg1-f194.google.com with SMTP id a33so22322037pgm.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2020 11:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ns/i9Oa6qRXMr64PI7szGSN7BWAj/fmeJPxZe1MnizY=;
        b=oVxX1Knt/R/3nB229kEwTKYVJOHzqxICyECe0tKOS3C9ldeT+jAJTeN3ZMZ/NVjNjo
         0boUSN6vtNZOtKS1HSFVmLsGiFm2piaawTcuwDNwPT2Er5TQMRZDmCOz7yo5YGsmzi/5
         HHu4kdc/M7LQoIGa7/ldglhJoXsjqECIycu7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ns/i9Oa6qRXMr64PI7szGSN7BWAj/fmeJPxZe1MnizY=;
        b=MDJRbJ5u9JI8XOq/tSTTzLNkrlnSBy+ICl06cPpuXb3VZHwy8xi2hc3C7MVdQaBXUt
         k1BrCcX0RQ804ZeSaZ5C3nHnytcdCWXm9HB0rBpBnqou0Icq4VYyZyGv5NNaGeiKSmFR
         wpGUk7we6fJy8gcDt6YG63XfUeWGsk8DsmrQwDuob8YRHs/ty81l9nIkW7x0+BS/qtdO
         CgxFLQGt7fjSRHiF0OIvCqE4Uw/Aw6gP6Q1oAkxYD6sZRze+OsfDn64YYcDtTv5dRI/v
         rVVAP3VlCVX1vnv8uyGlqB79J+upBd04zuPYmM5rpeGNn600dNlVzJeQo7xf8j4Obl9t
         hPAA==
X-Gm-Message-State: APjAAAXmevVLYMg+7c1kNE/IHB8j2KVNKJ+vlTnpkPCjem8XP/PmTlSq
        cA342xoNds8s8NVf2rkEOWTfiQ==
X-Google-Smtp-Source: APXvYqzW/C/2CXlgrd1xB24BgIpm2Szz8CfkC/Ks5s8kCCNGxRt2QDxrQh9ezYm320THOa8knFTpyw==
X-Received: by 2002:a62:5447:: with SMTP id i68mr81577777pfb.44.1577992049403;
        Thu, 02 Jan 2020 11:07:29 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z6sm50037106pfa.155.2020.01.02.11.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2020 11:07:28 -0800 (PST)
Date:   Thu, 2 Jan 2020 11:07:27 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/4] Bluetooth: hci_qca: Add HCI command timeout
 handling
Message-ID: <20200102190727.GB89495@google.com>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20191227072130.29431-1-rjliao@codeaurora.org>
 <20191227072130.29431-4-rjliao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191227072130.29431-4-rjliao@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

On Fri, Dec 27, 2019 at 03:21:30PM +0800, Rocky Liao wrote:
> This patch adds the HCI command timeout handling, it will trigger btsoc
> to report its memory dump via vendor specific events when hit the defined
> max HCI command timeout count. After all the memory dump VSE are sent, the
> btsoc will also send a HCI_HW_ERROR event to host and this will cause a new
> hci down/up process and the btsoc will be re-initialized.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> 
> Changes in v2:
> - Fix build error
> Changes in v3:
> - Remove the function declaration 
> - Move the cmd_timeout() callback register to probe()
> - Remove the redundant empty line
> 
>  drivers/bluetooth/hci_qca.c | 45 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index ca0b38f065e5..026e2e2cdd30 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -47,6 +47,8 @@
>  #define IBS_HOST_TX_IDLE_TIMEOUT_MS	2000
>  #define CMD_TRANS_TIMEOUT_MS		100
>  
> +#define QCA_BTSOC_DUMP_CMD	0xFB
> +
>  /* susclk rate */
>  #define SUSCLK_RATE_32KHZ	32768
>  
> @@ -56,6 +58,9 @@
>  /* max retry count when init fails */
>  #define QCA_MAX_INIT_RETRY_COUNT 3
>  
> +/* when hit the max cmd time out count, trigger btsoc dump */
> +#define QCA_MAX_CMD_TIMEOUT_COUNT 3

nit: MAX_CMD_TIMEOUTS?

Similar to QCA_MAX_INIT_RETRY_COUNT on which I commented earlier I don't
think the 'QCA' prefix adds value here. The constant is defined in the driver
itself and isn't related to hardware.

> +
>  enum qca_flags {
>  	QCA_IBS_ENABLED,
>  	QCA_DROP_VENDOR_EVENT,
> @@ -123,6 +128,8 @@ struct qca_data {
>  	u64 rx_votes_off;
>  	u64 votes_on;
>  	u64 votes_off;
> +
> +	u32 cmd_timeout_cnt;

nit: cmd_timeouts?

>  };
>  
>  enum qca_speed_type {
> @@ -1332,6 +1339,11 @@ static int qca_setup(struct hci_uart *hu)
>  	if (!ret) {
>  		set_bit(QCA_IBS_ENABLED, &qca->flags);
>  		qca_debugfs_init(hdev);
> +
> +		/* clear the command time out count every time after
> +		 * initializaiton done
> +		 */
> +		qca->cmd_timeout_cnt = 0;
>  	} else if (ret == -ENOENT) {
>  		/* No patch/nvm-config found, run with original fw/config */
>  		ret = 0;
> @@ -1462,6 +1474,38 @@ static int qca_power_off(struct hci_dev *hdev)
>  	return 0;
>  }
>  
> +static int qca_send_btsoc_dump_cmd(struct hci_uart *hu)
> +{
> +	int err = 0;

The variable is pointless, just return 0 at the end of the function.

> +	struct sk_buff *skb = NULL;
> +	struct qca_data *qca = hu->priv;
> +
> +	BT_DBG("hu %p sending btsoc dump command", hu);
> +
> +	skb = bt_skb_alloc(1, GFP_ATOMIC);
> +	if (!skb) {
> +		BT_ERR("Failed to allocate memory for qca dump command");

"These generic allocation functions all emit a stack dump on failure when used
without __GFP_NOWARN so there is no use in emitting an additional failure
message when NULL is returned."

Documentation/process/coding-style.rst

hence the logging is redundant, drop it.

> +		return -ENOMEM;
> +	}
> +
> +	skb_put_u8(skb, QCA_BTSOC_DUMP_CMD);
> +
> +	skb_queue_tail(&qca->txq, skb);
> +
> +	return err;
> +}
> +
> +static void qca_cmd_timeout(struct hci_dev *hdev)
> +{
> +	struct hci_uart *hu = hci_get_drvdata(hdev);
> +	struct qca_data *qca = hu->priv;
> +
> +	BT_ERR("hu %p hci cmd timeout count=0x%x", hu, ++qca->cmd_timeout_cnt);

Is there any particular reason to print the counter in hex instead of
decimal?

Should this use bt_dev_err() since we have a hdev in this context?

> +
> +	if (qca->cmd_timeout_cnt >= QCA_MAX_CMD_TIMEOUT_COUNT)
> +		qca_send_btsoc_dump_cmd(hu);
> +}
> +
>  static int qca_regulator_enable(struct qca_serdev *qcadev)
>  {
>  	struct qca_power *power = qcadev->bt_power;
> @@ -1605,6 +1649,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  		hdev = qcadev->serdev_hu.hdev;
>  		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
>  		hdev->shutdown = qca_power_off;
> +		hdev->cmd_timeout = qca_cmd_timeout;
>  	}
>  
>  out:	return err;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
