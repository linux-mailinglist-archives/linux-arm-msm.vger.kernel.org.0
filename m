Return-Path: <linux-arm-msm+bounces-5967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7FE81E432
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Dec 2023 01:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C21E1F2304D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Dec 2023 00:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913A5137B;
	Tue, 26 Dec 2023 00:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BSvIRUU+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83161A28
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Dec 2023 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cc6b5a8364so36317701fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 16:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703550888; x=1704155688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSqq/oRAK8tG/6OBNWJ7j1pib3lTQhlU58NT4JC7FjY=;
        b=BSvIRUU+TWxuPDAzpRZsiNAa4NSLxShC1XboJVtxI2+JxNvRMk+F1i3N20FZ7xh9VM
         R2LInkWUANMkFNdZT3aQQ1TQnraXSwUtoqZAtdukVF2NrkkOlCx8Y3+cew0AVAS6uVtD
         tZhlth/ErUfkVEZwh8Zqvnhj33NAeuOGZB482MNBenHlrfsLudTqRtz7y7Z745v4Hh2/
         /Dt4zUhAcn0JukAxqlrX+nVBMLAJA7BwbGFdHuSFCdZadvHGBjr5wwB8og8AgX52qu9w
         4g/VrGp1gfLsATcvTQQBoUpRnXOOPGkuDzWzr5+kOUYuygGbcj1qpU5LNZfnnX8XxT8W
         kckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703550888; x=1704155688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSqq/oRAK8tG/6OBNWJ7j1pib3lTQhlU58NT4JC7FjY=;
        b=BUEZX4+wi1xJ613Kw/8YOfUZgTUwFk0Ot1XewAFEm6RYRO8bx5u5IKJYnOLif3ODdh
         loOjyrkrrCvt64jlR4rjmCkT3a1V459Pn8Mxarm+2it7DaSEu73OQCBaqvCjIoR4mPit
         111ZUaLbSJXIOiajzgWtzl0jGuHQWc/AZb6SPp63hS7dx/Rxv4wEoVbi6PgygImdOx13
         EycKDAo/4ePplYEvgaPQikzU1eJe4L5apUjzXgGzUW94ktCM+mj3PTBqOuMcL6V3hsmG
         r8xV7gvM6piN5UcZXuS1YcVmWV/G/++9xR66FFakuoloXmHslnEfxRPLj4r5XfiI80QW
         rltQ==
X-Gm-Message-State: AOJu0YxrK/e035viLsFCloFxKYBc2H5yimd3WOH5+rh7IC47eJicSIQ3
	sYRjZ3PkPHu8DeL9y6C+SZxUqyEDXvj2FUxDJCHbG4AfgEpFig==
X-Google-Smtp-Source: AGHT+IGR9Z2RMSQd+nXkE/c0vlRSUUG71sv+Oa2PTNfwTNLaPDde+99dFVskzIZpJV/OxZqu2gHH8A==
X-Received: by 2002:a2e:9895:0:b0:2cc:94dd:483e with SMTP id b21-20020a2e9895000000b002cc94dd483emr2243027ljj.2.1703550888302;
        Mon, 25 Dec 2023 16:34:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a05651c088100b002ccb1301d53sm1368810ljq.48.2023.12.25.16.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 16:34:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH 0/5] soc: qcom: add in-kernel pd-mapper implementation
Date: Tue, 26 Dec 2023 02:34:42 +0200
Message-Id: <20231226003447.3044365-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protection domain mapper is a QMI service providing mapping between
'protection domains' and services supported / allowed in these domains.
For example such mapping is required for loading of the WiFi firmware or
for properly starting up the UCSI / altmode / battery manager support.

The existing userspace implementation has several issue. It doesn't play
well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
firmware location is changed (or if the firmware was not available at
the time pd-mapper was started but the corresponding directory is
mounted later), etc.

However this configuration is largely static and common between
different platforms. Provide in-kernel service implementing static
per-platform data.

NOTE: this is an RFC / RFC, the domain mapping data might be inaccurate
(especially for SM6xxx and SC7xxx platforms), which is reflected by
several TODO and FIXME comments in the code.

Dmitry Baryshkov (5):
  soc: qcom: add pd-mapper implementation
  remoteproc: qcom: pas: correct data indentation
  remoteproc: qcom: adsp: add configuration for in-kernel pdm
  remoteproc: qcom: mss: add configuration for in-kernel pdm
  remoteproc: qcom: pas: add configuration for in-kernel pdm

 drivers/remoteproc/Kconfig          |   3 +
 drivers/remoteproc/qcom_q6v5_adsp.c |  67 +++++
 drivers/remoteproc/qcom_q6v5_mss.c  |  84 ++++++
 drivers/remoteproc/qcom_q6v5_pas.c  | 418 +++++++++++++++++++++++-----
 drivers/soc/qcom/Kconfig            |  10 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/qcom_pdm.c         | 302 ++++++++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.c     | 189 +++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.h     |  66 +++++
 include/linux/soc/qcom/pd_mapper.h  |  35 +++
 10 files changed, 1108 insertions(+), 68 deletions(-)
 create mode 100644 drivers/soc/qcom/qcom_pdm.c
 create mode 100644 drivers/soc/qcom/qcom_pdm_msg.c
 create mode 100644 drivers/soc/qcom/qcom_pdm_msg.h
 create mode 100644 include/linux/soc/qcom/pd_mapper.h

-- 
2.39.2


