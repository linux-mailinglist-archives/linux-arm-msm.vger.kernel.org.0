Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50072127578
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 07:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfLTGDg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 01:03:36 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34605 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfLTGDf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 01:03:35 -0500
Received: by mail-pf1-f193.google.com with SMTP id l127so4620706pfl.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2019 22:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Piggj3igE+oTFBOKGrWnYsbfHlwF09Ix52svgNc4Z6E=;
        b=pLeNJvZiYSUMVKQTjOw2ruIUe0kg7oUO9yboFRxiF3AMsFUZkdRFmVXFG2NUkD1o5j
         xW+G1e/7PAmrgAJ0afn2aU95LUubYdZ1JDkrrm0Iv3k5jqbQOIZ+W88GCxCSrbQAoWVI
         kn1bFQ2ASmw7KXEKtyF6vBkHtNYcwER5+hEOyIcvudubYBKi0nmpV9d4jDspwpvvDkuq
         wtGJQe413l8UdQJAVBur1OoVTpooogA8MefwlKeENEe0uAPwe0wb6AtdNI4d+2XDQBi9
         nkqkEQqmDc+DSYbuFSbseaOpiaBO6KjMg3G4zQ1oYSYI9vKsGsdpnVtJj/88kW1at/e1
         xJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Piggj3igE+oTFBOKGrWnYsbfHlwF09Ix52svgNc4Z6E=;
        b=qT9SRjio/MLLkVFKwCIkrTuJpMgDu1l4HlmNwslqvZu7khTlkCteRRl6OpyL3YPELQ
         OvxVq2pLcWa/vz00iGZrwmNN+x0p/dif6DEQWrrf/jlbnhZ3wBLR/0uamyBEqPT6dhSd
         GTHvAv3Z4j0kHtkJ8KMkoxwVXbioaJ69Xhq1DjHtmReJrgU0rrukiMlN60eAzWNBu/ZO
         72lWW+BRsKhq7hdeD0oYGck6Tydw+G/D73Ri46njROwKcNv6hEEEWllbzrf688p01OsY
         vMuuUqbeYnKi6wzYIcv6CwNxLz03KMnsC7nbCqeR400mjpkT7y8yo5XeKHiwnGYcM99S
         R5WA==
X-Gm-Message-State: APjAAAXBdUuNqh4pI0rvBYxqhZddS4Czc1dsEWm+ZyDaZfR/b8TJPVD1
        TueDR4gieK1Oqled/Hnh9AsT6g==
X-Google-Smtp-Source: APXvYqwbzg95n0mg6BVy/iFiaEaWJVWRYFTtj2/p96TdsBX9NSamr/8qO1idzprzYhgDy5ZWnuCnvQ==
X-Received: by 2002:a62:64d6:: with SMTP id y205mr14245081pfb.41.1576821815076;
        Thu, 19 Dec 2019 22:03:35 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l15sm8835710pjl.24.2019.12.19.22.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 22:03:34 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] phy: qcom-qmp: Add MSM8996 UFS QMP support
Date:   Thu, 19 Dec 2019 22:03:02 -0800
Message-Id: <20191220060304.1867795-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds support for the 14nm UFS PHY found in MSM8996 to the common QMP PHY
driver and migrates the msm8996 dts to the new binding, which will allow us to
remove the old driver (and the broken 20nm driver).

Bjorn Andersson (2):
  phy: qcom-qmp: Add MSM8996 UFS QMP support
  arm64: dts: qcom: msm8996: Use generic QMP driver for UFS

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  |   5 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  33 +++---
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 105 ++++++++++++++++++
 3 files changed, 128 insertions(+), 15 deletions(-)

-- 
2.24.0

