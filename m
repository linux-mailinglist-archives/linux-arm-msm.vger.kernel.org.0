Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A83354359BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 06:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbhJUEKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 00:10:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:56630 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229452AbhJUEKR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 00:10:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634789282; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8c4/kNiuom4eEOmtGKm3oUHjG7xt34YXANV6W1v+Mxs=;
 b=vfEEEEcvcIYrOLbJ6DXkjsEXDBLnrxMCTrzEYrpBMu8GIP3gX6le7tnkmpBW4jCJ6K/HvsJE
 eR7MNBK1N97YeSXmAbBf6sRW0HIYYPAuSpIYXZ5KQ7TYvROq1HABmcoYCnNC0f4kJeuWsPSm
 z1gI5WlZMwhiE0/gNXDr49f2oWk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6170e79b67f107c611dbc476 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 04:07:55
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 662CCC4360C; Thu, 21 Oct 2021 04:07:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tjiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 78F3FC4338F;
        Thu, 21 Oct 2021 04:07:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 Oct 2021 12:07:54 +0800
From:   tjiang@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Subject: Re: [PATCH v2] Bluetooth: btusb: Add support for variant WCN6855 by
 using different nvm
In-Reply-To: <YXA1+tEiCoY8yPRR@google.com>
References: <81add00a4a038008e9f734c5f5e5b712@codeaurora.org>
 <YW8csSr/I1IRgAaT@google.com>
 <39ca0c9102265d6e14f3e0da94fec40d@codeaurora.org>
 <YXA1+tEiCoY8yPRR@google.com>
Message-ID: <f42cb074563111526e0e5e419a540419@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

thanks Matthias for the new comments.

marcel :
   do you agree with my comments which response to Matthias , if is OK, I 
will make the final version for the next patch, thank you for the help.

regards.
tim

On 2021-10-20 23:30, Matthias Kaehlcke wrote:
> On Wed, Oct 20, 2021 at 12:00:52PM +0800, tjiang@codeaurora.org wrote:
>> Thanks Matthias for the comments. please see my comments inline .
>> 
>> BTW: marcel , do you agree with Matthias comments ? if fine , I will 
>> align
>> Matthias comments and make the final version.
>> 
>> regards.
>> tim
>> On 2021-10-20 03:29, Matthias Kaehlcke wrote:
>> > On Tue, Oct 12, 2021 at 03:55:56PM +0800, tjiang@codeaurora.org wrote:
>> > > the RF performance of wcn6855 soc chip from different foundries will
>> > > be
>> > > difference, so we should use different nvm to configure them.
>> > >
>> > > Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
>> > > ---
>> > >  drivers/bluetooth/btusb.c | 56
>> > > +++++++++++++++++++++++++++++++++++------------
>> > >  1 file changed, 42 insertions(+), 14 deletions(-)
>> > >
>> > > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>> > > index 75c83768c257..f352ff351b61 100644
>> > > --- a/drivers/bluetooth/btusb.c
>> > > +++ b/drivers/bluetooth/btusb.c
>> > > @@ -3190,6 +3190,9 @@ static int btusb_set_bdaddr_wcn6855(struct
>> > > hci_dev
>> > > *hdev,
>> > >  #define QCA_DFU_TIMEOUT		3000
>> > >  #define QCA_FLAG_MULTI_NVM      0x80
>> > >
>> > > +#define WCN6855_2_0_RAM_VERSION_GF 0x400c1200
>> > > +#define WCN6855_2_1_RAM_VERSION_GF 0x400c1211
>> > > +
>> > >  struct qca_version {
>> > >  	__le32	rom_version;
>> > >  	__le32	patch_version;
>> > > @@ -3221,6 +3224,7 @@ static const struct qca_device_info
>> > > qca_devices_table[] = {
>> > >  	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
>> > >  	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
>> > >  	{ 0x00130200, 40, 4, 16 }, /* WCN6855 2.0 */
>> > > +	{ 0x00130201, 40, 4, 16 }, /* WCN6855 2.1 */
>> > >  };
>> > >
>> > >  static int btusb_qca_send_vendor_req(struct usb_device *udev, u8
>> > > request,
>> > > @@ -3375,6 +3379,43 @@ static int btusb_setup_qca_load_rampatch(struct
>> > > hci_dev *hdev,
>> > >  	return err;
>> > >  }
>> > >
>> > > +static void btusb_generate_qca_nvm_name(char *fwname,
>> > > +					size_t max_size,
>> > > +					struct qca_version *ver)
>> >
>> > => const struct qca_version *ver
[Tim] fine ,will modify it in next version.
>> >
>> > > +{
>> > > +	u32 rom_version = le32_to_cpu(ver->rom_version);
>> > > +	u16 flag = le16_to_cpu(ver->flag);
>> > > +
>> > > +	if (((flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
>> > > +		u16 board_id = le16_to_cpu(ver->board_id);
>> > > +		u32 ram_version = le32_to_cpu(ver->ram_version);
>> > > +		const char *variant;
>> > > +
>> > > +		switch (ram_version) {
>> > > +		case WCN6855_2_0_RAM_VERSION_GF:
>> > > +		case WCN6855_2_1_RAM_VERSION_GF:
>> > > +			variant = "_gf";
>> > > +			break;
>> > > +		default:
>> > > +			variant = "";
>> >
>> > instead of the default branch you could assign a default to 'variant' at
>> > declaration time, but it's fine either way.
>> 
>> [Tim] this code style is recommend by marcel.
> 
> Both are ok, if Marcel prefers the default branch let's keep it that 
> way.
> 
>> >
>> > > +			break;
>> > > +		}
>> > > +
>> > > +		/* if boardid equal 0, use default nvm without suffix */
>> >
>> > delete the comment, it just states the obvious
[Tim] fine, will modify it in next version.
>> >
>> > > +		if (board_id == 0x0) {
>> >
>> > nit: is there really any value in using a hex number here instead of a
>> > plain decimal 0?
>> 
>> [Tim] this line is inherit from last change , if you think I should 
>> change
>> 0x0 to 0 , I am fine.
> 
> Since this patch touches/moves this code it seems a good opportunity to 
> clean
> things up a bit. It's also true that there are quite a few instances of 
> this
> and comparisons with '0x00' in other parts of the kernel, so I guess 
> it's
> also fine to leave it as is.
[Tim] I am OK to change from 0x0 to 0 in next version.
