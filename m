Return-Path: <linux-arm-msm+bounces-93591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD5JCXX6m2l5+gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:57:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE7172746
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDCA8303F470
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35A934A796;
	Mon, 23 Feb 2026 06:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLpeCV0G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8gvubo+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0DB34B186
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829798; cv=none; b=NykCRHAxWVMR4tGcWUuBvfF8QTdgsRh62LzaElilatxVwp6sYV5Wr8icA1t6sYsVhZa/tVNg8O/HpNWMHjHaVWlzViUsAZ+WYh77iiBzLCAKxXY98mCPSSokB4HBhwtW0dRKLCxGO7JEmszUMH4hxbCJ+CeX+QIJZG1orFgmuso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829798; c=relaxed/simple;
	bh=XbEF7lfm+dBjOkALDpKb/LLjuMBdmQi6ikgLxJ96uLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YPEhsfyc1ic5BLfUChD8MhJRA3wd8uR30DiR9otKeWcaKiBRpAQLhQ8YqpRfJdJbi/FKxyNAPHUYPRUw5SJ0es+5oJFOURwe3uRK8HRkQ8AK7sUNifvbUvI5KB29Q13ug5Ubp9yOO2SZCZ3JAv0tcPG/+8V9/8btOJrS5+TR9es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLpeCV0G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8gvubo+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MDuVJe891811
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=; b=MLpeCV0GwkkbqCzg
	/9uMJU9UKAWnfRDFLHKSrYMO/+s3o3Bf53wfhRYBT/wgrCp43LkAxb1Opk4vofyF
	kBMYVvq+nOaNxQvmuVbB4H8T2nTrAVNPUv66wEgivBxu+GtQ/xYjBewLKQ81VT32
	zjsUCMpE8DFG6m7EPwlCvfVXfG/MDuMFzCgplaOtQD+nNPmubelvKBLFWRgAq/X5
	ba/LrM38ZMN2R7kd/xmeUgUre2UfVF7enGOugwgBhqx5ScCV4q8mQ6GxjeTkEg9m
	sLPCdzdMnvpU23JF8julwpuUwdB7/I06IF5H9brm5hDVm0iYHlW772OFdnY6jL7m
	uvSEaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbbpuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a77040ede0so48482585ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829795; x=1772434595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=;
        b=L8gvubo+S2gtttwbBpbZ6x27ZAtKevlg46Fn7SZw4JT8Je51OQZKA74tLFwRtsXIRc
         kPv08DMVab9ULKQSCSiB8FgP+KGDT+U5LrlVd9id6QLTTSdGndvDT4Hj0jzLFEcw4bjP
         tIKmdZJ/4p3doh7ogJK38Ak/q9GprdPiDD9dHXb3TsIyA2GDj0NpSUb2gBqJncjfnOsj
         2tP5aAQq4RBba81NLXDU0rDZwzeH9Fxj54RHQ23+DosZsIgjew4D8e3qsc0SFoMeHEaB
         3M6n9fxiL6Rvj7TKnOautrTcx9c/hiyL6C0Kzhjbjv1hk47e73D6eyEvTxEBnwn4WNgu
         Ah0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829795; x=1772434595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sEr82x2IlsxHod8Ic8W+n2/1JQBsTzrJLVgT1R1I5aY=;
        b=Uqy9rsLBW3O3Mo+ND2RW7pHgsxvQlNFrDdPQNBrOPUEKoBu7Dm1tkB3YBbf5/DJRjJ
         E/T30WWcu4SUmJVywRPCItllcsa37dWNC+MUjCn/UUWWH9e2RwoFLDs8IvNjTzfZXRIq
         ofHjVY7hMZfx0AxBSssXgp/jEV/KfZyddNbRo3/BxczUqlU3WFI2L++6tLFpvJ1mnMNN
         iyej8YjZ4L/0JyS6mHR05qMSFNJxuakizAHKScbAKNs2d07UHIo+3advif3u4MGp/FeN
         d2ynqoSec2aWeX/Sm+15US5eMWjhroyt3Nv2ke9QgDSkDpX8IV89ODxth0HDoZeINyIx
         9azg==
X-Forwarded-Encrypted: i=1; AJvYcCUjE3/KZ+po0m8j1RrjnzBLeELILTXm7gRLtC4zLoE+KdXCiQ5+B20v5XFsYTBmlr123GieqGv9YDPwJAFi@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn9GXwhnI1vhBjIB1O4Qo3qymmw0Q30dd6Ca17rcP/FuqZ50sg
	O6ADQ1/qwlQSRTffQUm/yWVtHld94uSFsiBdkjGYiMXLGAlJP8bwYHk79hXof7rbonpf3O1AD/y
	SPcPWQHwhmcveR0WzSvkMjI63LP3n9ZtITbD8SMWjj93AsQnUZlht4JOqSRDb5CF2BTZM
X-Gm-Gg: ATEYQzw/hbF97W9/G8MQ9w3cwVzHe2NlQ6hO0+u05Zt9a1EjYRvdjh4wMGim+LApcL8
	KEONmFmsjf+zAfgyDpLGOEVBW3iVNka3BoF6r+rehdcB1Ui1Pj+ztL5EUBYdv3PzgnQr9ZH99tX
	x/07MEAxXZVM/DTK/Ch1cHPpKw5gsDulDGB2h3T2yQ4+dLsU6S7ZdR1K2Eizzq0Bsi8IAZ/EWat
	wCoGaXn50snEi3b9b5spq2owWUu9lgz/CX3ZXQX1ImNZsvyai5C/q2LiNmpbmNRlzxY8U6fvfSv
	8Y3V0xtSDf+sEVhr5AonF0+hl0UzwtF1JgZ0H0JJdQ+WJYI7CD8Hdnc1FDYbPN5VGX9hic6aW7+
	ylerPh9dl4/RLfNQpxKZ0q8AAII1ZrYPPOtmZffbmJO3+CYk8lh6RHL3vc+GX4yVO8bNf3Bt2g+
	/XGndMi3EvQ61I
X-Received: by 2002:a17:902:ea04:b0:2aa:d5e5:b12d with SMTP id d9443c01a7336-2ad744eec7bmr54010825ad.27.1771829794975;
        Sun, 22 Feb 2026 22:56:34 -0800 (PST)
X-Received: by 2002:a17:902:ea04:b0:2aa:d5e5:b12d with SMTP id d9443c01a7336-2ad744eec7bmr54010735ad.27.1771829794512;
        Sun, 22 Feb 2026 22:56:34 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:33 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:44 +0800
Subject: [PATCH v13 4/8] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-4-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829766; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=XbEF7lfm+dBjOkALDpKb/LLjuMBdmQi6ikgLxJ96uLY=;
 b=QJIHdDQoxMLI/29FPVLu0wdWv1rJIOmKOHjVUElhbthI9G7PX5B7KPuwGLB5111xzHa2ft75Y
 TyCCmRN9yxDAGDLW+yMFfP00U/IFyqq2+LFPAEf2aYHWye/yebQipbE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 1mD7ftYalzasswB-hF3-gNedt-11ipIB
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699bfa23 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 1mD7ftYalzasswB-hF3-gNedt-11ipIB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfX/JF3vWmYZqT2
 fGd6ILvaaN0Xm1A2S+HkkXKKYYskgew3U6Z5qrxecilg6H559BcMGeWydl5Ej6c5wG0kdJ3FKks
 iLvfJQygT28Oja6SIV9V1xTIS9tOr/TNWoS+0Nk2R+bdmX1ZTsJSSQ1k+9fZSQD630FVc21dw1y
 graGRcjyIMrK+rGpZnIjuHYsrZVbXe5YNsCklXgfpP1B5Q0ed0PNWo3FlDR+JX9TdkFKuO7FF8S
 yb+uZDaiYKGb+C4I6v1ald+XlUGkcZgZh2qljMHfPWpf0cZ9SqQ5AZWGd96u96FOteBwsl6lC2a
 r9Y71EMyT0exxhuvEvZ0VW6hElm0elDGYfNJYy8ThFtF6fQwm58kkhbX7sOBANx6H+BnfywNkv1
 Gg5kEq5lxSHK1b6VqnpY+UylUVj6Mn36ClqaQuv1/Y9Y8zBFNvRA+jYFVAeqdAwuhibXnOYFNXe
 a1nXT6GeE6BI1aJisiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230059
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93591-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CDCE7172746
X-Rspamd-Action: no action

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 081498162011..32353980964a 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -867,6 +867,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Retruns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 92ffaf771fea..27dd72065c60 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -472,6 +472,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


