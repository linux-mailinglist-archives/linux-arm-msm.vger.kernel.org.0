Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6BA10C63C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2019 10:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfK1Jyd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Nov 2019 04:54:33 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:45163 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726448AbfK1Jyc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Nov 2019 04:54:32 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Nov 2019 15:24:30 +0530
IronPort-SDR: 4BUZRXIKWJ8jBgBwl6fahyP8/Kq1wKbnhiuUgPXOPy2T929t3bqcDrt1AtFN4/Cm6VYPelpcyG
 3yapZndjV0aEX9qyNRyuOGQpIWTXiDJG5Cm1ZTVNrB47R7gvQwWjWfUGnRswLr877u1uFKMJjM
 TfCl/0pcUVgqaz/009EnqSQ3hv2OcMT38OryDLHHjvsu+TcLydND1V/31dJyaw69AFo1/FQFwu
 /jve+rAOgQJV/Hwz1Dy6V45uyD4f/fLbUaaptdUnl9Jee5R6R7bustdeFH5G7UjVUqmtG1IyYb
 X9+FsD5pPCt0jKI8ntgTSPL6
Received: from c-rkambl-linux1.qualcomm.com ([10.242.50.190])
  by ironmsg01-blr.qualcomm.com with ESMTP; 28 Nov 2019 15:24:12 +0530
Received: by c-rkambl-linux1.qualcomm.com (Postfix, from userid 2344811)
        id 0CF2A1A68; Thu, 28 Nov 2019 15:24:10 +0530 (IST)
From:   Rajeshwari <rkambl@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaa@codeaurora.org,
        sanm@codeaurora.org, Rajeshwari <rkambl@codeaurora.org>
Subject: [PATCH v2 0/1] Add device node support for TSENS in SC7180
Date:   Thu, 28 Nov 2019 15:24:06 +0530
Message-Id: <1574934847-30372-1-git-send-email-rkambl@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add TSENS node and user thermal zone configurations for TSENS sensors 
in SC7180.

The change has dependency on adding device tree support for sc7180 [1] 
to merge first.

Dependencies:

[1] https://lkml.org/lkml/2019/11/8/149

changes in v2:
* Added polling delay.
* Removed unwanted properties.
* Updated sensor names under thermal-zones.
* Updated trip points.
* Added interrupt support.

Rajeshwari (1):
  arm64: dts: qcom: sc7180:  Add device node support for TSENS in SC7180

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 527 +++++++++++++++++++++++++++++++++++
 1 file changed, 527 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

