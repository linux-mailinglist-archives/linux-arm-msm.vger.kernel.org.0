Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CACCF265A1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 09:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgIKHKm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 03:10:42 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:36124 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgIKHKl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 03:10:41 -0400
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id 8C07CCED19;
        Fri, 11 Sep 2020 09:17:35 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [RESEND v1 0/2] Close UART port if NON_PERSISTENT_SETUP is set
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1599733843-20311-1-git-send-email-gubbaven@codeaurora.org>
Date:   Fri, 11 Sep 2020 09:10:39 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org
Content-Transfer-Encoding: 7bit
Message-Id: <C4C12227-FA4E-47F9-A161-6ADE490AAA91@holtmann.org>
References: <1599733843-20311-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> When HCI_QUIRK_NON_PERSISTENT_SETUP is set by drivers,
> it indicates that BT SoC will be completely powered OFF
> during BT OFF. On next BT ON firmware must be downloaded
> again. Holding UART port open during BT OFF is draining
> the battery. Now during BT OFF, UART port is closed if
> qurik HCI_QUIRK_NON_PERSISTENT_SETUP is set by clearing
> HCI_UART_PROTO_READY proto flag. On next BT ON, UART
> port is opened if HCI_UART_PROTO_READY proto flag is cleared.
> 
> Venkata Lakshmi Narayana Gubba (2):
>  Bluetooth: hci_serdev: Close UART port if NON_PERSISTENT_SETUP is set
>  Bluetooth: hci_qca: Remove duplicate power off in proto close
> 
> drivers/bluetooth/hci_qca.c    |  5 ++---
> drivers/bluetooth/hci_serdev.c | 36 +++++++++++++++++++++++++++++++++---
> 2 files changed, 35 insertions(+), 6 deletions(-)

both patches have been applied to bluetooth-next tree.

Regards

Marcel

