Return-Path: <linux-arm-msm+bounces-85947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 842F5CD12A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B96E6300DA4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6053B243954;
	Fri, 19 Dec 2025 17:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQpKdii6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFc3Dg5N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FB233BBD5
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766165496; cv=none; b=KHS6XdRfk/vtiaxykkJFyPV8n7pW8U0mtFQnMNEVyTCutUDRhztFLWx0P3tahflkNeN41Ckt3blCKhjFjj5FYwX5K0eQtSWk9Zxc47Jf+Zpa0iVYBYxxQeThleSTyKVHKtwTZGSD2kVUwg+SDb5MioDp1/tnzTiG/JYbe9C2Fyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766165496; c=relaxed/simple;
	bh=3ikvbKMf7PUmo3visIuMMZQDsdq+i0/nZLMttFmv2Xg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EnVL2FJU6W6Mdqmzr4Cf4nOW8+bOBA8Sdje0YDH+XWvituhWzdhFuIjU0viOhghSOwGSnX1gM15QDEeNadXORP7BI3WZXjARP8l0fgFfGZnH+LlyFvbK+CeRUxAQquh5OHPu8ibhSY+v0TUQxhMPcByjFHixi8Z2Oz2WVkBXLHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQpKdii6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFc3Dg5N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJFjk7s1189552
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+HoP4zgJI2H
	QvPd0VfVnVmAlTXxAtZwgmAa2Xf4qdeI=; b=MQpKdii6NHdrT18A5ykgHfeT4w3
	4aM6hClexX9xFlWil6+WYfXe2Qux/f4HuNCmIjDz6V7YUBDbftJHokBpvT4sYROI
	ji1FrpbkVRXUF2+jvymj9JIIS3020M2yQsGsdW3sSpvXj4SnVZVPu1NP94K+eOel
	SAAiwxZV29Kn2wgfT5OmzLgtYwLMx1lZMHTerbRV/Hcm4pU3n8fr/kv1lfpLkVy+
	2+Bt9iZ+jsZlcdVFduKrUTxDMY+iJbvlq6MUJD7qeVl31UeWUy8fGv1kOJQL8Qap
	dIxgmKPJfqJaP6pUzQ30HDEIWW7YKwrRTsDAOFiYVxG/hD0DApvLVKoPJFA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c3h7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 17:31:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d59f0198so27022175ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766165491; x=1766770291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HoP4zgJI2HQvPd0VfVnVmAlTXxAtZwgmAa2Xf4qdeI=;
        b=AFc3Dg5N2NNIHkLxPi6+4sXnc9VoSD7xHm3VkTc9wGDFpbVo64QVCcMYj4zdLGqCUT
         Uxmt7mU8RYmgwcS14VfBSKZTj45kEXk3YYh2bT4EXVlIUG6810hVkCPDMe1+f56G/kkT
         /md5qo0zjqK4r3HVc1ZYuBWgwuFij8E6p9XaQhW/CCmqQ5rO67nTsK10w51Vq0lKaj0J
         XPgXWzqW1Y61CJJR/Tly/LYowdA0/S7ZZ4A3dla7MRiXruPrwRuCfMlNs0lWcliIBscq
         zJBuF6BT35xmKLF8LsHR755kew2vcftNJoB2D8BRUNGxWuA0YCaJwXiXIa1K2ESAW1Ba
         JHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766165491; x=1766770291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+HoP4zgJI2HQvPd0VfVnVmAlTXxAtZwgmAa2Xf4qdeI=;
        b=OmTtn4hoeWEGMrJfhlERsi8OnIiWG4JnEJmwXAXMzrliIQXeEgueNAoJC0vn3jFuXZ
         X+lgbMddrN990GJF2PwWlyHEj2dkpxqOmmOHDRg7vDZsQCiUvgX8LDvgb+mdo+goPqQJ
         WSuvs+p90UNaESW3qbIhM1NJ4KkoPLtcvL6okvbxqT45cXKagG1H8SFxTYkUwfTJ0PaV
         asADSIQZSs3zckzGjLaKHwafnUPNvxxASA0z2xaffxYde7ZK+JbNSiagsOq3gUeQqmlv
         r8gxcY5Jftrodq8QlWev1m2P/scjjnHFVts5iSRuirP/LeXR16EcEyzviT+qfa8xhiRI
         AlCA==
X-Gm-Message-State: AOJu0YwDGiDhwAyG4mBFk+hwSJgd6kvDZomwbWOaWgq0VCQ/LvD1lT0z
	VQndNZ9t8R/lU+AvOHmv/r1zPgEOgl3p3j9IoG5LIKCRy8a1pRrEPlmC+fflqQVOMKjFvraWNeW
	UrpqAJLr9jyG7j2b1GoUoUm4lyIO1flxoeARmBHX9IZHDklcR+Wz5u1W2XH8/dZgXXy3x
X-Gm-Gg: AY/fxX4WZ1DwaLsxi+CffFfstUbhJTNg8geKpOZ76GjFlo2cotAwN37NfwUleTLezDK
	pIgzEbavZf41lbVlgk5W8uCx6ZimveYlwcTaeoqP1eafNxnXSSLuD3NaBceiiGjEQnfDiNVLIZg
	tZbjzLB2lUuano1yOB3UMBCfPquBZ4sI4zyN0VxeIRkWFnUkMa9G3/7OeUel2hQkAPc2yHlsAd0
	vu7XeaDo8CPX7WJ979/YZnCnf8Nia548IW9luY+kxB3jtAobhfyH4GIZMVtSRkVV/4PGU5f5EYb
	6rduK0DhQm2rLAMQ19U7c5mgbmP78+Xydt412CA7V4XubJrUJ0l80sFLz+5bO/w/RBYHU8lLQvF
	FNvEOz4NZHgn4T8kgYFvJGqc1s9XyDXQx7SIU70RTcADLRdg=
X-Received: by 2002:a17:902:c403:b0:299:e031:173 with SMTP id d9443c01a7336-2a2f273241fmr37253055ad.35.1766165490836;
        Fri, 19 Dec 2025 09:31:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzFvMAdz5PgeVAw7CRcWyMY1NGSIrH3Y8keTUbQcE42aBNKPhUnO0LQAbSyeCDChvPK6N/zA==
X-Received: by 2002:a17:902:c403:b0:299:e031:173 with SMTP id d9443c01a7336-2a2f273241fmr37252505ad.35.1766165490222;
        Fri, 19 Dec 2025 09:31:30 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5f5dasm27568705ad.82.2025.12.19.09.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 09:31:29 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 2/3] phy: qualcomm: phy-qcom-eusb2-repeater: Add squelch detect param update
Date: Fri, 19 Dec 2025 23:01:07 +0530
Message-Id: <20251219173108.2119296-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BDi7DtejOZYIB6rIJWWKo4YbrIdA8JVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDE0NiBTYWx0ZWRfX+F0I7IgOBL6G
 Qp1RLZJSqIUloXeEwCy2PBxfK5qZPuni10FnIyEff6yKfHI32AodHwavyoVgv90Vax1wafRRzhQ
 BrC8bFIRJJtJw7sdJwJGWIqIEFOL3f7QWNdXG+46iYAWk6CHOs0LK1Uu7TWUEPEfwo+I/pb8sOi
 1KBJrIAY2JI5e34Y384KS4MdM/QkdFkUfpOJtpNf9JPUT+RQ3Om/Q2l4/o7rk9Ja6rop+5KtA/K
 HqsnrnPFwhElTMc/QeP98QMK3CxEqlLBM2vn4M+lzbczoXzv98ML2P+ehjRu3DuW5FR8/ZAroWC
 2evFVNSHs7DxVO7JDpneL/c4DVtNpOPbybCDgSUrVi2nLOuzEckGUGMHG41UoOCqHn/zWDHR5hZ
 q7qjHMuj0+fQA+rPVPaknAoKFVbL3yjeh0XCwi03KXF/9T7seZa1HTAC/1x9I5JdD5e6Kg/nfRt
 xjSEZ94D09LcUHoTLMA==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=69458bf3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1szMwrN-8cuOqQ1sM4MA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: BDi7DtejOZYIB6rIJWWKo4YbrIdA8JVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190146

Add support for overriding Squelch Detect parameter.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 651a12b59bc8..a75b37d4e16d 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -37,6 +37,17 @@
 #define EUSB2_TUNE_EUSB_EQU		0x5A
 #define EUSB2_TUNE_EUSB_HS_COMP_CUR	0x5B
 
+static const int squelch_detector[] = {
+	[0] = -6000,
+	[1] = -5000,
+	[2] = -4000,
+	[3] = -3000,
+	[4] = -2000,
+	[5] = -1000,
+	[6] = 0,
+	[7] = 1000,
+};
+
 struct eusb2_repeater_init_tbl_reg {
 	unsigned int reg;
 	unsigned int value;
@@ -120,7 +131,9 @@ static int eusb2_repeater_init(struct phy *phy)
 	struct regmap *regmap = rptr->regmap;
 	u32 base = rptr->base;
 	u32 poll_val;
+	s32 dt_val;
 	int ret;
+	int i;
 	u8 val;
 
 	ret = regulator_bulk_enable(rptr->cfg->num_vregs, rptr->vregs);
@@ -147,6 +160,15 @@ static int eusb2_repeater_init(struct phy *phy)
 	if (!of_property_read_u8(np, "qcom,tune-res-fsdif", &val))
 		regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, val);
 
+	if (!of_property_read_s32(np, "qcom,squelch-detector-bp", &dt_val)) {
+		for (i = 0; i < ARRAY_SIZE(squelch_detector); i++) {
+			if (squelch_detector[i] == dt_val) {
+				regmap_write(regmap, base + EUSB2_TUNE_SQUELCH_U, i);
+				break;
+			}
+		}
+	}
+
 	/* Wait for status OK */
 	ret = regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, poll_val,
 				       poll_val & RPTR_OK, 10, 5);
-- 
2.34.1


