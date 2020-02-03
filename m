Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6861415035D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 10:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgBCJ3f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 04:29:35 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:23493 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726244AbgBCJ3c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 04:29:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580722171; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rVTQT/UDQokSpeOaMvofAY/Lfmv4L1fEaVGMooR99N0=;
 b=rkwAAsMuCfF9gbAAV5YpB/mjJVo/JP5JEhmi4kMZgUHBVgQMsu6Ohq4r3GTjZGTrcYG5un05
 GD3vW8m4y2P3AfAGNU790jqzZhufiR6fd0QHN/5UJ2koNfrVP97mYmIGD32U18kDVrhO+Qbf
 PrxhHxLWjdCczv87n58OHPeHbcc=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e37e7fa.7f8e35731ab0-smtp-out-n01;
 Mon, 03 Feb 2020 09:29:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6FB93C447A2; Mon,  3 Feb 2020 09:29:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B58EBC433CB;
        Mon,  3 Feb 2020 09:29:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 03 Feb 2020 14:59:28 +0530
From:   gubbaven@codeaurora.org
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, robh@kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, tientzu@chromium.org,
        seanpaul@chromium.org, rjliao@codeaurora.org, yshavit@google.com
Subject: Re: [PATCH v3] Bluetooth: hci_qca:Removed the function
 qca_setup_clock()
In-Reply-To: <1580717149-7609-1-git-send-email-gubbaven@codeaurora.org>
References: <1580717149-7609-1-git-send-email-gubbaven@codeaurora.org>
Message-ID: <fb372af8420a7af076ffbb5f44542497@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please discard this.I will be sending another patch set.

Regards,
Venkata.

On 2020-02-03 13:35, Venkata Lakshmi Narayana Gubba wrote:
> For enabling and disabling clocks, directly called the functions
> clk_prepare_enable() and clk_disable_unprepare() respectively.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 73706f3..eacc65b 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1738,15 +1738,6 @@ static int qca_power_off(struct hci_dev *hdev)
>  	return 0;
>  }
> 
> -static int qca_setup_clock(struct clk *clk, bool enable)
> -{
> -	if (enable)
> -		return clk_prepare_enable(clk);
> -
> -	clk_disable_unprepare(clk);
> -	return 0;
> -}
> -
>  static int qca_regulator_enable(struct qca_serdev *qcadev)
>  {
>  	struct qca_power *power = qcadev->bt_power;
> @@ -1764,7 +1755,7 @@ static int qca_regulator_enable(struct qca_serdev 
> *qcadev)
> 
>  	power->vregs_on = true;
> 
> -	ret = qca_setup_clock(qcadev->susclk, true);
> +	ret = clk_prepare_enable(qcadev->susclk);
>  	if (ret) {
>  		/* Turn off regulators to overcome power leakage */
>  		qca_regulator_disable(qcadev);
> @@ -1791,7 +1782,7 @@ static void qca_regulator_disable(struct
> qca_serdev *qcadev)
>  	power->vregs_on = false;
> 
>  	if (qcadev->susclk)
> -		qca_setup_clock(qcadev->susclk, false);
> +		clk_disable_unprepare(qcadev->susclk);
>  }
> 
>  static int qca_init_regulators(struct qca_power *qca,
