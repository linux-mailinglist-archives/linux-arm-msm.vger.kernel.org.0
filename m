Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 416A7130E91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 09:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbgAFITE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 03:19:04 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37837 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgAFITE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 03:19:04 -0500
Received: by mail-pl1-f196.google.com with SMTP id c23so21582466plz.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 00:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aT/ncizRTyOPBJ+qteCCsUj3AuidFovzuZ7StBMRbcE=;
        b=aOfEimh3kCjZ8L1asNBESPiEe+6tiK/ui3GJVgZ6YiRbowwfMGmg2enJK37aarXShh
         1bbisyO0nMLwx5HwECPhDP6tPfGMza8KdWMsq/7JLVKyPCjBwXLnYA7nE8vFw1MqMY+0
         NI6FjqA/fDfPEyNTVssUS174SZCghfSk4Als1cORzdeWd2NTT3+ur/EgyziaR/ysg1LY
         jAVMfZ1Xl7v/QSI3TdxX3WSqw/3qIrdot3PLSJerzUih3jcKNyyjK9bXxNzjx2XkmxU3
         BDXCpEQMjRmH5ydOvy7cBdpHcB67j9I0xYBhP7f0E9h+cop2S5qz+qNQ+PCCFM5edE8d
         uRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aT/ncizRTyOPBJ+qteCCsUj3AuidFovzuZ7StBMRbcE=;
        b=enUUR1DY071dKVSQOZYojX9umBtdNjB7foxJwIfmc0zfugcU1evbRPOTaMsBQniHEP
         qHLulQGBN5pbfMob/40VKI1eJS6qe9We3FLvEZhjzgWlxd3+ttQE+FGqVY44p9IE2PWJ
         ZmEkMccFyM46T8OBbJSHO0U0lIFqA0slYQIz5wczQf8my/i+eogi1cu8jUEX7vsiGapO
         gMMdUnqp2bc43BjZPN67XHXONQ2dUU4jcoeEHJWpnrk9xvSgRY6k+Gn22XQ/zmQGO3Ug
         4MX7KPKHmSOr0W309ihfHtJMz1RRZ6V39e3syryC5WG9unYuCysuLF1qf4x3fQc7mClC
         07zA==
X-Gm-Message-State: APjAAAXIp+LRunkGtrPPKnlFp4BHc8+kuzK2P7Sj4goWEbrBtrLTxEHH
        h/nvWN0aSr4ynz3UfRqmvQd1Cw==
X-Google-Smtp-Source: APXvYqzzsPBM4bjl7JMe4acr4w9YucNEDzl559pHlJ77jdSG19Ar/9vxC3lOEiqb6ClRXTK8lE9wEw==
X-Received: by 2002:a17:90a:6484:: with SMTP id h4mr40033534pjj.84.1578298743755;
        Mon, 06 Jan 2020 00:19:03 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h7sm82343457pfq.36.2020.01.06.00.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 00:19:03 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 0/3] phy: qcom-qmp: Add SDM845 QMP and QHP PHYs
Date:   Mon,  6 Jan 2020 00:18:18 -0800
Message-Id: <20200106081821.3192922-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the two PCIe PHYs found in Qualcomm SDM845

Bjorn Andersson (3):
  dt-bindings: phy-qcom-qmp: Add SDM845 PCIe to binding
  phy: qcom: qmp: Add SDM845 PCIe QMP PHY support
  phy: qcom: qmp: Add SDM845 QHP PCIe PHY

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  |  10 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 313 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 114 +++++++
 3 files changed, 437 insertions(+)

-- 
2.24.0

