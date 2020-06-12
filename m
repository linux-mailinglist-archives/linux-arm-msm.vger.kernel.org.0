Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B311F78B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 15:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgFLNTn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 09:19:43 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:59379 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLNTm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 09:19:42 -0400
Received: from marcel-macbook.fritz.box (ip-109-41-64-170.web.vodafone.de [109.41.64.170])
        by mail.holtmann.org (Postfix) with ESMTPSA id 5CF69CED05;
        Fri, 12 Jun 2020 15:29:28 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Disable SoC debug logging for
 WCN3991
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1591964428-9607-1-git-send-email-bgodavar@codeaurora.org>
Date:   Fri, 12 Jun 2020 15:19:35 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        abhishekpandit@chromium.org, rjliao@codeaurora.org,
        gubbaven@codeaurora.org
Content-Transfer-Encoding: 7bit
Message-Id: <BF82F217-1BD4-48B6-AC9E-AF94A20EE7C9@holtmann.org>
References: <1591964428-9607-1-git-send-email-bgodavar@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Balakrishna,

> By default, WCN3991 sent debug packets to HOST via ACL packet
> with header 0xDC2E. This logging is not required on commercial
> devices. With this patch SoC logging is disabled post fw
> download.
> 
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
> drivers/bluetooth/btqca.c | 27 +++++++++++++++++++++++++++
> drivers/bluetooth/btqca.h |  2 ++
> 2 files changed, 29 insertions(+)

patch has been applied to bluetooth-next tree.

Regareds

Marcel

