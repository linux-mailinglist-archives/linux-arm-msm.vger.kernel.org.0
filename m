Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1F32AEF33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 12:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgKKLIn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 06:08:43 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:47375 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgKKLIn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 06:08:43 -0500
Received: from marcel-macbook.holtmann.net (unknown [37.83.201.106])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6C76ECECFD;
        Wed, 11 Nov 2020 12:15:50 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Wait for timeout during suspend
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1601997621-12056-1-git-send-email-bgodavar@codeaurora.org>
Date:   Wed, 11 Nov 2020 12:08:40 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        rjliao@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <D8614A63-5367-4BFF-AE03-3B639A2216A8@holtmann.org>
References: <1601997621-12056-1-git-send-email-bgodavar@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Balakrishna,

> Currently qca_suspend() is relied on IBS mechanism. During
> FW download and memory dump collections, IBS will be disabled.
> In those cases, driver will allow suspend and still uses the
> serdev port, which results to errors. Now added a wait timeout
> if suspend is triggered during FW download and memory collections.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 48 ++++++++++++++++++++++++++++++++++++---------
> 1 file changed, 39 insertions(+), 9 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

