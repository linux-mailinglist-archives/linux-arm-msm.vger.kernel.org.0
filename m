Return-Path: <linux-arm-msm+bounces-104554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBwJAPDe7WkzoQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 11:46:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A7E469517
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 11:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBA4A302BA70
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 09:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCDE313E3B;
	Sun, 26 Apr 2026 09:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMo6tYQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rxeydq1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86632EC0B0
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777196715; cv=none; b=j7/7pFk1GhQOO9xLxhjhuZ3g+6o2o0oq9TN6+4JRIa0GJd6KdmKKRDiDUdiz6hPkJbBRcQAat+T+OqQhgLgO+XiJADkqBSZu5ZKLjlXrZlP4P3JF7I5YWjXUMX0g3aNceSbdrzQmeMRjLreg2JiR+dltWw0HIDL2+BERowb+6Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777196715; c=relaxed/simple;
	bh=TgA67GI/rOOg6PkPVy5qWtYz3zdEwycYChjFL+t3eBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPzwzSv5hrPh+8aO0VQsX/eFv9Eokm4hUe6WRXv5iODYtgS5HWQmrpmN+7xRZkDNLIt0x2cDo4lrs26zcpg1420vHp0eEJBFB6VFDRygCDbQ8gIaZhPbaeX82ETzv4/mwtbtDnm6PCLq9Nd/NZOIdDPIy+Vg/CVxGf7LJywFtWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMo6tYQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rxeydq1d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q9AMJL4190774
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLmPbizSg/gAJWAZj30yWEqBSWQcqsiJfIa8959c2Sk=; b=fMo6tYQXYIQ/nReI
	RzyzlkLzYfN7gZOIdORHwEobn/IDWE5QXNTyr9zDbK4/g/UlErDTw5yWCyngO9a9
	VONir/vPWOtg7VjJj6UVE332fPqyr5yfSZza7Py/i2k0Ua6y5HVrG7TGvlaxv/u4
	fJPyLp7c5MAVKjTMI6VoH57Da/mOoGoMLd9+UNcQtVOAt8AtCf1jY3baQqgP3o1X
	W9R3rxEniONOfOMw6e+mYYztd/OXkeOnJ7x+dvnlwxTjqOtEaJtwjVwXZHwc/g6q
	zHvAAaQtmgu7Zd3Iw2PwSCJyoQ2CH7m5czPWNE9Whlr4B26+kgHzIKiMc2GByJkM
	7r/qwA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2tjgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 09:45:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so95920455ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777196712; x=1777801512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLmPbizSg/gAJWAZj30yWEqBSWQcqsiJfIa8959c2Sk=;
        b=Rxeydq1dkeVbuhC2DkpqzHvjnpPaQvXAUxDbeUJvy6xg36EL6xhmJD/C5phbqn1/QZ
         b2e2/0+fuFE1FB2JE5gKOYsQppb+vuyllLg6yc2vkMHbAwL+JELZvkej/BOA2ZFIikcE
         Py+tusLlKp6/AJVSXTKQ5NIdWEAnbghX3vvS6p4MESHhqd57g1X7cLd5skcUlr7nDEk3
         qjsmoAsfvCvc7yktl+hQkhaVFkCTWWdwRErrTNlWXCPMz3gevDpaECpbnuwujEtIAK9k
         0zEbBW/3G4n6jBT1LNpIE4jUGl7QEIqObVIADeo47m1AQUdcBl3qezBC54oOXkiaiUHd
         AF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777196712; x=1777801512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wLmPbizSg/gAJWAZj30yWEqBSWQcqsiJfIa8959c2Sk=;
        b=C3M5ynqShDgynLtYYraVeSLK2FjSBRdrwuiIBib8DE+0OVZ/jepxRxYUmzmpRMqrbw
         tiIEsmKwewjAsooHHyjSMzPqwtImaq4PpRNyCj8lOUiCTBYUWYTMngd/FGlU9ZznmhH3
         /knRrscIWK6MD+3mXb1q3ydrq/AG/zou5ojditY9078by7p1ctKJoWi2kXLVyiF+0ZaW
         O9kGzz8+j+EIMYNNpm9sdlR8D1Zgb/nyNVojiClxJcLUA5vDyBMcJd31CpZCzEKpRDAz
         KxDWN8LjXsfS4Yb/air0SbduWABD2u8GBnfmUhPRi9VrcVCfoUCDbclcZfYpX2JPx8i+
         3pNw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ra/j9FsNC/WXmjQLOjLQpbQNi2uBtXogadHck00ddQCVVilY5JD2SCmqI64GdRsCRpTz3Uzmm9mZWcPsj@vger.kernel.org
X-Gm-Message-State: AOJu0YyffJYsoqlQdquY1XDBA2LnGJr98qvNpCXNwu0ZKj/QurTlqKBW
	XleqZYf1YkFJ21SlbQKqOl/F3D5Xf8y0GdDgiZxLRzTcmuShEcu3dP388rlFv+KKusxQZOE/7u9
	nBQxIkbb+buE4B68K3y0IHyZfjnEi/JhhWYfX2j6WutxpAohKOl06IjHEC60JReD4gAu9
X-Gm-Gg: AeBDietdcraZgzEhlA2yX5LUEuU6kgpQAhRjIZ0oiccp5WVRQRxOW7KqlY69DpMylY0
	f/U9cwo9Cy/7wMh0XVW5Rqdvau2EZ36sFsJ0disrxGUICS6F0SLbVo2nUiDWhqLuwL0u9VBpRzD
	kju2el6u7x7mC74BZZNFeAQng/kLulcm2o8P1T7EfTzC79ZNiaLuepfa+AaWVqsUSgTFJ6fAc3s
	Ano7ejNEj6Z79c9D6yDTFSzyn/wBsocf9erOIBIospbhDM1oD3GwLz6bUTYaz+Zednx9wl0Q0U8
	+1HLx+H32AzRQPlxhZF5p3NuaJmHa/80PbXndeTNMF36aiPArlCQBtWoZc/brbQA3WioHgwF/ER
	9JqstdWLeISaCqKvFLUnkyIuJm42O09E/jTdVeQbQKk5Kto3JlQMhKQaSMFXpVTpQhOle+Y9Aug
	hdJY1qNPl9SVLWckpzvLcwAg/X
X-Received: by 2002:a17:903:46ce:b0:2b2:d09c:c07c with SMTP id d9443c01a7336-2b5f9fdbb82mr394622665ad.36.1777196712146;
        Sun, 26 Apr 2026 02:45:12 -0700 (PDT)
X-Received: by 2002:a17:903:46ce:b0:2b2:d09c:c07c with SMTP id d9443c01a7336-2b5f9fdbb82mr394622355ad.36.1777196711652;
        Sun, 26 Apr 2026 02:45:11 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab208d4sm294960905ad.55.2026.04.26.02.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:45:11 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Sun, 26 Apr 2026 17:44:40 +0800
Subject: [PATCH v8 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-extended-cti-v8-3-23b900a4902f@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777196695; l=7257;
 i=yingchao.deng@oss.qualcomm.com; s=20260426; h=from:subject:message-id;
 bh=TgA67GI/rOOg6PkPVy5qWtYz3zdEwycYChjFL+t3eBI=;
 b=e5CMm80B1+blKa2SGPTCtcX7w8sl3HpU3WvXqm0LVOeUfxtld1fsxn7ktNdkUuSFWqUfUTuZe
 RsKgzTKAlLEB8o4NhVYRRBfM0fp1lSM14Evk66+GYzX8/4E5V7y2fWr
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=aufKZC4I8k2lqi+B/z87rB5kPPybOn8C3mLosbtw+no=
X-Proofpoint-GUID: KUqMrLa2qR2CQjE7gA1zizDTcFasfCC5
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69eddea8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yjDJaKUznl4u3GwUnvUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: KUqMrLa2qR2CQjE7gA1zizDTcFasfCC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEwMyBTYWx0ZWRfXweoq/Ylq5Adq
 F5x6DX/7JNO25auwzvItbtU99fQsabYKaYI2abiLbFcChJYRp2xXd2P7i/UElwN/WC9Lp0NMk48
 Fmw3QExRbNNQ4EYaMMUw+kmLRDB7S7xYFidb9rZhCancW5uzyWcWdVA8YfRpkP6X7boiYHn07I4
 VMZQNqyWs1wwRx/ozvrP5yDqQyeNWX7cO9bo4tq5BoBQ1PR2vEG4KBCJE9dKCYuid64TkCvIdxe
 Rb/r4/SgRKn1LjiwTKOAKZgdOx5v1nXslAk/r7UOtOGYnHRc9HYj01pa3l5WR0ha0FdoMQ1yLXB
 QcU1bNtWc4yvdEStWYeKk7s6tHvEHp22rK+ChdGztAX+mgwLHINXP8ayHEL2VI6rzPdEFhAWEd1
 KmwNRj8ml8cCBdTQGx8uXXAuLkCdosw79HL69SG4KZcmyedkMu84UhSKQa0j/MHgN8KZx+QFFuf
 tCGK9vc9MZlQf31At1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260103
X-Rspamd-Queue-Id: 55A7E469517
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104554-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yingchao.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Qualcomm implements an extended variant of the ARM CoreSight CTI with a
different register layout and vendor-specific behavior. While the
programming model remains largely compatible, the register offsets differ
from the standard ARM CTI and require explicit handling.

Detect Qualcomm CTIs via the DEVARCH register and record this in the CTI
driver data. Introduce a small mapping layer to translate standard CTI
register offsets to Qualcomm-specific offsets, allowing the rest of the
driver to use a common register access path.

Additionally, handle a Qualcomm-specific quirk where the CLAIMSET
register is incorrectly initialized to a non-zero value, which can cause
tools or drivers to assume the component is already claimed. Clear the
register during probe to reflect the actual unclaimed state.

No functional change is intended for standard ARM CTI devices.

Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 28 +++++++++-
 drivers/hwtracing/coresight/coresight-cti.h      |  4 +-
 drivers/hwtracing/coresight/qcom-cti.h           | 65 ++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index c4cbeb64365b..b1c69a3e9b99 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -21,6 +21,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-cti.h"
+#include "qcom-cti.h"
 
 /*
  * CTI devices can be associated with a PE, or be connected to CoreSight
@@ -47,6 +48,10 @@ static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, int reg)
 	u32 offset = CTI_REG_CLR_NR(reg);
 	u32 nr = CTI_REG_GET_NR(reg);
 
+	/* convert to qcom specific offset */
+	if (unlikely(drvdata->is_qcom_cti))
+		offset = cti_qcom_reg_off(offset);
+
 	return drvdata->base + offset + sizeof(u32) * nr;
 }
 
@@ -170,6 +175,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
+/* DEVARCH[31:21] - ARCHITECT */
+#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
+
 static int cti_set_default_config(struct device *dev,
 				  struct cti_drvdata *drvdata)
 {
@@ -700,6 +708,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc cti_desc;
 	struct coresight_platform_data *pdata = NULL;
 	struct resource *res = &adev->res;
+	u32 devarch;
 
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -724,6 +733,22 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	raw_spin_lock_init(&drvdata->spinlock);
 
+	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
+	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
+		drvdata->is_qcom_cti = true;
+		/*
+		 * QCOM CTI does not implement Claimtag functionality as
+		 * per CoreSight specification, but its CLAIMSET register
+		 * is incorrectly initialized to 0xF. This can mislead
+		 * tools or drivers into thinking the component is claimed.
+		 *
+		 * Reset CLAIMSET to 0 to reflect that no claims are active.
+		 */
+		CS_UNLOCK(drvdata->base);
+		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
+		CS_LOCK(drvdata->base);
+	}
+
 	/* initialise CTI driver config values */
 	ret = cti_set_default_config(dev, drvdata);
 	if (ret)
@@ -780,7 +805,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	/* all done - dec pm refcount */
 	pm_runtime_put(&adev->dev);
-	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
+	dev_info(&drvdata->csdev->dev,
+		 "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index dd1ba44518c4..2598601e7b93 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -55,10 +55,11 @@ struct fwnode_handle;
 /*
  * CTI CSSoc 600 has a max of 32 trigger signals per direction.
  * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
+ * QCOM CTI supports up to 128 trigger signals per direction.
  * Max of in and out defined in the DEVID register.
  * - pick up actual number used from .dts parameters if present.
  */
-#define CTIINOUTEN_MAX		32
+#define CTIINOUTEN_MAX		128
 
 /*
  * Encode CTI register offset and register index in one u32:
@@ -188,6 +189,7 @@ struct cti_drvdata {
 	raw_spinlock_t spinlock;
 	struct cti_config config;
 	struct list_head node;
+	bool is_qcom_cti;
 };
 
 /*
diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
new file mode 100644
index 000000000000..fd1bf07d7cb4
--- /dev/null
+++ b/drivers/hwtracing/coresight/qcom-cti.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _CORESIGHT_QCOM_CTI_H
+#define _CORESIGHT_QCOM_CTI_H
+
+#include "coresight-cti.h"
+
+#define ARCHITECT_QCOM 0x477
+
+/* CTI programming registers */
+#define QCOM_CTIINTACK		0x020
+#define QCOM_CTIAPPSET		0x004
+#define QCOM_CTIAPPCLEAR	0x008
+#define QCOM_CTIAPPPULSE	0x00C
+#define QCOM_CTIINEN		0x400
+#define QCOM_CTIOUTEN		0x800
+#define QCOM_CTITRIGINSTATUS	0x040
+#define QCOM_CTITRIGOUTSTATUS	0x060
+#define QCOM_CTICHINSTATUS	0x080
+#define QCOM_CTICHOUTSTATUS	0x084
+#define QCOM_CTIGATE		0x088
+#define QCOM_ASICCTL		0x08C
+/* Integration test registers */
+#define QCOM_ITCHINACK		0xE70
+#define QCOM_ITTRIGINACK	0xE80
+#define QCOM_ITCHOUT		0xE74
+#define QCOM_ITTRIGOUT		0xEA0
+#define QCOM_ITCHOUTACK		0xE78
+#define QCOM_ITTRIGOUTACK	0xEC0
+#define QCOM_ITCHIN		0xE7C
+#define QCOM_ITTRIGIN		0xEE0
+
+static noinline u32 cti_qcom_reg_off(u32 offset)
+{
+	switch (offset) {
+	case CTIINTACK:		return QCOM_CTIINTACK;
+	case CTIAPPSET:		return QCOM_CTIAPPSET;
+	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
+	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
+	case CTIINEN:		return QCOM_CTIINEN;
+	case CTIOUTEN:		return QCOM_CTIOUTEN;
+	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
+	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
+	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
+	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
+	case CTIGATE:		return QCOM_CTIGATE;
+	case ASICCTL:		return QCOM_ASICCTL;
+	case ITCHINACK:		return QCOM_ITCHINACK;
+	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
+	case ITCHOUT:		return QCOM_ITCHOUT;
+	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
+	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
+	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
+	case ITCHIN:		return QCOM_ITCHIN;
+	case ITTRIGIN:		return QCOM_ITTRIGIN;
+
+	default:
+		return offset;
+	}
+}
+
+#endif  /* _CORESIGHT_QCOM_CTI_H */

-- 
2.43.0


