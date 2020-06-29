Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47DBF20E5F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgF2Vn0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbgF2Shv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 14:37:51 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B52C03143C
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 10:21:18 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id c139so15929661qkg.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 10:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I8kRZdRWy2CNksnUvA4vMT2OP8+RWTSu608AfsNc9EI=;
        b=1apygDmxhVUeOck6YT2ehOf2FANif1flKXbiiH5pwXFOcVL3MCIB3rLJrm2Fi891Nk
         MzNgJTynEbZEM6RmPWC6rQmHM0xisz7BS8Mjwg5hVhCpoBkycd9Pa4/fDRmeJb2AfcSt
         PKq/bGA9ZrC0iJjj+vpWRm5jsPwpOjtmRa2PZluqW4vceoiYtwMp1hIUCJHzoLXAxogj
         8qFJKmVqbkr6Il3ywL6U/S+ON5fpqB5wHxar/Oy1UeEpnPh8SP4+3Wem9ylowQrGiRHD
         e242nR2eel4UrZ83dpXwhn3F0kpR9CteDtJEr++DuU2FRVyM73GrngJ/hGJ73KXTgy5s
         9fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I8kRZdRWy2CNksnUvA4vMT2OP8+RWTSu608AfsNc9EI=;
        b=qvmXeVoTbDhKBA9P7Gi+x+1OxQ7Vrx2HZrz5xha+A2kLraxEgwI7HACvGVTsIGfrQW
         zwadfSU6BXkhxowmH/KHRWV6X2H9eHT4lgHpuovKp3zfib6j9jNpBd9ZFqg6zdIJ4yUi
         qsiqbEzR89rwSJtzvatHhPNKqV+XCovHfDZL+P287hmDCcjXOJjLAcS1kkywvVIaxMMt
         SgTYnBu4xSiLArTDYjb4Vl/M6ACqIiJBqZ7RYqwNg6L0ygbeOvs4NW+PhRyvc4WqHiDu
         8OyZRS7ENss0u0akZX8OdP6/8pQoP6Gg+fNPmDU2K0V0Qx5enYBx+PR4fnlTpvb+IviG
         AiqA==
X-Gm-Message-State: AOAM533XQE8Qk2Nfk/kJyZ6Ji0KZykL/ckY2dYlU+5GYVi8+RQM9ctcT
        1GHA+zVxn/BnyLxlT1s6noM4WCZkYgU=
X-Google-Smtp-Source: ABdhPJyjHZ1Ch/PjZ+965RMN96NmZrqCT+xeR/xLjS+9vfd0gWt6mXhLuZL/vyni7Vcfy2ZbrGQxEQ==
X-Received: by 2002:a37:a204:: with SMTP id l4mr15330059qke.200.1593451277354;
        Mon, 29 Jun 2020 10:21:17 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q5sm408363qtf.12.2020.06.29.10.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 10:21:16 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 11/13] dt-bindings: power: Add missing rpmpd rpmh regulator level
Date:   Mon, 29 Jun 2020 13:20:41 -0400
Message-Id: <20200629172049.30452-12-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629172049.30452-1-jonathan@marek.ca>
References: <20200629172049.30452-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add RPMH_REGULATOR_LEVEL_SVS_L0, used by sm8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index dc146e44228b..5e61eaf73bdd 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -55,6 +55,7 @@
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
 #define RPMH_REGULATOR_LEVEL_SVS	128
+#define RPMH_REGULATOR_LEVEL_SVS_L0	144
 #define RPMH_REGULATOR_LEVEL_SVS_L1	192
 #define RPMH_REGULATOR_LEVEL_SVS_L2	224
 #define RPMH_REGULATOR_LEVEL_NOM	256
-- 
2.26.1

