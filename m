Return-Path: <linux-arm-msm+bounces-18928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 056178B7046
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 297581C21B14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 10:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F6E12D743;
	Tue, 30 Apr 2024 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RovFlgfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461D212C7E3;
	Tue, 30 Apr 2024 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473859; cv=none; b=mx4/JRaWl916ei2A6BKy3Ymx5d5fKl9PrQl5fiq7X3lprFt94rFR+qX36gaDC33BVHWLxhZwgM0RJRtXCMvmQM9OIGmlVM6WAOJRlh+VH+9nDWfV6nWquarkFNf0B0wknyRtmZ3dBB66VVeg2obISWkXXwqYiw06pFaelgIog/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473859; c=relaxed/simple;
	bh=c+88p0lQCwZBgjudS09WX2xUrrowQXi3V2QQ7pRe9KE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tsmfZ0FyieCHo6t7qRO8i9udPhFKlY91qqTrj2/5XgvDKAOczU1XQwPVuqhKk1b+hSUFbLU7K4+LD+sc1v+I+MiB6hwP+Gxw0ITnEQVAN0Trlm3rG63rRCMdbyTZOuqazRu822LLw3QWiNM4vLLxlhOfbmn5NRDxSuzyN9hnQJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RovFlgfp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51ca95db667so5152566e87.0;
        Tue, 30 Apr 2024 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714473855; x=1715078655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fIZAMLKrn68+iPcM1MZC1QDKImr0pd0PNuLPpIoTqg=;
        b=RovFlgfpAp7Dw+pEg1/aX0sECUGcoHy5nGkykz9I+JPSXZidJNeo5uo2OFKlkmolpy
         HYj8eLG9GNHHIuGSrFlgUcUMWMOMBYjEhqqTFjQABVh7vv+vo4YTPX2oR+R196ZYrSB7
         iVtXUHOWdQe98vk04W00P7zpO/un7ABXo5MgHj5uplgAmY58uBCU74pxg7xtQMWyu2lc
         6V6+ZWQf0Aga7EJ/4aQWTmMgV1cHLPNxPSKJQww9lJfu1E28sJ1mhtq4mhbzdS8x7JGW
         4s7ZA/gt8H9iR88AEfeozN5WlNiMoRQpPuRwPZVLDQVdSQWf/E/+2V0IhKLEya0hNJSB
         LHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714473855; x=1715078655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fIZAMLKrn68+iPcM1MZC1QDKImr0pd0PNuLPpIoTqg=;
        b=XeRWV0KFK2rNUjPYU/y2koK0ZyjLivcdqgz9k61k7oa2eHYquesyXcuxk9Hrkvnvwl
         u6K4302FZn1SzWg45udAt1iwriJQOBIkGF2cupqxBnRLYWykQsVFAx1JYFcyhSvb1oKZ
         yYqND8LU3fB03xoqZZ3PjOnFFXF/cVi/2AxuY5Ai7BlZrOxrwlmdXNeraQ5GNVw/O0FL
         xTgoWfzzV9WV55a2rnPcy35SqCdaBlemuwpFDT4Cru1IzDuIDC12RXNn+cqBMm2WDNEx
         0wTdv9avPdvuQ4zUS3sUELRJCOMFnGjGX4Tuhkum1gmpBbcN4B+n+bI8AHP8e3Y3GVVW
         HG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXG5U7MFrrp3xe7pku0qDiDUnHyb95mTBafe+flQt20KCJsQDvKRrVdqK5OrtEZX4w9nF9XCvDJL+BDmx/idTgas7Np5Klt2pmH2Q==
X-Gm-Message-State: AOJu0YzaGjAPzj+11N4hoSvF5iZGVOeatpacDoPA8ZnZDKJj3QZIqjpL
	N3OdY3dQe7vcdvmaunr1VvQX++X51fp2YPk8UQRh/t7/HdM8sIkegp7JZqWj
X-Google-Smtp-Source: AGHT+IHbdSDSCtXvrDecfMeuE7DKQrWWYnF48VKpR1Ungr88tUta8SukgRbp1hvjjH0yefsym0hfHw==
X-Received: by 2002:a05:6512:b88:b0:51d:9603:3f7e with SMTP id b8-20020a0565120b8800b0051d96033f7emr7264133lfv.34.1714473855097;
        Tue, 30 Apr 2024 03:44:15 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:44:14 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:43:17 +0100
Subject: [PATCH v3 3/6] drm/msm: Update a6xx registers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-a750-raytracing-v3-3-7f57c5ac082d@gmail.com>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
In-Reply-To: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=4625;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=c+88p0lQCwZBgjudS09WX2xUrrowQXi3V2QQ7pRe9KE=;
 b=eB1tOZ9YUFlMBVXS2hBViZlVbaW1iwBz+gRI2uiBFiMv2WxAR/dFFF8fIfY6VOgRs8WvvImwr
 kxGtqYMKS4EDXuggoE39jDmRNwKmDRc8gCRvQAZXrF28Q4Arph5zoPz
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Update to mesa commit ff155f46a33 ("freedreno/a7xx: Register updates
from kgsl").

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 28 ++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 78524aaab9d4..43fe90c12679 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1227,6 +1227,7 @@ to upconvert to 32b float internally?
 		<bitfield name="DEBBUS_INTR_0" pos="26" type="boolean"/>
 		<bitfield name="DEBBUS_INTR_1" pos="27" type="boolean"/>
 		<bitfield name="TSBWRITEERROR" pos="28" type="boolean" variants="A7XX-"/>
+		<bitfield name="SWFUSEVIOLATION" pos="29" type="boolean" variants="A7XX-"/>
 		<bitfield name="ISDB_CPU_IRQ" pos="30" type="boolean"/>
 		<bitfield name="ISDB_UNDER_DEBUG" pos="31" type="boolean"/>
 	</bitset>
@@ -1503,6 +1504,9 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x0287" name="RBBM_CLOCK_MODE_BV_VFD" variants="A7XX-"/>
 	<reg32 offset="0x0288" name="RBBM_CLOCK_MODE_BV_GPC" variants="A7XX-"/>
 
+	<reg32 offset="0x02c0" name="RBBM_SW_FUSE_INT_STATUS" variants="A7XX-"/>
+	<reg32 offset="0x02c1" name="RBBM_SW_FUSE_INT_MASK" variants="A7XX-"/>
+
 	<array offset="0x0400" name="RBBM_PERFCTR_CP" stride="2" length="14" variants="A6XX"/>
 	<array offset="0x041c" name="RBBM_PERFCTR_RBBM" stride="2" length="4" variants="A6XX"/>
 	<array offset="0x0424" name="RBBM_PERFCTR_PC" stride="2" length="8" variants="A6XX"/>
@@ -2842,7 +2846,11 @@ to upconvert to 32b float internally?
 		</reg32>
 	</array>
 	<!-- 0x891b-0x8926 invalid -->
-	<reg64 offset="0x8927" name="RB_SAMPLE_COUNT_ADDR" type="waddress" align="16" usage="cmd" variants="A6XX"/>
+	<doc>
+		RB_SAMPLE_COUNT_ADDR register is used up to (and including) a730. After that
+		the address is specified through CP_EVENT_WRITE7::WRITE_SAMPLE_COUNT.
+	</doc>
+	<reg64 offset="0x8927" name="RB_SAMPLE_COUNT_ADDR" type="waddress" align="16" usage="cmd"/>
 	<!-- 0x8929-0x89ff invalid -->
 
 	<!-- TODO: there are some registers in the 0x8a00-0x8bff range -->
@@ -2950,7 +2958,7 @@ to upconvert to 32b float internally?
 	<!-- 0x8e1d-0x8e1f invalid -->
 	<!-- 0x8e20-0x8e25 more perfcntr sel? -->
 	<!-- 0x8e26-0x8e27 invalid -->
-	<reg32 offset="0x8e28" name="RB_UNKNOWN_8E28" low="0" high="10"/>
+	<reg32 offset="0x8e28" name="RB_CMP_DBG_ECO_CNTL"/>
 	<!-- 0x8e29-0x8e2b invalid -->
 	<array offset="0x8e2c" name="RB_PERFCTR_CMP_SEL" stride="1" length="4"/>
 	<array offset="0x8e30" name="RB_PERFCTR_UFC_SEL" stride="1" length="6" variants="A7XX-"/>
@@ -3306,6 +3314,15 @@ to upconvert to 32b float internally?
 		<bitfield name="DISCARD" pos="2" type="boolean"/>
 	</reg32>
 
+	<!-- Both are a750+.
+	     Probably needed to correctly overlap execution of several draws.
+	-->
+	<reg32 offset="0x9885" name="PC_TESS_PARAM_SIZE" variants="A7XX-" usage="cmd"/>
+	<!-- Blob adds a bit more space {0x10, 0x20, 0x30, 0x40} bytes, but the meaning of
+	     this additional space is not known.
+	-->
+	<reg32 offset="0x9886" name="PC_TESS_FACTOR_SIZE" variants="A7XX-" usage="cmd"/>
+
 	<!-- 0x9982-0x9aff invalid -->
 
 	<reg32 offset="0x9b00" name="PC_PRIMITIVE_CNTL_0" type="a6xx_primitive_cntl_0" usage="rp_blit"/>
@@ -4293,7 +4310,7 @@ to upconvert to 32b float internally?
 	<!-- always 0x100000 or 0x1000000? -->
 	<reg32 offset="0xb600" name="TPL1_DBG_ECO_CNTL" low="0" high="25" usage="cmd"/>
 	<reg32 offset="0xb601" name="TPL1_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
-	<reg32 offset="0xb602" name="TPL1_UNKNOWN_B602" low="0" high="7" type="uint" usage="cmd"/>
+	<reg32 offset="0xb602" name="TPL1_DBG_ECO_CNTL1" usage="cmd"/>
 	<reg32 offset="0xb604" name="TPL1_NC_MODE_CNTL">
 		<bitfield name="MODE" pos="0" type="boolean"/>
 		<bitfield name="LOWER_BIT" low="1" high="2" type="uint"/>
@@ -4965,6 +4982,11 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x0001" name="SYSTEM_CACHE_CNTL_0"/>
 	<reg32 offset="0x0002" name="SYSTEM_CACHE_CNTL_1"/>
 	<reg32 offset="0x0039" name="CX_MISC_TCM_RET_CNTL" variants="A7XX-"/>
+	<reg32 offset="0x0400" name="CX_MISC_SW_FUSE_VALUE" variants="A7XX-">
+		<bitfield pos="0" name="FASTBLEND" type="boolean"/>
+		<bitfield pos="1" name="LPAC" type="boolean"/>
+		<bitfield pos="2" name="RAYTRACING" type="boolean"/>
+	</reg32>
 </domain>
 
 </database>

-- 
2.31.1


