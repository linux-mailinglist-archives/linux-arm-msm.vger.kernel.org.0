Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5C743E2F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 16:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhJ1ODK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 10:03:10 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:51568 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbhJ1OCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 10:02:50 -0400
Received: from smtpclient.apple (p4ff9fd51.dip0.t-ipconnect.de [79.249.253.81])
        by mail.holtmann.org (Postfix) with ESMTPSA id 60E6BCED00;
        Thu, 28 Oct 2021 16:00:22 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v3] Bluetooth: btusb: Add support for variant WCN6855 by
 using different nvm
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <YXl3S7TT30PFfyB8@google.com>
Date:   Thu, 28 Oct 2021 16:00:21 +0200
Cc:     tjiang@codeaurora.org, Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        c-hbandi@codeaurora.org, Hemantg <hemantg@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, zijuhu@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <68A15E46-C716-4324-8B5D-C71C9D2753C5@holtmann.org>
References: <1d19afff955cdc8d47582297a26246d9@codeaurora.org>
 <YXgrwKUZwUWuWfG4@google.com>
 <fe118b60df5881b0e9938f57aae6f87e@codeaurora.org>
 <YXl3S7TT30PFfyB8@google.com>
To:     Matthias Kaehlcke <mka@chromium.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

>>  the previous patch is submitted by zijun , as he is not working on this
>> project, I take over his job, so can we assume abandon the previous patch,
>> using my new patch ? thank you.
>> regards.
> 
> Your patch is clearly based on zijun's one, it even has the same subject. A
> change of authorship shouldn't result in resetting the version number, it's
> still the same patch/series. You can always add a 'Co-developed-by:' tag to
> indicate that someone else contributed to a patch, or use a 'From:' tag if
> you only made minor changes on top of someone else's work.

I really don’t care much since that is for them and their company policy to figure out.

> Not sure how to proceed best with the version number, especially since there
> are already 3 versions of the 'new' patch. Either option can create confusion,
> I guess you can continue with the new scheme, it seems the patch is almost
> ready to land anyway.

It is a total mess already for a dead simple patch like this. And they keep messing it up differently every time.

I provided a btusb_generate_qca_nvm_name() in one of my replies, where the variant variable was declared without NULL assignment and the ram_version was converted from little endian in place. That was 28th of September and 4 patches later the patch is still not ready to be merged. The maintainer hands you the recipe and you still screw up the cake multiple times; I am just done with this.

The next version would be a v16 btw. So seriously, how can we have 15 revisions so far and still not have this in a mergable state?

Regards

Marcel

