Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE9C413D3C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 06:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgAPFbv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 00:31:51 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:42841 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgAPFbv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 00:31:51 -0500
Received: from marcel-macpro.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 271C0CECF6;
        Thu, 16 Jan 2020 06:41:07 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v5] Bluetooth: hci_qca: Enable power off/on support during
 hci down/up for QCA Rome
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200116032254.20549-1-rjliao@codeaurora.org>
Date:   Thu, 16 Jan 2020 06:31:48 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        hemantg@codeaurora.org
Content-Transfer-Encoding: 7bit
Message-Id: <DBD74B3C-ACC4-482D-8081-00456BCED14A@holtmann.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20200116032254.20549-1-rjliao@codeaurora.org>
To:     Rocky Liao <rjliao@codeaurora.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

> This patch registers hdev->shutdown() callback and also sets
> HCI_QUIRK_NON_PERSISTENT_SETUP for QCA Rome. It will power-off the BT chip
> during hci down and power-on/initialize the chip again during hci up. As
> wcn399x already enabled this, this patch also removed the callback register
> and QUIRK setting in qca_setup() for wcn399x and uniformly do this in the
> probe() routine.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> 
> Changes in v2: None
> Changes in v3:
>  -moved the quirk and callback register to probe()
> Changes in v4:
>  -rebased the patch with latest code
>  -moved the quirk and callback register to probe() for wcn399x
>  -updated commit message
> Changed in v5:
>  -removed the "out" label and return err when fails
> 
> drivers/bluetooth/hci_qca.c | 20 +++++++++++---------
> 1 file changed, 11 insertions(+), 9 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

