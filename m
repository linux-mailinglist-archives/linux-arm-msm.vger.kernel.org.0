Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C268174ACC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2020 03:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgCACca convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Feb 2020 21:32:30 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:60322 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727162AbgCACca (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Feb 2020 21:32:30 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 81F8CCED13;
        Sun,  1 Mar 2020 03:41:54 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Not send vendor pre-shutdown
 command for QCA Rome
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200229122118.26662-1-rjliao@codeaurora.org>
Date:   Sun, 1 Mar 2020 03:32:27 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>, bgodavar@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <87989A6A-373B-46C3-A06C-01FCFF5593C0@holtmann.org>
References: <20200229122118.26662-1-rjliao@codeaurora.org>
To:     Rocky Liao <rjliao@codeaurora.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

> QCA Rome doesn't support the pre-shutdown vendor hci command, this patch
> will check the soc type in qca_power_off() and only send this command
> for wcn399x.
> 
> Fixes: ae563183b647 ("Bluetooth: hci_qca: Enable power off/on support during hci down/up for QCA Rome")
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

