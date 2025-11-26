Return-Path: <linux-arm-msm+bounces-83461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A56C8A1EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 15:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BFA394E85AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 14:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3CF137C52;
	Wed, 26 Nov 2025 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzmKYhJm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7pS5UED"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B412811CA0
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165650; cv=none; b=nF1h9B5CQoRAPA88L7B6NqBMbJXuJs0wTJc0f4pz7GHs5iHKKrIj/fLvfArKu4CsEDNnelXu+cczulBL+DwWdGkCn8EU9m4w4w4A5dxNJuTmASDMOBSmOAxhmG5+aAXrdfOTykeGVGj6+Ry0uPX1va/S0/R0VzRQ6gWXRG8nKBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165650; c=relaxed/simple;
	bh=i03NQhkzED8rnlODWFptm7jI/Nkx9wqi6CFPG+MFIOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eFLsZfvkyHd6shWPXBPzATyzx/kNe/3NrWieZ4FZA01K7cEXXCROD/zqmeqJ+8eWpFJSds8uIcO3TBT+9NURw0/0A2pR0XHaKQEH27GdX+JO2UZh0onoBSsxp1Vr5jbv2r2hhQSpuRdHeSni4Hc4cLSDOrPnsRs1+eusGR/S7uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzmKYhJm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7pS5UED; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQAvbZD3706613
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oTopSPykg6oIxBCXsA30xuirvtAeElgurHW
	HeLRb3fw=; b=NzmKYhJmhpH3cxdC7v9zJyfllJHXpGZVKxsmO/YyMmNFh6XDviE
	FEmRhTzNFG2J8XXIvC3pHyHMp33spHQIUTqHg9SbviNjv/IPQtsi3EDovDTCC34B
	ewys2fvJg3k4ERgg+GX/Oa0FQoV3IxMzFRlUZ+ZDj5kG1JMKF2Pa1Cphu8fVBlMl
	lVyhKO57Nmod47oQAxxGRcZb/Y6Zu0EDiE/Gw4Pd+mWJAV8sTlFyV62LdkNWT9dN
	6SfWi6jn9IpBqUrnluQf/QwAZTtI5+BDsvcMSLOeneJkKFNKqecQtbiUJH6x2Eyx
	DfTtbwpJu6goH+gCLtYVGZ38q6VUBC2QQig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufukur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:00:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e235d4d2so2434717385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 06:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764165647; x=1764770447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oTopSPykg6oIxBCXsA30xuirvtAeElgurHWHeLRb3fw=;
        b=Y7pS5UEDZzHQL6sttBWtR2CHt3CklJkRr9MMNevcVq3Bvm80cdKzPdxEz8YQjMK2OF
         kGBHrIBpdrjWgE5F7YJoCQxn29w60eCE0qBgZTKVPQZDPfzOMxLgYIYOsGn10o7Vd8LW
         EsjlHU8odYvtaHY/uKGEq+qEDnCu9h1e2eZNIAEc7BsDuy3DP0bmn3yVbAtp79YnDEJX
         73BoiCKB228szVX+YnXMRMH1vOg3qIXNm5lmfaxyPnTcP45VBxqzUn3QmjrUrVJJlumV
         u2uyAnWmWMbSgXKYA5N9Ei4QQwyq+6H7F0oBSO1SzADCGwqRFd2SoZP4WZVtvEhU75rh
         AUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764165647; x=1764770447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTopSPykg6oIxBCXsA30xuirvtAeElgurHWHeLRb3fw=;
        b=v/DU3iPD5wz78lyAnqkOaY877attTMY5phax1Y/8MSfqxfP7FzHAJF5hcNTM+FX0dR
         QZos39wB+KPKp26+yNBSh8PsM2nfWdnEqXd1KfKMcC3tLhF2WXkBmj1N8Pv4F24zaziW
         mkLSDWsuNehd3sW8ag9/QtQCeCet/gbOkIJlSIOSKHFDbcGViiBRNs1o5SV6B5jAMuEa
         cZKSxMS8D0JOh8wQ8MZUtq8/xnLjhZLzMXlrUSJmJysi4rHfXg9x9tZsCWsGOUb5aBIT
         sqNPmT//3jcXd5mqTRHVfLKO/28lvgqxh7MlBc/SL4L2twOtC7KSBBf7JN3omecMrpuh
         blDA==
X-Forwarded-Encrypted: i=1; AJvYcCXqCUyEFv+oGKkz0Af5Wqx1oREKdHNH2v/1HKMFJTnwkxI6Y6vT14eTDtW0WbDHjwV/hn9j+X9s8LEMDFWK@vger.kernel.org
X-Gm-Message-State: AOJu0YxYJjbrOYghSoZbGOTnRxQvd92As53cNIIzxJQ86KtO6pR3Ssbp
	eq2DgjMCfEt8odoUiLMmoMVJFdLZHatfLHTzMEWNYgrBDVjHjVjWF041JVYjpkfVYwPlOFl6Ht3
	9MftGHnPkpqamxVOrwnFq6SfnWdALQ9xtp3UzqtEmhx4qmx60OgiOmHuJbb4EAjobzbn4
X-Gm-Gg: ASbGnctK2gqmsgmt7tdpA5ne/nmmOD1xr2p3CW8FTR28dumbo69z7c9vtFArTKlmPuc
	AGrR28cBPCmB5L5EONHx7IEG6WzAIroJ+303jHKCeXtR3tKYopRA7lnFe4c5GiKQ9HFDf+EKA4j
	QbFw8chMz3MBlhr4IFOS1CWrGV2uia8JgHoLTIx3+bPNmC+GjZP9IkWwM1ijtiW6QYU/i198npK
	YoSkyh+HsLQ0CcKjxrVMXC+kAZe6IgAseuiBB2iFQR/spCOr7gw9/S0xvoYqz0lF1VwTINbI/dv
	xeXqw6SjlQQQIsRR9NChxRX0sYs8LvfQfjQkkhNISJFw6Vgfp4J9wZ4+EY0tCkAFHBuQz5f4Ngt
	V1zQvYcF/trOtNIlLs0JebfKaaezcTGrACyuDhhzDLjuZdtHA/OYW1Snbmk/a4Kg=
X-Received: by 2002:a05:620a:1a28:b0:8b2:74e5:b3e with SMTP id af79cd13be357-8b33d24b0f1mr2564376185a.36.1764165646461;
        Wed, 26 Nov 2025 06:00:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWVAuC0rdSn2Gg8VbbpBlSqY1UpuO4qCabqSt2pZmOhKD7ZB/El6iGIscbifH4DczyeKa7JA==
X-Received: by 2002:a05:620a:1a28:b0:8b2:74e5:b3e with SMTP id af79cd13be357-8b33d24b0f1mr2564356285a.36.1764165645205;
        Wed, 26 Nov 2025 06:00:45 -0800 (PST)
Received: from trex.. (125.red-79-144-189.dynamicip.rima-tde.net. [79.144.189.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa41d2sm40702051f8f.22.2025.11.26.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:00:44 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: venus: assign unique bus_info strings for encoder and decoder
Date: Wed, 26 Nov 2025 15:00:24 +0100
Message-ID: <20251126140041.754071-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6927080f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=QCpOfKHlYVe8AePir1+hrw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=owfriIHii3yi9sGd5oQA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDExNSBTYWx0ZWRfXwW/2yNfjxKFe
 wcju17jQnL4jRbN1j3tAFPeCnvTPN+3f62k72eOY2fMQNodvHkTIrjbLtDK/Q6pGdsbrXOVGc1D
 pFl7N5MSRDL+46/3fNASP6n2pAqisFt6JEp0bWBedFdTUlBgCXEC4ZnWamCJhJ3XY4Or43D0Adh
 cQhu9oAqpvvpPN7Vck/vAvR4Dw34sBUkD+7omLNg4D1MQ07ftvNdnH7BlW7fv5XgzfqPd1pbjA0
 JGyCpP5O3w4639wthjIwbOPjm38kF39lQ7DZwkyF+0Nyxh0B25wj59cpkecrKyT5SdxO9Ba8yqB
 Qbu5xp/AtswfPN416ziXGhIsPK87qMlRoMUnd4chz+nkvj6lZpfHao1BVFgG5RVIldU5jkR5yxh
 1c0NqVQPkqh3pq4j3eFr6v9qAOYrSA==
X-Proofpoint-ORIG-GUID: zQBXPJzJbQevPPBLbILC3RJQv66MhajZ
X-Proofpoint-GUID: zQBXPJzJbQevPPBLbILC3RJQv66MhajZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260115

The Venus encoder and decoder video devices currently report the same
bus_info string ("platform:qcom-venus").

Assign unique bus_info identifiers by appending ":dec" and ":enc" to the
parent device name. With this change v4l2-ctl will display two separate
logical devices

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 6 +++++-
 drivers/media/platform/qcom/venus/venc.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf..16587767e597 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -433,9 +433,13 @@ vdec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 static int
 vdec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
+	struct venus_inst *inst = to_inst(file);
+	struct venus_core *core = inst->core;
+
 	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
 	strscpy(cap->card, "Qualcomm Venus video decoder", sizeof(cap->card));
-	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "plat:%s:dec", dev_name(core->dev));
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index b478b982a80d..0b5843ba536f 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -144,9 +144,13 @@ static int venc_v4l2_to_hfi(int id, int value)
 static int
 venc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
+	struct venus_inst *inst = to_inst(file);
+	struct venus_core *core = inst->core;
+
 	strscpy(cap->driver, "qcom-venus", sizeof(cap->driver));
 	strscpy(cap->card, "Qualcomm Venus video encoder", sizeof(cap->card));
-	strscpy(cap->bus_info, "platform:qcom-venus", sizeof(cap->bus_info));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "plat:%s:enc", dev_name(core->dev));
 
 	return 0;
 }
-- 
2.43.0


