Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DAF2F51F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 19:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbhAMS0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 13:26:23 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:53343 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728195AbhAMS0W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 13:26:22 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4FB513F249;
        Wed, 13 Jan 2021 19:25:25 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 0/3] QCOM QUP I2C - Add noise rejection, convert to YAML
Date:   Wed, 13 Jan 2021 19:25:19 +0100
Message-Id: <20210113182522.443262-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series converts the i2c-qup bindings to YAML and then
adds support for noise rejection, which is needed for some noisy
hardware, like the touchscreen on the F(x)Tec Pro1.
After adding noise rejection, the touchscreen stopped showing
ghost touch issues and lockups.

Tested on F(x)Tec Pro1 (MSM8998)

AngeloGioacchino Del Regno (3):
  dt-bindings: i2c: qcom,i2c-qup: Convert txt to YAML schema
  i2c: qup: Introduce SCL/SDA noise rejection
  dt-bindings: i2c: qcom,i2c-qup: Document noise rejection properties

 .../devicetree/bindings/i2c/qcom,i2c-qup.txt  |  40 -------
 .../devicetree/bindings/i2c/qcom,i2c-qup.yaml | 101 ++++++++++++++++++
 drivers/i2c/busses/i2c-qup.c                  |  16 +++
 3 files changed, 117 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml

-- 
2.29.2

