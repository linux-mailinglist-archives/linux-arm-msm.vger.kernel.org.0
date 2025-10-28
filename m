Return-Path: <linux-arm-msm+bounces-79110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AE6C132B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 265C9587EBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFEF2D3EE5;
	Tue, 28 Oct 2025 06:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dej40s/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C912D2390
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632906; cv=none; b=qefGYOJrPA5WB3wzqzi4cnID0mezvpsRP44BuH+fMHg13wGnmXnoPvQX1pKJf9IiGIZ4wLPudHwLglqyAVw7erM7rpHxx9zngJKUYVwnI6MBpETy51VlFrXfPAEu+LJ3qGGXtgsMG+iOGL10gbwyksEcUUjo38/rui+5kBz3IYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632906; c=relaxed/simple;
	bh=wrtq8428nZWzeJ2YM87p20K7H7FcxcHonAVQhsF4btU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=godgmWP1luIpK5xkD1UrzUnrleSGv2uhs6NYsOrzB5bOvtvZx+AquFC9pQN89PH0mKPZGfk6PnzgnLE9FkkeRvwX5Jr6UXBhjvLM09FrSwi2ABYNYrdCdO5s93aee3vUVSp8dug81MLmPIFCBrPTwzptLyEmjHGKZJyekyqJyFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dej40s/T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RKkUf53813900
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OpHBCdnSgFY8OByltD72t3aaSdewiYsQALJgMeWf4do=; b=Dej40s/T4ejdKCM9
	atjVzQatQQfbPzKOIX3fNhPGTrliYcX+bZT8Ki7uAbDa5kvKLjtaUl4q23m4OThz
	kBwcAAL+THzCNe6y0w8f2umsED9JCQpO9nLvN/OB8jgRgUhE2yY9QU1/Spzac0Mo
	fnbyf4bRZ0N0uAP5lbcnh5Vj1JNYJTfQbZN0KdfgF/qnPKG2qpPtWvTXaJAWTEdp
	XbZU5ElKS9iV9yJV6B/FqM/AkoCIQy/8eqCe7u9zseRBKEu8VsanKhIT70oBYT4U
	BUZKUKfjTuWjdmt/BICkN7qzs/6Z8K3/KsX2fAu0+1QVPnr8qxa5dXLCI90aiLMu
	l0XyUg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2g2fs9p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290b13c5877so115051335ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 23:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632903; x=1762237703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpHBCdnSgFY8OByltD72t3aaSdewiYsQALJgMeWf4do=;
        b=FyhqNhsRqZGEP6/IAwv0FUPIpp75vJnK+1WVhHOZd7ef8j1LspvzTikydJ8g53bCHg
         bgtRb75IMoxBKFV0p6nDKOeQblWvcoTT5Glaj53wxTbVFYIhflLgME7xiRV41+Zzcds2
         pss0NRPhy+0BmLuvBYzr9m0wvVCslTp9HPOfAJKf4PCFbIT8L/k9FLQ1/Q92/zy24gtf
         dnilBHmaQEyV4ihMSQhrxgoZhwRlinRGn/QkWO9v9MDZf5c/RC3M6qiyUIwiq0wf0R0E
         22YUkvfYTqY9Goez2O+Lhw3SZARUnQv498GxD0WCDIIGIesUs4JdLdB558BKcVERd+rF
         3yjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSPrPtqftZCzFEiZe1v87x4jyHFiJ8gWz2jHsI2irFtYC/SKr+7Oj9DRulB5RGXyACsJDYC8OFIHaewGHF@vger.kernel.org
X-Gm-Message-State: AOJu0YwSquGY7o8iqhVTGUN2R+eHm5YmsaOJU65TvDVL7D4hW+Ly1xtj
	pRglyOpKhNtN64CM6kMxyflb/Ke4Wk5Qvg2r1fbexqwpC5/jNgiaHeKXdECohH6ZaH/ArT2nXhd
	1bGCsuQiBe2UPU5yNtUBFoHGe9d+Ra1NP2hSa+qsacPtrsQHNjY6pGb58rXlY5DF+/WWy
X-Gm-Gg: ASbGncs542Z2j0wzq0zZXWEzIhLsDGToncL/eWzXHTIqBEXUbn05vskkM20Pb7/BeLy
	8or4i99VFrGHefGNmukpzt2Rahd8DPmr4eo9xbTF4sfyVJsav8ol9BfvCw/tQiCeHalbxeLqG13
	acKoViKQ6ycpcjqiYFejL2ww52uJiE9FUyn1n3j3Mv5BW33dznC9lTpSY31SdIEVEtoO1CfUBTq
	9UFahS51PqPjXnD3KW9Eikyt1BFK8RVeJ204xhaEb+vykhgWakkV2Po4IsMvPvYs2rNcX+0wr/A
	TfwFihH4midjnATigFScUqCgYbVfchD2p/HAXi4Xm1swl261pyUTjNmjO7KBSMlNJZzD5iewNaJ
	XgR0ysYl/AlhyxOxKyCXY815x+Y2mv1g0O87uwevTXW1kSo3BhgF4Dlaj
X-Received: by 2002:a17:902:c943:b0:272:a900:c42b with SMTP id d9443c01a7336-294cb5064b2mr34400675ad.31.1761632903380;
        Mon, 27 Oct 2025 23:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwpw5M+tATyrDto8FoONGgcMqSPhAZcuLevcTVatT/4cowXARX69BX8IDLgj59x34/zI4gqw==
X-Received: by 2002:a17:902:c943:b0:272:a900:c42b with SMTP id d9443c01a7336-294cb5064b2mr34400235ad.31.1761632902853;
        Mon, 27 Oct 2025 23:28:22 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:22 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:08 -0700
Subject: [PATCH 06/12] coresight-replicator: Update mgmt_attrs for CPU
 cluster replicator compatibility
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-6-31355ac588c2@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=2874;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=wrtq8428nZWzeJ2YM87p20K7H7FcxcHonAVQhsF4btU=;
 b=n1XFP/EYxn0Wrkm/FhLrkJPZ1Y/amwYC2N3lVShkOdDVseUu8Y5JQriQZy2P5STM6yEHYntwF
 /iWXOi7L3MICOcvUcKbift/V4Hvz+PTq/q04qbju4hzYZurophy3iDJ
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfXyE5BnYqX7KQQ
 63gcG8OuvGXeU1bAd16LJEZss8Ga3h1fJaQSzjHUGK8reNcYLpv6qeeKQTVv/lWPDNsTlbEOPkX
 5cr7pL0hZBv1UGBnUwnBbMPobCy3JtqcqLi3LhRbH7WwT2DQqR9cQJC0UjzHbqymLSzPxv4qwvE
 HkZolyo4VuZBRT8VgfM+Up5hIDXHpEA7RHaHPEODR5HVOnyeDyqlRBCWHGHCmqqntYkz5tbVwRL
 TMbYaAQIooprE4FGAem8mFCLKJIyfLW1Wo1DhWZL6g0kQY7NnUVNe+2W8cgQNhvKgOcsTpUjNp3
 rEhSRmGqjT535UiwGXv9xrhXM7BBGaLWvYvvAb/0+anz3EUMto2RTHY8CpbEqd/Rk9hj1u3nmOq
 R7CRpJrKXWEesWuOVAMmOrsjvWqZQA==
X-Proofpoint-ORIG-GUID: q6wtbBJXwt7afkjNKflexqm5ioODlJ6v
X-Proofpoint-GUID: q6wtbBJXwt7afkjNKflexqm5ioODlJ6v
X-Authority-Analysis: v=2.4 cv=FIMWBuos c=1 sm=1 tr=0 ts=69006288 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ViDxg2sRvTZTAOTQKJ0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054

This patch refactors the sysfs interfaces to ensure compatibility with
CPU cluster replicators. For CPU cluster replicators, register reads
are performed via smp_call_function_single().

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 61 +++++++++++++++++++++-
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 1dfe11940cd6001db3cf17249b0493027b65e19c..22c9bc71817d238c2d4ddffbb42678bf792b29af 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -58,6 +58,7 @@ struct replicator_drvdata {
 struct replicator_smp_arg {
 	struct replicator_drvdata *drvdata;
 	int outport;
+	u32 offset;
 	int rc;
 };
 
@@ -286,9 +287,65 @@ static const struct coresight_ops replicator_cs_ops = {
 	.link_ops	= &replicator_link_ops,
 };
 
+static void replicator_read_register_smp_call(void *info)
+{
+	struct replicator_smp_arg *arg = info;
+
+	arg->rc = readl_relaxed(arg->drvdata->base + arg->offset);
+}
+
+static ssize_t coresight_replicator_reg32_show(struct device *dev,
+					       struct device_attribute *attr,
+					       char *buf)
+{
+	struct replicator_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_off_attribute *cs_attr = container_of(attr, struct cs_off_attribute, attr);
+	unsigned long flags;
+	struct replicator_smp_arg arg = { 0 };
+	u32 val;
+	int ret, cpu;
+
+	pm_runtime_get_sync(dev->parent);
+
+	if (!drvdata->cpumask) {
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		val = readl_relaxed(drvdata->base + cs_attr->off);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	} else {
+		arg.drvdata = drvdata;
+		arg.offset = cs_attr->off;
+		for_each_cpu(cpu, drvdata->cpumask) {
+			ret = smp_call_function_single(cpu,
+						       replicator_read_register_smp_call,
+						       &arg, 1);
+			if (!ret)
+				break;
+		}
+		if (!ret) {
+			val = arg.rc;
+		} else {
+			pm_runtime_put_sync(dev->parent);
+			return ret;
+		}
+	}
+
+	pm_runtime_put_sync(dev->parent);
+
+	return sysfs_emit(buf, "0x%x\n", val);
+}
+
+#define coresight_replicator_reg32(name, offset)				\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, coresight_replicator_reg32_show, NULL),	\
+		offset							\
+	   }								\
+	})[0].attr.attr)
+
 static struct attribute *replicator_mgmt_attrs[] = {
-	coresight_simple_reg32(idfilter0, REPLICATOR_IDFILTER0),
-	coresight_simple_reg32(idfilter1, REPLICATOR_IDFILTER1),
+	coresight_replicator_reg32(idfilter0, REPLICATOR_IDFILTER0),
+	coresight_replicator_reg32(idfilter1, REPLICATOR_IDFILTER1),
 	NULL,
 };
 

-- 
2.34.1


