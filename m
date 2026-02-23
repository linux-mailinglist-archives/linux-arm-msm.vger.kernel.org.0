Return-Path: <linux-arm-msm+bounces-93580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFqBNsz3m2mp+QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:46:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A64172505
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B92703029627
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329ED286A4;
	Mon, 23 Feb 2026 06:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mhGmyFwv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfnKLtK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81B134A3CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829120; cv=none; b=QASA1fp/mchuz+dLJ4Ymmb8aCo82afAD29r2Lj7dwgd8CbIkHpE+E0+xPz5RVi3kQSfXMudalMFXFXeBrcw1P6gIrgj6W1QC5hV831GobAm2oCQFDhS7t26xx5xTOx33cnDsCUrAeIIv7fVURNc5KDKz2khTyIDf/04N+NaGLmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829120; c=relaxed/simple;
	bh=wH5nsU/eD/1ygNqCsVaoWKHsLxpu0A62Fho+0L9SEqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XAYjwzNWU3+DaEltxtOBqM42wgE8AFCxQN/aiLVmhrm4rj8JdQYUhw/qChjGrBadPI+rw81RSWdiIfAacgrasOUEj2CZfiQzy67roNe3hxGj5lTbOA3hftbMpH9pETiIgMhwPBvoY6HnV0A0mHmHvPXA4nTcBopv+lCqtK2qC5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mhGmyFwv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfnKLtK9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLrhcC1882198
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=; b=mhGmyFwvDVVEi/7Q
	AgewNAIbJw7C1+2DMq+kuog2SX1rLWtDTsD4DOnIHEK72ZvDFr9dSwJn0srVCjmm
	ZroJWtCNG8gKFpFJ5wG/9HEpyAND4aa2uLLaoPkuabEDOVyi1HES9xxppgcQZQxE
	s2AVdSsfjSO4payuZg+gJ27NNya6VTB/y0xdQlpHfFXfJXrikhY1G5X3mx1Fbyh3
	hJxC1VgdPSK3yM6IikY9sTQIl9JeIMojQctH3udksoI02//IgQ3G8XIkV3qlbnya
	7nfsEkjl1JMaX7377vf5ej9dCE6W88j/oN8alEH1LvWz/omp1WKmeOziAO4uje94
	dmn2eQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5waup85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35464d7c539so3833540a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829117; x=1772433917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=;
        b=PfnKLtK9OJ48NSuhMMEdfMdxVCQY0t029wdNVh09dL1Wsdt7q+c8XtkLrfim53afas
         MtTdxbearQOcdfx7s9rxZNHuQIw3Xlhk5wJYOqZV9Ed/+Q/RknuNLJoyVggcgTPatlOY
         tGqFIDBz4DKG5a5tGCCau0BW1/UmZPPHVHQQDLEoMdjYCymMYFW3HRtyJcvHNs9OAWl+
         F6AawSsoRDUNO66ozsTDCdCUhwD8FMJKXQbNfPBEDAZuR4pn/MxbBN/1bTktRNmCjFSU
         b3HNA4fLOFSCXJyoFZbeUEFQFQKcnwlhnPDc2GlNortBDlvkFpHiskPerSiVkmO9h6e9
         N9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829117; x=1772433917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oLBqq1Ga3quq8yhCCoDLuhaEl8VPL3r4ILjvN9DeBME=;
        b=CA1hlR2yr5nl8Keb27O8LTkhlO8X6gb7O/r+jDKHjZHF0QbW7nD56E9wSCoYxI+o5J
         8/rsIbJJiE+8Tgm8WpX0aykeA2L232nKYK/CdoKGxoyNVIZZM1iNYkZZzIptrD77Cajb
         Vz3izSQ5lNGPTJKTO+GIHCMUaQAzcyb7E2ok3HT28MCKi75SOtvmHQRZYPKdg1QAGowb
         4BXSjsJcgfagUze/88T9lp5iR2V8hS3hgWJUG7HR9Ca6tciRbuWUN0WeX4QjowSEW0Y3
         WOkvVqeKQ1P9WhWle+glssIAZ8ShFCGh1sOX733Fc6U1nSRIRRQd131zkfGWxkd1DxYg
         gs6w==
X-Forwarded-Encrypted: i=1; AJvYcCVi9TIT3kE1BRzMavTdEy9JeFL7XhRPmtIZ1TFcclg24kEKgw+M/wX+Fhq9qQEzF1J0GsAEAc3t/slJ7iKU@vger.kernel.org
X-Gm-Message-State: AOJu0YwCIa+mGqvhzxqjfPv8Y9GzujVwrPAcNh9aWPYDyATbaThn/VtT
	is4TGEYzmQTLkFrAt7vLztDyLgNb37XRiblVFroyE6EcD/0XzJ/wV2YJidI6IEnZwAKjpGZunxM
	Ss4v6yijn4Yth/sPaRsXbm/4MTY899dJ7da+WeUmNux9YJjxSm//znQVB+biqA67fTevV
X-Gm-Gg: AZuq6aJG/sWx5hI7WO7jqh3LkdM91jnooF38Qx6gSJAUcJmJpuFo31puFCiCI6dXrb7
	JJt+u6IVtZ6AvafjtBAh6zCiqnqXrHisckIzqHnljO5Ue5OXJ0QxHskez7oHqFKS+br6gwnjahC
	Ew7ujQOiz4oJlS/Dzsz2B7/Ox98Efc8nIIgA44yzboZJCGzMFMwmyqO6H5gNgNHptaoNCzCba5v
	pjvar4PzPunXli3nX34ReBJmwXoh5p1FjhnqaWi0uKieEZmt1g/txswipZoSUpGNWKyIfUOLZcb
	GMx+rC5Ej0o3Nxo0Y1gzIyHMP1uSB545HiTF1n1oNthpgnq8IvWD9Pe4lFN5RmaP/MV8rfreOVB
	er/3tC7boxtZhMcwGIRpdgLybuHDovYxAQ6/JXP/ADvRxTxeWLptI2n+M2MdedFJne18H8+qKae
	1fRekZpNoNC6XS
X-Received: by 2002:a05:6a20:958e:b0:38b:e9eb:b12b with SMTP id adf61e73a8af0-39545f5619bmr6143367637.41.1771829116902;
        Sun, 22 Feb 2026 22:45:16 -0800 (PST)
X-Received: by 2002:a05:6a20:958e:b0:38b:e9eb:b12b with SMTP id adf61e73a8af0-39545f5619bmr6143347637.41.1771829116409;
        Sun, 22 Feb 2026 22:45:16 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:16 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:44:39 +0800
Subject: [PATCH 3/8] coresight: tmc: Introduce tmc_sysfs_ops to wrap sysfs
 read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-3-042fb35bd37e@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829096; l=5212;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=wH5nsU/eD/1ygNqCsVaoWKHsLxpu0A62Fho+0L9SEqE=;
 b=/Ol5kPXNRuyJ8aJ1B7Rj8Vw2iXt3pEy61jXNtUqmXNvS31VweILr/0p2h37cdoRqTQekIAjUV
 rSAmP6UDBNHA4nLOVAzsdsz+bUgp5Md1LtWq/TO8oHVt2/H4L16pMoQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699bf77d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfX0FpQzHFRw0q0
 yrpUxaC3uBZ6+VpJ+TUo/JlHtj8Rx1ZHQ//0yM3xOVOGFouZQmRrjW8Gp58CAVvBAgdwcKWw+Hh
 AgodB92OwQRQrGk4k+yA64+GfCIxYZ53UB84gUIHQnIbDq+pRIjneyhn8chEuYEuhOBxqcKCjZG
 2vee74674xdZYx/e56Jf602TEbwNO6wGal8PdB3Qb9jqBxCvM55iGHXCS91Ra14rP+3MFV3bhjn
 h7JkwlSY/QbsIUwKetTwxD93BXeb/aQaE+r7aE6UgGIdUJNp2+AEE6aoXRfu1M2ezt8+Erysiip
 LAX2Y0nYRXlImjxtjcj7oETYjs0+TE7OS8WHgJaMYW/pe9DcEH6GnjqrWKXV7ldvGoGKXsbwdKo
 MRz05ggX81d1kkM41zN/+LWnFo2PY3dk8b/mE5iyRjgEK1BqSBBkXwEeHdYK0rAwP3gGzHgGT6Q
 ojVChEk2x5IaB/r5Ylg==
X-Proofpoint-ORIG-GUID: njflF9p4FaJ0mwSbEYpqyJAlLwDccFLK
X-Proofpoint-GUID: njflF9p4FaJ0mwSbEYpqyJAlLwDccFLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93580-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53A64172505
X-Rspamd-Action: no action

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations, for reading
trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 1ea255ffa67c..32ca2ec994de 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -291,15 +277,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -769,6 +747,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -828,6 +818,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -841,6 +832,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -849,6 +841,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 57d8394d09b7..92ffaf771fea 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -260,6 +260,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer_node for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -292,6 +293,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


