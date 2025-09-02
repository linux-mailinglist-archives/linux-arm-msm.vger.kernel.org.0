Return-Path: <linux-arm-msm+bounces-71468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B0B3F289
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFA524837BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 02:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7C0242D9F;
	Tue,  2 Sep 2025 02:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="To4AuxWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137A22DEA89
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 02:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756781825; cv=none; b=kKdwTPe047Ci43gsKJ7ymE0gGWPuS+xOXXsHcUdIQRGeVKtrxklvRJNQbXZNSsCtGXIYOVlRPFAG/+Wnx4cYZzRzbBXbb/CoVvFuNgBHG2/ZmgwRektEiYjoK0Nb5DzhWhAyD4++wOwL2OZWOS/t89mXRWlMsJticpQQkCiTOoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756781825; c=relaxed/simple;
	bh=EDvKeej6XHr0+Nwm6rbZTv+cRVLJ8urCyPI3bAiS6eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ciDrBoPE57oNtpQ+W48cymc1ZlgmcEn2L/Ir+7nX7q/gZEpIh0vum0kUq1V4DgIu+Jt9jlxqrQCwsLtBiKpQu2/VOUdHUHuaQDte+4EpHdiIroUeRfEGMXK1LXoNeDNxzSC9thYcGReGXHqRy941kKRM+rXv8mInEAs7DCp8uuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=To4AuxWm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822WgH5030916
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 02:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rUWR+Mb6MVNwf1t9+Yks/v
	DZLulHbK5dKhhNACqmcNY=; b=To4AuxWmwoGpm0465pvL2NG6HdK7q4sEAlNbNR
	WM393B8JvK0Q/OYT8VkHwtqSN2qUrCWkwKcu7Qv4NF9wRj/CifUT2m7yFfHVmpED
	oZfzmJB7smhWE1M7TnOi5uP9RUBe2NOkGC4djWjEJyxC5k0sJxj6WP1ucFKoot1R
	IK79krlVuOpUE8IaLO8dnNldYq8ogGEtupOIOt8j3d6QDKeqw8Kj8JUbRW0GHPfA
	HZtBxIum0baIGFcHYKAuVhWnBqQpCoQxwRHUZMyzThus+aNlpodqbLCoxdmO5yNr
	oo7LHPCvczqkdlEJIZrLKGgNEv9IPY+Cb6xv0a1qYVfTUQ4g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvw81m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:57:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e8ae86ab3so4581446b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 19:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756781820; x=1757386620;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUWR+Mb6MVNwf1t9+Yks/vDZLulHbK5dKhhNACqmcNY=;
        b=m/5bWdjfkbcFpxAZGBV7srpQKpoSr7ZxIyrhKjVLdQZnkBTEXi41FoLkjpYK0I8woo
         cbPBOwCIZibhDkqXeczXbAUliavCMsWwe/j0EmU5N3mFL1L5rMFZIjGbyUVGWb8xw3K/
         qk+DLPZY/EYYYOVFVwDv6152/UNIpWzARWjDz0bgDcJOOgrfOaNvRZOYRiajlNJ1h379
         zrKNiPcVixB7o5ghUiN6/ag0PdYBtzSslSqxV+Adr3h1otZ8Pf1tZyqQTS2iP52TEswq
         Q8oDQDq7R9B2JauBxnuyG7PC1T1w7FvuojcIugnDmtMmcMdAO3bE0dw8ghpjpnHJLnZ1
         IL1w==
X-Forwarded-Encrypted: i=1; AJvYcCW/Bu72xLgF2cCxuJa3V5F3G0pLMvMO/vdyY7X/g73OSgwHMjzfNJ0kB2yJeEkj6/O4kaZ8NW8Ai0MlJdKo@vger.kernel.org
X-Gm-Message-State: AOJu0YzIvEiCtmSlwLMfvbU3thM3NQzVFtMbvI63Ix9Ahr+UfMoIMK2n
	FquRYCmznBSubRQ5J/8JRZWJ2qeqbKofuFXgAv4RcH2LYW1PCpIaxLxmRaTjmzWVcKzLrtMLqMH
	Q4GLAq2wxjGhRNJTY7uWYHFgE1LjhNAB+ndIQuEC3QAMyB2rAwv3tqnMeHeomFl0QojY87Xlnvk
	I8
X-Gm-Gg: ASbGncvnbaGFi1wz3LVNME22FV5lUOkbrX95hz+B+gxBOxBT/S6WISpDZbE7vhzsbKp
	uVF8xrlOLWxAZ6ASPUkj1rS5x+e6QNa580Hna9zLNJ45Fids2F9b60JN8UvrrCVxVGrkir3ZI7+
	aiw62GDw5ZDyRvUlWnKRD4szCg1DOB07wUrqYqVkaX7bxSNWJtlV/pOuOUxARNtEYb4bPUGt+TA
	ejOLqLAbRyKEFGnXPG3iSSv/jpbYk1RnSNsbfgHmV4r8FO1vGagUb+JcFK/bMnKTWFm5BIsm3/C
	jR66TXIAJsfyuzUacsKGtM35Ogrvr0nibVa/wjohf88rQrw+MhRH5+0DgMrl54PgfOgklkxRCZs
	yvRxVaQFCjBDaWniB4Jw6lneCb3+pcnE2Jxyd
X-Received: by 2002:a05:6a00:4b48:b0:772:282d:5a68 with SMTP id d2e1a72fcca58-7723e392a0fmr12361742b3a.29.1756781819455;
        Mon, 01 Sep 2025 19:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+SAYB3q/q/nLD6cdV9cclj2sd2qnYMPs9AauC+7PMvBLFS5qxuwLJjN8NFmKvd17wkZpYrg==
X-Received: by 2002:a05:6a00:4b48:b0:772:282d:5a68 with SMTP id d2e1a72fcca58-7723e392a0fmr12361691b3a.29.1756781818654;
        Mon, 01 Sep 2025 19:56:58 -0700 (PDT)
Received: from jinlmao-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26a601sm11837538b3a.3.2025.09.01.19.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:56:58 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 10:56:53 +0800
Subject: [PATCH v4] coresight: cti: Add Qualcomm extended CTI support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPRctmgC/33MUQvCIBDA8a8yfM7hmZL21PeICKdXE9osXbIY+
 +659RREHBz8D+43kYTRYyL7aiIRs08+9CXEpiK2Nf0VqXelCWdcMsUVxXHA3qE728FTJwSg1Ro
 axUh5uUe8+HHljqfSrU9DiK9Vz7BcP5Bm8A1loEB3ilsJumm21hxCSvXjaW42dF1dFlm8LP4Zo
 hiSlzFWSmXhhzHP8xuz+qYT8wAAAA==
X-Change-ID: 20250828-extended_cti-d441ec991b80
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: quic_yingdeng@quicinc.com, linux-kernel@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, jinlong.mao@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756781815; l=31589;
 i=yingchao.deng@oss.qualcomm.com; s=20250901; h=from:subject:message-id;
 bh=EDvKeej6XHr0+Nwm6rbZTv+cRVLJ8urCyPI3bAiS6eo=;
 b=WQOSgy4xUnGfzlGxGIZIlAUv4W/CslmdwC9kGNbISLigWzPNarKUYr+GDsSLXQco09EvP2k5u
 mvk0SIu0j/dDmRJfujYEW8ghl/7zbHWYT3RQLapI3Q7GnO5UVkY4DWr
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=xilq+l2r3MI2IvgF26j2OwmdNb/TQNeJMQ3VdJi8C4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX7ODM/aNnF8BG
 ijGUB/sob4g3tybBma91XyvXEgyGMJ5GNYm1RqRW8hXEU/RDLloDJm90qefMC/OJQBQCcP7X2y8
 dKsHZSA/u/Bn8XoaAfcQayIegISv03jJQO77bDpPeExN7s1hrYRo0Hw4tklKLpThrp3yA9rV0e9
 zQNcXJNpG6AEL1r6f7SMHjDBrS6l7ei166qgyxRfSCtxhqkEa8UyIxtcSwyJGLik35+SDZNxoqE
 69Y/fA7PyYeWPiOXmVccoQUFrS8j7vuGP28ywCMiGUhZpTpWSy+AHRkWmLzox1GEit9VOg2c6/i
 gn3jbN5/aFnwiCsZZ3hcvMH4ArNEZXc/t/VdeP4RJoch+suF2N/6H0Uy7PVjRLC7nq2BVYCr4Os
 I1ThfWy6
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b65cfe cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=icuLT194DPpRQ0JxjXEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1cIm5ybwF3zyDFnbXHF_VhA6KQ3KQueO
X-Proofpoint-ORIG-GUID: 1cIm5ybwF3zyDFnbXHF_VhA6KQ3KQueO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024

The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
It allows a debugger to send to trigger events to a processor or to send
a trigger event to one or more processors when a trigger event occurs
on another processor on the same SoC, or even between SoCs. Qualcomm CTI
implementation differs from the standard CTI in the following aspects:

1. The number of supported triggers is extended to 128.
2. Several register offsets differ from the CoreSight specification.
3. CLAIMSET and CLAIMCLR registers are unused.

Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
It allows a debugger to send to trigger events to a processor or to send
a trigger event to one or more processors when a trigger event occurs on
another processor on the same SoC, or even between SoCs.

QCOM extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Changes in v4:
1. Read the DEVARCH registers to identify Qualcomm CTI.
2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
coresight_cti_reg_store() functions accordingly.
3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/

Changes in v3:
1. Rename is_extended_cti() to of_is_extended_cti().
2. Add the missing 'i' when write the CTI trigger registers.
3. Convert the multi-line output in sysfs to single line.
4. Initialize offset arrays using designated initializer.
Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/

Changes in V2:
1. Add enum for compatible items.
2. Move offset arrays to coresight-cti-core
---
 drivers/hwtracing/coresight/coresight-cti-core.c   | 123 +++++++++++---
 .../hwtracing/coresight/coresight-cti-platform.c   |  16 +-
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 184 +++++++++++++++------
 drivers/hwtracing/coresight/coresight-cti.h        |  22 ++-
 drivers/hwtracing/coresight/qcom-cti.h             |  60 +++++++
 5 files changed, 320 insertions(+), 85 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 8fb30dd73fd20ae613a45b1a467f457a046a9412..2431bc1d5ef39767d415b0df5a04da888a3104e5 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -22,6 +22,54 @@
 #include "coresight-priv.h"
 #include "coresight-cti.h"
 
+static const u32 cti_normal_offset[] = {
+	[INDEX_CTIINTACK]		= CTIINTACK,
+	[INDEX_CTIAPPSET]		= CTIAPPSET,
+	[INDEX_CTIAPPCLEAR]		= CTIAPPCLEAR,
+	[INDEX_CTIAPPPULSE]		= CTIAPPPULSE,
+	[INDEX_CTIINEN]			= CTIINEN(0),
+	[INDEX_CTIOUTEN]		= CTIOUTEN(0),
+	[INDEX_CTITRIGINSTATUS]		= CTITRIGINSTATUS,
+	[INDEX_CTITRIGOUTSTATUS]	= CTITRIGOUTSTATUS,
+	[INDEX_CTICHINSTATUS]		= CTICHINSTATUS,
+	[INDEX_CTICHOUTSTATUS]		= CTICHOUTSTATUS,
+	[INDEX_CTIGATE]			= CTIGATE,
+	[INDEX_ASICCTL]			= ASICCTL,
+	[INDEX_ITCHINACK]		= ITCHINACK,
+	[INDEX_ITTRIGINACK]		= ITTRIGINACK,
+	[INDEX_ITCHOUT]			= ITCHOUT,
+	[INDEX_ITTRIGOUT]		= ITTRIGOUT,
+	[INDEX_ITCHOUTACK]		= ITCHOUTACK,
+	[INDEX_ITTRIGOUTACK]		= ITTRIGOUTACK,
+	[INDEX_ITCHIN]			= ITCHIN,
+	[INDEX_ITTRIGIN]		= ITTRIGIN,
+	[INDEX_ITCTRL]			= CORESIGHT_ITCTRL,
+};
+
+static const u32 cti_extended_offset[] = {
+	[INDEX_CTIINTACK]		= QCOM_CTIINTACK,
+	[INDEX_CTIAPPSET]		= QCOM_CTIAPPSET,
+	[INDEX_CTIAPPCLEAR]		= QCOM_CTIAPPCLEAR,
+	[INDEX_CTIAPPPULSE]		= QCOM_CTIAPPPULSE,
+	[INDEX_CTIINEN]			= QCOM_CTIINEN,
+	[INDEX_CTIOUTEN]		= QCOM_CTIOUTEN,
+	[INDEX_CTITRIGINSTATUS]		= QCOM_CTITRIGINSTATUS,
+	[INDEX_CTITRIGOUTSTATUS]	= QCOM_CTITRIGOUTSTATUS,
+	[INDEX_CTICHINSTATUS]		= QCOM_CTICHINSTATUS,
+	[INDEX_CTICHOUTSTATUS]		= QCOM_CTICHOUTSTATUS,
+	[INDEX_CTIGATE]			= QCOM_CTIGATE,
+	[INDEX_ASICCTL]			= QCOM_ASICCTL,
+	[INDEX_ITCHINACK]		= QCOM_ITCHINACK,
+	[INDEX_ITTRIGINACK]		= QCOM_ITTRIGINACK,
+	[INDEX_ITCHOUT]			= QCOM_ITCHOUT,
+	[INDEX_ITTRIGOUT]		= QCOM_ITTRIGOUT,
+	[INDEX_ITCHOUTACK]		= QCOM_ITCHOUTACK,
+	[INDEX_ITTRIGOUTACK]		= QCOM_ITTRIGOUTACK,
+	[INDEX_ITCHIN]			= QCOM_ITCHIN,
+	[INDEX_ITTRIGIN]		= QCOM_ITTRIGIN,
+	[INDEX_ITCTRL]			= CORESIGHT_ITCTRL,
+};
+
 /*
  * CTI devices can be associated with a PE, or be connected to CoreSight
  * hardware. We have a list of all CTIs irrespective of CPU bound or
@@ -70,15 +118,16 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 
 	/* write the CTI trigger registers */
 	for (i = 0; i < config->nr_trig_max; i++) {
-		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
+		writel_relaxed(config->ctiinen[i],
+			       drvdata->base + cti_offset(drvdata, INDEX_CTIINEN, i));
 		writel_relaxed(config->ctiouten[i],
-			       drvdata->base + CTIOUTEN(i));
+			       drvdata->base + cti_offset(drvdata, INDEX_CTIOUTEN, i));
 	}
 
 	/* other regs */
-	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
-	writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
-	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
+	writel_relaxed(config->ctigate, drvdata->base + cti_offset(drvdata, INDEX_CTIGATE, 0));
+	writel_relaxed(config->asicctl, drvdata->base + cti_offset(drvdata, INDEX_ASICCTL, 0));
+	writel_relaxed(config->ctiappset, drvdata->base + cti_offset(drvdata, INDEX_CTIAPPSET, 0));
 
 	/* re-enable CTI */
 	writel_relaxed(1, drvdata->base + CTICONTROL);
@@ -99,10 +148,16 @@ static int cti_enable_hw(struct cti_drvdata *drvdata)
 	if (config->hw_enabled || !config->hw_powered)
 		goto cti_state_unchanged;
 
-	/* claim the device */
-	rc = coresight_claim_device(drvdata->csdev);
-	if (rc)
-		goto cti_err_not_enabled;
+	/* For QCOM CTI, CLAIMCLR and CLAIMSET registers do not follow the
+	 * CoreSight CLAIM tag protocol, there is no relationship between
+	 * the CLR and SET pair, it's  unused for debug resource arbitration.
+	 */
+	if (drvdata->subtype == ARM_STD_CTI) {
+		/* claim the device */
+		rc = coresight_claim_device(drvdata->csdev);
+		if (rc)
+			goto cti_err_not_enabled;
+	}
 
 	cti_write_all_hw_regs(drvdata);
 
@@ -175,7 +230,8 @@ static int cti_disable_hw(struct cti_drvdata *drvdata)
 	writel_relaxed(0, drvdata->base + CTICONTROL);
 	config->hw_enabled = false;
 
-	coresight_disclaim_device_unlocked(csdev);
+	if (drvdata->subtype == ARM_STD_CTI)
+		coresight_disclaim_device_unlocked(csdev);
 	CS_LOCK(drvdata->base);
 	raw_spin_unlock(&drvdata->spinlock);
 	return ret;
@@ -214,6 +270,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
+/* DEVARCH[31:21] - ARCHITECT */
+#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
+
 static void cti_set_default_config(struct device *dev,
 				   struct cti_drvdata *drvdata)
 {
@@ -270,8 +329,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
 	cti_dev->nr_trig_con++;
 
 	/* add connection usage bit info to overall info */
-	drvdata->config.trig_in_use |= tc->con_in->used_mask;
-	drvdata->config.trig_out_use |= tc->con_out->used_mask;
+	bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
+		  tc->con_in->used_mask, drvdata->config.nr_trig_max);
+	bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
+		  tc->con_out->used_mask, drvdata->config.nr_trig_max);
 
 	return 0;
 }
@@ -314,7 +375,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 {
 	int ret = 0;
 	int n_trigs = drvdata->config.nr_trig_max;
-	u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
 	struct cti_trig_con *tc = NULL;
 
 	/*
@@ -325,8 +385,9 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 	if (!tc)
 		return -ENOMEM;
 
-	tc->con_in->used_mask = n_trig_mask;
-	tc->con_out->used_mask = n_trig_mask;
+	bitmap_fill(tc->con_in->used_mask, n_trigs);
+	bitmap_fill(tc->con_out->used_mask, n_trigs);
+
 	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
 	return ret;
 }
@@ -339,7 +400,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
-	u32 trig_bitmask;
 	u32 chan_bitmask;
 	u32 reg_value;
 	int reg_offset;
@@ -349,25 +409,23 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 	   (trigger_idx >= config->nr_trig_max))
 		return -EINVAL;
 
-	trig_bitmask = BIT(trigger_idx);
-
 	/* ensure registered triggers and not out filtered */
 	if (direction == CTI_TRIG_IN)	{
-		if (!(trig_bitmask & config->trig_in_use))
+		if (!(test_bit(trigger_idx, config->trig_in_use)))
 			return -EINVAL;
 	} else {
-		if (!(trig_bitmask & config->trig_out_use))
+		if (!(test_bit(trigger_idx, config->trig_out_use)))
 			return -EINVAL;
 
 		if ((config->trig_filter_enable) &&
-		    (config->trig_out_filter & trig_bitmask))
+		    test_bit(trigger_idx, config->trig_out_filter))
 			return -EINVAL;
 	}
 
 	/* update the local register values */
 	chan_bitmask = BIT(channel_idx);
-	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
-		      CTIOUTEN(trigger_idx));
+	reg_offset = (direction == CTI_TRIG_IN ? cti_offset(drvdata, INDEX_CTIINEN, trigger_idx) :
+			cti_offset(drvdata, INDEX_CTIOUTEN, trigger_idx));
 
 	raw_spin_lock(&drvdata->spinlock);
 
@@ -451,19 +509,19 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 	case CTI_CHAN_SET:
 		config->ctiappset |= chan_bitmask;
 		reg_value  = config->ctiappset;
-		reg_offset = CTIAPPSET;
+		reg_offset = cti_offset(drvdata, INDEX_CTIAPPSET, 0);
 		break;
 
 	case CTI_CHAN_CLR:
 		config->ctiappset &= ~chan_bitmask;
 		reg_value = chan_bitmask;
-		reg_offset = CTIAPPCLEAR;
+		reg_offset = cti_offset(drvdata, INDEX_CTIAPPCLEAR, 0);
 		break;
 
 	case CTI_CHAN_PULSE:
 		config->ctiappset &= ~chan_bitmask;
 		reg_value = chan_bitmask;
-		reg_offset = CTIAPPPULSE;
+		reg_offset = cti_offset(drvdata, INDEX_CTIAPPPULSE, 0);
 		break;
 
 	default:
@@ -866,6 +924,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc cti_desc;
 	struct coresight_platform_data *pdata = NULL;
 	struct resource *res = &adev->res;
+	u32 devarch;
 
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -950,9 +1009,19 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	drvdata->csdev_release = drvdata->csdev->dev.release;
 	drvdata->csdev->dev.release = cti_device_release;
 
+	/* qcom_cti*/
+	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
+	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
+		drvdata->subtype = QCOM_CTI;
+		drvdata->offsets = cti_extended_offset;
+	} else {
+		drvdata->subtype = ARM_STD_CTI;
+		drvdata->offsets = cti_normal_offset;
+	}
+
 	/* all done - dec pm refcount */
 	pm_runtime_put(&adev->dev);
-	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
+	dev_info(&drvdata->csdev->dev, "CTI initialized %d\n", drvdata->subtype);
 	return 0;
 
 pm_release:
diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index d0ae10bf6128116900acb0e65d44952996753e79..4bef860a0484d9e72c788e5e9e73ff973dac3365 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
 		goto create_v8_etm_out;
 
 	/* build connection data */
-	tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
-	tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
 
 	/*
 	 * The EXTOUT type signals from the ETM are connected to a set of input
@@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* Set the v8 PE CTI connection data */
-	tc->con_in->used_mask = 0x3; /* sigs <0 1> */
+	bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
 	tc->con_in->sig_types[0] = PE_DBGTRIGGER;
 	tc->con_in->sig_types[1] = PE_PMUIRQ;
-	tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
+	bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
 	tc->con_out->sig_types[0] = PE_EDBGREQ;
 	tc->con_out->sig_types[1] = PE_DBGRESTART;
 	tc->con_out->sig_types[2] = PE_CTIIRQ;
@@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* filter pe_edbgreq - PE trigout sig <0> */
-	drvdata->config.trig_out_filter |= 0x1;
+	set_bit(0, drvdata->config.trig_out_filter);
 
 of_create_v8_out:
 	return ret;
@@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
 	if (!err) {
 		/* set the signal usage mask */
 		for (idx = 0; idx < tgrp->nr_sigs; idx++)
-			tgrp->used_mask |= BIT(values[idx]);
+			set_bit(values[idx], tgrp->used_mask);
 	}
 
 	kfree(values);
@@ -331,7 +331,9 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
 
 	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
 	if (!err)
-		drvdata->config.trig_out_filter |= tg->used_mask;
+		bitmap_or(drvdata->config.trig_out_filter,
+			  drvdata->config.trig_out_filter,
+			  tg->used_mask, drvdata->config.nr_trig_max);
 
 	kfree(tg);
 	return err;
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 572b80ee96fbf18ec8cf9abc30d109a676dfbc5d..d490e43810ad644be6cc076faae042771f8086d6 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -172,9 +172,8 @@ static struct attribute *coresight_cti_attrs[] = {
 
 /* register based attributes */
 
-/* Read registers with power check only (no enable check). */
-static ssize_t coresight_cti_reg_show(struct device *dev,
-			   struct device_attribute *attr, char *buf)
+static ssize_t coresight_cti_mgmt_reg_show(struct device *dev,
+					   struct device_attribute *attr, char *buf)
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
@@ -189,6 +188,39 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 	return sysfs_emit(buf, "0x%x\n", val);
 }
 
+/* Read registers with power check only (no enable check). */
+static ssize_t coresight_cti_reg_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
+	u32 val = 0, idx = drvdata->config.regs_idx;
+
+	pm_runtime_get_sync(dev->parent);
+	raw_spin_lock(&drvdata->spinlock);
+	if (drvdata->config.hw_powered) {
+		switch (cti_attr->off) {
+		case INDEX_CTITRIGINSTATUS:
+		case INDEX_CTITRIGOUTSTATUS:
+		case INDEX_ITTRIGINACK:
+		case INDEX_ITTRIGOUT:
+		case INDEX_ITTRIGOUTACK:
+		case INDEX_ITTRIGIN:
+			val = readl_relaxed(drvdata->base +
+					    cti_offset(drvdata, cti_attr->off, idx));
+			break;
+
+		default:
+			val = readl_relaxed(drvdata->base + cti_offset(drvdata, cti_attr->off, 0));
+			break;
+		}
+	}
+
+	raw_spin_unlock(&drvdata->spinlock);
+	pm_runtime_put_sync(dev->parent);
+	return sysfs_emit(buf, "0x%x\n", val);
+}
+
 /* Write registers with power check only (no enable check). */
 static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 						      struct device_attribute *attr,
@@ -197,19 +229,38 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
 	unsigned long val = 0;
+	u32 idx = drvdata->config.regs_idx;
 
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
 	pm_runtime_get_sync(dev->parent);
 	raw_spin_lock(&drvdata->spinlock);
-	if (drvdata->config.hw_powered)
-		cti_write_single_reg(drvdata, cti_attr->off, val);
+	if (drvdata->config.hw_powered) {
+		switch (cti_attr->off) {
+		case INDEX_ITTRIGINACK:
+		case INDEX_ITTRIGOUT:
+			cti_write_single_reg(drvdata, cti_offset(drvdata, cti_attr->off, idx), val);
+			break;
+
+		default:
+			cti_write_single_reg(drvdata, cti_offset(drvdata, cti_attr->off, 0), val);
+			break;
+		}
+	}
 	raw_spin_unlock(&drvdata->spinlock);
 	pm_runtime_put_sync(dev->parent);
 	return size;
 }
 
+#define coresight_cti_mgmt_reg(name, offset)	                        \
+	(&((struct cs_off_attribute[]) {                                \
+	   {                                                            \
+		__ATTR(name, 0444, coresight_cti_mgmt_reg_show, NULL),	\
+		offset							\
+	   }                                                            \
+	})[0].attr.attr)
+
 #define coresight_cti_reg(name, offset)					\
 	(&((struct cs_off_attribute[]) {				\
 	   {								\
@@ -237,17 +288,17 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 
 /* coresight management registers */
 static struct attribute *coresight_cti_mgmt_attrs[] = {
-	coresight_cti_reg(devaff0, CTIDEVAFF0),
-	coresight_cti_reg(devaff1, CTIDEVAFF1),
-	coresight_cti_reg(authstatus, CORESIGHT_AUTHSTATUS),
-	coresight_cti_reg(devarch, CORESIGHT_DEVARCH),
-	coresight_cti_reg(devid, CORESIGHT_DEVID),
-	coresight_cti_reg(devtype, CORESIGHT_DEVTYPE),
-	coresight_cti_reg(pidr0, CORESIGHT_PERIPHIDR0),
-	coresight_cti_reg(pidr1, CORESIGHT_PERIPHIDR1),
-	coresight_cti_reg(pidr2, CORESIGHT_PERIPHIDR2),
-	coresight_cti_reg(pidr3, CORESIGHT_PERIPHIDR3),
-	coresight_cti_reg(pidr4, CORESIGHT_PERIPHIDR4),
+	coresight_cti_mgmt_reg(devaff0, CTIDEVAFF0),
+	coresight_cti_mgmt_reg(devaff1, CTIDEVAFF1),
+	coresight_cti_mgmt_reg(authstatus, CORESIGHT_AUTHSTATUS),
+	coresight_cti_mgmt_reg(devarch, CORESIGHT_DEVARCH),
+	coresight_cti_mgmt_reg(devid, CORESIGHT_DEVID),
+	coresight_cti_mgmt_reg(devtype, CORESIGHT_DEVTYPE),
+	coresight_cti_mgmt_reg(pidr0, CORESIGHT_PERIPHIDR0),
+	coresight_cti_mgmt_reg(pidr1, CORESIGHT_PERIPHIDR1),
+	coresight_cti_mgmt_reg(pidr2, CORESIGHT_PERIPHIDR2),
+	coresight_cti_mgmt_reg(pidr3, CORESIGHT_PERIPHIDR3),
+	coresight_cti_mgmt_reg(pidr4, CORESIGHT_PERIPHIDR4),
 	NULL,
 };
 
@@ -258,13 +309,15 @@ static struct attribute *coresight_cti_mgmt_attrs[] = {
  * If inaccessible & pcached_val not NULL then show cached value.
  */
 static ssize_t cti_reg32_show(struct device *dev, char *buf,
-			      u32 *pcached_val, int reg_offset)
+			      u32 *pcached_val, int index)
 {
 	u32 val = 0;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
+	int reg_offset;
 
 	raw_spin_lock(&drvdata->spinlock);
+	reg_offset = cti_offset(drvdata, index, 0);
 	if ((reg_offset >= 0) && cti_active(config)) {
 		CS_UNLOCK(drvdata->base);
 		val = readl_relaxed(drvdata->base + reg_offset);
@@ -284,11 +337,12 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
  * if reg_offset >= 0 then write through if enabled.
  */
 static ssize_t cti_reg32_store(struct device *dev, const char *buf,
-			       size_t size, u32 *pcached_val, int reg_offset)
+			       size_t size, u32 *pcached_val, int index)
 {
 	unsigned long val;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
+	int reg_offset;
 
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
@@ -298,6 +352,7 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 	if (pcached_val)
 		*pcached_val = (u32)val;
 
+	reg_offset = cti_offset(drvdata, index, 0);
 	/* write through if offset and enabled */
 	if ((reg_offset >= 0) && cti_active(config))
 		cti_write_single_reg(drvdata, reg_offset, val);
@@ -306,14 +361,14 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
 }
 
 /* Standard macro for simple rw cti config registers */
-#define cti_config_reg32_rw(name, cfgname, offset)			\
+#define cti_config_reg32_rw(name, cfgname, index)			\
 static ssize_t name##_show(struct device *dev,				\
 			   struct device_attribute *attr,		\
 			   char *buf)					\
 {									\
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
 	return cti_reg32_show(dev, buf,					\
-			      &drvdata->config.cfgname, offset);	\
+			      &drvdata->config.cfgname, index);		\
 }									\
 									\
 static ssize_t name##_store(struct device *dev,				\
@@ -322,7 +377,7 @@ static ssize_t name##_store(struct device *dev,				\
 {									\
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);	\
 	return cti_reg32_store(dev, buf, size,				\
-			       &drvdata->config.cfgname, offset);	\
+			       &drvdata->config.cfgname, index);	\
 }									\
 static DEVICE_ATTR_RW(name)
 
@@ -356,6 +411,46 @@ static ssize_t inout_sel_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(inout_sel);
 
+/*
+ * QCOM CTI supports up to 128 triggers, there are 6 registers need to be
+ * expanded to up to 4 instances, and regs_idx can be used to indicate which
+ * one is in use.
+ * CTITRIGINSTATUS, CTITRIGOUTSTATUS,
+ * ITTRIGIN, ITTRIGOUT,
+ * ITTRIGINACK, ITTRIGOUTACK.
+ */
+static ssize_t regs_idx_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	u32 val;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	raw_spin_lock(&drvdata->spinlock);
+	val = drvdata->config.regs_idx;
+	raw_spin_unlock(&drvdata->spinlock);
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t regs_idx_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	unsigned long val;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+	if (val > ((drvdata->config.nr_trig_max + 31) / 32 - 1))
+		return -EINVAL;
+
+	raw_spin_lock(&drvdata->spinlock);
+	drvdata->config.regs_idx = val;
+	raw_spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(regs_idx);
+
 static ssize_t inen_show(struct device *dev,
 			 struct device_attribute *attr,
 			 char *buf)
@@ -389,7 +484,7 @@ static ssize_t inen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_active(config))
-		cti_write_single_reg(drvdata, CTIINEN(index), val);
+		cti_write_single_reg(drvdata, cti_offset(drvdata, INDEX_CTIINEN, index), val);
 	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -428,7 +523,7 @@ static ssize_t outen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_active(config))
-		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+		cti_write_single_reg(drvdata, cti_offset(drvdata, INDEX_CTIOUTEN, index), val);
 	raw_spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -448,9 +543,9 @@ static ssize_t intack_store(struct device *dev,
 }
 static DEVICE_ATTR_WO(intack);
 
-cti_config_reg32_rw(gate, ctigate, CTIGATE);
-cti_config_reg32_rw(asicctl, asicctl, ASICCTL);
-cti_config_reg32_rw(appset, ctiappset, CTIAPPSET);
+cti_config_reg32_rw(gate, ctigate, INDEX_CTIGATE);
+cti_config_reg32_rw(asicctl, asicctl, INDEX_ASICCTL);
+cti_config_reg32_rw(appset, ctiappset, INDEX_CTIAPPSET);
 
 static ssize_t appclear_store(struct device *dev,
 			      struct device_attribute *attr,
@@ -504,6 +599,7 @@ static DEVICE_ATTR_WO(apppulse);
  */
 static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_inout_sel.attr,
+	&dev_attr_regs_idx.attr,
 	&dev_attr_inen.attr,
 	&dev_attr_outen.attr,
 	&dev_attr_gate.attr,
@@ -512,20 +608,20 @@ static struct attribute *coresight_cti_regs_attrs[] = {
 	&dev_attr_appset.attr,
 	&dev_attr_appclear.attr,
 	&dev_attr_apppulse.attr,
-	coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
-	coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
-	coresight_cti_reg(chinstatus, CTICHINSTATUS),
-	coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
+	coresight_cti_reg(triginstatus, INDEX_CTITRIGINSTATUS),
+	coresight_cti_reg(trigoutstatus, INDEX_CTITRIGOUTSTATUS),
+	coresight_cti_reg(chinstatus, INDEX_CTICHINSTATUS),
+	coresight_cti_reg(choutstatus, INDEX_CTICHOUTSTATUS),
 #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
-	coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
-	coresight_cti_reg(ittrigin, ITTRIGIN),
-	coresight_cti_reg(itchin, ITCHIN),
-	coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
-	coresight_cti_reg_rw(itchout, ITCHOUT),
-	coresight_cti_reg(itchoutack, ITCHOUTACK),
-	coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
-	coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
-	coresight_cti_reg_wo(itchinack, ITCHINACK),
+	coresight_cti_reg_rw(itctrl, INDEX_ITCTRL),
+	coresight_cti_reg(ittrigin, INDEX_ITTRIGIN),
+	coresight_cti_reg(itchin, INDEX_ITCHIN),
+	coresight_cti_reg_rw(ittrigout, INDEX_ITTRIGOUT),
+	coresight_cti_reg_rw(itchout, INDEX_ITCHOUT),
+	coresight_cti_reg(itchoutack, INDEX_ITCHOUTACK),
+	coresight_cti_reg(ittrigoutack, INDEX_ITTRIGOUTACK),
+	coresight_cti_reg_wo(ittriginack, INDEX_ITTRIGINACK),
+	coresight_cti_reg_wo(itchinack, INDEX_ITCHINACK),
 #endif
 	NULL,
 };
@@ -711,10 +807,8 @@ static ssize_t trigout_filtered_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
 	int size = 0, nr_trig_max = cfg->nr_trig_max;
-	unsigned long mask = cfg->trig_out_filter;
 
-	if (mask)
-		size = bitmap_print_to_pagebuf(true, buf, &mask, nr_trig_max);
+	size = bitmap_print_to_pagebuf(true, buf, cfg->trig_out_filter, nr_trig_max);
 	return size;
 }
 static DEVICE_ATTR_RO(trigout_filtered);
@@ -926,9 +1020,8 @@ static ssize_t trigin_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_in->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return bitmap_print_to_pagebuf(true, buf, con->con_in->used_mask, cfg->nr_trig_max);
 }
 
 static ssize_t trigout_sig_show(struct device *dev,
@@ -940,9 +1033,8 @@ static ssize_t trigout_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_out->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return bitmap_print_to_pagebuf(true, buf, con->con_out->used_mask, cfg->nr_trig_max);
 }
 
 /* convert a sig type id to a name */
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 8362a47c939c60399d7f2f3f599f72de4983a6e1..4f85986b42f0c559c7aa2033fb859cb2f6b12186 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -15,6 +15,7 @@
 #include <linux/types.h>
 
 #include "coresight-priv.h"
+#include "qcom-cti.h"
 
 struct fwnode_handle;
 
@@ -57,7 +58,7 @@ struct fwnode_handle;
  * Max of in and out defined in the DEVID register.
  * - pick up actual number used from .dts parameters if present.
  */
-#define CTIINOUTEN_MAX		32
+#define CTIINOUTEN_MAX		128
 
 /**
  * Group of related trigger signals
@@ -68,7 +69,7 @@ struct fwnode_handle;
  */
 struct cti_trig_grp {
 	int nr_sigs;
-	u32 used_mask;
+	DECLARE_BITMAP(used_mask, CTIINOUTEN_MAX);
 	int sig_types[];
 };
 
@@ -147,9 +148,10 @@ struct cti_config {
 	bool hw_powered;
 
 	/* registered triggers and filtering */
-	u32 trig_in_use;
-	u32 trig_out_use;
-	u32 trig_out_filter;
+	DECLARE_BITMAP(trig_in_use, CTIINOUTEN_MAX);
+	DECLARE_BITMAP(trig_out_use, CTIINOUTEN_MAX);
+	DECLARE_BITMAP(trig_out_filter, CTIINOUTEN_MAX);
+
 	bool trig_filter_enable;
 	u8 xtrig_rchan_sel;
 
@@ -160,6 +162,9 @@ struct cti_config {
 	u32 ctiouten[CTIINOUTEN_MAX];
 	u32 ctigate;
 	u32 asicctl;
+
+	/*for qcom_cti, see regs_idx_show*/
+	u32 regs_idx;
 };
 
 /**
@@ -180,6 +185,8 @@ struct cti_drvdata {
 	struct cti_config config;
 	struct list_head node;
 	void (*csdev_release)(struct device *dev);
+	enum cti_subtype subtype;
+	const u32 *offsets;
 };
 
 /*
@@ -233,6 +240,11 @@ struct coresight_platform_data *
 coresight_cti_get_platform_data(struct device *dev);
 const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 
+static inline u32 cti_offset(struct cti_drvdata *drvdata, int index, int num)
+{
+	return drvdata->offsets[index] + 4 * num;
+}
+
 /* cti powered and enabled */
 static inline bool cti_active(struct cti_config *cfg)
 {
diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
new file mode 100644
index 0000000000000000000000000000000000000000..aaf55f3e5c29023acffe96505d9de0278261d1ab
--- /dev/null
+++ b/drivers/hwtracing/coresight/qcom-cti.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#define ARCHITECT_QCOM 0x477
+
+/* CTI programming registers */
+#define	QCOM_CTIINTACK		0x020
+#define	QCOM_CTIAPPSET		0x004
+#define	QCOM_CTIAPPCLEAR	0x008
+#define	QCOM_CTIAPPPULSE	0x00C
+#define	QCOM_CTIINEN		0x400
+#define	QCOM_CTIOUTEN		0x800
+#define	QCOM_CTITRIGINSTATUS	0x040
+#define	QCOM_CTITRIGOUTSTATUS	0x060
+#define	QCOM_CTICHINSTATUS	0x080
+#define	QCOM_CTICHOUTSTATUS	0x084
+#define	QCOM_CTIGATE		0x088
+#define	QCOM_ASICCTL		0x08c
+/* Integration test registers */
+#define	QCOM_ITCHINACK		0xE70
+#define	QCOM_ITTRIGINACK	0xE80
+#define	QCOM_ITCHOUT		0xE74
+#define	QCOM_ITTRIGOUT		0xEA0
+#define	QCOM_ITCHOUTACK		0xE78
+#define	QCOM_ITTRIGOUTACK	0xEC0
+#define	QCOM_ITCHIN		0xE7C
+#define	QCOM_ITTRIGIN		0xEE0
+
+/* Qcom CTI supports up to 128 triggers*/
+enum cti_subtype {
+	ARM_STD_CTI,
+	QCOM_CTI,
+};
+
+/* These registers are remapped*/
+enum cti_offset_index {
+	INDEX_CTIINTACK,
+	INDEX_CTIAPPSET,
+	INDEX_CTIAPPCLEAR,
+	INDEX_CTIAPPPULSE,
+	INDEX_CTIINEN,
+	INDEX_CTIOUTEN,
+	INDEX_CTITRIGINSTATUS,
+	INDEX_CTITRIGOUTSTATUS,
+	INDEX_CTICHINSTATUS,
+	INDEX_CTICHOUTSTATUS,
+	INDEX_CTIGATE,
+	INDEX_ASICCTL,
+	INDEX_ITCHINACK,
+	INDEX_ITTRIGINACK,
+	INDEX_ITCHOUT,
+	INDEX_ITTRIGOUT,
+	INDEX_ITCHOUTACK,
+	INDEX_ITTRIGOUTACK,
+	INDEX_ITCHIN,
+	INDEX_ITTRIGIN,
+	INDEX_ITCTRL,
+};

---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20250828-extended_cti-d441ec991b80

Best regards,
-- 
Yingchao Deng <yingchao.deng@oss.qualcomm.com>


