Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D4745334B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 14:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236914AbhKPN5q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 08:57:46 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:58587 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236921AbhKPN5Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 08:57:24 -0500
Received: from smtpclient.apple (p4fefc15c.dip0.t-ipconnect.de [79.239.193.92])
        by mail.holtmann.org (Postfix) with ESMTPSA id 78BC6CECD7;
        Tue, 16 Nov 2021 14:54:25 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v2] Bluetooth: hci_h4: Fix padding calculation error
 within h4_recv_buf()
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1637052698-14326-1-git-send-email-zijuhu@codeaurora.org>
Date:   Tue, 16 Nov 2021 14:54:24 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, c-hbandi@codeaurora.org,
        hemantg@codeaurora.org, rjliao@codeaurora.org,
        Zijun Hu <quic_zijuhu@quicinc.com>
Content-Transfer-Encoding: 7bit
Message-Id: <6935AD40-7060-4A42-9DB6-74DEB6516D6D@holtmann.org>
References: <1637052698-14326-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> it is erroneous to calculate padding by subtracting length of type
> indication from skb->len, it will cause data analysis error for
> alignment which is greater than 1, so fixed by adding length of type
> indication with skb->len.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
> drivers/bluetooth/hci_h4.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

