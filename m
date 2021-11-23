Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA11459CE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 08:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234193AbhKWHmz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 02:42:55 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:15713 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234153AbhKWHmy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 02:42:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637653186; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ul7uOqnovpx2YCZNGVIqqElo7gIUdQ7LE9k2Eky05A4=;
 b=ILbr7YwN5HTtigZBl7UBoILylXRUTfChOMqDZ3PvLL2+7UC7ffbXUoziOIkvP6PKD9R4MQH5
 xH4/93vKTiNVNqGSS/NjVtLvH/zfwlbq0/V3Y8BCukwVgZU8xANIzTetY3n00yb5VIU0iVhW
 B7er0gU/F65g/P+6pczl6Lbz8Kc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 619c9ac1db3ac5552afb1a90 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 07:39:45
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9448DC43616; Tue, 23 Nov 2021 07:39:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tjiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B9434C43618;
        Tue, 23 Nov 2021 07:39:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 23 Nov 2021 15:39:44 +0800
From:   tjiang@codeaurora.org
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Subject: Re: [PATCH v4] Bluetooth: btusb: re-definition for board_id in struct
 qca_version
In-Reply-To: <2659a5743ab560b2c89e341fc61d9cc4@codeaurora.org>
References: <2659a5743ab560b2c89e341fc61d9cc4@codeaurora.org>
Message-ID: <e801fd88e3a83b165e495757f65c0f86@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marcel:
   I modified the code as you required, could you help merge it ? thank 
you.

regards.
tim


On 2021-11-16 12:48, tjiang@codeaurora.org wrote:
> The board ID should be split into two bytes.
> The 1st byte is chip ID, and the 2nd byte is platform ID.
> For example, board ID 0x010A, 0x01 is platform ID. 0x0A is chip ID.
> we have several platforms, and platform IDs are continuously added.
> We would not distinguish different chips if we get these mixed up.
> Platform ID:
> 0x00 is for Mobile
> 0x01 is for X86
> 0x02 is for Automotive
> 0x03 is for Consumer electronic
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
>  drivers/bluetooth/btusb.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 46d892bbde62..c2a48824ab1e 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2883,7 +2883,8 @@ struct qca_version {
>  	__le32	rom_version;
>  	__le32	patch_version;
>  	__le32	ram_version;
> -	__le16	board_id;
> +	__u8	chip_id;
> +	__u8	platform_id;
>  	__le16	flag;
>  	__u8	reserved[4];
>  } __packed;
> @@ -3072,7 +3073,17 @@ static void btusb_generate_qca_nvm_name(char
> *fwname, size_t max_size,
>  	u16 flag = le16_to_cpu(ver->flag);
> 
>  	if (((flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> -		u16 board_id = le16_to_cpu(ver->board_id);
> +		/* The board_id should be split into two bytes
> +		 * The 1st byte is chip ID, and the 2nd byte is platform ID
> +		 * For example, board ID 0x010A, 0x01 is platform ID. 0x0A is chip 
> ID
> +		 * Currently we have several platforms, and platform IDs are
> continuously added.
> +		 * Platform ID:
> +		 * 0x00 is for Mobile
> +		 * 0x01 is for X86
> +		 * 0x02 is for Automotive
> +		 * 0x03 is for Consumer electronic
> +		 */
> +		u16 board_id = (ver->chip_id << 8) + ver->platform_id;
>  		const char *variant;
> 
>  		switch (le32_to_cpu(ver->ram_version)) {
