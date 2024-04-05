Return-Path: <linux-arm-msm+bounces-16541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B53A289A004
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 16:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7D621C21EAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 14:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8595116F82D;
	Fri,  5 Apr 2024 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H7brh+Ym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234CE16F822
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 14:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712328111; cv=none; b=G985Do6DUm4i7ig1O5mPaGpffYOMKquBIK7Cw9VBxVpfljldfgt0dRnT5wYDUT/OR3z4aKnKbkpT/bggrjxAr4zccPbDH3tUX0PKhII3URWbRjI8gO2NX+lQ4BUsHAnk2FGcmkMbl6zgsxvNxB/wkIzqp/x/gmcpSKbS5U2C0Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712328111; c=relaxed/simple;
	bh=sxY2AEeSba+Q/Kxf5OSL1C7dhwkaGiayEInG3JEg4Go=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H/QT0o8tYRB1HOXJvWn3EJxq1aHYtJO+F5M6l0Oix+zUOueO47FoDquGg7Vu47mbKS8Aq6qLc9EQaSaQ+Ubh0zKWko7NUeyObJ4aUkzafo+1he3JWhdKsepXzQPaWPQiXezFwm/7kFz/Air14Odlg3RJer8IlYn3HD0smLhTLPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H7brh+Ym; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so2398916a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712328107; x=1712932907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JTqiLc0V7BtkLzywEdmRvMeMh3GhRnDflsLTNgiO3NQ=;
        b=H7brh+YmdpS8KDDdr3d9x/yRYHOcUO9ohLylaqjYwaI5e1R4SXXPqq4G5dF1zjkpUc
         h2RAPpfx8PJqhNPRLt8zLWB09Y/cSU8/MZma8xMXaMgsmejmt47FDkH0VJ8feHJ2qRTI
         emtQKIOYVpqJ8k0ACtZN74YqZglFN2MnvxTsiWr48bmX7kH14zT4W3atquMWHP/P6Kns
         PhhKTPaLsqRI0e82Ogp4HoOrC1/BB0xFalEp7IpTECU6yspdJKYhU0RIse943kYoOM14
         zpr/GoABjK5TqCZ7qmybH/4xmeQo8F3bQiz+I/4u/Yla3E9+TXKs7wRmai/v/KHDq9qS
         jCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712328107; x=1712932907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTqiLc0V7BtkLzywEdmRvMeMh3GhRnDflsLTNgiO3NQ=;
        b=QaBEA8JfMXLUpJgRdhP3hKMiHLYHdC/pT1zOVpuNVUHeUfNC3VK2BJ6dCse4f4K/MY
         sVSRzDV61dWLM578Ok0wjkcR9ULdH8cTrv48+2SPxMohd2Swn+/YJHjGDCPGn3x0TSF/
         YvJbY2Tz1+/LZKsdTtchNQW83pxgpyDbY8jOcoEEGDIJbUpb662Q04sxqG2N5kfsa8an
         B2V/KSjff6MCOJE4Bd2S3h+InuWuek5NsL2CgE9jEez8528qOj/LFYVpRrpuNaaWThGx
         hC1AlK5jN4pB6/vH4fvfrnnqoeYDNtJ1ioGrf7oUhabR45zBwKT2dpx1oJ+UQRDsS8TG
         GWug==
X-Forwarded-Encrypted: i=1; AJvYcCXWEvZ5ySLcIDyzOklNFH3IM8M44BscExZm9KD6dyPsBUAZIVEfZORnor9FgTa9QbfFOk+U9G3NEc6kiqz/S+Ngebl1uDu0xz915m40Rg==
X-Gm-Message-State: AOJu0YyRAQeCPbkyPO+9Kdn2HJGbJCmKMyNdbl4NhqPqbJCm3plXYseU
	3MfT7vVqj65SXXKnjt/IO2YBXfLaoF77TTvGVqmpILaCze2RLxvRdym/JJZlQgg=
X-Google-Smtp-Source: AGHT+IHh+ZxoCzU1FGg+Ay1sdVh8yffh8/bUZTifdB3YwV0ck6OUItK6hnnakWAv1mKM1jDatQrBDA==
X-Received: by 2002:a17:906:5ad8:b0:a4e:a204:e699 with SMTP id x24-20020a1709065ad800b00a4ea204e699mr1326916ejs.17.1712328107384;
        Fri, 05 Apr 2024 07:41:47 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id g15-20020a170906198f00b00a4e2bf2f743sm899183ejd.184.2024.04.05.07.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 07:41:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] soundwire: qcom: allow multi-link on newer devices
Date: Fri,  5 Apr 2024 16:41:41 +0200
Message-Id: <20240405144141.47217-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Only rebase (slightly different context)
---
 drivers/soundwire/qcom.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index fb70afe64fcc..ce5cf3ecceb5 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -905,6 +905,18 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
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
@@ -1056,6 +1068,7 @@ static const struct sdw_master_port_ops qcom_swrm_port_ops = {
 };
 
 static const struct sdw_master_ops qcom_swrm_ops = {
+	.read_prop = qcom_swrm_read_prop,
 	.xfer_msg = qcom_swrm_xfer_msg,
 	.pre_bank_switch = qcom_swrm_pre_bank_switch,
 };
@@ -1173,6 +1186,15 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 
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


