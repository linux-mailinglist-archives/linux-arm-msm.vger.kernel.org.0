Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91247EB185
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 14:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbfJaNtl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 09:49:41 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:14456 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727446AbfJaNtk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 09:49:40 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 Oct 2019 19:19:37 +0530
IronPort-SDR: RDLu8+cv2XI0GHzKx82CrkHZ/FDKkQYGpHY+M4IpAyh33exsr6xhf8L52OfaPKM4U8eqVXgGsS
 mAXebbIsmrfaOBBCA3Ux+FiW9d5xMTN6LBwijuudWBVLwrOZZOI2m55rXjy0NMqNCQrW/nLZGa
 cMoq5E/eLgrdLH/9qF5Pf3EJYujX5DvH/OTuQZ9n0VhDctOwQ5XXo7qdK+kCb7lJZibgPaHj1m
 A49mSTG/s1DRcBmpn9VzHCxCeI96EBPttwC8u1xEgpXV8C0XCZpYDbyrOIq73UitSLzanWFGTg
 /RBtfZjjPDA1q0L6t+00xHk7
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 31 Oct 2019 19:19:26 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 94DF419D0; Thu, 31 Oct 2019 19:19:25 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     sanm@codeaurora.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH 0/1] Add USB related nodes for SC7180
Date:   Thu, 31 Oct 2019 19:19:21 +0530
Message-Id: <1572529762-31256-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for DWC3 USB controller, QMP and QUSB PHYs
and enable them in idp device

This patch has dependency on below series

https://lore.kernel.org/patchwork/patch/1146675/

Sandeep Maheswaram (1):
  arm64: dts: qcom: sc7180: Add USB related nodes

 arch/arm64/boot/dts/qcom/sc7180-idp.dts |  25 ++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 104 ++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

