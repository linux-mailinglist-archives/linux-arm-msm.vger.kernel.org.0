Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A282CD886
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 15:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436499AbgLCOGD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 09:06:03 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:57617 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbgLCOGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 09:06:03 -0500
Received: from marcel-macbook.holtmann.net (unknown [37.83.193.87])
        by mail.holtmann.org (Postfix) with ESMTPSA id 8F5DDCECFD;
        Thu,  3 Dec 2020 15:12:33 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH v1] Bluetooth: btusb: support download nvm with different
 board id for wcn6855
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1606971434-23709-1-git-send-email-zijuhu@codeaurora.org>
Date:   Thu, 3 Dec 2020 15:05:19 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        c-hbandi@codeaurora.org, Hemantg <hemantg@codeaurora.org>,
        mka@chromium.org, rjliao@codeaurora.org, tjiang@codeaurora.org
Content-Transfer-Encoding: 7bit
Message-Id: <94C66D69-36C5-4D9B-979F-264A7B4F90AE@holtmann.org>
References: <1606971434-23709-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> we define many nvm files for wcn6855 btsoc and host driver
> should find the correct nvm file based on board ID and then
> download it.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 19 ++++++++++++++++---
> 1 file changed, 16 insertions(+), 3 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

