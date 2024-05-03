Return-Path: <linux-arm-msm+bounces-19180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 832A18BADF0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 15:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 127D51F2262D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 13:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36FA153BE3;
	Fri,  3 May 2024 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjR4INXZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1713B153BCE
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743801; cv=none; b=SZaG3qusVGC1x072WTy32aMGxPjBsCRuN8P150JvLrsJfnEx60Sy1nb95FKbMh/njHaGarUyFuLewRy1LCC7K4roNM6sfRiVH+3KiDvgY8JJ52zT8LzcjVMhdoOJPzF62HZeelGPnUD+2G74eCj7OJXMTZczmee4HI/9j4aBFqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743801; c=relaxed/simple;
	bh=ezAgAuArgCd+tmkLIfDI7l1WOjk7yaPZvxxhFEDHLkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YhEqZKA+KsBOUYeC4NLzBNlSRJDoOhtnTkH0/EbORBQEFZsPwpEs5BPMZ2LwHy1osba//5/JvimELTi+0rtRHoL3altfKxUb+CKY8DM8/W5yY49sQTsc3WuR2K5l6nDMfxK3vi6bCPSDdI8gZxb6avDhWvEPM09kNva2WgI6bKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjR4INXZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34e0d8b737eso1242889f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 06:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714743798; x=1715348598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIBYIy5sx84JAML7/BYhUNYKu82fIVeAqq62KF2FXO8=;
        b=gjR4INXZs+lyd76bbfTSgSFXId4TBcWOZl5/KpodQPAL8cb3fa7eQHzdTcpb1s5Ewg
         R6jFqCw3mw430lpwZdcrm4Vw8M8NJKPjkLoMEM2eVbKCTaEgGfHvzNn8EnbpQci30ZJB
         jIs0s3xahK0Oa8FBDv6GHz9hwjpay3P7cPv5EoX8M/OiAvQzcVTq4lc4LKsTVWnsgDe9
         o+tOGXgHLOPc5G730B3NmomFXv3GQ11jRU+aO49ptKwCl9164HEFMSfqiBzmrJ8RjwZg
         0UZ8/xf19uctxWFpwaUzU1WveCiFTcRuDvxmWK9/XtphysVqqjTjODX4c+SDM04ghu52
         VbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714743798; x=1715348598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIBYIy5sx84JAML7/BYhUNYKu82fIVeAqq62KF2FXO8=;
        b=Ia4R1wfejF1Hnkg+8vTRrvjhwRaz55C+BgQe8ZtbuN+Pe442uRWTdL5KbncyDefog/
         VKmlFqTnhp4hVMDMV0WWvNscz75szhNcmDot8GJHNizWZ3gV82V13s03mpSGfBlLdz3D
         UwxDPJXHHJHajO+UhJfF62oXYhxyJqsmdfMBYkW54rPPB7j3VfC6VDg9sTO5/MmgO8Dd
         H45n6wvy77PJ581P8jjwak2Rp86GolTFVV+mkf78YPs45htZ/SmXEoCKE6NdwTao3MBe
         n1KP6C/Cq5+VtW0ddIErtkpotkXn8aoVpYa0mq3L4mK8lrcGiInzo1x9qbBEaP+M1sMB
         cvNw==
X-Gm-Message-State: AOJu0YyrJPI9Qacp0aOuiDc/I/wRpCZbJdPUrNNB8zJ7BOzzfDKVkqUO
	EeLHYtLzxV+jtZDUf3Sjw+7ZtjhYJA43XLxsOsAg1qzoqwMki6hl
X-Google-Smtp-Source: AGHT+IFlaJrkExWU8XpeLvyVoq0pfb9fRTrHaOxrtaSnbgzfidxMsqeTRrrI7AjCj0XywIJsUS0JdQ==
X-Received: by 2002:a5d:5542:0:b0:34c:769e:d9a0 with SMTP id g2-20020a5d5542000000b0034c769ed9a0mr2832427wrw.26.1714743797879;
        Fri, 03 May 2024 06:43:17 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id z18-20020adff1d2000000b0034df178a9acsm3782482wro.99.2024.05.03.06.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:43:17 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 03 May 2024 14:42:32 +0100
Subject: [PATCH 3/5] drm/msm: Update a6xx registers XML
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-a750-devcoredump-v1-3-04e669e2c3f7@gmail.com>
References: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
In-Reply-To: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714743792; l=6403;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=ezAgAuArgCd+tmkLIfDI7l1WOjk7yaPZvxxhFEDHLkQ=;
 b=9hvmKcEbD32CIeqreyeyoB9n6l6xwfRKkEyRIu1w3eDlD9KBaA0I5sjBLyF3KOe8aFmdh+UEy
 EJV/dPnBpqGCIeAchq+VH0lGIF7pMoiuM8d43muduV9GTwRqCD2HH0c
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

Update to Mesa commit e82d70d472cc ("freedreno/a7xx: Add
A7XX_HLSQ_DP_STR location from kgsl").

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 47 +++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 78524aaab9d4..2dfe6913ab4f 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -397,6 +397,7 @@ by a particular renderpass/blit.
 	<value value="1" name="A7XX_HLSQ_DP"/>
 	<value value="2" name="A7XX_SP_TOP"/>
 	<value value="3" name="A7XX_USPTP"/>
+	<value value="4" name="A7XX_HLSQ_DP_STR"/>
 </enum>
 
 <enum name="a7xx_pipe">
@@ -1227,6 +1228,7 @@ to upconvert to 32b float internally?
 		<bitfield name="DEBBUS_INTR_0" pos="26" type="boolean"/>
 		<bitfield name="DEBBUS_INTR_1" pos="27" type="boolean"/>
 		<bitfield name="TSBWRITEERROR" pos="28" type="boolean" variants="A7XX-"/>
+		<bitfield name="SWFUSEVIOLATION" pos="29" type="boolean" variants="A7XX-"/>
 		<bitfield name="ISDB_CPU_IRQ" pos="30" type="boolean"/>
 		<bitfield name="ISDB_UNDER_DEBUG" pos="31" type="boolean"/>
 	</bitset>
@@ -1460,6 +1462,24 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x0b40" name="CP_LPAC_FIFO_DBG_ADDR" variants="A7XX-"/>
 	<reg32 offset="0x0b81" name="CP_LPAC_SQE_CNTL"/>
 	<reg64 offset="0x0b82" name="CP_LPAC_SQE_INSTR_BASE"/>
+
+	<reg64 offset="0x0b70" name="CP_AQE_INSTR_BASE_0" variants="A7XX-"/>
+	<reg64 offset="0x0b72" name="CP_AQE_INSTR_BASE_1" variants="A7XX-"/>
+	<reg32 offset="0x0b78" name="CP_AQE_APRIV_CNTL" variants="A7XX-"/>
+
+	<reg32 offset="0x0ba8" name="CP_AQE_ROQ_DBG_ADDR_0" variants="A7XX-"/>
+	<reg32 offset="0x0ba9" name="CP_AQE_ROQ_DBG_ADDR_1" variants="A7XX-"/>
+	<reg32 offset="0x0bac" name="CP_AQE_ROQ_DBG_DATA_0" variants="A7XX-"/>
+	<reg32 offset="0x0bad" name="CP_AQE_ROQ_DBG_DATA_1" variants="A7XX-"/>
+	<reg32 offset="0x0bb0" name="CP_AQE_UCODE_DBG_ADDR_0" variants="A7XX-"/>
+	<reg32 offset="0x0bb1" name="CP_AQE_UCODE_DBG_ADDR_1" variants="A7XX-"/>
+	<reg32 offset="0x0bb4" name="CP_AQE_UCODE_DBG_DATA_0" variants="A7XX-"/>
+	<reg32 offset="0x0bb5" name="CP_AQE_UCODE_DBG_DATA_1" variants="A7XX-"/>
+	<reg32 offset="0x0bb8" name="CP_AQE_STAT_ADDR_0" variants="A7XX-"/>
+	<reg32 offset="0x0bb9" name="CP_AQE_STAT_ADDR_1" variants="A7XX-"/>
+	<reg32 offset="0x0bbc" name="CP_AQE_STAT_DATA_0" variants="A7XX-"/>
+	<reg32 offset="0x0bbd" name="CP_AQE_STAT_DATA_1" variants="A7XX-"/>
+
 	<reg32 offset="0x0C01" name="VSC_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
 	<reg32 offset="0x0018" name="RBBM_GPR0_CNTL"/>
 	<reg32 offset="0x0201" name="RBBM_INT_0_STATUS" type="A6XX_RBBM_INT_0_MASK"/>
@@ -1503,6 +1523,9 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x0287" name="RBBM_CLOCK_MODE_BV_VFD" variants="A7XX-"/>
 	<reg32 offset="0x0288" name="RBBM_CLOCK_MODE_BV_GPC" variants="A7XX-"/>
 
+	<reg32 offset="0x02c0" name="RBBM_SW_FUSE_INT_STATUS" variants="A7XX-"/>
+	<reg32 offset="0x02c1" name="RBBM_SW_FUSE_INT_MASK" variants="A7XX-"/>
+
 	<array offset="0x0400" name="RBBM_PERFCTR_CP" stride="2" length="14" variants="A6XX"/>
 	<array offset="0x041c" name="RBBM_PERFCTR_RBBM" stride="2" length="4" variants="A6XX"/>
 	<array offset="0x0424" name="RBBM_PERFCTR_PC" stride="2" length="8" variants="A6XX"/>
@@ -2842,7 +2865,11 @@ to upconvert to 32b float internally?
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
@@ -2950,7 +2977,7 @@ to upconvert to 32b float internally?
 	<!-- 0x8e1d-0x8e1f invalid -->
 	<!-- 0x8e20-0x8e25 more perfcntr sel? -->
 	<!-- 0x8e26-0x8e27 invalid -->
-	<reg32 offset="0x8e28" name="RB_UNKNOWN_8E28" low="0" high="10"/>
+	<reg32 offset="0x8e28" name="RB_CMP_DBG_ECO_CNTL"/>
 	<!-- 0x8e29-0x8e2b invalid -->
 	<array offset="0x8e2c" name="RB_PERFCTR_CMP_SEL" stride="1" length="4"/>
 	<array offset="0x8e30" name="RB_PERFCTR_UFC_SEL" stride="1" length="6" variants="A7XX-"/>
@@ -3306,6 +3333,15 @@ to upconvert to 32b float internally?
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
@@ -4293,7 +4329,7 @@ to upconvert to 32b float internally?
 	<!-- always 0x100000 or 0x1000000? -->
 	<reg32 offset="0xb600" name="TPL1_DBG_ECO_CNTL" low="0" high="25" usage="cmd"/>
 	<reg32 offset="0xb601" name="TPL1_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
-	<reg32 offset="0xb602" name="TPL1_UNKNOWN_B602" low="0" high="7" type="uint" usage="cmd"/>
+	<reg32 offset="0xb602" name="TPL1_DBG_ECO_CNTL1" usage="cmd"/>
 	<reg32 offset="0xb604" name="TPL1_NC_MODE_CNTL">
 		<bitfield name="MODE" pos="0" type="boolean"/>
 		<bitfield name="LOWER_BIT" low="1" high="2" type="uint"/>
@@ -4965,6 +5001,11 @@ to upconvert to 32b float internally?
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


