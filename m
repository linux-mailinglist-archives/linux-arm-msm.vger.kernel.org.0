Return-Path: <linux-arm-msm+bounces-97376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHtCE+vSs2l5bQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:03:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C566D28027F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CACD3120F1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0D238758F;
	Fri, 13 Mar 2026 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SC9LSw+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H16XmNy8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7992E387377
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392571; cv=none; b=T13lVfOaTkIgzABmsbLecsW97Ea+xQvKADIHFXXMUnhkLkDru2Xjp5OZ0IaoUo5vvaqumyAHGu7jBAypCjvnMB2anqv6GPgtdBUAAo5mrl82khLVfUrSZcDcVOeiU/ZsMOOm9iOihRO4UZXSrZmv5xZ5DMDEu59FBKd3jmuAdAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392571; c=relaxed/simple;
	bh=ox7XkapqqQFv6BvdfowOKNWDnDUZ/ZoNrcI2LZNMF5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mq0xVwYvv+cAmoYG/Vj5oroyrr65AVj+Kvbfi0kWWy6WZA9uC2S6SgTMtR9G5s7i3vWuCFs+hkCFZpv6MlitoyObhfOWmi7ro/k1Tcbw8O6oBXtLugRBsXkbPXI0u0b3XnLf98GpwFmhey5mJZ7hljkrOFxyNLEP2c3LbBU33HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SC9LSw+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H16XmNy8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5thAs1014950
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KfHNY/tww1SGJwd/uAbJYnDxS5kq3xHdkWpsLjKeguM=; b=SC9LSw+Pkr92IgIC
	eUAfSTWD7AroXI2r+zTnLCFrBOFwV+3MdubZVPXF8QAFiEgs+FGH9hGodsWdqIu4
	+UH0xBwdBYjwB+EbV6jtY8h5CQMjLprrOLDrlbu+4NHCDcGyIo1Me8+apKjZO9+g
	+mwuHoLrXC73Km4HvIaPJAYr1cWQhbo2ZWjYAOJb7Gzvlo+tUgdOHZgIOHvhNZ6M
	q4okDNRhy3JOG81K6Um6JGJBbO+Yut1qWCx2PtZyEoEwWP7m3bm1rXm28BmeFmNV
	8tvs70FlUGsxqUVJLr45q1YoDQDcQZaa12HndtfL9Hcbmu2j+NDMwTWue+Bvvn/y
	zIxQRQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdmqd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:02:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso21254705ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392568; x=1773997368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfHNY/tww1SGJwd/uAbJYnDxS5kq3xHdkWpsLjKeguM=;
        b=H16XmNy89KHeRlnRR4yYI4GpxuKgsuLxerxsvX42uE3xx2xrWWTh5q1uk6jepiJEow
         Fnd/055Pa3XUkNzSdpn1F7MviDXSi5oD+fagzG/P1QFLMf6NOmmhEkTocahLpwKeb1AD
         YoeOIs61R/M5zvkR4rarZX72VC7K+B/n2ljeyjTTwSxa0R0crvxlPTdKH07s4zUYCa6y
         BHEKtVY+EKYFIvS5ZSL5Ye/zxsigT2N7EXMicoUZv6/SMy1UBOLCCnRMbJRCf78tX3NP
         2V06excWi4RcWptjRUxGnrlnsUATX364U4tdNYq2rVBaNwOVDAsNMoO8iVTZ152Rmln0
         gcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392568; x=1773997368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KfHNY/tww1SGJwd/uAbJYnDxS5kq3xHdkWpsLjKeguM=;
        b=qZf2YBCh4PN0+zd29JjXPutlABzWBQT3hluCxeJkxrURgwCh7F0hSyNBz/risQ5DoG
         XgFfqY2tTGbQQ1kxx9siqI5dRDUS+OAHYGoz1Z/+76TX5sNi7FGRxYMrzpOQv1KItGKJ
         ESrgAeNOumFXs+fdftxY60IcXDxdXtiWCEn1aulBD2Zn75eRr3QQk9Oh+KNFlF9AZVFz
         kjreq5Qax4Fgd3HWvmpiHRnS91AaXh2+LFdq2WrcQAykrxVBSf2Zqm4Y7qkkeMq+ffFK
         lFimqnNf3Zr/Lxu4pCiXRl/TijccxWDybh1m7fdlH+gWGo+jw1pOht81cAZ4hp4NCKxq
         UGiA==
X-Forwarded-Encrypted: i=1; AJvYcCVcOXjgMPoS1JHAu4PCWvg9GthjL9CKGKPTaNtgVCkUYUVjVGitODi8265M0RcWYJcch9xR2G5qByS5kQR7@vger.kernel.org
X-Gm-Message-State: AOJu0YzjWyAx0xRUcbMcv1oYEuQCkh+2RezQF17DMXzs/+06zS0+Ed0S
	bNeUsR9TQbCU75IEkLdgNcPpecGQb72y0Ogi9Gq5q18ma0xxwGLAIsm+dYHif0J4vHYvUz6q0ik
	/NGT39pdtkj3BVKHWgsRHY5UkV/xe33cyV9ghIEFvAmqbAfsFOMxx1fdY6GYzJi6pyfqy
X-Gm-Gg: ATEYQzxzHjG3zH5FJZyQ0QJ9+nMQq/V4OcNCx7i/ssB8Kel+jNvpvfK1B8VKViYJEPm
	xhFuoZ1qjJB3ZOohVLzl1+k+5HHPMS73t1jjIyaqdfHaV8vjEVBmMGIdby17mEEob/SiwyIiV8X
	0D+PhPuNGa1iTSh7ovqZ1RiVTCFkA4J2AS3ZatfidliEAFpf1xAkxu4ZGZL5jVI5REujvlbdyDy
	7R2u2DN+vQymR2Od6jKCZNInHBa+qjs9+NilsAISz77R5ywOY9eKWF0lij8UMtgy3+hTigKdH3R
	eVPYZNfEu3ELP0AbRPC7sGTuDoMRwm7tGCtmqcgZYz+BwRmCqwjFGeUX9UP3g7h1vnx+T03BayR
	rYRqB4M3UNE5GhRzq6TCGilv/00Ycab+StCdyr1MXGUKKPuwDN2+wtzasYyiNeUzGOrWCH3gnSg
	ZUQPXzf4/j
X-Received: by 2002:a05:6a21:d83:b0:394:5463:7330 with SMTP id adf61e73a8af0-398ecd72c68mr2109269637.51.1773392568060;
        Fri, 13 Mar 2026 02:02:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:d83:b0:394:5463:7330 with SMTP id adf61e73a8af0-398ecd72c68mr2109233637.51.1773392567520;
        Fri, 13 Mar 2026 02:02:47 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:02:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:02:05 +0800
Subject: [PATCH v15 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-2-1777f14ed319@oss.qualcomm.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392552; l=6645;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ox7XkapqqQFv6BvdfowOKNWDnDUZ/ZoNrcI2LZNMF5c=;
 b=jVA1wfsLfdrODOSjsqgCmf1D8+mwe9eT/Kky4CgBmEZDCatvdZiCN1CHUu35Cn59KBw2jJTTV
 AC264ehcxqhCBP6JFlpVFjSpmslS4XD6tDutbSP8odsSWJIjKfGomAo
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OSBTYWx0ZWRfXyG2qunvHUsme
 a/9BLC36OKj4b8AwuO6Ik721s7doC/PH3N52JFrNHLH+APbteK7IcTgvF26zVezxBzpVRPeHIc2
 Nb41znHX8hgXV8PMP7IAHpvDzzrZVUhMRGdqN1k9ei/o6pVZqgHQGvrd53bV3/PllfmPdu+L/JH
 ly9yd5QUoTExNW9YIQ223ir+HzZJxq3GSec8eYCw4sfx2GKzwCugFxYZgKO7r2tumY84u4SqvR4
 YqYm6DAJh4GE2KA7sIKggFoBvA161l7dOt8TE6XICAe9wwRqX3C9i97LkMCEFJqaI9BSrHIpnxK
 p6HZb12ZOBNPUQv8dhfRc8OguJdM9T1bXCoIR28xOTrpt5TOA8r8lrUbJIDIZJJizqDJ7FVXORY
 lhhlFDFNTfpE0oLs8c7361UTSWbmWhkCyjsiGsQUywIG+ZCzk8Wz1Jef97duGMCjPKwQyeh8ego
 yevVjWnkn5117e+4m8w==
X-Proofpoint-GUID: j1nXg08kGs2QdYw7ax_899OSYKNV8r-E
X-Proofpoint-ORIG-GUID: j1nXg08kGs2QdYw7ax_899OSYKNV8r-E
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b3d2b9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SmiEMI61MywFhWxRikMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130069
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
	TAGGED_FROM(0.00)[bounces-97376-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: C566D28027F
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
 drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 108 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      |  17 ++++
 3 files changed, 126 insertions(+)

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
index 4dc1defe27a5..fdf23e1c932f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,114 @@ const struct coresight_ops tmc_etr_cs_ops = {
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
+	unsigned long flags;
+
+	lockdep_assert_held(&drvdata->spinlock);
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED) {
+				/*
+				 * Dont free the sysfs_buf, just remove it from list.
+				 * drvdata->sysfs_buf will hold the buffer and free it later.
+				 */
+				nd->sysfs_buf = NULL;
+				list_del(&nd->link);
+				kfree(nd);
+				continue;
+			}
+		}
+		/* Free allocated buffers which are not utilized by ETR */
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		drvdata->sysfs_buf = NULL;
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
+	unsigned long flags;
+	int i = 0, ret = 0;
+
+	lockdep_assert_held(&drvdata->spinlock);
+	/* We dont need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/* We expect that sysfs_buf in drvdata has already been allocated. */
+	if (drvdata->sysfs_buf) {
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		/* Directly insert the allocated sysfs_buf into the list first */
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (IS_ERR(new_node))
+			return PTR_ERR(new_node);
+
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (IS_ERR(new_node)) {
+			ret = PTR_ERR(new_node);
+			break;
+		}
+
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(sysfs_buf);
+			break;
+		}
+
+		/* We dont have a available sysfs_buf in drvdata, setup one */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else
+			new_node->is_free = true;
+
+		new_node->sysfs_buf = sysfs_buf;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..81237944b986 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Position of the buffer.
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


