Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B98D8606D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 12:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731782AbfHHKz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 06:55:59 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43634 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbfHHKz7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 06:55:59 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A80BB60398; Thu,  8 Aug 2019 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565261758;
        bh=RyE30W0O6ROzUh+uCUrmfEWFlAw7l82uw+UovVXzR2w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WhKYtRwpUVT+oFtBvsqBg2coJ+vg6GMlbCZsoEOEY/D4J5PJxVOWaXLROYeW+khbz
         pFYRrRaWU0DZi1SkmCSeg/h4niwr//6RtlsoswOeTVUeGORTTPIRY18C0tKcxQMEVo
         5ROk1VgodxqP0VzKkulN0Q5zxPil4Z5T8F0Lulus=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id F3F306037C;
        Thu,  8 Aug 2019 10:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565261758;
        bh=RyE30W0O6ROzUh+uCUrmfEWFlAw7l82uw+UovVXzR2w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WhKYtRwpUVT+oFtBvsqBg2coJ+vg6GMlbCZsoEOEY/D4J5PJxVOWaXLROYeW+khbz
         pFYRrRaWU0DZi1SkmCSeg/h4niwr//6RtlsoswOeTVUeGORTTPIRY18C0tKcxQMEVo
         5ROk1VgodxqP0VzKkulN0Q5zxPil4Z5T8F0Lulus=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Aug 2019 16:25:57 +0530
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     Harish Bandi <c-hbandi@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        anubhavg@codeaurora.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: wait for Pre shutdown to command
 complete event before sending the Power off pulse
In-Reply-To: <1565256353-4476-1-git-send-email-c-hbandi@codeaurora.org>
References: <1565256353-4476-1-git-send-email-c-hbandi@codeaurora.org>
Message-ID: <83f6833dd901e42e2f86d20ff0898526@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Harish,

On 2019-08-08 14:55, Harish Bandi wrote:
> When SoC receives pre shut down command, it share the same
> with other COEX shared clients. So SoC needs a short
> time after sending VS pre shutdown command before
> turning off the regulators and sending the power off pulse.
> 
> Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
> ---
>  drivers/bluetooth/btqca.c   | 5 +++--
>  drivers/bluetooth/hci_qca.c | 2 ++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 2221935..f20991e 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -106,8 +106,9 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
> 
>  	bt_dev_dbg(hdev, "QCA pre shutdown cmd");
> 
> -	skb = __hci_cmd_sync(hdev, QCA_PRE_SHUTDOWN_CMD, 0,
> -				NULL, HCI_INIT_TIMEOUT);
> +	skb = __hci_cmd_sync_ev(hdev, QCA_PRE_SHUTDOWN_CMD, 0,
> +				NULL, HCI_EV_CMD_COMPLETE, HCI_INIT_TIMEOUT);

[Bala]: nit: can you also add reason in commit text for adding 
HCI_EV_CMD_COMPLETE

> +
>  	if (IS_ERR(skb)) {
>  		err = PTR_ERR(skb);
>  		bt_dev_err(hdev, "QCA preshutdown_cmd failed (%d)", err);
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 16db6c0..566aa28 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1386,6 +1386,8 @@ static int qca_power_off(struct hci_dev *hdev)
>  	/* Perform pre shutdown command */
>  	qca_send_pre_shutdown_cmd(hdev);
> 
> +	usleep_range(8000, 10000);
> +
>  	qca_power_shutdown(hu);
>  	return 0;
>  }

Reviewed-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>

-- 
Regards
Balakrishna.
