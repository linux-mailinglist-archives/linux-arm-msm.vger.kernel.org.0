Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8864618AC5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 06:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbgCSFko (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 01:40:44 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36133 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgCSFkn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 01:40:43 -0400
Received: by mail-pf1-f193.google.com with SMTP id i13so815460pfe.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2020 22:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5dFv7/70FKhDKgZsv7z5MRkFYJ6r4vLqdadhMT5bcVs=;
        b=DEClMfOtnRcUSt/Yj3j7ZFjx+OzidFY/dj2fl7OnWDpSQZemsOdE5BmIXK5wIIm9Cs
         q9l76oPFb7v6POI8ur1cBXFfBWlKSVDuE7g6S5mIy/RTq1WXCnPFO3/gzp9+SgDbqUEM
         li+MjvzVXH5Z0KYBsfycUMoTMvFvAujJLJt5/fG5vEY8HZnGjYyK8LSZHiDdoq4VE/Ov
         rg8N3tj36/Xu3JoNHW5N+q7i+pUOnHYU0QmgXqj0t3OVuzEpiGgKZZh2Dqs2ufCnMFzG
         ItpOTGZGzt0fMlbNjj4PL4RJw4JkJ+chhx9XzUWXCsZmkpg+Nc/Qh58yCxIl63Fmmt/B
         pIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5dFv7/70FKhDKgZsv7z5MRkFYJ6r4vLqdadhMT5bcVs=;
        b=cZXclOqpHx44CC40kG0CkOtnsPfvCoskX44N56l71UbNnAEqVAFlOQDJYPv/VZEJmh
         fHe2+zYQNfmej7P4xO/vWkvMOORTUOw2nQXw+d6CMWXLdrwRYH+/RRESiB3UMa+RsPo1
         OCj2SJB6InnkZmXunMOWV/rnOIFLxSGQx4kUDKPq9xkB01SFODi4t7AGqFhPTXzNr+ud
         qwVwbZ7DSxxhRPsWKlrgNDj4eRs6TyX5pRn3tQO0ilGm7fYYSTCwXksTwYcoq5mWAHrM
         hGktk3nvORS/AAi5sTtFqVW29DjYHSg0p0YjMRAHzhqRDPbSbH83t8M/Y3+4L1YMjxcq
         reYQ==
X-Gm-Message-State: ANhLgQ2DU+XPPpjwY+lxJ7RVUAlASR8a3PKn+9RVMq7nVQUJA/P6nxoE
        8KKa3KCkeyaweaTdkADAtmo1Qw==
X-Google-Smtp-Source: ADFU+vt+jLntul6FGkobwwASG/5WIX4bgXPG687fd+93UVN/ITFrGOV3ahed94A7k0lgV6aBkV+s7g==
X-Received: by 2002:a62:30c3:: with SMTP id w186mr2111437pfw.245.1584596441255;
        Wed, 18 Mar 2020 22:40:41 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l125sm229126pgl.57.2020.03.18.22.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 22:40:40 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
Subject: [PATCH 0/4] clk: qcom: gdsc: Handle supply regulators
Date:   Wed, 18 Mar 2020 22:38:58 -0700
Message-Id: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Handle supply regulators for GDSCs to allow probe deferral when regulators are
not yet present/enabled and to allow the GDSC to enable/disable dependencies as
needed.

Bjorn Andersson (3):
  clk: qcom: gdsc: Handle GDSC regulator supplies
  clk: qcom: mmcc-msm8996: Properly describe GPU_GX gdsc
  arm64: dts: qcom: msm8996: Make GPU node control GPU_GX GDSC

Rajendra Nayak (1):
  arm64: dts: qcom: db820c: Add s2 regulator in pmi8994

 .../devicetree/bindings/clock/qcom,mmcc.yaml  |  4 ++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi  | 14 +++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi         |  6 +++++
 drivers/clk/qcom/gdsc.c                       | 24 +++++++++++++++++++
 drivers/clk/qcom/gdsc.h                       |  4 ++++
 drivers/clk/qcom/mmcc-msm8996.c               |  2 ++
 7 files changed, 55 insertions(+), 1 deletion(-)

-- 
2.24.0

