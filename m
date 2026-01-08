Return-Path: <linux-arm-msm+bounces-88035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7EBD02ADD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 13:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8ED023008165
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 12:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837F63816E2;
	Thu,  8 Jan 2026 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lakzr7BG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSRGyagI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4C537F759
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862748; cv=none; b=nst18Gk6OCwIQVU+Syp0Opd+Bn5hYQcQr7WllqwIWc3Fb4imHdTrzm8f+m97FnsKy8l2QrSb7DHjIsZ154Ip0goFo1mdkD013TWR0dOM12QmEVFSrPJO4Ty+9oRdcX5B1D7l032KT79x0f1D5ygDMrpSscrgENz/2Qy8lNlzhk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862748; c=relaxed/simple;
	bh=xddD2MNsv1s20DTlpMntWMruk2EwI1cqCCz4ydIMiDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UNBLkSaCZXXXKHN5fMSaCjbRlAAPrW+Y/c5574ab0RuV/Spl8uIYGWbchD5mFotydAo9QGkOrP6n7wLyISuxC+Z82u7LVR+VWuGWUwwbqPgbPyEjN4S3DFGMPwKBXUbLEXvAiNSdfW6Eesyv21s3aM7M1NxrUze+HEVnIUPJG5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lakzr7BG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSRGyagI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084sqBf2593314
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=54GDJZyJzbH
	Wm0MrtQpD7VyvgqcpHZYlLhoVJwL7bN4=; b=lakzr7BGXoXaqnX93ruFWQq4iMw
	3FynUPGHYsM9mVzpgDdFf5pLpddwJ7GenZpP+ltZ4R8/3yzsRn+W308uFf1+qDTi
	qo+f6bO2jmO98DR5VNctGhIURJEQIxjvZjlQGFOcOASOz6Rv8RwfzFVz94b9H9hy
	4Biz/48eNGIECrYhhtgWjlv1zYYhkbe72412DBdoF3izvTHyNFunpb0vdfl2s75K
	bHPP+QRzKaWkOgS2/q/NsTgjIxdlUbmfbIirV0p6aBTyPxgxYOsm7pyvcz/e5rQ4
	m0/FF2eU3sdpFLG+Bm0RsOTpW82r83AAo454CTVFAMZOKIAPaR9pTRxHyCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn29418y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:58:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22d590227so390455385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862738; x=1768467538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54GDJZyJzbHWm0MrtQpD7VyvgqcpHZYlLhoVJwL7bN4=;
        b=bSRGyagI3H4krAO99E2ltUM4kktpE5tqaSmEYtY3V6vKGghDl0+k1rNwt2p25VFXB/
         5ixvmHmPM4QdHHEOAwsW22krmw7qZZnB/5dunwWGe5SLrHO/dCnfGDXYdGpkkGT4LPO/
         ggfDJZgzEvh+6++nDObwmv+GpPDTe3pgfKvvouch9ghuN4HbCyiUvYn0Meoy8I8g2DIx
         T6//Qa4dx/YXp8u2QTSn3bV14h4sXiFTVzvUIchdzUEZ6i13GCbXBIeeZgr2GoU5qGXD
         TZzkDiIFnDYRJj6+bO/dZaEbvUbpdfRqly294b6AvpsYAPSHmCdrIGFPmZsYzD56E1VA
         sR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862738; x=1768467538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=54GDJZyJzbHWm0MrtQpD7VyvgqcpHZYlLhoVJwL7bN4=;
        b=QCJgXfH8lBUy+2A1fEEOBPrNOEM5SlNfC/8MAT/AXM/wPkvXRoAkRc6lX09SRf302g
         oYV9Vi2a00dUp9jwtMqwmSPLDu2ZlykAxUTr3vSIhBLP3UNv4gkAtQonuCmkVBz9KdZQ
         7/LqSMkQ4blgtBqTRjV0vSMIPwTFlMmet8eKWpocfeaxj5h8oHNvwxg5ITQDCRFolojd
         XkG2jcXpO5E6WcbhAgkk0APdeFaFG5PB/II2cqMe7JR+1nDAGddRiwHO8CtwMogCHsf1
         UukVlT++kUtYYuB2m8J4Y86b001rqm0+TMXp81r76adxiGWyLmgs37HQTuAedZZ8e8/8
         epdg==
X-Gm-Message-State: AOJu0YyuUmyhN7LdOY5bzRygF7crB4zw+O5stvvU8pR9wZOA37qaebeg
	/GUpWcXyMhotQRiyw04MoaCYAzlHsAKYij7PYofgosYPTDYG2Raut90Vl8qqtGnwAO/swAGpMTJ
	6jqnem0i0d2vmWyO2PDSZaUNr0I9FJ0zlLUE+vh69jc2F1uNY23SZEZ3VyyvgOI0hFJwl
X-Gm-Gg: AY/fxX55+G2xQ3J+K5qpUMlyjfYdu/HVRm8uEIt2oBHemxZ4bQoTZnnbWwFMLMD015D
	XzhMIfH58AungSKzOsqE/6uOEd0DaM1uAvZdEET/SzJISzwSN0r6lS02hM7CJTGLvN0VltDUlS1
	/cWYfXukuDHYvt8hck5PdGyhx3Vy6SyHyZTQGTzfyv+zestjNan5k780GOvRWs5nJOJxNmeG5wW
	4MDCO2iGpek6fJNaolRD7oq/4TO2mo6ajcD+0++i6JxVBeB+lw3EVL8siAiOHt8Eg7/jmOM4GO5
	0Bn2CMSoLDeH8bL+BbMp3yorKRGR9k6iL0wRUA4APBewwxedUe4Y+NBBLubANzlPU0jOoQwsjx4
	rTkYr3T3wMjUEogODA3vxIsdMJC6wYaeb6jdNun6BzpKabyPsBaxcBpAO86Okp8bGf2g=
X-Received: by 2002:a05:620a:f0c:b0:8a9:ef98:6b34 with SMTP id af79cd13be357-8c3893cd9e6mr665634385a.56.1767862738338;
        Thu, 08 Jan 2026 00:58:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDPTpg2nfUyWmprD2xyTpkUnn0XmXeqUYRDeQUfDgMTzG3+mwfDEmQ/DqJk3PymsQw8p4x6g==
X-Received: by 2002:a05:620a:f0c:b0:8a9:ef98:6b34 with SMTP id af79cd13be357-8c3893cd9e6mr665631685a.56.1767862737861;
        Thu, 08 Jan 2026 00:58:57 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:58:57 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v5 11/12] drm/msm/dpu: Add Kaanapali WB support
Date: Thu,  8 Jan 2026 16:56:58 +0800
Message-Id: <20260108085659.790-12-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bT0By3pveY1-UKkYbKcrXB5cNS6eWZ_u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX6QHM/3IwkJOL
 MiIuWprIH7qpUkkfDqXyGUyKiOMXZMg98svjeIVjlX2n4Bd5Nle6xb6CcVsrQJcZtSdEJ/F/HLp
 sv+d2T4P4FAQjMlb646mmWjYYf4RmOTxvbG4f7JTzHGsmlKYuQwoJSaDRFtYinLCoFGol18kENx
 +E0ASklQPpN8BgveG+4YyN8pvnm+W1XjXDpY4jdoDNvoFS9hGX+N3Yh1A5b51e7Ni1FZl/7JlpZ
 XLcAC/JPtyLgCIl8RP+YxLgWWjR66srFjFBwHwgd2iM5/DItKh++TfiIg9jAAKxZND1fTWrbJtT
 q830UH4XxMHkthbH7j3MUSKrHccgJE5DBZ2/fTmU/TSOh0oXh6eyc2lgqtoictctXH6m6JMRUpq
 B+7nS6oMK1a6NbteJzn20fwi89kUTzgDXhHSNGXpBu5NTQX7ai5kwNKVNNaEoWulu2a6yGMFJ4Q
 vfX4Kwl6hF7UKVADpyg==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695f71d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kCfvZJGldO2mi53t-5YA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: bT0By3pveY1-UKkYbKcrXB5cNS6eWZ_u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add support for Kaanapali WB, which introduce register
relocations, use the updated registeri definition to ensure
compatibility.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 478a091aeccf..006dcc4a0dcc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -148,6 +148,15 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
 			      cfg);
 }
 
+static void dpu_hw_wb_setup_qos_lut_v13(struct dpu_hw_wb *ctx,
+					struct dpu_hw_qos_cfg *cfg)
+{
+	if (!ctx || !cfg)
+		return;
+
+	_dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
+}
+
 static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
 				const struct msm_format *fmt,
 				bool enable)
@@ -202,8 +211,12 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 	if (test_bit(DPU_WB_XY_ROI_OFFSET, &features))
 		ops->setup_roi = dpu_hw_wb_roi;
 
-	if (test_bit(DPU_WB_QOS, &features))
-		ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
+	if (test_bit(DPU_WB_QOS, &features)) {
+		if (mdss_rev->core_major_ver >= 13)
+			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut_v13;
+		else
+			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
+	}
 
 	if (test_bit(DPU_WB_CDP, &features))
 		ops->setup_cdp = dpu_hw_wb_setup_cdp;
-- 
2.34.1


