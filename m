Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE5E12F493
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 07:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgACGbu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 01:31:50 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:48769 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726133AbgACGbu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 01:31:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578033109; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=AV/d+5XHUKKmFsA8S70fdNu6jhq8PhxMezHm1nRwV+U=;
 b=GaDGzwVNQSko6eK9SIwEuv/g+VuTWAtlzAx8mYaRBZQc6LwwTEdV8qVt35AVgmAJ3FJjEcZF
 UeAYtJAcfLqLi+4ui0AMpiFmmJK4IME12/WyijbpN4Dcc9+OD/nCkMh5TxIWbTmXwJE+HwtA
 T9m62rYWNUQMVndT9QgqkW/zFWg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0edfd3.7f6fc4442ca8-smtp-out-n02;
 Fri, 03 Jan 2020 06:31:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D982BC4479C; Fri,  3 Jan 2020 06:31:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 31C9CC43383;
        Fri,  3 Jan 2020 06:31:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 03 Jan 2020 14:31:46 +0800
From:   rjliao@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH v3 2/4] Bluetooth: hci_qca: Retry btsoc initialize when it
 fails
In-Reply-To: <20200102184116.GA89495@google.com>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20191227072130.29431-1-rjliao@codeaurora.org>
 <20191227072130.29431-2-rjliao@codeaurora.org>
 <20200102184116.GA89495@google.com>
Message-ID: <bfba08a185c81f82d3e05ec03b5ddd65@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

在 2020-01-03 02:41，Matthias Kaehlcke 写道：

> Hi Rocky,
> 
> On Fri, Dec 27, 2019 at 03:21:28PM +0800, Rocky Liao wrote:
> 
>> This patch adds the retry of btsoc initialization when it fails. There 
>> are
>> reports that the btsoc initialization may fail on some platforms but 
>> the
>> repro ratio is very low. The failure may be caused by UART, platform 
>> HW or
>> the btsoc itself but it's very difficlut to root cause, given the 
>> repro
>> ratio is very low. Add a retry for the btsoc initialization will 
>> resolve
>> most of the failures and make Bluetooth finally works.
> 
> Is this problem specific to a certain chipset?
> 
> What are the symptoms?

It's reported on Rome so far but I think the patch is potentially 
helpful for
wcn399x as well.

The symptoms is the firmware downloading failed due to the UART write 
timed out.

>> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
>> ---
>> 
>> Changes in v2: None
>> Changes in v3: None
>> 
>> drivers/bluetooth/hci_qca.c | 26 ++++++++++++++++++++++++++
>> 1 file changed, 26 insertions(+)
>> 
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 43fd84028786..45042aa27fa4 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -53,6 +53,9 @@
>> /* Controller debug log header */
>> #define QCA_DEBUG_HANDLE    0x2EDC
>> 
>> +/* max retry count when init fails */
>> +#define QCA_MAX_INIT_RETRY_COUNT 3
> 
> nit: MAX_RETRIES or MAX_INIT_RETRIES?
> 
> The QCA prefix just adds noise here IMO, there's no need to 
> disambiguate
> the constant from other retries since it is defined in hci_qca.c.
> 
>> +
>> enum qca_flags {
>> QCA_IBS_ENABLED,
>> QCA_DROP_VENDOR_EVENT,
>> @@ -1257,7 +1260,9 @@ static int qca_setup(struct hci_uart *hu)
>> {
>> struct hci_dev *hdev = hu->hdev;
>> struct qca_data *qca = hu->priv;
>> +    struct qca_serdev *qcadev;
>> unsigned int speed, qca_baudrate = QCA_BAUDRATE_115200;
>> +    unsigned int init_retry_count = 0;
> 
> nit: the name is a bit clunky, how about 'retries'?
> 
>> enum qca_btsoc_type soc_type = qca_soc_type(hu);
>> const char *firmware_name = qca_get_firmware_name(hu);
>> int ret;
>> @@ -1275,6 +1280,7 @@ static int qca_setup(struct hci_uart *hu)
>> */
>> set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
>> 
>> +retry:
>> if (qca_is_wcn399x(soc_type)) {
>> bt_dev_info(hdev, "setting up wcn3990");
>> 
>> @@ -1293,6 +1299,12 @@ static int qca_setup(struct hci_uart *hu)
>> return ret;
>> } else {
>> bt_dev_info(hdev, "ROME setup");
>> +        if (hu->serdev) {
>> +            qcadev = serdev_device_get_drvdata(hu->serdev);
>> +            gpiod_set_value_cansleep(qcadev->bt_en, 1);
>> +            /* Controller needs time to bootup. */
>> +            msleep(150);
> 
> Shouldn't this be in qca_power_on(), analogous to the power off code 
> from
> "[1/4]Bluetooth: hci_qca: Add QCA Rome power off support to the
> qca_power_off()"?
> 
> qca_power_on() should then also be called for ROME. If you opt for this 
> it
> should be done in a separate patch, or possibly merged into the one
> mentioned above.
> 

There is no qca_power_on() func and wcn399x is calling 
qca_wcn3990_init() to
do power on, I prefer to not do this change this time. If it's needed it 
should
be a new patch to add qca_power_on() which supports both Rome and 
wcn399x.

>> +        }
>> qca_set_speed(hu, QCA_INIT_SPEED);
>> }
>> 
>> @@ -1329,6 +1341,20 @@ static int qca_setup(struct hci_uart *hu)
>> * patch/nvm-config is found, so run with original fw/config.
>> */
>> ret = 0;
>> +    } else {
>> +        if (init_retry_count < QCA_MAX_INIT_RETRY_COUNT) {
>> +            qca_power_off(hdev);
>> +            if (hu->serdev) {
>> +                serdev_device_close(hu->serdev);
>> +                ret = serdev_device_open(hu->serdev);
>> +                if (ret) {
>> +                    bt_dev_err(hu->hdev, "open port fail");
> 
> nit: "failed to open port"
