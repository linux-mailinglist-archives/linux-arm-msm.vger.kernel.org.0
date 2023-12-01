Return-Path: <linux-arm-msm+bounces-2900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DD3800E37
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30326281B22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 15:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18E2495DF;
	Fri,  1 Dec 2023 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ucYHW4Tf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1818710DE
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 07:14:29 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ce06c30b06so497929b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 07:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443668; x=1702048468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AUXpiI1HIHar4nszgC34tqcGQO72u7/9KK72eoUn/m0=;
        b=ucYHW4TfsNmzie2dOI98fMpUY5GzQqni0265D7x0vJ/ah3L2o2DRIsovbI+pnN4430
         lwawxmHCFsFeWF2svDRtB08iyQSF+UBvaB7e9zFn8GDKB2cWW20pdsCbFBee9OwvGO6t
         Jgz4vuluOQGuF5ajl037IPK4I0gvCAzbs5p7Awuavix56YQU97R7SHpOWh26p/hF1D95
         U1JD2Jz2f8HzwdkDxJY+FmTCWyhh1dr5qdSUZ+avrbhHtWbejr8e7qYYhnnnsOGd79S2
         2s40GEGK2H4I5XP24pDX6a3btZaZHXTa7MOPQk9wW/oTzNie60FLe8+iOG0cwmPW7/Jv
         2m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443668; x=1702048468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUXpiI1HIHar4nszgC34tqcGQO72u7/9KK72eoUn/m0=;
        b=UCzgMQCO7r4YXiNrCNLcdQpwL4/tDnJWqz3G6Iejo3sMVrFwyA0cvJEXqOaYhCMwNA
         26Ntaabylivt8IrwmCzpEFAMki4v2KN9rEMJSqhXGy7I9n/XzuEgHrK4ONr7K4Dq4C0D
         MRuJhkzs9et/R7Blnn6IVUq4QBZtOA5sD8VLfFDsGwRbzf1dk1Zn7b3rCRlEYBKK7tQd
         3l68vQOftU5PxMSIJprzjWOf7orQ2Kx+Pva2TuXZgoH+dxuB9ixCmTsJhHWZmET5Q3tK
         QdaNApgVtGa3jAbmAujn9tS06Vmg8H20sTBv2c5K5n4HaPcuz5IRu9sKr4Jur97NhYrx
         GV6A==
X-Gm-Message-State: AOJu0YxIGjCaX0ocw6W7AeQbM3eqDS6ceSsQHxrLk8294V585PRQ+Etv
	1WQjS3sUtr2IpyehaKwJaOwx
X-Google-Smtp-Source: AGHT+IEnHLXEm9et6sxxnwHKFL/XwVuOliwUqpAfFgSFw3DXH7guGuMqTVOIRUyPv5TBQwBgPxgkSA==
X-Received: by 2002:a05:6a20:d704:b0:181:44c:d6a with SMTP id iz4-20020a056a20d70400b00181044c0d6amr36642382pzb.21.1701443668367;
        Fri, 01 Dec 2023 07:14:28 -0800 (PST)
Received: from localhost.localdomain ([117.213.98.226])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b00578afd8e012sm2765824pgv.92.2023.12.01.07.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:14:27 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: martin.petersen@oracle.com,
	jejb@linux.ibm.com
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/13] scsi: ufs: qcom: Minor code cleanups
Date: Fri,  1 Dec 2023 20:44:04 +0530
Message-Id: <20231201151417.65500-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series has some minor code cleanups to the Qcom UFS driver. No functional
change.

Tested on: RB5 development board based on Qcom SM8250 SoC.

- Mani

Manivannan Sadhasivam (13):
  scsi: ufs: qcom: Use clk_bulk APIs for managing lane clocks
  scsi: ufs: qcom: Fix the return value of ufs_qcom_ice_program_key()
  scsi: ufs: qcom: Fix the return value when
    platform_get_resource_byname() fails
  scsi: ufs: qcom: Remove superfluous variable assignments
  scsi: ufs: qcom: Remove the warning message when core_reset is not
    available
  scsi: ufs: qcom: Export ufshcd_{enable/disable}_irq helpers and make
    use of them
  scsi: ufs: qcom: Fail ufs_qcom_power_up_sequence() when core_reset
    fails
  scsi: ufs: qcom: Check the return value of
    ufs_qcom_power_up_sequence()
  scsi: ufs: qcom: Remove redundant error print for devm_kzalloc()
    failure
  scsi: ufs: qcom: Use dev_err_probe() to simplify error handling of
    devm_gpiod_get_optional()
  scsi: ufs: qcom: Remove unused ufs_qcom_hosts struct array
  scsi: ufs: qcom: Sort includes alphabetically
  scsi: ufs: qcom: Initialize cycles_in_1us variable in
    ufs_qcom_set_core_clk_ctrl()

 drivers/ufs/core/ufshcd.c   |   6 +-
 drivers/ufs/host/ufs-qcom.c | 165 ++++++++----------------------------
 drivers/ufs/host/ufs-qcom.h |   6 +-
 include/ufs/ufshcd.h        |   2 +
 4 files changed, 43 insertions(+), 136 deletions(-)

-- 
2.25.1


