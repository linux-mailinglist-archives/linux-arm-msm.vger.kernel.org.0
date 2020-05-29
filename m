Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED41C1E7FA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 16:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgE2OFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 10:05:10 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:45484 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgE2OFK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 10:05:10 -0400
Received: from marcel-macbook.fritz.box (p4fefc5a7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 23EBDCECD5;
        Fri, 29 May 2020 16:14:54 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] Bluetooth: hci_qca: Fix qca6390 enable failure after
 warm reboot
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1590760617-30285-1-git-send-email-zijuhu@codeaurora.org>
Date:   Fri, 29 May 2020 16:05:06 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Harish Bandi <c-hbandi@codeaurora.org>,
        Hemantg <hemantg@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, rjliao@codeaurora.org
Content-Transfer-Encoding: 7bit
Message-Id: <DA6EBE57-64EB-4814-9065-2171341F5651@holtmann.org>
References: <1590760617-30285-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> Warm reboot can not reset controller qca6390 due to
> lack of controllable power supply, so causes firmware
> download failure during enable.
> 
> Fixed by sending VSC EDL_SOC_RESET to reset qca6390
> within added device shutdown implementation.
> 
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> Tested-by: Zijun Hu <zijuhu@codeaurora.org>
> ---
> Changes in v2:
> - rebase
> 
> drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
> 1 file changed, 33 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

