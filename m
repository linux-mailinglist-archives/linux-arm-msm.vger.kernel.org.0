Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E19313407
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 14:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbhBHN4f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 08:56:35 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:36647 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231567AbhBHN4V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 08:56:21 -0500
Received: from marcel-macbook.holtmann.net (p4ff9f5d2.dip0.t-ipconnect.de [79.249.245.210])
        by mail.holtmann.org (Postfix) with ESMTPSA id 369E8CED06;
        Mon,  8 Feb 2021 15:03:02 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca:Fixed issue during suspend
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1612539436-8498-1-git-send-email-gubbaven@codeaurora.org>
Date:   Mon, 8 Feb 2021 14:55:33 +0100
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
Message-Id: <83976EDA-6F40-44CC-BE4C-2405BC2B2EEB@holtmann.org>
References: <1612539436-8498-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> If BT SoC is running with ROM FW then just return in
> qca_suspend function as ROM FW does not support
> in-band sleep.
> 
> Fixes: 2be43abac5a8 ("Bluetooth: hci_qca: Wait for timeout during suspend")
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 12 +++++++++++-
> 1 file changed, 11 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

