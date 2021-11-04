Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033E8444F6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 08:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhKDHDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 03:03:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55922 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230319AbhKDHDQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 03:03:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636009239; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wCODyeGtt62o85Tp9gVUq0qFHjGRtF5/l1WWF1gUykw=;
 b=YNVZxTXQjFqilZW3V6a6J/HrR0hKurkQZC9zjJ5bR3hhM/0oYgiGQu4i+wPB1OHpQ6QKMIQ9
 5ZDjU0Ksbi2hjXsZVUPlsQKAbAiXqaH3B8l39cMtELw4nlq7RpGruj7v0lWvAo3jpS64Pp1l
 gY8TYRlbWD1T+jQkKT/1KBEojTg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6183850d7d93184cc71f6ff1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Nov 2021 07:00:29
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8941EC4360C; Thu,  4 Nov 2021 07:00:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tjiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B731EC43460;
        Thu,  4 Nov 2021 07:00:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 04 Nov 2021 15:00:28 +0800
From:   tjiang@codeaurora.org
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        c-hbandi@codeaurora.org, Hemantg <hemantg@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rocky Liao <rjliao@codeaurora.org>, zijuhu@codeaurora.org
Subject: Re: [PATCH v2] Bluetooth: btusb: using big-endian definition for
 board_id in struct qca_version
In-Reply-To: <90D7F483-BCD9-430C-94EA-4018237ABE36@holtmann.org>
References: <c92c38b60b1b55b5d72f7f1c718641e1@codeaurora.org>
 <90D7F483-BCD9-430C-94EA-4018237ABE36@holtmann.org>
Message-ID: <10a208f1f34817a756bb20052537c683@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marcel:
   yeah , you are right, but in fact we mixing little-endian and 
big-endian is defined by qc btsoc(have some reason), so host only should 
be align with it , I will make another change , need your help to 
review, thank you.

regards.
tim


On 2021-11-03 22:24, Marcel Holtmann wrote:
> Hi Tim,
> 
>> As we name nvm file by using big-endian for boardID, so align host 
>> with it.
>> 
>> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
>> ---
>> drivers/bluetooth/btusb.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>> index 46d892bbde62..08a1c6d8390f 100644
>> --- a/drivers/bluetooth/btusb.c
>> +++ b/drivers/bluetooth/btusb.c
>> @@ -2883,7 +2883,7 @@ struct qca_version {
>> 	__le32	rom_version;
>> 	__le32	patch_version;
>> 	__le32	ram_version;
>> -	__le16	board_id;
>> +	__be16	board_id;
>> 	__le16	flag;
>> 	__u8	reserved[4];
>> } __packed;
>> @@ -3072,7 +3072,7 @@ static void btusb_generate_qca_nvm_name(char 
>> *fwname, size_t max_size,
>> 	u16 flag = le16_to_cpu(ver->flag);
>> 
>> 	if (((flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
>> -		u16 board_id = le16_to_cpu(ver->board_id);
>> +		u16 board_id = be16_to_cpu(ver->board_id);
>> 		const char *variant;
> 
> my original comment still stands. Are you sure you are doing this
> correctly. The in-memory layout of your NVM is mixed little-endian and
> big-endian? Really? Or do you want to convert back from host endian to
> big endian?
> 
> You commit message text suggest that you have to do this:
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 46d892bbde62..55a33a5fea56 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3090,7 +3090,7 @@ static void btusb_generate_qca_nvm_name(char
> *fwname, size_t max_size,
>                                 rom_version, variant);
>                 } else {
>                         snprintf(fwname, max_size,
> "qca/nvm_usb_%08x%s_%04x.bin",
> -                               rom_version, variant, board_id);
> +                               rom_version, variant, 
> cpu_to_be16(board_id));
>                 }
>         } else {
>                 snprintf(fwname, max_size, "qca/nvm_usb_%08x.bin”,
> 
> And really, I can not do this anymore. Write lengthy commit messages
> explaining your change in detail. I am not looking a patches anymore
> until they have a proper paragraph explaining the change and why it is
> correct.
> 
> Also this change had v16 before I merged and even in that version I
> had to fix issues. Please stop wasting my time. I have no idea why
> this wasn’t caught earlier. It is a fundamental flaw. I am close to
> just reverting the previous patch since it seems it clearly needs more
> testing.
> 
> Regards
> 
> Marcel
