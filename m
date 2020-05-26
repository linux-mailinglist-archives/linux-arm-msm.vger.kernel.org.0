Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637F11E258A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 17:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbgEZPe3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 11:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729818AbgEZPe3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 11:34:29 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1809EC03E96F
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 08:34:29 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id s10so10239956pgm.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8W11mCFaZlqqgwjd6pr/5BoHKN+oaQPu3yE26VkZIxk=;
        b=kgFR34KBsx0oI1+MKKstfa5lW1H5kQ16Y3jO42RlsqGTyZe7QT5tmf1xmKgWNZI6ub
         XyrEvbKspvwFeI1YqvY+nWDW2SVEsc2mJiHS0OKG0sbHzL+pYMGEGFTVbP8Y9eVmH9Wc
         o65pnCp6nWc1vf1fxko35nOU3W0XLc3OwdzFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8W11mCFaZlqqgwjd6pr/5BoHKN+oaQPu3yE26VkZIxk=;
        b=GAdarZp+P6Ws/t/x4gAK9UfjTvE5PMwPgG325atNlcKlYiBkGbFJxWryrk6AM39PsP
         nkvBmj8N26dQFxoAJjQTEwyt2xrN0bvCKrVvOoHLcUsKD/Iu+EilPEv9ftUHOhETO9wz
         Fs2/zWd7f8b8tXkUafWg3lEQuiuxobRnJ1U9xjm0tRcDdWkjMWWUzk93CkUBbVUKnBLO
         OM1s2miJDP/Xknwy46vQ18qhPqiX0eaW2QSeqyFZlNXqWKxzx/+0GoVuZU9VghITrAei
         u6ysoZCF7CQtnUfvosPC0pWSb4aCSNlhIXz/styCWkNbCExzvVpHFuHDtZBPhvJw9RzQ
         8DWg==
X-Gm-Message-State: AOAM533EfRB4bHYZW5Z+ZexPI4W1z/EGrOD1xLyBPrklFLZEAfYgS+bg
        YGaQa7bQMSzWxWh8xBPL3aVKZg==
X-Google-Smtp-Source: ABdhPJwvQUuJk+3JmCR8WIBdZSU/GvEbA9MR1r4bCTHrtiDU0sJOoFq1RbVUiRntAYHcL1SgZGUWCA==
X-Received: by 2002:a63:c34a:: with SMTP id e10mr1608669pgd.412.1590507268516;
        Tue, 26 May 2020 08:34:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id r1sm83636pgb.37.2020.05.26.08.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 08:34:27 -0700 (PDT)
Date:   Tue, 26 May 2020 08:34:25 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org
Subject: Re: [PATCH v2] bluetooth: hci_qca: Fix qca6390 enable failure after
 warm reboot
Message-ID: <20200526153425.GD4525@google.com>
References: <1590461850-9908-1-git-send-email-zijuhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1590461850-9908-1-git-send-email-zijuhu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 26, 2020 at 10:57:30AM +0800, Zijun Hu wrote:
> Warm reboot can not restore qca6390 controller baudrate
> to default due to lack of controllable BT_EN pin or power
> supply, so fails to download firmware after warm reboot.
> 
> Fixed by sending EDL_SOC_RESET VSC to reset controller
> within added device shutdown implementation.
> 
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index e4a6823..b479e51 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1975,6 +1975,32 @@ static void qca_serdev_remove(struct serdev_device *serdev)
>  	hci_uart_unregister_device(&qcadev->serdev_hu);
>  }
>  
> +static void qca_serdev_shutdown(struct device *dev)
> +{
> +	int res;

nit: 'ret' would be a more standard name

> +	int timeout = msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS);
> +	struct serdev_device *serdev = to_serdev_device(dev);
> +	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
> +	const u8 ibs_wake_cmd[] = { 0xFD };
> +	const u8 edl_reset_soc_cmd[] = { 0x01, 0x00, 0xFC, 0x01, 0x05 };
> +
> +	if (qcadev->btsoc_type == QCA_QCA6390) {
> +		serdev_device_write_flush(serdev);
> +		res = serdev_device_write_buf(serdev,
> +				ibs_wake_cmd, sizeof(ibs_wake_cmd));
> +		BT_DBG("%s: send ibs_wake_cmd res = %d", __func__, res);

Why use BT_DBG regardless of the result, instead of using BT_ERR/WARN only
in the failure case? And does it actually make sense to continue in case of
an error?

> +		serdev_device_wait_until_sent(serdev, timeout);
> +		usleep_range(8000, 10000);
> +
> +		serdev_device_write_flush(serdev);
> +		res = serdev_device_write_buf(serdev,
> +				edl_reset_soc_cmd, sizeof(edl_reset_soc_cmd));
> +		BT_DBG("%s: send edl_reset_soc_cmd res = %d", __func__, res);

ditto

> +		serdev_device_wait_until_sent(serdev, timeout);
> +		usleep_range(8000, 10000);
> +	}
> +}
> +
>  static int __maybe_unused qca_suspend(struct device *dev)
>  {
>  	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
> @@ -2100,6 +2126,7 @@ static struct serdev_device_driver qca_serdev_driver = {
>  		.name = "hci_uart_qca",
>  		.of_match_table = of_match_ptr(qca_bluetooth_of_match),
>  		.acpi_match_table = ACPI_PTR(qca_bluetooth_acpi_match),
> +		.shutdown = qca_serdev_shutdown,
>  		.pm = &qca_pm_ops,
>  	},
>  };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
> 
