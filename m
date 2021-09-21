Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C32413066
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 10:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhIUIth (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 04:49:37 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:59924 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbhIUItg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 04:49:36 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id E9C76CED13;
        Tue, 21 Sep 2021 10:48:06 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v1] Bluetooth: btusb: Add gpio reset way for qca btsoc in 
 cmd_timeout
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <f1548c4ca5186597a21a8a9ee6655b58@codeaurora.org>
Date:   Tue, 21 Sep 2021 10:48:06 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        c-hbandi@codeaurora.org, Hemantg <hemantg@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rocky Liao <rjliao@codeaurora.org>, zijuhu@codeaurora.org
Content-Transfer-Encoding: 7bit
Message-Id: <3631015D-DA19-49F2-96C6-23B59054DEEC@holtmann.org>
References: <f1548c4ca5186597a21a8a9ee6655b58@codeaurora.org>
To:     tjiang@codeaurora.org
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tim,

> if platform provide gpio connect to BT_EN reset pin of qca btsoc chip,
> we can do hardware reset instead of usb port reset.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 22 ++++++++++++++++++++++
> 1 file changed, 22 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

