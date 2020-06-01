Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6E51E9DE1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 08:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgFAGIr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Mon, 1 Jun 2020 02:08:47 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:38317 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgFAGIq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 02:08:46 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id C19C5CED02;
        Mon,  1 Jun 2020 08:18:32 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v5] bluetooth: hci_qca: Fix QCA6390 memdump failure
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1590763111-20739-1-git-send-email-zijuhu@codeaurora.org>
Date:   Mon, 1 Jun 2020 08:08:45 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <DAC1E799-28F2-420F-987E-51BAAE96909A@holtmann.org>
References: <1590763111-20739-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> QCA6390 memdump VSE sometimes come to bluetooth driver
> with wrong sequence number as illustrated as follows:
> frame # in dec: frame data in hex
> 1396: ff fd 01 08 74 05 00 37 8f 14
> 1397: ff fd 01 08 75 05 00 ff bf 38
> 1414: ff fd 01 08 86 05 00 fb 5e 4b
> 1399: ff fd 01 08 77 05 00 f3 44 0a
> 1400: ff fd 01 08 78 05 00 ca f7 41
> it is mistook for controller missing packets, so results
> in page fault after overwriting memdump buffer allocated.
> 
> Fixed by ignoring QCA6390 sequence number check and
> checking buffer space before writing.
> 
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> Tested-by: Zijun Hu <zijuhu@codeaurora.org>
> ---
> Changes in v5:
> - correct coding style of qca_controller_memdump()
> 
> Changes in v4:
> - add a piece of code comments
> 
> Changes in v3:
> - correct coding style
> 
> Changes in v2:
> - rename a local variable from @temp to @rx_size
> 
> drivers/bluetooth/hci_qca.c | 54 +++++++++++++++++++++++++++++++++++++--------
> 1 file changed, 45 insertions(+), 9 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

