Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8423D4F316
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2019 03:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfFVBVv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 21:21:51 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37942 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfFVBVv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 21:21:51 -0400
Received: by mail-pl1-f193.google.com with SMTP id g4so3786795plb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2019 18:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gfKY55VDFmH9sfDf7QmSwnOcZWdz3/zPBcS1vbxTeIs=;
        b=vSE0SwOpKpJr4NR9EMm+8dVlG2peppROnIGEZle3TSjbPYS/NAc3/8BaXLuoGTies0
         nW1NbiYojr581BtnqZNlK3MJSythEOHVVihKngZUfmHVIMpsqUYWdw3IhT2sqHsV6sWi
         W4BIIOjK7yTDtJqj6eTDHISx+Nyl3A1NgqTXsv85rTbrlaBbEHGdSSYIfsVcXMHZp0nT
         oE2xzNxcPuzvVpIaOSx0u5orCPE/PvCFXZ/gGLN0HcqPW6q5yJj1NzwzTuey2x/FjTbU
         yNezDim0JlOy9KIv8aPaJR7SZmsGwSxPhVCbPTqtLYWdjKc2aGPEvVL4xVk2z+rXD2LP
         lgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gfKY55VDFmH9sfDf7QmSwnOcZWdz3/zPBcS1vbxTeIs=;
        b=ergevVaX6naZQpFHLD6kqauOxsVjhIoyIYqykVlnza/mC6enmnQA/jCk7h2JrXYJTt
         sRYC3vsAgXKa4xkBlPpXfF4TVVIkZRXjf9nLqm/XzjqxKG+8iAww4gnSdDgcTtweThl7
         RXXdLlWU1ubK+CU0hrxjJfVdvD/hyJu0vDfhdvBhqyXB4njl/ejEn195blxF/r9ea+Wb
         uUQTjch3gBKqLOnzUrU9jSQbS526qZpDLFOIY8W0VyD3qxpux7usS2+4LA4L1AMApeuH
         Va76rKO47vOlNo5i9MeQ0YeUI/eov9N2FFABQ0V3sVMnjAH63KzTkhR9LUglaiCwcKx0
         MIhQ==
X-Gm-Message-State: APjAAAUWBm2ZcsjM86FoCuvTLMZIJDQOfLSPAYUZPcfv2by0Dg5RCuGT
        J9jAZNiIXKXsHqq8jLiFFIeObw==
X-Google-Smtp-Source: APXvYqxsniCk8koIB+ws7n/g/Mm25oCraW+Hf6E/gRtPZkKce1g20AUH+H4Ip7W2ECP6AiHn+PnBgg==
X-Received: by 2002:a17:902:8a8a:: with SMTP id p10mr52642916plo.88.1561166510236;
        Fri, 21 Jun 2019 18:21:50 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u5sm3539148pgp.19.2019.06.21.18.21.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 18:21:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] soc: qcom: mdt_loader: Support loading non-split firmware
Date:   Fri, 21 Jun 2019 18:21:44 -0700
Message-Id: <20190622012146.19719-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Typically the firmware files for the various remoteprocs is split in a number
of files. But in some releases these files are available in their unsplit form.

Extend the mdt loader to detect the unsplit firmware and load it transparently.

Also expose the function that compose the metadata header for validation and
use this from the modem remoteproc driver, so that it can support unsplit files
as well.

Bjorn Andersson (2):
  soc: qcom: mdt_loader: Support loading non-split images
  remoteproc: qcom: q6v5-mss: Support loading non-split images

 drivers/remoteproc/qcom_q6v5_mss.c  | 33 ++++++++---
 drivers/soc/qcom/mdt_loader.c       | 88 ++++++++++++++++++++++++++++-
 include/linux/soc/qcom/mdt_loader.h |  2 +
 3 files changed, 112 insertions(+), 11 deletions(-)

-- 
2.18.0

