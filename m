Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29000864F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 16:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732722AbfHHO7N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 10:59:13 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42874 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732502AbfHHO7N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 10:59:13 -0400
Received: by mail-pg1-f194.google.com with SMTP id t132so44199800pgb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Aug 2019 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9+5/LdlgO80ifqp5Q3hDfZTLZi/NJfE6LXgD8QVEE/w=;
        b=k8Oj8SxZEsMEeHu0tBryjYG26kBKCLyUQPjfsuMKFkmh2q9AmRZebJwGgGQyksprkb
         ry14QCQKJ60PPHha1SPAM/xmqwrGV2IXMz4AKUcMn34h6MdwTC9RNHaJ9mqBJuw2VC2+
         LWQJZEiTLbSJB0l1rFABbOurAYvsapfo+I5cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9+5/LdlgO80ifqp5Q3hDfZTLZi/NJfE6LXgD8QVEE/w=;
        b=Lp4yXL2nRCJAQ8HR6afZGquraSXAXAiXmlL8cF6MCBIdn4nTqk571olWLxV6HehTZG
         jM4Vr+MrF7Kdfe6lwShVvy/Acp/gooZjWUIW2g56J2kBvmWx6kwLkxON/aoQp+c793JB
         OrCyje0n6yukftsSM33gkDKZW/6gee9g/nwyHKdDAKpyOa+xRNcwFZsQITvH/Y6qhHUt
         Vp0Q1sSbg1WqMcJkpjIEGFGq9Atmoyx5mivu5AdkKLUjPQmOwB50e32xWP75FRRj0U4l
         m2rgn9xyBWZCt0luaMgQb7Pr0lZECQzTM5YvbEDoamM5aCfLDn/8eogKGHN1kOvUX4pK
         5mfw==
X-Gm-Message-State: APjAAAXUbGMxhWV4Ur/28ZprN27kKU3WrPjvWV3kH7F9Zk0QrUl2DEPg
        zZQj6DfkrZ9EmAgRwg9QSkpEwA==
X-Google-Smtp-Source: APXvYqxGAiT4LhfRNYdQR7HAuFp10fpkI7UDH9UfUqZHjejYfguJUGHzkoIsYUFPClYRsEA3ortRKA==
X-Received: by 2002:aa7:8619:: with SMTP id p25mr15765287pfn.220.1565276353145;
        Thu, 08 Aug 2019 07:59:13 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id t8sm109639363pfq.31.2019.08.08.07.59.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 07:59:12 -0700 (PDT)
Date:   Thu, 8 Aug 2019 07:59:09 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Harish Bandi <c-hbandi@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, anubhavg@codeaurora.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: wait for Pre shutdown to command
 complete event before sending the Power off pulse
Message-ID: <20190808145909.GP250418@google.com>
References: <1565256353-4476-1-git-send-email-c-hbandi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1565256353-4476-1-git-send-email-c-hbandi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 08, 2019 at 02:55:53PM +0530, Harish Bandi wrote:
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
> +

The commit message does not mention this change, it only talks about
adding a delay.

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
