Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E83EF5CFE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2019 03:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfKIC2n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 21:28:43 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:55184 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfKIC2m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 21:28:42 -0500
Received: from marcel-macbook.fritz.box (p4FD19401.dip0.t-ipconnect.de [79.209.148.1])
        by mail.holtmann.org (Postfix) with ESMTPSA id 99E91CED20;
        Sat,  9 Nov 2019 03:37:45 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v2 0/2] Enable Bluetooth functionality for WCN3991
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191106094832.482-1-bgodavar@codeaurora.org>
Date:   Sat, 9 Nov 2019 03:28:40 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        tientzu@chromium.org, seanpaul@chromium.org,
        bjorn.andersson@linaro.org
Content-Transfer-Encoding: 7bit
Message-Id: <0E5C9575-6D1E-4446-ACEA-B5826A7A6EEC@holtmann.org>
References: <20191106094832.482-1-bgodavar@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Balakrishna,

> These patches enables Bluetooth functinalties for new Qualcomm
> Bluetooth chip wnc3991. As this is latest chip with new features,
> along with some common features to old chip "qcom,qcawcn3991-bt".
> Major difference between old BT SoC's with WCN3991 is WCN3991 
> will not send any VSE for the VSC instead is sends the data on CC
> packet.
> 
> v2:
> * updated review comments
> 
> Balakrishna Godavarthi (2):
>  Bluetooth: btqca: Rename ROME specific variables to generic variables
>  Bluetooth: hci_qca: Add support for Qualcomm Bluetooth SoC WCN3991
> 
> drivers/bluetooth/btqca.c   | 92 ++++++++++++++++++++++++++-----------
> drivers/bluetooth/btqca.h   | 32 +++++++------
> drivers/bluetooth/hci_qca.c | 16 ++++++-
> 3 files changed, 97 insertions(+), 43 deletions(-)

both patches have been applied to bluetooth-next tree.

Regards

Marcel

