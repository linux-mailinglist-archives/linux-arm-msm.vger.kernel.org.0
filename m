Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDDB516BAA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 08:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbgBYHba (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 02:31:30 -0500
Received: from mail-pj1-f54.google.com ([209.85.216.54]:35668 "EHLO
        mail-pj1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728999AbgBYHb3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 02:31:29 -0500
Received: by mail-pj1-f54.google.com with SMTP id q39so903399pjc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2020 23:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=anRqB6ZtL5ycMSdajgec54nGj236WP/DD78Va57iy7E=;
        b=bxt4Go+kFXLoTGSLuVk7Qh43XAwFUpCugL/zR7Uq+NXiGfPA551Q9fJPKnKvVV+Jdn
         AKKdRX3y/FJl6613sHqwMD+tTsKEV2hti4sy3qHnVR66Q4D408T7K9cdx/8WdFfe6DFR
         Payjy6ihMlXDG6bjo1BarL6zYCvn9qqeeWfrFhpSb6ariCnYnMWxsUuZAsFZ/gagE0ss
         sfxSutPt+RGyzmMWC0Mzy6jT7a4l7f1ldZF8GsXmkr6z351C4qGl4WYpVJEwyFfImAJD
         H28d/q2ExOWTtNia4PG7h7nWIu3CIP+tnbaOQW3bjVxrlNv9qcPNLCx5EKV3/O2Cem1i
         ywhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=anRqB6ZtL5ycMSdajgec54nGj236WP/DD78Va57iy7E=;
        b=f8uNyxClFR31+B22WbSUD1/Ytfi0HeRIjqFpwfYRoyt+K0/XrlOnRmkKlvpCDkIC81
         3FU290I7o+3BG4gLDTK4kYvTrjNPhBpJlj4AWNwDQMu+Vpb0cM1IDoQL5do7m1kU5Uvp
         chubRCszQGtfohIxvmG4mOPwlyPKHJwfF1HkvoXKqiPFou8jp8QSyAFEM+YOQuSxgRFP
         yGvY5fuziGzCf7GrtSRqF7dypderxkoml59JBNKwkIVRSf30zxuqlxwNcQHiKFXADo55
         ecIo9ErnNs4bVVOw4dVhEnU90cnPUzBnBFwxhw64ApElG27xoFndDP32yxIxZ55Pw3Ak
         UoUQ==
X-Gm-Message-State: APjAAAUaDLduxuA4KDl8BP0Vmt3cERCLX7v9Y9Ag4fkYJtz/YcorHaPY
        oKwpUUJoDbab3J+9AqwBY/VmW9VcYSs=
X-Google-Smtp-Source: APXvYqzIhBgnnHmdXw789bIxcX/nWiy2QzrnJRrPhCxP/ISxohPFT45JIgqw5WHSHhqOshHIoNCGCw==
X-Received: by 2002:a17:90a:26e1:: with SMTP id m88mr3613337pje.101.1582615887991;
        Mon, 24 Feb 2020 23:31:27 -0800 (PST)
Received: from localhost ([103.195.202.114])
        by smtp.gmail.com with ESMTPSA id r3sm15946733pfg.145.2020.02.24.23.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 23:31:26 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v1 0/3] Cleanup dtbs_check warnings for tsens
Date:   Tue, 25 Feb 2020 13:01:19 +0530
Message-Id: <cover.1582615616.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make dtbs_check pass for tsens bits. I'm working on another series to
cleanup other DT warnings for QC platforms.

Amit Kucheria (3):
  dt-bindings: thermal: tsens: Make dtbs_check pass for sc7180 tsens
  dt-bindings: thermal: tsens: Make dtbs_check pass for msm8916 tsens
  dt-bindings: thermal: tsens: Make dtbs_check pass for msm8996 tsens

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi                     | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi                     | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.20.1

