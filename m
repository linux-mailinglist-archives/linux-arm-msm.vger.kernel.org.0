Return-Path: <linux-arm-msm+bounces-107968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEzfF0h9B2p45gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 22:08:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D76DF55748F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 22:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A20393025146
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E8C37AA81;
	Fri, 15 May 2026 20:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm5zPgAj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vh6Y8gMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627BE391E7E
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778875699; cv=none; b=c7YLyVEmC2mWLh6219/a3GwewI9NeW3fXJ6wiKu1R0A5QhdSUviOEIQyPzVQ5GKehEXLsVrJEO+nI993M6QCzyIr9q7L/xQBk+x3ca/L2pFQxOpDlKxmQpT4NmqWmlgzoeAO/IaKhrJ7jdKP+shAVINHLUvjhC5DtSzMQPavfaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778875699; c=relaxed/simple;
	bh=FF4ikNxmqKbxzeVlDwEnNmtDy9ypLTHAu+k2VdryIes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhA+PdafEfR1qEI+xf2dbrMwZNrqS17s6uH0RueTvWg8wt7vA2SdJYMxoiJbYAdPNl03EU3QodJd0o36r3e/BgfZbXCPETHHMdCLoUISsLPaRxDIa8KjtzIqAvsYk7CmRx0xyOVaRqmRe3Q2Y2JqdAXS7EBu9vZE7HsKrrGpou4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm5zPgAj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vh6Y8gMa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJfGNW2566236
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/na9U7CFhr7n8Z29qnWp4dlEpUEJzoqhKfGCJnPabJU=; b=jm5zPgAj7jDzpVI9
	r1gVm7Tg5yJnwK6qab0157oQyr/Bgv7mSV1ff+v4JDNj6QvBzMamyxyXzT2YHZu6
	oaVoDLUlMNnaz7Yf/M2CUZIuzt28FG6fRpXYigTi3whXgDzmiW3imdLZaP4RkM2+
	Fi64Yf4Bn+EBHqOhRvr3KDnmJKeAscbh0G8TIf6kNWksgySuLEUmz/Bus9QRo0Qw
	7B6qwD+UTeqnq1KXI/l7hi269mINPztCPQ/56NFQg9BmdCam8G1MI3Tdbkqqh8B4
	2JlkhyvcHjrrZk9TnGbrgnWFliUXtIEpGSe2t95wFghVy3akosY/xCXm2QcsSQWj
	GByrOg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vcsea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:08:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366122e01fcso114452a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778875696; x=1779480496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/na9U7CFhr7n8Z29qnWp4dlEpUEJzoqhKfGCJnPabJU=;
        b=Vh6Y8gMawrjEDtCgpTBag/LdslHQLXW31WIIjRndZSEjeJ8NqQGFr7pZvt7PXv0byR
         fZN4lEPwh5loqYdSbvsihxVRj2Jz4ph8Whfgn0BV8uUS1cqymQv3PGt37rKB1K3yPJm2
         YTXeZCzbn7FkUBoOm+fUm0Gws4hiKEyVJZhgH94k8fZJyO4aNzeheXFaBXz7gv2AShrw
         /yymK3RLD0/n6BgPvU0d/IP5BWeqzA9ZAaGQVMiEh96igvvPmdyEHSwYncTERDMH9E7P
         V42drGL23B2jgusyK+D1AGKNgeRj517tz13lcLZW8BY9PpfsFF3SgShoCeZMy0f55lOi
         BjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778875696; x=1779480496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/na9U7CFhr7n8Z29qnWp4dlEpUEJzoqhKfGCJnPabJU=;
        b=fIzRGdAq6i2tdlYs7adgSDeWAAckxUTZDI3Bs9BIRuGrRmp70fAxjTQdR9QCtSeC99
         7UqJsiwFcj6Tp14NfTUeia26vksA6LuYT0sZfpY6RQ1Zr9rA+lqkE1q3dlKdRXREUMda
         ZGsjeq8Y7m2yqBbktwcBNUGqAluwI/LwdxP5aAiFvKOaJ3p8V0CzSyE10ZPM4ejRv2aM
         07uj+igi6vGHxIPc0VrdwEUuT2jPk6bg4yS2gZKa52feBHTnujE6fMP6jAX0JkuJQdBe
         rorEhvzWicsVvq28gDTijRrpWOArLpAkKcXCRV7d4uACNP37ntyW+f60cldDxZezY6fC
         Md3A==
X-Gm-Message-State: AOJu0YxiMlVcnXMWd1xuBQj9fqQbm34Lpw8qsMToyK2BRkuFFquhjJHz
	rDzndNhe2jG/PcsMdfUWr8xiXOvSPaPMQLK7raJTcoJbFR90pGE/f7w74aoijQeKSjHmBL3Z4jK
	SFzHq2YBzaNBROi7Y/YLPAtPIOmgvp64LFm0v/wdFZXnnc7fBqKA/k/CkgWCfAJA4jpXk
X-Gm-Gg: Acq92OGbFBm4+SbgODF2or+Tim7vReajwNqO9ZTiPT0tBunVGwqZzlujAtOYV/iVqqF
	zFCVSnGgzRAG1ftmlLOzSwL1Hevm5Nw8xDr3MXPmqVGJGpRPgS/VUHQHyeJiPC+Wg3XbXNy6Pqf
	uVR/qserPv30DozDIbA7m8rYz7sibCiTUgDkR04R26Zl+01p1dd/0hx+wqYQ6s/B0+rlo6hIVxX
	OswfVW7jCgEvBtbyc6ZkzLK68oAF+dGo29MeSMo6H1kBxeL/q/xs34d3+ipgF3X3vmQlTx4LnXb
	lOkMoHBlFvLavXjkmsBUakIXRibLofr5LOMWrABGSlVtjaSGgkqJ7+j2uR0qbbXqBdpMQ4N94Fr
	7A1f/1IXKgW9Ij58VXrcS6wvvH0nwYrUKucy7Z7FiWy4M9g==
X-Received: by 2002:a17:90b:3b8c:b0:368:ac5f:d313 with SMTP id 98e67ed59e1d1-36951ca09a3mr5628784a91.20.1778875696235;
        Fri, 15 May 2026 13:08:16 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8c:b0:368:ac5f:d313 with SMTP id 98e67ed59e1d1-36951ca09a3mr5628750a91.20.1778875695658;
        Fri, 15 May 2026 13:08:15 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517a820fsm3518309a91.10.2026.05.15.13.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 13:08:15 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 16 May 2026 01:37:49 +0530
Subject: [PATCH 1/3] drm/msm/a6xx: Add HFI support for CLX feature
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-a8xx-clx-support-v1-1-62508bf651ac@oss.qualcomm.com>
References: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
In-Reply-To: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875686; l=4084;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=FF4ikNxmqKbxzeVlDwEnNmtDy9ypLTHAu+k2VdryIes=;
 b=/U0PEHRRvS/YBsEe1rUn414dQRYpv8WjixpJ3vuKmGyGzo7UuqFiDqJ36atmIW1er/LgvBWje
 d6u0mOvlBKLDcN3mdGNIBoFTGRMht32I/GQUMVIF8bpnSb9/WUQSasw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIwMyBTYWx0ZWRfX8ObeQ/1pChEW
 FbZvXC0E1iS7+pdj+N+J9z+7OCRIJSVZFvf0WCDz0lFUgyaOLA6FON8RQFbcoml0DKp23C3PMx8
 MGAkQYMPsYDQzV1mKp2HD3UAFwhW6G8rjDIOt6fc0bgjmTTYfkIqIRKyUml+uzPXzzGhG4YoyUY
 YscDPxHDMOtE2i2S43hAugT6vK8p0JULA0VippO6wwDvOkto1+E6BFnwrgcul7F00+msSPlrLQO
 KiXtbWJyp1M02HHF7pm9o80lgba3YkUpWrbFIXdUVv+lme36st7R8D0iSwXN3rbXoAjJ22WHksG
 bsbCGjaawdmkue0+cmAajCXGPXPk9HWtMtB7A0Lca2CUj0r56hHtkiAvhfsqJVpn95q3VplE8su
 XhL05O6t2UAcNzdwPx7PsrMZH4GTpO75QFzoZJGP3w4FhyBwf6qopp9/pwPbF1hnBfv0l6CkOZp
 Duva/PaF1PCYaFJcKMQ==
X-Proofpoint-GUID: vVv5Tghx6hOB5zcxFDhASKE1nwii9t-7
X-Proofpoint-ORIG-GUID: vVv5Tghx6hOB5zcxFDhASKE1nwii9t-7
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a077d31 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5Q0fzsgIy9hxAR0mj0wA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150203
X-Rspamd-Queue-Id: D76DF55748F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107968-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for Current Limit Extension (CLX) feature found on a few A8x
GPUs. This feature is required to limit the peak current consumption to
avoid HW spec violation on GX/MX rails.

Add the necessary HFI interface support to pass the recommended CLX and
IFF/PCLX limits tables to the GMU. Per-GPU configuration is consumed
from the catalog entries.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 15 ++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 71 +++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index eb431e5e00b1..f6a3f1924bb3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -34,6 +34,19 @@ struct cpu_gpu_lock {
 	uint64_t regs[62];
 };
 
+struct a6xx_limits_tbl {
+	/** @tbl: List of limits table **/
+	struct a6xx_hfi_limits_tbl *tbl;
+	/** @count: Number of entries in the list **/
+	u32 count;
+};
+
+#define DECLARE_ADRENO_LIMITS_TABLE(name)	\
+static const struct a6xx_limits_tbl name = {	\
+	.tbl = name ## _tbl,			\
+	.count = ARRAY_SIZE(name ## _tbl),	\
+}
+
 /**
  * struct a6xx_info - a6xx specific information from device table
  *
@@ -54,6 +67,8 @@ struct a6xx_info {
 	u32 gmu_cgc_mode;
 	u32 prim_fifo_threshold;
 	const struct a6xx_bcm *bcms;
+	const struct a6xx_hfi_clx_table_v2_cmd *clx_tbl;
+	const struct a6xx_limits_tbl *limits_tbl;
 };
 
 struct a6xx_gpu {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 487c2736f2b3..13ae34d0d898 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -886,6 +886,73 @@ static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
 	return 0;
 }
 
+static int a6xx_hfi_enable_iff_pclx(struct a6xx_gmu *gmu, const struct a6xx_limits_tbl *limits)
+{
+	struct a6xx_hfi_table_entry *entry;
+	struct a6xx_hfi_table *tbl;
+	size_t entry_size;
+	size_t size;
+	int ret;
+
+	if (!limits)
+		return 0;
+
+	ret = a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFF_PCLX, 1, 0);
+	if (ret) {
+		DRM_DEV_ERROR(gmu->dev, "Unable to enable IFF PCLX (%d)\n", ret);
+		return ret;
+	}
+
+	entry_size = limits->count * sizeof(struct a6xx_hfi_limits_tbl);
+	size = sizeof(*tbl) + sizeof(*entry) + entry_size;
+
+	tbl = kzalloc(size, GFP_KERNEL);
+	if (!tbl)
+		return -ENOMEM;
+
+	tbl->type = HFI_TABLE_LIMITS_MIT;
+	entry = &tbl->entry[0];
+	entry->count = limits->count;
+	entry->stride = sizeof(struct a6xx_hfi_limits_tbl) >> 2;
+
+	memcpy(entry->data, limits->tbl, entry_size);
+
+	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_TABLE, tbl, size, NULL, 0);
+	if (ret)
+		DRM_DEV_ERROR(gmu->dev, "Unable to send PCLX table (%d)\n", ret);
+
+	kfree(tbl);
+	return ret;
+}
+
+static int a6xx_hfi_enable_clx(struct a6xx_gmu *gmu)
+{
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
+	struct a6xx_hfi_clx_table_v2_cmd cmd = { 0 };
+	int ret;
+
+	if (!info->clx_tbl)
+		return 0;
+
+	ret = a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_CLX, 1, 0);
+	if (ret) {
+		DRM_DEV_ERROR(gmu->dev, "Unable to enable CLX (%d)\n", ret);
+		return ret;
+	}
+
+	memcpy(&cmd, info->clx_tbl, sizeof(cmd));
+
+	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_CLX_TBL, &cmd, sizeof(cmd), NULL, 0);
+	if (ret) {
+		DRM_DEV_ERROR(gmu->dev, "Unable to send CLX table (%d)\n", ret);
+		return ret;
+	}
+
+	return a6xx_hfi_enable_iff_pclx(gmu, info->limits_tbl);
+}
+
 static int a6xx_hfi_send_test(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_msg_test msg = { 0 };
@@ -987,6 +1054,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
 	if (ret)
 		return ret;
 
+	ret = a6xx_hfi_enable_clx(gmu);
+	if (ret)
+		return ret;
+
 	ret = a6xx_hfi_enable_ifpc(gmu);
 	if (ret)
 		return ret;

-- 
2.51.0


