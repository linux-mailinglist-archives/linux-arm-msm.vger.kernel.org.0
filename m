Return-Path: <linux-arm-msm+bounces-81086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E4BC4834D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E9E54F37A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CF42EC090;
	Mon, 10 Nov 2025 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqDjD+Ax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SoZxktca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6563631AF3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792853; cv=none; b=F91cgFn4JoBoeH7gDbNUs73J3IldJ4hN8O2z13AMMSDWeTpWuEIQ7sgNhlyFCWD8lpWw91CPl0eqUq67/ySeSG0qCcA4SXf38SG8kOgQx6JwNQMwUF7wVTessGNLF8xa5Q07KLgcdHBZM9pmQbA5Cp70mFjR9vmoHYftI+s24XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792853; c=relaxed/simple;
	bh=i/XuvOyeT2JCaHOlG1NFL84HKMryUVDsLqPOa9zMe8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bxf9efno4Ere1qbcOsZxwwI7Au/r1biadXgWuzTR3ik+756mkj9BTJoLFOZlrg0UqqlbLAE9nwOa53A0L5M55CvCOh7v6lHpOpsCpvyqgtvsNzup4/PTfRVDwLcdy9hZBAqFgzOkNYxCd4NIZXdn54jlVa1bV61hCYAcG9Qutb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqDjD+Ax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SoZxktca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AABZX5F3271045
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YW7kalD2buUlilIlPcd/kOSgkuR2289vzcuRgzPf1Wo=; b=LqDjD+AxC0ozDLV3
	DZesPF2KWyNxNUxlnx6q8UyFS2ZMJU28gRU0nLSP0MoiEEFfbh2eao9SZtrUl0sd
	e8DgOZAVM3ynTyOaFIwBkTrjN+Soh6oYgFKKnunmsBUnnhv0/e1ytARgQU7DRV5d
	XhgK1sZJ9eME5jmY0pDBXVk8ovbQnPmosf//dauSBmhReO5lV/BQwBpRzAdvK4sl
	E+G6+JJ3/DKp2R7kefUfAshI04MU9P5vViXA+Xm8TgUopVg8HURmMPcprBMEYbnf
	Mbbzlv4t4Y+4YzwquiDoGYYFTMfRk12JjwwHetWzIdsPxs2H1WP+gbNHRjezsgXm
	AlhY1w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abfafrvv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:40:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-341aec498fdso5194085a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792851; x=1763397651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YW7kalD2buUlilIlPcd/kOSgkuR2289vzcuRgzPf1Wo=;
        b=SoZxktca45KJ1lehE5Iu5AEIbG+N6IAQ0JwP4d8Uiy9ORADd0gPrEHjsfuJj9nWOu4
         PRhWGtY/2pU+P3MfGrIc4rfvou0fxQXj03Th0pMn4fJ1B9ky76a3PpBFPVFmyNJV7zrm
         XmIS8LJImuqncjCApvxBvYDnVsO/ccAD1a6VICwpbo4HS6+ItvlAzvL32W2N0rBjupkH
         99oY3ch2C7t/b0m/Mb73Ob0mmdwhwrdaiUlTLDTx6rMOJEkKGmNoMwxu5tYuiBqmzfwr
         twpzpF9fIprkWrfG2IDMJhxKxMJ0Hn2C92Zs+TkUtXRAMLXVklm/VwXHu0bmLBYvnWMI
         5S0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792851; x=1763397651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YW7kalD2buUlilIlPcd/kOSgkuR2289vzcuRgzPf1Wo=;
        b=Q9ffNYO/Uayj6btf5pTlHEJFZXdT8bw+kOFOpDUlWxpXxcTpVS6PpfbhZQC8gMje5x
         DwAN/6dAaS4JTcQuwQ9nyzUNB/2uR+ZPvSIQ8Zn282QQxD9hWhIwv2vj7sTZNqTqHCwm
         2e0FaI9gxFdXdWzKKD3EaoZlaNS7r7I5+4ts/62/IZj0pTWIXg8vTSM0a7zM9YyOw+Cd
         kLg91cV6GZN59Ryc2CSClF8OeIk9Sw6npKm9pzJLCk5BlDw0jECxpntqNA0Pn+3SHaxv
         +UFNqdJHYltfs166V51aRY9VfsZYxxSnjAe5OLVyIrf70KP+r21F7JtEOqAii4eSoPzi
         X+XA==
X-Gm-Message-State: AOJu0Yyx9SRe1LQBGEAsvjnDw4uCCSmRl28HxLpltNstfRa9CjLg2DIN
	qwDoqBuLdS1yzXd/fQNmrmAZN0LrS1d3tQ7BhNcvSNpbaywi25dvkXV1ZitqOCu5v9fyuCOUHy4
	QVQCxG/eCt53Ny2OU7yN9y1SXDq0BQQXQy2ED7+gi0AzxlD87YzaVJsv2YEAPIuqfaPgh
X-Gm-Gg: ASbGncs6N2P0mxzhQt09ftaxNL+xsZrkH9xe6eFK6cPux89Jb2uBJGXfDWACcSngZi9
	dgJTUeynl0kC/LdE/cSolelWyNzgLhDseDx6Y/svBLDjYxrSWL6fCk/mk0OETiitAi+kNB4/cIg
	3Gl0sU/0p17j5Q9MwDR9uNbai4XeTIQnfqcLzVQdb639bIdzVFXX5cx+WIG7h7FsQHvvF0/X1he
	Xf53evSjBYRt/yoRjm1OOiOyD8//+D/0PvRvte618mTv4qEgAAcWySZ42533vUZvRCWwvaxcCfC
	ZX43hWkyC9EgcvVHzqnddQw7PNauZUcqg+zCPOvK5KaQpbVMacqvojgmlSDJVLYgEcAGxWqlk3U
	DO3ydF1SGRAI+/yyEI7UaW1I=
X-Received: by 2002:a17:90b:3145:b0:340:e529:5572 with SMTP id 98e67ed59e1d1-3436cb118f4mr9615742a91.8.1762792850863;
        Mon, 10 Nov 2025 08:40:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9pMY9BOOQfsUqFBoMftON8+gbyhMo9vgaZeaC/P2wd397OdPBRxrPP6VrHlsLz8Ax5SqN6w==
X-Received: by 2002:a17:90b:3145:b0:340:e529:5572 with SMTP id 98e67ed59e1d1-3436cb118f4mr9615700a91.8.1762792850322;
        Mon, 10 Nov 2025 08:40:50 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:40:50 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:26 +0530
Subject: [PATCH v2 20/21] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-20-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=1613;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=i/XuvOyeT2JCaHOlG1NFL84HKMryUVDsLqPOa9zMe8U=;
 b=Rl0fX8fht+QUdLlWazjj2MS5zkr170ArJ5QP1nziu2DVWhQTh/19rZUXUtypkQfxsojWb1Q2h
 Ei7iatRwVopCf/T2t6JmwEaKOde31BcZ5fbInGGq30cfsAbYCW1oUR+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: qhgnkN8zOD1E2vd3q9yAPnhGUeYbaXZ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX878/tRAhLCpZ
 uxYKPz5Fqdto7ziHFgwcsu24XygSyKysTiv6OeAgtuaGwu7/0zZwvd2G7MhGPMmZdMGCfdd+PHI
 8AEG4qJxC9dCy4VW4wxQDN8MMQ+y2k0qmt4PAe1ye6Nl/fu3l/UL3Kq6z0Po2nmAL87AQJHWV6Q
 Q2bZpQMHLyJteIsVKlGOedb52Uz0NbaywGDm4asEvd7fpO8PSLTgf9G1ZFJZvdhsrTnSk4Wn4gk
 RvdWqlAlA4UMWgB93F1CFPKXEoH5hjWfNjODhZ8VCJWpMhiYDDbKRZzqmfmLgGYxUfXrs/dXc+a
 c4euwTURmtaAhgcz4qNiD+L43gL0DvBMXkBMxCH5iVO7n9ocA8xWLnBybLSMMdMyagJR5ZHqkHm
 prRasHx95NxHlS6le7cebUuYEre/xQ==
X-Authority-Analysis: v=2.4 cv=UZJciaSN c=1 sm=1 tr=0 ts=69121593 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_Uo5JhhLEGw40-SN2AoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qhgnkN8zOD1E2vd3q9yAPnhGUeYbaXZ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100140

Document Adreno X2-85 GMU found in Glymur chipsets in the
dt-binding specification. It is very similar to Adreno 840
GMU with the additional requirement of RSCC HUB clock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 2ef8fd7e9f52..e32056ae0f5d 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -327,6 +327,36 @@ allOf:
             - const: memnoc
             - const: hub
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-x285.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GMU RSCC HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+            - const: rscc
+
   - if:
       properties:
         compatible:

-- 
2.51.0


