Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0C08A3702
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 14:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbfH3MpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 08:45:16 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:52184 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbfH3MpP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 08:45:15 -0400
Received: from marcel-macbook.fritz.box (p4FEFC580.dip0.t-ipconnect.de [79.239.197.128])
        by mail.holtmann.org (Postfix) with ESMTPSA id 567FCCECDE;
        Fri, 30 Aug 2019 14:54:00 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v3] Bluetooth: hci_qca: wait for Pre shutdown complete
 event before sending the Power off pulse
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1567168116-12462-1-git-send-email-c_hbandi@qti.qualcomm.com>
Date:   Fri, 30 Aug 2019 14:45:13 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, anubhavg@codeaurora.org,
        Harish Bandi <c-hbandi@codeaurora.org>
Content-Transfer-Encoding: 7bit
Message-Id: <5CFF45A9-2495-405E-B488-9BACB7E1F873@holtmann.org>
References: <1567168116-12462-1-git-send-email-c_hbandi@qti.qualcomm.com>
To:     Harish Bandi <c_hbandi@qti.qualcomm.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Harish,

> When SoC receives pre shut down command, it share the same
> with other COEX shared clients. So SoC needs a short time
> after sending VS pre shutdown command before turning off
> the regulators and sending the power off pulse. Along with
> short delay, needs to wait for command complete event for
> Pre shutdown VS command
> 
> Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
> Reviewed-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
> Changes in V3:
> - updated patch on latest tip.
> ---
> drivers/bluetooth/btqca.c   | 5 +++--
> drivers/bluetooth/hci_qca.c | 2 ++
> 2 files changed, 5 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

