Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCD2B10E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2019 16:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732403AbfILOPn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Sep 2019 10:15:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45281 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732455AbfILOPn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Sep 2019 10:15:43 -0400
Received: by mail-wr1-f68.google.com with SMTP id l16so28572539wrv.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2019 07:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PBfT3mxgX+rD0lAyvtzYZMZFZtcbsSUwaCSVY0jK/V8=;
        b=SZNIb9+Gj9o3ah2gIfkl6oIdgZYqAZVtp23KLGveHqrOnNJzkhqhla52cvSzsRHd7j
         ZtzRW28j/osny8ID4m9lctcdlPwbylWBbyjXDK5Ax7Qsi9NNRG0vyfN6T4RTALd8OP6d
         8FGozzt1l5j/c4WaDBYTA1+A5JCDbweZ+4oj6ZW/Pnyxku9ZBHInY/JjD4k5DegrGeFo
         zJVH6eaeMsKR+3i8rIADhF6Ehl8yvLw89idDpLJiwTqbPKTTfvGOIGe9F6G4UMW9TX10
         jRraENoy2m9ExdecOsU/jSIn225lO+R2zapaUHPLRf7Wrywk83zv26DktFnHWccbI+lC
         IsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PBfT3mxgX+rD0lAyvtzYZMZFZtcbsSUwaCSVY0jK/V8=;
        b=P9nKLgyPb5UxP6Z0qRCQyGJ7bqx9fYd8WuJs79Dl6dMbfxv85ap0qOFWAJbYgNScUR
         pv1EBszumaHSqlexE0KQ/zQJVCvbKztZe4GKwzjO+FUrczSfJnsjZ1stfOGPlxBg5cl9
         gBB+/emxDEwG7aEs+73MiZTgBxBOEzrDUG72/PGHW5HwsP5r8ow5sy2oiQo1QDBvKFO+
         bb8DTCWeqzo8LliP+XMbsxhawwYfpRRk0oQl/Gt9PIsJ1hVLq0Y21JyeFI0zFcdDkQJu
         bV9Dcv5zM3i36H/OGGN9HcslXZGYa8AGPcb8jbDn4H2qKUgcsv7oBy506AHQi/H7+p4W
         unmQ==
X-Gm-Message-State: APjAAAU131sMIY5zO8JHoUPDxB4//+UtloKd4OxBL2j3dhNH8lcYOnLG
        RxKi2kiwa8l63CjI+u5U8vnTtQ==
X-Google-Smtp-Source: APXvYqwmScopqV21yxQR5oM3O6jHJFfw901TYP57XVjX/n1COgdd1lAJ8vCwY/XQG2an4RNcpVQruw==
X-Received: by 2002:a5d:4649:: with SMTP id j9mr34265501wrs.193.1568297740484;
        Thu, 12 Sep 2019 07:15:40 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id p23sm137599wma.18.2019.09.12.07.15.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 12 Sep 2019 07:15:39 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Clock changes to support cpufreq on QCS404 
Date:   Thu, 12 Sep 2019 16:15:29 +0200
Message-Id: <20190912141534.28870-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following clock changes are required to enable cpufreq support on
the QCS404

v2: sboyd review of v1
    -------------------
    missing cover letter
    reorder the patchset
    use clk_parent data to speficy the parent clock
    dong ignore the clock position abi

Jorge Ramirez-Ortiz (5):
  clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
  clk: qcom: hfpll: register as clock provider
  clk: qcom: hfpll: CLK_IGNORE_UNUSED
  clk: qcom: hfpll: use clk_parent_data to specify the parent
  clk: qcom: apcs-msm8916: get parent clock names from DT

 drivers/clk/qcom/apcs-msm8916.c  | 15 ++++++++++++---
 drivers/clk/qcom/clk-alpha-pll.c |  8 ++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 drivers/clk/qcom/gcc-qcs404.c    |  2 +-
 drivers/clk/qcom/hfpll.c         | 21 +++++++++++++++++++--
 5 files changed, 41 insertions(+), 6 deletions(-)

-- 
2.23.0

