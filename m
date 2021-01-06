Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8CA2EBAB8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 08:52:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbhAFHvA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 02:51:00 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:60744 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbhAFHu7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 02:50:59 -0500
Received: from marcel-macbook.holtmann.net (p5b3d23d0.dip0.t-ipconnect.de [91.61.35.208])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1E218CED12;
        Wed,  6 Jan 2021 08:57:38 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Wait for SSR completion during
 suspend
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1609348628-3932-1-git-send-email-gubbaven@codeaurora.org>
Date:   Wed, 6 Jan 2021 08:50:17 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org,
        abhishekpandit@chromium.org
Content-Transfer-Encoding: 7bit
Message-Id: <E32A301F-6E1D-4A4D-8827-E0A829C578BB@holtmann.org>
References: <1609348628-3932-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> During SSR after memory dump collection,BT controller will be powered off,
> powered on and then FW will be downloaded.During suspend if BT controller
> is powered off due to SSR then we should wait until SSR is completed and
> then suspend.
> 
> Fixes: 2be43abac5a8 ("Bluetooth: hci_qca: Wait for timeout during suspend")
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 16 +++++++++-------
> 1 file changed, 9 insertions(+), 7 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

