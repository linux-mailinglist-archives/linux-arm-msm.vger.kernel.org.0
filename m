Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24CD1E4AE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 18:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbgE0Qsf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 12:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728384AbgE0Qsf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 12:48:35 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4A2C03E97D
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 09:48:34 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z64so7529027pfb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 09:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=za6ARY0VBuGDTK0WGdeuye4DkGA3nwoOEXEfB7D03/A=;
        b=U7zKVOK36CSiGIkWO9PzuTCRy3IC1iPrjzBXceo3rq9D0YjiV93Th1i4HieKoxcWZS
         tdxcvaUXzWo49AqA6c4q1oDWyoipxbfpigrbdigyosMsvBQPLdEjWMY3txVgeQOumcRa
         npP3tepagkRWOw7OcG7SENeSHoFY5soxlHR6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=za6ARY0VBuGDTK0WGdeuye4DkGA3nwoOEXEfB7D03/A=;
        b=JwqAxN74CDoZFh/VAmP6Lw8W1LZ0leKIl6fxLZTuI8Ku96NTNeIPtiA+qOIJHvD7/c
         b5B2rRiYbbDKZuFETXBd9Q9enZApToWSOt2JBrYf63FXaLWQnZUcRa/L5lVpcFGzj0sS
         SRp2URw15plfOeCVtx1YypEv7vnqrQlp7JEpkvhDP4Ar99CfXs1AVoOisuNSZUA0fBV+
         2hmCV4mlaDCxGOYMth5BV+egn4GVdCwNTVb3VQA+kZQyi7zsVKLBrcDgzNGa2FDVYeNq
         BheeaTbRti46NIJaXMXtCtCbsb+mMH3l3RFuGQrtVQDbxJZtrjLT2kp2CxIMVQr7whWd
         m3tA==
X-Gm-Message-State: AOAM532vt9TMqhZ87GmpyjjXlEINsUTzG5O0fH04y0w01HX33RZm3/lB
        oF2u/ltTlhgg6A0GW7gM2J8WdPEqt58=
X-Google-Smtp-Source: ABdhPJyqb0q4qiRLqAqHn23udCo2/NxZz9dVgFjpoD6PNAsO0erwwoT8gSf22MZnl67Bn4/BWzWBvA==
X-Received: by 2002:a63:4d5a:: with SMTP id n26mr4999360pgl.85.1590598114452;
        Wed, 27 May 2020 09:48:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id y65sm2502124pfb.76.2020.05.27.09.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 09:48:33 -0700 (PDT)
Date:   Wed, 27 May 2020 09:48:32 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org
Subject: Re: [PATCH v3] bluetooth: hci_qca: Fix qca6390 enable failure after
 warm reboot
Message-ID: <20200527164832.GH4525@google.com>
References: <1590546759-27387-1-git-send-email-zijuhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1590546759-27387-1-git-send-email-zijuhu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

On Wed, May 27, 2020 at 10:32:39AM +0800, Zijun Hu wrote:
> Warm reboot can not restore qca6390 controller baudrate
> to default due to lack of controllable BT_EN pin or power
> supply, so fails to download firmware after warm reboot.
> 
> Fixed by sending EDL_SOC_RESET VSC to reset controller
> within added device shutdown implementation.
> 
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index e4a6823..4b6f8b6 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1975,6 +1975,34 @@ static void qca_serdev_remove(struct serdev_device *serdev)
>  	hci_uart_unregister_device(&qcadev->serdev_hu);
>  }
>  
> +static void qca_serdev_shutdown(struct device *dev)
> +{
> +	int ret;
> +	int timeout = msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS);
> +	struct serdev_device *serdev = to_serdev_device(dev);
> +	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
> +	const u8 ibs_wake_cmd[] = { 0xFD };
> +	const u8 edl_reset_soc_cmd[] = { 0x01, 0x00, 0xFC, 0x01, 0x05 };
> +
> +	if (qcadev->btsoc_type == QCA_QCA6390) {
> +		serdev_device_write_flush(serdev);
> +		serdev_device_write_buf(serdev,
> +				ibs_wake_cmd, sizeof(ibs_wake_cmd));
> +		serdev_device_wait_until_sent(serdev, timeout);

Why no check of the return value of serdev_device_write_buf() here,
does it make sense to continue if sending the wakeup command failed?

Couldn't serdev_device_write() be used instead of the _write_buf() +
_wait_until_sent() combo?

> +		usleep_range(8000, 10000);
> +
> +		serdev_device_write_flush(serdev);

I suppose the flush is done because _wait_until_sent() could have timed out.
Another reason to use _device_write() (if suitable), since it returns
-ETIMEDOUT in that case?

> +		ret = serdev_device_write_buf(serdev,
> +				edl_reset_soc_cmd, sizeof(edl_reset_soc_cmd));
> +		if (ret < 0) {
> +			BT_ERR("QCA send EDL_RESET_REQ error: %d", ret);
> +			return;
> +		}
> +		serdev_device_wait_until_sent(serdev, timeout);
> +		usleep_range(8000, 10000);
> +	}
> +}
> +
>  static int __maybe_unused qca_suspend(struct device *dev)
>  {
>  	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
> @@ -2100,6 +2128,7 @@ static struct serdev_device_driver qca_serdev_driver = {
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
