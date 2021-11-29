Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F313B460E9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Nov 2021 06:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238420AbhK2FeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Nov 2021 00:34:11 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26830 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238647AbhK2FcJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Nov 2021 00:32:09 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 28 Nov 2021 21:28:52 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Nov 2021 21:28:51 -0800
X-QCInternal: smtphost
Received: from ekangupt-linux.qualcomm.com ([10.204.67.11])
  by ironmsg01-blr.qualcomm.com with ESMTP; 29 Nov 2021 10:58:43 +0530
Received: by ekangupt-linux.qualcomm.com (Postfix, from userid 2319895)
        id 260DB4318; Mon, 29 Nov 2021 10:58:42 +0530 (IST)
From:   Jeya R <jeyr@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     Jeya R <jeyr@codeaurora.org>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: [PATCH 0/2] Add DMA handle implementation
Date:   Mon, 29 Nov 2021 10:58:38 +0530
Message-Id: <1638163720-23123-1-git-send-email-jeyr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DMA handle is passed in an RPC call. When call reaches DSP,the fd is
added to DSP user process fd list. To unmap any DMA handle, DSP request
for unmap of fd and add it to fdlist which is then freed by driver when
call is returned from DSP.

Jeya R (2):
  misc: fastrpc: Add fdlist implementation
  misc: fastrpc: Add dma handle implementation

 drivers/misc/fastrpc.c | 97 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 75 insertions(+), 22 deletions(-)

-- 
2.7.4

