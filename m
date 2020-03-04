Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90DE5178CDE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 09:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387398AbgCDIxt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 03:53:49 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45556 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728744AbgCDIxt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 03:53:49 -0500
Received: by mail-lf1-f67.google.com with SMTP id b13so804683lfb.12;
        Wed, 04 Mar 2020 00:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I9+aL780TGa2bAdTy5D8onwjF2cwdZt5A8dBDQnrtx4=;
        b=mSgSnSYsc7j1ch2rUpzF9UFNMOmmVqKtde4IPZ/1oNLhqWVVnU2B4qEULNO17WtRPu
         U1Bh5gwC8LqGoXDuI+sIgF44+ul/xxEzvXVazuL/CFh86shGevWKB7gqn9lg02WbdoIp
         uNhx6wK0yd6ERqaYg06NMBZnDoUU3thC77w7on35KbWjpJkX32thRvVuY517SYk8V7oU
         k8oXaO21xuam/GJ6lZO0uhIiTSxktCNAJl0WhQsbq1EtBJPthcKLiJPB/rwsqSv5VZCT
         B/MlMuDBBYjWzfy2GN6AFm7lPMkG52k+UdqQfSl9MDs5X9ot267QS5odFjh6KkhUvxn8
         fKFQ==
X-Gm-Message-State: ANhLgQ03iCNl9jSQJahGLotAzfoiBGf8yDHJfVDY84b7FwaWGQwsRo8X
        YU/oPBdMVIdMky5zQco42nATdNyw
X-Google-Smtp-Source: ADFU+vuc36aEPaMkEB93k8MtGuOq9qmShZI1iyvTJWtxbGwjDSf14rSMM1iYeTB2d/6kBLQKyhCdVg==
X-Received: by 2002:a19:c20b:: with SMTP id l11mr1363543lfc.135.1583312026813;
        Wed, 04 Mar 2020 00:53:46 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id b20sm13664470ljp.20.2020.03.04.00.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 00:53:45 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1j9Pmf-0003KL-Ol; Wed, 04 Mar 2020 09:53:41 +0100
Date:   Wed, 4 Mar 2020 09:53:41 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Make bt_en and susclk not
 mandatory for QCA Rome
Message-ID: <20200304085341.GF32540@localhost>
References: <20200304015429.20615-1-rjliao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304015429.20615-1-rjliao@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 04, 2020 at 09:54:29AM +0800, Rocky Liao wrote:
> On some platforms the bt_en pin and susclk are default on and there
> is no exposed resource to control them. This patch makes the bt_en
> and susclk not mandatory to have BT work. It also will not set the
> HCI_QUIRK_NON_PERSISTENT_SETUP and shutdown() callback if bt_en is
> not available.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 47 ++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index bf436d6e638e..325baa046c3a 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1562,9 +1562,11 @@ static int qca_power_on(struct hci_dev *hdev)
>  		ret = qca_wcn3990_init(hu);
>  	} else {
>  		qcadev = serdev_device_get_drvdata(hu->serdev);
> -		gpiod_set_value_cansleep(qcadev->bt_en, 1);
> -		/* Controller needs time to bootup. */
> -		msleep(150);
> +		if (!IS_ERR(qcadev->bt_en)) {
> +			gpiod_set_value_cansleep(qcadev->bt_en, 1);
> +			/* Controller needs time to bootup. */
> +			msleep(150);
> +		}
>  	}
>  
>  	return ret;
> @@ -1750,7 +1752,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
>  		host_set_baudrate(hu, 2400);
>  		qca_send_power_pulse(hu, false);
>  		qca_regulator_disable(qcadev);
> -	} else {
> +	} else if (!IS_ERR(qcadev->bt_en)) {
>  		gpiod_set_value_cansleep(qcadev->bt_en, 0);
>  	}
>  }
> @@ -1852,6 +1854,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  	struct hci_dev *hdev;
>  	const struct qca_vreg_data *data;
>  	int err;
> +	bool power_ctrl_enabled = true;
>  
>  	qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
>  	if (!qcadev)
> @@ -1901,35 +1904,37 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  		qcadev->bt_en = devm_gpiod_get(&serdev->dev, "enable",
>  					       GPIOD_OUT_LOW);

Shouldn't you use devm_gpiod_get_optional()?

>  		if (IS_ERR(qcadev->bt_en)) {
> -			dev_err(&serdev->dev, "failed to acquire enable gpio\n");
> -			return PTR_ERR(qcadev->bt_en);
> +			dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
> +			power_ctrl_enabled = false;

And bail out on errors, but treat NULL as !port_ctrl_enabled?

>  		}
>  
>  		qcadev->susclk = devm_clk_get(&serdev->dev, NULL);

And devm_clk_get_optional() here.

Etc.

Also does the devicetree binding need to be updated to reflect this
change?

Johan
