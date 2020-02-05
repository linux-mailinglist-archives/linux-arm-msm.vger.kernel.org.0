Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF05D153026
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 12:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgBELu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 06:50:28 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:40659 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgBELu2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 06:50:28 -0500
Received: from marcel-macpro.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id BBB91CECC6;
        Wed,  5 Feb 2020 12:59:47 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Optimized code while enabling
 clocks for BT SOC
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1580899903-19032-1-git-send-email-gubbaven@codeaurora.org>
Date:   Wed, 5 Feb 2020 12:50:25 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org, rjliao@codeaurora.org,
        yshavit@google.com, devicetree@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3C9612F8-C73C-4C6A-96BF-2632E9E16C75@holtmann.org>
References: <1580899903-19032-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> * Directly passing clock pointer to clock code without checking for NULL
>  as clock code takes care of it
> * Removed the comment which was not necessary
> * Updated code for return in qca_regulator_enable()
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 10 +++-------
> 1 file changed, 3 insertions(+), 7 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

