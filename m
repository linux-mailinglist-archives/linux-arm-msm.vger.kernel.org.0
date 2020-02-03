Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC4FC1508AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 15:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbgBCOp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 09:45:58 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:53412 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727406AbgBCOp6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 09:45:58 -0500
Received: from [172.20.10.2] (x59cc8b15.dyn.telefonica.de [89.204.139.21])
        by mail.holtmann.org (Postfix) with ESMTPSA id 494FDCED19;
        Mon,  3 Feb 2020 15:55:17 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v3 2/2] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip WCN3991
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1580726441-1100-2-git-send-email-gubbaven@codeaurora.org>
Date:   Mon, 3 Feb 2020 15:45:55 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org, rjliao@codeaurora.org,
        yshavit@google.com, devicetree@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <38D4ADDE-D1EF-4F5E-B72C-5F5F713CD8BB@holtmann.org>
References: <1580726441-1100-1-git-send-email-gubbaven@codeaurora.org>
 <1580726441-1100-2-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> Add compatible string for the Qualcomm WCN3991 Bluetooth controller
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> v3:
>  *Updated clocks with <&rpmhcc RPMH_RF_CLK2>  
> ---
> Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 3 +++
> 1 file changed, 3 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

