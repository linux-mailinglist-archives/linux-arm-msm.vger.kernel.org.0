Return-Path: <linux-arm-msm+bounces-108270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QACuEVFkC2rwGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:11:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C54572B0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54ACF3069C2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5711438F629;
	Mon, 18 May 2026 19:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4fmt+Tq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNXOOVy8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864AD3845CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131298; cv=none; b=fC/XZAdj5pApsjQe/g5ky6+jUaaPFfVfAhsmTe23XNC+M5jqVsjf0Uvs/7W/ThA7MunvQOLMsV2fk4wuVBxGAQq+THFT0H11FBNP3lz1NNn+Gzr8nvaDIb3bJI3La+ltsAN+HW6gOAKqgkvk9r/voaW2RlsQFHl3sw4cjQ7UIqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131298; c=relaxed/simple;
	bh=ad8gOV1azGZf5n4fWA+X59ZlDbs9g7YGJY1WEJbnxm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NRo089rA1v8myv1fZgSrBQoufHpSwleHcNK6Go4uUEuVOPB4QUUjka8r/BHEBWRPUTN8J52bfudajvdYr/nturmenW9x8meuyg8KU5Pc9vo5SC6e6FnxnrM+lmgVL99jJFEL7WZe03GqfKz8KqM8ibxmZS/C8VHESQH4lN61c9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4fmt+Tq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNXOOVy8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICLBGh1890393
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=85pNEjcix7B
	XTYuYfTDL+x/Rv4knQBmcHLyfr9mvfY8=; b=M4fmt+TqYoDEwRlN4QNXGbXrC2s
	20U0sGmZJajI0AyKp/CXFrV0mEBYOH+uJV5VjLXkkcJUskGi2NysbpBnL+dlTYUi
	GX5Kzi9kHwE1pLJ3AONdbKSgWrCtzyZguKuJ0g8/SR5sdjvDKSJwmr4WpKGSiR37
	3Kek+e8tYRFpEo58QWcpIGJHllB4jrwIAscIsTdjUes0fRC6MUlsuDAwulBVSb59
	MS6cYjZQVxeMEL314b8yQfzaeIuvLQiovpaF+nN4udgFDg0emenPGdtWrLFbCY/l
	Z8i3CdoQrB5i7ni1OmOzxtfcMREnsDouygX5wH8Rzr90XeWZmVchGqJB3WA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82pw1k3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc860066a6so19838325ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779131294; x=1779736094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85pNEjcix7BXTYuYfTDL+x/Rv4knQBmcHLyfr9mvfY8=;
        b=eNXOOVy8k/vKxHHdLdjvV+kjLlAQ6dX0ZxzusAA+e6g+3UtH6jZ7KkyAqM/6YStmba
         uyQLCfdodsWBEFZIuW5L3UudcEcWmo12pQXdeudVD9o4OSC59HH6x/r1FpP3c5irgWz1
         bUHeWkPHNn4nHqdnSrqZL+AQ9d9HYuEYUDoFyAXrPt2soYIB6ZvsQgk6GAAS55AS5g5Y
         gD44xy4R3KKLSnHfka1xMhfyyjgwrWrAxsvo0canLKSqd6GyApgGt140tEs08F7iQcpw
         1g2zm0d5KlMaS5TjCLkvE96Mjmt+A6gTmH7LKEaQhjhpQ7XZwuFwJ2KaYvsg6CtLdhWu
         aHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131294; x=1779736094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=85pNEjcix7BXTYuYfTDL+x/Rv4knQBmcHLyfr9mvfY8=;
        b=hczMmccoGdoPEEkhSI4hkv9i/5J1qj/BQQS4XtI1fn7F1pdo2uucW1Y5Ch1XXO6BIO
         N/VullNuhmGREolBqSAgo/aEqrWbJ4mHs1hqSZm/WtDMeiH8teXsOtC3qN13usKf1QQ7
         BoDiJwqpnTlmfmogpRN83pwe+7BiNNjLP+vgedsoawmTx+eclkI/nMUrtQInXdEVd/+l
         swEQCVZa8Vyk4tGE60gOsSCCUhDULVIyBOCfwN0vPsg6mo31cGNVVvoUYOX+09ToEVcc
         4zqzswHa7PftRcKXtFjvl9wpeUizRdR/31egV4ugowZrY6lm0ZR9H+drOH3MO88lZV7M
         Gu+Q==
X-Gm-Message-State: AOJu0Yw/R98L//rvfYxySa8GCSw1aAdWwF0wt8Dx608qoOlU623KTYhq
	EbcL4u/1ParF4PeJRjhBQxdfIexeYp1g+2jA0vDi0peO/yez8ynRd2BTHd72kEMlvipb8MFcoDP
	amRg2Gw5vSSGuxaW9NTc5VM6IhRuK3smrplgQJPrnFtT0St99rmnM2hsimqXsrk3Jh6zV
X-Gm-Gg: Acq92OGWp8YAdJbN7f0mUQG7KKign9F8+rtTtQbCq/fJul0bx5z6+TeFBIe5JLBoe2p
	haBwQYUTFTrhiJmce2AJrXzKtJRuK+//G7pqNEzDiPHvfNhxIWubjvjI3jg2O78b1wJVYUxxThx
	34sEnykBsTXdeoYkpuWPuNUpPpQVH26EAiW2iKnTOIpAzWAeFt5H1XIPrG/cD0FqzBNQON0vi2o
	7y6s16Fe874aMEc1Hc7RNdquivLG4WBBnaFT/PCsLqnundNUpVN0ixdK53o1+dNAaMe6AL2iqG+
	trhwBYE2tt3o5oWQ5gDeRmZWGK4MT7c+Z0vBezzjUR2b+FqKfQDHoSJNjnQ2ilNXjultoN0Q0GN
	P0tnUqrftQ76ab1VMKCsMPlFwv+X/FVqk
X-Received: by 2002:a17:903:2a8f:b0:2b2:57f3:8d07 with SMTP id d9443c01a7336-2bd7e8ae696mr169448345ad.7.1779131293666;
        Mon, 18 May 2026 12:08:13 -0700 (PDT)
X-Received: by 2002:a17:903:2a8f:b0:2b2:57f3:8d07 with SMTP id d9443c01a7336-2bd7e8ae696mr169447925ad.7.1779131293033;
        Mon, 18 May 2026 12:08:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d12372bsm195879395ad.75.2026.05.18.12.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:08:12 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 05/16] drm/msm/registers: Add perfcntr json
Date: Mon, 18 May 2026 12:06:32 -0700
Message-ID: <20260518190735.16236-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a6AAM0SF c=1 sm=1 tr=0 ts=6a0b639e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=U2HPg71ik5UQ_0Zuz_MA:9 a=PDmnkIS-fa9zh8kb:21 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4OCBTYWx0ZWRfXxsFr3vtvaMYd
 hb/ADjtupj0imRK3DyS/UfRBiyFqwtSzzKynjyhz9labiVoQjHBFBr5I6L6gsWeKQENX+XPfYRo
 lt8MpUtccj8RKyjR97VhcD2IakBGhdttGDsmQHnKVD93msbOVkQ3TxOMe3Fyp0BzcjT6aT+T14i
 CiO6PJBN4aIU10YZiiIxz4yHoceWKY3h8mfFM+xlf+RmyLp6X3ujCSk7czrf3rrBODTOrTyuofk
 rG7tI4slZAtJcPK8C4yuMDXhacPh3sC9tqtNw4xw5lgKB1+gakSYB3QiDJXi8wDv+V3/9FtfG2k
 9hGI8jOECdp6mrnFjMN7hQrchUXnYBZohdUKGxf8dZaGhJNOmZlvKF7RF7KwRHHgtKEsuikMJvp
 48A4i5weqz4kHrnXqGYXtQFUUoaJV5QUqb/LBGnd3dcwBqEQbqBR6xdDHzQfN8TT5kSPIgC9ntz
 tia7e1Loav6oJfYDMOA==
X-Proofpoint-GUID: AyLxpD-Nu9Mm2aV9Vi2zgXQgQtLtFwM4
X-Proofpoint-ORIG-GUID: AyLxpD-Nu9Mm2aV9Vi2zgXQgQtLtFwM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180188
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108270-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94C54572B0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pull in perfcntr json and wire up generation of perfcntr tables.

Sync from mesa commit d2c4653ee953 ("freedreno/registers: Add gen8 perfcntrs")

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/Makefile                  |  25 +-
 drivers/gpu/drm/msm/msm_perfcntr.h            |  48 ++++
 .../msm/registers/adreno/a2xx_perfcntrs.json  | 109 ++++++++
 .../msm/registers/adreno/a5xx_perfcntrs.json  | 128 ++++++++++
 .../msm/registers/adreno/a6xx_perfcntrs.json  | 105 ++++++++
 .../msm/registers/adreno/a7xx_perfcntrs.json  | 228 +++++++++++++++++
 .../msm/registers/adreno/a8xx_perfcntrs.json  | 240 ++++++++++++++++++
 7 files changed, 882 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index ce00cfb0a875..337634e7e247 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -176,6 +176,11 @@ quiet_cmd_headergen = GENHDR  $@
       cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(src)/registers/gen_header.py \
 		      $(headergen-opts) --rnn $(src)/registers --xml $< c-defines > $@
 
+# TODO how to do this for a2xx/a5xx which have different .xml arg?
+quiet_cmd_headergen_json = GENHDRJSN  $@
+      cmd_headergen_json = mkdir -p $(obj)/generated && $(PYTHON3) $(src)/registers/gen_header.py \
+		      $(headergen-opts) --rnn $(src)/registers --xml $(filter %.xml,$^) perfcntrs --json $< > $@
+
 $(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
 		$(src)/registers/adreno/adreno_common.xml \
 		$(src)/registers/adreno/adreno_pm4.xml \
@@ -192,6 +197,24 @@ $(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
 		FORCE
 	$(call if_changed,headergen)
 
+ADRENO_PERFCNTRS =
+
+define adreno_perfcntrs
+ADRENO_PERFCNTRS += generated/$(1)_perfcntrs.json.c
+$$(obj)/generated/$(1)_perfcntrs.json.c: $$(src)/registers/adreno/$(1)_perfcntrs.json \
+		$$(src)/registers/adreno/$(2).xml \
+		FORCE
+	$$(call if_changed,headergen_json)
+endef
+
+$(eval $(call adreno_perfcntrs,a2xx,a2xx))
+$(eval $(call adreno_perfcntrs,a5xx,a5xx))
+$(eval $(call adreno_perfcntrs,a6xx,a6xx))
+$(eval $(call adreno_perfcntrs,a7xx,a6xx))
+$(eval $(call adreno_perfcntrs,a8xx,a6xx))
+
+adreno-y += $(ADRENO_PERFCNTRS:.c=.o)
+
 ADRENO_HEADERS = \
 	generated/a2xx.xml.h \
 	generated/a3xx.xml.h \
@@ -226,4 +249,4 @@ DISPLAY_HEADERS = \
 $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
 $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
 
-targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
+targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS) $(ADRENO_PERFCNTRS)
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
new file mode 100644
index 000000000000..305dcde15c5e
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __MSM_PERFCNTR_H__
+#define __MSM_PERFCNTR_H__
+
+#include "linux/array_size.h"
+
+#include "adreno_common.xml.h"
+
+/*
+ * This is a subset of the tables used by mesa.  We don't need to
+ * enumerate the countables on the kernel side.
+ */
+
+/* Describes a single counter: */
+struct msm_perfcntr_counter {
+   /* offset of the SELect register to choose what to count: */
+   unsigned select_reg;
+   /* additional SEL regs to enable slice counters (gen8+) */
+   unsigned slice_select_regs[2];
+   /* offset of the lo/hi 32b to read current counter value: */
+   unsigned counter_reg_lo;
+   unsigned counter_reg_hi;
+   /* TODO some counters have enable/clear registers */
+};
+
+/* Describes an entire counter group: */
+struct msm_perfcntr_group {
+   const char *name;
+   enum adreno_pipe pipe;
+   unsigned num_counters;
+   const struct msm_perfcntr_counter *counters;
+};
+
+#define GROUP(_name, _pipe, _counters, _countables) {                          \
+      .name = _name,                                                           \
+      .pipe = _pipe,                                                           \
+      .num_counters = ARRAY_SIZE(_counters),                                   \
+      .counters = _counters,                                                   \
+   }
+
+#define fd_perfcntr_counter msm_perfcntr_counter
+#define fd_perfcntr_group   msm_perfcntr_group
+
+#endif /* __MSM_PERFCNTR_H__ */
diff --git a/drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
new file mode 100644
index 000000000000..8095345ffd8e
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
@@ -0,0 +1,109 @@
+{
+    "chip": "A2XX",
+    "groups": [
+        {
+            "name": "CP",
+            "num": 1,
+            "select": "CP_PERFCOUNTER_SELECT",
+            "counter_lo": "CP_PERFCOUNTER_LO",
+            "counter_hi": "CP_PERFCOUNTER_HI",
+            "countable_type": "a2xx_cp_perfcount_sel"
+        },
+        {
+            "name": "PA_SU",
+            "num": 4,
+            "select": "PA_SU_PERFCOUNTER{}_SELECT",
+            "counter_lo": "PA_SU_PERFCOUNTER{}_LOW",
+            "counter_hi": "PA_SU_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_su_perfcnt_select"
+        },
+        {
+            "name": "PA_SC",
+            "num": 1,
+            "select": "PA_SC_PERFCOUNTER{}_SELECT",
+            "counter_lo": "PA_SC_PERFCOUNTER{}_LOW",
+            "counter_hi": "PA_SC_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_sc_perfcnt_select"
+        },
+        {
+            "name": "VGT",
+            "num": 4,
+            "select": "VGT_PERFCOUNTER{}_SELECT",
+            "counter_lo": "VGT_PERFCOUNTER{}_LOW",
+            "counter_hi": "VGT_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_vgt_perfcount_select"
+        },
+        {
+            "name": "TCR",
+            "num": 2,
+            "select": "TCR_PERFCOUNTER{}_SELECT",
+            "counter_lo": "TCR_PERFCOUNTER{}_LOW",
+            "counter_hi": "TCR_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_tcr_perfcount_select"
+        },
+        {
+            "name": "TP0",
+            "num": 2,
+            "select": "TP0_PERFCOUNTER{}_SELECT",
+            "counter_lo": "TP0_PERFCOUNTER{}_LOW",
+            "counter_hi": "TP0_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_tp_perfcount_select"
+        },
+        {
+            "name": "TCM",
+            "num": 2,
+            "select": "TCM_PERFCOUNTER{}_SELECT",
+            "counter_lo": "TCM_PERFCOUNTER{}_LOW",
+            "counter_hi": "TCM_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_tcm_perfcount_select"
+        },
+        {
+            "name": "TCF",
+            "num": 12,
+            "select": "TCF_PERFCOUNTER{}_SELECT",
+            "counter_lo": "TCF_PERFCOUNTER{}_LOW",
+            "counter_hi": "TCF_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_tcf_perfcount_select"
+        },
+        {
+            "name": "SQ",
+            "num": 4,
+            "select": "SQ_PERFCOUNTER{}_SELECT",
+            "counter_lo": "SQ_PERFCOUNTER{}_LOW",
+            "counter_hi": "SQ_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_sq_perfcnt_select"
+        },
+        {
+            "name": "SX",
+            "num": 1,
+            "select": "SX_PERFCOUNTER{}_SELECT",
+            "counter_lo": "SX_PERFCOUNTER{}_LOW",
+            "counter_hi": "SX_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_sx_perfcnt_select"
+        },
+        {
+            "name": "MH",
+            "num": 2,
+            "select": "MH_PERFCOUNTER{}_SELECT",
+            "counter_lo": "MH_PERFCOUNTER{}_LOW",
+            "counter_hi": "MH_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_mh_perfcnt_select"
+        },
+        {
+            "name": "RBBM",
+            "num": 2,
+            "select": "RBBM_PERFCOUNTER{}_SELECT",
+            "counter_lo": "RBBM_PERFCOUNTER{}_LO",
+            "counter_hi": "RBBM_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_rbbm_perfcount1_sel"
+        },
+        {
+            "name": "RB",
+            "num": 4,
+            "select": "RB_PERFCOUNTER{}_SELECT",
+            "counter_lo": "RB_PERFCOUNTER{}_LOW",
+            "counter_hi": "RB_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_rb_perfcnt_select"
+        }
+    ]
+}
diff --git a/drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
new file mode 100644
index 000000000000..d95503543f94
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
@@ -0,0 +1,128 @@
+{
+    "chip": "A5XX",
+    "groups": [
+        {
+            "name": "CP",
+            "num": 8,
+            "reserved": [ 0 ],
+            "select": "CP_PERFCTR_CP_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_CP_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_CP_{}_HI",
+            "countable_type": "a5xx_cp_perfcounter_select"
+        },
+        {
+            "name": "CCU",
+            "num": 4,
+            "select": "RB_PERFCTR_CCU_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_CCU_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_CCU_{}_HI",
+            "countable_type": "a5xx_ccu_perfcounter_select"
+        },
+        {
+            "name": "TSE",
+            "num": 4,
+            "select": "GRAS_PERFCTR_TSE_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_TSE_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_TSE_{}_HI",
+            "countable_type": "a5xx_tse_perfcounter_select"
+        },
+        {
+            "name": "RAS",
+            "num": 4,
+            "select": "GRAS_PERFCTR_RAS_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_RAS_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_RAS_{}_HI",
+            "countable_type": "a5xx_ras_perfcounter_select"
+        },
+        {
+            "name": "LRZ",
+            "num": 4,
+            "select": "GRAS_PERFCTR_LRZ_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_LRZ_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_LRZ_{}_HI",
+            "countable_type": "a5xx_lrz_perfcounter_select"
+        },
+        {
+            "name": "HLSQ",
+            "num": 8,
+            "select": "HLSQ_PERFCTR_HLSQ_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_HLSQ_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_HLSQ_{}_HI",
+            "countable_type": "a5xx_hlsq_perfcounter_select"
+        },
+        {
+            "name": "PC",
+            "num": 8,
+            "select": "PC_PERFCTR_PC_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_PC_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_PC_{}_HI",
+            "countable_type": "a5xx_pc_perfcounter_select"
+        },
+        {
+            "name": "RB",
+            "num": 8,
+            "select": "RB_PERFCTR_RB_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_RB_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_RB_{}_HI",
+            "countable_type": "a5xx_rb_perfcounter_select"
+        },
+        {
+            "name": "RBBM",
+            "num": 4,
+            "reserved": [ 0 ],
+            "select": "RBBM_PERFCTR_RBBM_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_RBBM_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_RBBM_{}_HI",
+            "countable_type": "a5xx_rbbm_perfcounter_select"
+        },
+        {
+            "name": "SP",
+            "num": 12,
+            "reserved": [ 0 ],
+            "select": "SP_PERFCTR_SP_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_SP_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_SP_{}_HI",
+            "countable_type": "a5xx_sp_perfcounter_select"
+        },
+        {
+            "name": "TP",
+            "num": 8,
+            "select": "TPL1_PERFCTR_TP_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_TP_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_TP_{}_HI",
+            "countable_type": "a5xx_tp_perfcounter_select"
+        },
+        {
+            "name": "UCHE",
+            "num": 8,
+            "select": "UCHE_PERFCTR_UCHE_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_UCHE_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_UCHE_{}_HI",
+            "countable_type": "a5xx_uche_perfcounter_select"
+        },
+        {
+            "name": "VFD",
+            "num": 8,
+            "select": "VFD_PERFCTR_VFD_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_VFD_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_VFD_{}_HI",
+            "countable_type": "a5xx_vfd_perfcounter_select"
+        },
+        {
+            "name": "VPC",
+            "num": 4,
+            "select": "VPC_PERFCTR_VPC_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_VPC_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_VPC_{}_HI",
+            "countable_type": "a5xx_vpc_perfcounter_select"
+        },
+        {
+            "name": "VSC",
+            "num": 2,
+            "select": "VSC_PERFCTR_VSC_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_VSC_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_VSC_{}_HI",
+            "countable_type": "a5xx_vsc_perfcounter_select"
+        }
+    ]
+}
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
new file mode 100644
index 000000000000..8bb31820479e
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
@@ -0,0 +1,105 @@
+{
+    "chip": "A6XX",
+    "groups": [
+        {
+            "name": "CP",
+            "num": 14,
+            "reserved": [ 0 ],
+            "select": "CP_PERFCTR_CP_SEL",
+            "counter": "RBBM_PERFCTR_CP",
+            "countable_type": "a6xx_cp_perfcounter_select"
+        },
+        {
+            "name": "CCU",
+            "num": 5,
+            "select": "RB_PERFCTR_CCU_SEL",
+            "counter": "RBBM_PERFCTR_CCU",
+            "countable_type": "a6xx_ccu_perfcounter_select"
+        },
+        {
+            "name": "TSE",
+            "num": 4,
+            "select": "GRAS_PERFCTR_TSE_SEL",
+            "counter": "RBBM_PERFCTR_TSE",
+            "countable_type": "a6xx_tse_perfcounter_select"
+        },
+        {
+            "name": "RAS",
+            "num": 4,
+            "select": "GRAS_PERFCTR_RAS_SEL",
+            "counter": "RBBM_PERFCTR_RAS",
+            "countable_type": "a6xx_ras_perfcounter_select"
+        },
+        {
+            "name": "LRZ",
+            "num": 4,
+            "select": "GRAS_PERFCTR_LRZ_SEL",
+            "counter": "RBBM_PERFCTR_LRZ",
+            "countable_type": "a6xx_lrz_perfcounter_select"
+        },
+        {
+            "name": "HLSQ",
+            "num": 6,
+            "select": "HLSQ_PERFCTR_HLSQ_SEL",
+            "counter": "RBBM_PERFCTR_HLSQ",
+            "countable_type": "a6xx_hlsq_perfcounter_select"
+        },
+        {
+            "name": "PC",
+            "num": 8,
+            "select": "PC_PERFCTR_PC_SEL",
+            "counter": "RBBM_PERFCTR_PC",
+            "countable_type": "a6xx_pc_perfcounter_select"
+        },
+        {
+            "name": "RB",
+            "num": 8,
+            "select": "RB_PERFCTR_RB_SEL",
+            "counter": "RBBM_PERFCTR_RB",
+            "countable_type": "a6xx_rb_perfcounter_select"
+        },
+        {
+            "name": "SP",
+            "num": 24,
+            "reserved": [ 0 ],
+            "select": "SP_PERFCTR_SP_SEL",
+            "counter": "RBBM_PERFCTR_SP",
+            "countable_type": "a6xx_sp_perfcounter_select"
+        },
+        {
+            "name": "TP",
+            "num": 12,
+            "select": "TPL1_PERFCTR_TP_SEL",
+            "counter": "RBBM_PERFCTR_TP",
+            "countable_type": "a6xx_tp_perfcounter_select"
+        },
+        {
+            "name": "UCHE",
+            "num": 12,
+            "select": "UCHE_PERFCTR_UCHE_SEL",
+            "counter": "RBBM_PERFCTR_UCHE",
+            "countable_type": "a6xx_uche_perfcounter_select"
+        },
+        {
+            "name": "VFD",
+            "num": 8,
+            "select": "VFD_PERFCTR_VFD_SEL",
+            "counter": "RBBM_PERFCTR_VFD",
+            "countable_type": "a6xx_vfd_perfcounter_select"
+        },
+        {
+            "name": "VPC",
+            "num": 6,
+            "select": "VPC_PERFCTR_VPC_SEL",
+            "counter": "RBBM_PERFCTR_VPC",
+            "countable_type": "a6xx_vpc_perfcounter_select"
+        },
+        {
+            "name": "VSC",
+            "num": 2,
+            "select": "VSC_PERFCTR_VSC_SEL",
+            "counter": "RBBM_PERFCTR_VSC",
+            "countable_type": "a6xx_vsc_perfcounter_select"
+        }
+    ]
+}
diff --git a/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
new file mode 100644
index 000000000000..e60aab1862ec
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
@@ -0,0 +1,228 @@
+{
+    "chip": "A7XX",
+    "groups": [
+        {
+            "name": "CP",
+            "num": 14,
+            "reserved": [ 0 ],
+            "select": "CP_PERFCTR_CP_SEL",
+            "counter": "RBBM_PERFCTR_CP",
+            "countable_type": "a7xx_cp_perfcounter_select"
+        },
+        {
+            "name": "RBBM",
+            "num": 4,
+            "select": "RBBM_PERFCTR_RBBM_SEL",
+            "counter": "RBBM_PERFCTR_RBBM",
+            "countable_type": "a7xx_rbbm_perfcounter_select"
+        },
+        {
+            "name": "PC",
+            "pipe": "BR",
+            "num": 8,
+            "select": "PC_PERFCTR_PC_SEL",
+            "counter": "RBBM_PERFCTR_PC",
+            "countable_type": "a7xx_pc_perfcounter_select"
+        },
+        {
+            "name": "VFD",
+            "pipe": "BR",
+            "num": 8,
+            "select": "VFD_PERFCTR_VFD_SEL",
+            "counter": "RBBM_PERFCTR_VFD",
+            "countable_type": "a7xx_vfd_perfcounter_select"
+        },
+        {
+            "name": "HLSQ",
+            "pipe": "BR",
+            "num": 6,
+            "select": "SP_PERFCTR_HLSQ_SEL",
+            "counter": "RBBM_PERFCTR_HLSQ",
+            "countable_type": "a7xx_hlsq_perfcounter_select"
+        },
+        {
+            "name": "VPC",
+            "pipe": "BR",
+            "num": 6,
+            "select": "VPC_PERFCTR_VPC_SEL",
+            "counter": "RBBM_PERFCTR_VPC",
+            "countable_type": "a7xx_vpc_perfcounter_select"
+        },
+        {
+            "name": "TSE",
+            "pipe": "BR",
+            "num": 4,
+            "select": "GRAS_PERFCTR_TSE_SEL",
+            "counter": "RBBM_PERFCTR_TSE",
+            "countable_type": "a7xx_tse_perfcounter_select"
+        },
+        {
+            "name": "RAS",
+            "pipe": "BR",
+            "num": 4,
+            "select": "GRAS_PERFCTR_RAS_SEL",
+            "counter": "RBBM_PERFCTR_RAS",
+            "countable_type": "a7xx_ras_perfcounter_select"
+        },
+        {
+            "name": "UCHE",
+            "num": 12,
+            "select": "UCHE_PERFCTR_UCHE_SEL",
+            "counter": "RBBM_PERFCTR_UCHE",
+            "countable_type": "a7xx_uche_perfcounter_select"
+        },
+        {
+            "name": "TP",
+            "pipe": "BR",
+            "num": 12,
+            "select": "TPL1_PERFCTR_TP_SEL",
+            "counter": "RBBM_PERFCTR_TP",
+            "countable_type": "a7xx_tp_perfcounter_select"
+        },
+        {
+            "name": "SP",
+            "pipe": "BR",
+            "num": 24,
+            "select": "SP_PERFCTR_SP_SEL",
+            "counter": "RBBM_PERFCTR_SP",
+            "countable_type": "a7xx_sp_perfcounter_select"
+        },
+        {
+            "name": "RB",
+            "num": 8,
+            "select": "RB_PERFCTR_RB_SEL",
+            "counter": "RBBM_PERFCTR_RB",
+            "countable_type": "a7xx_rb_perfcounter_select"
+        },
+        {
+            "name": "VSC",
+            "num": 2,
+            "select": "VSC_PERFCTR_VSC_SEL",
+            "counter": "RBBM_PERFCTR_VSC",
+            "countable_type": "a7xx_vsc_perfcounter_select"
+        },
+        {
+            "name": "CCU",
+            "num": 5,
+            "select": "RB_PERFCTR_CCU_SEL",
+            "counter": "RBBM_PERFCTR_CCU",
+            "countable_type": "a7xx_ccu_perfcounter_select"
+        },
+        {
+            "name": "LRZ",
+            "pipe": "BR",
+            "num": 4,
+            "select": "GRAS_PERFCTR_LRZ_SEL",
+            "counter": "RBBM_PERFCTR_LRZ",
+            "countable_type": "a7xx_lrz_perfcounter_select"
+        },
+        {
+            "name": "CMP",
+            "num": 4,
+            "select": "RB_PERFCTR_CMP_SEL",
+            "counter": "RBBM_PERFCTR_CMP",
+            "countable_type": "a7xx_cmp_perfcounter_select"
+        },
+        {
+            "name": "UFC",
+            "pipe": "BR",
+            "num": 4,
+            "select": "RB_PERFCTR_UFC_SEL",
+            "counter": "RBBM_PERFCTR_UFC",
+            "countable_type": "a7xx_ufc_perfcounter_select"
+        },
+        {
+            "name": "BV_CP",
+            "num": 7,
+            "select": "CP_BV_PERFCTR_CP_SEL",
+            "counter": "RBBM_PERFCTR2_CP",
+            "countable_type": "a7xx_cp_perfcounter_select"
+        },
+        {
+            "name": "BV_PC",
+            "pipe": "BV",
+            "num": 8,
+            "select_offset": 8,
+            "select": "PC_PERFCTR_PC_SEL",
+            "counter": "RBBM_PERFCTR_BV_PC",
+            "countable_type": "a7xx_pc_perfcounter_select"
+        },
+        {
+            "name": "BV_VFD",
+            "pipe": "BV",
+            "num": 8,
+            "select_offset": 8,
+            "select": "VFD_PERFCTR_VFD_SEL",
+            "counter": "RBBM_PERFCTR_BV_VFD",
+            "countable_type": "a7xx_vfd_perfcounter_select"
+        },
+        {
+            "name": "BV_VPC",
+            "pipe": "BV",
+            "num": 6,
+            "select_offset": 6,
+            "select": "VPC_PERFCTR_VPC_SEL",
+            "counter": "RBBM_PERFCTR_BV_VPC",
+            "countable_type": "a7xx_vpc_perfcounter_select"
+        },
+        {
+            "name": "BV_TP",
+            "pipe": "BV",
+            "num": 6,
+            "select_offset": 12,
+            "select": "TPL1_PERFCTR_TP_SEL",
+            "counter": "RBBM_PERFCTR2_TP",
+            "countable_type": "a7xx_tp_perfcounter_select"
+        },
+        {
+            "name": "BV_SP",
+            "pipe": "BV",
+            "num": 12,
+            "select_offset": 24,
+            "select": "SP_PERFCTR_SP_SEL",
+            "counter": "RBBM_PERFCTR2_SP",
+            "countable_type": "a7xx_sp_perfcounter_select"
+        },
+        {
+            "name": "BV_UFC",
+            "pipe": "BV",
+            "num": 2,
+            "select_offset": 4,
+            "select": "RB_PERFCTR_UFC_SEL",
+            "counter": "RBBM_PERFCTR2_UFC",
+            "countable_type": "a7xx_ufc_perfcounter_select"
+        },
+        {
+            "name": "BV_TSE",
+            "pipe": "BV",
+            "num": 4,
+            "select": "GRAS_PERFCTR_TSE_SEL",
+            "counter": "RBBM_PERFCTR_BV_TSE",
+            "countable_type": "a7xx_tse_perfcounter_select"
+        },
+        {
+            "name": "BV_RAS",
+            "pipe": "BV",
+            "num": 4,
+            "select": "GRAS_PERFCTR_RAS_SEL",
+            "counter": "RBBM_PERFCTR_BV_RAS",
+            "countable_type": "a7xx_ras_perfcounter_select"
+        },
+        {
+            "name": "BV_LRZ",
+            "pipe": "BV",
+            "num": 4,
+            "select": "GRAS_PERFCTR_LRZ_SEL",
+            "counter": "RBBM_PERFCTR_BV_LRZ",
+            "countable_type": "a7xx_lrz_perfcounter_select"
+        },
+        {
+            "name": "BV_HLSQ",
+            "pipe": "BV",
+            "num": 6,
+            "select": "SP_PERFCTR_HLSQ_SEL",
+            "counter": "RBBM_PERFCTR2_HLSQ",
+            "countable_type": "a7xx_hlsq_perfcounter_select"
+        }
+    ]
+}
diff --git a/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
new file mode 100644
index 000000000000..503b113df397
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
@@ -0,0 +1,240 @@
+{
+    "chip": "A8XX",
+    "groups": [
+        {
+            "name": "CP",
+            "num": 14,
+            "reserved": [ 0 ],
+            "select": "CP_PERFCTR_CP_SEL",
+            "counter": "RBBM_PERFCTR_CP",
+            "countable_type": "a8xx_cp_perfcounter_select"
+        },
+        {
+            "name": "RBBM",
+            "num": 4,
+            "select": "RBBM_PERFCTR_RBBM_SEL",
+            "slice_select": [ "RBBM_SLICE_PERFCTR_RBBM_SEL" ],
+            "counter": "RBBM_PERFCTR_RBBM",
+            "countable_type": "a8xx_rbbm_perfcounter_select"
+        },
+        {
+            "name": "PC",
+            "pipe": "BR",
+            "num": 8,
+            "select": "PC_PERFCTR_PC_SEL",
+            "slice_select": [ "PC_SLICE_PERFCTR_PC_SEL" ],
+            "counter": "RBBM_PERFCTR_PC",
+            "countable_type": "a8xx_pc_perfcounter_select"
+        },
+        {
+            "name": "VFD",
+            "pipe": "BR",
+            "num": 8,
+            "select": "VFD_PERFCTR_VFD_SEL",
+            "counter": "RBBM_PERFCTR_VFD",
+            "countable_type": "a8xx_vfd_perfcounter_select"
+        },
+        {
+            "name": "HLSQ",
+            "pipe": "BR",
+            "num": 6,
+            "select": "SP_PERFCTR_HLSQ_SEL",
+            "slice_select": [ "SP_PERFCTR_HLSQ_SEL_2" ],
+            "counter": "RBBM_PERFCTR_HLSQ",
+            "countable_type": "a8xx_hlsq_perfcounter_select"
+        },
+        {
+            "name": "VPC",
+            "pipe": "BR",
+            "num": 6,
+            "select": "VPC_PERFCTR_VPC_SEL",
+            "slice_select": [ "VPC_PERFCTR_VPC_SEL_1", "VPC_PERFCTR_VPC_SEL_2" ],
+            "counter": "RBBM_PERFCTR_VPC",
+            "countable_type": "a8xx_vpc_perfcounter_select"
+        },
+        {
+            "name": "TSE",
+            "pipe": "BR",
+            "num": 4,
+            "select": "GRAS_PERFCTR_TSE_SEL",
+            "slice_select": [ "GRAS_PERFCTR_TSEFE_SEL" ],
+            "counter": "RBBM_PERFCTR_TSE",
+            "countable_type": "a8xx_tse_perfcounter_select"
+        },
+        {
+            "name": "RAS",
+            "pipe": "BR",
+            "num": 4,
+            "select": "GRAS_PERFCTR_RAS_SEL",
+            "counter": "RBBM_PERFCTR_RAS",
+            "countable_type": "a8xx_ras_perfcounter_select"
+        },
+        {
+            "name": "UCHE",
+            "num": 12,
+            "select": "UCHE_PERFCTR_UCHE_SEL",
+            "counter": "RBBM_PERFCTR_UCHE",
+            "countable_type": "a8xx_uche_perfcounter_select"
+        },
+        {
+            "name": "TP",
+            "pipe": "BR",
+            "num": 12,
+            "select": "TPL1_PERFCTR_TP_SEL",
+            "counter": "RBBM_PERFCTR_TP",
+            "countable_type": "a8xx_tp_perfcounter_select"
+        },
+        {
+            "name": "SP",
+            "pipe": "BR",
+            "num": 24,
+            "select": "SP_PERFCTR_SP_SEL",
+            "counter": "RBBM_PERFCTR_SP",
+            "countable_type": "a8xx_sp_perfcounter_select"
+        },
+        {
+            "name": "RB",
+            "pipe": "BR",
+            "num": 8,
+            "select": "RB_PERFCTR_RB_SEL",
+            "counter": "RBBM_PERFCTR_RB",
+            "countable_type": "a8xx_rb_perfcounter_select"
+        },
+        {
+            "name": "VSC",
+            "num": 2,
+            "select": "VSC_PERFCTR_VSC_SEL",
+            "counter": "RBBM_PERFCTR_VSC",
+            "countable_type": "a8xx_vsc_perfcounter_select"
+        },
+        {
+            "name": "CCU",
+            "pipe": "BR",
+            "num": 5,
+            "select": "RB_PERFCTR_CCU_SEL",
+            "counter": "RBBM_PERFCTR_CCU",
+            "countable_type": "a8xx_ccu_perfcounter_select"
+        },
+        {
+            "name": "LRZ",
+            "pipe": "BR",
+            "num": 4,
+            "select": "GRAS_PERFCTR_LRZ_SEL",
+            "counter": "RBBM_PERFCTR_LRZ",
+            "countable_type": "a8xx_lrz_perfcounter_select"
+        },
+        {
+            "name": "CMP",
+            "num": 4,
+            "select": "RB_PERFCTR_CMP_SEL",
+            "counter": "RBBM_PERFCTR_CMP",
+            "countable_type": "a8xx_cmp_perfcounter_select"
+        },
+        {
+            "name": "UFC",
+            "pipe": "BR",
+            "num": 4,
+            "select": "RB_PERFCTR_UFC_SEL",
+            "counter": "RBBM_PERFCTR_UFC",
+            "countable_type": "a8xx_ufc_perfcounter_select"
+        },
+        {
+            "name": "BV_CP",
+            "num": 7,
+            "select_offset": 14,
+            "select": "CP_PERFCTR_CP_SEL",
+            "counter": "RBBM_PERFCTR2_CP",
+            "countable_type": "a8xx_cp_perfcounter_select"
+        },
+        {
+            "name": "BV_PC",
+            "pipe": "BV",
+            "num": 8,
+            "select_offset": 8,
+            "select": "PC_PERFCTR_PC_SEL",
+            "slice_select": [ "PC_SLICE_PERFCTR_PC_SEL" ],
+            "counter": "RBBM_PERFCTR_BV_PC",
+            "countable_type": "a8xx_pc_perfcounter_select"
+        },
+        {
+            "name": "BV_VFD",
+            "pipe": "BV",
+            "num": 8,
+            "select_offset": 8,
+            "select": "VFD_PERFCTR_VFD_SEL",
+            "counter": "RBBM_PERFCTR_BV_VFD",
+            "countable_type": "a8xx_vfd_perfcounter_select"
+        },
+        {
+            "name": "BV_VPC",
+            "pipe": "BV",
+            "num": 6,
+            "select_offset": 6,
+            "select": "VPC_PERFCTR_VPC_SEL",
+            "slice_select": [ "VPC_PERFCTR_VPC_SEL_1", "VPC_PERFCTR_VPC_SEL_2" ],
+            "counter": "RBBM_PERFCTR_BV_VPC",
+            "countable_type": "a8xx_vpc_perfcounter_select"
+        },
+        {
+            "name": "BV_TP",
+            "pipe": "BV",
+            "num": 8,
+            "select_offset": 12,
+            "select": "TPL1_PERFCTR_TP_SEL",
+            "counter": "RBBM_PERFCTR2_TP",
+            "countable_type": "a8xx_tp_perfcounter_select"
+        },
+        {
+            "name": "BV_SP",
+            "pipe": "BV",
+            "num": 12,
+            "select_offset": 24,
+            "select": "SP_PERFCTR_SP_SEL",
+            "counter": "RBBM_PERFCTR2_SP",
+            "countable_type": "a8xx_sp_perfcounter_select"
+        },
+        {
+            "name": "BV_UFC",
+            "pipe": "BV",
+            "num": 2,
+            "select_offset": 4,
+            "select": "RB_PERFCTR_UFC_SEL",
+            "counter": "RBBM_PERFCTR2_UFC",
+            "countable_type": "a8xx_ufc_perfcounter_select"
+        },
+        {
+            "name": "BV_TSE",
+            "pipe": "BV",
+            "num": 4,
+            "select": "GRAS_PERFCTR_TSE_SEL",
+            "slice_select": [ "GRAS_PERFCTR_TSEFE_SEL" ],
+            "counter": "RBBM_PERFCTR_BV_TSE",
+            "countable_type": "a8xx_tse_perfcounter_select"
+        },
+        {
+            "name": "BV_RAS",
+            "pipe": "BV",
+            "num": 4,
+            "select": "GRAS_PERFCTR_RAS_SEL",
+            "counter": "RBBM_PERFCTR_BV_RAS",
+            "countable_type": "a8xx_ras_perfcounter_select"
+        },
+        {
+            "name": "BV_LRZ",
+            "pipe": "BV",
+            "num": 4,
+            "select": "GRAS_PERFCTR_LRZ_SEL",
+            "counter": "RBBM_PERFCTR_BV_LRZ",
+            "countable_type": "a8xx_lrz_perfcounter_select"
+        },
+        {
+            "name": "BV_HLSQ",
+            "pipe": "BV",
+            "num": 6,
+            "select": "SP_PERFCTR_HLSQ_SEL",
+            "slice_select": [ "SP_PERFCTR_HLSQ_SEL_2" ],
+            "counter": "RBBM_PERFCTR2_HLSQ",
+            "countable_type": "a8xx_hlsq_perfcounter_select"
+        }
+    ]
+}
-- 
2.54.0


