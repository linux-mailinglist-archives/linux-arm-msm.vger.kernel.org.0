Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00E1D13AB7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 14:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgANNzn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 08:55:43 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:57503 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgANNzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 08:55:43 -0500
Received: from marcel-macpro.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 93D53CECDD;
        Tue, 14 Jan 2020 15:04:58 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v5] Bluetooth: hci_qca: Add qca_power_on() API to support
 both wcn399x and Rome power up
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200113043020.9663-1-rjliao@codeaurora.org>
Date:   Tue, 14 Jan 2020 14:55:40 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <FBE03C2C-76A8-4F76-9B0C-F64D9FB7272F@holtmann.org>
References: <20200107052601.32216-1-rjliao@codeaurora.org>
 <20200113043020.9663-1-rjliao@codeaurora.org>
To:     Rocky Liao <rjliao@codeaurora.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

> This patch adds a unified API qca_power_on() to support both wcn399x and
> Rome power on. For wcn399x it calls the qca_wcn3990_init() to init the
> regulators, and for Rome it pulls up the bt_en GPIO to power up the btsoc.
> It also moves all the power up operation from hdev->open() to
> hdev->setup().
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> 
> Changes in v2: None
> Changes in v3:
>  -moved all the power up operation from open() to setup()
>  -updated the commit message
> Changes in v4:
>  -made a single call to qca_power_on() in setup()
> Changes in v5:
>  -modified the debug log location
> 
> drivers/bluetooth/hci_qca.c | 54 ++++++++++++++++++++++---------------
> 1 file changed, 33 insertions(+), 21 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

