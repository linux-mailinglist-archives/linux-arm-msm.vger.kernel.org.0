Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3314501F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 11:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236726AbhKOKHu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 05:07:50 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:52740 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237055AbhKOKHt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 05:07:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636970694; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=crfvnZ73pTs5AL0O4MfeWfUlxKWWxzYybZTh0XOLHTg=;
 b=p2m03v4aSjdnTwk4KWA+JabPxYTOPd4Nq/OOAHosHQuc+r5glnPOTsqzgZxL+jr7HuFmxS0w
 qJJ0jmMFLIcO5S62p67rtMCdQINExnLgUqEj8k39hO1oYl+AU8IT97EvQ0mOV3QIa2qD506M
 oncj+objSQ6DXl520G1xhxO17Xo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 619230c5b3d5cb1f55d20fec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 10:04:53
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5FC8AC4360D; Mon, 15 Nov 2021 10:04:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tjiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF3BEC4338F;
        Mon, 15 Nov 2021 10:04:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 15 Nov 2021 18:04:52 +0800
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
Subject: Re: [PATCH v3] Bluetooth: btusb: re-definition for board_id in struct
 qca_version
In-Reply-To: <8E687716-E810-4A46-B010-A08BB261D2FF@holtmann.org>
References: <305e41a55a4c117da86f786c374a57dc@codeaurora.org>
 <8E687716-E810-4A46-B010-A08BB261D2FF@holtmann.org>
Message-ID: <96d03a2b0bd50da90a20990c42a814d9@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marcel:
   the following is the explanation from qc btsoc team:

The board ID should be split into two bytes.
The 1st byte is chip ID, and the 2nd byte is platform ID.
For example, board ID 0x010A, 0x01 is platform ID. 0x0A is chip ID.
Currently we have several platforms, and platform IDs are continuously 
added.
We would not distinguish different chips if we get these mixed up.
Platform ID:
•             0x00 is for Mobile
•             0x01 is for X86( ID # from 257)
•             0x02 is for Automotive(ID# from 513 )
•             0x03 is for Consumer electronic( ID# from 769)
…


regards.
tim



On 2021-11-09 17:37, Marcel Holtmann wrote:
> Hi Tim,
> 
>> As qc btsoc will using big-endian for boardID, so align host with it.
>> 
>> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
>> ---
>> drivers/bluetooth/btusb.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>> index 46d892bbde62..a51b1d641043 100644
>> --- a/drivers/bluetooth/btusb.c
>> +++ b/drivers/bluetooth/btusb.c
>> @@ -2883,7 +2883,7 @@ struct qca_version {
>> 	__le32	rom_version;
>> 	__le32	patch_version;
>> 	__le32	ram_version;
>> -	__le16	board_id;
>> +	__u8	board_id[2];
>> 	__le16	flag;
>> 	__u8	reserved[4];
>> } __packed;
>> @@ -3072,7 +3072,7 @@ static void btusb_generate_qca_nvm_name(char 
>> *fwname, size_t max_size,
>> 	u16 flag = le16_to_cpu(ver->flag);
>> 
>> 	if (((flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
>> -		u16 board_id = le16_to_cpu(ver->board_id);
>> +		u16 board_id = (ver->board_id[0] << 8) + ver->board_id[1];
>> 		const char *variant;
>> 
>> 		switch (le32_to_cpu(ver->ram_version)) {
> 
> explain to me why I would merge this. The commit message is sparse
> even after I asked to explain things.
> 
> I am also not merging this handwaving endian handling. Define it is
> be16 or le16 and clearly state what it is. If Qualcomm screwed up the
> memory layout of their NVM, then say that.
> 
> Regards
> 
> Marcel
