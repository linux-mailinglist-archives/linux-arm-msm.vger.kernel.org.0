Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED0B21DD6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 18:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730286AbgGMQif (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 12:38:35 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:47939 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730652AbgGMQid (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 12:38:33 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 82B46CECC9;
        Mon, 13 Jul 2020 18:48:29 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Bug fixes for SSR
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1594467072-13332-1-git-send-email-gubbaven@codeaurora.org>
Date:   Mon, 13 Jul 2020 18:38:31 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        Bluetooth Kernel Mailing List 
        <linux-bluetooth@vger.kernel.org>, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org
Content-Transfer-Encoding: 7bit
Message-Id: <CA0DAEA3-F02E-44A6-B8C9-C22EA9507FC4@holtmann.org>
References: <1594467072-13332-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> 1.During SSR for command time out if BT SoC goes to inresponsive
> state, power cycling of BT SoC was not happening.Given the fix by
> sending hw error event to reset the BT SoC.
> 
> 2.If SSR is triggered then ignore the transmit data requests to
> BT SoC until SSR is completed.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 40 ++++++++++++++++++++++++++++++++++++----
> 1 file changed, 36 insertions(+), 4 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

