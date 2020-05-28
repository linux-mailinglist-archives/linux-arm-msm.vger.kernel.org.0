Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D3E1E6738
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 18:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404913AbgE1QQd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 12:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404872AbgE1QQa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 12:16:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16AB7C08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 09:16:30 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 5so3302292pjd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S76ddrdGq/cBbQZ5tUQB2unFDdKjzHHbrT8hpYe9YzM=;
        b=JiWpVhyw1smRR696kDsmG/PvNo7sZu5e24qbl+VPXErlBMim+HjZG2Z2tGTg+EQ3c6
         5K/pnLuPLxYJWoQDn9cFgvvzrAYr2oaWTol8ilzpzHKI9n+DCLhZPLSDfA/RFV9JAUDD
         dNZ7x5M2uU8VqhhdK5Om372FdLpWT3N2o341M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S76ddrdGq/cBbQZ5tUQB2unFDdKjzHHbrT8hpYe9YzM=;
        b=G0LgSv3L+5UKIimT7/5WNnFs0lWbWMStUckEo9tkLTXlnrfl3P8mvpulov9HoAgy0b
         eq2qV/8o0K5eJOYZGhwmoiEq2wtX52Mp4y+tiqBwbjn+EvElJHtjtTxu6IHdvIANxkXG
         R+OjX5IKpNvN9ZUGIJw/FIoMFf4SC7K8IjangvJCztnk6V1zLTMJ/+wA1LEIiqAZb8nx
         5Ka6hY+K8do0+wmZyqGvh+vvBU/KVDDvkZRDEUmjTSUN0CzN7l3eVpFfX4tbZy/2KGFq
         WK4l8cUzW2ocf3If8Jy2QlI7tzfgGd4G9uET2FP3gW8gil1DVwWTgPsU8Fg9rmiU66UG
         qK9Q==
X-Gm-Message-State: AOAM532wLhriGk7bkdcGRvc9d7PTTIPdO0lW47nA7FqZlJgOzh0OQps9
        lKkc1ADhyFwWj7pwCopx5qynfw==
X-Google-Smtp-Source: ABdhPJx8NV9kadMCeflkmPi1yiAesNMW3uLpAf3Uo3Djp1f3fesJ94fSB9RULJ/7tXTLkUaRNCdO2A==
X-Received: by 2002:a17:902:b289:: with SMTP id u9mr4327057plr.138.1590682589611;
        Thu, 28 May 2020 09:16:29 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id lj12sm5932279pjb.21.2020.05.28.09.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 09:16:28 -0700 (PDT)
Date:   Thu, 28 May 2020 09:16:27 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org
Subject: Re: [PATCH v1] bluetooth: hci_qca: Fix suspend/resume functionality
 failure
Message-ID: <20200528161627.GK4525@google.com>
References: <1590662302-10102-1-git-send-email-zijuhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1590662302-10102-1-git-send-email-zijuhu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

On Thu, May 28, 2020 at 06:38:22PM +0800, Zijun Hu wrote:
> @dev parameter of qca_suspend()/qca_resume() represents
> serdev_device, but it is mistook for hci_dev and causes
> succedent unexpected memory access.
> 
> Fix by taking @dev as serdev_device.
> 
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>

Please add:

Fixes: 41d5b25fed0 ("Bluetooth: hci_qca: add PM support")

and add stable@kernel.org to cc:

> ---
>  drivers/bluetooth/hci_qca.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index e4a6823..c159161 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1977,8 +1977,10 @@ static void qca_serdev_remove(struct serdev_device *serdev)
>  
>  static int __maybe_unused qca_suspend(struct device *dev)
>  {
> -	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
> -	struct hci_uart *hu = hci_get_drvdata(hdev);
> +	struct serdev_device *serdev = to_serdev_device(dev);
> +	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
> +	struct hci_uart *hu = &qcadev->serdev_hu;
> +	struct hci_dev *hdev __maybe_unused = hu->hdev;

hdev is not used, please remove

>  	struct qca_data *qca = hu->priv;
>  	unsigned long flags;
>  	int ret = 0;
> @@ -2057,8 +2059,10 @@ static int __maybe_unused qca_suspend(struct device *dev)
>  
>  static int __maybe_unused qca_resume(struct device *dev)
>  {
> -	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
> -	struct hci_uart *hu = hci_get_drvdata(hdev);
> +	struct serdev_device *serdev = to_serdev_device(dev);
> +	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
> +	struct hci_uart *hu = &qcadev->serdev_hu;
> +	struct hci_dev *hdev __maybe_unused = hu->hdev;

hdev is not used, please remove

>  	struct qca_data *qca = hu->priv;
>  
>  	clear_bit(QCA_SUSPENDING, &qca->flags);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
> 
