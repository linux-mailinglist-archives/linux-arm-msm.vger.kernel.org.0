Return-Path: <linux-arm-msm+bounces-2282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE837FBD94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 16:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EDAC1C20F78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 15:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8015C091;
	Tue, 28 Nov 2023 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ejtjY852"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C89182
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 07:00:55 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a06e59384b6so713506366b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 07:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701183654; x=1701788454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wtzvOORU1m23t60LTV9e86QfYgBtpGNq+GKxLg73wN0=;
        b=ejtjY8529E3nFL4LIhsfe8bBS6KpGkjhRp8zSx4DuzMsKut5DGM++ZukDJ/y1/RGrO
         /0NwESXxPWlgIYA6ZpbGhFLyF4VWZopVQSGB30VuMhZWDoIbbjCC0rSmRgFSXgDmegWk
         KlncRi1HwHfOBEp9RzUx9FYXws9laNZSXu7ELI238UgI3dhlEzScMkuUmYExP1Jm0BrR
         yiY+tWgnmtQlTtG2dSZytilF//Mjkm7+jDLXdVhWNx2FcloaZPaPnR7Mc+zcSdwlsb3E
         pGGD851aemp4TCnzLIo7y4V6eGfA7jO53I1dsBmsAvfrPv2q7tdwvHgeg/QFc6Olu0j/
         lACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183654; x=1701788454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtzvOORU1m23t60LTV9e86QfYgBtpGNq+GKxLg73wN0=;
        b=pPMImXxxvilzJWRF+KMxp1ECqQsYXXMasWTJQ393kMtirvhRlpfWwm2OcoPCxCSGd9
         YoiR+gTFcCdjDXV5zZ7u2Ho8gyD8TVixvW5Aps81bBq2TvhR0XsH53wtakBSHO5LmTuS
         uTEQuYjsYvE6rPilLUY7C2Ktb372pY02A875155nohyp6qR0g2hZmxxwMU0flWIVu8/n
         62tACk8DMNgfFT7H2u5/VBEIwR0B6XjjqWjaZTKySU0KQqJOeVr06kv67jWZW5pHomCQ
         vCXv/bJSBHTu+3NUpmM9E+dhgurCIHT53oIDgGmVHI3WmV+tj6xd1/xh0yuzvB7eZrKJ
         z9EQ==
X-Gm-Message-State: AOJu0YyoRj3Z5wfBkssBqfecw/VPwCItnl+13ZkpVs6WCix1D+0pM+xM
	2exQiU3s0uQE4DYFHxcZaAUFnA==
X-Google-Smtp-Source: AGHT+IFRWlG86Ino62rK496hPwfuaTK2b6cocVn/StHlsrRflRZQOwgPf8SPpdGuQOvrfjs/iOsLkA==
X-Received: by 2002:a17:907:1687:b0:a12:9aa8:c560 with SMTP id cx7-20020a170907168700b00a129aa8c560mr1808321ejd.59.1701183654099;
        Tue, 28 Nov 2023 07:00:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id xo25-20020a170907bb9900b00a0b6541b592sm4433071ejc.88.2023.11.28.07.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:00:53 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] soundwire: qcom: allow multi-link on newer devices
Date: Tue, 28 Nov 2023 16:00:49 +0100
Message-Id: <20231128150049.412236-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer Qualcomm SoCs like X1E80100 might come with four speakers spread
over two Soundwire controllers, thus they need a multi-link Soundwire
stream runtime.

Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is an entirely different approach than my previous try here:
https://lore.kernel.org/all/20231025144601.268645-1-krzysztof.kozlowski@linaro.org/
---
 drivers/soundwire/qcom.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 412b8e663a0a..57943724f0eb 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -920,6 +920,18 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	return 0;
 }
 
+static int qcom_swrm_read_prop(struct sdw_bus *bus)
+{
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+
+	if (ctrl->version >= SWRM_VERSION_2_0_0) {
+		bus->multi_link = true;
+		bus->hw_sync_min_links = 3;
+	}
+
+	return 0;
+}
+
 static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
 						    struct sdw_msg *msg)
 {
@@ -1078,6 +1090,7 @@ static const struct sdw_master_port_ops qcom_swrm_port_ops = {
 };
 
 static const struct sdw_master_ops qcom_swrm_ops = {
+	.read_prop = qcom_swrm_read_prop,
 	.xfer_msg = qcom_swrm_xfer_msg,
 	.pre_bank_switch = qcom_swrm_pre_bank_switch,
 	.post_bank_switch = qcom_swrm_post_bank_switch,
@@ -1196,6 +1209,15 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 
 	mutex_lock(&ctrl->port_lock);
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
+		/*
+		 * For streams with multiple masters:
+		 * Allocate ports only for devices connected to this master.
+		 * Such devices will have ports allocated by their own master
+		 * and its qcom_swrm_stream_alloc_ports() call.
+		 */
+		if (ctrl->bus.id != m_rt->bus->id)
+			continue;
+
 		if (m_rt->direction == SDW_DATA_DIR_RX) {
 			maxport = ctrl->num_dout_ports;
 			port_mask = &ctrl->dout_port_mask;
-- 
2.34.1


