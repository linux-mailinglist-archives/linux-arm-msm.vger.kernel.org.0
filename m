Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 339F410287E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 16:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbfKSPqr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 10:46:47 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37421 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbfKSPqq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 10:46:46 -0500
Received: by mail-lj1-f193.google.com with SMTP id d5so23880671ljl.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 07:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EKKyPkgTIrUgJLfJdMi3ez4CUNaFpld4hIHRZMCg8t8=;
        b=ftUzIhsgD2KsI+Xzqgh9UNmduNgupRakB+aHfdmjkBk3PNzBCQTJgEuedpdzkJdBzc
         gWv8w4cSzN/HJgXo3UJm3CnBhX9EK6DKqftCJ/MGeJBWR+fy/+T10n7Q9S6BAzA1NL+s
         poasY+D/n4q2kqmwKeNoDnm4IY/Rpjr+iwTYxSi2TjMPfQ+0Cb3WqZQw0LEtByhNG3kG
         u4s8aDh1rQEyYLHAWFQY21DsnpHKJwfXXCYt+7Qfr3fMu8sQttCuz1lS5od1dfeBjiKT
         9uYu6/o6Z5lGCoUhkzEfXZJ6AUaaLbjTS4bR2ks4qbV4d2EQpS5OzqcfDahcllBwpfBz
         KcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EKKyPkgTIrUgJLfJdMi3ez4CUNaFpld4hIHRZMCg8t8=;
        b=F55Tp/otkbxMQU1YWL/utdexfHUHZU2oSXYVtvyiWWqCwUoQ8knb7+eDqT6KDQje2o
         iPqi6NnzgX0vPLi1osz9gdMlbc4NsQa6HNVt2Wg8/pQdS75Tx1x+7tBRTaujOvIWB6AM
         ZfUx9/NFOEnLdLgxHz1KQ8ptsF6lxX4Gilt+Kqbn7zcrCaJTuc3p+TTYbxvo0v18udMm
         qVdosIZBktzruMpLFr1m9opnWGekZF28wlcdHUI5LGQ2/oiU0Pyyr6RfcnIsUQIl8pWw
         HnwN/R3w8cxDc8S/164DaTJ3XjPIZEkotqcjEF55aZ/Dz19AbCxgIgqJMmMoA8ILdg7n
         KdVA==
X-Gm-Message-State: APjAAAXDo6ihXQut/EAeq+oECXlEOAOS7YiUwe6c2UXGoWCE0fZL66sz
        psENUM7P6RfKnbYpK83CAF9aOw==
X-Google-Smtp-Source: APXvYqxlG+4qGNAX91shhoryUkY0lCP1hEIsDb7QpnfSi0qgJ/p5zP7rjKHMWeQBYegUbtHUwvI/gA==
X-Received: by 2002:a2e:b0d3:: with SMTP id g19mr4343582ljl.135.1574178405466;
        Tue, 19 Nov 2019 07:46:45 -0800 (PST)
Received: from centauri.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id e14sm10128803ljb.75.2019.11.19.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 07:46:44 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 4/5] arm64: defconfig: enable CONFIG_QCOM_CPR
Date:   Tue, 19 Nov 2019 16:46:19 +0100
Message-Id: <20191119154621.55341-5-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191119154621.55341-1-niklas.cassel@linaro.org>
References: <20191119154621.55341-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable CONFIG_QCOM_CPR.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e76b42b25dd6..4385033c0a34 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -438,6 +438,7 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_MAX77620=y
 CONFIG_POWER_AVS=y
+CONFIG_QCOM_CPR=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_XGENE=y
-- 
2.23.0

