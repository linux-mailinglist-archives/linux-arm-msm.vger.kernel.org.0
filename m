Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4F9391B73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 17:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235299AbhEZPQ7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 11:16:59 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58760 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233431AbhEZPQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 11:16:53 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 9C28FCED1D;
        Wed, 26 May 2021 17:23:14 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v2] Bluetooth: btusb: fix bt fiwmare downloading failure
 issue for qca btsoc.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1622008265-18727-1-git-send-email-zijuhu@codeaurora.org>
Date:   Wed, 26 May 2021 17:15:18 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, tjiang@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <3E1910BA-9116-438F-91F9-AD3C3622668B@holtmann.org>
References: <1622008265-18727-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> This is btsoc timing issue, after host start to downloading bt firmware,
> ep2 need time to switch from function acl to function dfu, so host add
> 20ms delay as workaround.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 5245714..b0743db 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -4064,6 +4064,7 @@ static int btusb_setup_qca_download_fw(struct hci_dev *hdev,
> 
> 	sent += size;
> 	count -= size;

you need a comment here explain why this is needed.

> +	msleep(20);
> 
> 	while (count) {
> 		size = min_t(size_t, count, QCA_DFU_PACKET_LEN);

Regards

Marcel

