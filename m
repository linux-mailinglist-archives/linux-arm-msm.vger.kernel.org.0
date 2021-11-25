Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBD2645E09D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 19:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242889AbhKYSsE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 13:48:04 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:43169 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhKYSqE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 13:46:04 -0500
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1FE51CECC4;
        Thu, 25 Nov 2021 19:42:51 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Stop IBS timer during BT OFF
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1637846230-4798-2-git-send-email-pharish@codeaurora.org>
Date:   Thu, 25 Nov 2021 19:42:50 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org,
        mcchou@chromium.org, saluvala@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <A078C973-AAAF-4BD2-85DA-F8017CE89012@holtmann.org>
References: <1637846230-4798-1-git-send-email-pharish@codeaurora.org>
 <1637846230-4798-2-git-send-email-pharish@codeaurora.org>
To:     pharish <pharish@codeaurora.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

> This change stops IBS timers during BT OFF.
> 
> Signed-off-by: pharish <pharish@codeaurora.org>

clear name please.

> ---
> drivers/bluetooth/hci_qca.c | 3 +++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index dd768a8..6f44b26 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1928,6 +1928,9 @@ static int qca_power_off(struct hci_dev *hdev)
> 	hu->hdev->hw_error = NULL;
> 	hu->hdev->cmd_timeout = NULL;
> 
> +	mod_timer(&qca->tx_idle_timer, 0);
> +	mod_timer(&qca->wake_retrans_timer, 0);
> +

And I would really prefer if this gets changed to use a workqueue instead of a timer.

Regards

Marcel

