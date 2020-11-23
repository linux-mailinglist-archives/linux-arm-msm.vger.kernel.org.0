Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3E22C0490
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 12:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgKWLbV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 06:31:21 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:54870 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbgKWLbV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 06:31:21 -0500
Received: from marcel-macbook.holtmann.net (unknown [37.83.193.87])
        by mail.holtmann.org (Postfix) with ESMTPSA id 91E23CECCF;
        Mon, 23 Nov 2020 12:38:28 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH v2] Bluetooth: Use NVM files based on SoC ID for WCN3991
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1605790449-7250-1-git-send-email-gubbaven@codeaurora.org>
Date:   Mon, 23 Nov 2020 12:31:15 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Content-Transfer-Encoding: 7bit
Message-Id: <E4A3BCAC-E6C1-4ED4-885B-FC2918ACC315@holtmann.org>
References: <1605790449-7250-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> This change will allow to use different NVM file based
> on WCN3991 BT SoC ID.Need to use different NVM file based on
> fab location for WCN3991 BT SoC.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> drivers/bluetooth/btqca.c   | 36 ++++++++++++++++++++----------------
> drivers/bluetooth/btqca.h   | 22 ++++++++++++++++++----
> drivers/bluetooth/hci_qca.c |  9 ++++-----
> 3 files changed, 42 insertions(+), 25 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

