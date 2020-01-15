Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E18713CF3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 22:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgAOVhO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 16:37:14 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:52355 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAOVhN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 16:37:13 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 87423CECF3;
        Wed, 15 Jan 2020 22:46:29 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v4 2/3] Bluetooth: hci_qca: Retry btsoc initialize when it
 fails
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200115085552.11483-2-rjliao@codeaurora.org>
Date:   Wed, 15 Jan 2020 22:37:11 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        hemantg@codeaurora.org
Content-Transfer-Encoding: 7bit
Message-Id: <A15FDE9C-21ED-461A-8884-C93E596DF45A@holtmann.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20200115085552.11483-1-rjliao@codeaurora.org>
 <20200115085552.11483-2-rjliao@codeaurora.org>
To:     Rocky Liao <rjliao@codeaurora.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

> This patch adds the retry of btsoc initialization when it fails. There are
> reports that the btsoc initialization may fail on some platforms but the
> repro ratio is very low. The symptoms is the firmware downloading failed
> due to the UART write timed out. The failure may be caused by UART,
> platform HW or the btsoc itself but it's very difficlut to root cause,
> given the repro ratio is very low. Add a retry for the btsoc initialization
> can work around most of the failures and make Bluetooth finally works.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> 
> Changes in v2: None
> Changes in v3: None
> Changes in v4:
>  -rebased the patch with latet code
>  -refined macro and variable name
>  -updated commit message
> 
> drivers/bluetooth/hci_qca.c | 19 +++++++++++++++++++
> 1 file changed, 19 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

