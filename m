Return-Path: <linux-arm-msm+bounces-82914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF58CC7BCC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 22:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 637E0365C4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 21:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EE1305978;
	Fri, 21 Nov 2025 21:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CtEXn48e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3Eq9Din"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741130505C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763761982; cv=none; b=uloUOVT0yXunMnG4J274AUAA8UrPAqtzQtgrx6b01678U8UH7kLyT9SzZP6L2e6u7CkJmUGak9giMBntGFNfQHtoanYYpmWTQ/0akffliHT5rXhCEXGYW2nAjenCghV/VORA84R6QIuhVH1wVOgMCGsg67yK3lZBmEvP3yjq4+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763761982; c=relaxed/simple;
	bh=HWUSFPLd+PGGjr3A9g6HLs2YozW158g10FiAjpYnGlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZ6rufLndw/5YzyxQmS0GA1KqLgqOMmgCPi9otCYD6lc8h3CK/UlWU76ALpZ0LaVx+qVafOtwHKiD45XNZlbz1PTFUaCVHUb5jU/LpJmUQ2NuWz7wwAH9p733JYIF99KPiIeJjrS1RGsimmhYqS9ktRi1D9Lxo+MrLbxYB09qn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CtEXn48e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3Eq9Din; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALI6DB23048090
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eHm3kk07mQliVfpIm3cqixLyvcUkH/jOdCUCt4y8WY4=; b=CtEXn48ePCf5yDy/
	P3o/ndwrhtcxNieTYJX/jTj7PIwyBznfTAnLl/s5h5/pX/G6Z4TQR4LYh7cVclVA
	//LIfs8APW0+9FlfjF/Vxu7jGQ0lX3C8DQBEZ9E/9h0nRf+oQgJZZ8mnk8fK11z6
	IZV94zMqEol9Z7RUzdtaHuxjhYtuhM10T280KFHBPPUM/loBtqyI3H/+w+niTwFk
	mNXfcvpcj6/JiT0vlhpg3t6QlmjgRvJdkPhRWd7eV+OYivGJ4BdCTzJQqx1Eovn3
	YxCBlpT47auXAvk5zxICEmCspDaJPMnhLuba3zoOmD4eIY7sr8TpWB0DDARZ9KTd
	cY7miA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajnhjt4ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:53:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ba9c366057so7623564b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763761979; x=1764366779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHm3kk07mQliVfpIm3cqixLyvcUkH/jOdCUCt4y8WY4=;
        b=j3Eq9DinJAJUnxDkRvgBQf5oGK4JFZb1odyvBXXjg+ubfDXA1OFmo/rdF0+VpR1iRj
         JVSjv7/8jlhp6SEf81dprtZSLfpBJaqPJWUSGX66ptd3BSDpg2sf0BMCsnA3GQbEL/Uo
         CPEv1uXonW/83+AhAmDEsCANSkhbNdzH+52QEP8QNYovZz/TDpDHrdP0cEhXizE/sRu8
         X57lD5W03DRoSD1W+xRRTMc2y8hvX0dbmXwOYtdMnNblwxnJVAuKe+AWaxNzfP2FDVUM
         ykrbN/usLyosMLqbaRNroDC16ffQ/aqfbakKVfMVuyiJEx0E5stCJIw20sM5F3AWnTL5
         3qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763761979; x=1764366779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eHm3kk07mQliVfpIm3cqixLyvcUkH/jOdCUCt4y8WY4=;
        b=kXPNEzemkC1wyV6ia3i3bDO0qPCkjgLNU+he9VWqSDaII3uqFY6Mub/HTXuX4XAohl
         tWI/ZdaEYWkPa8rfuOC7GQ2xiATCCkQstNMYD185j5N0wrPFmXlumVyZeq0NmRuOMFgf
         +AtUmL2e8Yk4x5ZJfJCh+XYjJY48+Kkoig2n0uS8Jywp8QkkAL5+d79q8MCawJWIB0pF
         ohOYAV/FLk4DhRY06rulmkTluFykKaOpsy/DSLT0qIcJrBUfwGoa9LHaty3U/ClOewst
         K+Ba5tHfz72RQ/byUOyUbuX4ZalyzY3WfuUNLjhpMJ0DRQZDE2u7quIj70c7OJ7+IWYi
         JAYA==
X-Forwarded-Encrypted: i=1; AJvYcCWoXQ4bot4W2ZB/0AA2cGb92Co0d79Qqc0n1AByc4Y2bnqh6wnXLVSG9rEyHqSgs0RAxpYzb1FeUHvNtaoz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0pk5r6lyS/7aULoTh+e/4NkYhrCn/5u6kG6KoCNoFkm49fHxW
	ztyKVADoSQlj0W4sVOn9XgDl8iXR2DPYxOOL7qePyL1nEM/DBF1Wg2jqXKKeYq7jIEfCHpl0Ygv
	K5Wywju38bfWp2lvzty93DXwVkBg1YvKBw7/H7aykCJBd2eW9tWAyOuDUYWAlFvrQO3UZ
X-Gm-Gg: ASbGncs0mQe9UUs20ORJS71uvu/D4S+RO8P8wnA52kS47cy1Yj3Cv77AfqjWkchBFOq
	RG6tC9bPhNT97CwZaaLj3cbCPnzZVAQ0+iEfcGT1zCJvIKg5GmfqYPrzgTPKKNzcCrWnKNMuYUe
	vCOwN72I5+RSHoQD3xNJV4zcCC8mrXcjdR0TXOrC23D/zBt1EIEXaVQkPtlBrkpWxE+zQ+Wi1VR
	gExRtF/pannZRwua3fZ2b6Yo3wNGS+4vtI2+QA9rTkPDJc6H7IlFJoUOaT4e/LmrtFFSoTgBntu
	k9KFKXqXDJ13CNkYP1pSpK+UJZYiEGzizgatp7N+1gxIc3qbj/7K4aXQuXoJn+9wCpA/iVWCr9A
	n/PZ1HnoUDVyAo41yS6h17robtjm0p0ArFQ==
X-Received: by 2002:a05:6a20:7d8b:b0:350:8f99:367c with SMTP id adf61e73a8af0-3614eebf876mr4722259637.58.1763761979514;
        Fri, 21 Nov 2025 13:52:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8jeDuhQFyiMqvC0H8Q08Za+IBBC9Dhc90IchE6uKCrIM3WpHjYr+u8Wjxw+d/uJRqVX64sw==
X-Received: by 2002:a05:6a20:7d8b:b0:350:8f99:367c with SMTP id adf61e73a8af0-3614eebf876mr4722231637.58.1763761979066;
        Fri, 21 Nov 2025 13:52:59 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6314sm6399270a12.7.2025.11.21.13.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 13:52:58 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 03:22:16 +0530
Subject: [PATCH v3 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-qcs615-spin-2-v3-2-9f4d4c87f51d@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763761959; l=1534;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=HWUSFPLd+PGGjr3A9g6HLs2YozW158g10FiAjpYnGlw=;
 b=VYFhYFX+1vcXr2I+8pLlc9KYkUI9kmTS43CoYAD2uEHzweChP3sk4OsIeeCNc47IwSAZeO4gj
 sxesiewzCW2C7D7FDbSa7+XR3jXWXhwZCKSjCwHs4Iuca2yB2qYs1v3
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: ix9MzKZF02zEkQ1MORRydS9Hw93R5x1P
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=6920df3c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE2NyBTYWx0ZWRfXxL8oe7d62UHY
 6UA4TjkNi3CiRQKfIW0duAcxJR2UxZ8rDLAUeZgyUsrUiWXgYPmrhHC8SUUzUBHnGmVLzAkDhpk
 VMGAZUV9JNpHbeMC0iNo4/qjRNVDcnyTlQC3n+hiRk9m1pQP8YTI9E/vg7cmpzCs1kSoFpO9dME
 l4HWn8ioy84X3g5xlSUflVhHvAniKt9D1TwVgWTjgwNsAxHlW5w55uX3HuqiyGBgFAPQf2GJhcr
 FYVEZzeS3THGQP0OlL9BuJfDuik33AFLchjvH9jDrrsuv0yRk1wmHxcm55Nv08DHKSeYNDVuBse
 9CatuRngJGzbo21nY5ZEub9bh3KD8xHaUtiswRS20JEOCGljMS/8F5CzHa82z8jr55REXzXyaLS
 N1oLPYTsJ3Dn/g3pju5MRJIDLPrKuQ==
X-Proofpoint-GUID: ix9MzKZF02zEkQ1MORRydS9Hw93R5x1P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210167

A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
which replaces GMU. But it doesn't do clock or voltage scaling. So we
need the gpu core clock in the GPU node along with the power domain to
do clock and voltage scaling from the kernel. Update the bindings to
describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 24 ++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20b..19507bfb6004 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -45,11 +45,11 @@ properties:
           - const: amd,imageon
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   reg:
@@ -387,6 +387,26 @@ allOf:
       required:
         - clocks
         - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-612.0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU Core clock
+
+        clock-names:
+          items:
+            - const: core
+
+      required:
+        - clocks
+        - clock-names
+
     else:
       if:
         properties:

-- 
2.51.0


