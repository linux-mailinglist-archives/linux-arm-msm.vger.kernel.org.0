Return-Path: <linux-arm-msm+bounces-103932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO46G9dY52n36wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 13:00:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D30A8439DC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 13:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99FE4306956C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0733BE15D;
	Tue, 21 Apr 2026 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9dd5cxj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTbeDl65"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D53A3BD649
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769007; cv=none; b=KXLNqp0wHJSiesyYYgnXtKGVs5jdXvodKWFofPBLzhJiRroC21OY7IjevIjIdDHnEi5hWdzd0dQpjogLFbkoaJMfwD4/Wqr0M1FOLfpBKCgevy1Uq595iHLJW+u6SPxSPE/Fv8Lr4GpsflE/dj77oA/yMKDmBDQ08weMsAF3lis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769007; c=relaxed/simple;
	bh=5Mt5/XsGHOSDEOG0ISFiVsCUEFGP0erIeLzDLMDtZnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=azRqPCMt9gZxUwwjc8d074aGRtTLJg3tTBD25qFtpg0CWTSBzRPYnJ+IN5MEqhRfMbmNlsU4YOZHy6yjuZzignrk6UEQqMzt9OLFfd5qjRwv5OmjyNKvcKk3Yv2wBq4SDVUQe7G0OTyXtqGa/ePMk35B9yC1zCSLouhqB1RR1EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9dd5cxj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTbeDl65; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5hddW1014304
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVV75OBmAXnSQqclAhnVAU844754GU81P5VURZ8XoRQ=; b=J9dd5cxjJis9OQYL
	GGHT7kdXwe9Zen5iz990QgdJgI7imRUY/Uzgcnakz5kyFWGPA7pNa+57nKgS22ug
	Elmx2vRZSxonTaJNbaNXoT9nXS9acuMsqLjaYmEyk6bYi9KxYhvWfuPx6vJ0howr
	V7Whuv8ujNNJjERfCc4QBGAdN5Tzhh1KmG8upWyHctVjqbc4yPLpuZf5PaNWM+YE
	3beX5RSQdoqoJoLXSr9A9BQfIcXJ1+kmWbGMwm0TYXtxbiJDDBBjc35p4OUDqvsZ
	0P0CfQr94LkZAGOV3PB+MwYKX75s6uxG85+lZHJJupWwWRrEbSRbyHBgD1dsg3kE
	R7A6SA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt902tv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:56:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f460260cfso4171996b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776769004; x=1777373804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVV75OBmAXnSQqclAhnVAU844754GU81P5VURZ8XoRQ=;
        b=jTbeDl65T9loOCFahbu+WOKb4UoDPI/syvrp49g74x81uEs5c/Q93t0X6nh/htxUGO
         FPlCfudWrGiHDCx6ZbfyvBX8s1w3Rz00aLx8w+PsSFP7bTKlEp70ZK0mFwVk0xHWGfyF
         BQZ5NqXQhaKw2RgHWOs0aVT7vzgKnCNxLe/pQdGMoJVhpQySrNhUdang2QDIjSNJ2hVE
         jz3Jxwhvg5HynZB5bNLdY3Cz0eGyaZxR3lhEoL2rqjn5AcAHC2XqgixpvWWG6GHvn9h0
         ugqaiAXQIzb1QIlZVn9Y6BPJexIFH/AcLZXWk3HVfH4Sw+JD75eaUBuSAaQ9VBnAWh7A
         g8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776769004; x=1777373804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVV75OBmAXnSQqclAhnVAU844754GU81P5VURZ8XoRQ=;
        b=QXYNn16NwejsWEZdNp//6wBPyc379JSOtPNQZR5hTVBp9J97RWkIqJLgcPG9qnDWBS
         B1ckw388mw9R09qwlytRieoXZ5Y+rPweSioIdcOMcAE93riBCFiVCjDg1mpgyWuA3s69
         R7Kl4q1IF3NXvPxxM2QGUUwMtERiN0X4gYaaihVEhW/SKMje3ptKC93NY4TncywdSx+k
         bbxKi7sncq32vOLIkWELBmXEXlj5x92mWgX9gh6isc8ewYVN9Zhf1Uyrqb9ZDNVyqNzD
         n4Z151wuTilZ5Kp87ZxA7tSAaIYhEcYGxRbrUZ0DhqPVFStBWT3QJB9shpaZLmVwnoKl
         ej0Q==
X-Forwarded-Encrypted: i=1; AFNElJ86Fdqxu/b8dmIcPZ4N7etBmoQfMzI6MDHbR5exipOMTccRI2tN5GhHw/jjy7M1nN7+eCqBHuW2po+UAI0/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+BgfpWN05Xuz4z3Mn+Y4xTDdtEtLsLkG3DwaYplYnoYTbMcTW
	R+ZxapOxNwRN1tT8IE9xmVnxbt0IP8N6d1Qj5Bs+9yCGP+ubrsgviaYUglnwpPNsjRDO42NjKF3
	Wik8+pZ1EgjBjPgsgpm2ElHJVMlTB7woQ5XqI8cXrLOK8VFISrsJA1TPJG19t6cqE1+am
X-Gm-Gg: AeBDievvmRW+2GQxubH5mLAFgMlDNDLyI+uxwZUPkk8aoH37OnT3GHZSL4ceWjryPnz
	f4gA/WupZtKE91wZIw8Y1Qeu6e2jpgjQNtzohyv56I8SW8CFJRQO5e1yOmpKoiMMHWnjDVlZOy0
	5Twxe1LqP0dveLrF9ImTWTqmRi1XkkuP6M4UoDACHyX6UOed602rNso4gr5phUL/f9AlBcTZlH/
	Unk9VYEUoIfLs4ur+oA6OUgwFY/UfUj1aBMgM1UDBRr0ZEW0x7uzy31ZVkZUM8QZzab2Qqhfrql
	e/9QhB0ZFtkcO8m04zKc5ki1fXR91/059o/a+OQaTWVm7fXVsQ/NcRzGq4Z+AbOP5Nx1daMJIug
	LlTAfHf3ONjWjiBtJ+HCbnHWodeHPp2M34KCt98YC6D8+nJTmIms/rvtTZyxGW7bAYM2aCvJWCH
	VsLb0tFu/S/3Qt5NKporQ=
X-Received: by 2002:a05:6a00:a15:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-82f8c8c32d9mr18441660b3a.32.1776769003823;
        Tue, 21 Apr 2026 03:56:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:a15:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-82f8c8c32d9mr18441626b3a.32.1776769002748;
        Tue, 21 Apr 2026 03:56:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:53 +0800
Subject: [PATCH v17 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-4-9cf36ff55fc0@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768976; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Mt5/XsGHOSDEOG0ISFiVsCUEFGP0erIeLzDLMDtZnM=;
 b=WhXCZV5up4hdp1qBnIeS6UhdzvfhCV2dG1U5NQe17LczbTvQE4hMGeRKNMx/5suR89AWCGg5l
 q9Y/hhLWvOYARKtSAz+lUS/Arcee3oXJQ8LgYBAzkS91RTI8cIJiIjQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e757ed cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: nu-KMWxNGyT8vjc1cEgDHS_ZrFt_yljj
X-Proofpoint-GUID: nu-KMWxNGyT8vjc1cEgDHS_ZrFt_yljj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX4DLZhtPzP4gJ
 Zp1qrXr7+o7PB1oQIXWSi80E8TrnXJ4ExEtBUHg5TZWuz3kBjC17+YiBLrtYkcynIu3QCMx75WO
 YspWAhTW00v0sABi3RZU9/r5kEGbXt73irPEhoNmYRsME9EFiCQ1Nmokx5xDfv2bKVxWxJabRmi
 Zg87MHttME1m505lk4lhXgHb20l+iRHbm8EOTpyly/LpyAgbfVhZMzVej29EaNL62nVwgn0aN/o
 Nz4NUVcKk4MLU6gnG7IUNlv00uL4L/oFVa/ZoJ76CDHJmIqwAaYG/56X34zDCKUThZ0cDPMqgwy
 Q/WF91m8oIUBnt4KkiWGFeKGNcf8dSMFoXnLTUMKn4wRAUZkK+hT6lNoQ60ljo+qQymv1jITXR0
 xkWm82V+IgGy9jJS0misrUX0MzJGUyIu09Ash75LL/pykWx0AqjSQMjLsooNlVGD5Zvmgp3IRWL
 lbovHcz84y+L/Ex62JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210108
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103932-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D30A8439DC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index ac704617097c..bb76e7e37874 100644
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


