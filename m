Return-Path: <linux-arm-msm+bounces-1222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B867F1D16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 20:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EBFD281694
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 19:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2F4328DB;
	Mon, 20 Nov 2023 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f35kR+nN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523419C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 11:07:46 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9e1021dbd28so646757066b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 11:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700507265; x=1701112065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcghsarjrS3tHRySGsk8wGm4K++pTmTjyafJFK3g/Cs=;
        b=f35kR+nNnKF+FPTdCG1sKB/Lf7bbiCp5lEm6ewPm3RLyGjyTvsg0JpHxOH/1WK8+u8
         /USDkwM1FmL7bNOtE44bi4vKmV3cyXml23u+dyVLZ9L8qPZJMDqwnCxIFS6eiPlMazZJ
         GHVYPhk+frGXbYTlJBBE7RGdLCWudqojLL8KpcadfKBHbKwftIl4sF+jyhEOJ3NkwURU
         DxzDG10X0cPY7g/xXxdyD1KrKRJCXvhEjkI2/7O4ew5DTs4x7QCHp7jwxuhuur4YgON9
         OmRcC/GKWatrR/CxtHwrQ6mpBH1NFEKaGGfrNCrubzpzQdfG04lCpCM+/Zn/HT5WJwMp
         veiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700507265; x=1701112065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcghsarjrS3tHRySGsk8wGm4K++pTmTjyafJFK3g/Cs=;
        b=WKomsq6OFlQl4RVaEObKHBOPnV167j264aPRypPy+mKOchmx/ysG8FJi7Glvp51+s8
         Wb3H38765ITgw2a5L9lxLAPav7MiA+OfqDaNp0TldmxAWibHFfD5Y5SPrsc8UomE/4xI
         86xv+WhIjpZlwB1Iu7lEY/58wl18S5wDkWIi/2U9CoO07aektq7tlSvU7w8GqN34uX1o
         g/y2sSX0ni6ytJvh6CxkeoT006FUSf7mLCy/TScbudQ1Wu0aqhVy/tK9TddzBkOaZfB4
         KNLyzPAMxGKDyPlwvHkln32DfFLx9h2a0O+FoKuMW0rwtO/UeLQ6spETp/JBhhO4wD/m
         7Ifw==
X-Gm-Message-State: AOJu0Yyjw5Fk7M5uNQ88GjbTH4T3gFBQV6Dl1horHayVgh3IlM9WPzqJ
	ixCv36qYfFGyQXtZMNzLHIjhmQ==
X-Google-Smtp-Source: AGHT+IFzePfbHnSU85wD/UiMsfBrFBH+dK0SBJM1TR0leyATrt8D374mvtWaZJyFxdwoOqbJ+3B6KA==
X-Received: by 2002:a17:906:3f18:b0:9fe:aacb:bf6a with SMTP id c24-20020a1709063f1800b009feaacbbf6amr2737368ejj.69.1700507264786;
        Mon, 20 Nov 2023 11:07:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id a18-20020a1709066d5200b00977cad140a8sm4177521ejt.218.2023.11.20.11.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 11:07:44 -0800 (PST)
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
Subject: [PATCH 2/2] soundwire: qcom: move sconfig in qcom_swrm_stream_alloc_ports() out of critical section
Date: Mon, 20 Nov 2023 20:07:40 +0100
Message-Id: <20231120190740.339350-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
References: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting members of local variable "sconfig" in
qcom_swrm_stream_alloc_ports() does not depend on any earlier code in
this function, so can be moved up before the critical section.  This
makes the code a bit easier to follow because critical section is
smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 754870a4a047..e9a52c1bd359 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1160,6 +1160,17 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	int maxport, pn, nports = 0, ret = 0;
 	unsigned int m_port;
 
+	if (direction == SNDRV_PCM_STREAM_CAPTURE)
+		sconfig.direction = SDW_DATA_DIR_TX;
+	else
+		sconfig.direction = SDW_DATA_DIR_RX;
+
+	/* hw parameters wil be ignored as we only support PDM */
+	sconfig.ch_count = 1;
+	sconfig.frame_rate = params_rate(params);
+	sconfig.type = stream->type;
+	sconfig.bps = 1;
+
 	mutex_lock(&ctrl->port_lock);
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
 		if (m_rt->direction == SDW_DATA_DIR_RX) {
@@ -1193,16 +1204,6 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 		}
 	}
 
-	if (direction == SNDRV_PCM_STREAM_CAPTURE)
-		sconfig.direction = SDW_DATA_DIR_TX;
-	else
-		sconfig.direction = SDW_DATA_DIR_RX;
-
-	/* hw parameters wil be ignored as we only support PDM */
-	sconfig.ch_count = 1;
-	sconfig.frame_rate = params_rate(params);
-	sconfig.type = stream->type;
-	sconfig.bps = 1;
 	sdw_stream_add_master(&ctrl->bus, &sconfig, pconfig,
 			      nports, stream);
 out:
-- 
2.34.1


