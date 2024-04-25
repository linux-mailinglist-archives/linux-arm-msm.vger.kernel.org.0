Return-Path: <linux-arm-msm+bounces-18566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B36FE8B2314
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 15:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D3EC2862A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 13:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBD3149C6E;
	Thu, 25 Apr 2024 13:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wcv2WN1x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CA8149C7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714052690; cv=none; b=CWVvB481eG1ormAa7DhIGgZB/GPrj7YussMFnLmMfrzHnYjAktAa/KuM6+qypwjiTtObO7aolsms/GuLTOdawCynQtjqSGxwkBgCpqoGU6MAJbFJsUCOGYVtegMsY+HpD0TDsKluVkXXI+SPH0gc/4Rw5lEHxn+iCunih87zgO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714052690; c=relaxed/simple;
	bh=5WZhqwbdGj3Sg68xaK4arCck6q23nSTMtnsPPcHS2yU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g1qGu+pzZVCo5/Ib6/Xpsb0JmP2pdvsTuR18iTJU0SUL2m1SzSWL7cVXYrbW2bKnVnEfSijwjd1kS6CT399NLyVX+2nei4Lr5ILL7RPr9LhK3BM4H6Bp60QybUsH0oGVUCnATt8tftriCgO2H4HVypAEBLcq424f7Pxzwvh0EVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wcv2WN1x; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41a72f3a20dso6585405e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714052687; x=1714657487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RFVnmOo8A5tNCWQYVrv1gyOa6F8hSBqaR1nrZ9un+U=;
        b=Wcv2WN1xxNYmatndNvzkY63ECQeWBsom43zvOm9A9VVS9pVGoBHMIHGceYAMAQqjoG
         17EkjhGagMR7iG0x0qOuw+Qrhn3QJBuDMC2WQEr8J0oeCNw+t4nYSMxIvtpfZlcsWZRc
         qN/INXu3aflQK6iMWhtStjphrXcS1nkKqT/UgN659hG0lZDiGwVCW1isrwnloh/x6TAA
         2lDcdTiFmoktjCXeQrtEhJTrXsCfLmkSYgpJds6/tkESfIknmK+IEGTq+qOXdTqszC40
         /sZWPKTiQXwyDJm4k8D0tJf7aVjcMaXsVb8Twa4uuEJurqAAu+xHHhNmSlLtXtqaop3j
         j8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714052687; x=1714657487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RFVnmOo8A5tNCWQYVrv1gyOa6F8hSBqaR1nrZ9un+U=;
        b=BTGFFZG/PVgrSP/UGOgAvzk78r78iCSm42LAt3rB5bEWka2AebeE4wvpTOUKcihlig
         mN5B3jpPJ2pKiuaUlkEjBpS3IQZ8LeT7nbe5A+RAMeBbxk1TVFRmFtFRYOmoF9LmAMo2
         wr72EYFqCg/HUTOroVL+EpGuJuUWi8V4niAOq+2DCrIsmuNix3G3TJyNZeMVmsdLl0+e
         IYaPsRGJnrPRboY8BfticQ2KUzAQ3GiDuPn4Q52KNEbNIylumcjpNmjAv7XPdBwRL5Tr
         gHaKxVVfkVbMXaaTG6jJwCPeLhiJqVaygX5LW4tdvLJb3iLngoTU5jyggcswTSeq/Rw7
         G+Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWYVDWhaMt2CF33npHaXjscCrYPK/nuKgZ3RSD3oQtNrGFpWRF3Jfut7uv2Tg4z+v7QlJpb0ZK1X4j0Lc5eP6o1vVu3aTxnUbVpdlRXQA==
X-Gm-Message-State: AOJu0Yw6Sg34uEiNERchhwXzLVg/eDXuA/UKMLdUOFQdXrQ2Sn2+Mbpj
	YoRnBDsEevJeXH/KnWGHq6+UqTXkpzSRt2e1VITmlyVMK/4vT1+N
X-Google-Smtp-Source: AGHT+IF/vzLeiuLcCVw2n0fBwad5kx+1qLvBsRs9a1VyKzFnQzt6YUgMuJbFTayG4LQSuxcQ3ZGn3g==
X-Received: by 2002:a05:600c:4fc3:b0:419:87ab:f6da with SMTP id o3-20020a05600c4fc300b0041987abf6damr4553524wmq.3.1714052687207;
        Thu, 25 Apr 2024 06:44:47 -0700 (PDT)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id bg11-20020a05600c3c8b00b0041a9c3444a6sm11235579wmb.28.2024.04.25.06.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 06:44:46 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Cc: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 3/6] drm/msm: Update a6xx registers
Date: Thu, 25 Apr 2024 14:43:51 +0100
Message-Id: <20240425134354.1233862-4-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240425134354.1233862-1-cwabbott0@gmail.com>
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update to mesa commit ff155f46a33 ("freedreno/a7xx: Register updates
from kgsl").

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 28 +++++++++++++++++--
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


