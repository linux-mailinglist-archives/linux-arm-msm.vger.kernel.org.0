Return-Path: <linux-arm-msm+bounces-109047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGRGG2f5DmoSDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:24:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D9C5A4B90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64C28309C171
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A75D3CF049;
	Thu, 21 May 2026 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qk5GNeKe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVKPszAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456F83CF05B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365815; cv=none; b=K9Venj9cWTMmr4oRvZQUx/LTt/lA3RX8PSVW60i674/+vPWX1WA6xRoBK9X/8eogpqdgx5FiRQWY6BeqpMhQJC/7KqJLmzMFkqG/KFIgcaDCdcEevUVa44VPIMaQpIbheo9mFrfgFZoe4utv7ntD1ix98bATrUpVVrFWobq8ya8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365815; c=relaxed/simple;
	bh=9c3KkSTH9SNVjrN4djhgLnzm9UPZeM+m23N8Q7Og1Fk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ibve0oMxBhSh6myCN1mS2xmoK+qGcEln9JiQ9THRMt+BQE89t9c1AUoVKQypgWqU3UfXMXbPpg5loEXyDsY/Vh62/xHbfQ7vg4hNMsa1UERICDr+Wc5UAKNIbqMRXhOKzFWQG7m5C31CfXBNL/wIgMyORzbN5XeIiZp4pFIkhZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qk5GNeKe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVKPszAq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99jeK3343452
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fO0o6u0IamVYb8Tlwzhjz6AcRXov7BncWTgpYMq2UVM=; b=Qk5GNeKe/zZDl9uV
	0OvGSg/Mwt/+chXrAS0BezVkgen+lg25PC76puhIm6Vkdt4G4+WF+ddbv+Q7FDLS
	dt5KChe7+xfNRl4QDT6AwNRU9rXzRE7cnuwpFCsN2pTnK81wCK5e9ouVPPIbJnrE
	F0GYCuaY0/ctyztQIJGq6bL0cWEVk3C6D9x1xzXePU4VLjkCd/IGvAyJrcmrWge9
	5GNMYemBhvHgq7stNlbwgrHSZUVYsIeP3SHatZvao7JolrxGe9vEZRnGQFckDKnc
	AOA/RO+lPnDTbNouN4e5wl+nqheK6pwvWngX9dHaGHgBEAwr3sCBNfghBmvOFhUa
	cWoBnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahs7v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:16:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baf7378ad0so63437395ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365812; x=1779970612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO0o6u0IamVYb8Tlwzhjz6AcRXov7BncWTgpYMq2UVM=;
        b=ZVKPszAqJoPpLAXTgSILDcZmjS7wadoQiiQ+ltw+Cf+Inp4pE0LUNFfCXEZWV+Gq9A
         BzKmWdCvFaILKVxfeBhd7lO4arvG7oFGyjYUG2IasigyMv4nMFyOCVY7rL1750OErqix
         i7OkVvXZa3tD/HpWwyCPtw9UDvp2bIqtJXGujTGt7vEwZFk3kyRSLwDww0HbFCdPnA1A
         KUclb23Z5eP+17GA5ewHW7nb8olUeWjmZYpEQ9J1gL8GCa1N5cdfPlbHI7JvOGFUV681
         yx2vr2Xj5eelbwk5GM0YnesUO/4tmpt1Qaex/DBoZqPHQFqdQH3FYqdBypVXWj8i1PV4
         0Cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365812; x=1779970612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fO0o6u0IamVYb8Tlwzhjz6AcRXov7BncWTgpYMq2UVM=;
        b=jWep1ju0cT4YW9VSJyj2Hw0SrP259lxBftvazkXBuCeZj8Rfmucxcg5883bk6NWOur
         Flg2yugrOsjdeU2GqS26wmuEbw2STFQk7MaogDru1t6CGhfOeCsqU5mIt7DFDl94wJJl
         xiT1XuD0WMz6etCpdWzeRhS4IfHyB9MtcjtrSySsxXSHI6n5d2IW5phR8U/CTnOPXtur
         J69ltpf6cB4lDu91hasnhJJyn5943H6zHhAmk/l4xKAanqCeGkqvxUgPk0ovzT6r8K9x
         Nkre+T+PESYEITwHIRIyg3uvT+E+kHHHXBTAaLGaax3395+VRemaBDm9Q2g3mM8JLi3A
         zTiA==
X-Forwarded-Encrypted: i=1; AFNElJ+PGXquuQNc7bZtyStfs9oVlPr2brEqOBrV176aqRZ7Mpo3puCOs/yqijDD8nryiUAklmH7Zpn2NFNdVD0G@vger.kernel.org
X-Gm-Message-State: AOJu0YxROKbARaAcBUhEefCC9NNsQijcxOMg1Ybc650+Pi8ap9YQtvEs
	ZoTCrnzHMSwYtRMCLaa7k74/7p8P8wr5mm0B/jfRSd1jIh4pr3ezNiqE2alw5ac1RupOxgjA+t+
	hrRctQ4q7dPWldrjJQlJUR6H5JnmeIh7eP2JM4WEdgU5qxmm0QFij7XM68ZyLlKc/PyVw
X-Gm-Gg: Acq92OHdOAZ6O5TFfPB+y7s6DCmPKsxoVeXEgT9YsM/0I+FYZKJb5Fhj7meFI1ZqAaf
	d2C60QexbckhFpEXVMn0YJbcG6KeFr4gVF7whY7P2kmfT1DLYC0QQxDzRZaEjt0KUM9VfDk7Nk4
	8xWDw/PiXx/YBKjaMMdIIeVzyIRWrjg5nhUGFE86R1tNbIbOKsJxvUSLg9Vu3qXroq8LRk0xxRN
	Kw7dLX7KHNw10iUYk4NAoxSRT42R+iMM6kFYhM/zJOuv+ANbrtuvta0a9EFKaSDhGwAadg/e/K/
	fBJzU+6KeUHCtTPugd3pWWJjQK1ZS376gWb+KpSr42E+rlMkNES2yzh7e0SEUZfPfyBcPXHLZhu
	VMbhohKO74lEjeO2ytdAdHWV9MrL3sB6mTso8sb7YYIfcYABXAUrp1h5tDVn8nZA/0dAd+BGm2s
	wRHE/y0NHcBun5qVolh64OwhlG
X-Received: by 2002:a17:902:7406:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bea30a646emr22320995ad.31.1779365812059;
        Thu, 21 May 2026 05:16:52 -0700 (PDT)
X-Received: by 2002:a17:902:7406:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bea30a646emr22320705ad.31.1779365811534;
        Thu, 21 May 2026 05:16:51 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea917318esm10435555ad.5.2026.05.21.05.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:16:51 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Thu, 21 May 2026 20:16:29 +0800
Subject: [PATCH v9 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-extended_cti-v9-3-d21f4f92c51e@oss.qualcomm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
In-Reply-To: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779365796; l=7584;
 i=yingchao.deng@oss.qualcomm.com; s=20260521; h=from:subject:message-id;
 bh=9c3KkSTH9SNVjrN4djhgLnzm9UPZeM+m23N8Q7Og1Fk=;
 b=/W594KJ7Xc/7Ks61Cx8t6vxrj4Nq9aero4Jl+y3o9rkDDSgmPvVccZDPgqKD1KKcJXlJmz17p
 KeXqG+OCY/JAUw4y0F80ueg2V2inSchEFctQAGJp6mj1Ky0cVHcmiJs
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=YbHeeX0Qzqo7voZLva784lFhVChB9yF3a4sceW95ljA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMyBTYWx0ZWRfXxwcqRP8WYmi5
 VC7yqKVTYWGjxdsbzbDTtWweBWNoV2NJeA+tyAkMhWVYcsgtl8oGiArY6eWIujVkQZkUTWDBATB
 oCv+CJR9RiHFAhSyOB+Ebyg+cGmKuS6KzNxp3NQZ0KczR0jqfbMVZHRQ0ev9GEh3RIq0WTh+q5y
 r7o9sAhKJ1tkHQ9Atcu++UDWS/7soeCJGVSjUAsX6EOhnZhsiEkBxRupIRYnaYvipwkvUYnqFgS
 3s3rcwdCBdHPtCeQdFpkE6ch1eFr8kUQXTDhz24NrxzLTzJ8r1xkoPF+C06XCfC6rJ86Lo2TQUR
 pwKJqrq2iMsBrpkGoHYw4LrXkdKSkSGa8ZCfEvBzzeWNnriuS44pNNZnx+ONB7epDFSt+k8gRu2
 03goJ1jfggY/g+p9eBDAsaT9kDMvll7Y52b/5QSb1r//XLuCfsOVSfRX+pcfsL/57hQTemo49vw
 M64L/ENpXY7kJZKHrrg==
X-Proofpoint-ORIG-GUID: sOscZwJBrwkj6JM0JqkzVFu9RpFmXuPb
X-Proofpoint-GUID: sOscZwJBrwkj6JM0JqkzVFu9RpFmXuPb
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ef7b5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yjDJaKUznl4u3GwUnvUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210123
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
	TAGGED_FROM(0.00)[bounces-109047-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: C2D9C5A4B90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/hwtracing/coresight/coresight-cti-core.c | 27 +++++++++-
 drivers/hwtracing/coresight/coresight-cti.h      |  7 ++-
 drivers/hwtracing/coresight/qcom-cti.h           | 65 ++++++++++++++++++++++++
 3 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index c5cc2706e241..2dac5eb4ecca 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -21,6 +21,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-cti.h"
+#include "qcom-cti.h"
 
 /*
  * CTI devices can be associated with a PE, or be connected to CoreSight
@@ -45,6 +46,9 @@ static DEFINE_MUTEX(ect_mutex);
 static void __iomem *__reg_addr(struct cti_drvdata *drvdata, u32 off,
 				u32 index)
 {
+	if (unlikely(rvdata->is_qcom_cti))
+		off = cti_qcom_reg_off(off);
+
 	return drvdata->base + off + sizeof(u32) * index;
 }
 
@@ -172,6 +176,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
+/* DEVARCH[31:21] - ARCHITECT */
+#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
+
 static int cti_set_default_config(struct device *dev,
 				  struct cti_drvdata *drvdata)
 {
@@ -702,6 +709,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc cti_desc;
 	struct coresight_platform_data *pdata = NULL;
 	struct resource *res = &adev->res;
+	u32 devarch;
 
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -726,6 +734,22 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
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
@@ -782,7 +806,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	/* all done - dec pm refcount */
 	pm_runtime_put(&adev->dev);
-	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
+	dev_info(&drvdata->csdev->dev,
+		 "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 98b8de8a3687..08ea6daf5b3c 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -54,10 +54,11 @@ struct fwnode_handle;
 /*
  * CTI CSSoc 600 has a max of 32 trigger signals per direction.
  * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
+ * QCOM CTI supports up to 128 trigger signals per direction.
  * Max of in and out defined in the DEVID register.
  * - pick up actual number used from .dts parameters if present.
  */
-#define CTIINOUTEN_MAX		32
+#define CTIINOUTEN_MAX		128
 
 /**
  * Group of related trigger signals
@@ -168,6 +169,9 @@ struct cti_config {
  * @spinlock:	Control data access to one at a time.
  * @config:	Configuration data for this CTI device.
  * @node:	List entry of this device in the list of CTI devices.
+ * @is_qcom_cti: True if this CTI is a Qualcomm vendor-specific
+ *		 variant that requires register offset translation
+ *		 via cti_qcom_reg_off().
  */
 struct cti_drvdata {
 	void __iomem *base;
@@ -176,6 +180,7 @@ struct cti_drvdata {
 	raw_spinlock_t spinlock;
 	struct cti_config config;
 	struct list_head node;
+	bool is_qcom_cti;
 };
 
 /*
diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
new file mode 100644
index 000000000000..d3846613a0de
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
+static inline u32 cti_qcom_reg_off(u32 offset)
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


