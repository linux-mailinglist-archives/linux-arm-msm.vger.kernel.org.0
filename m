Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13A9812EA01
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 19:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgABSlT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 13:41:19 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:52691 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbgABSlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 13:41:18 -0500
Received: by mail-pj1-f68.google.com with SMTP id a6so3596525pjh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2020 10:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2P1i80VyW1xqH3NqUoar2oHl+i0gCk3q+IZQrBX1Ayc=;
        b=EE7NFbPxMgwS+IAAlM3nTY4eDNc+9iyOzif9o6qghjLAOe8EAdCxMP9fyx9mC4y6JY
         +7a+GihvaTg5XuNxTVC+mIZeGY78rUGUngCaWI3n2aOF5GjC3DFgFBClGu8hUyUaho7q
         H1t1WoYJ3m8cGNSghV1Tdhy3nn0q4hlrdWj8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2P1i80VyW1xqH3NqUoar2oHl+i0gCk3q+IZQrBX1Ayc=;
        b=oPZJA6dG9ZxKzg70HA+LHMy/HSBYAZW+KvNvfNmd0YLK3buiGmAhXPQe7TKfr+EE8w
         I9n0rwDtzOmBeUbPbVNt2m4OeniCQSUsiu0ytChpnRJkcJdd8UQMXWlzEHrwVzov9oSk
         1+Ljie2PKVJ2zIVyIl0lQzN7/R+E3sHPUDRkIT9V/pA3Z7QTSgjYhSuAvVgyDBAaD/9K
         hZdIoAq/PSaynS/ixx6oan4N1hEr1lm9PIRVt0wKiC9P6jxTqu7UbEfG09X12UWp3vAS
         +7Vouygc1Uc9OctDIIbt+hom29/hzfLl7xL8HrJsHMlSO6IWKM4agkWauZglubXPFbsy
         8s0A==
X-Gm-Message-State: APjAAAUN01qm2J/UOjNpO0B98VUZUuXcnn6RPz0qbt4RNXn7H5BTOXup
        TjRufAmJx2dmV+l7YHOVDQz9QBsMaJ8=
X-Google-Smtp-Source: APXvYqzobi0Z4e4D0XEc3q+qOlwqMndFh8kYSP6PuxP7Mmeb303hLQ8mU0YDTBBywtGpXI9B52/RWA==
X-Received: by 2002:a17:90a:b10a:: with SMTP id z10mr21795407pjq.115.1577990478311;
        Thu, 02 Jan 2020 10:41:18 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id k3sm61963109pgc.3.2020.01.02.10.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2020 10:41:17 -0800 (PST)
Date:   Thu, 2 Jan 2020 10:41:16 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/4] Bluetooth: hci_qca: Retry btsoc initialize when
 it fails
Message-ID: <20200102184116.GA89495@google.com>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20191227072130.29431-1-rjliao@codeaurora.org>
 <20191227072130.29431-2-rjliao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191227072130.29431-2-rjliao@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

On Fri, Dec 27, 2019 at 03:21:28PM +0800, Rocky Liao wrote:
> This patch adds the retry of btsoc initialization when it fails. There are
> reports that the btsoc initialization may fail on some platforms but the
> repro ratio is very low. The failure may be caused by UART, platform HW or
> the btsoc itself but it's very difficlut to root cause, given the repro
> ratio is very low. Add a retry for the btsoc initialization will resolve
> most of the failures and make Bluetooth finally works.

Is this problem specific to a certain chipset?

What are the symptoms?

> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> 
> Changes in v2: None
> Changes in v3: None
> 
>  drivers/bluetooth/hci_qca.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 43fd84028786..45042aa27fa4 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -53,6 +53,9 @@
>  /* Controller debug log header */
>  #define QCA_DEBUG_HANDLE	0x2EDC
>  
> +/* max retry count when init fails */
> +#define QCA_MAX_INIT_RETRY_COUNT 3

nit: MAX_RETRIES or MAX_INIT_RETRIES?

The QCA prefix just adds noise here IMO, there's no need to disambiguate
the constant from other retries since it is defined in hci_qca.c.

> +
>  enum qca_flags {
>  	QCA_IBS_ENABLED,
>  	QCA_DROP_VENDOR_EVENT,
> @@ -1257,7 +1260,9 @@ static int qca_setup(struct hci_uart *hu)
>  {
>  	struct hci_dev *hdev = hu->hdev;
>  	struct qca_data *qca = hu->priv;
> +	struct qca_serdev *qcadev;
>  	unsigned int speed, qca_baudrate = QCA_BAUDRATE_115200;
> +	unsigned int init_retry_count = 0;

nit: the name is a bit clunky, how about 'retries'?

>  	enum qca_btsoc_type soc_type = qca_soc_type(hu);
>  	const char *firmware_name = qca_get_firmware_name(hu);
>  	int ret;
> @@ -1275,6 +1280,7 @@ static int qca_setup(struct hci_uart *hu)
>  	 */
>  	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
>  
> +retry:
>  	if (qca_is_wcn399x(soc_type)) {
>  		bt_dev_info(hdev, "setting up wcn3990");
>  
> @@ -1293,6 +1299,12 @@ static int qca_setup(struct hci_uart *hu)
>  			return ret;
>  	} else {
>  		bt_dev_info(hdev, "ROME setup");
> +		if (hu->serdev) {
> +			qcadev = serdev_device_get_drvdata(hu->serdev);
> +			gpiod_set_value_cansleep(qcadev->bt_en, 1);
> +			/* Controller needs time to bootup. */
> +			msleep(150);

Shouldn't this be in qca_power_on(), analogous to the power off code from
"[1/4]Bluetooth: hci_qca: Add QCA Rome power off support to the
qca_power_off()"?

qca_power_on() should then also be called for ROME. If you opt for this it
should be done in a separate patch, or possibly merged into the one
mentioned above.

> +		}
>  		qca_set_speed(hu, QCA_INIT_SPEED);
>  	}
>  
> @@ -1329,6 +1341,20 @@ static int qca_setup(struct hci_uart *hu)
>  		 * patch/nvm-config is found, so run with original fw/config.
>  		 */
>  		ret = 0;
> +	} else {
> +		if (init_retry_count < QCA_MAX_INIT_RETRY_COUNT) {
> +			qca_power_off(hdev);
> +			if (hu->serdev) {
> +				serdev_device_close(hu->serdev);
> +				ret = serdev_device_open(hu->serdev);
> +				if (ret) {
> +					bt_dev_err(hu->hdev, "open port fail");

nit: "failed to open port"
