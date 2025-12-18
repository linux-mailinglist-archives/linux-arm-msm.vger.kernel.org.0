Return-Path: <linux-arm-msm+bounces-85656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F4FCCAD64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E23DA300549B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7865D32FA3D;
	Thu, 18 Dec 2025 08:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4hn61mK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yx/LqrHN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3A832ABDC
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045457; cv=none; b=lFFInbc40/7pc6gUnjagdXt3hNkFeQvtyaXeOvy/QuE30OOzCn4w+e8DqMgD2oGA55un3OD0RvoLMujc7ERZyQapT3t3V8uqcOgQqgTt3Lkd51TbpmDsbVKSsmZyAim8EInS6rYC+auGTLWYcPZu/bRykI4Ni8OTaTOTpEr+a1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045457; c=relaxed/simple;
	bh=xSVwvf3r4THug/toaP/HzyHA8CkwtVjVbu+nopQb9No=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qiXF2LDmNfjVQHJ4vFEQ+A0AuNcsoNM6N7fjSSh/1NJOEZS2Txx0mT7fKbolOLarM9I1tBOOpt4iDXdwT9/iKOVbsZ8tWfg8Jz5bXmwjQaffLf067cX/XjnAOe9YxM+T232OWLQfXbJWqBdHHUv1Txt5l2f3E6HOwdgPLo9MDic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4hn61mK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yx/LqrHN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YTeW680488
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ElfdZT9ZichzDq1xpO9r+/XiBQGhjmsYsOiV/qaeUTc=; b=S4hn61mK2essU7x1
	HghDeHd0vKK7YkMWjgsjdkEdRVSBgoWS3A2eXkHudflfINXBgbzIO6WHfQHBCIm9
	MVBq3Hy3sE3Wz1NunBRsElnuWUJ9RQHdpcAYyf0U7GpmfCZT9dDc6dBazIHHvKKq
	WLRmF/NTxLiTkrd/1HF1ehSsQ/uIM+ukahBf6FJXifNestH0+sTFlGJnW+ReJgXi
	rzApQxN71u6yaD0UHG+2w3m46DtX0caLyLYNIv58EPl7wZNzARZe8pD7IH4sx4tC
	6iu3N/vEOCndS73ctIKp5wlQdQzIjLQ73RZBz01LXCxkqiVpukyeugmYBby+vi7g
	XFQuEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhhce5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b99dc8f439bso870664a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045452; x=1766650252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElfdZT9ZichzDq1xpO9r+/XiBQGhjmsYsOiV/qaeUTc=;
        b=Yx/LqrHNMl4rqzrN7dCbOp8IEu2KKOiih8uqOOLgo/7WOR99qSYUJAHhifubU3a4t4
         fG9qhfFVvyiBNnVzecfsFa3rEPqJIXmg1Qxca8UZ+EmGpXObF82MzuD2uTZaZBkBjQ8a
         HifBHsMaEcDnH8e7Zq9MetbitoV9Vyft9zLAOqoeKv+thOfL6MI8g7mzYMyO8JWpxT6e
         DCwyxZD5ZtNN35AGnMqR2wfYIunxVBH1Mrxtcva0pmmuAsBY6ijMqEj43WydoesceeKn
         yhr9ItRHdy44LEGxU9BVcU3fWBVsk8m9cabIi9zGqz+JW3Tq8MjXdrZNsf8tVYbT+/Tk
         RusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045452; x=1766650252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ElfdZT9ZichzDq1xpO9r+/XiBQGhjmsYsOiV/qaeUTc=;
        b=WhtKPkAFNBhZKeQzW+2g+fD+fSPQNg9R1VRdDQ78sN5vpWnz9X+smo3774b3b0Halz
         JT6Z0LReEw9LTsgX+r6KiBJtDBp7jYXqkMhcccpRcL7h2HbEu9DAoGsVIXmoB0cop9zf
         wcWDDdHtDqgjkkRob2aszZnP2fl6xxcXmG44tF9g3ABnltqtnMT30FNnWO8lwpLtWvdm
         u+REODQT1GdPAocfge1VDguPfJImUgIRYnTkDYs+e1KpQdbk1e45eagzcT3EbfsF/XVs
         zJ0aS2eqhslfIL1O9c5gk5oAT82m1rpRhkq6YIv4sf85RIWeoOIzp/XxewMaZupZgEzv
         uioQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzh34bMfq/g9+H0uFku/OTagpIrsqH2nqDKyBN//AwBUlWKQZI/DVroYp0qlr+ADttMndgwjIs/hgDRh1l@vger.kernel.org
X-Gm-Message-State: AOJu0YwBAvOWBGrwiNVdcuBqQHDcjZ0p4ac4dR7v7QyxYUyP8IwNhjKU
	t7IBDErVt37oK+nlLO30PuZ4PgbvAya2G5K9zPkzSzOKC9qYjBIpXGzG36hcGy3wf9eUxWryog1
	TnlxMUP5nfdMrI2EjRGPbrKYAel96wQwqi0RWWlIdKRqWmRWr1pScpNt+Xurxh0ZMb8AU
X-Gm-Gg: AY/fxX6vVGKvxppHQzxuPkRghZz5v5CLpiticZM08NRGC5DCE5jx9P6HFmZ3FaQMlLS
	Ziv2o1vCR2oUCOvF8UzQ/4vHdxcRgwg1MMssieysW3giSIiKHJ0nUHy7d/cwK7D6S7z/i4FTHya
	rFhP9Bwv1ReeMA8TNPVfBpx4fFWKzky6/61coMcsZJYKqxQq6JJ8BLovi+nMZz4LaEVuTwiRvUp
	WadfCFy9DMlcydA4QmxU25Vsn1XzB0OxkI7kXY0PBIlQE8YuNhheq8jTTvnsNITESTd/RwDPNYO
	doYqNu9tnhCb0Gles9JhC+87NlfRNqeETLIebUnE5yOdE4Vgjplx57s4Oy7w4dgK315xScah+X/
	uVR4WMAPPKkCiDhap1WyMcF91q0AB5KtYAY7pUJJxYSnyT9RH3v+DqMyZJjzxCMyky0Y=
X-Received: by 2002:a05:7300:fb02:b0:2ae:6f72:f3dd with SMTP id 5a478bee46e88-2ae6f73071bmr2667971eec.30.1766045451656;
        Thu, 18 Dec 2025 00:10:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpw2qmVadrx3R/o0TSTdL4X3Pp50wTMcw51fF1QxTKisBU7gE+WXnHQMFAEexgkRJku7S+Ew==
X-Received: by 2002:a05:7300:fb02:b0:2ae:6f72:f3dd with SMTP id 5a478bee46e88-2ae6f73071bmr2667940eec.30.1766045451078;
        Thu, 18 Dec 2025 00:10:51 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:50 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:49 -0800
Subject: [PATCH v2 09/12] coresight-tmc: Update management interface for
 CPU-bound TMCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-9-2335a6ae62a0@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        maulik.shah@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=5365;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=xSVwvf3r4THug/toaP/HzyHA8CkwtVjVbu+nopQb9No=;
 b=/9hBxZh5Oxuk1NiyBSNu5X4oibJZHzow5zfIAp/BBYoPkFuENMTHG6mReTKKYRE6E3WH70Tl1
 xpME9EbqVX8CGkwTRi1SabeS+B1ywtGX0VHhQdWPM4HXR3n58/Cgb1U
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: UTFHNOuBFXFGqSeNaMAnWM9JpGXEzPXU
X-Proofpoint-ORIG-GUID: UTFHNOuBFXFGqSeNaMAnWM9JpGXEzPXU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX0bc2AyB6lWTN
 CS22mCSEP/PpF4ZZqpo71Hs0Luzq4gKwInQ3+M5xeX6aRyc9HBoEtADI6a46YhNhvp86ODzDeYB
 DFxiLnNAjbMlolo/YRmoY4HEBSbJ27sE0qIJFUlZ9F7CautAy0GoyzspPPKjCdQ67dG5Zcip2kv
 F/K70D7DWr00i7PJ+y5oNhgZA1T8doVKcxrK8oE1tlTPhWeHNPf5CLsZQzostJlbuUl25pb9sha
 Xn1pHZMfeEoyPLQT/TapSQnn+bk4yq69QxttoZ16kDsv4K/gwfF6pTpUYCUvJpe/zyhyjNOtxS3
 q7tchhwxAUwWjpqCZTGryVd6NTyACZ/ivBK0uigjzQqQ7EC2Jjs5JB7/uy/vwRjmYhz3bzt8PdP
 DjlxNs+6OVF1IDc5/QhdbRD7oxHIPw==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=6943b70c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZEnZJDymvn760SlnwMgA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180066

The current TMC management interface (sysfs attributes) assumes that
device registers can be accessed directly from any CPU. However, for
TMCs associated with specific CPU clusters, registers must be accessed
from a CPU within that cluster.

Replace the standard `coresight_simple_reg*` handlers with custom
accessors (`coresight_tmc_reg*`). These new handlers check if the TMC
is bound to a specific set of CPUs:
- If bound, they use `smp_call_function_single()` to read the register
  on an appropriate CPU.
- If not bound (global TMC), they fall back to direct access.

This ensures correct register reads for per-cluster TMC devices while
maintaining backward compatibility for global TMCs.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 137 ++++++++++++++++++++---
 1 file changed, 123 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 0e1b5956398d3cefdd938a8a8404076eb4850b44..5b9f2e57c78f42f0f1460d8a8dcbac72b5f6085e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -458,21 +458,130 @@ static enum tmc_mem_intf_width tmc_get_memwidth(u32 devid)
 	return memwidth;
 }
 
+struct tmc_smp_arg {
+	struct tmc_drvdata *drvdata;
+	u32 offset;
+	int rc;
+};
+
+static void tmc_read_reg_smp_call(void *info)
+{
+	struct tmc_smp_arg *arg = info;
+
+	arg->rc = readl_relaxed(arg->drvdata->base + arg->offset);
+}
+
+static u32 cpu_tmc_read_reg(struct tmc_drvdata *drvdata, u32 offset)
+{
+	struct tmc_smp_arg arg = {
+		.drvdata = drvdata,
+		.offset = offset,
+	};
+	int cpu, ret = 0;
+
+	for_each_cpu(cpu, drvdata->supported_cpus) {
+		ret = smp_call_function_single(cpu,
+					       tmc_read_reg_smp_call, &arg, 1);
+		if (!ret)
+			return arg.rc;
+	}
+
+	return ret;
+}
+
+static ssize_t coresight_tmc_reg32_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_off_attribute *cs_attr = container_of(attr, struct cs_off_attribute, attr);
+	int ret;
+	u32 val;
+
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
+
+	if (!drvdata->supported_cpus)
+		val = readl_relaxed(drvdata->base + cs_attr->off);
+	else
+		val = cpu_tmc_read_reg(drvdata, cs_attr->off);
+
+	pm_runtime_put(dev->parent);
+
+	if (ret < 0)
+		return ret;
+	else
+		return sysfs_emit(buf, "0x%x\n", val);
+}
+
+static ssize_t coresight_tmc_reg64_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_pair_attribute *cs_attr = container_of(attr, struct cs_pair_attribute, attr);
+	int ret;
+	u64 val;
+
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
+	if (!drvdata->supported_cpus) {
+		val = readl_relaxed(drvdata->base + cs_attr->lo_off) |
+			((u64)readl_relaxed(drvdata->base + cs_attr->hi_off) << 32);
+	} else {
+		ret = cpu_tmc_read_reg(drvdata, cs_attr->lo_off);
+
+		if (ret < 0)
+			goto out;
+
+		val = ret;
+
+		ret = cpu_tmc_read_reg(drvdata, cs_attr->hi_off);
+		if (ret < 0)
+			goto out;
+
+		val |= ((u64)ret << 32);
+	}
+
+out:
+	pm_runtime_put_sync(dev->parent);
+	if (ret < 0)
+		return ret;
+	else
+		return sysfs_emit(buf, "0x%llx\n", val);
+}
+
+#define coresight_tmc_reg32(name, offset)				\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, coresight_tmc_reg32_show, NULL),	\
+		offset							\
+	   }								\
+	})[0].attr.attr)
+#define coresight_tmc_reg64(name, lo_off, hi_off)			\
+	(&((struct cs_pair_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, coresight_tmc_reg64_show, NULL),	\
+		lo_off, hi_off						\
+	   }								\
+	})[0].attr.attr)
 static struct attribute *coresight_tmc_mgmt_attrs[] = {
-	coresight_simple_reg32(rsz, TMC_RSZ),
-	coresight_simple_reg32(sts, TMC_STS),
-	coresight_simple_reg64(rrp, TMC_RRP, TMC_RRPHI),
-	coresight_simple_reg64(rwp, TMC_RWP, TMC_RWPHI),
-	coresight_simple_reg32(trg, TMC_TRG),
-	coresight_simple_reg32(ctl, TMC_CTL),
-	coresight_simple_reg32(ffsr, TMC_FFSR),
-	coresight_simple_reg32(ffcr, TMC_FFCR),
-	coresight_simple_reg32(mode, TMC_MODE),
-	coresight_simple_reg32(pscr, TMC_PSCR),
-	coresight_simple_reg32(devid, CORESIGHT_DEVID),
-	coresight_simple_reg64(dba, TMC_DBALO, TMC_DBAHI),
-	coresight_simple_reg32(axictl, TMC_AXICTL),
-	coresight_simple_reg32(authstatus, TMC_AUTHSTATUS),
+	coresight_tmc_reg32(rsz, TMC_RSZ),
+	coresight_tmc_reg32(sts, TMC_STS),
+	coresight_tmc_reg64(rrp, TMC_RRP, TMC_RRPHI),
+	coresight_tmc_reg64(rwp, TMC_RWP, TMC_RWPHI),
+	coresight_tmc_reg32(trg, TMC_TRG),
+	coresight_tmc_reg32(ctl, TMC_CTL),
+	coresight_tmc_reg32(ffsr, TMC_FFSR),
+	coresight_tmc_reg32(ffcr, TMC_FFCR),
+	coresight_tmc_reg32(mode, TMC_MODE),
+	coresight_tmc_reg32(pscr, TMC_PSCR),
+	coresight_tmc_reg32(devid, CORESIGHT_DEVID),
+	coresight_tmc_reg64(dba, TMC_DBALO, TMC_DBAHI),
+	coresight_tmc_reg32(axictl, TMC_AXICTL),
+	coresight_tmc_reg32(authstatus, TMC_AUTHSTATUS),
 	NULL,
 };
 

-- 
2.34.1


