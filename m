Return-Path: <linux-arm-msm+bounces-102051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BZ+MZuL1GmjvAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:44:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C01E3A9BAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 522E6301AAB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 04:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7895933507D;
	Tue,  7 Apr 2026 04:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Toet7sZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aE4nlGSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E8F337699
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 04:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775537027; cv=none; b=KqPIDOsypjHMm2EREqZC3YUGHBJpLBc0kbp7L919BKcZwZEUYggO9/Bg9uocEsS72h8m43GJpe+GBArakRlhTXXkEHNrhCEQPT0Xki5/W48+tstNiE7gR3FGj0N/SO3HkpUofZt9vhnL4n8RcH8uc6IG01Kj72OKtn99XJVIhAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775537027; c=relaxed/simple;
	bh=sL0AAcPy7viWgfA/9FLqMUV4KTxuU7dUv5w4fRLlIiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IKYCvkF9r//Y6KDKNSzkOn4UkUbU6IozGirNKv8B5Y8Owd+GpZK3FvEv/QyCWWNgem4KzEdDztXLrV3YRLpLej0e6c4psKCcuAZZxZiw1keuasxyKowzBgRx+obb/e6R7OyyfhfGg/5/9QfHxdZzzbXf54UhmxBRewzV9tH0og8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Toet7sZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aE4nlGSj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LSBfj2327732
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 04:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O3fRITYQAHKvF88MQ+Ws0Zlfylc75OFlgS1WmTi0q9E=; b=Toet7sZSwUu+9Wt5
	1868Ty139sUSvpET9u2xLALthc7jRsG1DzdVOgFAGpUY3hqjbLD9NRDq8K4VL4jk
	jVUEIi89MAKTKTQ0wZAEhusx8T5HbJdY2QTGo1b8ROCiVQTBLKwnJ1Q01wOPc80V
	QMLQc+p/KNwpBzZqt+MlywJOSVR0fUjMK+riteCXqHVW8N5lrBXWM37OSdGJoOVK
	Zg4wlUzAGvI0XG+OcspcB6Io/3T59AFTDr7ZtoSgvq6w9AZUPOQHyEdzRYtUJOAi
	iqd9BHae7JVYAPl+iphreSQV6AUGjTK/DU6XkxpMOcX0my1nLfXhgsWLT7/nPkQH
	6cd5kQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4s1md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:43:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82d02942266so5824059b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 21:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775537024; x=1776141824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3fRITYQAHKvF88MQ+Ws0Zlfylc75OFlgS1WmTi0q9E=;
        b=aE4nlGSjUf6MT+AR7A6HpLwQxeL7lCCt53iofC8fIj+jIZwFAMTPZMibsYXI/Qb5hE
         GG/yKTAW7EsePyGT5GVCPYTLX0JUdm1mwPL4ZDZpwzL951juMU9e6UJyg3WhIBdaKsH0
         oVVPUtVbDE8cdfRPBrUA5+BXX+CrSm9AGd3y+6MNCXHKHJBOIhYkanVBZ1a69+qSJ9lu
         OIqzED7I+CNkULYEY0SPuR326ZxL+uyUolREM9izOtXizsQ6K/6TJDeJwsk8SRFlzeCw
         B3xOPNWEtqZsR4+tvug26ADmk+lfVmh34UyEo3lwuMp6N79ZY6gK0czNFEnqjwz1mSH1
         BD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775537024; x=1776141824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O3fRITYQAHKvF88MQ+Ws0Zlfylc75OFlgS1WmTi0q9E=;
        b=RmDj5L9W5YfL/wDWP5Axy2vH/0qJGUT0N4zPZzZMuUDvmh0MPQQ/mxLeHvHBW4AEXw
         3m4ZNyINkiYzVbgtyloQYQWfelAnMcsHi5Kp3qCQL2U/rdTE/9eKx1EXebij52BS4F6i
         af6QdjWO3GSjYCgF/WJ8ZZN0zCSzBcHlEtvEOv6kI867syW84cTQ+MkmUk53jGS0zQfr
         dXTKlPBh7qwsrKQoRO7FwHYs2CXVWtq15JYxPJa9/jiKY38n6FmQeV13u+G2KVLSpLI+
         8H1JNLxUIWQmUm3og9FzzrujLzWncB3Y/7uqpoooI8pRC+hFQaEtRsXjhbqkpENBnzVm
         dk3w==
X-Gm-Message-State: AOJu0Yz28EMp6RQ1BMU1GJAGg3tYvRikE1q1SiqYESyQJ2CX2lHctmHt
	8BAVKlbREQzHkF9oTp4hCuGhaSMviVvDQHnd7ieWsBc75NWDGLDzK7mkBAHDSvoLSwiT27FZxgj
	Z6BLKq5lMSce+ZTuhPJRr0nzrIIRsDDfQwIKVcGAVIx1PDtPqWPI9IkdGBiWfBc1XHhsw
X-Gm-Gg: AeBDietm10+RtOJBjZi5GlpIFkz6lb4y6+f9OHMoakynSvOVHVjXwuOEu9UKSz7pQyw
	1zQR1ZTPYO0anyGDBrCZDfBQ/hUzYvFe4VgMe6RKjnlmvWXSsgegMWDuW7j+o+ft9qxONg9cuTk
	98pYdoYWxL5PB5qpp8fhALT4NFB28HecZp0gdmtM0u/YBTRMp48t7BIqVDkohBcaaUwUME3vMI5
	GMlPaHmWkZ5IGmFIxr6VVY2eihYtpRwED1f1qKXmxMa4bpUZpbS1+V3+F+7/kp+RgGZArqQ5E4w
	KJCwg3SGp90C9IvkT6fTjWjnmhQhxB5FKN+w6+OuyJIiOIzbKT0uohQ5KT+GVmoMEZJdQhNxp6F
	vpCrlZUPIvYompSQt9DESKKAh/YH0prpqkFXVRbK0DfgkZS7ILYc=
X-Received: by 2002:a05:6a00:1388:b0:82c:9c4f:da3 with SMTP id d2e1a72fcca58-82d0db5abefmr15433916b3a.31.1775537024429;
        Mon, 06 Apr 2026 21:43:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:1388:b0:82c:9c4f:da3 with SMTP id d2e1a72fcca58-82d0db5abefmr15433890b3a.31.1775537023903;
        Mon, 06 Apr 2026 21:43:43 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ba2fsm16123299b3a.45.2026.04.06.21.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 21:43:43 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:13:30 +0530
Subject: [PATCH v3 2/4] regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-read-rpmh-v3-v3-2-34079f92691c@oss.qualcomm.com>
References: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
In-Reply-To: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775537013; l=2552;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=sL0AAcPy7viWgfA/9FLqMUV4KTxuU7dUv5w4fRLlIiw=;
 b=NIIGHNktix1DXynEvtU9KwCqHdjL3PptMxd2COJfS2yZEY3KV5TLIufXLLhtq83rTi3CqG5Mi
 zwUa6tBLRA7CBGVG6TuD+m+CYmDdxAvvnvur0AA4lWVURkfRNBxwrTR
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0MSBTYWx0ZWRfX0IGgvIui/2xX
 COhhsacQJnwbXCmqKy5tas0MSwCl5dUMr2p6ZLZU612bl2BOBcQE9veJ0qBTl539WpYoZzPGhx5
 8xOjsWvCrQ2XZsUn3UATyLPBH0UAWaNekhRPEmxKu2Bwj1ULZeNIKXbx0Qe1Cf9lqu8j0nvPzTE
 8yIyIsE8wySO0AbXkinLQRWa1Gpf8fVhmcKzTO0icPAZrGfPjOw8o7u+pEBOoqpc1RNTawCcVJh
 BLtU6Y+EW4x152V/d2do4fGILy98hM05pXN4fKlZvr/wXKCRLaVsYlhkYHAM7pjOUJiM2Fy+SuQ
 5uMkx3rA3r+iRqJDVQchqjDg5qlhBYchbQu+8qEMp6+s6UGRODCv/4w9qmNmGhCOhx+viEzRO4H
 lTGcNX6IiDmFxdlSSB/49u8vFUdNxg9an1Xh3qbl4e+LGNNI7etEGdDeHUHcfKoQsXiMOD4u9Fd
 4Yn8rAjVAE2GkuhykrQ==
X-Proofpoint-ORIG-GUID: woWJGZ-PLDDgq35OVuGRwgirP92EiiMo
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d48b81 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=W0IsM1cLceJ2lu2XXEMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: woWJGZ-PLDDgq35OVuGRwgirP92EiiMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070041
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102051-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C01E3A9BAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, when `rpmh_regulator_set_mode_bypass()` helper function
is called to set bypass mode, it sends PMIC4's BOB bypass mode
value for even if its a PMIC5 BOB.

To fix this, introduce new hw_data parameter`pmic_bypass_mode`
to store bypass mode value. Use it to send correct PMIC bypass
mode value that corresponds to PMIC4/5 BOB regulators from the
helper function.

Fixes: 610f29e5cc0e8d58 ("regulator: qcom-rpmh: Update PMIC modes for PMIC5")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 6e4cb2871fca8d7f371660ceb0c73a092507a5ce..85fbf10f74bb3393071bc65681356312f27b7527 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -111,6 +111,7 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
  * @hpm_min_load_uA:		Minimum load current in microamps that requires
  *				high power mode (HPM) operation.  This is used
  *				for LDO hardware type regulators only.
+ * @pmic_bypass_mode:		The PMIC bypass mode value.
  * @pmic_mode_map:		Array indexed by regulator framework mode
  *				containing PMIC hardware modes.  Must be large
  *				enough to index all framework modes supported
@@ -125,6 +126,7 @@ struct rpmh_vreg_hw_data {
 	int					n_linear_ranges;
 	int					n_voltages;
 	int					hpm_min_load_uA;
+	int					pmic_bypass_mode;
 	const int				*pmic_mode_map;
 	unsigned int			      (*of_map_mode)(unsigned int mode);
 };
@@ -311,7 +313,7 @@ static int rpmh_regulator_vrm_set_mode_bypass(struct rpmh_vreg *vreg,
 		return pmic_mode;
 
 	if (bypassed)
-		cmd.data = PMIC4_BOB_MODE_PASS;
+		cmd.data = vreg->hw_data->pmic_bypass_mode;
 	else
 		cmd.data = pmic_mode;
 
@@ -767,6 +769,7 @@ static const struct rpmh_vreg_hw_data pmic4_bob = {
 	},
 	.n_linear_ranges = 1,
 	.n_voltages = 84,
+	.pmic_bypass_mode = PMIC4_BOB_MODE_PASS,
 	.pmic_mode_map = pmic_mode_map_pmic4_bob,
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };
@@ -975,6 +978,7 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
 	},
 	.n_linear_ranges = 1,
 	.n_voltages = 32,
+	.pmic_bypass_mode = PMIC5_BOB_MODE_PASS,
 	.pmic_mode_map = pmic_mode_map_pmic5_bob,
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };

-- 
2.25.1


