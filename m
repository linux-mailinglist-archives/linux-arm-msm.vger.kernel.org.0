Return-Path: <linux-arm-msm+bounces-85653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCFACCACD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A167304846A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC8432A3EB;
	Thu, 18 Dec 2025 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBLg08Ys";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VHq2Bmqw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544CD301002
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045453; cv=none; b=Jyu57GmVuCUwC2T5LXJNCadcq3emVpV1ZyJajTnwIMHCqR4U40OHrJq1ylpD8MMDPtC117haS7TS9vTpjCFSx90kHKw47LrkwK20+cwunv4r1rqqzJ/Y+S+njwnWTLs8xGyCcQZkylnE00u2GvgR8pfjhsLVYw8pJ52lmQgxKeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045453; c=relaxed/simple;
	bh=tRqkZYK4AglbLGklSYzp72IT+4oELHjCcHihOb5pY2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9n/ozdCalQ/YzoZ2zvvZHI86VJM3etMbmJZyf0vVyhDr+GumitrgTl6fgmW6zGvjf+ZCex0+qnmZ88fR4B+ebWBz+WcmkU4DvglDMShPwA2YuFwMpXj4G0tt4m4O9FQ6SqVQsOqZquWqGYPvI4zK5i4wyg80N74TTqqOSsST4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBLg08Ys; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VHq2Bmqw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI3appx754967
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eg43gO5IN/UjjpccjnXvQXg/c+wJgC9BW73EUBjlyfA=; b=SBLg08YsXHNUIl+4
	l5gv6N7evKFihkwLcZf1ftil72z3Xh34Wbq2p0U7Z/B6H8jR3JuUCJR8IqoNRw1P
	r7KRh7XsKb80WKT+K97rRXI9MM+DgegYt7txwxlx+mdzi+LOhzbFfnVKuUTWkmeZ
	tOObqJScGaxGs9McEboMv8ZvZ/B1seqkN5ulv9kGPtzYWUmZW0vv6+pEKYiN0yNi
	xAv6WI3hE2jsQoiwUvMjPaNy/lqnRiEANKNiOmeuLYT3hfcPJ/4yXrUj8dRNs97e
	euwCW4umtfob+KZ9djFg2E8XvgESZbvpVNFiMFptGtaNQYug1rNR7clzj16vVTUY
	kotT8Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b49v0rppc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bddf9ce4935so404607a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045449; x=1766650249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eg43gO5IN/UjjpccjnXvQXg/c+wJgC9BW73EUBjlyfA=;
        b=VHq2BmqwE5NxZ6S4n4J5VTjf6ljSRyuS9vDWSdfckoJTYnLeNX4CJyDzV/mUd9OW2x
         0t4PKmvWU8Lj//973f9zInz4ypuF+ailf5JHhIvFs/Vxvhfe/1RPxiYoiVM5DS7H4DjC
         jO40N1U1LdVkBiTOpNZwXGgL5kgmLx22aeCsVdmd75HKB1tb64z/1iuA97SVTxTQZlXN
         66bX/pAS3X2qo/9z2XeF0ehIzErJKD1hWGcB1e6nsqO2x8hcUind/fy2EsssSKumr28q
         HO+NOVYIsMIB144IBU7UlgBawvxYFI5hs4mW2SkZzY3L4GmWl6CoqesudgAyH0PPZjqm
         d+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045449; x=1766650249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eg43gO5IN/UjjpccjnXvQXg/c+wJgC9BW73EUBjlyfA=;
        b=WgpZMtt6PZRgTj3/ZgvUNcoCm08SHZgNKD81YusDHSDWI574/rFD5ucrCsd7sqofeW
         ZZK85XGrrHSTcKJW9FYjCMgUuAfVOWpEzCxDNB2j+mUb3ERORMUUlPvRse+fOaPBjrWL
         SWld+STWVz0elIxeAzEWM1ZXCEM/DHb8FZcrYJGndyyGjm/33IiEJnmOjy3mpwdlnN++
         mDrfAU9ljd54OydtZ+KUzuwlKPfbS69DRteYAoif5vFl7Da1BhcDBVw/Gl1k/dY5XxoH
         85G2mCiCtJD9IQjk97sefvn8RQlctKHWt3tWZoabK7S4/QhwwULZTv86TbGC1/z3u3Y2
         Os1A==
X-Forwarded-Encrypted: i=1; AJvYcCUJkSdLcQpHeTC4Qhsq2oTfZ2nraKHbEN5uVpK/8SLXdx+MiLjZE7kubMFNXxKXL1b7K1pOO/hfLJzWK2Uo@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuwb3dtkxFp1AhOhwPZ1zga3er5zO/vswTpBULS2m9PvhEAz5R
	L4M301mOtAdWhdPyrNMASJ7GvBTq0uBB5I4SLHz4pSoZ+ZZ+wpj0dFjLV/dDqqXBuR63oM4JYZw
	OoTHCnX3LRqYl2qbBDXqOm/Cqi1fFBzekZ6CSD0GmAnA8YFwBzFXi69O4pAcSOrEnvQsV
X-Gm-Gg: AY/fxX42I0zJJWVJYPvXxw9pyX3e/BoCTkLNa8zHSJ0mPQzbSD0EDZxxDVFHkv/FmqV
	Qa/CzLm+5qKerlR87c6sc5UZqnYj0/BVNDrwVdMFqNOXZYf6rO3gbjMmEuaTzLgTOFlT2naY/hv
	vBeO6o418OdRrQs9wMguJWVNfqEcu9bdY4DK540iFGTEB4f3cZ2wlWkx3GrkQcNpX9ccvqz+xPB
	LqGLDVProunuN8FmwtXjIoiBzfF+Y4Z3T9YJRCOYFdX5CbxCcG6ODoOH+dGXvGEcffYEwB3E8k/
	g3suqyRM2Dj4HKyTOwWgiGz5Jp2p8p09M8+XzWVpEe6c5WjwUYFuHmsYj3VBrZxv+uP8+h8FYLZ
	coh/bYRKO4m4gZAISX5lkslMSspZhj6Nja5xl6PRNjNZV9bB12HCd2lJKW5FSTTBuopI=
X-Received: by 2002:a05:7300:80c4:b0:2ab:8ef5:df2 with SMTP id 5a478bee46e88-2ac303c722fmr16589733eec.35.1766045449058;
        Thu, 18 Dec 2025 00:10:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmbDEU236FJEUDpNRG5Jnhut5mfBvSeCnLbWolEmv8DckqJfmhebTUwJmWEge8k5cfmSwZww==
X-Received: by 2002:a05:7300:80c4:b0:2ab:8ef5:df2 with SMTP id 5a478bee46e88-2ac303c722fmr16589691eec.35.1766045448366;
        Thu, 18 Dec 2025 00:10:48 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:45 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:46 -0800
Subject: [PATCH v2 06/12] coresight-replicator: Update management interface
 for CPU-bound devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-6-2335a6ae62a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=3386;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=tRqkZYK4AglbLGklSYzp72IT+4oELHjCcHihOb5pY2E=;
 b=n9/JjWbuXWrmOZTTtygtYUn0byxKNWiKgxpoZO5xT5JsIF+Rk4mW38XCk/mXYP6jUZBV6KTf3
 k/zADsYz0ZoAieyGH1MR1+vQyduL1eJwzebcOgQtew/FlnhwS46WQa6
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: vKdSCIPg0FooMXvBlyj8YNOhoVxBfIMz
X-Authority-Analysis: v=2.4 cv=Q/HfIo2a c=1 sm=1 tr=0 ts=6943b70a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5J7XQuhJkvlR0EEfeBgA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: vKdSCIPg0FooMXvBlyj8YNOhoVxBfIMz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX/H/Upe60zd9k
 hlBGv1aywVWBKMx3/ibvpaiYVYMNQnFcgpsVZm0Fz1/4iYxk+DA/nD4tjlmw/7Pmrilwi9eySyl
 UE1SQWZKqKW6jtoYeWGtoGfEhMGXW2ChYRx/6kT5A+U9Bufe0eEzMrtVAZYO3pf69ZC4O5KTL2K
 1fcX+nXzxc7FRzd9xrk0Z/Vlmeyw8Dm2QqdDuT+wm692XliXMPLM6Ya9BSCnGI7HRFD3KSi4JVG
 q1aFDqGu10yO+Vg/BMuW5wgubxfMHPa9L6eGPoCQ5A+pGR6RFxSNGRjiM0aqTloAzngEkqvVLMV
 vWvZ6C+2JOAt25de2HnyOpLnKWlCkqTxWFcYCXiSMXcv4V/KmPcdQSbA0z3w0tLyANk592g5TGK
 59yG8mo66s0pQYTbv1wh4T9HMzPRZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066

Standard system replicators allow direct register access from any CPU.
However, replicators associated with specific CPU clusters share the
cluster's power domain and require access via a CPU within that domain.

Replace the standard `coresight_simple_reg*` accessors with custom
handlers (`coresight_replicator_reg*`) to support these devices:
- For cluster-bound replicators (indicated by `supported_cpus`), use
  `smp_call_function_single()` to read registers on an associated CPU.
- For standard replicators, retain the direct access behavior.

This ensures correct operation for per-cluster replicators while
maintaining compatibility for existing system-level devices.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 61 +++++++++++++++++++++-
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index f8d13894098f1e414fb0da8d6eeb1da4f0d55a8c..a9f22d0e15de21aa06c8d1e193e5db06091efd75 100644
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
+	if (!drvdata->supported_cpus) {
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		val = readl_relaxed(drvdata->base + cs_attr->off);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	} else {
+		arg.drvdata = drvdata;
+		arg.offset = cs_attr->off;
+		for_each_cpu(cpu, drvdata->supported_cpus) {
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


