Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B6F3C2A1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 22:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhGIUL0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 16:11:26 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:40819 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhGIUL0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 16:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1625861323; x=1657397323;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mMYDYOQ9sZ9dClijR2BSzVYxUqZo22v4E1TMQ3hUjTo=;
  b=OGT4GwmTTcowzo5nU6amTrFSw8c1KQZp0my1zkEGencs8jlp+StsspLQ
   xgMKF478/Ml3/Me4lGYnNS0uvq9c9II7oCMxyykoUREqQgZfBdKQQnak6
   Pky3NWcWzv+zPNbAEHCyIxOh1XCe6pfNksm4NamwEOSRvyZlQm6T0qR/b
   k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 09 Jul 2021 13:08:42 -0700
X-QCInternal: smtphost
Received: from nalasexr03e.na.qualcomm.com ([10.49.195.114])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Jul 2021 13:08:42 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nalasexr03e.na.qualcomm.com (10.49.195.114) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 9 Jul 2021 13:08:41 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <robh+dt@kernel.org>,
        <bjorn.andersson@linaro.org>, <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi Krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH 0/1] Devicetree update for SDX65 platform
Date:   Fri, 9 Jul 2021 13:08:18 -0700
Message-ID: <20210709200819.20373-1-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03g.na.qualcomm.com (10.85.0.49) To
 nalasexr03e.na.qualcomm.com (10.49.195.114)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Hello,

This patch adds pincntrl node to SDX65 dts. This patch series depends on
the previous patch series which adds pinctrl support for SDX65 and
devicetree support for SDX65 Modem and MTP.

Thanks,
Vamsi 

Vamsi krishna Lanka (1):
  ARM: dts: qcom: sdx65: Add pincontrol node

 arch/arm/boot/dts/qcom-sdx65.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.32.0

