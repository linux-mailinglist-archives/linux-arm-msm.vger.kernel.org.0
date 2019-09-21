Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 566CAB9D33
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 11:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394077AbfIUJvX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 05:51:23 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33210 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389497AbfIUJvX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 05:51:23 -0400
Received: by mail-wr1-f67.google.com with SMTP id b9so9141391wrs.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 02:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u1M/FU0V6bWnRge+RDqMTT8z1z1pC5FEaXUJkUWtccg=;
        b=LjGOzbYb/xh8iQ0EbUKDdKjXjH8SbPSzvQTAlABBlkHnJJzZFRF7tOpS4JmP9408wU
         M1fGCVLyvKcA1EYMeypio1GFAbSdArZnYnkE7Nu8oBGG/TFPiyVdaKkDMplYJHhvwYTd
         t5grxtwqQzXuQd8S9wMvW6aIfXlQbTLwgzZTmksgVvesrB0lvyQ3UnFfiE9188GtUT9B
         mo5uLLD/ZrKvN/O+zZZ9HTdNj/4HZHvQl1wT/8hHMAmzpb8mM9IAsLhYNGaSk9xmDkJR
         CFWKS6zu87Act/19DPJ58ToUtYF6FPrXmHkfD83MoGY2xvnGcKYImuGK21M+5IFSi/Go
         aMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u1M/FU0V6bWnRge+RDqMTT8z1z1pC5FEaXUJkUWtccg=;
        b=OubA5cIXl2K9ZgSNP4s/AWOz4378A2NZg7v5PFHtwaQ8zgGCPPX9lr23NfGfiDuaQN
         2YHoja+kwFj2fvRDMHxP2Mif0VlGU1BGTRVQaP7BW+qNsShEd2GkABj3XO0tbwalhx+9
         51WoiOjRkHSFwKQSCM+AEixeUNYeBgWGFvjaVdi/1xctylvpATQ7of0vDKAuWPshLG8i
         9Dz9UP1+LJAc+v44kNxr/HMwkhDbAGNX1Na4Y9NmHRxC3vQ8KSAttL5wTE6l2f8cV6uv
         aB8UjAN0keNpDCKXBZ9YKwlq4dP2EQhDXklkoFNZLSQWxrECsb6FkVPnbPMVJOjbn9rJ
         umzQ==
X-Gm-Message-State: APjAAAVwp+TnMzuw03QGdGZ5H4jRxywGj0cDEOUxn/Ld03iPpi+J+rQH
        VcPhN1N52H86oFzuh36m3Kc4RO7DV3Y=
X-Google-Smtp-Source: APXvYqzzV/9GAmv5QqmY99eXTU2VNYUGZ4D3EaxsCyZRfEGBjAWZBhSGwgaMtvRZ8PZVXZ1ICZ0C2A==
X-Received: by 2002:adf:8b13:: with SMTP id n19mr15326285wra.203.1569059480757;
        Sat, 21 Sep 2019 02:51:20 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id c8sm4947094wrr.49.2019.09.21.02.51.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 02:51:20 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org,
        lee.jones@linaro.org, agross@kernel.org
Subject: [PATCH 0/5] Add support for PM8950/PMI8950/PM8004 regulators
Date:   Sat, 21 Sep 2019 11:50:38 +0200
Message-Id: <20190921095043.62593-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

In this patch series, I'm adding support for the PM8950, PMI8950
and PM8004 regulators (smd/spmi).
The PM(I)8950 regulators are required for multiple SoCs, like
MSM8956, MSM8976, MSM8953 (and maybe others), since they all use
the same PM/PMI combo in their own variants.
The personal aim is to upstream MSM8956 as much as possible.

This code has been tested on two Sony phones featuring the Qualcomm
MSM8956 SoC, with PM/PMI8950 and PM8004.

Angelo G. Del Regno (5):
  qcom: spmi-regulator: Add support for ULT LV_P50 and ULT P300
  regulator: qcom_spmi: Add PM8950 SPMI regulator
  regulator: qcom_smd: Add PM8950 regulators
  mfd: qcom-spmi-pmic: Add support for PM/PMI8950
  regulator: qcom_spmi: Add support for PM8004 regulators

 .../bindings/mfd/qcom,spmi-pmic.txt           |  2 +
 .../regulator/qcom,smd-rpm-regulator.txt      | 21 +++++
 .../regulator/qcom,spmi-regulator.txt         | 25 +++++
 drivers/mfd/qcom-spmi-pmic.c                  |  4 +
 drivers/regulator/qcom_smd-regulator.c        | 92 +++++++++++++++++++
 drivers/regulator/qcom_spmi-regulator.c       | 43 +++++++++
 6 files changed, 187 insertions(+)

-- 
2.21.0

