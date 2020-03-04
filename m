Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49334178B44
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 08:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgCDHZM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 02:25:12 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:53906 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgCDHZM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 02:25:12 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 644EECECD9;
        Wed,  4 Mar 2020 08:34:37 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Make bt_en and susclk not
 mandatory for QCA Rome
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200304015429.20615-1-rjliao@codeaurora.org>
Date:   Wed, 4 Mar 2020 08:25:08 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org
Content-Transfer-Encoding: 7bit
Message-Id: <259034EC-04FB-4256-ABF9-91F3D350333A@holtmann.org>
References: <20200304015429.20615-1-rjliao@codeaurora.org>
To:     Rocky Liao <rjliao@codeaurora.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

> On some platforms the bt_en pin and susclk are default on and there
> is no exposed resource to control them. This patch makes the bt_en
> and susclk not mandatory to have BT work. It also will not set the
> HCI_QUIRK_NON_PERSISTENT_SETUP and shutdown() callback if bt_en is
> not available.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 47 ++++++++++++++++++++-----------------
> 1 file changed, 26 insertions(+), 21 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

