Return-Path: <linux-arm-msm+bounces-101102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I0SM20CzGljNQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:20:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B236E85B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08DAA30821A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF46531A053;
	Tue, 31 Mar 2026 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2C81cwd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEAWNqX1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C6E319848
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977172; cv=none; b=m47HBN7ZIyK4q+YoRA1e+xBN4jO7ZiWOLltCxi4aimsmfVK34YXRoFS1uFgapNGQKARcMzMhNO+sMmcorj9mMzanepNg1++pFiho2Q/YkYcxlRQSDwFTEKmsuCgjUrVGUPg+i+KGCv+ubxAAA3ES654zYaRUlw3y6hd3Wez3s7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977172; c=relaxed/simple;
	bh=E80RH1g6+XmtOt05VuW8EQSwyqUGmVWXM3zADBQrnQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T9h7QVU+2p7bihl9GK4OOUhL3Xj0cGkL23H+JVNMyT/sU1+kWnqeCEVrGoPV9jnO59LdXgr/Jg+z1BrDI4qNn1gmU3szPFp6vfWJPU5Vpmw8l6dOcxjg8jMw+OwuHCG4AJye/eNBd8ooHKkwSj9nAIjvP8Rs0r/X4ATi5ogKk3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2C81cwd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEAWNqX1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdgXv3926844
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JEf1zqA7HQYkJuYe1UvKDxOfM4VJ0k2jxtE
	W6JLvxpw=; b=Q2C81cwd1QfS97JShr7yx+PFI6uTDkCMTGxY/YhxiU+pFPZVOyf
	Blu9HAIIsNfYnlJiOl6PZSXVZmbvzIoo6yxu+93L81usTrq5JB0tzQvY/jiJqKyV
	Neh5KA37ZFU+2Nh3IEj67nzYfrHIbNfUrPacXimm0b+gvwjeVmSzZseTMnWMFONH
	VXpHdiXqsneWI2+zt0n76mVsZwmTnY+qW9KZcixsaFQe1kHQcNbGWvkJ37MH6eNe
	WyqNhK7u9cSuaD8XrkPs1TZB93CyMY2jW1YGXDmvHawoY7iuTcHhwbJUvH3vg/LX
	ZvKIMYoQM9sJh6as6hQRossdnfaq2WMuZww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b9327u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:12:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c741c4cebf3so3608961a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774977170; x=1775581970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEf1zqA7HQYkJuYe1UvKDxOfM4VJ0k2jxtEW6JLvxpw=;
        b=FEAWNqX1U14QwsWJrz4IQjEt12SEWZlJQ8++QvbHZVofT70Fyr9VXwdy1YAnr8zl4f
         Z/i84sPP4wfk7/oaqKwS/F/Z/AV8xdWQpapKb13mfiVVSPoN1OZ0lLsaxfO36lvjUkLK
         f4BifPG3y2trDQpFSJhv48fpS52ggq/qI6KvQxTj/TX1lw+ovx8xogkopG5/xy+GWGo7
         fZREGF3xNz+pSdT0n5LFteyTSGtCfkeTTAf5KwiRvY084HwQtJBw0OWB75WqRpgi5hxx
         qCFYifL6XVE3XIUrjta2BdPdaaIZVbe47o7WwIDtmeJlzLCB3iiV5Fz9leBDIIJ5mp1v
         3mfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977170; x=1775581970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEf1zqA7HQYkJuYe1UvKDxOfM4VJ0k2jxtEW6JLvxpw=;
        b=snLyCuvsKfjRkTm5IJNET1zUwgNeIBNKY9pIHqbMnxssJALbWcoan8xn4xJMa7T7k+
         0TbzZHvp7RPNI7Jb+/4HtcW5QyjcRFE+TbCV9k6j2V+4BBwqIXvoWvkvmQjkbtopqt7F
         9o5ES0HZg/5rC2MeDnR448q1OnovWVxRq6epp8fe6IdXa5KmRXVYfT1KcNuzCBXxpbVS
         lNDSq0dVKXg27dyXZHX7Wo384PisxS/3INhdz4VvpkbEzqmb0wGi4xn/pDI9CUpOlW+b
         V3rs2AIuaCwbqIL1hhhjSh+swU3pvUFQpmCOBJ8TaFQey1I+FS/hkNKFgIxlpQ9/ppew
         zWeQ==
X-Gm-Message-State: AOJu0Yw0pmexv7oSycLgArZ/vYAAuO00h0uTytkyIYq+targkdO/+mnT
	CUKZMjTNbbnP6aRMP8M9/pQHGVr7/jSfLCFYiMi0/Jaq7fryvDj1CeIyl0XhLEYrH845B1JuHBY
	PetIe04H9WHp4ztMUcZgwEzXMEAlsOyNuQsZwFyX1Vdf/wSa/OP8LDIWqA1qCSHEeF6SL
X-Gm-Gg: ATEYQzyniFnD8ehVIwmBFcCXAA7kTMreZvQtpOwyg0b+6krEmjCX4BiAb8bCAxp0nIK
	6eEDaemk7BI7WZEsdbfX3fLgffGT9OP8K8DpsjjPqJ2n5/THWEWoXXFx3ptZ9r3KCUO9Fv9aXjY
	yTILErnRVNSUSAeyFDPHm8Pg5Od0hWBZzIlSpye7R6Ehj6abNEN9Z2VoPgOiG0BhymPS/I1aYs+
	ZULFjKxmzJd+hMqEc5E7AJJfvpLnFoZPi72zeJ8LuRNeNwe1RLWeFm59OLoWkp5hbrKsKDUhyIE
	tqKrJ1ztDxJ+YYbsCzt/3ZziL7siUHdLOnMCnAzion1SYMtUNfA4ZDqFzfKGdBcOYXgPZgU1/N9
	Tl85vZtOHn37GrIVr4rh1CR72Qe/pJPHNLpHzpVk4ntySN29Q
X-Received: by 2002:a05:6a00:230b:b0:82c:9126:31f1 with SMTP id d2e1a72fcca58-82ce891032cmr414755b3a.14.1774977169647;
        Tue, 31 Mar 2026 10:12:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:230b:b0:82c:9126:31f1 with SMTP id d2e1a72fcca58-82ce891032cmr414722b3a.14.1774977169025;
        Tue, 31 Mar 2026 10:12:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca84644d9sm11362062b3a.13.2026.03.31.10.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:12:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2] remoteproc: qcom: Fix minidump out-of-bounds access on subsystems array
Date: Tue, 31 Mar 2026 22:42:43 +0530
Message-ID: <20260331171243.1962067-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE2NCBTYWx0ZWRfX53bIYP7r9iAL
 EcS64U0ZvfKJUIWpjTjHLmFEawUELWyb4oCFpp6BBIByJYs0uUv1pP26j9CEm87AofGNozE57NO
 b2Rlm5aV6uFMDsqI67oQO0/yb5aWY7VjxEmlqUfps3PGLg45tYj4576oFJZ3b4pF3ac+8mkL1OH
 GzLFuckofWBw8ts9V8hV8oNnrqjTOwWLYzQwWkQ7y7leNDaOAID0IAMD6cspG+mFwLlnh/gDWIs
 AudpkvOMgUrTH7u+ZYQ3FIGvoDZiIdYajuKoDKonFGS9iTOzAbShuqMvELVe7SdmtoHq5bd4ZVm
 VsVm7tCt7a/8rtJbgJ1vK8tYrt//XSSVRyyYbXZbY3FZFfOcxAOVserEBLI7UfDSL/kfKQq9BRl
 +B4Gx7WpD28QgUHctoWZ+dqfst7BCOmANNNODZB8Ekiz5gu/e6Pu/NNL3C7s2+8WWxv9c6gXxd2
 0dC5hpQVTxob4PDTmZA==
X-Proofpoint-ORIG-GUID: OXpn0ndBVikInJFDwm6Jsg8h8nM73DK6
X-Proofpoint-GUID: OXpn0ndBVikInJFDwm6Jsg8h8nM73DK6
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cc0092 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BG4z5P5NB9rwbtz6RWcA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310164
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101102-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 442B236E85B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MAX_NUM_OF_SS was hardcoded to 10 in the minidump_global_toc struct,
which is a direct overlay on an SMEM item allocated by the firmware.
Newer Qualcomm SoC firmware allocates space for more subsystems, while
older firmware only allocates space for 10. Bumping the constant would
cause Linux to read/write beyond the SMEM item boundary on older
platforms.

Fix this by converting subsystems[] to a flexible array member and
deriving the actual number of subsystems at runtime from the size
returned by qcom_smem_get(). Add a bounds check on minidump_id against
the derived count before indexing into the array.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2: https://lore.kernel.org/lkml/20250808164417.4105659-1-mukesh.ojha@oss.qualcomm.com/
 - Converted subsystems as flexible array and derived the no of
   subsystem entries from the size returned from qcom_smem_get() to check the
   validity of minidump index.

 drivers/remoteproc/qcom_common.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 6c31140268ac..fd2b6824ad26 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -28,7 +28,6 @@
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
 #define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
 
-#define MAX_NUM_OF_SS           10
 #define MAX_REGION_NAME_LENGTH  16
 #define SBL_MINIDUMP_SMEM_ID	602
 #define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
@@ -80,7 +79,7 @@ struct minidump_global_toc {
 	__le32				status;
 	__le32				md_revision;
 	__le32				enabled;
-	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
+	struct minidump_subsystem	subsystems[];
 };
 
 struct qcom_ssr_subsystem {
@@ -151,9 +150,11 @@ void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
 	int ret;
 	struct minidump_subsystem *subsystem;
 	struct minidump_global_toc *toc;
+	unsigned int num_ss;
+	size_t toc_size;
 
 	/* Get Global minidump ToC*/
-	toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, NULL);
+	toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, &toc_size);
 
 	/* check if global table pointer exists and init is set */
 	if (IS_ERR(toc) || !toc->status) {
@@ -161,6 +162,16 @@ void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
 		return;
 	}
 
+	/* Derive the number of subsystems from the actual SMEM item size */
+	num_ss = (toc_size - offsetof(struct minidump_global_toc, subsystems)) /
+		 sizeof(struct minidump_subsystem);
+
+	if (minidump_id >= num_ss) {
+		dev_err(&rproc->dev, "Minidump id %d is out of range: %d\n",
+			minidump_id, num_ss);
+		return;
+	}
+
 	/* Get subsystem table of contents using the minidump id */
 	subsystem = &toc->subsystems[minidump_id];
 
-- 
2.53.0


