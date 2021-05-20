Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D96538B2F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 17:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbhETPXC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 11:23:02 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:55703 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242827AbhETPW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 11:22:57 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1921FCECEA;
        Thu, 20 May 2021 17:29:25 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH v1] Bluetooth: btusb: fix bt fiwmare downloading failure
 issue for qca btsoc.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1621304202-5675-1-git-send-email-zijuhu@codeaurora.org>
Date:   Thu, 20 May 2021 17:21:30 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, tjiang@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <CE9E21DA-4FFE-455A-BFC3-EF4E11509CF7@holtmann.org>
References: <1621304202-5675-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> This is btsoc timing issue, host add 20ms delay as workaround.
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
> +	msleep(20);

please add a comment and more details on why this is needed.

Regards

Marcel

