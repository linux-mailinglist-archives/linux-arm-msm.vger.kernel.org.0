Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C71C12E424A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Dec 2020 16:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408201AbgL1PUe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Dec 2020 10:20:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408204AbgL1PUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Dec 2020 10:20:31 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50515C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Dec 2020 07:19:50 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id h205so24566833lfd.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Dec 2020 07:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AWbzcLtVxYkAeDSBUMBsoVxC/adcxeMf1gw8SFBkAiQ=;
        b=xpfPdaHs6YQo1lnLmSBnP5NduuWYSML8GWC6lAnJN8jktXByQDerIeLdmpRlM/xOMU
         YmfWc0Ab0e6juQjTGY5Xtl0y+wunR7veh91esDJR/7VgkFxT1IhDOO8CDzJyejsekaxJ
         IGxVBYxGRp14PGZxJKJR+qJzV9ye4z3ATIuQV0PTIO9usw6QyxefnKemxLoBHTjo5bXJ
         7h53G5RKzMpeLaqVSsxuAH2LYKBCrDAkMT8ZXOWEinePH2xMAAH2tzfrICKHX5de6lMi
         WDNBD0bWlX0IUd5/7QFk/AJf2IoKInRCQHIr9DMwS5ZbwlHFx8SJaRwhyBvnCF/bj0w3
         JMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AWbzcLtVxYkAeDSBUMBsoVxC/adcxeMf1gw8SFBkAiQ=;
        b=N9IoHpoFofzDiMOjNUypcaZf+XxQLuojol+K0qAseeAiTYArTUPyWvkMwCBtOKJRaI
         CrjOmAAXZoCuvrjJvk2zRaWb4M7VdtwMzpBYGDD2VZObbJVlrrXMEba2gZartYo3Cika
         MqIqomc3r6IhTGTfkVjoKhypTGIHPITU7BGJJOo2Ah9pbHZ0t8pkAEk8Il7LD0M/L4jB
         P+bU8qLIgehRBdBlGdWUTwiS5olma3Z9sP4VrR0ofZnLrL9sbHymsc29FEHvxCXVuym3
         ykuxnO6Kr/rmSUovBjRE4LJEiG5ZHffAtpJZ09ch//wc4ort4vgSHavhouuqDbqPKEcm
         xJlA==
X-Gm-Message-State: AOAM5335n2k3G++ATyZc2wBiB5q7KB4hjFOcRS2qI9c0Tl193CVu0ogV
        Qxu3Ma2zVg9HjfLbPVn5yBp11ubG7G0PpZPt
X-Google-Smtp-Source: ABdhPJxGV8F8o+RPU0pPzlhHPqUcVQIvIlpyCsj+BZ0doUZ0JX4uakRFnOoxYjGee6g9wnY51maAag==
X-Received: by 2002:a19:950:: with SMTP id 77mr18531013lfj.133.1609168788103;
        Mon, 28 Dec 2020 07:19:48 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id t1sm6499251ljg.44.2020.12.28.07.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 07:19:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: enable Lontium LT9611UXC bridge driver
Date:   Mon, 28 Dec 2020 18:18:27 +0300
Message-Id: <20201228151827.4019213-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable lt9611uxc driver for Lontium DSI to HDMI bridge found on Qualcomm
RB5 Robotics platform. Enable this driver to get display working on this
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 09b4b690b2c4..3513d9b4c5da 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -684,6 +684,7 @@ CONFIG_DRM_SII902X=m
 CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_THINE_THC63LVD1024=m
 CONFIG_DRM_TI_SN65DSI86=m
+CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_I2C_ADV7511=m
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
-- 
2.29.2

