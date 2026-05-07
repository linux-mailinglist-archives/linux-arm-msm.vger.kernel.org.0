Return-Path: <linux-arm-msm+bounces-106427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHdyFL6f/GksSAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:20:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41244EA082
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D28BC30DCA99
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304D43FE64C;
	Thu,  7 May 2026 14:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jitw2C6h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+rmbBpR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEBB402BA2
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163172; cv=none; b=FXNDAzZxctatJZoZiVpcqoxNFBNI7/+qIDNFcara2eeSzjV/ZqrceqNaPMICPwiI6pY/s0b7JHGoDIc+ctHKKhPk6Wd3CA56PJKuOmigCNceARIMUPOpoa2XS688+x2ConQ1cIuHQteZfl7HHn7ziQw2V7eZPmD8zYdISgtqLm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163172; c=relaxed/simple;
	bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZmBRgIW/g6LnYcvxvI3bEBmpa6iqq6EiXbsBxUDwpVlHnWrFc9V6ppoF3/35IPDs2WmPL/SD9pguitHEMQtpTSRRS7Ux6JYPYw1aBEHNCZsSlve9hi+Rq4fAk3SKDeS1SSyrYPCnW3s0SFexndCnZwcvvaHEO5YayrwM7c203w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jitw2C6h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+rmbBpR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AD64j880640
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=; b=jitw2C6hr89DuaRB
	h9houTJjaGIp7/rZdVggYv59en0kXLhQ4Iflw9unHxSsn8pqRg4CSBlRDyxVgYvu
	dSmxXyaYq01/84Ech3GGoNpYRECMU1MwuCTha0UtUeIIZQi1PmLhlNOe1ltpzkRO
	8gwF1FQF3kOphNH7V7g6XhyiGe4cYXV5qvlJxXMXQGDlaQQEE5RdPFpW74b+pPsg
	IAQkkVNSYKooGi8D+tH1ED/ooXojJFVbyCRZxC2Vn2kjf+ywtGleio7oOUhHlX/E
	Tz79hCjqykDnCxeMdgBQ8JOOk/PgEhTWWztIily5xSbLFXdKWI9E8aS7GC3+pUVp
	JnHpSA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq25sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:12:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba838d3fa4so10956085ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163168; x=1778767968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=j+rmbBpRBT0AUdGk84P++2PHk083xRh4kCGejLdl1lyyz5AAomJGy8zBmWCgU5x59I
         rTIST0r7RjoBrg5Tifo4/Cq1yCpcMoBZCL9DwMSVCJ46J8cn9bdO8jHayi4y611kgsid
         6cBPw/dNGhoeokIK8Y0mtQpl/SC2HSeolhPCDG8HrQWTq3/7+oDifOhx887BtGgHN0EG
         K+H8JqbOJqZ2TA6qqgarxpKMHs0U/j6q8FlClgP4e/7AWnifaVlmX1XZOlFmNjKzdSTp
         bLVd2zw4bbcqi8UrPvovFm348GYXTYgb22xktMX4ia2UnbOjCitdUTP2pkNp2lde2j0Q
         pQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163169; x=1778767969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=f74fnurADClRSSZ2aHU6ADFFrdWuzjmYiqk1bFUVkVGCnz4ilbfgpJ+UJIn1AOXMYG
         onVqa4VczxVNZ1pbFFJCrOEd9argN9nElcPPCyzkdYUkbbdZpvFPyEJUG7gYB8G9hYXT
         tZyCZiuiGfTZAT88YuIdaLrXF5Oqkw97o7cqjBsKNfVf4V0VApI+4UI1UhfE8cAcACcM
         ZVq/PhR8s2RucjafNKjbM3DZ99jbR98UyPzBqaVrlefoHI+mNyNcK07nY6LOoqbH8emf
         ZuH2khXq6Yyq+Wsn1X89qoIDg5Lz/of6V2+aWJ/UYsV5uyC6HbxvFxTBIpKNG7ZPC+XS
         XwXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gSDlJ6df9Nlbrls385qqFZ57jAZ0gESENWVSgUUvOB9ORw+UGOYlSvxt0c+z/FepcbQ2KGGFps/NzwjjN@vger.kernel.org
X-Gm-Message-State: AOJu0YyjrIvXMdwW6zXEmgBwhNJkuM7Qsvhy0EJ56suFLaB0N9lKR8by
	oiLJBucD6S/g4mb2EfaFdZCncnU8ymPdvV8lTQiVc8gCb9DkK6ZFdhAdHVpWcr+fugzbknu4JK0
	OCtD2jVfwIhGLkNA5ZePyRA3+VHEp3FoRK4YfXyE94M9zcV2pLaGy1t4Ukl1NXJdv2bmv
X-Gm-Gg: AeBDievtBpZmH/IvovixKucx9FjaJWxkOtOHyfjXpeRqCpPvrD7pf+n3056WBaJoRrm
	cbpI1rntdYYf9B0kZTQQ0WjbuDZAmeoQfWJCbJKpE+nAc7etzgBDpQkcSpYk/rEXfcXjR1DXSAx
	tJkepTWos6GPygcvhaTuodIbYYJ1oLS7l4R4upGs8uyImZlUnL0fQThNxSkprs7A4hTFJeXiLSw
	tHc8VM6Z9KTNk+goU2dyaTSL33bJGxfp6VJrH76x2ZuLNlXPOwrArAcxUZKGyxQ3yXusHtKr7tl
	JBmWlHRm5w401BsApV+/WDTd7yu/4iBXtYz4MGivcPYHlFrVn4xroG2VWPHg9wVFvNMZFptxtTB
	6cc2sLkqxAJl1zR5VHwgi19+HJtOWsHVKpnrtGg+UAzuuNa0TfVhTweH5uON+wOVC/2mCGxQGtT
	jMDNgl3sz8GNE/2Ou+Cvs=
X-Received: by 2002:a05:6300:218b:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3aa5a70d15fmr9272546637.17.1778163168484;
        Thu, 07 May 2026 07:12:48 -0700 (PDT)
X-Received: by 2002:a05:6300:218b:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3aa5a70d15fmr9272497637.17.1778163167982;
        Thu, 07 May 2026 07:12:47 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:11:59 +0800
Subject: [PATCH v18 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-3-2b2d590463a3@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
 b=J8K9AyTEoZRr/lTm4JvkvJEyM/VdCHv91RJsmSKJjhYdn5mAM1Y43UtdsxcX4p4+yrTPUWy6r
 lhvv8Slq1ZTB5x4tKb8J5ayczH2e34PcL56K7HA6InlzqfnNW2Zch9d
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc9de1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: EbHrjnCYZ42AiJ1UfIwMTIW_2ohZ7crp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX/QUXcq8eHuwx
 fS9M99fC4XM3W2JLAJKSs27dawESRY7tB8Fes/LJiUQoDNhMJBeRToSP19jLE/QonvKt7Rzu3Dw
 GiAXfHklXzXQENLEY18DuZx57kkcZBQvIwlL9Mq5z13J7bBL34xZO7IlSnfp+iCvRTSiZmYBjyy
 wQIPFKro4PeM7aeSHqe6VF1iJlT+yN3b96S7FBhrSm98jdOAQRgzBhtn7IjKkZE8a3GZQSiKLqy
 NLZJxrVCnOb+phMutLkyEXRlFKHUzZLxvhTLnMKn6jr7lE3Xn+E35BNs6T87aFxjOOF0l2RZfD9
 ZLUCZFBopseAyEBQ7sudNQscUNkUjgUt+ukUHTswA60B3Wuz+xdp4E41z9CCIpsQqZcAt6wqQCY
 BVkGvfQGO3XXLFBJVVgmLqpJBYUM/Kl2uA+c9AglOSWJPaJPX5qzh1SZUsh46vEbY5KQ0EnQ31i
 FOUUaiht8VpdYi6f4Gg==
X-Proofpoint-GUID: EbHrjnCYZ42AiJ1UfIwMTIW_2ohZ7crp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070142
X-Rspamd-Queue-Id: A41244EA082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106427-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,desc.name:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bac3278ef4dd..110eedde077f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
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
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
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
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
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
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
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
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6e994678f926..a14645b04624 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
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


