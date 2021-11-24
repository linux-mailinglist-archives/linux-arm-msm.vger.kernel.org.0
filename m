Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D610F45C8B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 16:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240753AbhKXPel (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 10:34:41 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:52591 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240744AbhKXPek (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 10:34:40 -0500
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
        by mail.holtmann.org (Postfix) with ESMTPSA id 4909BCED24;
        Wed, 24 Nov 2021 16:31:29 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v4] Bluetooth: btusb: re-definition for board_id in struct
  qca_version
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <2659a5743ab560b2c89e341fc61d9cc4@codeaurora.org>
Date:   Wed, 24 Nov 2021 16:31:28 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Content-Transfer-Encoding: 7bit
Message-Id: <891EC0DB-7624-43B4-9B06-57A56D439EB4@holtmann.org>
References: <2659a5743ab560b2c89e341fc61d9cc4@codeaurora.org>
To:     tjiang@codeaurora.org
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tim,

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
> drivers/bluetooth/btusb.c | 15 +++++++++++++--
> 1 file changed, 13 insertions(+), 2 deletions(-)

Patch has been applied to bluetooth-next tree.

Regards

Marcel

