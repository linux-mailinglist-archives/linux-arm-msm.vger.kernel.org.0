Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1FBB4403A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 21:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhJ2UAH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 16:00:07 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:59053 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhJ2UAH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 16:00:07 -0400
Received: from smtpclient.apple (p4ff9fd51.dip0.t-ipconnect.de [79.249.253.81])
        by mail.holtmann.org (Postfix) with ESMTPSA id 4C811CED1D;
        Fri, 29 Oct 2021 21:57:36 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v16] Bluetooth: btusb: Add support using different nvm for
  variant WCN6855 controller
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <4c12452739c0d7fa1c6a4f5998515767@codeaurora.org>
Date:   Fri, 29 Oct 2021 21:57:35 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        c-hbandi@codeaurora.org, Hemantg <hemantg@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rocky Liao <rjliao@codeaurora.org>, zijuhu@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <9B0A6337-8620-4CCC-B5A4-2F356572AE74@holtmann.org>
References: <4c12452739c0d7fa1c6a4f5998515767@codeaurora.org>
To:     tjiang@codeaurora.org
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tim,

> the RF performance of wcn6855 soc chip from different foundries will be
> difference, so we should use different nvm to configure them.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 54 +++++++++++++++++++++++++++++++++++------------
> 1 file changed, 40 insertions(+), 14 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

