Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091322712AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 08:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgITG1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Sep 2020 02:27:15 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:57510 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgITG1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Sep 2020 02:27:15 -0400
X-Greylist: delayed 567 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 02:27:15 EDT
Received: from marcel-macbook.fritz.box (p4fefc7f4.dip0.t-ipconnect.de [79.239.199.244])
        by mail.holtmann.org (Postfix) with ESMTPSA id B8E5ACEC92;
        Sun, 20 Sep 2020 08:24:44 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v1] Bluetooth: btusb: Enable wide band speech support for
 BTUSB_QCA_ROME
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200917130923.15237-1-rjliao@codeaurora.org>
Date:   Sun, 20 Sep 2020 08:17:46 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <6D9F38F1-D350-4D32-8D30-A316AD1A9400@holtmann.org>
References: <20200917130923.15237-1-rjliao@codeaurora.org>
To:     Rocky Liao <rjliao@codeaurora.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

> QCA Rome supports wide band speech, this patch enables the wide band
> speech support by set the BTUSB_WIDEBAND_SPEECH flag.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 54 ++++++++++++++++++++++++++-------------
> 1 file changed, 36 insertions(+), 18 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

