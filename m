Return-Path: <linux-arm-msm+bounces-23062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D03790D3AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 298EB288558
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D18E13A3E8;
	Tue, 18 Jun 2024 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="szSBS6H0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE027446
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 13:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718718921; cv=none; b=LyEGydthsg0PQUsUj7GIq8k4NKFeX3R1XaniidlS6jeua0jAkGAK4bB+YsVbqd8kAj3oRobW9R+Yld9p6lLcgW+2vI2w9uwkTXm3PJm5aGQB0mv80571/xR4VU06WOg9wqdrnNBNDAWfhvxgR+WAHI4GrStaLlBuxnuEX4SXBbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718718921; c=relaxed/simple;
	bh=+4CUL0HKoZlb276ERUwdvPbHn/bW1BFwyupgf2+mb/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W3bDEhNt+0w3eoXRyjr5rAUGft9nnfalMzkF2FrRPT09qAkz3zVL2tqybnNKfGH0AmNK0V8VCWA0+8KkxIHpJywduJsVUaBZU/6rrmPAVq2xBN2o4KwBtKt2/FvTQy8Kcf37KNOwvqvjsSBPIo6loX+3nIcghDWQ3w2iq1luUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=szSBS6H0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6ef793f4b8so564157066b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718718918; x=1719323718; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D6ChPm2ZVDCBI9wwPc6qqPViwCOCp7xGdlugGTVGuBk=;
        b=szSBS6H0k4tNEYq9AOhG0ZzCrCbz3zMc5RqS+eKmSxqTTMdlYPRmuCCH4st+31gN4E
         egw6EQKdzkrMg+bVC/jfpr38wKPLfVL6Su/iP51v2N+LK8cPm8+fJvk6W6TPtlp9DKYi
         5qwSVd7DApIGUre8GFObqFDFOQkiFU23LrgCqwp0JZx0yURnhkCejJ9mTnshi8FZcUa+
         Ck0FNLR6HmpiX7OVqqf/tqCDEd0yfxEgtOAUtGCH7w5JO6JnBsZkSVETJm3WFzcMTliA
         EYKb0EPtuqEkNPXTPsvW9i4VOtjY8xDZAulxZs2X/hgDdPJKu+QeI3U8tba1DdyIshdr
         2p0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718718918; x=1719323718;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6ChPm2ZVDCBI9wwPc6qqPViwCOCp7xGdlugGTVGuBk=;
        b=EveaTyiu+p7u5xdNs3BNTsdHnj0mAVLh1+cqblmgO1FOQyPHWULtLwJgRVx2/3jlaq
         c/ALNmonMqKOk+kFCmIT/rOwcozXvr+diaaoIDwDxEr8fcCn04hDV+nxuncBSyl8abPy
         OFUMJ0C3bwDKxiTwbkdS4NPFFaE+Gjw4igkcTw6ZLm7Xw/RDSropgHhiDH+TKFV9mnr3
         7byfJyP22/3hZVtavhxi77cotoKvbd/0Pcwnt25VlI1J21lO7Jl8DZWhdIEJt4D5k4py
         7cSqNus9rdjlw7sDmWFUCK9QvAxZQRVEp9Kdd40mx19g1INnOEw2Oa9QUkh0cqdTJD5f
         Ci2g==
X-Gm-Message-State: AOJu0YyiN7rUSMGGC46vi24s+uOmh6AfnAH89k9zaTuoVy9ZTzXy1WDL
	RQ6vXS42CgvZW8JFfTypcb1Wxmxuvnyl67RKtl33ZOLCKDrzM1lbywRlQUIcIw8=
X-Google-Smtp-Source: AGHT+IG3ro8Zjz5M3lMie8NKLPIuT19SAyYyyup6jrLjzzoy1DgniE0/49fX7ZOxIcmnlH11xqxWAw==
X-Received: by 2002:a17:907:c713:b0:a6f:69ee:dcd2 with SMTP id a640c23a62f3a-a6f69eee6famr911053966b.57.1718718917112;
        Tue, 18 Jun 2024 06:55:17 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f41721sm622645566b.154.2024.06.18.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:55:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Tue, 18 Jun 2024 14:55:15 +0100
Subject: [PATCH] drivers:soundwire: qcom: cleanup port maask calculations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-soundwire-port-map-v1-1-9644e5545b9b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMKRcWYC/x2NQQqDQAwAvyI5NxClFO1XSg/RzdYc3F0Sawvi3
 7v2OAzD7OBiKg73ZgeTTV1zqtBeGphmTi9BDZWho+5Kt7ZHz+8UPmqCJduKCxck6uMQIgvFAWo
 4sguOxmmaz3RhX8VOUUyifv+3x/M4fgWldN59AAAA
To: Vinod Koul <vkoul@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=+4CUL0HKoZlb276ERUwdvPbHn/bW1BFwyupgf2+mb/Q=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcZHEZx0WD6S7YcEFm9sOro2WXS44qUag4slA8
 6hz7200ceOJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnGRxAAKCRB6of1ZxzRV
 N882B/9JXKa/oPIDvV+BnarwrBTCXvFaYTVycNw4sgqDsEa5a2aE+ggUnpksuZjjus/nv6VBUL8
 d80oUOZ6Y2d2qduf7Wvw76pLJtNYdDLeBE35ADRjR9yTYfFVSPlIXTi2HxpqanUkEJCF7MQ45Gn
 nnLw9qj2K7E8NCVzkgdVBAFNI9F0NoHbKf2WUSQSwEH+L6RUyxj8YCstMJEH5Wctwl8fphZZrOT
 RXWgc0sZ4pQfdULRQ+KTXGBGoJrMpwy5oMZa8ZhB6DiNnHJTaL7lhebUeRAY0u8hIcbALAkO2qC
 8vcgFAOEuDXK/ttKLumsSmLcYRkJ0xhPPkrVn2GXEqsHZVIf
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Cleanup the port map calculations, existing masks of having separate
masks for in and out ports is not really required.
Having a single mask for all the ports in the controller is simple and
cuts of some unnecessary code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index ce5cf3ecceb5..aed57002fd0e 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -197,8 +197,7 @@ struct qcom_swrm_ctrl {
 	int num_dout_ports;
 	int cols_index;
 	int rows_index;
-	unsigned long dout_port_mask;
-	unsigned long din_port_mask;
+	unsigned long port_mask;
 	u32 intr_mask;
 	u8 rcmd_id;
 	u8 wcmd_id;
@@ -1146,11 +1145,7 @@ static void qcom_swrm_stream_free_ports(struct qcom_swrm_ctrl *ctrl,
 	mutex_lock(&ctrl->port_lock);
 
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
-		if (m_rt->direction == SDW_DATA_DIR_RX)
-			port_mask = &ctrl->dout_port_mask;
-		else
-			port_mask = &ctrl->din_port_mask;
-
+		port_mask = &ctrl->port_mask;
 		list_for_each_entry(p_rt, &m_rt->port_list, port_node)
 			clear_bit(p_rt->num, port_mask);
 	}
@@ -1195,13 +1190,9 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 		if (ctrl->bus.id != m_rt->bus->id)
 			continue;
 
-		if (m_rt->direction == SDW_DATA_DIR_RX) {
-			maxport = ctrl->num_dout_ports;
-			port_mask = &ctrl->dout_port_mask;
-		} else {
-			maxport = ctrl->num_din_ports;
-			port_mask = &ctrl->din_port_mask;
-		}
+		port_mask = &ctrl->port_mask;
+		maxport = ctrl->num_dout_ports + ctrl->num_din_ports;
+
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
 			slave = s_rt->slave;
@@ -1401,8 +1392,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 		return -EINVAL;
 
 	/* Valid port numbers are from 1-14, so mask out port 0 explicitly */
-	set_bit(0, &ctrl->dout_port_mask);
-	set_bit(0, &ctrl->din_port_mask);
+	set_bit(0, &ctrl->port_mask);
 
 	ret = of_property_read_u8_array(np, "qcom,ports-offset1",
 					off1, nports);

---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240618-soundwire-port-map-008f9dfae0f9

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


