Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6A3131F5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 06:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgAGFeI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 00:34:08 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:32198 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725267AbgAGFeH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 00:34:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578375246; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hDX1FUcP5Aot8QFTLd70cw4PHvydDdZUlj595/m554o=;
 b=KKAjVb4RmSuUbI8/3/BTixZBrtMGyS2mvH6FydZth9Q9IbLiG79pl7jL9KvnwNhvSBvtHOOX
 N/Y3qEwn7+jLhMY0GD3Ens2UBlkj8bk4I54zQcHOsBCJVHOiZapFzC0AWs4bhsD5qOBeJJ13
 uOx9nVZOpYV9sQTyeBUZT7dx3a8=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e14184d.7f5e9788c148-smtp-out-n01;
 Tue, 07 Jan 2020 05:34:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76BD8C4479F; Tue,  7 Jan 2020 05:34:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CD617C433CB;
        Tue,  7 Jan 2020 05:34:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 07 Jan 2020 13:34:04 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH v3 2/4] Bluetooth: hci_qca: Retry btsoc initialize when it
 fails
In-Reply-To: <20200103162750.GC89495@google.com>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20191227072130.29431-1-rjliao@codeaurora.org>
 <20191227072130.29431-2-rjliao@codeaurora.org>
 <20200102184116.GA89495@google.com>
 <bfba08a185c81f82d3e05ec03b5ddd65@codeaurora.org>
 <20200103162750.GC89495@google.com>
Message-ID: <16cfaba272ad50fa5ae0f778731844f6@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

在 2020-01-04 00:27，Matthias Kaehlcke 写道：
> On Fri, Jan 03, 2020 at 02:31:46PM +0800, rjliao@codeaurora.org wrote:
>> 在 2020-01-03 02:41，Matthias Kaehlcke 写道：
>> 
>> > Hi Rocky,
>> >
>> > On Fri, Dec 27, 2019 at 03:21:28PM +0800, Rocky Liao wrote:
>> >
>> > > This patch adds the retry of btsoc initialization when it fails.
>> > > There are
>> > > reports that the btsoc initialization may fail on some platforms but
>> > > the
>> > > repro ratio is very low. The failure may be caused by UART, platform
>> > > HW or
>> > > the btsoc itself but it's very difficlut to root cause, given the
>> > > repro
>> > > ratio is very low. Add a retry for the btsoc initialization will
>> > > resolve
>> > > most of the failures and make Bluetooth finally works.
>> >
>> > Is this problem specific to a certain chipset?
>> >
>> > What are the symptoms?
>> 
>> It's reported on Rome so far but I think the patch is potentially 
>> helpful
>> for
>> wcn399x as well.
>> 
>> The symptoms is the firmware downloading failed due to the UART write 
>> timed
>> out.
> 
> Working around this with retries seems ok for now if the repro rate is
> really low, but it shouldn't necessarily be interpreted as "the problem 
> is
> fixed". Please mention the symptoms in the commit message for 
> documentation,
> then the retries can potentially be removed in the futures when the 
> root
> cause is fixed.
> 
>> > > enum qca_btsoc_type soc_type = qca_soc_type(hu);
>> > > const char *firmware_name = qca_get_firmware_name(hu);
>> > > int ret;
>> > > @@ -1275,6 +1280,7 @@ static int qca_setup(struct hci_uart *hu)
>> > > */
>> > > set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
>> > >
>> > > +retry:
>> > > if (qca_is_wcn399x(soc_type)) {
>> > > bt_dev_info(hdev, "setting up wcn3990");
>> > >
>> > > @@ -1293,6 +1299,12 @@ static int qca_setup(struct hci_uart *hu)
>> > > return ret;
>> > > } else {
>> > > bt_dev_info(hdev, "ROME setup");
>> > > +        if (hu->serdev) {
>> > > +            qcadev = serdev_device_get_drvdata(hu->serdev);
>> > > +            gpiod_set_value_cansleep(qcadev->bt_en, 1);
>> > > +            /* Controller needs time to bootup. */
>> > > +            msleep(150);
>> >
>> > Shouldn't this be in qca_power_on(), analogous to the power off code
>> > from
>> > "[1/4]Bluetooth: hci_qca: Add QCA Rome power off support to the
>> > qca_power_off()"?
>> >
>> > qca_power_on() should then also be called for ROME. If you opt for this
>> > it
>> > should be done in a separate patch, or possibly merged into the one
>> > mentioned above.
>> >
>> 
>> There is no qca_power_on() func and wcn399x is calling 
>> qca_wcn3990_init() to
>> do power on, I prefer to not do this change this time.
> 
> I would say it's precisely the right time to add this function. Patch 1 
> of this
> series adds handling of the BT_EN GPIO to qca_power_off(), now this 
> patch
> duplicates the code of the BT_EN handling in qca_open().
> 
>> If it's needed
> 
> 'needed' is a relative term. It certainly isn't needed from a purely 
> functional
> POV. However it is desirable for encapsulation and to avoid code 
> duplication.
> 
>> it should be a new patch to add qca_power_on() which supports both 
>> Rome and wcn399x.
> 
> Agreed
> 

Have sent out a new patch to add the qca_power_on() API, will refresh 
this patch after that new patch merged.

> m.
