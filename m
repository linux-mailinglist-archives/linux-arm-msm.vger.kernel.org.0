Return-Path: <linux-arm-msm+bounces-106428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPNqMk+e/Gn3RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:14:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F74E9EB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79CCA302B423
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5177B3FFAA8;
	Thu,  7 May 2026 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVsvkeRv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PhQqOUIa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F4140B6C0
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163176; cv=none; b=r4rUmqlhqd0yaqfT7PXtE6pqrtUdZ6rXQx0cvNOC3spb7dAO3cTncaCQefssDVcsvd6by9nzAjFgGpxPolXuf5ee6bWzoGpbYXiecTSE4TEYcASRdmRf+kBG7mT2tMA1IhSMwx2NaN9+K+/zO8R1Nm11qkvv8LOU/fbc4v6Khhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163176; c=relaxed/simple;
	bh=hEbivcKkn+B0aZjxHwDfTngcntTeQ3spTkM8LFWyox0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoLt+oVt3gxL00rbQdJ9K5/gycCd7YV6zLM6mTcR6k3iGLbOY2lITzmGt7BljcK8R5wiZyqDeSY0n/YZgoKywi1fzhT9AVhG1c/GmqusjLYfedfkbknb4QXZ5zuA6IncLoj1fNYCiSvAPPxyiclgZw4tLkxU+DhNJJCvM2/OJ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVsvkeRv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PhQqOUIa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647C5YnJ1971735
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fTgIUNB2u1bhGm6PTFb6105x0D07MjTNsRT9rz7zUh4=; b=SVsvkeRvrUimCAYj
	7dDE4bAs8uzjnXzkIl15CfSbzlHVmJAI3zVIBimjCAPyqWPjRfNr1ONsIf0Wt74+
	jyl4gMTKzInG8TWJavMJoArIkCHOOJMkLRs25B32R6Ymjc+sxF5SZcAfnbSoqaAW
	La5S+Aw8EP2NPvlEd34EP1/w5IPr3Qi5PrN/ao+SYPN13Kc46kRvipTS2hKyQfCp
	ft3wWmiwOJXL5hvSI81ebuqVf9+OI/qGvBdw9hM0gm69v4V5Gy5bC/A5h5QiONwc
	NI9vSreTb0h8K09Y+or2+fK2TCy5NCywo4GTGHLEsopD5n+Cf8drbcMFlSp2BUvc
	bFxsjQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tej8fpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:12:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c802862e9f5so921946a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163173; x=1778767973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTgIUNB2u1bhGm6PTFb6105x0D07MjTNsRT9rz7zUh4=;
        b=PhQqOUIajQApOByzpst7ZYwKE8hToPd1Dj9lw3eQP0gDu/2TIG8gObLoGezxEzF7H8
         /BFsL77CDWxkjJnNgS2AvF59mm3xKJxyC5fUPakvV3hmvVi73KIiy35OHZfAJ4IgDeRS
         jwBejD0reURjfsTqKWwQT6UuKXEBVD2SRiItbu2v6TAoE9AHpLCC2CldHKKpLIdmZTnV
         qx/v8caLwqfwETzkbcaQHYtY5AAk0PQib/0eWtl6/TvTIbBxiu6gZAyAcFqhgfwmcl3Q
         ic8zfUJXBx3Mly9GyAyjzJpQu4NxyuLF4D7myMeIi4gF9xiQqyeVlpxcZcx3VWDqGQ0D
         aXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163173; x=1778767973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fTgIUNB2u1bhGm6PTFb6105x0D07MjTNsRT9rz7zUh4=;
        b=G/68a+epWFZTopCG4M4EbY9UR5r//A4gSKpEdacfqBW48CvEYLPD0utLRhHLcTN7h2
         hg/T/QpcScyFfzUoSTrO0j5tM+cjASkbRVKD2vkOn0vD1W8NFq3Gqk1oyOqpGYBtQAQ8
         to0Un3XGv1ImqJ0tCzeIFoWBf49aWXDHJJx/TLr3oqcEgvTm51F9HkJ+XXaDfuURB+rd
         r4TgQ6IY9x3XoHMjOKVCzQF3SXnVWFrtezBzilpctsoDHhqcY+/GWVZV2ewNy6HFMWb3
         yWCcLTsDl7FhotPrMogaHwyBWSgVz0cZ6ilB4quGm0d0vM8ZbeseJCLdt1R2DiPDGMY8
         yAug==
X-Forwarded-Encrypted: i=1; AFNElJ/sppVmw1bHbwf7LfKgwFYQbXSinZm71To5DlEiTKXqSeEMUwPUKVF+XXtpRNjFGAEat6e8/Qub2Ocj3yNN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+FM3hK8kB4qnDxwGAGUaA/zbd3YOzXxwyybw/dubI+Zz0eQWB
	nfA4q6ZIhf5FRuM3oedHFr/ACYZhgeZyywYWVnYHXtV0F7EHQH07zxY73PYcObUFO1m/aeJTpwn
	CcTUjd5b6OFfwCSE3+UxIKpd6XwvxKDIPcsmxgCg/2ty2l3bTIVwnC2eZtZbTDYPOCTHP
X-Gm-Gg: AeBDiesqhCHBAFAUVSdPu6/QmdccvWW/U82mkhU8Zu9RC1S666+7Th2Dx/tew6pGg7O
	NEi+Kb7r3sZZzqzSPfOxlXLmfkbQ0QSl99N63SIf0PMkNex5nlc0YgReTOF7/ly3DnvxqVPGoXV
	A0RsZ08zPn/cR5xwsKg4Q8rSyjaiRWQHH7bauey4xppYej13Q4dHoEnoV/JJjtoy30gNA3s6mfJ
	2iMf7EFHM8yvHV9xz2oQGua2CZT2QgM3hxs+iBKc3cO3B1bgk/uyAw+65iEo8Zer4JE6BsTHgCm
	9SByXMtaEXadWhdADnGNhile6x/ZhDLvCeiRA4arDu1LfA5CpOX+B9tQcj+XsIBvnJFUgFLFohK
	gGeYpWPlvUOZmhO4uTqfOyMPqlR2Nll1xJJgoo0L85vllct7i0AIF4lEy1IanI0ifzhc1l8mnDJ
	yWtILPj8ab1f2K0vMaBlXc1558ASxOFw==
X-Received: by 2002:a05:6a20:3d1d:b0:3a3:240d:4fcb with SMTP id adf61e73a8af0-3aa5a8d4ebemr9135172637.13.1778163173440;
        Thu, 07 May 2026 07:12:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d1d:b0:3a3:240d:4fcb with SMTP id adf61e73a8af0-3aa5a8d4ebemr9135119637.13.1778163172924;
        Thu, 07 May 2026 07:12:52 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:52 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:12:00 +0800
Subject: [PATCH v18 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-4-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=hEbivcKkn+B0aZjxHwDfTngcntTeQ3spTkM8LFWyox0=;
 b=cWwry+vjlbxC0QyK4KYC3NThL4pvoYwV6BicQS+0HllKJNcokB0qGMnvsAqmlZlqLcteC1lE6
 H9aBpK6Hx4RAp4O+o10zqBQznOawn4b9w6LWgVfVLMg+95kVg1gjlF3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX8SZ6nOYVgDhG
 eHbK/VrU1xMMiPPlGs0b/et7hgck4ccQyYj2bpcTv3fqW1K/lduVxvXDY6K3fXNejg+BM5eHPxi
 A5qZtQtLOvC6/0jErNPtBccNfGr6+dhsXKt/kiQjLUWIGhEwZKCzD7WY2gWauq0y0AyoOueoh2c
 pX15enBvIuBWe1WF6kauqSxmMDAFXRTkgqM4Jv4THN7F63kuQnA8J2IF/ZYqEU/qPkrsCADL6Ad
 2y1p4MLrzoOExXXal8+F4tMaUSfR5yW29tR3XutXV4OAVv9aXB6rcEZiDPIuXLEayXsPmQ5aGD8
 fEb11UAAjuwA7F3/x5PtFjq/kMTf35V4oR8yPlZsbjGnE0NO8rwGfGgyZ2fM8gGBkyNP+YYv3Pw
 igO2YJeZWxYPoX5BUkkw9d1XFfS5UUyETv1gbky/JTtUW1NwhljwIr14D1r7VsZbLspUXtfU6US
 24nJ9xWZlki2G5sI2Sw==
X-Proofpoint-GUID: lq3XbO9B4lhT-gKpicbcIOiCHCVKXb_k
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fc9de6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: lq3XbO9B4lhT-gKpicbcIOiCHCVKXb_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142
X-Rspamd-Queue-Id: 698F74E9EB2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106428-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
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
index 779d9e479aab..b0c5f3559085 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
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
index a14645b04624..fbb015079872 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


