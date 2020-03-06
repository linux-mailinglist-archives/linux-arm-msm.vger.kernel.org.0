Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF8617B701
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 07:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbgCFGsT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 01:48:19 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:31123 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725927AbgCFGsT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 01:48:19 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Mar 2020 12:17:33 +0530
Received: from c-skakit-linux.qualcomm.com ([10.242.50.210])
  by ironmsg01-blr.qualcomm.com with ESMTP; 06 Mar 2020 12:17:16 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 1258038CD; Fri,  6 Mar 2020 12:17:15 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     gregkh@linuxfoundation.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 0/2] Fix RX cancel command failure
Date:   Fri,  6 Mar 2020 12:17:06 +0530
Message-Id: <1583477228-32231-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes in V2:
- Add patch to allocate port->rx_fifo buffer in probe to resolve
  NULL pointer dereference crash reported by stephen.

The crash is caused due to set_termios call starting RX engine and RX engine
is sampling some garbage data from line, and by the time startup is called,
we have few data to read but port->rx_fifo buffer is not allocated causing
NULL pointer dereference.

Changes in V3:
- As per Stephen's comment, change the declaration of rx_fifo pointer from u32
  to void.

satya priya (2):
  tty: serial: qcom_geni_serial: Allocate port->rx_fifo buffer in probe
  tty: serial: qcom_geni_serial: Fix RX cancel command failure

 drivers/tty/serial/qcom_geni_serial.c | 37 ++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 14 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

