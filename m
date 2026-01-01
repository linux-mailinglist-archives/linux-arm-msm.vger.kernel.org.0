Return-Path: <linux-arm-msm+bounces-87140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAA6CECCFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 06:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 482B83008F9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 05:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1439A1E3DDB;
	Thu,  1 Jan 2026 05:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bd2f7ubz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gHvVNeQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C57C8CE
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jan 2026 05:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767243903; cv=none; b=BqltkTBhk8r17obZBO10X1RTTqsMqERr9fZytSXxO3DYIIQ69WOeC90tUvWdJtQrSdL1JHgqqp3HKGdog9gBIqzag0LK+BJWEqbzvgS1x/OfZNy1ab9egEjXBDWNgGnB8FVCfb8OW63RusV46UlQ40YEXoF4L3RXp8CaZdJqzTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767243903; c=relaxed/simple;
	bh=xqa4amP8z0/9O5shd3ZQo8nN7+fGD7ILoQmcbkQw+kY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=czxd8dD54H4wzgf5s2/vHi8ZNkzzIzTd8e7jY+/rAaMwO8UBehZmermq38cESnIKwWCYbhud5Xf1lEkBIy84xlpLeGsI9FpCd/0XbhH37v9bx47nqzDDvxkPy+qYONzShOnw2MucDwjLapgciiKpUGbGSursBA6Mlgdvojci+3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bd2f7ubz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHvVNeQd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601251R3627741
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Jan 2026 05:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=07+KOjrq6jz1M5PJIyukzP
	CzKsJ5MLq+baFE6H1I/tQ=; b=Bd2f7ubzjj28qGwwkcbdgVh7N//DdtsButYPFo
	MVdLpjIHgUx7HFCfmUugMoyM/Le8yTpgMnataVqggnwUs2R5ovvMNd46s6X4tWxW
	ttpPo6UX2YVDUJIlfnL82OMBeLilfv9KCuO2vfqRgepSW1MO8OJ6fdt5Xid/Xlkz
	BRNm+jiQ//tAS+rDcDJl/Y6OHLOZnH52iIKI0Wc4hOfg9r+yNSj2cnpjRAo3ys4G
	8puld1KKUVjDqoWHxZ9dnjPzmiyOG1I9fn1DpR2HFeqPQg1y5SowChV60CgPv+Cg
	Q1y+lytKKxNUbqBFqJBbqycBPn0W/ja8bhvDD/YdcV+LDJeg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8s909-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 05:04:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so12670934b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 21:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767243893; x=1767848693; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=07+KOjrq6jz1M5PJIyukzPCzKsJ5MLq+baFE6H1I/tQ=;
        b=gHvVNeQdm+l/PXkdX9MjjV1R1GgSY9+NgpT0tOJ6xKF9i4CQg+TY6kEpgCSeWSL43Z
         RTzSpdzE46J+hefoa3P5ApcUhuuy8i8QoLPKQrdjyUNQhsmobEjRLCUj2AwitYVlUxOi
         jb4Ie597TnmtbcsbE6DAOQJTKCqaK/w25wXrMm1nSVLydz0ABX7agAV/KKSxds4WqC22
         GMBk8P+gcGpdsDlCbGWfLUB82F5rr4C0E3YXz0+M/WV9hgvabB/qnsGH/vKcRp2wxfwo
         g2UTDt5G5lhPB5uQityhrtIzB0Pi2lf3d6+/rdDk0O71GfqjXmyJhgkytzgvpiRJkXo3
         bqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767243893; x=1767848693;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07+KOjrq6jz1M5PJIyukzPCzKsJ5MLq+baFE6H1I/tQ=;
        b=kskp4skwOZW/LUAkeAI1XwtX0aWdOgJ/Wo+YTi4uwvtK6A6l6YFc+qqyfde+HLZkLi
         rx8XL1g3kkmWDld+YkdafCgdn/ZQHpz0ZFKis8yt354mn7Bhh1a87CX4Ge8AT+IP5qLh
         BW11uDOrIPIMI9VDVAIQI0eeYnJ/O/LdzN4sW8+2iiHrlV9mfIWQFUj9tkcqAeCjYewc
         gF105wdD2ZQMYFFzuSFZPixaTb9mIMn+5d2+WIx7/JvHiGrl90XLzI1rsMgdFObTH3aQ
         F3D2nSVQwkOW6VltJAdFCSsZLjJwrk9YbeWBxnMFZrq+curVRs2eRM6TRTpajM6hs12/
         qZzQ==
X-Gm-Message-State: AOJu0YwtZubsIwXvWOHgQK6EghSBYsUTUGPzK7ZFGcS2x6LCyeaxzRqr
	3WQehmGelWTT1vsyWFnPSf1D6B4V02gmyCOv67cb52B5ixwtAbry1PYCwxqX7EkJ5KpEEN5MA0R
	z3SdNZ6hQ4JOl1rjf194BP0Rdhvc9nNbeHiUm28zYrMqhu4Ip1oKweB+m9bHH3PAXw6piGK4JTt
	zq
X-Gm-Gg: AY/fxX5S0udwD4lHT6hk0M+3CduogFRhrW6iYqX/Kq8uWWSN2LNRb2S8gBT9ow+GVSI
	4hJevN/Atu9MXC7S1toXEHpvmxlUUmKBf7rsHQ4/S9DyINOqhHlrjewqmLTak9Gn2MnshBQPVkR
	Z1orc1/fSVhw6EX68/6pjbJli4/mzxlZQS/UF+zeDnjvjo03/zRxppOY/6JmSZ7N5a0M9ZrAuEH
	S2LMdnqiQypeEzHK5HI2h8LU4FepgjPmdbt8CG59f7oGhx0JuTiFNqPpjKnMlEr44UCcFDB3Qpl
	yu3flnaptQUlzdcXBJQ8/kXxkPVkCCJ/4VbdEhUP9ZZw0MjFCi4iP1ZMh0YSJyXLLuOIDGAowWa
	CTnfGbBt1BDr2MJsDMBY/PYV5RsKkJQRbTmIJ
X-Received: by 2002:a05:6a00:1d98:b0:7aa:8397:7754 with SMTP id d2e1a72fcca58-7ff64ed1413mr31668845b3a.2.1767243892975;
        Wed, 31 Dec 2025 21:04:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd5bbetNMmPFCI2o+xooK+bp2gy/VQ6yWacZiMYQSjS52Fb5kSaL215a+Cf++Nt/UijyQRMg==
X-Received: by 2002:a05:6a00:1d98:b0:7aa:8397:7754 with SMTP id d2e1a72fcca58-7ff64ed1413mr31668826b3a.2.1767243892499;
        Wed, 31 Dec 2025 21:04:52 -0800 (PST)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a0595sm36404922b3a.44.2025.12.31.21.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 21:04:52 -0800 (PST)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Thu, 01 Jan 2026 10:34:38 +0530
Subject: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGUAVmkC/0XMzQrCMBAE4FcpObulu0l/4sn3EA8x2bZB02iiR
 Sh9d4MXLwMfzMwmMifPWRyrTSReffZxKaBDJexslonBu2JBDbVIEkHdQHf62kpHbJQVpfhIPPr
 P7+R8KR5TDPCaE5v/FElB4DSxdJBtT0MDKwJCrwenFSF21J1izvXzbe42hlCXEPv+BQ4IemmhA
 AAA
X-Change-ID: 20251231-4k-969b53d2ea4c
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767243888; l=2753;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=xqa4amP8z0/9O5shd3ZQo8nN7+fGD7ILoQmcbkQw+kY=;
 b=dL/Y8sUl8BHZxZ3ipn/80+emTBzda4tXdgTE4WQI5DmIWYKmgZQAYgVHSvbrvkkDVk7X/6vcx
 GuMPq2YMMKOCrsZodaxsgQ0hbvYsFd5WsrwKbx0N5ACTqJVOJqC1564
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDA0NCBTYWx0ZWRfX3HpsYH5RGgab
 IupspTX4EJCQh+IkmgfmwopIctcaG7n1JhlLDf5yUZo6xkLaYh8l5G/ypr9O6mv2dU1N9JdxXqK
 FaFylYuDOriE0m6QtwB1/1TSGK1VYsit0qIfYLfJtOq9LCoQwsyRxESZV1W/vBDnBTsDDkx7lNl
 hrMplyp7FtRxoWJwhlIs1QYz0oRbfl7uH9/N02qsMfgQFM99cSzOO/be3e2m8Z2gNADHQG8QtVI
 yBU8/PQ4HTbTMPON3Id7XY2xh1PoNld8sh5dq2aTk83MX7BAYC568NOLb9VwyuAvwCWNdpjZQTT
 suPqkGTSw3Z6C8W1ULs+/J+Hj65AFpQ/YK1UGYril3V1JsmzZn79WtYiHMAqtlHrF8LXBtpxdoY
 UnDxg/FDLtUo8Sx21iTfWvpFbqr/5/5jZIJWod7oZ0bH4U/qzoUSbhnt9gZAUxnAkq3qcsc6NG3
 DrvD7rJtCaWz219HTVg==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=69560076 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5FlqbPEWv7NCXEe-mtIA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: HGQw_hGjY9_7kaiv9GuVZn0rD0niyyy7
X-Proofpoint-ORIG-GUID: HGQw_hGjY9_7kaiv9GuVZn0rD0niyyy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601010044

On SC7280 targets, display modes with a width greater than the
max_mixer_width (2400) are rejected during mode validation when
merge3d is disabled. This limitation exists because, without a
3D merge block, two layer mixers cannot be combined(non-DSC interface),
preventing large layers from being split across mixers. As a result,
higher resolution modes cannot be supported.

Enable merge3d support on SC7280 to allow combining streams from
two layer mixers into a single non-DSC interface. This capability
removes the width restriction and enables buffer sizes beyond the
2400-pixel limit.

Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Changes in v2:
  - Updated commit message for clarity (Dmitry).
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 8f978b9c3452..2f8688224f34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -13,6 +13,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
+	.has_3d_merge = true,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
@@ -134,17 +135,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
 		.sblk = &sc7280_pp_sblk,
-		.merge_3d = 0,
+		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
 		.sblk = &sc7280_pp_sblk,
-		.merge_3d = 0,
+		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	},
 };
 
+static const struct dpu_merge_3d_cfg sc7280_merge_3d[] = {
+	{
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x8,
+	},
+};
+
 /* NOTE: sc7280 only has one DSC hard slice encoder */
 static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
@@ -247,6 +255,8 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
 	.pingpong = sc7280_pp,
+	.merge_3d_count = ARRAY_SIZE(sc7280_merge_3d),
+	.merge_3d = sc7280_merge_3d,
 	.dsc_count = ARRAY_SIZE(sc7280_dsc),
 	.dsc = sc7280_dsc,
 	.wb_count = ARRAY_SIZE(sc7280_wb),

---
base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
change-id: 20251231-4k-969b53d2ea4c

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>


