Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763041E9DD1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 08:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgFAGEv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 02:04:51 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:39210 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgFAGEv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 02:04:51 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 94D18CED01;
        Mon,  1 Jun 2020 08:14:36 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v4] Bluetooth: hci_qca: Improve controller ID info log
 level
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1590763573-8302-1-git-send-email-zijuhu@codeaurora.org>
Date:   Mon, 1 Jun 2020 08:04:48 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Harish Bandi <c-hbandi@codeaurora.org>,
        Hemantg <hemantg@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, rjliao@codeaurora.org
Content-Transfer-Encoding: 7bit
Message-Id: <814821B2-2DFD-4F6C-937A-34F7B369064B@holtmann.org>
References: <1590763573-8302-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> Controller ID info got by VSC EDL_PATCH_GETVER is very
> important, so improve its log level from DEBUG to INFO.
> 
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> ---
> Changes in v4:
> - correct coding style of qca_read_soc_version()
> 
> Changes in v3:
> - correct coding style
> 
> Changes in v2:
> - adjust controller ID info print order
> 
> drivers/bluetooth/btqca.c | 14 +++++++++-----
> 1 file changed, 9 insertions(+), 5 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

