Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A153245E0A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 19:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350200AbhKYStz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 13:49:55 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:54530 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232430AbhKYSrz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 13:47:55 -0500
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
        by mail.holtmann.org (Postfix) with ESMTPSA id 4F79ECECC5;
        Thu, 25 Nov 2021 19:44:42 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Optimizations in init sequence for
 WCN6750.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1637846230-4798-1-git-send-email-pharish@codeaurora.org>
Date:   Thu, 25 Nov 2021 19:44:41 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org,
        mcchou@chromium.org, saluvala@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <FA830939-AD92-47D0-A125-3543B89D7E2D@holtmann.org>
References: <1637846230-4798-1-git-send-email-pharish@codeaurora.org>
To:     pharish <pharish@codeaurora.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

> This change adds optimazation in init sequence for WCN6750.

you need to explain what you are doing.
> 
> Signed-off-by: pharish <pharish@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 18 +++++++++++-------
> 1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 6f44b26..4dedaaa 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1603,15 +1603,19 @@ static int qca_regulator_init(struct hci_uart *hu)
> 	 */
> 	qcadev = serdev_device_get_drvdata(hu->serdev);
> 	if (!qcadev->bt_power->vregs_on) {
> -		serdev_device_close(hu->serdev);
> +		if (qca_is_wcn399x(soc_type))
> +			serdev_device_close(hu->serdev);
> +
> 		ret = qca_regulator_enable(qcadev);
> 		if (ret)
> 			return ret;
> 
> -		ret = serdev_device_open(hu->serdev);
> -		if (ret) {
> -			bt_dev_err(hu->hdev, "failed to open port");
> -			return ret;
> +		if (qca_is_wcn399x(soc_type)) {
> +			ret = serdev_device_open(hu->serdev);
> +			if (ret) {
> +				bt_dev_err(hu->hdev, "failed to open port");
> +				return ret;
> +			}

I am really not doing this. You need to stop doing this SoC X or SoC Y crap. I said this before and I am saying this again, start from scratch and write a clean serdev only driver. Adding things to hci_qca is just a hack.

> 		}
> 	}
> 
> @@ -1635,9 +1639,8 @@ static int qca_regulator_init(struct hci_uart *hu)
> 		}
> 	}
> 
> -	qca_set_speed(hu, QCA_INIT_SPEED);
> -
> 	if (qca_is_wcn399x(soc_type)) {
> +		qca_set_speed(hu, QCA_INIT_SPEED);
> 		ret = qca_send_power_pulse(hu, true);
> 		if (ret)
> 			return ret;
> @@ -1648,6 +1651,7 @@ static int qca_regulator_init(struct hci_uart *hu)
> 	 * Without this, we will have RTS and CTS synchronization
> 	 * issues.
> 	 */
> +

Unrelated change.

> 	serdev_device_close(hu->serdev);
> 	ret = serdev_device_open(hu->serdev);
> 	if (ret) {

Regards

Marcel

