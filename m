Return-Path: <linux-arm-msm+bounces-103929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDidOYJY52kE7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:59:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1634D439D91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A4773054C06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667BF3BC66F;
	Tue, 21 Apr 2026 10:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6hYDJHL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/pWOU2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9FF3B6379
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768998; cv=none; b=HFYxoZ9xMXzuVfrpCUZTDSBEW+dK032IXlr8EqRZdinmLZnAFdq01Cs71VibvOw7Cy22eY52xD7QmcS6nqDfQ3JcGlYk4OnOW7Q9AfZRFz9MNHvIBONe6Jo2Jp6F809IfklD7WMd3fmHIbGt5ZnvUOHdomZhdXc7UwCMqxQWk9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768998; c=relaxed/simple;
	bh=Pfl2LKxPOQb/ac7N9QZFTXlGhGaac/cCYyoTMz4qpIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oMcI+22SNV0tnw2oID6po2STQTncSWnyB61qo3X4U1IigY0UdXTcInHEAjB9JGWqmWU2WS1ujHZiv+6Wq86cqAR+qk1E0g9aGAerWiJ/pxH20YKjO2vw/uR7Gu1wJv9zkhfiBMuTonFck5RNiUVGHw/5QhAEkpD5b55GgYFm/+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6hYDJHL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/pWOU2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LAMjes1510703
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJZM/77i0yGGMCL2KJnRcbvCvNEOZWU+yEvuuZpru7k=; b=l6hYDJHLkmNNE+GS
	g6KaCPFJsgaUkgjl1iwwY33LEpG44Ya8nAkMOTJBme2Y2zwIU5CPLQN3kG3l8Rog
	lw4DfXTIQT0PjJKVAsmYmjS+p7NZgHP/z2Lk9E0XzKWAyomTZQrGCeLJQL8sjfXA
	E3NtkgtlghVXhkBEK4ckgyAMhlYTkO3WnPBa2p0BSQ75CyqXiwtlZ7saArV3bQ7U
	OSXtJXOPhA1fN4Od3ElbA3LjTSbACWEU5ApWa2xuZWB3WiEvkf7gUN751hCE+QmN
	XYvpSnSlOVY772splMdLMERUfni8G4RYE7lPvony3LEygDMOrL2vnhJpxdvtbSBU
	OLQV0Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak1dh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f220f1dabso3012796b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768993; x=1777373793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJZM/77i0yGGMCL2KJnRcbvCvNEOZWU+yEvuuZpru7k=;
        b=H/pWOU2Aec2uYF5y1F0hxxZakzxapHEGmC21vzvyRfmtSYpi5yNHLn5CqwZKsF4tcM
         tH9RIDhKgkDzhl760sVdlwPLlamMW7tNTkwRSFx3zzO7V5G6yQmCC8CoLpQwo01UjwCW
         FjfP3ApKS4m0tJB64c9F3w9sZEIg/o6LUXm6Rwbz8Uboaj1dRIEl+2rzjy5jQxAs3zeV
         NtPxLu6y1HT99XBjCx4rBkuN4jHOCSPAPar/Go/riicdwiqtcmE54ZwLWRy11aNZz4CN
         3kKenaQ1rT1VeXuYhdYEwDj+MStHD97JNQ3aghZk9nAYCFlWTMQJ5ILNjVaOq1ZYcScU
         7qDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768993; x=1777373793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DJZM/77i0yGGMCL2KJnRcbvCvNEOZWU+yEvuuZpru7k=;
        b=rKLPPWphaFDjqGeAh4LZSZn4PPCvQKpye6N2CaCgDokub2op9Smm5Kh/cj+FBr0Igv
         q/g5op9bvjT6ActGMzgn2wvoBK76991Xety4sNeVrE79vEXVrfApwiTLbxchPchrEqtZ
         1UdzQKFyYJ9VwPqaY3PHG4FA8f1+7M9TRd4BZvcTVxPPklAjA5k8VtHL9pq44d/kelz/
         7X0AV5xho2UJjhyG6KN+WLJ9ptwozznFPZh+DjP2/f9ece5ynjxaKMjVu1qk9V7N9e1X
         t0CVgtsYqgs2jI/Shbc64N4SYDM4dz8QOn4doFcGEytUts2XmC1CKumiPaoMOSHscTcR
         9atw==
X-Forwarded-Encrypted: i=1; AFNElJ+RNm563p0nLSORI9WJN8CTJcvx7Ha+oMIjnSOccEb/BjPz+Ke+Y/A1tSS40p/hsmKjqsLyr5oRtBmxONvX@vger.kernel.org
X-Gm-Message-State: AOJu0YxW+EZtjbtJv44XJyQQqKIsBhuh3swMucXcAXGzuQPsBhn1QSuv
	qgUjQcs/gazEK8Vj1t4lRPghd1Z74YPxLn5b/8kTQsB2O4P0B4QTIjN4W2b0/Q9iCFtMDufuW/h
	KKlVO5u3a4YCLruhNgqjdooNcD3QKNhQGig2DjtKmTTSchPeKvPVzhMg5V9BRcDIx448L
X-Gm-Gg: AeBDievhlKq3GoM7nt9qjPbhjo9YChPcAGjcoKdRlM80ivx90EThOtN4NNTSrD5mmX7
	kTXzIncm6i61NGdxEG2JZJxD0t1ILyUjTbp2YWwXsOqHPrerJ6fdJ05EKCcu1SjC5hqpsPi4EKH
	zC6rQMmrQ67Ezp0EaeiydeSVAJ6wFgjuE7vT/zj5V9N7XcOfwlYqYMe/a5HtsmJGBTMBEpXs+ZE
	9aVoQMIIMvIwicu3eZzAimo5oKGIBxdmXkttGUgweVWbQs2ztakDHCY1fNXlymM8sN83TM1crqL
	Dd4Yzax595tMu7hv1X8SAWw6gcKAkOLGgGnB1i5+0ZF3sE3Lw6tl/aYubWOyy48Vl+dj7vSJin9
	sOVT0LEyBgyiCk3WYXDyatKa4FfekxM/3fDb9MSDLHRA8sZvQcj+mp4gKoj34ma6nYFJKh7JWPi
	p1ahMh8Mj+Ib1RH6+ye0E=
X-Received: by 2002:a05:6a00:340a:b0:82c:ae0e:dea with SMTP id d2e1a72fcca58-82f8c8c39b8mr15944380b3a.32.1776768993171;
        Tue, 21 Apr 2026 03:56:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:340a:b0:82c:ae0e:dea with SMTP id d2e1a72fcca58-82f8c8c39b8mr15944343b3a.32.1776768992628;
        Tue, 21 Apr 2026 03:56:32 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:32 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:51 +0800
Subject: [PATCH v17 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-2-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768975; l=6212;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Pfl2LKxPOQb/ac7N9QZFTXlGhGaac/cCYyoTMz4qpIo=;
 b=DgDOejqKQhCI2nwimlAlmoNygLDk2TZVQ29ul84szOehWNh96uLe+mHzGpAcgz5HP0r4TksCu
 /bm0DZ7g1uDC6NaKIk1GMN8vB2kMPqEdGI/CdBi6njNx9wEMhQbUrCz
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e757e2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4X1QdO6FUjyoqZna7mc-D_2j1ZnZNFux
X-Proofpoint-ORIG-GUID: 4X1QdO6FUjyoqZna7mc-D_2j1ZnZNFux
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX+b1RC3RrtK82
 rDYBFFLycSIfGgm4DPhfqQ+qOnRb06pHzGoboiczXW/aIek4TzJUl1cteranNg0cGFSBTiFIw/O
 W18U6bVVWxxEcw2W4p2eOZC6NWYyrpMJFfP0Zl6r4mGiwvxoN8u4EREYsP9akDPE0NIRMbPcWAV
 aHbCJtxErwZp5XLnDatzgsaTAgm/O1uQkpWCOGlLck2hyJNE1dUz/a6NB3/gvHu/zx4DDcrxS6x
 ZcGG5jFE38NvSIX+IQeS5IEziM8harfbLZiA8QPhN8huPD+aeaSRBiuLaGkWpY+X9LWbmuBmzDp
 vyv8jfXTjhDu1+1bxCKlQIAFA3DZmJziqENYouWnHaa5xp+j1SE0ipeTYDc1oCQxtKCHow56n2V
 qFRvbakTXpkLJzCQmGNcTQbSl8FH6rpbh4gphmoXEk2YgDpeVt2BT+VjQKrz49704MVc4zZ8+aP
 deVsSlZ05S8SrXoLieQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103929-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1634D439D91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 99 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++
 3 files changed, 117 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index c89fe996af23..bac3278ef4dd 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 4dc1defe27a5..ac704617097c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,105 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove unused buffers from @drvdata->etr_buf_list and free them.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED) {
+				/*
+				 * Dont free the sysfs_buf, just remove it from the list.
+				 * drvdata->sysfs_buf will hold the buffer and free it later.
+				 */
+				nd->sysfs_buf = NULL;
+				list_del(&nd->link);
+				kfree(nd);
+				continue;
+			}
+			/* Free the sysfs_buf in coming steps through nd->sysfs_buf */
+			drvdata->sysfs_buf = NULL;
+		}
+		/* Free allocated buffers which are not utilized by ETR */
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+		nd->sysfs_buf = NULL;
+		list_del(&nd->link);
+		kfree(nd);
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf;
+	int i = 0, ret = 0;
+
+	/* We dont need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/* We expect that sysfs_buf in drvdata has already been allocated. */
+	if (drvdata->sysfs_buf) {
+		/* Directly insert the allocated sysfs_buf into the list first */
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node)
+			return -ENOMEM;
+
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (!sysfs_buf) {
+			kfree(new_node);
+			ret = -ENOMEM;
+			break;
+		}
+
+		/* We dont have a available sysfs_buf in drvdata, setup one */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else {
+			new_node->is_free = true;
+		}
+
+		new_node->sysfs_buf = sysfs_buf;
+		list_add_tail(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..6e994678f926 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Offset to the start of the buffer.
+ * @link:	list_head of the node.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	link;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +258,7 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +289,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
 };
 
 struct etr_buf_operations {
@@ -447,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


