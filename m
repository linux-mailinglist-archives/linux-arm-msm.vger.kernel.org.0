Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A81A345E0B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 19:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242743AbhKYSvv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 13:51:51 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:33937 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350178AbhKYStu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 13:49:50 -0500
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
        by mail.holtmann.org (Postfix) with ESMTPSA id B86A2CECC6;
        Thu, 25 Nov 2021 19:46:37 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [RFC PATCH v1] Bluetooth: hci_qca: Add new hci_uart proto
 callback to power off voltage sources
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1637849179-18382-1-git-send-email-saluvala@codeaurora.org>
Date:   Thu, 25 Nov 2021 19:46:37 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org,
        mcchou@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <655A8E36-F89F-4A4D-80A0-5223EBB638CE@holtmann.org>
References: <1637849179-18382-1-git-send-email-saluvala@codeaurora.org>
To:     saluvala <saluvala@codeaurora.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

> This change adds a new hci_uart proto callback entry i.e., power off.
> This poweroff Callback is exposed to the drivers and called during BT OFF
> immediately after port close. This will ensure that Voltages sources are
> powered off after sending all the data before port close. Previously as
> part of hdev shutdown callback, voltages sources are powered off. But we
> have seen cases where post shutdown sequence completion some packets which
> are already queued are sent to UART. As controller is powered off, UART
> can’t send the data out or it is sending partial data due RTS line high.
> 
> Signed-off-by: saluvala <saluvala@codeaurora.org>

this really has to stop. Read the documentation on how to submit patches and start configuring your .gitconfig correct so that you include you clear text name etc.

> ---
> drivers/bluetooth/hci_qca.c    | 26 +++++++++++++++++++-------
> drivers/bluetooth/hci_serdev.c |  3 +++
> drivers/bluetooth/hci_uart.h   |  1 +
> 3 files changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index dd768a8..e1dee75 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -231,6 +231,7 @@ static int qca_regulator_enable(struct qca_serdev *qcadev);
> static void qca_regulator_disable(struct qca_serdev *qcadev);
> static void qca_power_shutdown(struct hci_uart *hu);
> static int qca_power_off(struct hci_dev *hdev);
> +static int qca_power_off_reg(struct hci_uart *hu);
> static void qca_controller_memdump(struct work_struct *work);
> 
> static enum qca_btsoc_type qca_soc_type(struct hci_uart *hu)
> @@ -554,7 +555,6 @@ static void qca_controller_memdump_timeout(struct work_struct *work)
> 	mutex_unlock(&qca->hci_memdump_lock);
> }
> 
> -
> /* Initialize protocol */
> static int qca_open(struct hci_uart *hu)
> {
> @@ -1815,6 +1815,7 @@ static const struct hci_uart_proto qca_proto = {
> 	.flush		= qca_flush,
> 	.setup		= qca_setup,
> 	.recv		= qca_recv,
> +	.poweroff	= qca_power_off_reg,
> 	.enqueue	= qca_enqueue,
> 	.dequeue	= qca_dequeue,
> };

I am not extending this. Write a clean serdev only driver for this hardware.

Regards

Marcel

