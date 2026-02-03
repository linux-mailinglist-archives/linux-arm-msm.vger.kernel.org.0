Return-Path: <linux-arm-msm+bounces-91588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFyIC1GNgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:53:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5583D4D57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 06:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD09E3044D5E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 05:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26A5367F4F;
	Tue,  3 Feb 2026 05:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8PoCUAe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXTXINAY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81974367F55
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 05:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770097953; cv=none; b=hp7mor2KqoZsbAZiCt4diUjEVUPW3ByFaQYeXbfqNhc31HKxLCd8G6tj2zKpM1C7WyeWo4kXwnRd+OVaRjcA+Lyk4ZGhARzYhf7Oqw2m+9T9T655+LaPKh03YgHAZZ8Ksm+E8cmBPcib+PaEMx/xRMbiSbIxl5AcpYZjw/7LyKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770097953; c=relaxed/simple;
	bh=+caVanCR1MkRvTlDCUseywuTVg2NMA0xm0dQkI5ZlEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t8AoItH9tz0dH7PffYLdZSClp2ZpSfQGpa4c+czeKNnwz+wiDG6uMFbbDo/jDt2CzlRCQjpmRrFX5UT0WbYKvFYJt5HWzPE2nYEa4lMAzx6g8//NVQ9BPMPqyrgtT/xtEsUNIYMCVcMqEdNodIIK7xvekwsW4OWkrWTCdStnYMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8PoCUAe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXTXINAY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612J3cWo2899836
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 05:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=; b=X8PoCUAeHt4sKJuk
	q2uqwLzaBjMBI2nWiGa/33M27T4ZN7/1RyUhx/BUFkneQ2RkpTSlbXjYcTqLrn8L
	JVNAWfUnUDqI4+Fj6mQx7RL5UKybXcQoDBqWMuC8aU9An/iF8vglDF+l6unPhP+u
	CQtuIk1Juuh6pPfvk1grSmXwcHnEpOAzKTieEMMSJSH8Deug0wYw8r05bOVco9e3
	ccF9S2BxOzUIY4f5AaV+aaM0w0SYIP4V4tJOLCpRGF9I+v2y7zjN1CDYGEZCSZyC
	O00QvbrA9wfF3aGrTNCDFyx+dvtbfl8Ga8mIXP3g3YPaM24Sjk1XgOx4EMwEV5nR
	ECHiCw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0u1nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 05:52:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a79164b686so53634925ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 21:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097950; x=1770702750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=;
        b=cXTXINAYH+RtevcTQNQqU4XilGp4T+Ey+aZwtk3X5U4UnnfcyDwmR8IRiSuXWxsULX
         BbevrNdOnjzl27pcT47KRh4E4C6Hs/GgNdGHVryOzpFsNOCN7W5ppNnKUG8IZXAgxcKy
         W2L2Fap67ifits7tXTs/5qVrqJ0qsQgx3ozRqto3rtu7qksZIKIUGhF6VOf6J95nvgIL
         5zrF3087T+5RHs/GNLwBHypSUV34xGlUClNsrZHgrbqBcGcr+bv9Qz8vlapI7nEXPikk
         Mp27gV4VFbiwPIlX90GDVxhUac92HMwpj4oo2Qj4ZV1RzmCM2PehKjS8dAjesnXh1eF1
         Gd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097950; x=1770702750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=;
        b=Qc21io8PVq1TOKrCT4r6B/SEO33iyC20vTVHWfiVwpEg8otEt2RhUtBGosISX5VV76
         9Qbsvx1P8SPkSAEUeQIBL0IWkMYung46CAq9bgbB+/638JJEGFKqMemQ/uVPBV3R0SN6
         NZGk/nrqihWPFT0cgnmt9B/8bHiadsskfEUhL41ISylOYx5uZ30IID3NUNFmXWo2vB3i
         8IVSCO1hSQfhoqUg+WfWJV2gAE+tikVhJF2YR0y0xmXoJVE3sCk0PPlAWZAYZz/Fly04
         sYFOkQvuaNsL5SsQN6UOVTsap+KC+HKDsvtBqtufxYhhxG8bTNXesMhW6DO3V3Y17JRX
         ZfAw==
X-Forwarded-Encrypted: i=1; AJvYcCWJUeqEonhoWqs0azFjYAitv3Q8ujVxQqFDrDYe6u12PPgbIjI4Up3oIMTJ+doMXjjIE0C85BXduRm7ckj1@vger.kernel.org
X-Gm-Message-State: AOJu0YxGFEgSAGSw/g58OtomFDzREBJGs6nHFRXwqfEHA0SI7/QuUgN5
	7QXSDPSxLTb6t8DFCdV44RZT+mLDf8Jm6awXubPBazGy/G0tXBmmumu4xm2tAkJd0Jo+02Umctx
	MrzlkvwXi4S/VcfsdrYVVH7Fb/TQjE+Io3uj+bTMsikNkeBpp6F+3TU9P1oHzuJCtWRHEMF837b
	H3
X-Gm-Gg: AZuq6aJ+HgFE44QTUU3D9lD369zPEvW1arE9ZlOIYMk1spy+x8drTsdP1Ch0JzmecQE
	LhTnrberBYd+ClyG5QzbNdwa7KsgB5fgFxYG/YfKcPW2shlm8TDFthtD3UN4K6KLVMzLtQE4Edr
	ryQyqS4e/3MuNT5pSus4tiXSw481ld8Pb4rpm7j/MdWS2ZUZ9VYnNbF5GVTQUQl1vZRbMay4Aa1
	4gtUsnWg+njt7UySuPQlO+u2eJlABCoffPo6S31QoRYl1ExcnVL1NA+GqKZPRpC9KXVSa4DRMLz
	Uoe0WzVAhEgpS0uiJMPYEGsxO4/OSAy3zu8cBhfc4iNan6p3SFib3HfXf1ghrNYCFCLBVnGLoHL
	t+rfWQ32oE0LS15qSLNAAMUZNJUfuXlYl63odbncG/cxIJgoV9VP2wPV5qkqZs9diw/IpwcnU
X-Received: by 2002:a17:902:ced0:b0:2a2:d2e8:9f25 with SMTP id d9443c01a7336-2a8d990ae07mr158884195ad.33.1770097950164;
        Mon, 02 Feb 2026 21:52:30 -0800 (PST)
X-Received: by 2002:a17:902:ced0:b0:2a2:d2e8:9f25 with SMTP id d9443c01a7336-2a8d990ae07mr158883885ad.33.1770097949600;
        Mon, 02 Feb 2026 21:52:29 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:52:29 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:23 +0800
Subject: [PATCH v12 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops
 with tmc sysfs file_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-7-7bf81b86b70e@oss.qualcomm.com>
References: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
In-Reply-To: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097897; l=3465;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+caVanCR1MkRvTlDCUseywuTVg2NMA0xm0dQkI5ZlEc=;
 b=0aOnb04P44kXcGnsHxDOb6cbQen5ROGAS2XQyDBqaHKVyj5sjZaeFpCmJjSPKNNE+BMBcZS/c
 FFgK17b8+98Ckj9YidIN7fV22sSSJPMwv7A1Kk1quwFNDXOCVSizsHK
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: US7TJNejSbHp3jegPOzblj6299Zx2_7g
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=69818d1f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfX+PYaFKUkOXJT
 XzekKt59yJKDsRDosYuvBesefdRyVxaqZHpWS4izxwIjfuknCj24HJSFCrlzUCTNQ1bNfkjQTEU
 bpwSy3jVpTHsl4ooOA3GSXQMMdpHOFd0dArpBHN0uDLTTPeiYK32QPk9mJ0pL44jNVu8EjQ2n2E
 qEKSy//IHQ4I/iZcvG8NURj8i/s5bNS/r0o+AhzFpJYlYJZ4DvmBnWYCW1sGkX1/rwWNberYRgp
 OPCJAbGI7KtH754EI+3zTZw8bFvdbRhXR0tBw7BMjGNYwkHnmbw2dtBCDHuyJL6ElN59B0WuNJ3
 HD8Ru8AyQrUjsX3o5yLKCQLwnb5vhYF4ekKOOClbBFRIYSEKs7uiQ7xP4CzVfRkQJMXXZUAcHUp
 8BvkFB87lwpv98/r9J80HoK06q7ie5HAkGPfk8tQr3ENVatNzos4Ne0fxD00s3jYB9PAMvXjQin
 VAZY2TJHY7varkQq9fQ==
X-Proofpoint-GUID: US7TJNejSbHp3jegPOzblj6299Zx2_7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030044
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
	TAGGED_FROM(0.00)[bounces-91588-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5583D4D57
X-Rspamd-Action: no action

Add code logic to invoke byte-cntr's tmc_sysfs_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 32ca2ec994de..6486bdafdddc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -31,6 +31,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
@@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+/* Return the byte-cntr's tmc_sysfs_ops if in using */
+static const struct tmc_sysfs_ops *tmc_get_byte_cntr_sysfs_ops(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *ctcu;
+	int port;
+
+	ctcu = tmc_etr_get_ctcu_device(drvdata);
+	if (!ctcu)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, ctcu);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(ctcu->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
+
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops)
+		return byte_cntr_sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
@@ -297,7 +344,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (drvdata->reading_node)
+		drvdata->reading_node->pos += actual;
+	else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;

-- 
2.34.1


