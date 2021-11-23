Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DE945A1D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 12:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233400AbhKWLxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 06:53:08 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:37447 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229948AbhKWLxH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 06:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637668200; x=1669204200;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=LmdmbYRXM1yYnutaGQUY9gh1a0K0MmiO8WJr++/5KD8=;
  b=DuaczSfUOUFntj8qBBg4OmCPKIPbaRkIQGXE7fDmmj58gX1/imPFmlW/
   okUUQqMlR4mbkL0ow3tbRQ84bcqFC5ddiZJhd6E9y5YBBst7N/ohDL3wH
   6GqKm+n7wWpxfxBQ2AjI4SgxZ43fk7McBuh45guQaGeC6Oik3cWp7fZDQ
   I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Nov 2021 03:49:59 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 03:49:59 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 03:49:59 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 03:49:55 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        David Collins <collinsd@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <swboyd@chromium.org>,
        <mka@chromium.org>, Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH 0/3] Add PMG1110(Seco Jr) PMIC support
Date:   Tue, 23 Nov 2021 17:19:24 +0530
Message-ID: <1637668167-31325-1-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series depends on below series which adds the base CRD dts
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=584349

Satya Priya (3):
  dt-bindings: regulator: Add compatible for pmg1110
  regulator: qcom-rpmh: Add PMG1110 regulators
  arm64: dts: qcom: sc7280: Add pmg1110 regulators for sc7280-crd

 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml   |  1 +
 arch/arm64/boot/dts/qcom/sc7280-crd.dts                      | 12 ++++++++++++
 drivers/regulator/qcom-rpmh-regulator.c                      |  9 +++++++++
 3 files changed, 22 insertions(+)

-- 
2.7.4

