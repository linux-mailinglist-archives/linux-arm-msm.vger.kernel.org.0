Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 279EDFFE79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 07:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfKRGVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 01:21:50 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:58420
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726331AbfKRGVu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 01:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574058109;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=Q20iYFHFrX3HtkHcEtV6DPxTXAyu4jf2jXVw5epD7r8=;
        b=f3xqgl7RiuTsFDdhD9p2feTRuL20IARjOu6AC5M3dQORcVzTZHS2cPJS/URhHrlP
        NDGFj1kyD/4TYP9XbdGl2AvZ7BotGziaC88XKPBfYZotYLQzulY/umf2Mx3VBASpdgv
        w+eUFqx6H/PYp1KrTBC1ZnfMbykeYr1FyskaW2vs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574058109;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=Q20iYFHFrX3HtkHcEtV6DPxTXAyu4jf2jXVw5epD7r8=;
        b=gcKRufRtI5vQsTW0hhDRrIfuvhMsHHoFZXO4vkTawo3FnnZymNem38Z9PGM0MUkJ
        RZo1RzFKsXrsN2/GXrhDyn3msEh0TfQaNR2b6m4cHzW7Yn4IrF0F/HtAtyoOl2TDsyg
        O6sVO1sztWCJgpT7c7wNT979ATph3MWKQf4Lcmss=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 18 Nov 2019 06:21:49 +0000
From:   bgodavar@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     johan.hedberg@gmail.com, marcel@holtmann.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        tientzu@chromium.org, seanpaul@chromium.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Enable clocks required for BT SOC
In-Reply-To: <5dcd8c98.1c69fb81.4690b.49fe@mx.google.com>
References: <20191114081430.25427-1-bgodavar@codeaurora.org>
 <5dcd8c98.1c69fb81.4690b.49fe@mx.google.com>
Message-ID: <0101016e7d2ca862-0ec3d2c5-c309-4d97-9221-f09480b17c02-000000@us-west-2.amazonses.com>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.18-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 2019-11-14 22:49, Stephen Boyd wrote:
> Quoting Balakrishna Godavarthi (2019-11-14 00:14:30)
>> @@ -1423,6 +1427,20 @@ static int qca_power_off(struct hci_dev *hdev)
>>         return 0;
>>  }
>> 
>> +static int qca_power_on(struct qca_serdev *qcadev)
>> +{
>> +       int err;
>> +
>> +       if (qcadev->susclk) {
> 
> clk_prepare_enable() shouldn't return anything besides 0 when passed a
> NULL pointer. Please drop this if condition in addition to the one on
> the clk_disable_unprepare().
> 
>> +               err = clk_prepare_enable(qcadev->susclk);
>> +               if (err)
>> +                       return err;
>> +       }

[Bala]: will update.

Regards
Balakrishna
