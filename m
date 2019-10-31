Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B725EAA61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 06:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfJaFid (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 01:38:33 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:64179 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726321AbfJaFic (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 01:38:32 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 Oct 2019 11:08:26 +0530
IronPort-SDR: tdxhD+gA5eW/M4JW2VOG+yzYhuq8fMZij1n3O7/DU403E4cp/1XkhUzgXrtMItI2Z0QK0WlGh/
 vbPIlPhjkbdL8F9qqOB3d1VFtwd4/p2RVg58uTeKyhu/pBPvSUVzJfFlZtid/sbtz3CpFwzyj+
 ZOZ+RG1hdRAZ9xyc/fTeJjXfsU9GkvaQ2rdGisvjkCdSvHeOCEZD2T1CuoiHaDUlfd/qVMut9N
 WcY1A6ygluO2Gd8+OuCA6BGeD00IySe1yCcsE8M53jFkMWfAGU2xPl0HJwPZ4p6Aqx/uEEbDej
 99QRCXYLHoAntc+PJ8Llv7gn
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 31 Oct 2019 11:08:11 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 348C519C4; Thu, 31 Oct 2019 11:08:10 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 0/2] Add QUSB2 PHY support for SC7180
Date:   Thu, 31 Oct 2019 11:08:05 +0530
Message-Id: <1572500287-21353-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QUSB2 PHY support for SC7180 in phy driver and
device tree bindings

Sandeep Maheswaram (2):
  phy: qcom-qusb2: Add QUSB2 PHY support for SC7180
  dt-bindings: phy-qcom-qusb2: Add SC7180 QUSB2 phy support

 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  9 ++--
 drivers/phy/qualcomm/phy-qcom-qusb2.c              | 53 +++++++++++++++++++++-
 2 files changed, 57 insertions(+), 5 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

