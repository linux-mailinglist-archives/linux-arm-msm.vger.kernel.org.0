Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F861EE7FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 17:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729544AbgFDPrx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 11:47:53 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:54396 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729346AbgFDPrw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 11:47:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591285672; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=h8D99gB6H9xf8a2OzankwEOfZlf6igNRbDESI7T7Zx4=;
 b=XtFOq2IUE+T2QS8cZmXuPnG9fHI+cj/tEsOxfJFPVX4K47TS8/pAd9FIXEr8GdXHeEeYe27r
 3THKiPOdUwIFLN0nOpA+++3+3cxwjQexts/aZjeAoOmVQPWe02+uR9/7BJZ9fTEXyv6uWy+Z
 w4f8CTgKn64sUKLLgwCL9AUKXNc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ed9179ec0031c71c2a191d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Jun 2020 15:47:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8BE02C43387; Thu,  4 Jun 2020 15:47:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CFF16C433CA;
        Thu,  4 Jun 2020 15:47:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 04 Jun 2020 21:17:36 +0530
From:   bgodavar@codeaurora.org
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, tientzu@chromium.org,
        seanpaul@chromium.org, rjliao@codeaurora.org, yshavit@google.com,
        abhishekpandit@chromium.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Fix double free during SSR timeout
In-Reply-To: <1591279032-7527-1-git-send-email-gubbaven@codeaurora.org>
References: <1591279032-7527-1-git-send-email-gubbaven@codeaurora.org>
Message-ID: <9baddcafef3c1ecad1f968e3adaf3201@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-04 19:27, Venkata Lakshmi Narayana Gubba wrote:
> Due to race conditions between qca_hw_error and qca_controller_memdump
> during SSR timeout,the same pointer is freed twice. Which results to
> double free error. Now a lock is acquired while SSR state moved to 
> timeout.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 836949d..9110775 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -983,8 +983,11 @@ static void qca_controller_memdump(struct
> work_struct *work)
>  	while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
> 
>  		mutex_lock(&qca->hci_memdump_lock);
> -		/* Skip processing the received packets if timeout detected. */
> -		if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) {
> +		/* Skip processing the received packets if timeout detected
> +		 * or memdump collection completed.
> +		 */
> +		if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT ||
> +		    qca->memdump_state == QCA_MEMDUMP_COLLECTED) {
>  			mutex_unlock(&qca->hci_memdump_lock);
>  			return;
>  		}
> @@ -1485,7 +1488,7 @@ static void qca_hw_error(struct hci_dev *hdev, u8 
> code)
>  {
>  	struct hci_uart *hu = hci_get_drvdata(hdev);
>  	struct qca_data *qca = hu->priv;
> -	struct qca_memdump_data *qca_memdump = qca->qca_memdump;
> +	struct qca_memdump_data *qca_memdump = NULL;
>  	char *memdump_buf = NULL;
> 
>  	set_bit(QCA_HW_ERROR_EVENT, &qca->flags);
> @@ -1509,9 +1512,10 @@ static void qca_hw_error(struct hci_dev *hdev, 
> u8 code)
>  		qca_wait_for_dump_collection(hdev);
>  	}
> 
> +	mutex_lock(&qca->hci_memdump_lock);
>  	if (qca->memdump_state != QCA_MEMDUMP_COLLECTED) {
>  		bt_dev_err(hu->hdev, "clearing allocated memory due to memdump 
> timeout");
> -		mutex_lock(&qca->hci_memdump_lock);
> +		qca_memdump = qca->qca_memdump;
>  		if (qca_memdump)
>  			memdump_buf = qca_memdump->memdump_buf_head;
>  		vfree(memdump_buf);
> @@ -1520,8 +1524,13 @@ static void qca_hw_error(struct hci_dev *hdev, 
> u8 code)
>  		qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
>  		cancel_delayed_work(&qca->ctrl_memdump_timeout);
>  		skb_queue_purge(&qca->rx_memdump_q);
> -		mutex_unlock(&qca->hci_memdump_lock);
> +	}
> +	mutex_unlock(&qca->hci_memdump_lock);
> +
> +	if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT ||
> +	    qca->memdump_state == QCA_MEMDUMP_COLLECTED) {
>  		cancel_work_sync(&qca->ctrl_memdump_evt);
> +		skb_queue_purge(&qca->rx_memdump_q);
>  	}
> 
>  	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);

Reviewed-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
