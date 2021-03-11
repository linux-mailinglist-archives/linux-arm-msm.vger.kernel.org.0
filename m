Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40635337075
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 11:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbhCKKtg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 05:49:36 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:45581 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232326AbhCKKt3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 05:49:29 -0500
Received: from marcel-macbook.holtmann.net (p4fefc126.dip0.t-ipconnect.de [79.239.193.38])
        by mail.holtmann.org (Postfix) with ESMTPSA id 64EAECECE2;
        Thu, 11 Mar 2021 11:57:03 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [RFC PATCH v2] Bluetooth: hci_qca: Add device_may_wakeup support
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1615446220-969-1-git-send-email-gubbaven@codeaurora.org>
Date:   Thu, 11 Mar 2021 11:49:27 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluetooth Kernel Mailing List 
        <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org,
        abhishekpandit@chromium.org
Content-Transfer-Encoding: 7bit
Message-Id: <DF05F50F-FD69-40B1-ADEE-33D0C41C079A@holtmann.org>
References: <1615446220-969-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> Based on device may wakeup status, Bluez stack will enable/disable
> passive scanning with whitelist in BT controller while suspending.
> As interrupt from BT SoC is handled by UART driver,we need to use
> device handle of UART driver to get the status of device may wakeup
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

