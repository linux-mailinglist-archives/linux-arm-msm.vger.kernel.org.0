Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1BEDA8866
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730511AbfIDOG4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 10:06:56 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:34727 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbfIDOG4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 10:06:56 -0400
Received: from marcel-macbook.fritz.box (p4FEFC197.dip0.t-ipconnect.de [79.239.193.151])
        by mail.holtmann.org (Postfix) with ESMTPSA id E3037CEC82;
        Wed,  4 Sep 2019 16:15:41 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v1] bluetooth: hci_qca: disable irqs when spinlock is
 acquired
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1567571656-32403-1-git-send-email-c-hbandi@codeaurora.org>
Date:   Wed, 4 Sep 2019 16:06:53 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, anubhavg@codeaurora.org
Content-Transfer-Encoding: 7bit
Message-Id: <6F34A9CD-7C8F-4E5D-9A22-9F05CC2CF9BC@holtmann.org>
References: <1567571656-32403-1-git-send-email-c-hbandi@codeaurora.org>
To:     Harish Bandi <c-hbandi@codeaurora.org>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Harish,

> Looks like Deadlock is observed in hci_qca while performing
> stress and stability tests. Since same lock is getting
> acquired from qca_wq_awake_rx and hci_ibs_tx_idle_timeout
> seeing spinlock recursion, irqs should be disable while
> acquiring the spinlock always.
> 
> Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 10 ++++++----
> 1 file changed, 6 insertions(+), 4 deletions(-)

patch has been applied to bluetooth-stable tree.

Regards

Marcel

