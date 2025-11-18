Return-Path: <linux-arm-msm+bounces-82216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C52FC685B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE67D4E2F2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D8C320A0F;
	Tue, 18 Nov 2025 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZuqEM5q6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPR9sxbR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CC1311946
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455983; cv=none; b=MIQFmTUUMt3E0lzDawm3DAElFT0jMVt7ESzN6LCqitPRsIt9E93j/RPUU7JplPhyPbvcOH4E/VgnkjMu8v4Jn3TtDxhVb4M3ECwdDXTF2GCG8u6w8/nm6wxSG1pkwskaTdPB6Zlp3/4GW5IteboiUCIwG2DZa40CslwWCun0UOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455983; c=relaxed/simple;
	bh=DEV55TnpxC+ZAc5oDFgekUuq413l/3/UK41L3U9jZiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jffNkPbTKZLiOyLtfNsCcB4ti5WoHn+uWDO/MaVUGisPChniYHcTDdOZtoDxYedz6wS39Gbq7R4pVPUjemTTAiWxhAlxCH/6ilookZuD2IxmLOjotiIAmdx3LOOQxH/u8w4YFOTwUFbiyIymg0c/grg3XDE/tQSqhJfcUHam/48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZuqEM5q6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPR9sxbR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI3CJKF376011
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJHpFB1M0Fa2jX7zQfciXysNKzSZz/9fw/KmefWGV18=; b=ZuqEM5q6TvySaIKR
	5lCog14AuSxrpqezfJkboiAtujg9sl2IpLDzPq/IFCefNyrWj+mpQT5e5dYkkZbH
	edfYR5pIkTOel5xq5v8WH8rcxavAU4Xl3JqTeb1Sq0KubAJIQshAFxJkkGZvY527
	DYV/EPcwXYBuHLSEHRPpmFA7x48ogCl2ORCn0ISVNVoTsgijI0gwV9X895SVZ6Ym
	4JLEu9HG1Hzxx1Fy7ub5wIJDs6RRt4S7L2za9za0bb6m1uq4VDmHusCps20xfWVU
	FZvE0eUXiys73xhVMpGj+eWz4JZESZcOvt75/ppyPnhoL5HPSTaDCoIkpYkehruk
	LRYGiQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76njfvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:53:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297f48e81b8so85698365ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 00:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455979; x=1764060779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJHpFB1M0Fa2jX7zQfciXysNKzSZz/9fw/KmefWGV18=;
        b=RPR9sxbRQPtCDokqjo5QXeeO5j/L+IyakEOygiIBnwhV7UEW63IlH+mX+yf+6hv9/I
         qXfKNi7s6M3T1n5A5aP45yfBW1xUji4/or/elYmu7W+58Q6yNL7tMfz9+tYViBpdJtN/
         JGZOL2/xTtYA0sjq/eNxZfzme+zbB58IhRQOceUB7OyTCR0aoGfXZectATEmUnuYOfE1
         mWa2VH+MgmTjZtfGEs8N3nokWm0/slXa27o34EdkEeYJfWKkrTuLDKuq6JfAAc9DaLeP
         m17p+uvXr7W2485+PfC84DYvAkVbwSLPLwySpOdcyA6oQsUad7BRlP0gvdapKeyNRWSg
         gjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455979; x=1764060779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gJHpFB1M0Fa2jX7zQfciXysNKzSZz/9fw/KmefWGV18=;
        b=DUwWHj6aumNhRp0RKGT7ePVExy5XoEWmwqGxmHQYQ1qyyWyXCpoUuP1hqL6wlXYu4r
         mZ9ejmomB9ANpFLbQGfp8FPsFzmmR1JEbjC0s2qXEmdBRSwKjzrbpdGqD/MnSSnBZ0Yy
         /xMLs27kEbYhTVp7QR7NAbdtOW5GxXu8IEsg1cnKcLIhvf8dUyHaw9YgsyYqj9U+G/c/
         K1mTxsgNCObeSG8Deft43HogVJGGrgGdKRZQTVn9wYRiUp5vUcLacMcZC2J2XK0t42+5
         KxbgXAHE/cDPFm2Ar1UVCACbysXkGRTHmDzQHwdKrz8MC+5LT61s1y+pFTv8F2MlDRiB
         wiiQ==
X-Gm-Message-State: AOJu0Yw2PtWeTEcQ35Gg9izIABQG41SulVru6ZEIUI9ezH+XqKLhnA00
	D9P8eB6f8GtZLAfjJ6ROnOmnyXLsdcuCx80fdeSLeNngyxUF+88IjJKAuz8D8KgNM2+33orqb2z
	Egasi7kAjybTYHReztIImtT8eAYYZHTCwKiV5B5Tlqt99Wk5gzDfPH6LmlI3b4Et8/O5A
X-Gm-Gg: ASbGncvuzO8auNdP5w74876/ldp3co43o0UWHMJzjJgilCDXkoatkL214pG4saSWzWR
	R1nVkLB6g1zuMkqRgf58n1+mOwfiWNHSID53LseZ38akceNT8xB9i7y03CV2wf2kQRqZn8FVUHf
	NNe1rgLJ4nchEBe95Wb9U5S0pzaN9tOjoJMTGKZzRdT9wo0ZUNluPXLBOPemszXwG2a+5I3LfFg
	NHr3Y/FeKuQcp5/ZXTifYLlg8kHfhM/PgIhVPfHG/kUIm5MFJpzMkLzUvNutb6vhNoMr2eF4W4i
	xi5XH4U8NDmIQYNvh6dUKfojHWS/3KY0bWGXzRsUcGrtCQQ5+hDlHuza40gyx4OdSvw8UrDT7+y
	IFbSO7fjGfyttCQMmj72Sgy0=
X-Received: by 2002:a17:903:1448:b0:299:d5a5:7e with SMTP id d9443c01a7336-299f5587d6dmr29425855ad.15.1763455979207;
        Tue, 18 Nov 2025 00:52:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXHTTncLm+wwNsQtax/ncNNDvvaKtLHgtViPzEistOPdMAF1zdbYET87bo4fTF9/xDBrWiLA==
X-Received: by 2002:a17:903:1448:b0:299:d5a5:7e with SMTP id d9443c01a7336-299f5587d6dmr29425335ad.15.1763455978576;
        Tue, 18 Nov 2025 00:52:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:52:58 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:40 +0530
Subject: [PATCH v4 13/22] drm/msm/a6xx: Share dependency vote table with
 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-13-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=6424;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=DEV55TnpxC+ZAc5oDFgekUuq413l/3/UK41L3U9jZiY=;
 b=Qcn9XMDdWDAliWUeS66kttJUuzO6qdmx47XxB3qQH+8k4C9wsMVO8Xz6ePGlqUJFDv5VcDd6D
 evB2LIuW67ZDt97vKaX3ciTLZsHvaQXeTY0kX0vrpmjyAbZsIQznJNf
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfXxxYqo1tQrlxI
 rAhb3NOLJnwWKXxgHGZcMxWdgN56WSnmnLxSfe+I/s6IVzt3UyX/p8Rw8Grn730K2hPjagb/rbK
 jXPr7KKuXwmHDjVJDC6jTuncYxOf8Hup+xhabmqgoW4WkSdfYVjgdLAdyc3ccXQazbQ9jQxmipY
 Vmd0ODiQMgDgFkzmb/vCGs5IcgzX+UE9dp53LSRlPdaVgYuBhHYMZxJBe+7w3lzfktxOo0O2wqF
 ex3k+mzqxW9cb/OnLp1YXnNU4cH5IvTqsjdaOI4WoBrNg+AwV//pNOclO6eeYEA7SqnxaHc5q/b
 V1LF76fm9sNcPz44NIdisE+YLY3pBaGIVmW/c1NdNUU1Hfg4WHzro8D/sKy0dgGB6TfKxz8grrO
 tccjgZ371cuZsY0GvhKGX+nxXelmHA==
X-Proofpoint-GUID: BuWUn0RI1CT-mKh_ImjAlW-aI51ugioN
X-Proofpoint-ORIG-GUID: BuWUn0RI1CT-mKh_ImjAlW-aI51ugioN
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c33ec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jvJuTtenM57zLa_9FEIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069

A8x GMU firmwares expect a separate vote table which describes the
relationship between the Gx rail and MxA rail (and possibly Cx rail).
Create this new vote table and implement the new HFI message which
allows passing vote tables to send this data to GMU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 54 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 53 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 17 +++++++++++
 4 files changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b76960c6d444..cede210a0a78 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1616,6 +1616,57 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	return 0;
 }
 
+static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
+		unsigned long *freqs, int freqs_count)
+{
+	const u16 *mx;
+	size_t count;
+
+	mx = cmd_db_read_aux_data("mx.lvl", &count);
+	if (IS_ERR(mx))
+		return PTR_ERR(mx);
+	/*
+	 * The data comes back as an array of unsigned shorts so adjust the
+	 * count accordingly
+	 */
+	count >>= 1;
+	if (!count)
+		return -EINVAL;
+
+	/* Fix the vote for zero frequency */
+	votes[0] = 0xffffffff;
+
+	/* Construct a vote for rest of the corners */
+	for (int i = 1; i < freqs_count; i++) {
+		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
+		u8 j, index = 0;
+
+		/* Get the primary index that matches the arc level */
+		for (j = 0; j < count; j++) {
+			if (mx[j] >= level) {
+				index = j;
+				break;
+			}
+		}
+
+		if (j == count) {
+			DRM_DEV_ERROR(dev,
+				      "Mx Level %u not found in the RPMh list\n",
+				      level);
+			DRM_DEV_ERROR(dev, "Available levels:\n");
+			for (j = 0; j < count; j++)
+				DRM_DEV_ERROR(dev, "  %u\n", mx[j]);
+
+			return -EINVAL;
+		}
+
+		/* Construct the vote */
+		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);
+	}
+
+	return 0;
+}
+
 /*
  * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
  * to construct the list of votes on the CPU and send it over. Query the RPMh
@@ -1649,6 +1700,9 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
+	ret |= a6xx_gmu_rpmh_dep_votes_init(gmu->dev, gmu->dep_arc_votes,
+		gmu->gpu_freqs, gmu->nr_gpu_freqs);
+
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)
 		ret |= a6xx_gmu_rpmh_bw_votes_init(adreno_gpu, info, gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index edf6c282cd76..2af074c8e8cf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -97,6 +97,7 @@ struct a6xx_gmu {
 	int nr_gpu_freqs;
 	unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
 	u32 gx_arc_votes[GMU_MAX_GX_FREQS];
+	u32 dep_arc_votes[GMU_MAX_GX_FREQS];
 	struct a6xx_hfi_acd_table acd_table;
 
 	int nr_gpu_bws;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 206eb204cea1..53cfdf4e6c34 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -23,6 +23,7 @@ static const char * const a6xx_hfi_msg_id[] = {
 	HFI_MSG_ID(HFI_H2F_MSG_START),
 	HFI_MSG_ID(HFI_H2F_FEATURE_CTRL),
 	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
+	HFI_MSG_ID(HFI_H2F_MSG_TABLE),
 	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
 	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
 };
@@ -270,11 +271,63 @@ static int a6xx_hfi_send_perf_table_v1(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
+static int a8xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
+{
+	unsigned int num_gx_votes = 3, num_cx_votes = 2;
+	struct a6xx_hfi_table_entry *entry;
+	struct a6xx_hfi_table *tbl;
+	int ret, i;
+	u32 size;
+
+	size = sizeof(*tbl) +  (2 * sizeof(tbl->entry[0])) +
+		(gmu->nr_gpu_freqs * num_gx_votes * sizeof(gmu->gx_arc_votes[0])) +
+		(gmu->nr_gmu_freqs * num_cx_votes * sizeof(gmu->cx_arc_votes[0]));
+	tbl = kzalloc(size, GFP_KERNEL);
+	tbl->type = HFI_TABLE_GPU_PERF;
+
+	/* First fill GX votes */
+	entry = &tbl->entry[0];
+	entry->count = gmu->nr_gpu_freqs;
+	entry->stride = num_gx_votes;
+
+	for (i = 0; i < gmu->nr_gpu_freqs; i++) {
+		unsigned int base = i * entry->stride;
+
+		entry->data[base+0] = gmu->gx_arc_votes[i];
+		entry->data[base+1] = gmu->dep_arc_votes[i];
+		entry->data[base+2] = gmu->gpu_freqs[i] / 1000;
+	}
+
+	/* Then fill CX votes */
+	entry = (struct a6xx_hfi_table_entry *)
+		&tbl->entry[0].data[gmu->nr_gpu_freqs * num_gx_votes];
+
+	entry->count = gmu->nr_gmu_freqs;
+	entry->stride = num_cx_votes;
+
+	for (i = 0; i < gmu->nr_gmu_freqs; i++) {
+		unsigned int base = i * entry->stride;
+
+		entry->data[base] = gmu->cx_arc_votes[i];
+		entry->data[base+1] = gmu->gmu_freqs[i] / 1000;
+	}
+
+	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_TABLE, tbl, size, NULL, 0);
+
+	kfree(tbl);
+	return ret;
+}
+
 static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_hfi_msg_perf_table msg = { 0 };
 	int i;
 
+	if (adreno_is_a8xx(adreno_gpu))
+		return a8xx_hfi_send_perf_table(gmu);
+
 	msg.num_gpu_levels = gmu->nr_gpu_freqs;
 	msg.num_gmu_levels = gmu->nr_gmu_freqs;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 653ef720e2da..6f9f74a0bc85 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -185,6 +185,23 @@ struct a6xx_hfi_msg_core_fw_start {
 	u32 handle;
 };
 
+#define HFI_H2F_MSG_TABLE 15
+
+struct a6xx_hfi_table_entry {
+	u32 count;
+	u32 stride;
+	u32 data[];
+};
+
+struct a6xx_hfi_table {
+	u32 header;
+	u32 version;
+	u32 type;
+#define HFI_TABLE_BW_VOTE 0
+#define HFI_TABLE_GPU_PERF 1
+	struct a6xx_hfi_table_entry entry[];
+};
+
 #define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
 
 struct a6xx_hfi_gx_bw_perf_vote_cmd {

-- 
2.51.0


