Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAB2A132D0E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 18:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgAGRbw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 12:31:52 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33009 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728442AbgAGRbw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 12:31:52 -0500
Received: by mail-pg1-f194.google.com with SMTP id 6so214169pgk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 09:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6tbx6y0alCppo4JulU8ZX+Wq5gWxVblT3if0J5vpiqg=;
        b=L72FmqY7y9JcE1Hl8aVOS075lkg2C/pQlQl3XVkV9+o4hG12UWm6Z+RNU4UaowMX7l
         AzJI7/sOkWRixckpCz3sLqVPZ9Lmn0VMJOukcWmnoz0mlT/zeKG8T+7vtUMCBlLNLNmD
         C7TYuadNxUKRk5Jyrl5xgt4f5z004pCSe3P5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6tbx6y0alCppo4JulU8ZX+Wq5gWxVblT3if0J5vpiqg=;
        b=PB7nSmkUChvKBwrdYl6ETGTV0k0O4FzdiGb82ctZ7Es4pwlbjmQCvXjm5OVZhhKgTV
         5123HxGRNrxAx1vMf7HvOU/uDa2YBshJqMmZIYegBwK3EUSjwxllCwE9GMz2YMM2WPRJ
         njJoF3IU5i9UitMESVEz1QlnD++yE7NwfdZjSVfJITNEwIMgS2qtOUSfQ2Af99/UpgMR
         rczbK4my0wR4qp2BDzucrz0hB4az58K+zg20KnMRwtY/2Dfnf1xKKwTTLvfeXH6OnimV
         bD8+bGJUtG0DrhhxrysMtZAcIKKjqR2r+qIM/ZCQZAJ6nZrc+bqg4TGxtquwX23IT7Se
         BjUw==
X-Gm-Message-State: APjAAAXCswyhaQUh9M23gibH44Xs/vN6Sppo0vwlGsI2Wn0Lfi3nFpXZ
        9WwBxoY7L1BOeWTAglAmSIWjlDfkQi0=
X-Google-Smtp-Source: APXvYqxuZTRMvr2E0NVTDg27lnwD7H9kx+RE+QwcVmHID/+AUrQOH+CqDmCL6ILFL3+vIgX9QTQ34Q==
X-Received: by 2002:a63:8041:: with SMTP id j62mr551347pgd.41.1578418311104;
        Tue, 07 Jan 2020 09:31:51 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 80sm126769pfw.123.2020.01.07.09.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 09:31:50 -0800 (PST)
Date:   Tue, 7 Jan 2020 09:31:49 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Add qca_power_on() API to support
 both wcn399x and Rome power up
Message-ID: <20200107173149.GD89495@google.com>
References: <20200107052601.32216-1-rjliao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200107052601.32216-1-rjliao@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

On Tue, Jan 07, 2020 at 01:26:01PM +0800, Rocky Liao wrote:
> This patch adds a unified API qca_power_on() to support both wcn399x and
> Rome power on. For wcn399x it calls the qca_wcn3990_init() to init the
> regulators, and for Rome it pulls up the bt_en GPIO to power up the btsoc.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 9392cc7f9908..f6555bd1adbc 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1532,6 +1532,27 @@ static int qca_wcn3990_init(struct hci_uart *hu)
>  	return 0;
>  }
>  
> +static int qca_power_on(struct hci_dev *hdev)
> +{
> +	struct hci_uart *hu = hci_get_drvdata(hdev);
> +	enum qca_btsoc_type soc_type = qca_soc_type(hu);
> +	struct qca_serdev *qcadev;
> +	int ret = 0;

another option would be to return directly from the if/else branches,
but either way is fine.

> +
> +	if (qca_is_wcn399x(soc_type)) {
> +		ret = qca_wcn3990_init(hu);
> +	} else {
> +		if (hu->serdev) {
> +			qcadev = serdev_device_get_drvdata(hu->serdev);
> +			gpiod_set_value_cansleep(qcadev->bt_en, 1);
> +			/* Controller needs time to bootup. */
> +			msleep(150);
> +		}
> +	}
> +
> +	return ret;
> +}
> +

I expected qca_power_on() would be called from qca_open(), but as is
this would only work for ROME, and not WCN399x, which only enables
the regulators in qca_open(), qca_wcn3990_init() is called from
qca_setup(). Is there a particular reason for this assymmetry between
the ROME and WCN399x initialization (i.e. one is fully powered up after
open(), the other not)?
