Return-Path: <linux-arm-msm+bounces-88038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 914E2D04360
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 17:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4DB336365F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC0B3806D1;
	Thu,  8 Jan 2026 09:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/NgMbHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+eWNV/0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7BE3AA19F
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863093; cv=none; b=DamP5zHCW/wpn42E5SXvfFAKngOmFUYDy6agn7QveilF03Sab+VZdkQOAcJ7BHnuuQPQul/kb0y2WPE/+Blq6E6HPRBestwJyh/iSaAsJW5eMVeU4m4UjwKnncVZayos6Buk3X24Pe0yL8vhxpOczRkc25HLq+qp1nmjU/mx4zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863093; c=relaxed/simple;
	bh=DFWgyPJMXnYq9tT2E5rWliTY17udrbfSo0iJAuFRiog=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eO5UenhjE1MTpkhsD/n2FyhRuQj5vdzf2cpUvlMXm4tQMO2oceo4fDfle32bL2Z9NWCbzW3ki1AA+CL42CQMIU1MuCWSyat4lB+ItwP5vUu/qSBE7X14i7PZDzXxHtPie4UHO3Fr+XHlgr+P11Rmuz9mBBTeZA2JUMwfjMFSJVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/NgMbHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+eWNV/0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088hBJw4049342
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 09:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NRZ5PDF9RBE
	hUcKxfeiWyFu1TAhirkb+W51QleGLBP4=; b=V/NgMbHGwytnHcwRH+OIQIbn5sb
	g1pDt8phGBBmNuweA9cE5zhRdgAEOLbiKoBpoAFK3N4pFhjJAQh9+WuCgaqPQr8H
	ePDxx+Lfl8/v1CMv6dKFJU//sbNaGu/uE0St/HIRBgaro9CpLvnholPbJ80UZNBe
	tcx+PAS6r8voI/Lliaq0fLXGSuV4oMn+QRneWqVaA73yQ8/5zPTt/EpNffygC0Ue
	ux2Z4ubAz7Tlri/6eYKHaq3ELsR+Zes/mt/dFDMoTu2ArCc9eFg+PKdG43BImoAS
	39JJ+TL+9euaH/H894Uf6awGPsPRQL1aKM1O+94JqXrma1qalJ8SvgZcazg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8hbcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:04:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4fc0d0646f9so116216071cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 01:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767863081; x=1768467881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRZ5PDF9RBEhUcKxfeiWyFu1TAhirkb+W51QleGLBP4=;
        b=S+eWNV/0ZuxobwGY8Rsv8X7L7XGBxpTnCurFY38fA1x+Qna/pbBBcn03+DvUseSfhJ
         eSRusLYLJ4iWAec9PpoA7x+23MHSTfe88v97M2I7C/1yuQYi+RG5v7XDirMJKphyyhhJ
         uOg1q9ykJ+qUJBjj72A7oFTKMkZ/pMBYpaAbPyrbaIIM/5r+Wb5E90gFx25m6kDduudv
         3Etq9Ql8nIIv7rwbXVV7IhN/cnwhhUpxksC52s/9Kc2uZ28IhXkGyIB625nNIsDEAxr/
         UQ8h0atYn4yg3kwHUSAAzdpb45pP8I3ZKQYousc4j9++5uhhG1rVY/ubCemvwLJQHSJv
         eMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863081; x=1768467881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NRZ5PDF9RBEhUcKxfeiWyFu1TAhirkb+W51QleGLBP4=;
        b=d8kWzn/NB56qw2SaM0dPu2/MXsy6toH3f04k56HPCv+GdqKRnKNGpIWVD8ab9NoDmj
         ukZAdedaLc8w5OaQltLTQTpIUBIijhV9S7jlCMWZjxo0E3hPfAbnmFej3c+kbVHwsjUx
         TAVP2b++/iUuJtA1+vMkolKBXZIsxLmEmByuXRp1KCywmeJY+vGBfNMLaKBJRyi8YuvW
         R52J8E5ksf84pquTpVgwCSEgaRrVmFITfchOjOKoh5Ss/VHaDW7pE2/C+vtWaier/HtW
         mouyBvi7CHFeiEzTGwOzfK9m8+FiPSwiS4onhn4WqRA9HE/9bndLDDYGRrZjCVcfJWSu
         LBUQ==
X-Gm-Message-State: AOJu0YxWXdile568ew6fOIwq2Ec34aGi1l2Cn+8Y9VlZY0koyBQ4LAlC
	7ZZ0joJHLQd1wJdaWT6XDCAvrlSCaUPDWG9TpJEtXM6cKTy9fslxLyo3p9MwvXnP27PSyAxEewA
	zxPv+RIQNgPuWUsEdXlCGhcwWrqDbtUCvfj5o/0/uv9fsOyIZ2k9A6xHo6kmpU4eXpVvG
X-Gm-Gg: AY/fxX4vd7ihrbj6vOoJflJtwoS+FOieIc767NVmL4UbxaxIdcj6QwiKbs4WMtUs6qe
	her0egGFVaQb6c5/O346JhwJxbmdDWHAoHwsl0u1x9aP6DLcDjZDuglsSqUanSXagyHaz5pydjR
	m2Dxk3fH27WP0W2PTz2wpAGkxoxm5k+/lVoYaLxArlQN0zWU3j25WxZRY1ZZs+30Y1N03kRZT5F
	RyvkfqlMaYJR5k8eveW1pdvZtGBcpnklejDOb6sm/b7W3Of0dLJzk3rbTu2BW/iNFwu+HdQ6QAJ
	1exEtQnn+kNc71gle2PwTtCPl6SXdksMxs2/Lfu8d3CJwrl+7u8BkFjsyhy2G2W62OvD5ygQVlW
	ctEnhc1wEOpLVplslw4vdqOZFDN44QWb5Bx9YUEmjVd0va5T+gZ7Z8VOQ9csASuXCjBA=
X-Received: by 2002:a05:620a:298c:b0:8b2:e4f0:74c4 with SMTP id af79cd13be357-8c389425fadmr683909885a.84.1767862669524;
        Thu, 08 Jan 2026 00:57:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLLiQ2dezWmxrUQBvh6EJdewjfDR82QVVpGRNZoYXLCqohZhvAtKpz5cj7Yjy4V79SxksFKQ==
X-Received: by 2002:a05:620a:298c:b0:8b2:e4f0:74c4 with SMTP id af79cd13be357-8c389425fadmr683906985a.84.1767862669125;
        Thu, 08 Jan 2026 00:57:49 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:57:48 -0800 (PST)
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
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 03/12] dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
Date: Thu,  8 Jan 2026 16:56:50 +0800
Message-Id: <20260108085659.790-4-yuanjie.yang@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695f732a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: cVlMKjKwuRCKv2bciy0ABf41YBSd1Fzn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MCBTYWx0ZWRfX9TzJFdRu/KJZ
 k5tMKJnf+KM7lS3HUv9mFxhCGYck8WHKJPCUhMFHh5tmgIlysuHw3VVyLzI3jrgAzWFENcxAueg
 DmJlfas3ZNhwu5LupWFQffXW1ctF291zEtCdCEG91rqjjzNmYPkEd5E2bRrY7jiGh0iK3CdJbR3
 IUoJO1UpExs+261GtJNUHydAoAZ+hoyZ0WJ4BFijUCzGsFHJMvp8i1Xq2WoB4XZ6tTY1CEjhrI0
 rpcbrjIIf4yzh/ZcQU168HyJJ+ofeVGK9/MxjdjZDpOVCG+mMGU9EGf7DOpEaqSgiPObmnzoNs+
 ttwChi2F0cDCV7aLhwnsdAV7YVKg35GY7RbLdMEklxhoEksa2xFsYmT6yWdIAWvsnqZf1QGnbjs
 +WqnCr/3iz8dFr2LkY/Dm3LE4v+x7+VHno0DF8MjBoeNY4MaJDlDKLDzcq6rn78ErnFIzapuB7d
 Y5XEYPuWsHncDtiCekw==
X-Proofpoint-GUID: cVlMKjKwuRCKv2bciy0ABf41YBSd1Fzn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080060

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..536ebf331828 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8064-dsi-ctrl
+              - qcom,kaanapali-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -369,6 +370,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1


