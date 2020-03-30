Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34BF819784D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 12:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbgC3KGe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 06:06:34 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37681 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728232AbgC3KGe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 06:06:34 -0400
Received: by mail-pg1-f193.google.com with SMTP id a32so8435005pga.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 03:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rCDZDJlysJhXfpiBO1XjknNGnMdzqMitgGarrB4D0Go=;
        b=rcnlHAN4S2P3qXI5QF+Y5grQereDq1PNGtU/ubadlUiv5qvNhmTbHits4RPEwRyOBU
         hRlQXEGPnVApcVzTULEl4e/FgB2OfkQ6Fo139anpYQAfq8g/UU3y8+9kA4JD5gHeSV3W
         8cyTa6kjfk1EGbmAxzjt1h5r9fl5RoBpeYG5/b6tkjCVj/jtXPwuTYvfEgW3/NkpqTGt
         o6VqrHEBrqPAzGTFVbbe8k9Ey3pSm+2+bxABpTWFvloHdWSMILzznSG9IbS9VRxVrVPd
         PZAx1+c/dD22RgpnCDGCV+Gf5ZpO2CXPnpZRGzbPAnN20XaEatKxrXMwHQWhKZwT5Wmn
         xntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rCDZDJlysJhXfpiBO1XjknNGnMdzqMitgGarrB4D0Go=;
        b=HSJSJ3c08w3sY/kxfvlbOxJyssEg98ingOQLPnH0SONAAXLOg5Ajui3WU+dCxkn3U5
         ufKlCfxGgkQIKcIJuM8zDAj2OLSPQhOpE5xcA3h0kmQg1v/63Z9uYL8ZWNP6P8G7aIpM
         RorOrM34hdeDwt/YNn8eQXb0kAx0LVo7F6u3DVJex9BRHssy2OA6lAQWYXZKANBEgYM1
         lmL7M1KIYRVIFtlKOqMdXamU45bbf/7A9KZWcnRtkm0ChTChuIqW5SVpC+Vup/ZDzLUx
         qdse8BiqOvBxhcObgHXZSoMQSgshC79almhFgxfSC0DnIIn3PdqDcwpBw/URbb3t+A0N
         GEow==
X-Gm-Message-State: ANhLgQ0U86ib7wIqPjMhiE4o/akcHCEaibZ/UTyiF5zh4vnOcP1I+gBp
        dF6naWwaDn1LKZR1hr+PaPl9hg==
X-Google-Smtp-Source: ADFU+vswMuTmj07ZJkt13uQAo+NdaDRcPhPAaO5t3pkoEPzJ6O3wxeHdKQc6XeaQ7YJyx0FfBFnoyg==
X-Received: by 2002:a65:5383:: with SMTP id x3mr12028223pgq.279.1585562792992;
        Mon, 30 Mar 2020 03:06:32 -0700 (PDT)
Received: from localhost ([103.195.202.48])
        by smtp.gmail.com with ESMTPSA id my15sm10223033pjb.28.2020.03.30.03.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 03:06:31 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 0/3] make dtbs_check cleanups for qcom thermal
Date:   Mon, 30 Mar 2020 15:36:25 +0530
Message-Id: <cover.1585562459.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clean up the remaining trip-point names in qcom dtsi files. This is similar
to the cleanups done before:

commit e8c48eb08ab14 ("arm64: dts: qcom: qcs404: remove unit name for thermal trip points")
commit 19e684e835f63 ("arm64: dts: qcom: sdm845: remove unit name for thermal trip points")


Amit Kucheria (3):
  arm64: dts: qcom: msm8916: remove unit name for thermal trip points
  arm64: dts: qcom: msm8996: remove unit name for thermal trip points
  arm64: dts: qcom: msm8998: remove unit name for thermal trip points

 arch/arm64/boot/dts/qcom/msm8916.dtsi |  8 +++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 28 ++++++++++----------
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 38 +++++++++++++--------------
 3 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.20.1

