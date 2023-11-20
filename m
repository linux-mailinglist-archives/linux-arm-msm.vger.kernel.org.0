Return-Path: <linux-arm-msm+bounces-1223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDD77F1D18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 20:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50DD61C2184D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 19:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF86D341BA;
	Mon, 20 Nov 2023 19:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="itYyRfKl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEA8113
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 11:07:45 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a00b056ca38so79575266b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 11:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700507263; x=1701112063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTpXl/MjWFr4GOxbA7yucE3ugQ9dkFJq52yIdGzpXCM=;
        b=itYyRfKlJ0k+Z5DM/8/r+qJotBFH0gQ4rizZjMjKZ04IyE5HryhW9ctYufd9bNwR3/
         QoxuuPxSsfEpHY1O2Yr+4VA9+HiVNKVVGZU+U3jqtCnF2U75+w2bQjZm9+M9tz+xEh1G
         rwd2to9rK00jQyKGR/vNxEEf/WLu4ZIh3C0TSUBgETriwa9zIXTb46Aa2qGXmTq4jaQ4
         fu6bzoOkEjb2UFLRBz/yZKiGQxORgG8JLBIiVURE1b9IVo30gS9wgaZ00sp+wUYb4ZZt
         Q2UmcP9rONk/T0mh8KDlR2DQCpenddeXS3Kb0nyOtXeBM7X3ZOuQbUuvXVC3kRKRWGRe
         BI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700507263; x=1701112063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTpXl/MjWFr4GOxbA7yucE3ugQ9dkFJq52yIdGzpXCM=;
        b=RA3Sh7vBdLJDbM91FU6zoQ3yFNDPj1UH3n6lIdKi4zjeSyeM03H/NDR54R/qnsAQ5j
         I+/Ow3UftXi5asfDBss5ccp2+v22qSMx1Sc90xx+5SMrSwKOOK9aSrnA3G3vNMjbSEI6
         uk6TY83BCLX1t08T+4yVsJj54PWMjLZcdLPuBW0d2z+BqASv1xi6xur4JkGtA6a+O4Lf
         eQaQZTNOs4dSTt2+hu684UrxuFtFBneCxQLFngLVQFuBtX/bgTTBukOW3VV7dNyr/6nD
         vppPH2SjVyx6YWrYmaRfi9WB99vtwNld9Sek+X5FJtMI88TvfvYmthBU5P6oSE8Vavsz
         Rthg==
X-Gm-Message-State: AOJu0YzlABeAcI0a9/CdzNd53fFxetWHZtTjj9yAwJ56ZJK0QXrPb6q5
	7MINROqqrrp07+eY0sgfXP8ZYUrh9qx9Grv124s=
X-Google-Smtp-Source: AGHT+IHCotI7oUSuFgXAQc4G4brytJuxRZwajqwIVB16jasq+WxHZRt/dsvF1AgDGC0xrVfamLAQ5A==
X-Received: by 2002:a17:906:c244:b0:9db:e46c:569 with SMTP id bl4-20020a170906c24400b009dbe46c0569mr6001995ejb.45.1700507263410;
        Mon, 20 Nov 2023 11:07:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id a18-20020a1709066d5200b00977cad140a8sm4177521ejt.218.2023.11.20.11.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 11:07:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] soundwire: qcom: drop unneeded qcom_swrm_stream_alloc_ports() cleanup
Date: Mon, 20 Nov 2023 20:07:39 +0100
Message-Id: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cleanup in "err" goto label clears bits from pconfig array which is
a local variable.  This does not have any effect outside of this
function, so drop this useless code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a1e2d6c98186..754870a4a047 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1157,7 +1157,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	struct sdw_port_runtime *p_rt;
 	struct sdw_slave *slave;
 	unsigned long *port_mask;
-	int i, maxport, pn, nports = 0, ret = 0;
+	int maxport, pn, nports = 0, ret = 0;
 	unsigned int m_port;
 
 	mutex_lock(&ctrl->port_lock);
@@ -1183,7 +1183,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 				if (pn > maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
 					ret = -EBUSY;
-					goto err;
+					goto out;
 				}
 				set_bit(pn, port_mask);
 				pconfig[nports].num = pn;
@@ -1205,12 +1205,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	sconfig.bps = 1;
 	sdw_stream_add_master(&ctrl->bus, &sconfig, pconfig,
 			      nports, stream);
-err:
-	if (ret) {
-		for (i = 0; i < nports; i++)
-			clear_bit(pconfig[i].num, port_mask);
-	}
-
+out:
 	mutex_unlock(&ctrl->port_lock);
 
 	return ret;
-- 
2.34.1


