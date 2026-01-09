Return-Path: <linux-arm-msm+bounces-88220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BEAD07DFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6819630216B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605B1350D45;
	Fri,  9 Jan 2026 08:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNrQNYhD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6/08o44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3543350094E
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947923; cv=none; b=CohYDHksVJyWrnSiD/yzYsp2+3G9ijps2EkYaB5iwC33qbRRiDocmXYUQ0qMJmrhm2fCAmVIW0MpMO+8d4ChWPMPdptCL7G91ENwMkAq4PUiArtKbNimy0sxp+z1GVGbYqO0X0WN+KYlEQabOIntIeZ3gVV/eQzr67MT4bvAdjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947923; c=relaxed/simple;
	bh=SFg8p+MGJu/pcBjr2+xQMDaMLDsDXsWe/78KeIoHXtU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K4fIHD2lwEv5RFuBCh9TBkir9ozmetycR83hUzhYSkyYstR8CQsAygY56U1zVuPz5ETBh0FpGTiM29PGD0BRa8GQ1wdbRIEb1fD+4g0BtzAoUyMgFKPYlY1dRZm9LjmLXYBeAYbTceoErWlhinpx3xdBvpxxF6i4h4jRCjBcHUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNrQNYhD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6/08o44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6094vaou2765703
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 08:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VOw+HSEIpW3
	EZgI38fHqxZSg7dj3NJr6PsLdb8K0mHM=; b=JNrQNYhDBpVwiiwB1sqPHOUpks3
	OhTbdyMQLvugnPpKoN+4CDjdlseY1dLyYBTbUJMTIuaLiNZiD6Lzng0jZaC3aFZD
	JGAk+XQDVRvApY0WYmARBIJEV5iO0+4FeifTrCn2Wu9omqBZah2PdMsdXxJ4dfCY
	onPb32EJhJXtks0I8cI1hXHwpYPyER1Udaj5nTq6htwgEUOqyoPziqpDvMdy2trP
	BFnK5hgYeoC4MTNmhJ3yML/rJx4/rvRNQTkP/y+Y8bxpSZJzMved/aurOBmXuaTH
	bcIIJJ2pZnsD5jvQLqpdKNFVijG5ucNY+m0wMAfCtWetjBmFUav6AJY7k4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfejtmvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 08:38:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e2342803so1019292785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 00:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767947918; x=1768552718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOw+HSEIpW3EZgI38fHqxZSg7dj3NJr6PsLdb8K0mHM=;
        b=J6/08o44iD7dKIvyoJdl1aNAtIyIxcn8CF3drilrUuHCxN6UtXgh26d8uAjQ2OCPIZ
         7XQ1LfEPhcjng6IEx7VUcTcgPdVEKd7ifVW46dj9TBb//GbiM26u6P29vH6jyMoq8mY3
         d8tjM5stgFuy9Mrz73giTS08iwKOM/8+TEqK0Ac74TO7K09lZvx31GY5URMuttR2I2lF
         nUhUNGO069qXA1pYtplSwnCgV8fClw5/92kyEXSgtbI2xpYEWbPEDZENrsfZiJyCD1T1
         PEAFpWeDVrQO/3nkjBQwgGt9id60U/yCGlu2p9GONzcKZ2Z5Y2mXNOiLfM5mKUbxMr6j
         CyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767947918; x=1768552718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VOw+HSEIpW3EZgI38fHqxZSg7dj3NJr6PsLdb8K0mHM=;
        b=ICFegoxEBedAHONcIcRCsARyPWNlzJBsh7uwiqCYWbrdCjqeGoyomH+jCgFszckhBA
         BoDJXCtdaCixyYzcHowauLiNnSkQ5hV/UP3Ia0Dn5me7LWwq2LHuML3kCuxQKMNH2xg3
         kBWvXqWTDXKBYXbSLrk2Yix6d6sFm6vV5jYH864ZhDKfIVOrPKudxlOhp/pGPHn34Rzd
         KdSXOYsD3GYUNdV9lnmWcax1lDO3JYR7rmKeq2KVQOxPLrqRW3k55HZ1TlnhieOb5Q94
         nIdwSe4payRm0uwxUY/Xct68dli1Z679HQqh0JOae09FoDp6EmP4TmwLq50+f6CmMjiA
         /Zkw==
X-Gm-Message-State: AOJu0YxxODpivQtTsq0n2/Cy6kpfIh20JdkeDGu1L++aSQprya4vIy3/
	LvLD5T1NdJ9WKio9MVrZrAqR1jyCVh0SD+Fb8W/qET6SGmz4IkW8jRu6zGVQTwlghbVgFb41LlD
	4h6yabhK+GUnYlltF+lzGJRehO31fctwjtArOM1y19qagw3uzwYd6XSy9WOywJVCZU079
X-Gm-Gg: AY/fxX5oSX+tg1HPT5nWQFgy+PorAiKP8ja/PmK2ldK7oY3gORSWcMib1zJwJjtIYGX
	KJj/MFFdyxblVzpMCjodY/Ble8BnOmWcnIeBMyRLeaz30bGzYhuUAuktQSlYAS9asNGa8slBk9P
	RSkVkGVYCharh8WOhomXk3Lr026VueZ3HJzErJonj54GTlHsWKUMI60lk501LSoCr3CAtSgXUqD
	dKAmzi9FLFHP2wRl1L0yCJfxNNChGyw8Lst+uJ3YvFvfaSiOjuWFoSLZCSE1od9Vv6ril1h7v8M
	PtC+J5ukvYrL0x3X1/JBjyH0QAVfwmKXHgFDsX3ZFGyZzUyDapOPjsttwtC+5RjH9pyU1T2kg5v
	UusgLPzcstGcOHEHxEJ7hnh7BGr6UcNwxoY42N8KsBxf1JcDuz5pN2p2QPzRp2P7w3ts=
X-Received: by 2002:a05:620a:25ce:b0:8b2:f228:ed64 with SMTP id af79cd13be357-8c389368dfcmr1185735385a.12.1767947918342;
        Fri, 09 Jan 2026 00:38:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCZO5Wi/FsGcHzPlNSov7HprfEwEMTeHUZ7wBJ/nClRodC3/gGrAUB5KTuE5/GI8+qgWKpWg==
X-Received: by 2002:a05:620a:25ce:b0:8b2:f228:ed64 with SMTP id af79cd13be357-8c389368dfcmr1185733485a.12.1767947917875;
        Fri, 09 Jan 2026 00:38:37 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f530c35sm771262185a.40.2026.01.09.00.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:38:37 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Date: Fri,  9 Jan 2026 16:38:07 +0800
Message-Id: <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XyHGOaC-P4i7U8blqJpCca19erGAnYmp
X-Proofpoint-GUID: XyHGOaC-P4i7U8blqJpCca19erGAnYmp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2MCBTYWx0ZWRfXyFLcVc0kiiRA
 Grscv/xWbbhIALNWfdKyxwd1AZg/osAUlSiU6WhPDVmIc1DcceNUubbH5y3fleY4c3rE1q7Cnzy
 Q03uyKzBilXLhNjol25/Gb4XgrMT521cSuI11EkRGrhcBunZPyyAmx0H2jiXnwBd6a2Ioad0y2K
 Z24qz402oEsptmAcJ3RYHjKARJNl/tr487penoEMUj6yy+FiUPBbBcQm59w/oNQs6Z+CWgsCSvA
 EggB7Rd5rTHLu4XammkWEqcLqEV/hzVKU4KUfHSx7lKKdEKqwV+ClkWc5bsPluP22UBX8+t85SK
 OEAIdqJjBVZQaztikhngCHIyKvTq7IBkPhcC5mYiumFaQhTgNf9n9POY3QbDRDlxT/oTMd4BC1c
 sDuXxS0/HX/a+S6htCORdT1VLQt2aQ18dY2LNCDsrk9SUxmEC5zrgTRMrsk8Zz3O5Ici4zJsddh
 NFKlbs6u4ytpaH9Rs4A==
X-Authority-Analysis: v=2.4 cv=ZfAQ98VA c=1 sm=1 tr=0 ts=6960be8e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VW4z5CC6hlf1mp1b6PkA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090060

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
the MMCX rail to MIN_SVS while the core clock frequency remains at its
original (highest) rate. When runtime resume re-enables the clock, this
may result in a mismatch between the rail voltage and the clock rate.

For example, in the DPU bind path, the sequence could be:
  cpu0: dev_sync_state -> rpmhpd_sync_state
  cpu1:                                     dpu_kms_hw_init
timeline 0 ------------------------------------------------> t

After rpmhpd_sync_state, the voltage performance is no longer guaranteed
to stay at the highest level. During dpu_kms_hw_init, calling
dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
fall to MIN_SVS while the core clock is still at its maximum frequency.
When the power is re-enabled, only the clock is enabled, leading to a
situation where the MMCX rail is at MIN_SVS but the core clock is at its
highest rate. In this state, the rail cannot sustain the clock rate,
which may cause instability or system crash.

Fix this by setting the corresponding OPP corner during both power-on
and power-off sequences to ensure proper alignment of rail voltage and
clock frequency.

Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0623f1dbed97..c31488335f2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *ddev)
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct dev_pm_opp *opp;
 	int ret = 0;
-	unsigned long max_freq = ULONG_MAX;
+	dpu_kms->max_freq = ULONG_MAX;
+	dpu_kms->min_freq = 0;
 
-	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
+	opp = dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
+	if (!IS_ERR(opp))
+		dev_pm_opp_put(opp);
+
+	opp = dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
 
@@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
+	/* adjust the performance state vote to low performance state */
+	dev_pm_opp_set_rate(dev, dpu_kms->min_freq);
 	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
 
 	for (i = 0; i < dpu_kms->num_paths; i++)
@@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 	struct drm_device *ddev;
 
 	ddev = dpu_kms->dev;
+	/* adjust the performance state vote to high performance state */
+	if (dpu_kms->max_freq != ULONG_MAX)
+		dev_pm_opp_set_rate(dev, dpu_kms->max_freq);
 
 	rc = clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->clocks);
 	if (rc) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 993cf512f8c5..8d2595d8a5f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -92,6 +92,9 @@ struct dpu_kms {
 	struct clk_bulk_data *clocks;
 	size_t num_clocks;
 
+	unsigned long max_freq;
+	unsigned long min_freq;
+
 	/* reference count bandwidth requests, so we know when we can
 	 * release bandwidth.  Each atomic update increments, and frame-
 	 * done event decrements.  Additionally, for video mode, the
-- 
2.34.1


