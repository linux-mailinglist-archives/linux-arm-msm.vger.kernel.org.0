Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F30061463A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 09:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgAWImG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 03:42:06 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:63672 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725785AbgAWImF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 03:42:05 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Jan 2020 14:12:02 +0530
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg01-blr.qualcomm.com with ESMTP; 23 Jan 2020 14:11:38 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 8CE7426E5; Thu, 23 Jan 2020 14:11:37 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        mgautam@codeaurora.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH 0/1] tty: serial: qcom_geni_serial: Configure UART_IO_MACRO_CTRL register 
Date:   Thu, 23 Jan 2020 14:11:31 +0530
Message-Id: <20200123084132.11802-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure UART_IO_MACRO_CTRL register if UART lines are swapped.

Roja Rani Yarubandi (1):
  tty: serial: qcom_geni_serial: Configure UART_IO_MACRO_CTRL register

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 +
 drivers/tty/serial/qcom_geni_serial.c        | 6 ++++++
 2 files changed, 7 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of the Code Aurora Forum, hosted by The Linux Foundation

