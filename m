Return-Path: <linux-arm-msm+bounces-14916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52681887540
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 23:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DEC4B23041
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 22:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C678289C;
	Fri, 22 Mar 2024 22:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VH9O1p+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0577A82C7E
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 22:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711148249; cv=none; b=bdrD8ph13hHUmaqDxSFRElRjPZEZviy9hZ8KTWy7RmovMFtSpzf4bTMz39AmZ/yzm6p6niA9XZvtvgdnLSKpz9aQPuqVHyQejP15a6kZiPLevUgcQJcAnsCKhTW4wNJnwcK/hWLhJJOQT2kKasLxCvJMLd9R6lF3mremVE1NBLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711148249; c=relaxed/simple;
	bh=b9zFRaF4Jsj291RDi1zobsJceckeNTNeeUhM8CrSfNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UbeFHfPiB5Nq2RR/dxu59HgTyLAnf5ptPvSc8Dzedo09IFj9OqHSgxyu2tAZ/ZE7/lx8R4d+38WguwOgJpBE1Ox6hAhxaVsjS8i/wVjUv9LUDXfLend9E4QNkE/4M/VyHWFTMeKCQjhd6phE/L1okXCEnv3tYSdyF4QZbSIvDxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VH9O1p+T; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513e25afabaso3060702e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 15:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711148224; x=1711753024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfHIWzSVFFAiWUrH5iuAF8YX0d1TVVF80MsruQqCHrc=;
        b=VH9O1p+TlE6JfpqlKJ87XaDFjF71FrtW3vg6zy9D3wBte1O8LUJUljZp5j9PesfCIA
         QS4YlYqcewFNCvehhbpL/qeD9+9UIfo6Dxxvo7wUV0DEW5kUIzmHc5SbXk3arCoPmwU+
         m3T4YD68kuuUBaVOT5zAWUeHXhLmGOJmC57Gw+P0n6+ZCyrivmQTqp6JS5cKbqqADX8s
         oTjobVtBksPFpaDVw7DM3Z0iw8dbqH8gWRunbaZ/NS75rmrG2j+2aRvovEetX+aTXYwY
         fsNxsIxQ1RZopWXR7VgV36r0sdd1uo67VB19aRan1utw6l+V6IqXgLow53pb9vbbSgFb
         mnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711148224; x=1711753024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfHIWzSVFFAiWUrH5iuAF8YX0d1TVVF80MsruQqCHrc=;
        b=wcfdkZFvTM+ZBh1Q75jQ4LINAFeWeMVGgA44a3a5dIOUsw3rAbqrjdwXxznLI3D3Lx
         pNCh/9O0ks8bmDNNJZlhLpVwOfo3e/N3IQlErpUGixTVF307jk9BxxLroz+S4jYJlBeb
         PJFeeaCMOR6/R7lK3MeDZbyg7CZypsLciQJL/CR84YICcyJ5nzTLBIH6gWZRq2uR3fPr
         zAJPJp0+njwCTWwz2esTbL7Guh4zV+Ni+A84T2DLNeS8oXH4UyNv9FS7T/ZQ73doi5u6
         nt41OLBsDVmzyBAos5PeUqVr7zPyPGF4S+zv+K0PJYSPkRw7Enn10FBvI/5Pj9zebY1d
         eSkw==
X-Forwarded-Encrypted: i=1; AJvYcCXzCAJDjyx/yLAQaluZORm+XrDSsXdlhVm1q3q9gmB2GDYvUQvOl0V70vX9wzbGBXHHhaZq6Iwpg9JX+qtJuaufvhtU4cABt332Nj9cJA==
X-Gm-Message-State: AOJu0Yy6ViLS5YLJ/NHJTe3moZSY3OsChulxE5ZK3qRPFXZeTspLcFdT
	Y3Bhzdf8Ui+sQVA+D5DWpswh4/fwh1TFlQqALSqqGNDWSvW+G2adZ5zviDS3A/A=
X-Google-Smtp-Source: AGHT+IF+SzS2fkdjiZwHJw913CGMrCrtFBStVpgbBYsCe4YDyUFKZk5weR0uFFZq8lysl6jF7SAuRQ==
X-Received: by 2002:ac2:4898:0:b0:513:c9ca:1333 with SMTP id x24-20020ac24898000000b00513c9ca1333mr529390lfc.22.1711148223965;
        Fri, 22 Mar 2024 15:57:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 15:57:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:56:58 +0200
Subject: [PATCH v4 06/16] drm/msm: import A2xx-A4xx XML display registers
 database
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-fd-xml-shipped-v4-6-cca5e8457b9e@linaro.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
In-Reply-To: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=410472;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=b9zFRaF4Jsj291RDi1zobsJceckeNTNeeUhM8CrSfNQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+o/nu2tfW43r3PxfyqQnLnd/faHDTrKsREzhd+V14TFf
 egSyZHsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEZK3Z/0oL1She4l6hv+tn
 r/HTgE8lK1bm+FrzGbvqbVgsu3Py5F2pR/PbPaTLXPh4irPmz1f8U+qygNFGuiB+a36sTJPlvsL
 T3Y4Wn+yPryuv97y99PrstfzJW9U0xN+qhF5+PbHR3Pb3hTW5i+IdXNxrT2zSYpjxQz3xsfOjd7
 XfQwLMzjDkyc02COO7c/qbSQLz1s77YhxRJYx+t7Y49THn711+1Xx5WZ/hpX9HvznMTTwmyhRYe
 iIx88P6lR/LbKRyq6+v6d1VlJLZ88lXfP8CxbXVCTytYfM22xkuEzrl9nnaggPsjJ4ez94eErPz
 +WxQUxqrGPbLf7XHok2r3/293KR14EDN8fYbdglpJb8aAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Import Adreno registers database for A2xx-A4xx from the Mesa, commit
639488f924d9 ("freedreno/registers: limit the rules schema").

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/adreno/a2xx.xml      | 1865 +++++++++++++++
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml      | 1751 ++++++++++++++
 drivers/gpu/drm/msm/registers/adreno/a4xx.xml      | 2409 ++++++++++++++++++++
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |  400 ++++
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    | 2268 ++++++++++++++++++
 5 files changed, 8693 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a2xx.xml b/drivers/gpu/drm/msm/registers/adreno/a2xx.xml
new file mode 100644
index 000000000000..22caddaa0db9
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a2xx.xml
@@ -0,0 +1,1865 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+<import file="adreno/adreno_common.xml"/>
+<import file="adreno/adreno_pm4.xml"/>
+
+
+<enum name="a2xx_rb_dither_type">
+	<value name="DITHER_PIXEL" value="0"/>
+	<value name="DITHER_SUBPIXEL" value="1"/>
+</enum>
+
+<enum name="a2xx_colorformatx">
+	<value name="COLORX_4_4_4_4" value="0"/>
+	<value name="COLORX_1_5_5_5" value="1"/>
+	<value name="COLORX_5_6_5" value="2"/>
+	<value name="COLORX_8" value="3"/>
+	<value name="COLORX_8_8" value="4"/>
+	<value name="COLORX_8_8_8_8" value="5"/>
+	<value name="COLORX_S8_8_8_8" value="6"/>
+	<value name="COLORX_16_FLOAT" value="7"/>
+	<value name="COLORX_16_16_FLOAT" value="8"/>
+	<value name="COLORX_16_16_16_16_FLOAT" value="9"/>
+	<value name="COLORX_32_FLOAT" value="10"/>
+	<value name="COLORX_32_32_FLOAT" value="11"/>
+	<value name="COLORX_32_32_32_32_FLOAT" value="12"/>
+	<value name="COLORX_2_3_3" value="13"/>
+	<value name="COLORX_8_8_8" value="14"/>
+</enum>
+
+<enum name="a2xx_sq_surfaceformat">
+	<value name="FMT_1_REVERSE" value="0"/>
+	<value name="FMT_1" value="1"/>
+	<value name="FMT_8" value="2"/>
+	<value name="FMT_1_5_5_5" value="3"/>
+	<value name="FMT_5_6_5" value="4"/>
+	<value name="FMT_6_5_5" value="5"/>
+	<value name="FMT_8_8_8_8" value="6"/>
+	<value name="FMT_2_10_10_10" value="7"/>
+	<value name="FMT_8_A" value="8"/>
+	<value name="FMT_8_B" value="9"/>
+	<value name="FMT_8_8" value="10"/>
+	<value name="FMT_Cr_Y1_Cb_Y0" value="11"/>
+	<value name="FMT_Y1_Cr_Y0_Cb" value="12"/>
+	<value name="FMT_5_5_5_1" value="13"/>
+	<value name="FMT_8_8_8_8_A" value="14"/>
+	<value name="FMT_4_4_4_4" value="15"/>
+	<value name="FMT_8_8_8" value="16"/>
+	<value name="FMT_DXT1" value="18"/>
+	<value name="FMT_DXT2_3" value="19"/>
+	<value name="FMT_DXT4_5" value="20"/>
+	<value name="FMT_10_10_10_2" value="21"/>
+	<value name="FMT_24_8" value="22"/>
+	<value name="FMT_16" value="24"/>
+	<value name="FMT_16_16" value="25"/>
+	<value name="FMT_16_16_16_16" value="26"/>
+	<value name="FMT_16_EXPAND" value="27"/>
+	<value name="FMT_16_16_EXPAND" value="28"/>
+	<value name="FMT_16_16_16_16_EXPAND" value="29"/>
+	<value name="FMT_16_FLOAT" value="30"/>
+	<value name="FMT_16_16_FLOAT" value="31"/>
+	<value name="FMT_16_16_16_16_FLOAT" value="32"/>
+	<value name="FMT_32" value="33"/>
+	<value name="FMT_32_32" value="34"/>
+	<value name="FMT_32_32_32_32" value="35"/>
+	<value name="FMT_32_FLOAT" value="36"/>
+	<value name="FMT_32_32_FLOAT" value="37"/>
+	<value name="FMT_32_32_32_32_FLOAT" value="38"/>
+	<value name="FMT_ATI_TC_RGB" value="39"/>
+	<value name="FMT_ATI_TC_RGBA" value="40"/>
+	<value name="FMT_ATI_TC_555_565_RGB" value="41"/>
+	<value name="FMT_ATI_TC_555_565_RGBA" value="42"/>
+	<value name="FMT_ATI_TC_RGBA_INTERP" value="43"/>
+	<value name="FMT_ATI_TC_555_565_RGBA_INTERP" value="44"/>
+	<value name="FMT_ETC1_RGBA_INTERP" value="46"/>
+	<value name="FMT_ETC1_RGB" value="47"/>
+	<value name="FMT_ETC1_RGBA" value="48"/>
+	<value name="FMT_DXN" value="49"/>
+	<value name="FMT_2_3_3" value="51"/>
+	<value name="FMT_2_10_10_10_AS_16_16_16_16" value="54"/>
+	<value name="FMT_10_10_10_2_AS_16_16_16_16" value="55"/>
+	<value name="FMT_32_32_32_FLOAT" value="57"/>
+	<value name="FMT_DXT3A" value="58"/>
+	<value name="FMT_DXT5A" value="59"/>
+	<value name="FMT_CTX1" value="60"/>
+</enum>
+
+<enum name="a2xx_sq_ps_vtx_mode">
+	<value name="POSITION_1_VECTOR" value="0"/>
+	<value name="POSITION_2_VECTORS_UNUSED" value="1"/>
+	<value name="POSITION_2_VECTORS_SPRITE" value="2"/>
+	<value name="POSITION_2_VECTORS_EDGE" value="3"/>
+	<value name="POSITION_2_VECTORS_KILL" value="4"/>
+	<value name="POSITION_2_VECTORS_SPRITE_KILL" value="5"/>
+	<value name="POSITION_2_VECTORS_EDGE_KILL" value="6"/>
+	<value name="MULTIPASS" value="7"/>
+</enum>
+
+<enum name="a2xx_sq_sample_cntl">
+	<value name="CENTROIDS_ONLY" value="0"/>
+	<value name="CENTERS_ONLY" value="1"/>
+	<value name="CENTROIDS_AND_CENTERS" value="2"/>
+</enum>
+
+<enum name="a2xx_dx_clip_space">
+	<value name="DXCLIP_OPENGL" value="0"/>
+	<value name="DXCLIP_DIRECTX" value="1"/>
+</enum>
+
+<enum name="a2xx_pa_su_sc_polymode">
+	<value name="POLY_DISABLED" value="0"/>
+	<value name="POLY_DUALMODE" value="1"/>
+</enum>
+
+<enum name="a2xx_rb_edram_mode">
+	<value name="EDRAM_NOP" value="0"/>
+	<value name="COLOR_DEPTH" value="4"/>
+	<value name="DEPTH_ONLY" value="5"/>
+	<value name="EDRAM_COPY" value="6"/>
+</enum>
+
+<enum name="a2xx_pa_sc_pattern_bit_order">
+	<value name="LITTLE" value="0"/>
+	<value name="BIG" value="1"/>
+</enum>
+
+<enum name="a2xx_pa_sc_auto_reset_cntl">
+	<value name="NEVER" value="0"/>
+	<value name="EACH_PRIMITIVE" value="1"/>
+	<value name="EACH_PACKET" value="2"/>
+</enum>
+
+<enum name="a2xx_pa_pixcenter">
+	<value name="PIXCENTER_D3D" value="0"/>
+	<value name="PIXCENTER_OGL" value="1"/>
+</enum>
+
+<enum name="a2xx_pa_roundmode">
+	<value name="TRUNCATE" value="0"/>
+	<value name="ROUND" value="1"/>
+	<value name="ROUNDTOEVEN" value="2"/>
+	<value name="ROUNDTOODD" value="3"/>
+</enum>
+
+<enum name="a2xx_pa_quantmode">
+	<value name="ONE_SIXTEENTH" value="0"/>
+	<value name="ONE_EIGTH" value="1"/>
+	<value name="ONE_QUARTER" value="2"/>
+	<value name="ONE_HALF" value="3"/>
+	<value name="ONE" value="4"/>
+</enum>
+
+<enum name="a2xx_rb_copy_sample_select">
+	<value name="SAMPLE_0" value="0"/>
+	<value name="SAMPLE_1" value="1"/>
+	<value name="SAMPLE_2" value="2"/>
+	<value name="SAMPLE_3" value="3"/>
+	<value name="SAMPLE_01" value="4"/>
+	<value name="SAMPLE_23" value="5"/>
+	<value name="SAMPLE_0123" value="6"/>
+</enum>
+
+<enum name="a2xx_rb_blend_opcode">
+	<value name="BLEND2_DST_PLUS_SRC" value="0"/>
+	<value name="BLEND2_SRC_MINUS_DST" value="1"/>
+	<value name="BLEND2_MIN_DST_SRC" value="2"/>
+	<value name="BLEND2_MAX_DST_SRC" value="3"/>
+	<value name="BLEND2_DST_MINUS_SRC" value="4"/>
+	<value name="BLEND2_DST_PLUS_SRC_BIAS" value="5"/>
+</enum>
+
+<enum name="a2xx_su_perfcnt_select">
+	<value value="0" name="PERF_PAPC_PASX_REQ"/>
+	<value value="2" name="PERF_PAPC_PASX_FIRST_VECTOR"/>
+	<value value="3" name="PERF_PAPC_PASX_SECOND_VECTOR"/>
+	<value value="4" name="PERF_PAPC_PASX_FIRST_DEAD"/>
+	<value value="5" name="PERF_PAPC_PASX_SECOND_DEAD"/>
+	<value value="6" name="PERF_PAPC_PASX_VTX_KILL_DISCARD"/>
+	<value value="7" name="PERF_PAPC_PASX_VTX_NAN_DISCARD"/>
+	<value value="8" name="PERF_PAPC_PA_INPUT_PRIM"/>
+	<value value="9" name="PERF_PAPC_PA_INPUT_NULL_PRIM"/>
+	<value value="10" name="PERF_PAPC_PA_INPUT_EVENT_FLAG"/>
+	<value value="11" name="PERF_PAPC_PA_INPUT_FIRST_PRIM_SLOT"/>
+	<value value="12" name="PERF_PAPC_PA_INPUT_END_OF_PACKET"/>
+	<value value="13" name="PERF_PAPC_CLPR_CULL_PRIM"/>
+	<value value="15" name="PERF_PAPC_CLPR_VV_CULL_PRIM"/>
+	<value value="17" name="PERF_PAPC_CLPR_VTX_KILL_CULL_PRIM"/>
+	<value value="18" name="PERF_PAPC_CLPR_VTX_NAN_CULL_PRIM"/>
+	<value value="19" name="PERF_PAPC_CLPR_CULL_TO_NULL_PRIM"/>
+	<value value="21" name="PERF_PAPC_CLPR_VV_CLIP_PRIM"/>
+	<value value="23" name="PERF_PAPC_CLPR_POINT_CLIP_CANDIDATE"/>
+	<value value="24" name="PERF_PAPC_CLPR_CLIP_PLANE_CNT_1"/>
+	<value value="25" name="PERF_PAPC_CLPR_CLIP_PLANE_CNT_2"/>
+	<value value="26" name="PERF_PAPC_CLPR_CLIP_PLANE_CNT_3"/>
+	<value value="27" name="PERF_PAPC_CLPR_CLIP_PLANE_CNT_4"/>
+	<value value="28" name="PERF_PAPC_CLPR_CLIP_PLANE_CNT_5"/>
+	<value value="29" name="PERF_PAPC_CLPR_CLIP_PLANE_CNT_6"/>
+	<value value="30" name="PERF_PAPC_CLPR_CLIP_PLANE_NEAR"/>
+	<value value="31" name="PERF_PAPC_CLPR_CLIP_PLANE_FAR"/>
+	<value value="32" name="PERF_PAPC_CLPR_CLIP_PLANE_LEFT"/>
+	<value value="33" name="PERF_PAPC_CLPR_CLIP_PLANE_RIGHT"/>
+	<value value="34" name="PERF_PAPC_CLPR_CLIP_PLANE_TOP"/>
+	<value value="35" name="PERF_PAPC_CLPR_CLIP_PLANE_BOTTOM"/>
+	<value value="36" name="PERF_PAPC_CLSM_NULL_PRIM"/>
+	<value value="37" name="PERF_PAPC_CLSM_TOTALLY_VISIBLE_PRIM"/>
+	<value value="38" name="PERF_PAPC_CLSM_CLIP_PRIM"/>
+	<value value="39" name="PERF_PAPC_CLSM_CULL_TO_NULL_PRIM"/>
+	<value value="40" name="PERF_PAPC_CLSM_OUT_PRIM_CNT_1"/>
+	<value value="41" name="PERF_PAPC_CLSM_OUT_PRIM_CNT_2"/>
+	<value value="42" name="PERF_PAPC_CLSM_OUT_PRIM_CNT_3"/>
+	<value value="43" name="PERF_PAPC_CLSM_OUT_PRIM_CNT_4"/>
+	<value value="44" name="PERF_PAPC_CLSM_OUT_PRIM_CNT_5"/>
+	<value value="45" name="PERF_PAPC_CLSM_OUT_PRIM_CNT_6_7"/>
+	<value value="46" name="PERF_PAPC_CLSM_NON_TRIVIAL_CULL"/>
+	<value value="47" name="PERF_PAPC_SU_INPUT_PRIM"/>
+	<value value="48" name="PERF_PAPC_SU_INPUT_CLIP_PRIM"/>
+	<value value="49" name="PERF_PAPC_SU_INPUT_NULL_PRIM"/>
+	<value value="50" name="PERF_PAPC_SU_ZERO_AREA_CULL_PRIM"/>
+	<value value="51" name="PERF_PAPC_SU_BACK_FACE_CULL_PRIM"/>
+	<value value="52" name="PERF_PAPC_SU_FRONT_FACE_CULL_PRIM"/>
+	<value value="53" name="PERF_PAPC_SU_POLYMODE_FACE_CULL"/>
+	<value value="54" name="PERF_PAPC_SU_POLYMODE_BACK_CULL"/>
+	<value value="55" name="PERF_PAPC_SU_POLYMODE_FRONT_CULL"/>
+	<value value="56" name="PERF_PAPC_SU_POLYMODE_INVALID_FILL"/>
+	<value value="57" name="PERF_PAPC_SU_OUTPUT_PRIM"/>
+	<value value="58" name="PERF_PAPC_SU_OUTPUT_CLIP_PRIM"/>
+	<value value="59" name="PERF_PAPC_SU_OUTPUT_NULL_PRIM"/>
+	<value value="60" name="PERF_PAPC_SU_OUTPUT_EVENT_FLAG"/>
+	<value value="61" name="PERF_PAPC_SU_OUTPUT_FIRST_PRIM_SLOT"/>
+	<value value="62" name="PERF_PAPC_SU_OUTPUT_END_OF_PACKET"/>
+	<value value="63" name="PERF_PAPC_SU_OUTPUT_POLYMODE_FACE"/>
+	<value value="64" name="PERF_PAPC_SU_OUTPUT_POLYMODE_BACK"/>
+	<value value="65" name="PERF_PAPC_SU_OUTPUT_POLYMODE_FRONT"/>
+	<value value="66" name="PERF_PAPC_SU_OUT_CLIP_POLYMODE_FACE"/>
+	<value value="67" name="PERF_PAPC_SU_OUT_CLIP_POLYMODE_BACK"/>
+	<value value="68" name="PERF_PAPC_SU_OUT_CLIP_POLYMODE_FRONT"/>
+	<value value="69" name="PERF_PAPC_PASX_REQ_IDLE"/>
+	<value value="70" name="PERF_PAPC_PASX_REQ_BUSY"/>
+	<value value="71" name="PERF_PAPC_PASX_REQ_STALLED"/>
+	<value value="72" name="PERF_PAPC_PASX_REC_IDLE"/>
+	<value value="73" name="PERF_PAPC_PASX_REC_BUSY"/>
+	<value value="74" name="PERF_PAPC_PASX_REC_STARVED_SX"/>
+	<value value="75" name="PERF_PAPC_PASX_REC_STALLED"/>
+	<value value="76" name="PERF_PAPC_PASX_REC_STALLED_POS_MEM"/>
+	<value value="77" name="PERF_PAPC_PASX_REC_STALLED_CCGSM_IN"/>
+	<value value="78" name="PERF_PAPC_CCGSM_IDLE"/>
+	<value value="79" name="PERF_PAPC_CCGSM_BUSY"/>
+	<value value="80" name="PERF_PAPC_CCGSM_STALLED"/>
+	<value value="81" name="PERF_PAPC_CLPRIM_IDLE"/>
+	<value value="82" name="PERF_PAPC_CLPRIM_BUSY"/>
+	<value value="83" name="PERF_PAPC_CLPRIM_STALLED"/>
+	<value value="84" name="PERF_PAPC_CLPRIM_STARVED_CCGSM"/>
+	<value value="85" name="PERF_PAPC_CLIPSM_IDLE"/>
+	<value value="86" name="PERF_PAPC_CLIPSM_BUSY"/>
+	<value value="87" name="PERF_PAPC_CLIPSM_WAIT_CLIP_VERT_ENGH"/>
+	<value value="88" name="PERF_PAPC_CLIPSM_WAIT_HIGH_PRI_SEQ"/>
+	<value value="89" name="PERF_PAPC_CLIPSM_WAIT_CLIPGA"/>
+	<value value="90" name="PERF_PAPC_CLIPSM_WAIT_AVAIL_VTE_CLIP"/>
+	<value value="91" name="PERF_PAPC_CLIPSM_WAIT_CLIP_OUTSM"/>
+	<value value="92" name="PERF_PAPC_CLIPGA_IDLE"/>
+	<value value="93" name="PERF_PAPC_CLIPGA_BUSY"/>
+	<value value="94" name="PERF_PAPC_CLIPGA_STARVED_VTE_CLIP"/>
+	<value value="95" name="PERF_PAPC_CLIPGA_STALLED"/>
+	<value value="96" name="PERF_PAPC_CLIP_IDLE"/>
+	<value value="97" name="PERF_PAPC_CLIP_BUSY"/>
+	<value value="98" name="PERF_PAPC_SU_IDLE"/>
+	<value value="99" name="PERF_PAPC_SU_BUSY"/>
+	<value value="100" name="PERF_PAPC_SU_STARVED_CLIP"/>
+	<value value="101" name="PERF_PAPC_SU_STALLED_SC"/>
+	<value value="102" name="PERF_PAPC_SU_FACENESS_CULL"/>
+</enum>
+
+<enum name="a2xx_sc_perfcnt_select">
+	<value value="0" name="SC_SR_WINDOW_VALID"/>
+	<value value="1" name="SC_CW_WINDOW_VALID"/>
+	<value value="2" name="SC_QM_WINDOW_VALID"/>
+	<value value="3" name="SC_FW_WINDOW_VALID"/>
+	<value value="4" name="SC_EZ_WINDOW_VALID"/>
+	<value value="5" name="SC_IT_WINDOW_VALID"/>
+	<value value="6" name="SC_STARVED_BY_PA"/>
+	<value value="7" name="SC_STALLED_BY_RB_TILE"/>
+	<value value="8" name="SC_STALLED_BY_RB_SAMP"/>
+	<value value="9" name="SC_STARVED_BY_RB_EZ"/>
+	<value value="10" name="SC_STALLED_BY_SAMPLE_FF"/>
+	<value value="11" name="SC_STALLED_BY_SQ"/>
+	<value value="12" name="SC_STALLED_BY_SP"/>
+	<value value="13" name="SC_TOTAL_NO_PRIMS"/>
+	<value value="14" name="SC_NON_EMPTY_PRIMS"/>
+	<value value="15" name="SC_NO_TILES_PASSING_QM"/>
+	<value value="16" name="SC_NO_PIXELS_PRE_EZ"/>
+	<value value="17" name="SC_NO_PIXELS_POST_EZ"/>
+</enum>
+
+<enum name="a2xx_vgt_perfcount_select">
+	<value value="0" name="VGT_SQ_EVENT_WINDOW_ACTIVE"/>
+	<value value="1" name="VGT_SQ_SEND"/>
+	<value value="2" name="VGT_SQ_STALLED"/>
+	<value value="3" name="VGT_SQ_STARVED_BUSY"/>
+	<value value="4" name="VGT_SQ_STARVED_IDLE"/>
+	<value value="5" name="VGT_SQ_STATIC"/>
+	<value value="6" name="VGT_PA_EVENT_WINDOW_ACTIVE"/>
+	<value value="7" name="VGT_PA_CLIP_V_SEND"/>
+	<value value="8" name="VGT_PA_CLIP_V_STALLED"/>
+	<value value="9" name="VGT_PA_CLIP_V_STARVED_BUSY"/>
+	<value value="10" name="VGT_PA_CLIP_V_STARVED_IDLE"/>
+	<value value="11" name="VGT_PA_CLIP_V_STATIC"/>
+	<value value="12" name="VGT_PA_CLIP_P_SEND"/>
+	<value value="13" name="VGT_PA_CLIP_P_STALLED"/>
+	<value value="14" name="VGT_PA_CLIP_P_STARVED_BUSY"/>
+	<value value="15" name="VGT_PA_CLIP_P_STARVED_IDLE"/>
+	<value value="16" name="VGT_PA_CLIP_P_STATIC"/>
+	<value value="17" name="VGT_PA_CLIP_S_SEND"/>
+	<value value="18" name="VGT_PA_CLIP_S_STALLED"/>
+	<value value="19" name="VGT_PA_CLIP_S_STARVED_BUSY"/>
+	<value value="20" name="VGT_PA_CLIP_S_STARVED_IDLE"/>
+	<value value="21" name="VGT_PA_CLIP_S_STATIC"/>
+	<value value="22" name="RBIU_FIFOS_EVENT_WINDOW_ACTIVE"/>
+	<value value="23" name="RBIU_IMMED_DATA_FIFO_STARVED"/>
+	<value value="24" name="RBIU_IMMED_DATA_FIFO_STALLED"/>
+	<value value="25" name="RBIU_DMA_REQUEST_FIFO_STARVED"/>
+	<value value="26" name="RBIU_DMA_REQUEST_FIFO_STALLED"/>
+	<value value="27" name="RBIU_DRAW_INITIATOR_FIFO_STARVED"/>
+	<value value="28" name="RBIU_DRAW_INITIATOR_FIFO_STALLED"/>
+	<value value="29" name="BIN_PRIM_NEAR_CULL"/>
+	<value value="30" name="BIN_PRIM_ZERO_CULL"/>
+	<value value="31" name="BIN_PRIM_FAR_CULL"/>
+	<value value="32" name="BIN_PRIM_BIN_CULL"/>
+	<value value="33" name="BIN_PRIM_FACE_CULL"/>
+	<value value="34" name="SPARE34"/>
+	<value value="35" name="SPARE35"/>
+	<value value="36" name="SPARE36"/>
+	<value value="37" name="SPARE37"/>
+	<value value="38" name="SPARE38"/>
+	<value value="39" name="SPARE39"/>
+	<value value="40" name="TE_SU_IN_VALID"/>
+	<value value="41" name="TE_SU_IN_READ"/>
+	<value value="42" name="TE_SU_IN_PRIM"/>
+	<value value="43" name="TE_SU_IN_EOP"/>
+	<value value="44" name="TE_SU_IN_NULL_PRIM"/>
+	<value value="45" name="TE_WK_IN_VALID"/>
+	<value value="46" name="TE_WK_IN_READ"/>
+	<value value="47" name="TE_OUT_PRIM_VALID"/>
+	<value value="48" name="TE_OUT_PRIM_READ"/>
+</enum>
+
+<enum name="a2xx_tcr_perfcount_select">
+	<value value="0" name="DGMMPD_IPMUX0_STALL"/>
+	<value value="4" name="DGMMPD_IPMUX_ALL_STALL"/>
+	<value value="5" name="OPMUX0_L2_WRITES"/>
+</enum>
+
+<enum name="a2xx_tp_perfcount_select">
+	<value value="0" name="POINT_QUADS"/>
+	<value value="1" name="BILIN_QUADS"/>
+	<value value="2" name="ANISO_QUADS"/>
+	<value value="3" name="MIP_QUADS"/>
+	<value value="4" name="VOL_QUADS"/>
+	<value value="5" name="MIP_VOL_QUADS"/>
+	<value value="6" name="MIP_ANISO_QUADS"/>
+	<value value="7" name="VOL_ANISO_QUADS"/>
+	<value value="8" name="ANISO_2_1_QUADS"/>
+	<value value="9" name="ANISO_4_1_QUADS"/>
+	<value value="10" name="ANISO_6_1_QUADS"/>
+	<value value="11" name="ANISO_8_1_QUADS"/>
+	<value value="12" name="ANISO_10_1_QUADS"/>
+	<value value="13" name="ANISO_12_1_QUADS"/>
+	<value value="14" name="ANISO_14_1_QUADS"/>
+	<value value="15" name="ANISO_16_1_QUADS"/>
+	<value value="16" name="MIP_VOL_ANISO_QUADS"/>
+	<value value="17" name="ALIGN_2_QUADS"/>
+	<value value="18" name="ALIGN_4_QUADS"/>
+	<value value="19" name="PIX_0_QUAD"/>
+	<value value="20" name="PIX_1_QUAD"/>
+	<value value="21" name="PIX_2_QUAD"/>
+	<value value="22" name="PIX_3_QUAD"/>
+	<value value="23" name="PIX_4_QUAD"/>
+	<value value="24" name="TP_MIPMAP_LOD0"/>
+	<value value="25" name="TP_MIPMAP_LOD1"/>
+	<value value="26" name="TP_MIPMAP_LOD2"/>
+	<value value="27" name="TP_MIPMAP_LOD3"/>
+	<value value="28" name="TP_MIPMAP_LOD4"/>
+	<value value="29" name="TP_MIPMAP_LOD5"/>
+	<value value="30" name="TP_MIPMAP_LOD6"/>
+	<value value="31" name="TP_MIPMAP_LOD7"/>
+	<value value="32" name="TP_MIPMAP_LOD8"/>
+	<value value="33" name="TP_MIPMAP_LOD9"/>
+	<value value="34" name="TP_MIPMAP_LOD10"/>
+	<value value="35" name="TP_MIPMAP_LOD11"/>
+	<value value="36" name="TP_MIPMAP_LOD12"/>
+	<value value="37" name="TP_MIPMAP_LOD13"/>
+	<value value="38" name="TP_MIPMAP_LOD14"/>
+</enum>
+
+<enum name="a2xx_tcm_perfcount_select">
+	<value value="0" name="QUAD0_RD_LAT_FIFO_EMPTY"/>
+	<value value="3" name="QUAD0_RD_LAT_FIFO_4TH_FULL"/>
+	<value value="4" name="QUAD0_RD_LAT_FIFO_HALF_FULL"/>
+	<value value="5" name="QUAD0_RD_LAT_FIFO_FULL"/>
+	<value value="6" name="QUAD0_RD_LAT_FIFO_LT_4TH_FULL"/>
+	<value value="28" name="READ_STARVED_QUAD0"/>
+	<value value="32" name="READ_STARVED"/>
+	<value value="33" name="READ_STALLED_QUAD0"/>
+	<value value="37" name="READ_STALLED"/>
+	<value value="38" name="VALID_READ_QUAD0"/>
+	<value value="42" name="TC_TP_STARVED_QUAD0"/>
+	<value value="46" name="TC_TP_STARVED"/>
+</enum>
+
+<enum name="a2xx_tcf_perfcount_select">
+	<value value="0" name="VALID_CYCLES"/>
+	<value value="1" name="SINGLE_PHASES"/>
+	<value value="2" name="ANISO_PHASES"/>
+	<value value="3" name="MIP_PHASES"/>
+	<value value="4" name="VOL_PHASES"/>
+	<value value="5" name="MIP_VOL_PHASES"/>
+	<value value="6" name="MIP_ANISO_PHASES"/>
+	<value value="7" name="VOL_ANISO_PHASES"/>
+	<value value="8" name="ANISO_2_1_PHASES"/>
+	<value value="9" name="ANISO_4_1_PHASES"/>
+	<value value="10" name="ANISO_6_1_PHASES"/>
+	<value value="11" name="ANISO_8_1_PHASES"/>
+	<value value="12" name="ANISO_10_1_PHASES"/>
+	<value value="13" name="ANISO_12_1_PHASES"/>
+	<value value="14" name="ANISO_14_1_PHASES"/>
+	<value value="15" name="ANISO_16_1_PHASES"/>
+	<value value="16" name="MIP_VOL_ANISO_PHASES"/>
+	<value value="17" name="ALIGN_2_PHASES"/>
+	<value value="18" name="ALIGN_4_PHASES"/>
+	<value value="19" name="TPC_BUSY"/>
+	<value value="20" name="TPC_STALLED"/>
+	<value value="21" name="TPC_STARVED"/>
+	<value value="22" name="TPC_WORKING"/>
+	<value value="23" name="TPC_WALKER_BUSY"/>
+	<value value="24" name="TPC_WALKER_STALLED"/>
+	<value value="25" name="TPC_WALKER_WORKING"/>
+	<value value="26" name="TPC_ALIGNER_BUSY"/>
+	<value value="27" name="TPC_ALIGNER_STALLED"/>
+	<value value="28" name="TPC_ALIGNER_STALLED_BY_BLEND"/>
+	<value value="29" name="TPC_ALIGNER_STALLED_BY_CACHE"/>
+	<value value="30" name="TPC_ALIGNER_WORKING"/>
+	<value value="31" name="TPC_BLEND_BUSY"/>
+	<value value="32" name="TPC_BLEND_SYNC"/>
+	<value value="33" name="TPC_BLEND_STARVED"/>
+	<value value="34" name="TPC_BLEND_WORKING"/>
+	<value value="35" name="OPCODE_0x00"/>
+	<value value="36" name="OPCODE_0x01"/>
+	<value value="37" name="OPCODE_0x04"/>
+	<value value="38" name="OPCODE_0x10"/>
+	<value value="39" name="OPCODE_0x11"/>
+	<value value="40" name="OPCODE_0x12"/>
+	<value value="41" name="OPCODE_0x13"/>
+	<value value="42" name="OPCODE_0x18"/>
+	<value value="43" name="OPCODE_0x19"/>
+	<value value="44" name="OPCODE_0x1A"/>
+	<value value="45" name="OPCODE_OTHER"/>
+	<value value="56" name="IN_FIFO_0_EMPTY"/>
+	<value value="57" name="IN_FIFO_0_LT_HALF_FULL"/>
+	<value value="58" name="IN_FIFO_0_HALF_FULL"/>
+	<value value="59" name="IN_FIFO_0_FULL"/>
+	<value value="72" name="IN_FIFO_TPC_EMPTY"/>
+	<value value="73" name="IN_FIFO_TPC_LT_HALF_FULL"/>
+	<value value="74" name="IN_FIFO_TPC_HALF_FULL"/>
+	<value value="75" name="IN_FIFO_TPC_FULL"/>
+	<value value="76" name="TPC_TC_XFC"/>
+	<value value="77" name="TPC_TC_STATE"/>
+	<value value="78" name="TC_STALL"/>
+	<value value="79" name="QUAD0_TAPS"/>
+	<value value="83" name="QUADS"/>
+	<value value="84" name="TCA_SYNC_STALL"/>
+	<value value="85" name="TAG_STALL"/>
+	<value value="88" name="TCB_SYNC_STALL"/>
+	<value value="89" name="TCA_VALID"/>
+	<value value="90" name="PROBES_VALID"/>
+	<value value="91" name="MISS_STALL"/>
+	<value value="92" name="FETCH_FIFO_STALL"/>
+	<value value="93" name="TCO_STALL"/>
+	<value value="94" name="ANY_STALL"/>
+	<value value="95" name="TAG_MISSES"/>
+	<value value="96" name="TAG_HITS"/>
+	<value value="97" name="SUB_TAG_MISSES"/>
+	<value value="98" name="SET0_INVALIDATES"/>
+	<value value="99" name="SET1_INVALIDATES"/>
+	<value value="100" name="SET2_INVALIDATES"/>
+	<value value="101" name="SET3_INVALIDATES"/>
+	<value value="102" name="SET0_TAG_MISSES"/>
+	<value value="103" name="SET1_TAG_MISSES"/>
+	<value value="104" name="SET2_TAG_MISSES"/>
+	<value value="105" name="SET3_TAG_MISSES"/>
+	<value value="106" name="SET0_TAG_HITS"/>
+	<value value="107" name="SET1_TAG_HITS"/>
+	<value value="108" name="SET2_TAG_HITS"/>
+	<value value="109" name="SET3_TAG_HITS"/>
+	<value value="110" name="SET0_SUB_TAG_MISSES"/>
+	<value value="111" name="SET1_SUB_TAG_MISSES"/>
+	<value value="112" name="SET2_SUB_TAG_MISSES"/>
+	<value value="113" name="SET3_SUB_TAG_MISSES"/>
+	<value value="114" name="SET0_EVICT1"/>
+	<value value="115" name="SET0_EVICT2"/>
+	<value value="116" name="SET0_EVICT3"/>
+	<value value="117" name="SET0_EVICT4"/>
+	<value value="118" name="SET0_EVICT5"/>
+	<value value="119" name="SET0_EVICT6"/>
+	<value value="120" name="SET0_EVICT7"/>
+	<value value="121" name="SET0_EVICT8"/>
+	<value value="130" name="SET1_EVICT1"/>
+	<value value="131" name="SET1_EVICT2"/>
+	<value value="132" name="SET1_EVICT3"/>
+	<value value="133" name="SET1_EVICT4"/>
+	<value value="134" name="SET1_EVICT5"/>
+	<value value="135" name="SET1_EVICT6"/>
+	<value value="136" name="SET1_EVICT7"/>
+	<value value="137" name="SET1_EVICT8"/>
+	<value value="146" name="SET2_EVICT1"/>
+	<value value="147" name="SET2_EVICT2"/>
+	<value value="148" name="SET2_EVICT3"/>
+	<value value="149" name="SET2_EVICT4"/>
+	<value value="150" name="SET2_EVICT5"/>
+	<value value="151" name="SET2_EVICT6"/>
+	<value value="152" name="SET2_EVICT7"/>
+	<value value="153" name="SET2_EVICT8"/>
+	<value value="162" name="SET3_EVICT1"/>
+	<value value="163" name="SET3_EVICT2"/>
+	<value value="164" name="SET3_EVICT3"/>
+	<value value="165" name="SET3_EVICT4"/>
+	<value value="166" name="SET3_EVICT5"/>
+	<value value="167" name="SET3_EVICT6"/>
+	<value value="168" name="SET3_EVICT7"/>
+	<value value="169" name="SET3_EVICT8"/>
+	<value value="178" name="FF_EMPTY"/>
+	<value value="179" name="FF_LT_HALF_FULL"/>
+	<value value="180" name="FF_HALF_FULL"/>
+	<value value="181" name="FF_FULL"/>
+	<value value="182" name="FF_XFC"/>
+	<value value="183" name="FF_STALLED"/>
+	<value value="184" name="FG_MASKS"/>
+	<value value="185" name="FG_LEFT_MASKS"/>
+	<value value="186" name="FG_LEFT_MASK_STALLED"/>
+	<value value="187" name="FG_LEFT_NOT_DONE_STALL"/>
+	<value value="188" name="FG_LEFT_FG_STALL"/>
+	<value value="189" name="FG_LEFT_SECTORS"/>
+	<value value="195" name="FG0_REQUESTS"/>
+	<value value="196" name="FG0_STALLED"/>
+	<value value="199" name="MEM_REQ512"/>
+	<value value="200" name="MEM_REQ_SENT"/>
+	<value value="202" name="MEM_LOCAL_READ_REQ"/>
+	<value value="203" name="TC0_MH_STALLED"/>
+</enum>
+
+<enum name="a2xx_sq_perfcnt_select">
+	<value value="0" name="SQ_PIXEL_VECTORS_SUB"/>
+	<value value="1" name="SQ_VERTEX_VECTORS_SUB"/>
+	<value value="2" name="SQ_ALU0_ACTIVE_VTX_SIMD0"/>
+	<value value="3" name="SQ_ALU1_ACTIVE_VTX_SIMD0"/>
+	<value value="4" name="SQ_ALU0_ACTIVE_PIX_SIMD0"/>
+	<value value="5" name="SQ_ALU1_ACTIVE_PIX_SIMD0"/>
+	<value value="6" name="SQ_ALU0_ACTIVE_VTX_SIMD1"/>
+	<value value="7" name="SQ_ALU1_ACTIVE_VTX_SIMD1"/>
+	<value value="8" name="SQ_ALU0_ACTIVE_PIX_SIMD1"/>
+	<value value="9" name="SQ_ALU1_ACTIVE_PIX_SIMD1"/>
+	<value value="10" name="SQ_EXPORT_CYCLES"/>
+	<value value="11" name="SQ_ALU_CST_WRITTEN"/>
+	<value value="12" name="SQ_TEX_CST_WRITTEN"/>
+	<value value="13" name="SQ_ALU_CST_STALL"/>
+	<value value="14" name="SQ_ALU_TEX_STALL"/>
+	<value value="15" name="SQ_INST_WRITTEN"/>
+	<value value="16" name="SQ_BOOLEAN_WRITTEN"/>
+	<value value="17" name="SQ_LOOPS_WRITTEN"/>
+	<value value="18" name="SQ_PIXEL_SWAP_IN"/>
+	<value value="19" name="SQ_PIXEL_SWAP_OUT"/>
+	<value value="20" name="SQ_VERTEX_SWAP_IN"/>
+	<value value="21" name="SQ_VERTEX_SWAP_OUT"/>
+	<value value="22" name="SQ_ALU_VTX_INST_ISSUED"/>
+	<value value="23" name="SQ_TEX_VTX_INST_ISSUED"/>
+	<value value="24" name="SQ_VC_VTX_INST_ISSUED"/>
+	<value value="25" name="SQ_CF_VTX_INST_ISSUED"/>
+	<value value="26" name="SQ_ALU_PIX_INST_ISSUED"/>
+	<value value="27" name="SQ_TEX_PIX_INST_ISSUED"/>
+	<value value="28" name="SQ_VC_PIX_INST_ISSUED"/>
+	<value value="29" name="SQ_CF_PIX_INST_ISSUED"/>
+	<value value="30" name="SQ_ALU0_FIFO_EMPTY_SIMD0"/>
+	<value value="31" name="SQ_ALU1_FIFO_EMPTY_SIMD0"/>
+	<value value="32" name="SQ_ALU0_FIFO_EMPTY_SIMD1"/>
+	<value value="33" name="SQ_ALU1_FIFO_EMPTY_SIMD1"/>
+	<value value="34" name="SQ_ALU_NOPS"/>
+	<value value="35" name="SQ_PRED_SKIP"/>
+	<value value="36" name="SQ_SYNC_ALU_STALL_SIMD0_VTX"/>
+	<value value="37" name="SQ_SYNC_ALU_STALL_SIMD1_VTX"/>
+	<value value="38" name="SQ_SYNC_TEX_STALL_VTX"/>
+	<value value="39" name="SQ_SYNC_VC_STALL_VTX"/>
+	<value value="40" name="SQ_CONSTANTS_USED_SIMD0"/>
+	<value value="41" name="SQ_CONSTANTS_SENT_SP_SIMD0"/>
+	<value value="42" name="SQ_GPR_STALL_VTX"/>
+	<value value="43" name="SQ_GPR_STALL_PIX"/>
+	<value value="44" name="SQ_VTX_RS_STALL"/>
+	<value value="45" name="SQ_PIX_RS_STALL"/>
+	<value value="46" name="SQ_SX_PC_FULL"/>
+	<value value="47" name="SQ_SX_EXP_BUFF_FULL"/>
+	<value value="48" name="SQ_SX_POS_BUFF_FULL"/>
+	<value value="49" name="SQ_INTERP_QUADS"/>
+	<value value="50" name="SQ_INTERP_ACTIVE"/>
+	<value value="51" name="SQ_IN_PIXEL_STALL"/>
+	<value value="52" name="SQ_IN_VTX_STALL"/>
+	<value value="53" name="SQ_VTX_CNT"/>
+	<value value="54" name="SQ_VTX_VECTOR2"/>
+	<value value="55" name="SQ_VTX_VECTOR3"/>
+	<value value="56" name="SQ_VTX_VECTOR4"/>
+	<value value="57" name="SQ_PIXEL_VECTOR1"/>
+	<value value="58" name="SQ_PIXEL_VECTOR23"/>
+	<value value="59" name="SQ_PIXEL_VECTOR4"/>
+	<value value="60" name="SQ_CONSTANTS_USED_SIMD1"/>
+	<value value="61" name="SQ_CONSTANTS_SENT_SP_SIMD1"/>
+	<value value="62" name="SQ_SX_MEM_EXP_FULL"/>
+	<value value="63" name="SQ_ALU0_ACTIVE_VTX_SIMD2"/>
+	<value value="64" name="SQ_ALU1_ACTIVE_VTX_SIMD2"/>
+	<value value="65" name="SQ_ALU0_ACTIVE_PIX_SIMD2"/>
+	<value value="66" name="SQ_ALU1_ACTIVE_PIX_SIMD2"/>
+	<value value="67" name="SQ_ALU0_ACTIVE_VTX_SIMD3"/>
+	<value value="68" name="SQ_PERFCOUNT_VTX_QUAL_TP_DONE"/>
+	<value value="69" name="SQ_ALU0_ACTIVE_PIX_SIMD3"/>
+	<value value="70" name="SQ_PERFCOUNT_PIX_QUAL_TP_DONE"/>
+	<value value="71" name="SQ_ALU0_FIFO_EMPTY_SIMD2"/>
+	<value value="72" name="SQ_ALU1_FIFO_EMPTY_SIMD2"/>
+	<value value="73" name="SQ_ALU0_FIFO_EMPTY_SIMD3"/>
+	<value value="74" name="SQ_ALU1_FIFO_EMPTY_SIMD3"/>
+	<value value="75" name="SQ_SYNC_ALU_STALL_SIMD2_VTX"/>
+	<value value="76" name="SQ_PERFCOUNT_VTX_POP_THREAD"/>
+	<value value="77" name="SQ_SYNC_ALU_STALL_SIMD0_PIX"/>
+	<value value="78" name="SQ_SYNC_ALU_STALL_SIMD1_PIX"/>
+	<value value="79" name="SQ_SYNC_ALU_STALL_SIMD2_PIX"/>
+	<value value="80" name="SQ_PERFCOUNT_PIX_POP_THREAD"/>
+	<value value="81" name="SQ_SYNC_TEX_STALL_PIX"/>
+	<value value="82" name="SQ_SYNC_VC_STALL_PIX"/>
+	<value value="83" name="SQ_CONSTANTS_USED_SIMD2"/>
+	<value value="84" name="SQ_CONSTANTS_SENT_SP_SIMD2"/>
+	<value value="85" name="SQ_PERFCOUNT_VTX_DEALLOC_ACK"/>
+	<value value="86" name="SQ_PERFCOUNT_PIX_DEALLOC_ACK"/>
+	<value value="87" name="SQ_ALU0_FIFO_FULL_SIMD0"/>
+	<value value="88" name="SQ_ALU1_FIFO_FULL_SIMD0"/>
+	<value value="89" name="SQ_ALU0_FIFO_FULL_SIMD1"/>
+	<value value="90" name="SQ_ALU1_FIFO_FULL_SIMD1"/>
+	<value value="91" name="SQ_ALU0_FIFO_FULL_SIMD2"/>
+	<value value="92" name="SQ_ALU1_FIFO_FULL_SIMD2"/>
+	<value value="93" name="SQ_ALU0_FIFO_FULL_SIMD3"/>
+	<value value="94" name="SQ_ALU1_FIFO_FULL_SIMD3"/>
+	<value value="95" name="VC_PERF_STATIC"/>
+	<value value="96" name="VC_PERF_STALLED"/>
+	<value value="97" name="VC_PERF_STARVED"/>
+	<value value="98" name="VC_PERF_SEND"/>
+	<value value="99" name="VC_PERF_ACTUAL_STARVED"/>
+	<value value="100" name="PIXEL_THREAD_0_ACTIVE"/>
+	<value value="101" name="VERTEX_THREAD_0_ACTIVE"/>
+	<value value="102" name="PIXEL_THREAD_0_NUMBER"/>
+	<value value="103" name="VERTEX_THREAD_0_NUMBER"/>
+	<value value="104" name="VERTEX_EVENT_NUMBER"/>
+	<value value="105" name="PIXEL_EVENT_NUMBER"/>
+	<value value="106" name="PTRBUFF_EF_PUSH"/>
+	<value value="107" name="PTRBUFF_EF_POP_EVENT"/>
+	<value value="108" name="PTRBUFF_EF_POP_NEW_VTX"/>
+	<value value="109" name="PTRBUFF_EF_POP_DEALLOC"/>
+	<value value="110" name="PTRBUFF_EF_POP_PVECTOR"/>
+	<value value="111" name="PTRBUFF_EF_POP_PVECTOR_X"/>
+	<value value="112" name="PTRBUFF_EF_POP_PVECTOR_VNZ"/>
+	<value value="113" name="PTRBUFF_PB_DEALLOC"/>
+	<value value="114" name="PTRBUFF_PI_STATE_PPB_POP"/>
+	<value value="115" name="PTRBUFF_PI_RTR"/>
+	<value value="116" name="PTRBUFF_PI_READ_EN"/>
+	<value value="117" name="PTRBUFF_PI_BUFF_SWAP"/>
+	<value value="118" name="PTRBUFF_SQ_FREE_BUFF"/>
+	<value value="119" name="PTRBUFF_SQ_DEC"/>
+	<value value="120" name="PTRBUFF_SC_VALID_CNTL_EVENT"/>
+	<value value="121" name="PTRBUFF_SC_VALID_IJ_XFER"/>
+	<value value="122" name="PTRBUFF_SC_NEW_VECTOR_1_Q"/>
+	<value value="123" name="PTRBUFF_QUAL_NEW_VECTOR"/>
+	<value value="124" name="PTRBUFF_QUAL_EVENT"/>
+	<value value="125" name="PTRBUFF_END_BUFFER"/>
+	<value value="126" name="PTRBUFF_FILL_QUAD"/>
+	<value value="127" name="VERTS_WRITTEN_SPI"/>
+	<value value="128" name="TP_FETCH_INSTR_EXEC"/>
+	<value value="129" name="TP_FETCH_INSTR_REQ"/>
+	<value value="130" name="TP_DATA_RETURN"/>
+	<value value="131" name="SPI_WRITE_CYCLES_SP"/>
+	<value value="132" name="SPI_WRITES_SP"/>
+	<value value="133" name="SP_ALU_INSTR_EXEC"/>
+	<value value="134" name="SP_CONST_ADDR_TO_SQ"/>
+	<value value="135" name="SP_PRED_KILLS_TO_SQ"/>
+	<value value="136" name="SP_EXPORT_CYCLES_TO_SX"/>
+	<value value="137" name="SP_EXPORTS_TO_SX"/>
+	<value value="138" name="SQ_CYCLES_ELAPSED"/>
+	<value value="139" name="SQ_TCFS_OPT_ALLOC_EXEC"/>
+	<value value="140" name="SQ_TCFS_NO_OPT_ALLOC"/>
+	<value value="141" name="SQ_ALU0_NO_OPT_ALLOC"/>
+	<value value="142" name="SQ_ALU1_NO_OPT_ALLOC"/>
+	<value value="143" name="SQ_TCFS_ARB_XFC_CNT"/>
+	<value value="144" name="SQ_ALU0_ARB_XFC_CNT"/>
+	<value value="145" name="SQ_ALU1_ARB_XFC_CNT"/>
+	<value value="146" name="SQ_TCFS_CFS_UPDATE_CNT"/>
+	<value value="147" name="SQ_ALU0_CFS_UPDATE_CNT"/>
+	<value value="148" name="SQ_ALU1_CFS_UPDATE_CNT"/>
+	<value value="149" name="SQ_VTX_PUSH_THREAD_CNT"/>
+	<value value="150" name="SQ_VTX_POP_THREAD_CNT"/>
+	<value value="151" name="SQ_PIX_PUSH_THREAD_CNT"/>
+	<value value="152" name="SQ_PIX_POP_THREAD_CNT"/>
+	<value value="153" name="SQ_PIX_TOTAL"/>
+	<value value="154" name="SQ_PIX_KILLED"/>
+</enum>
+
+<enum name="a2xx_sx_perfcnt_select">
+	<value value="0" name="SX_EXPORT_VECTORS"/>
+	<value value="1" name="SX_DUMMY_QUADS"/>
+	<value value="2" name="SX_ALPHA_FAIL"/>
+	<value value="3" name="SX_RB_QUAD_BUSY"/>
+	<value value="4" name="SX_RB_COLOR_BUSY"/>
+	<value value="5" name="SX_RB_QUAD_STALL"/>
+	<value value="6" name="SX_RB_COLOR_STALL"/>
+</enum>
+
+<enum name="a2xx_rbbm_perfcount1_sel">
+	<value value="0" name="RBBM1_COUNT"/>
+	<value value="1" name="RBBM1_NRT_BUSY"/>
+	<value value="2" name="RBBM1_RB_BUSY"/>
+	<value value="3" name="RBBM1_SQ_CNTX0_BUSY"/>
+	<value value="4" name="RBBM1_SQ_CNTX17_BUSY"/>
+	<value value="5" name="RBBM1_VGT_BUSY"/>
+	<value value="6" name="RBBM1_VGT_NODMA_BUSY"/>
+	<value value="7" name="RBBM1_PA_BUSY"/>
+	<value value="8" name="RBBM1_SC_CNTX_BUSY"/>
+	<value value="9" name="RBBM1_TPC_BUSY"/>
+	<value value="10" name="RBBM1_TC_BUSY"/>
+	<value value="11" name="RBBM1_SX_BUSY"/>
+	<value value="12" name="RBBM1_CP_COHER_BUSY"/>
+	<value value="13" name="RBBM1_CP_NRT_BUSY"/>
+	<value value="14" name="RBBM1_GFX_IDLE_STALL"/>
+	<value value="15" name="RBBM1_INTERRUPT"/>
+</enum>
+
+<enum name="a2xx_cp_perfcount_sel">
+	<value value="0" name="ALWAYS_COUNT"/>
+	<value value="1" name="TRANS_FIFO_FULL"/>
+	<value value="2" name="TRANS_FIFO_AF"/>
+	<value value="3" name="RCIU_PFPTRANS_WAIT"/>
+	<value value="6" name="RCIU_NRTTRANS_WAIT"/>
+	<value value="8" name="CSF_NRT_READ_WAIT"/>
+	<value value="9" name="CSF_I1_FIFO_FULL"/>
+	<value value="10" name="CSF_I2_FIFO_FULL"/>
+	<value value="11" name="CSF_ST_FIFO_FULL"/>
+	<value value="13" name="CSF_RING_ROQ_FULL"/>
+	<value value="14" name="CSF_I1_ROQ_FULL"/>
+	<value value="15" name="CSF_I2_ROQ_FULL"/>
+	<value value="16" name="CSF_ST_ROQ_FULL"/>
+	<value value="18" name="MIU_TAG_MEM_FULL"/>
+	<value value="19" name="MIU_WRITECLEAN"/>
+	<value value="22" name="MIU_NRT_WRITE_STALLED"/>
+	<value value="23" name="MIU_NRT_READ_STALLED"/>
+	<value value="24" name="ME_WRITE_CONFIRM_FIFO_FULL"/>
+	<value value="25" name="ME_VS_DEALLOC_FIFO_FULL"/>
+	<value value="26" name="ME_PS_DEALLOC_FIFO_FULL"/>
+	<value value="27" name="ME_REGS_VS_EVENT_FIFO_FULL"/>
+	<value value="28" name="ME_REGS_PS_EVENT_FIFO_FULL"/>
+	<value value="29" name="ME_REGS_CF_EVENT_FIFO_FULL"/>
+	<value value="30" name="ME_MICRO_RB_STARVED"/>
+	<value value="31" name="ME_MICRO_I1_STARVED"/>
+	<value value="32" name="ME_MICRO_I2_STARVED"/>
+	<value value="33" name="ME_MICRO_ST_STARVED"/>
+	<value value="40" name="RCIU_RBBM_DWORD_SENT"/>
+	<value value="41" name="ME_BUSY_CLOCKS"/>
+	<value value="42" name="ME_WAIT_CONTEXT_AVAIL"/>
+	<value value="43" name="PFP_TYPE0_PACKET"/>
+	<value value="44" name="PFP_TYPE3_PACKET"/>
+	<value value="45" name="CSF_RB_WPTR_NEQ_RPTR"/>
+	<value value="46" name="CSF_I1_SIZE_NEQ_ZERO"/>
+	<value value="47" name="CSF_I2_SIZE_NEQ_ZERO"/>
+	<value value="48" name="CSF_RBI1I2_FETCHING"/>
+</enum>
+
+<enum name="a2xx_rb_perfcnt_select">
+	<value value="0" name="RBPERF_CNTX_BUSY"/>
+	<value value="1" name="RBPERF_CNTX_BUSY_MAX"/>
+	<value value="2" name="RBPERF_SX_QUAD_STARVED"/>
+	<value value="3" name="RBPERF_SX_QUAD_STARVED_MAX"/>
+	<value value="4" name="RBPERF_GA_GC_CH0_SYS_REQ"/>
+	<value value="5" name="RBPERF_GA_GC_CH0_SYS_REQ_MAX"/>
+	<value value="6" name="RBPERF_GA_GC_CH1_SYS_REQ"/>
+	<value value="7" name="RBPERF_GA_GC_CH1_SYS_REQ_MAX"/>
+	<value value="8" name="RBPERF_MH_STARVED"/>
+	<value value="9" name="RBPERF_MH_STARVED_MAX"/>
+	<value value="10" name="RBPERF_AZ_BC_COLOR_BUSY"/>
+	<value value="11" name="RBPERF_AZ_BC_COLOR_BUSY_MAX"/>
+	<value value="12" name="RBPERF_AZ_BC_Z_BUSY"/>
+	<value value="13" name="RBPERF_AZ_BC_Z_BUSY_MAX"/>
+	<value value="14" name="RBPERF_RB_SC_TILE_RTR_N"/>
+	<value value="15" name="RBPERF_RB_SC_TILE_RTR_N_MAX"/>
+	<value value="16" name="RBPERF_RB_SC_SAMP_RTR_N"/>
+	<value value="17" name="RBPERF_RB_SC_SAMP_RTR_N_MAX"/>
+	<value value="18" name="RBPERF_RB_SX_QUAD_RTR_N"/>
+	<value value="19" name="RBPERF_RB_SX_QUAD_RTR_N_MAX"/>
+	<value value="20" name="RBPERF_RB_SX_COLOR_RTR_N"/>
+	<value value="21" name="RBPERF_RB_SX_COLOR_RTR_N_MAX"/>
+	<value value="22" name="RBPERF_RB_SC_SAMP_LZ_BUSY"/>
+	<value value="23" name="RBPERF_RB_SC_SAMP_LZ_BUSY_MAX"/>
+	<value value="24" name="RBPERF_ZXP_STALL"/>
+	<value value="25" name="RBPERF_ZXP_STALL_MAX"/>
+	<value value="26" name="RBPERF_EVENT_PENDING"/>
+	<value value="27" name="RBPERF_EVENT_PENDING_MAX"/>
+	<value value="28" name="RBPERF_RB_MH_VALID"/>
+	<value value="29" name="RBPERF_RB_MH_VALID_MAX"/>
+	<value value="30" name="RBPERF_SX_RB_QUAD_SEND"/>
+	<value value="31" name="RBPERF_SX_RB_COLOR_SEND"/>
+	<value value="32" name="RBPERF_SC_RB_TILE_SEND"/>
+	<value value="33" name="RBPERF_SC_RB_SAMPLE_SEND"/>
+	<value value="34" name="RBPERF_SX_RB_MEM_EXPORT"/>
+	<value value="35" name="RBPERF_SX_RB_QUAD_EVENT"/>
+	<value value="36" name="RBPERF_SC_RB_TILE_EVENT_FILTERED"/>
+	<value value="37" name="RBPERF_SC_RB_TILE_EVENT_ALL"/>
+	<value value="38" name="RBPERF_RB_SC_EZ_SEND"/>
+	<value value="39" name="RBPERF_RB_SX_INDEX_SEND"/>
+	<value value="40" name="RBPERF_GMEM_INTFO_RD"/>
+	<value value="41" name="RBPERF_GMEM_INTF1_RD"/>
+	<value value="42" name="RBPERF_GMEM_INTFO_WR"/>
+	<value value="43" name="RBPERF_GMEM_INTF1_WR"/>
+	<value value="44" name="RBPERF_RB_CP_CONTEXT_DONE"/>
+	<value value="45" name="RBPERF_RB_CP_CACHE_FLUSH"/>
+	<value value="46" name="RBPERF_ZPASS_DONE"/>
+	<value value="47" name="RBPERF_ZCMD_VALID"/>
+	<value value="48" name="RBPERF_CCMD_VALID"/>
+	<value value="49" name="RBPERF_ACCUM_GRANT"/>
+	<value value="50" name="RBPERF_ACCUM_C0_GRANT"/>
+	<value value="51" name="RBPERF_ACCUM_C1_GRANT"/>
+	<value value="52" name="RBPERF_ACCUM_FULL_BE_WR"/>
+	<value value="53" name="RBPERF_ACCUM_REQUEST_NO_GRANT"/>
+	<value value="54" name="RBPERF_ACCUM_TIMEOUT_PULSE"/>
+	<value value="55" name="RBPERF_ACCUM_LIN_TIMEOUT_PULSE"/>
+	<value value="56" name="RBPERF_ACCUM_CAM_HIT_FLUSHING"/>
+</enum>
+
+<enum name="a2xx_mh_perfcnt_select">
+	<value value="0" name="CP_R0_REQUESTS"/>
+	<value value="1" name="CP_R1_REQUESTS"/>
+	<value value="2" name="CP_R2_REQUESTS"/>
+	<value value="3" name="CP_R3_REQUESTS"/>
+	<value value="4" name="CP_R4_REQUESTS"/>
+	<value value="5" name="CP_TOTAL_READ_REQUESTS"/>
+	<value value="6" name="CP_TOTAL_WRITE_REQUESTS"/>
+	<value value="7" name="CP_TOTAL_REQUESTS"/>
+	<value value="8" name="CP_DATA_BYTES_WRITTEN"/>
+	<value value="9" name="CP_WRITE_CLEAN_RESPONSES"/>
+	<value value="10" name="CP_R0_READ_BURSTS_RECEIVED"/>
+	<value value="11" name="CP_R1_READ_BURSTS_RECEIVED"/>
+	<value value="12" name="CP_R2_READ_BURSTS_RECEIVED"/>
+	<value value="13" name="CP_R3_READ_BURSTS_RECEIVED"/>
+	<value value="14" name="CP_R4_READ_BURSTS_RECEIVED"/>
+	<value value="15" name="CP_TOTAL_READ_BURSTS_RECEIVED"/>
+	<value value="16" name="CP_R0_DATA_BEATS_READ"/>
+	<value value="17" name="CP_R1_DATA_BEATS_READ"/>
+	<value value="18" name="CP_R2_DATA_BEATS_READ"/>
+	<value value="19" name="CP_R3_DATA_BEATS_READ"/>
+	<value value="20" name="CP_R4_DATA_BEATS_READ"/>
+	<value value="21" name="CP_TOTAL_DATA_BEATS_READ"/>
+	<value value="22" name="VGT_R0_REQUESTS"/>
+	<value value="23" name="VGT_R1_REQUESTS"/>
+	<value value="24" name="VGT_TOTAL_REQUESTS"/>
+	<value value="25" name="VGT_R0_READ_BURSTS_RECEIVED"/>
+	<value value="26" name="VGT_R1_READ_BURSTS_RECEIVED"/>
+	<value value="27" name="VGT_TOTAL_READ_BURSTS_RECEIVED"/>
+	<value value="28" name="VGT_R0_DATA_BEATS_READ"/>
+	<value value="29" name="VGT_R1_DATA_BEATS_READ"/>
+	<value value="30" name="VGT_TOTAL_DATA_BEATS_READ"/>
+	<value value="31" name="TC_TOTAL_REQUESTS"/>
+	<value value="32" name="TC_ROQ_REQUESTS"/>
+	<value value="33" name="TC_INFO_SENT"/>
+	<value value="34" name="TC_READ_BURSTS_RECEIVED"/>
+	<value value="35" name="TC_DATA_BEATS_READ"/>
+	<value value="36" name="TCD_BURSTS_READ"/>
+	<value value="37" name="RB_REQUESTS"/>
+	<value value="38" name="RB_DATA_BYTES_WRITTEN"/>
+	<value value="39" name="RB_WRITE_CLEAN_RESPONSES"/>
+	<value value="40" name="AXI_READ_REQUESTS_ID_0"/>
+	<value value="41" name="AXI_READ_REQUESTS_ID_1"/>
+	<value value="42" name="AXI_READ_REQUESTS_ID_2"/>
+	<value value="43" name="AXI_READ_REQUESTS_ID_3"/>
+	<value value="44" name="AXI_READ_REQUESTS_ID_4"/>
+	<value value="45" name="AXI_READ_REQUESTS_ID_5"/>
+	<value value="46" name="AXI_READ_REQUESTS_ID_6"/>
+	<value value="47" name="AXI_READ_REQUESTS_ID_7"/>
+	<value value="48" name="AXI_TOTAL_READ_REQUESTS"/>
+	<value value="49" name="AXI_WRITE_REQUESTS_ID_0"/>
+	<value value="50" name="AXI_WRITE_REQUESTS_ID_1"/>
+	<value value="51" name="AXI_WRITE_REQUESTS_ID_2"/>
+	<value value="52" name="AXI_WRITE_REQUESTS_ID_3"/>
+	<value value="53" name="AXI_WRITE_REQUESTS_ID_4"/>
+	<value value="54" name="AXI_WRITE_REQUESTS_ID_5"/>
+	<value value="55" name="AXI_WRITE_REQUESTS_ID_6"/>
+	<value value="56" name="AXI_WRITE_REQUESTS_ID_7"/>
+	<value value="57" name="AXI_TOTAL_WRITE_REQUESTS"/>
+	<value value="58" name="AXI_TOTAL_REQUESTS_ID_0"/>
+	<value value="59" name="AXI_TOTAL_REQUESTS_ID_1"/>
+	<value value="60" name="AXI_TOTAL_REQUESTS_ID_2"/>
+	<value value="61" name="AXI_TOTAL_REQUESTS_ID_3"/>
+	<value value="62" name="AXI_TOTAL_REQUESTS_ID_4"/>
+	<value value="63" name="AXI_TOTAL_REQUESTS_ID_5"/>
+	<value value="64" name="AXI_TOTAL_REQUESTS_ID_6"/>
+	<value value="65" name="AXI_TOTAL_REQUESTS_ID_7"/>
+	<value value="66" name="AXI_TOTAL_REQUESTS"/>
+	<value value="67" name="AXI_READ_CHANNEL_BURSTS_ID_0"/>
+	<value value="68" name="AXI_READ_CHANNEL_BURSTS_ID_1"/>
+	<value value="69" name="AXI_READ_CHANNEL_BURSTS_ID_2"/>
+	<value value="70" name="AXI_READ_CHANNEL_BURSTS_ID_3"/>
+	<value value="71" name="AXI_READ_CHANNEL_BURSTS_ID_4"/>
+	<value value="72" name="AXI_READ_CHANNEL_BURSTS_ID_5"/>
+	<value value="73" name="AXI_READ_CHANNEL_BURSTS_ID_6"/>
+	<value value="74" name="AXI_READ_CHANNEL_BURSTS_ID_7"/>
+	<value value="75" name="AXI_READ_CHANNEL_TOTAL_BURSTS"/>
+	<value value="76" name="AXI_READ_CHANNEL_DATA_BEATS_READ_ID_0"/>
+	<value value="77" name="AXI_READ_CHANNEL_DATA_BEATS_READ_ID_1"/>
+	<value value="78" name="AXI_READ_CHANNEL_DATA_BEATS_READ_ID_2"/>
+	<value value="79" name="AXI_READ_CHANNEL_DATA_BEATS_READ_ID_3"/>
+	<value value="80" name="AXI_READ_CHANNEL_DATA_BEATS_READ_ID_4"/>
+	<value value="81" name="AXI_READ_CHANNEL_DATA_BEATS_READ_ID_5"/>
+	<value value="82" name="AXI_READ_CHANNEL_DATA_BEATS_READ_ID_6"/>
+	<value value="83" name="AXI_READ_CHANNEL_DATA_BEATS_READ_ID_7"/>
+	<value value="84" name="AXI_READ_CHANNEL_TOTAL_DATA_BEATS_READ"/>
+	<value value="85" name="AXI_WRITE_CHANNEL_BURSTS_ID_0"/>
+	<value value="86" name="AXI_WRITE_CHANNEL_BURSTS_ID_1"/>
+	<value value="87" name="AXI_WRITE_CHANNEL_BURSTS_ID_2"/>
+	<value value="88" name="AXI_WRITE_CHANNEL_BURSTS_ID_3"/>
+	<value value="89" name="AXI_WRITE_CHANNEL_BURSTS_ID_4"/>
+	<value value="90" name="AXI_WRITE_CHANNEL_BURSTS_ID_5"/>
+	<value value="91" name="AXI_WRITE_CHANNEL_BURSTS_ID_6"/>
+	<value value="92" name="AXI_WRITE_CHANNEL_BURSTS_ID_7"/>
+	<value value="93" name="AXI_WRITE_CHANNEL_TOTAL_BURSTS"/>
+	<value value="94" name="AXI_WRITE_CHANNEL_DATA_BYTES_WRITTEN_ID_0"/>
+	<value value="95" name="AXI_WRITE_CHANNEL_DATA_BYTES_WRITTEN_ID_1"/>
+	<value value="96" name="AXI_WRITE_CHANNEL_DATA_BYTES_WRITTEN_ID_2"/>
+	<value value="97" name="AXI_WRITE_CHANNEL_DATA_BYTES_WRITTEN_ID_3"/>
+	<value value="98" name="AXI_WRITE_CHANNEL_DATA_BYTES_WRITTEN_ID_4"/>
+	<value value="99" name="AXI_WRITE_CHANNEL_DATA_BYTES_WRITTEN_ID_5"/>
+	<value value="100" name="AXI_WRITE_CHANNEL_DATA_BYTES_WRITTEN_ID_6"/>
+	<value value="101" name="AXI_WRITE_CHANNEL_DATA_BYTES_WRITTEN_ID_7"/>
+	<value value="102" name="AXI_WRITE_CHANNEL_TOTAL_DATA_BYTES_WRITTEN"/>
+	<value value="103" name="AXI_WRITE_RESPONSE_CHANNEL_RESPONSES_ID_0"/>
+	<value value="104" name="AXI_WRITE_RESPONSE_CHANNEL_RESPONSES_ID_1"/>
+	<value value="105" name="AXI_WRITE_RESPONSE_CHANNEL_RESPONSES_ID_2"/>
+	<value value="106" name="AXI_WRITE_RESPONSE_CHANNEL_RESPONSES_ID_3"/>
+	<value value="107" name="AXI_WRITE_RESPONSE_CHANNEL_RESPONSES_ID_4"/>
+	<value value="108" name="AXI_WRITE_RESPONSE_CHANNEL_RESPONSES_ID_5"/>
+	<value value="109" name="AXI_WRITE_RESPONSE_CHANNEL_RESPONSES_ID_6"/>
+	<value value="110" name="AXI_WRITE_RESPONSE_CHANNEL_RESPONSES_ID_7"/>
+	<value value="111" name="AXI_WRITE_RESPONSE_CHANNEL_TOTAL_RESPONSES"/>
+	<value value="112" name="TOTAL_MMU_MISSES"/>
+	<value value="113" name="MMU_READ_MISSES"/>
+	<value value="114" name="MMU_WRITE_MISSES"/>
+	<value value="115" name="TOTAL_MMU_HITS"/>
+	<value value="116" name="MMU_READ_HITS"/>
+	<value value="117" name="MMU_WRITE_HITS"/>
+	<value value="118" name="SPLIT_MODE_TC_HITS"/>
+	<value value="119" name="SPLIT_MODE_TC_MISSES"/>
+	<value value="120" name="SPLIT_MODE_NON_TC_HITS"/>
+	<value value="121" name="SPLIT_MODE_NON_TC_MISSES"/>
+	<value value="122" name="STALL_AWAITING_TLB_MISS_FETCH"/>
+	<value value="123" name="MMU_TLB_MISS_READ_BURSTS_RECEIVED"/>
+	<value value="124" name="MMU_TLB_MISS_DATA_BEATS_READ"/>
+	<value value="125" name="CP_CYCLES_HELD_OFF"/>
+	<value value="126" name="VGT_CYCLES_HELD_OFF"/>
+	<value value="127" name="TC_CYCLES_HELD_OFF"/>
+	<value value="128" name="TC_ROQ_CYCLES_HELD_OFF"/>
+	<value value="129" name="TC_CYCLES_HELD_OFF_TCD_FULL"/>
+	<value value="130" name="RB_CYCLES_HELD_OFF"/>
+	<value value="131" name="TOTAL_CYCLES_ANY_CLNT_HELD_OFF"/>
+	<value value="132" name="TLB_MISS_CYCLES_HELD_OFF"/>
+	<value value="133" name="AXI_READ_REQUEST_HELD_OFF"/>
+	<value value="134" name="AXI_WRITE_REQUEST_HELD_OFF"/>
+	<value value="135" name="AXI_REQUEST_HELD_OFF"/>
+	<value value="136" name="AXI_REQUEST_HELD_OFF_INFLIGHT_LIMIT"/>
+	<value value="137" name="AXI_WRITE_DATA_HELD_OFF"/>
+	<value value="138" name="CP_SAME_PAGE_BANK_REQUESTS"/>
+	<value value="139" name="VGT_SAME_PAGE_BANK_REQUESTS"/>
+	<value value="140" name="TC_SAME_PAGE_BANK_REQUESTS"/>
+	<value value="141" name="TC_ARB_HOLD_SAME_PAGE_BANK_REQUESTS"/>
+	<value value="142" name="RB_SAME_PAGE_BANK_REQUESTS"/>
+	<value value="143" name="TOTAL_SAME_PAGE_BANK_REQUESTS"/>
+	<value value="144" name="CP_SAME_PAGE_BANK_REQUESTS_KILLED_FAIRNESS_LIMIT"/>
+	<value value="145" name="VGT_SAME_PAGE_BANK_REQUESTS_KILLED_FAIRNESS_LIMIT"/>
+	<value value="146" name="TC_SAME_PAGE_BANK_REQUESTS_KILLED_FAIRNESS_LIMIT"/>
+	<value value="147" name="RB_SAME_PAGE_BANK_REQUESTS_KILLED_FAIRNESS_LIMIT"/>
+	<value value="148" name="TOTAL_SAME_PAGE_BANK_KILLED_FAIRNESS_LIMIT"/>
+	<value value="149" name="TOTAL_MH_READ_REQUESTS"/>
+	<value value="150" name="TOTAL_MH_WRITE_REQUESTS"/>
+	<value value="151" name="TOTAL_MH_REQUESTS"/>
+	<value value="152" name="MH_BUSY"/>
+	<value value="153" name="CP_NTH_ACCESS_SAME_PAGE_BANK_SEQUENCE"/>
+	<value value="154" name="VGT_NTH_ACCESS_SAME_PAGE_BANK_SEQUENCE"/>
+	<value value="155" name="TC_NTH_ACCESS_SAME_PAGE_BANK_SEQUENCE"/>
+	<value value="156" name="RB_NTH_ACCESS_SAME_PAGE_BANK_SEQUENCE"/>
+	<value value="157" name="TC_ROQ_N_VALID_ENTRIES"/>
+	<value value="158" name="ARQ_N_ENTRIES"/>
+	<value value="159" name="WDB_N_ENTRIES"/>
+	<value value="160" name="MH_READ_LATENCY_OUTST_REQ_SUM"/>
+	<value value="161" name="MC_READ_LATENCY_OUTST_REQ_SUM"/>
+	<value value="162" name="MC_TOTAL_READ_REQUESTS"/>
+	<value value="163" name="ELAPSED_CYCLES_MH_GATED_CLK"/>
+	<value value="164" name="ELAPSED_CLK_CYCLES"/>
+	<value value="165" name="CP_W_16B_REQUESTS"/>
+	<value value="166" name="CP_W_32B_REQUESTS"/>
+	<value value="167" name="TC_16B_REQUESTS"/>
+	<value value="168" name="TC_32B_REQUESTS"/>
+	<value value="169" name="PA_REQUESTS"/>
+	<value value="170" name="PA_DATA_BYTES_WRITTEN"/>
+	<value value="171" name="PA_WRITE_CLEAN_RESPONSES"/>
+	<value value="172" name="PA_CYCLES_HELD_OFF"/>
+	<value value="173" name="AXI_READ_REQUEST_DATA_BEATS_ID_0"/>
+	<value value="174" name="AXI_READ_REQUEST_DATA_BEATS_ID_1"/>
+	<value value="175" name="AXI_READ_REQUEST_DATA_BEATS_ID_2"/>
+	<value value="176" name="AXI_READ_REQUEST_DATA_BEATS_ID_3"/>
+	<value value="177" name="AXI_READ_REQUEST_DATA_BEATS_ID_4"/>
+	<value value="178" name="AXI_READ_REQUEST_DATA_BEATS_ID_5"/>
+	<value value="179" name="AXI_READ_REQUEST_DATA_BEATS_ID_6"/>
+	<value value="180" name="AXI_READ_REQUEST_DATA_BEATS_ID_7"/>
+	<value value="181" name="AXI_TOTAL_READ_REQUEST_DATA_BEATS"/>
+</enum>
+
+<enum name="perf_mode_cnt">
+	<value name="PERF_STATE_RESET" value="0"/>
+	<value name="PERF_STATE_ENABLE" value="1"/>
+	<value name="PERF_STATE_FREEZE" value="2"/>
+</enum>
+
+<domain name="A2XX" width="32">
+
+	<bitset name="a2xx_vgt_current_bin_id_min_max" inline="yes">
+		<bitfield name="COLUMN" low="0" high="2" type="uint"/>
+		<bitfield name="ROW" low="3" high="5" type="uint"/>
+		<bitfield name="GUARD_BAND_MASK" low="6" high="8" type="uint"/>
+	</bitset>
+
+	<reg32 offset="0x0001" name="RBBM_PATCH_RELEASE"/>
+	<reg32 offset="0x003b" name="RBBM_CNTL"/>
+	<reg32 offset="0x003c" name="RBBM_SOFT_RESET"/>
+	<reg32 offset="0x00c0" name="CP_PFP_UCODE_ADDR"/>
+	<reg32 offset="0x00c1" name="CP_PFP_UCODE_DATA"/>
+
+	<enum name="adreno_mmu_clnt_beh">
+		<value name="BEH_NEVR" value="0"/>
+		<value name="BEH_TRAN_RNG" value="1"/>
+		<value name="BEH_TRAN_FLT" value="2"/>
+	</enum>
+
+	<!--
+		Note: these seem applicable only for a2xx devices with gpummu?  At
+		any rate, MH_MMU_CONFIG shows up in places in a3xx firmware where
+		it doesn't make sense, so I think offset 0x40 must be a different
+		register on a3xx.. so moving this back into A2XX domain:
+	 -->
+	<reg32 offset="0x0040" name="MH_MMU_CONFIG">
+		<bitfield name="MMU_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="SPLIT_MODE_ENABLE" pos="1" type="boolean"/>
+		<bitfield name="RB_W_CLNT_BEHAVIOR" low="4" high="5" type="adreno_mmu_clnt_beh"/>
+		<bitfield name="CP_W_CLNT_BEHAVIOR" low="6" high="7" type="adreno_mmu_clnt_beh"/>
+		<bitfield name="CP_R0_CLNT_BEHAVIOR" low="8" high="9" type="adreno_mmu_clnt_beh"/>
+		<bitfield name="CP_R1_CLNT_BEHAVIOR" low="10" high="11" type="adreno_mmu_clnt_beh"/>
+		<bitfield name="CP_R2_CLNT_BEHAVIOR" low="12" high="13" type="adreno_mmu_clnt_beh"/>
+		<bitfield name="CP_R3_CLNT_BEHAVIOR" low="14" high="15" type="adreno_mmu_clnt_beh"/>
+		<bitfield name="CP_R4_CLNT_BEHAVIOR" low="16" high="17" type="adreno_mmu_clnt_beh"/>
+		<bitfield name="VGT_R0_CLNT_BEHAVIOR" low="18" high="19" type="adreno_mmu_clnt_beh"/>
+		<bitfield name="VGT_R1_CLNT_BEHAVIOR" low="20" high="21" type="adreno_mmu_clnt_beh"/>
+		<bitfield name="TC_R_CLNT_BEHAVIOR" low="22" high="23" type="adreno_mmu_clnt_beh"/>
+		<bitfield name="PA_W_CLNT_BEHAVIOR" low="24" high="25" type="adreno_mmu_clnt_beh"/>
+	</reg32>
+	<reg32 offset="0x0041" name="MH_MMU_VA_RANGE">
+		<bitfield name="NUM_64KB_REGIONS" low="0" high="11" type="uint"/>
+		<bitfield name="VA_BASE" low="12" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0042" name="MH_MMU_PT_BASE"/>
+	<reg32 offset="0x0043" name="MH_MMU_PAGE_FAULT"/>
+	<reg32 offset="0x0044" name="MH_MMU_TRAN_ERROR"/>
+	<reg32 offset="0x0045" name="MH_MMU_INVALIDATE">
+		<bitfield name="INVALIDATE_ALL" pos="0" type="boolean"/>
+		<bitfield name="INVALIDATE_TC" pos="1" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0046" name="MH_MMU_MPU_BASE"/>
+	<reg32 offset="0x0047" name="MH_MMU_MPU_END"/>
+
+	<reg32 offset="0x0394" name="NQWAIT_UNTIL"/>
+	<reg32 offset="0x0395" name="RBBM_PERFCOUNTER0_SELECT"/>
+	<reg32 offset="0x0396" name="RBBM_PERFCOUNTER1_SELECT"/>
+	<reg32 offset="0x0397" name="RBBM_PERFCOUNTER0_LO"/>
+	<reg32 offset="0x0398" name="RBBM_PERFCOUNTER0_HI"/>
+	<reg32 offset="0x0399" name="RBBM_PERFCOUNTER1_LO"/>
+	<reg32 offset="0x039a" name="RBBM_PERFCOUNTER1_HI"/>
+	<reg32 offset="0x039b" name="RBBM_DEBUG"/>
+	<reg32 offset="0x039c" name="RBBM_PM_OVERRIDE1">
+		<bitfield name="RBBM_AHBCLK_PM_OVERRIDE" pos="0" type="boolean"/>
+		<bitfield name="SC_REG_SCLK_PM_OVERRIDE" pos="1" type="boolean"/>
+		<bitfield name="SC_SCLK_PM_OVERRIDE" pos="2" type="boolean"/>
+		<bitfield name="SP_TOP_SCLK_PM_OVERRIDE" pos="3" type="boolean"/>
+		<bitfield name="SP_V0_SCLK_PM_OVERRIDE" pos="4" type="boolean"/>
+		<bitfield name="SQ_REG_SCLK_PM_OVERRIDE" pos="5" type="boolean"/>
+		<bitfield name="SQ_REG_FIFOS_SCLK_PM_OVERRIDE" pos="6" type="boolean"/>
+		<bitfield name="SQ_CONST_MEM_SCLK_PM_OVERRIDE" pos="7" type="boolean"/>
+		<bitfield name="SQ_SQ_SCLK_PM_OVERRIDE" pos="8" type="boolean"/>
+		<bitfield name="SX_SCLK_PM_OVERRIDE" pos="9" type="boolean"/>
+		<bitfield name="SX_REG_SCLK_PM_OVERRIDE" pos="10" type="boolean"/>
+		<bitfield name="TCM_TCO_SCLK_PM_OVERRIDE" pos="11" type="boolean"/>
+		<bitfield name="TCM_TCM_SCLK_PM_OVERRIDE" pos="12" type="boolean"/>
+		<bitfield name="TCM_TCD_SCLK_PM_OVERRIDE" pos="13" type="boolean"/>
+		<bitfield name="TCM_REG_SCLK_PM_OVERRIDE" pos="14" type="boolean"/>
+		<bitfield name="TPC_TPC_SCLK_PM_OVERRIDE" pos="15" type="boolean"/>
+		<bitfield name="TPC_REG_SCLK_PM_OVERRIDE" pos="16" type="boolean"/>
+		<bitfield name="TCF_TCA_SCLK_PM_OVERRIDE" pos="17" type="boolean"/>
+		<bitfield name="TCF_TCB_SCLK_PM_OVERRIDE" pos="18" type="boolean"/>
+		<bitfield name="TCF_TCB_READ_SCLK_PM_OVERRIDE" pos="19" type="boolean"/>
+		<bitfield name="TP_TP_SCLK_PM_OVERRIDE" pos="20" type="boolean"/>
+		<bitfield name="TP_REG_SCLK_PM_OVERRIDE" pos="21" type="boolean"/>
+		<bitfield name="CP_G_SCLK_PM_OVERRIDE" pos="22" type="boolean"/>
+		<bitfield name="CP_REG_SCLK_PM_OVERRIDE" pos="23" type="boolean"/>
+		<bitfield name="CP_G_REG_SCLK_PM_OVERRIDE" pos="24" type="boolean"/>
+		<bitfield name="SPI_SCLK_PM_OVERRIDE" pos="25" type="boolean"/>
+		<bitfield name="RB_REG_SCLK_PM_OVERRIDE" pos="26" type="boolean"/>
+		<bitfield name="RB_SCLK_PM_OVERRIDE" pos="27" type="boolean"/>
+		<bitfield name="MH_MH_SCLK_PM_OVERRIDE" pos="28" type="boolean"/>
+		<bitfield name="MH_REG_SCLK_PM_OVERRIDE" pos="29" type="boolean"/>
+		<bitfield name="MH_MMU_SCLK_PM_OVERRIDE" pos="30" type="boolean"/>
+		<bitfield name="MH_TCROQ_SCLK_PM_OVERRIDE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x039d" name="RBBM_PM_OVERRIDE2">
+		<bitfield name="PA_REG_SCLK_PM_OVERRIDE" pos="0" type="boolean"/>
+		<bitfield name="PA_PA_SCLK_PM_OVERRIDE" pos="1" type="boolean"/>
+		<bitfield name="PA_AG_SCLK_PM_OVERRIDE" pos="2" type="boolean"/>
+		<bitfield name="VGT_REG_SCLK_PM_OVERRIDE" pos="3" type="boolean"/>
+		<bitfield name="VGT_FIFOS_SCLK_PM_OVERRIDE" pos="4" type="boolean"/>
+		<bitfield name="VGT_VGT_SCLK_PM_OVERRIDE" pos="5" type="boolean"/>
+		<bitfield name="DEBUG_PERF_SCLK_PM_OVERRIDE" pos="6" type="boolean"/>
+		<bitfield name="PERM_SCLK_PM_OVERRIDE" pos="7" type="boolean"/>
+		<bitfield name="GC_GA_GMEM0_PM_OVERRIDE" pos="8" type="boolean"/>
+		<bitfield name="GC_GA_GMEM1_PM_OVERRIDE" pos="9" type="boolean"/>
+		<bitfield name="GC_GA_GMEM2_PM_OVERRIDE" pos="10" type="boolean"/>
+		<bitfield name="GC_GA_GMEM3_PM_OVERRIDE" pos="11" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x03a0" name="RBBM_DEBUG_OUT"/>
+	<reg32 offset="0x03a1" name="RBBM_DEBUG_CNTL"/>
+	<reg32 offset="0x03b3" name="RBBM_READ_ERROR"/>
+	<reg32 offset="0x03b4" name="RBBM_INT_CNTL">
+		<bitfield name="RDERR_INT_MASK" pos="0" type="boolean"/>
+		<bitfield name="DISPLAY_UPDATE_INT_MASK" pos="1" type="boolean"/>
+		<bitfield name="GUI_IDLE_INT_MASK" pos="19" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x03b5" name="RBBM_INT_STATUS"/>
+	<reg32 offset="0x03b6" name="RBBM_INT_ACK"/>
+	<reg32 offset="0x03b7" name="MASTER_INT_SIGNAL">
+		<bitfield name="MH_INT_STAT" pos="5" type="boolean"/>
+		<bitfield name="SQ_INT_STAT" pos="26" type="boolean"/>
+		<bitfield name="CP_INT_STAT" pos="30" type="boolean"/>
+		<bitfield name="RBBM_INT_STAT" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x03f9" name="RBBM_PERIPHID1"/>
+	<reg32 offset="0x03fa" name="RBBM_PERIPHID2"/>
+	<reg32 offset="0x0444" name="CP_PERFMON_CNTL">
+		<!-- The width is uncertain -->
+		<bitfield name="PERF_MODE_CNT" low="0" high="2" type="perf_mode_cnt"/>
+	</reg32>
+	<reg32 offset="0x0445" name="CP_PERFCOUNTER_SELECT"/>
+	<reg32 offset="0x0446" name="CP_PERFCOUNTER_LO"/>
+	<reg32 offset="0x0447" name="CP_PERFCOUNTER_HI"/>
+	<reg32 offset="0x05d0" name="RBBM_STATUS">
+		<bitfield name="CMDFIFO_AVAIL" low="0" high="4" type="uint"/>
+		<bitfield name="TC_BUSY" pos="5" type="boolean"/>
+		<bitfield name="HIRQ_PENDING" pos="8" type="boolean"/>
+		<bitfield name="CPRQ_PENDING" pos="9" type="boolean"/>
+		<bitfield name="CFRQ_PENDING" pos="10" type="boolean"/>
+		<bitfield name="PFRQ_PENDING" pos="11" type="boolean"/>
+		<bitfield name="VGT_BUSY_NO_DMA" pos="12" type="boolean"/>
+		<bitfield name="RBBM_WU_BUSY" pos="14" type="boolean"/>
+		<bitfield name="CP_NRT_BUSY" pos="16" type="boolean"/>
+		<bitfield name="MH_BUSY" pos="18" type="boolean"/>
+		<bitfield name="MH_COHERENCY_BUSY" pos="19" type="boolean"/>
+		<bitfield name="SX_BUSY" pos="21" type="boolean"/>
+		<bitfield name="TPC_BUSY" pos="22" type="boolean"/>
+		<bitfield name="SC_CNTX_BUSY" pos="24" type="boolean"/>
+		<bitfield name="PA_BUSY" pos="25" type="boolean"/>
+		<bitfield name="VGT_BUSY" pos="26" type="boolean"/>
+		<bitfield name="SQ_CNTX17_BUSY" pos="27" type="boolean"/>
+		<bitfield name="SQ_CNTX0_BUSY" pos="28" type="boolean"/>
+		<bitfield name="RB_CNTX_BUSY" pos="30" type="boolean"/>
+		<bitfield name="GUI_ACTIVE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0a40" name="MH_ARBITER_CONFIG">
+		<bitfield name="SAME_PAGE_LIMIT" low="0" high="5" type="uint"/>
+		<bitfield name="SAME_PAGE_GRANULARITY" pos="6" type="boolean"/>
+		<bitfield name="L1_ARB_ENABLE" pos="7" type="boolean"/>
+		<bitfield name="L1_ARB_HOLD_ENABLE" pos="8" type="boolean"/>
+		<bitfield name="L2_ARB_CONTROL" pos="9" type="boolean"/>
+		<bitfield name="PAGE_SIZE" low="10" high="12" type="uint"/>
+		<bitfield name="TC_REORDER_ENABLE" pos="13" type="boolean"/>
+		<bitfield name="TC_ARB_HOLD_ENABLE" pos="14" type="boolean"/>
+		<bitfield name="IN_FLIGHT_LIMIT_ENABLE" pos="15" type="boolean"/>
+		<bitfield name="IN_FLIGHT_LIMIT" low="16" high="21" type="uint"/>
+		<bitfield name="CP_CLNT_ENABLE" pos="22" type="boolean"/>
+		<bitfield name="VGT_CLNT_ENABLE" pos="23" type="boolean"/>
+		<bitfield name="TC_CLNT_ENABLE" pos="24" type="boolean"/>
+		<bitfield name="RB_CLNT_ENABLE" pos="25" type="boolean"/>
+		<bitfield name="PA_CLNT_ENABLE" pos="26" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0a42" name="MH_INTERRUPT_MASK">
+		<bitfield name="AXI_READ_ERROR" pos="0" type="boolean"/>
+		<bitfield name="AXI_WRITE_ERROR" pos="1" type="boolean"/>
+		<bitfield name="MMU_PAGE_FAULT" pos="2" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0a43" name="MH_INTERRUPT_STATUS"/>
+	<reg32 offset="0x0a44" name="MH_INTERRUPT_CLEAR"/>
+	<reg32 offset="0x0a54" name="MH_CLNT_INTF_CTRL_CONFIG1"/>
+	<reg32 offset="0x0a55" name="MH_CLNT_INTF_CTRL_CONFIG2"/>
+	<reg32 offset="0x0c01" name="A220_VSC_BIN_SIZE">
+		<bitfield name="WIDTH" low="0" high="4" shr="5" type="uint"/>
+		<bitfield name="HEIGHT" low="5" high="9" shr="5" type="uint"/>
+	</reg32>
+	<array offset="0x0c06" name="VSC_PIPE" stride="3" length="8">
+		<reg32 offset="0x0" name="CONFIG"/>
+		<reg32 offset="0x1" name="DATA_ADDRESS"/>
+		<reg32 offset="0x2" name="DATA_LENGTH"/>
+	</array>
+	<reg32 offset="0x0c38" name="PC_DEBUG_CNTL"/>
+	<reg32 offset="0x0c39" name="PC_DEBUG_DATA"/>
+	<reg32 offset="0x0c44" name="PA_SC_VIZ_QUERY_STATUS"/>
+	<reg32 offset="0x0c80" name="GRAS_DEBUG_CNTL"/>
+	<reg32 offset="0x0c80" name="PA_SU_DEBUG_CNTL"/>
+	<reg32 offset="0x0c81" name="GRAS_DEBUG_DATA"/>
+	<reg32 offset="0x0c81" name="PA_SU_DEBUG_DATA"/>
+	<reg32 offset="0x0c86" name="PA_SU_FACE_DATA">
+		<bitfield name="BASE_ADDR" low="5" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0d00" name="SQ_GPR_MANAGEMENT">
+		<bitfield name="REG_DYNAMIC" pos="0" type="boolean"/>
+		<bitfield name="REG_SIZE_PIX" low="4" high="11" type="uint"/>
+		<bitfield name="REG_SIZE_VTX" low="12" high="19" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0d01" name="SQ_FLOW_CONTROL"/>
+	<reg32 offset="0x0d02" name="SQ_INST_STORE_MANAGMENT">
+		<bitfield name="INST_BASE_PIX" low="0" high="11" type="uint"/>
+		<bitfield name="INST_BASE_VTX" low="16" high="27" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0d05" name="SQ_DEBUG_MISC"/>
+	<reg32 offset="0x0d34" name="SQ_INT_CNTL"/>
+	<reg32 offset="0x0d35" name="SQ_INT_STATUS"/>
+	<reg32 offset="0x0d36" name="SQ_INT_ACK"/>
+	<reg32 offset="0x0dae" name="SQ_DEBUG_INPUT_FSM"/>
+	<reg32 offset="0x0daf" name="SQ_DEBUG_CONST_MGR_FSM"/>
+	<reg32 offset="0x0db0" name="SQ_DEBUG_TP_FSM"/>
+	<reg32 offset="0x0db1" name="SQ_DEBUG_FSM_ALU_0"/>
+	<reg32 offset="0x0db2" name="SQ_DEBUG_FSM_ALU_1"/>
+	<reg32 offset="0x0db3" name="SQ_DEBUG_EXP_ALLOC"/>
+	<reg32 offset="0x0db4" name="SQ_DEBUG_PTR_BUFF"/>
+	<reg32 offset="0x0db5" name="SQ_DEBUG_GPR_VTX"/>
+	<reg32 offset="0x0db6" name="SQ_DEBUG_GPR_PIX"/>
+	<reg32 offset="0x0db7" name="SQ_DEBUG_TB_STATUS_SEL"/>
+	<reg32 offset="0x0db8" name="SQ_DEBUG_VTX_TB_0"/>
+	<reg32 offset="0x0db9" name="SQ_DEBUG_VTX_TB_1"/>
+	<reg32 offset="0x0dba" name="SQ_DEBUG_VTX_TB_STATUS_REG"/>
+	<reg32 offset="0x0dbb" name="SQ_DEBUG_VTX_TB_STATE_MEM"/>
+	<reg32 offset="0x0dbc" name="SQ_DEBUG_PIX_TB_0"/>
+	<reg32 offset="0x0dbd" name="SQ_DEBUG_PIX_TB_STATUS_REG_0"/>
+	<reg32 offset="0x0dbe" name="SQ_DEBUG_PIX_TB_STATUS_REG_1"/>
+	<reg32 offset="0x0dbf" name="SQ_DEBUG_PIX_TB_STATUS_REG_2"/>
+	<reg32 offset="0x0dc0" name="SQ_DEBUG_PIX_TB_STATUS_REG_3"/>
+	<reg32 offset="0x0dc1" name="SQ_DEBUG_PIX_TB_STATE_MEM"/>
+	<reg32 offset="0x0e00" name="TC_CNTL_STATUS">
+		<bitfield name="L2_INVALIDATE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0e1e" name="TP0_CHICKEN"/>
+	<reg32 offset="0x0f01" name="RB_BC_CONTROL">
+		<bitfield name="ACCUM_LINEAR_MODE_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="ACCUM_TIMEOUT_SELECT" low="1" high="2" type="uint"/>
+		<bitfield name="DISABLE_EDRAM_CAM" pos="3" type="boolean"/>
+		<bitfield name="DISABLE_EZ_FAST_CONTEXT_SWITCH" pos="4" type="boolean"/>
+		<bitfield name="DISABLE_EZ_NULL_ZCMD_DROP" pos="5" type="boolean"/>
+		<bitfield name="DISABLE_LZ_NULL_ZCMD_DROP" pos="6" type="boolean"/>
+		<bitfield name="ENABLE_AZ_THROTTLE" pos="7" type="boolean"/>
+		<bitfield name="AZ_THROTTLE_COUNT" low="8" high="12" type="uint"/>
+		<bitfield name="ENABLE_CRC_UPDATE" pos="14" type="boolean"/>
+		<bitfield name="CRC_MODE" pos="15" type="boolean"/>
+		<bitfield name="DISABLE_SAMPLE_COUNTERS" pos="16" type="boolean"/>
+		<bitfield name="DISABLE_ACCUM" pos="17" type="boolean"/>
+		<bitfield name="ACCUM_ALLOC_MASK" low="18" high="21" type="uint"/>
+		<bitfield name="LINEAR_PERFORMANCE_ENABLE" pos="22" type="boolean"/>
+		<bitfield name="ACCUM_DATA_FIFO_LIMIT" low="23" high="26" type="uint"/>
+		<bitfield name="MEM_EXPORT_TIMEOUT_SELECT" low="27" high="28" type="uint"/>
+		<bitfield name="MEM_EXPORT_LINEAR_MODE_ENABLE" pos="29" type="boolean"/>
+		<bitfield name="CRC_SYSTEM" pos="30" type="boolean"/>
+		<bitfield name="RESERVED6" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0f02" name="RB_EDRAM_INFO"/>
+	<reg32 offset="0x0f26" name="RB_DEBUG_CNTL"/>
+	<reg32 offset="0x0f27" name="RB_DEBUG_DATA"/>
+	<reg32 offset="0x2000" name="RB_SURFACE_INFO">
+		<bitfield name="SURFACE_PITCH" low="0" high="13" type="uint"/>
+		<bitfield name="MSAA_SAMPLES" low="14" high="15" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2001" name="RB_COLOR_INFO">
+		<bitfield name="FORMAT" low="0" high="3" type="a2xx_colorformatx"/>
+		<bitfield name="ROUND_MODE" low="4" high="5" type="uint"/>
+		<bitfield name="LINEAR" pos="6" type="boolean"/>
+		<bitfield name="ENDIAN" low="7" high="8" type="uint"/>
+		<bitfield name="SWAP" low="9" high="10" type="uint"/>
+		<bitfield name="BASE" low="12" high="31" shr="12"/>
+	</reg32>
+	<reg32 offset="0x2002" name="RB_DEPTH_INFO">
+		<bitfield name="DEPTH_FORMAT" pos="0" type="adreno_rb_depth_format"/>
+		<bitfield name="DEPTH_BASE" low="12" high="31" type="uint" shr="12"/>
+	</reg32>
+	<reg32 offset="0x2005" name="A225_RB_COLOR_INFO3"/>
+	<reg32 offset="0x2006" name="COHER_DEST_BASE_0"/>
+	<reg32 offset="0x200e" name="PA_SC_SCREEN_SCISSOR_TL" type="adreno_reg_xy"/>
+	<reg32 offset="0x200f" name="PA_SC_SCREEN_SCISSOR_BR" type="adreno_reg_xy"/>
+	<reg32 offset="0x2080" name="PA_SC_WINDOW_OFFSET">
+		<bitfield name="X" low="0" high="14" type="int"/>
+		<bitfield name="Y" low="16" high="30" type="int"/>
+		<bitfield name="DISABLE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2081" name="PA_SC_WINDOW_SCISSOR_TL" type="adreno_reg_xy"/>
+	<reg32 offset="0x2082" name="PA_SC_WINDOW_SCISSOR_BR" type="adreno_reg_xy"/>
+	<reg32 offset="0x2010" name="UNKNOWN_2010"/>
+	<reg32 offset="0x2100" name="VGT_MAX_VTX_INDX"/>
+	<reg32 offset="0x2101" name="VGT_MIN_VTX_INDX"/>
+	<reg32 offset="0x2102" name="VGT_INDX_OFFSET"/>
+	<reg32 offset="0x2103" name="A225_PC_MULTI_PRIM_IB_RESET_INDX"/>
+	<reg32 offset="0x2104" name="RB_COLOR_MASK">
+		<bitfield name="WRITE_RED" pos="0" type="boolean"/>
+		<bitfield name="WRITE_GREEN" pos="1" type="boolean"/>
+		<bitfield name="WRITE_BLUE" pos="2" type="boolean"/>
+		<bitfield name="WRITE_ALPHA" pos="3" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2105" name="RB_BLEND_RED"/>
+	<reg32 offset="0x2106" name="RB_BLEND_GREEN"/>
+	<reg32 offset="0x2107" name="RB_BLEND_BLUE"/>
+	<reg32 offset="0x2108" name="RB_BLEND_ALPHA"/>
+	<reg32 offset="0x2109" name="RB_FOG_COLOR">
+		<bitfield name="FOG_RED" low="0" high="7" type="uint"/>
+		<bitfield name="FOG_GREEN" low="8" high="15" type="uint"/>
+		<bitfield name="FOG_BLUE" low="16" high="23" type="uint"/>
+	</reg32>
+	<reg32 offset="0x210c" name="RB_STENCILREFMASK_BF" type="adreno_rb_stencilrefmask"/>
+	<reg32 offset="0x210d" name="RB_STENCILREFMASK" type="adreno_rb_stencilrefmask"/>
+	<reg32 offset="0x210e" name="RB_ALPHA_REF"/>
+	<reg32 offset="0x210f" name="PA_CL_VPORT_XSCALE" type="float"/>
+	<reg32 offset="0x2110" name="PA_CL_VPORT_XOFFSET" type="float"/>
+	<reg32 offset="0x2111" name="PA_CL_VPORT_YSCALE" type="float"/>
+	<reg32 offset="0x2112" name="PA_CL_VPORT_YOFFSET" type="float"/>
+	<reg32 offset="0x2113" name="PA_CL_VPORT_ZSCALE" type="float"/>
+	<reg32 offset="0x2114" name="PA_CL_VPORT_ZOFFSET" type="float"/>
+	<reg32 offset="0x2180" name="SQ_PROGRAM_CNTL">
+		<doc>
+			note: only 0x3f worth of valid register values for VS_REGS and
+			PS_REGS, but high bit is set to indicate '0 registers used':
+		</doc>
+		<bitfield name="VS_REGS" low="0" high="7" type="uint"/>
+		<bitfield name="PS_REGS" low="8" high="15" type="uint"/>
+		<bitfield name="VS_RESOURCE" pos="16" type="boolean"/>
+		<bitfield name="PS_RESOURCE" pos="17" type="boolean"/>
+		<bitfield name="PARAM_GEN" pos="18" type="boolean"/>
+		<bitfield name="GEN_INDEX_PIX" pos="19" type="boolean"/>
+		<bitfield name="VS_EXPORT_COUNT" low="20" high="23" type="uint"/>
+		<bitfield name="VS_EXPORT_MODE" low="24" high="26" type="a2xx_sq_ps_vtx_mode"/>
+		<bitfield name="PS_EXPORT_MODE" low="27" high="30" type="uint"/>
+		<bitfield name="GEN_INDEX_VTX" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2181" name="SQ_CONTEXT_MISC">
+		<bitfield name="INST_PRED_OPTIMIZE" pos="0" type="boolean"/>
+		<bitfield name="SC_OUTPUT_SCREEN_XY" pos="1" type="boolean"/>
+		<bitfield name="SC_SAMPLE_CNTL" low="2" high="3" type="a2xx_sq_sample_cntl"/>
+		<bitfield name="PARAM_GEN_POS" low="8" high="15" type="uint"/>
+		<bitfield name="PERFCOUNTER_REF" pos="16" type="boolean"/>
+		<bitfield name="YEILD_OPTIMIZE" pos="17" type="boolean"/>
+		<bitfield name="TX_CACHE_SEL" pos="18" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2182" name="SQ_INTERPOLATOR_CNTL">
+		<bitfield name="PARAM_SHADE" low="0" high="15" type="uint"/>
+		<bitfield name="SAMPLING_PATTERN" low="16" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2183" name="SQ_WRAPPING_0">
+		<bitfield name="PARAM_WRAP_0" low="0" high="3" type="uint"/>
+		<bitfield name="PARAM_WRAP_1" low="4" high="7" type="uint"/>
+		<bitfield name="PARAM_WRAP_2" low="8" high="11" type="uint"/>
+		<bitfield name="PARAM_WRAP_3" low="12" high="15" type="uint"/>
+		<bitfield name="PARAM_WRAP_4" low="16" high="19" type="uint"/>
+		<bitfield name="PARAM_WRAP_5" low="20" high="23" type="uint"/>
+		<bitfield name="PARAM_WRAP_6" low="24" high="27" type="uint"/>
+		<bitfield name="PARAM_WRAP_7" low="28" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2184" name="SQ_WRAPPING_1">
+		<bitfield name="PARAM_WRAP_8" low="0" high="3" type="uint"/>
+		<bitfield name="PARAM_WRAP_9" low="4" high="7" type="uint"/>
+		<bitfield name="PARAM_WRAP_10" low="8" high="11" type="uint"/>
+		<bitfield name="PARAM_WRAP_11" low="12" high="15" type="uint"/>
+		<bitfield name="PARAM_WRAP_12" low="16" high="19" type="uint"/>
+		<bitfield name="PARAM_WRAP_13" low="20" high="23" type="uint"/>
+		<bitfield name="PARAM_WRAP_14" low="24" high="27" type="uint"/>
+		<bitfield name="PARAM_WRAP_15" low="28" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x21f6" name="SQ_PS_PROGRAM">
+		<bitfield name="BASE" low="0" high="11" type="uint"/>
+		<bitfield name="SIZE" low="12" high="23" type="uint"/>
+	</reg32>
+	<reg32 offset="0x21f7" name="SQ_VS_PROGRAM">
+		<bitfield name="BASE" low="0" high="11" type="uint"/>
+		<bitfield name="SIZE" low="12" high="23" type="uint"/>
+	</reg32>
+	<reg32 offset="0x21f9" name="VGT_EVENT_INITIATOR"/>
+	<reg32 offset="0x21fc" name="VGT_DRAW_INITIATOR" type="vgt_draw_initiator"/>
+	<reg32 offset="0x21fd" name="VGT_IMMED_DATA"/>
+	<reg32 offset="0x2200" name="RB_DEPTHCONTROL">
+		<bitfield name="STENCIL_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="Z_ENABLE" pos="1" type="boolean"/>
+		<bitfield name="Z_WRITE_ENABLE" pos="2" type="boolean"/>
+		<bitfield name="EARLY_Z_ENABLE" pos="3" type="boolean"/>
+		<bitfield name="ZFUNC" low="4" high="6" type="adreno_compare_func"/>
+		<bitfield name="BACKFACE_ENABLE" pos="7" type="boolean"/>
+		<bitfield name="STENCILFUNC" low="8" high="10" type="adreno_compare_func"/>
+		<bitfield name="STENCILFAIL" low="11" high="13" type="adreno_stencil_op"/>
+		<bitfield name="STENCILZPASS" low="14" high="16" type="adreno_stencil_op"/>
+		<bitfield name="STENCILZFAIL" low="17" high="19" type="adreno_stencil_op"/>
+		<bitfield name="STENCILFUNC_BF" low="20" high="22" type="adreno_compare_func"/>
+		<bitfield name="STENCILFAIL_BF" low="23" high="25" type="adreno_stencil_op"/>
+		<bitfield name="STENCILZPASS_BF" low="26" high="28" type="adreno_stencil_op"/>
+		<bitfield name="STENCILZFAIL_BF" low="29" high="31" type="adreno_stencil_op"/>
+	</reg32>
+	<reg32 offset="0x2201" name="RB_BLEND_CONTROL">
+		<bitfield name="COLOR_SRCBLEND" low="0" high="4" type="adreno_rb_blend_factor"/>
+		<bitfield name="COLOR_COMB_FCN" low="5" high="7" type="a2xx_rb_blend_opcode"/>
+		<bitfield name="COLOR_DESTBLEND" low="8" high="12" type="adreno_rb_blend_factor"/>
+		<bitfield name="ALPHA_SRCBLEND" low="16" high="20" type="adreno_rb_blend_factor"/>
+		<bitfield name="ALPHA_COMB_FCN" low="21" high="23" type="a2xx_rb_blend_opcode"/>
+		<bitfield name="ALPHA_DESTBLEND" low="24" high="28" type="adreno_rb_blend_factor"/>
+		<bitfield name="BLEND_FORCE_ENABLE" pos="29" type="boolean"/>
+		<bitfield name="BLEND_FORCE" pos="30" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2202" name="RB_COLORCONTROL">
+		<bitfield name="ALPHA_FUNC" low="0" high="2" type="adreno_compare_func"/>
+		<bitfield name="ALPHA_TEST_ENABLE" pos="3" type="boolean"/>
+		<bitfield name="ALPHA_TO_MASK_ENABLE" pos="4" type="boolean"/>
+		<bitfield name="BLEND_DISABLE" pos="5" type="boolean"/>
+		<bitfield name="VOB_ENABLE" pos="6" type="boolean"/>
+		<bitfield name="VS_EXPORTS_FOG" pos="7" type="boolean"/>
+		<bitfield name="ROP_CODE" low="8" high="11" type="uint"/>
+		<bitfield name="DITHER_MODE" low="12" high="13" type="adreno_rb_dither_mode"/>
+		<bitfield name="DITHER_TYPE" low="14" high="15" type="a2xx_rb_dither_type"/>
+		<bitfield name="PIXEL_FOG" pos="16" type="boolean"/>
+		<bitfield name="ALPHA_TO_MASK_OFFSET0" low="24" high="25" type="uint"/>
+		<bitfield name="ALPHA_TO_MASK_OFFSET1" low="26" high="27" type="uint"/>
+		<bitfield name="ALPHA_TO_MASK_OFFSET2" low="28" high="29" type="uint"/>
+		<bitfield name="ALPHA_TO_MASK_OFFSET3" low="30" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2203" name="VGT_CURRENT_BIN_ID_MAX" type="a2xx_vgt_current_bin_id_min_max"/>
+	<reg32 offset="0x2204" name="PA_CL_CLIP_CNTL">
+		<bitfield name="CLIP_DISABLE" pos="16" type="boolean"/>
+		<bitfield name="BOUNDARY_EDGE_FLAG_ENA" pos="18" type="boolean"/>
+		<bitfield name="DX_CLIP_SPACE_DEF" pos="19" type="a2xx_dx_clip_space"/>
+		<bitfield name="DIS_CLIP_ERR_DETECT" pos="20" type="boolean"/>
+		<bitfield name="VTX_KILL_OR" pos="21" type="boolean"/>
+		<bitfield name="XY_NAN_RETAIN" pos="22" type="boolean"/>
+		<bitfield name="Z_NAN_RETAIN" pos="23" type="boolean"/>
+		<bitfield name="W_NAN_RETAIN" pos="24" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2205" name="PA_SU_SC_MODE_CNTL">
+		<bitfield name="CULL_FRONT" pos="0" type="boolean"/>
+		<bitfield name="CULL_BACK" pos="1" type="boolean"/>
+		<bitfield name="FACE" pos="2" type="boolean"/>
+		<bitfield name="POLYMODE" low="3" high="4" type="a2xx_pa_su_sc_polymode"/>
+		<bitfield name="FRONT_PTYPE" low="5" high="7" type="adreno_pa_su_sc_draw"/>
+		<bitfield name="BACK_PTYPE" low="8" high="10" type="adreno_pa_su_sc_draw"/>
+		<bitfield name="POLY_OFFSET_FRONT_ENABLE" pos="11" type="boolean"/>
+		<bitfield name="POLY_OFFSET_BACK_ENABLE" pos="12" type="boolean"/>
+		<bitfield name="POLY_OFFSET_PARA_ENABLE" pos="13" type="boolean"/>
+		<bitfield name="MSAA_ENABLE" pos="15" type="boolean"/>
+		<bitfield name="VTX_WINDOW_OFFSET_ENABLE" pos="16" type="boolean"/>
+		<bitfield name="LINE_STIPPLE_ENABLE" pos="18" type="boolean"/>
+		<bitfield name="PROVOKING_VTX_LAST" pos="19" type="boolean"/>
+		<bitfield name="PERSP_CORR_DIS" pos="20" type="boolean"/>
+		<bitfield name="MULTI_PRIM_IB_ENA" pos="21" type="boolean"/>
+		<bitfield name="QUAD_ORDER_ENABLE" pos="23" type="boolean"/>
+		<bitfield name="WAIT_RB_IDLE_ALL_TRI" pos="25" type="boolean"/>
+		<bitfield name="WAIT_RB_IDLE_FIRST_TRI_NEW_STATE" pos="26" type="boolean"/>
+		<bitfield name="CLAMPED_FACENESS" pos="28" type="boolean"/>
+		<bitfield name="ZERO_AREA_FACENESS" pos="29" type="boolean"/>
+		<bitfield name="FACE_KILL_ENABLE" pos="30" type="boolean"/>
+		<bitfield name="FACE_WRITE_ENABLE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2206" name="PA_CL_VTE_CNTL">
+		<bitfield name="VPORT_X_SCALE_ENA" pos="0" type="boolean"/>
+		<bitfield name="VPORT_X_OFFSET_ENA" pos="1" type="boolean"/>
+		<bitfield name="VPORT_Y_SCALE_ENA" pos="2" type="boolean"/>
+		<bitfield name="VPORT_Y_OFFSET_ENA" pos="3" type="boolean"/>
+		<bitfield name="VPORT_Z_SCALE_ENA" pos="4" type="boolean"/>
+		<bitfield name="VPORT_Z_OFFSET_ENA" pos="5" type="boolean"/>
+		<bitfield name="VTX_XY_FMT" pos="8" type="boolean"/>
+		<bitfield name="VTX_Z_FMT" pos="9" type="boolean"/>
+		<bitfield name="VTX_W0_FMT" pos="10" type="boolean"/>
+		<bitfield name="PERFCOUNTER_REF" pos="11" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2207" name="VGT_CURRENT_BIN_ID_MIN" type="a2xx_vgt_current_bin_id_min_max"/>
+	<reg32 offset="0x2208" name="RB_MODECONTROL">
+		<bitfield name="EDRAM_MODE" low="0" high="2" type="a2xx_rb_edram_mode"/>
+	</reg32>
+	<reg32 offset="0x2209" name="A220_RB_LRZ_VSC_CONTROL"/>
+	<reg32 offset="0x220a" name="RB_SAMPLE_POS"/>
+	<reg32 offset="0x220b" name="CLEAR_COLOR">
+		<bitfield name="RED" low="0" high="7"/>
+		<bitfield name="GREEN" low="8" high="15"/>
+		<bitfield name="BLUE" low="16" high="23"/>
+		<bitfield name="ALPHA" low="24" high="31"/>
+	</reg32>
+	<reg32 offset="0x2210" name="A220_GRAS_CONTROL"/>
+	<reg32 offset="0x2280" name="PA_SU_POINT_SIZE">
+		<bitfield name="HEIGHT" low="0" high="15" type="ufixed" radix="4"/>
+		<bitfield name="WIDTH" low="16" high="31" type="ufixed" radix="4"/>
+	</reg32>
+	<reg32 offset="0x2281" name="PA_SU_POINT_MINMAX">
+		<bitfield name="MIN" low="0" high="15" type="ufixed" radix="4"/>
+		<bitfield name="MAX" low="16" high="31" type="ufixed" radix="4"/>
+	</reg32>
+	<reg32 offset="0x2282" name="PA_SU_LINE_CNTL">
+		<bitfield name="WIDTH" low="0" high="15" type="ufixed" radix="4"/>
+	</reg32>
+	<reg32 offset="0x2283" name="PA_SC_LINE_STIPPLE">
+		<bitfield name="LINE_PATTERN" low="0" high="15" type="hex"/>
+		<bitfield name="REPEAT_COUNT" low="16" high="23" type="uint"/>
+		<bitfield name="PATTERN_BIT_ORDER" pos="28" type="a2xx_pa_sc_pattern_bit_order"/>
+		<bitfield name="AUTO_RESET_CNTL" low="29" high="30" type="a2xx_pa_sc_auto_reset_cntl"/>
+	</reg32>
+	<reg32 offset="0x2293" name="PA_SC_VIZ_QUERY">
+		<bitfield name="VIZ_QUERY_ENA" pos="0" type="boolean"/>
+		<bitfield name="VIZ_QUERY_ID" low="1" high="6" type="uint"/>
+		<bitfield name="KILL_PIX_POST_EARLY_Z" pos="8" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2294" name="VGT_ENHANCE"/>
+	<reg32 offset="0x2300" name="PA_SC_LINE_CNTL">
+		<bitfield name="BRES_CNTL" low="0" high="15" type="uint"/>
+		<bitfield name="USE_BRES_CNTL" pos="8" type="boolean"/>
+		<bitfield name="EXPAND_LINE_WIDTH" pos="9" type="boolean"/>
+		<bitfield name="LAST_PIXEL" pos="10" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2301" name="PA_SC_AA_CONFIG">
+		<bitfield name="MSAA_NUM_SAMPLES" low="0" high="2" type="uint"/>
+		<bitfield name="MAX_SAMPLE_DIST" low="13" high="16" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2302" name="PA_SU_VTX_CNTL">
+		<bitfield name="PIX_CENTER" pos="0" type="a2xx_pa_pixcenter"/>
+		<bitfield name="ROUND_MODE" low="1" high="2" type="a2xx_pa_roundmode"/>
+		<bitfield name="QUANT_MODE" low="7" high="9" type="a2xx_pa_quantmode"/>
+	</reg32>
+	<reg32 offset="0x2303" name="PA_CL_GB_VERT_CLIP_ADJ" type="float"/>
+	<reg32 offset="0x2304" name="PA_CL_GB_VERT_DISC_ADJ" type="float"/>
+	<reg32 offset="0x2305" name="PA_CL_GB_HORZ_CLIP_ADJ" type="float"/>
+	<reg32 offset="0x2306" name="PA_CL_GB_HORZ_DISC_ADJ" type="float"/>
+	<reg32 offset="0x2307" name="SQ_VS_CONST">
+		<bitfield name="BASE" low="0" high="8" type="uint"/>
+		<bitfield name="SIZE" low="12" high="20" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2308" name="SQ_PS_CONST">
+		<bitfield name="BASE" low="0" high="8" type="uint"/>
+		<bitfield name="SIZE" low="12" high="20" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2309" name="SQ_DEBUG_MISC_0"/>
+	<reg32 offset="0x230a" name="SQ_DEBUG_MISC_1"/>
+	<reg32 offset="0x2312" name="PA_SC_AA_MASK"/>
+	<reg32 offset="0x2316" name="VGT_VERTEX_REUSE_BLOCK_CNTL">
+		<bitfield name="VTX_REUSE_DEPTH" low="0" high="2" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2317" name="VGT_OUT_DEALLOC_CNTL">
+		<bitfield name="DEALLOC_DIST" low="0" high="1" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2318" name="RB_COPY_CONTROL">
+		<bitfield name="COPY_SAMPLE_SELECT" low="0" high="2" type="a2xx_rb_copy_sample_select"/>
+		<bitfield name="DEPTH_CLEAR_ENABLE" pos="3" type="boolean"/>
+		<bitfield name="CLEAR_MASK" low="4" high="7" type="hex"/>
+	</reg32>
+	<reg32 offset="0x2319" name="RB_COPY_DEST_BASE"/>
+	<reg32 offset="0x231a" name="RB_COPY_DEST_PITCH" shr="5" type="uint"/>
+	<reg32 offset="0x231b" name="RB_COPY_DEST_INFO">
+		<bitfield name="DEST_ENDIAN" low="0" high="2" type="adreno_rb_surface_endian"/>
+		<bitfield name="LINEAR" pos="3" type="boolean"/>
+		<bitfield name="FORMAT" low="4" high="7" type="a2xx_colorformatx"/>
+		<bitfield name="SWAP" low="8" high="9" type="uint"/>
+		<bitfield name="DITHER_MODE" low="10" high="11" type="adreno_rb_dither_mode"/>
+		<bitfield name="DITHER_TYPE" low="12" high="13" type="a2xx_rb_dither_type"/>
+		<bitfield name="WRITE_RED" pos="14" type="boolean"/>
+		<bitfield name="WRITE_GREEN" pos="15" type="boolean"/>
+		<bitfield name="WRITE_BLUE" pos="16" type="boolean"/>
+		<bitfield name="WRITE_ALPHA" pos="17" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x231c" name="RB_COPY_DEST_OFFSET">
+		<bitfield name="X" low="0" high="12" type="uint"/>
+		<bitfield name="Y" low="13" high="25" type="uint"/>
+	</reg32>
+	<reg32 offset="0x231d" name="RB_DEPTH_CLEAR"/>
+	<reg32 offset="0x2324" name="RB_SAMPLE_COUNT_CTL"/>
+	<reg32 offset="0x2326" name="RB_COLOR_DEST_MASK"/>
+	<reg32 offset="0x2340" name="A225_GRAS_UCP0X"/>
+	<reg32 offset="0x2357" name="A225_GRAS_UCP5W"/>
+	<reg32 offset="0x2360" name="A225_GRAS_UCP_ENABLED"/>
+	<reg32 offset="0x2380" name="PA_SU_POLY_OFFSET_FRONT_SCALE"/>
+	<reg32 offset="0x2381" name="PA_SU_POLY_OFFSET_FRONT_OFFSET"/>
+	<reg32 offset="0x2382" name="PA_SU_POLY_OFFSET_BACK_SCALE"/>
+	<reg32 offset="0x2383" name="PA_SU_POLY_OFFSET_BACK_OFFSET"/>
+	<reg32 offset="0x4000" name="SQ_CONSTANT_0"/>
+	<reg32 offset="0x4800" name="SQ_FETCH_0"/>
+	<reg32 offset="0x4900" name="SQ_CF_BOOLEANS"/>
+	<reg32 offset="0x4908" name="SQ_CF_LOOP"/>
+	<reg32 offset="0xa29" name="COHER_SIZE_PM4"/>
+	<reg32 offset="0xa2a" name="COHER_BASE_PM4"/>
+	<reg32 offset="0xa2b" name="COHER_STATUS_PM4"/>
+
+	<reg32 offset="0x0c88" name="PA_SU_PERFCOUNTER0_SELECT"/>
+	<reg32 offset="0x0c89" name="PA_SU_PERFCOUNTER1_SELECT"/>
+	<reg32 offset="0x0c8a" name="PA_SU_PERFCOUNTER2_SELECT"/>
+	<reg32 offset="0x0c8b" name="PA_SU_PERFCOUNTER3_SELECT"/>
+	<reg32 offset="0x0c8c" name="PA_SU_PERFCOUNTER0_LOW"/>
+	<reg32 offset="0x0c8d" name="PA_SU_PERFCOUNTER0_HI"/>
+	<reg32 offset="0x0c8e" name="PA_SU_PERFCOUNTER1_LOW"/>
+	<reg32 offset="0x0c8f" name="PA_SU_PERFCOUNTER1_HI"/>
+	<reg32 offset="0x0c90" name="PA_SU_PERFCOUNTER2_LOW"/>
+	<reg32 offset="0x0c91" name="PA_SU_PERFCOUNTER2_HI"/>
+	<reg32 offset="0x0c92" name="PA_SU_PERFCOUNTER3_LOW"/>
+	<reg32 offset="0x0c93" name="PA_SU_PERFCOUNTER3_HI"/>
+	<reg32 offset="0x0c98" name="PA_SC_PERFCOUNTER0_SELECT"/>
+	<reg32 offset="0x0c99" name="PA_SC_PERFCOUNTER0_LOW"/>
+	<reg32 offset="0x0c9a" name="PA_SC_PERFCOUNTER0_HI"/>
+	<reg32 offset="0x0c48" name="VGT_PERFCOUNTER0_SELECT"/>
+	<reg32 offset="0x0c49" name="VGT_PERFCOUNTER1_SELECT"/>
+	<reg32 offset="0x0c4a" name="VGT_PERFCOUNTER2_SELECT"/>
+	<reg32 offset="0x0c4b" name="VGT_PERFCOUNTER3_SELECT"/>
+	<reg32 offset="0x0c4c" name="VGT_PERFCOUNTER0_LOW"/>
+	<reg32 offset="0x0c4e" name="VGT_PERFCOUNTER1_LOW"/>
+	<reg32 offset="0x0c50" name="VGT_PERFCOUNTER2_LOW"/>
+	<reg32 offset="0x0c52" name="VGT_PERFCOUNTER3_LOW"/>
+	<reg32 offset="0x0c4d" name="VGT_PERFCOUNTER0_HI"/>
+	<reg32 offset="0x0c4f" name="VGT_PERFCOUNTER1_HI"/>
+	<reg32 offset="0x0c51" name="VGT_PERFCOUNTER2_HI"/>
+	<reg32 offset="0x0c53" name="VGT_PERFCOUNTER3_HI"/>
+	<reg32 offset="0x0e05" name="TCR_PERFCOUNTER0_SELECT"/>
+	<reg32 offset="0x0e08" name="TCR_PERFCOUNTER1_SELECT"/>
+	<reg32 offset="0x0e06" name="TCR_PERFCOUNTER0_HI"/>
+	<reg32 offset="0x0e09" name="TCR_PERFCOUNTER1_HI"/>
+	<reg32 offset="0x0e07" name="TCR_PERFCOUNTER0_LOW"/>
+	<reg32 offset="0x0e0a" name="TCR_PERFCOUNTER1_LOW"/>
+	<reg32 offset="0x0e1f" name="TP0_PERFCOUNTER0_SELECT"/>
+	<reg32 offset="0x0e20" name="TP0_PERFCOUNTER0_HI"/>
+	<reg32 offset="0x0e21" name="TP0_PERFCOUNTER0_LOW"/>
+	<reg32 offset="0x0e22" name="TP0_PERFCOUNTER1_SELECT"/>
+	<reg32 offset="0x0e23" name="TP0_PERFCOUNTER1_HI"/>
+	<reg32 offset="0x0e24" name="TP0_PERFCOUNTER1_LOW"/>
+	<reg32 offset="0x0e54" name="TCM_PERFCOUNTER0_SELECT"/>
+	<reg32 offset="0x0e57" name="TCM_PERFCOUNTER1_SELECT"/>
+	<reg32 offset="0x0e55" name="TCM_PERFCOUNTER0_HI"/>
+	<reg32 offset="0x0e58" name="TCM_PERFCOUNTER1_HI"/>
+	<reg32 offset="0x0e56" name="TCM_PERFCOUNTER0_LOW"/>
+	<reg32 offset="0x0e59" name="TCM_PERFCOUNTER1_LOW"/>
+	<reg32 offset="0x0e5a" name="TCF_PERFCOUNTER0_SELECT"/>
+	<reg32 offset="0x0e5d" name="TCF_PERFCOUNTER1_SELECT"/>
+	<reg32 offset="0x0e60" name="TCF_PERFCOUNTER2_SELECT"/>
+	<reg32 offset="0x0e63" name="TCF_PERFCOUNTER3_SELECT"/>
+	<reg32 offset="0x0e66" name="TCF_PERFCOUNTER4_SELECT"/>
+	<reg32 offset="0x0e69" name="TCF_PERFCOUNTER5_SELECT"/>
+	<reg32 offset="0x0e6c" name="TCF_PERFCOUNTER6_SELECT"/>
+	<reg32 offset="0x0e6f" name="TCF_PERFCOUNTER7_SELECT"/>
+	<reg32 offset="0x0e72" name="TCF_PERFCOUNTER8_SELECT"/>
+	<reg32 offset="0x0e75" name="TCF_PERFCOUNTER9_SELECT"/>
+	<reg32 offset="0x0e78" name="TCF_PERFCOUNTER10_SELECT"/>
+	<reg32 offset="0x0e7b" name="TCF_PERFCOUNTER11_SELECT"/>
+	<reg32 offset="0x0e5b" name="TCF_PERFCOUNTER0_HI"/>
+	<reg32 offset="0x0e5e" name="TCF_PERFCOUNTER1_HI"/>
+	<reg32 offset="0x0e61" name="TCF_PERFCOUNTER2_HI"/>
+	<reg32 offset="0x0e64" name="TCF_PERFCOUNTER3_HI"/>
+	<reg32 offset="0x0e67" name="TCF_PERFCOUNTER4_HI"/>
+	<reg32 offset="0x0e6a" name="TCF_PERFCOUNTER5_HI"/>
+	<reg32 offset="0x0e6d" name="TCF_PERFCOUNTER6_HI"/>
+	<reg32 offset="0x0e70" name="TCF_PERFCOUNTER7_HI"/>
+	<reg32 offset="0x0e73" name="TCF_PERFCOUNTER8_HI"/>
+	<reg32 offset="0x0e76" name="TCF_PERFCOUNTER9_HI"/>
+	<reg32 offset="0x0e79" name="TCF_PERFCOUNTER10_HI"/>
+	<reg32 offset="0x0e7c" name="TCF_PERFCOUNTER11_HI"/>
+	<reg32 offset="0x0e5c" name="TCF_PERFCOUNTER0_LOW"/>
+	<reg32 offset="0x0e5f" name="TCF_PERFCOUNTER1_LOW"/>
+	<reg32 offset="0x0e62" name="TCF_PERFCOUNTER2_LOW"/>
+	<reg32 offset="0x0e65" name="TCF_PERFCOUNTER3_LOW"/>
+	<reg32 offset="0x0e68" name="TCF_PERFCOUNTER4_LOW"/>
+	<reg32 offset="0x0e6b" name="TCF_PERFCOUNTER5_LOW"/>
+	<reg32 offset="0x0e6e" name="TCF_PERFCOUNTER6_LOW"/>
+	<reg32 offset="0x0e71" name="TCF_PERFCOUNTER7_LOW"/>
+	<reg32 offset="0x0e74" name="TCF_PERFCOUNTER8_LOW"/>
+	<reg32 offset="0x0e77" name="TCF_PERFCOUNTER9_LOW"/>
+	<reg32 offset="0x0e7a" name="TCF_PERFCOUNTER10_LOW"/>
+	<reg32 offset="0x0e7d" name="TCF_PERFCOUNTER11_LOW"/>
+	<reg32 offset="0x0dc8" name="SQ_PERFCOUNTER0_SELECT"/>
+	<reg32 offset="0x0dc9" name="SQ_PERFCOUNTER1_SELECT"/>
+	<reg32 offset="0x0dca" name="SQ_PERFCOUNTER2_SELECT"/>
+	<reg32 offset="0x0dcb" name="SQ_PERFCOUNTER3_SELECT"/>
+	<reg32 offset="0x0dcc" name="SQ_PERFCOUNTER0_LOW"/>
+	<reg32 offset="0x0dcd" name="SQ_PERFCOUNTER0_HI"/>
+	<reg32 offset="0x0dce" name="SQ_PERFCOUNTER1_LOW"/>
+	<reg32 offset="0x0dcf" name="SQ_PERFCOUNTER1_HI"/>
+	<reg32 offset="0x0dd0" name="SQ_PERFCOUNTER2_LOW"/>
+	<reg32 offset="0x0dd1" name="SQ_PERFCOUNTER2_HI"/>
+	<reg32 offset="0x0dd2" name="SQ_PERFCOUNTER3_LOW"/>
+	<reg32 offset="0x0dd3" name="SQ_PERFCOUNTER3_HI"/>
+	<reg32 offset="0x0dd4" name="SX_PERFCOUNTER0_SELECT"/>
+	<reg32 offset="0x0dd8" name="SX_PERFCOUNTER0_LOW"/>
+	<reg32 offset="0x0dd9" name="SX_PERFCOUNTER0_HI"/>
+	<reg32 offset="0x0a46" name="MH_PERFCOUNTER0_SELECT"/>
+	<reg32 offset="0x0a4a" name="MH_PERFCOUNTER1_SELECT"/>
+	<reg32 offset="0x0a47" name="MH_PERFCOUNTER0_CONFIG"/>
+	<reg32 offset="0x0a4b" name="MH_PERFCOUNTER1_CONFIG"/>
+	<reg32 offset="0x0a48" name="MH_PERFCOUNTER0_LOW"/>
+	<reg32 offset="0x0a4c" name="MH_PERFCOUNTER1_LOW"/>
+	<reg32 offset="0x0a49" name="MH_PERFCOUNTER0_HI"/>
+	<reg32 offset="0x0a4d" name="MH_PERFCOUNTER1_HI"/>
+	<reg32 offset="0x0f04" name="RB_PERFCOUNTER0_SELECT"/>
+	<reg32 offset="0x0f05" name="RB_PERFCOUNTER1_SELECT"/>
+	<reg32 offset="0x0f06" name="RB_PERFCOUNTER2_SELECT"/>
+	<reg32 offset="0x0f07" name="RB_PERFCOUNTER3_SELECT"/>
+	<reg32 offset="0x0f08" name="RB_PERFCOUNTER0_LOW"/>
+	<reg32 offset="0x0f09" name="RB_PERFCOUNTER0_HI"/>
+	<reg32 offset="0x0f0a" name="RB_PERFCOUNTER1_LOW"/>
+	<reg32 offset="0x0f0b" name="RB_PERFCOUNTER1_HI"/>
+	<reg32 offset="0x0f0c" name="RB_PERFCOUNTER2_LOW"/>
+	<reg32 offset="0x0f0d" name="RB_PERFCOUNTER2_HI"/>
+	<reg32 offset="0x0f0e" name="RB_PERFCOUNTER3_LOW"/>
+	<reg32 offset="0x0f0f" name="RB_PERFCOUNTER3_HI"/>
+</domain>
+
+<domain name="A2XX_SQ_TEX" width="32">
+	<doc>Texture state dwords</doc>
+	<enum name="sq_tex_clamp">
+		<value name="SQ_TEX_WRAP" value="0"/>
+		<value name="SQ_TEX_MIRROR" value="1"/>
+		<value name="SQ_TEX_CLAMP_LAST_TEXEL" value="2"/>
+		<value name="SQ_TEX_MIRROR_ONCE_LAST_TEXEL" value="3"/>
+		<value name="SQ_TEX_CLAMP_HALF_BORDER" value="4"/>
+		<value name="SQ_TEX_MIRROR_ONCE_HALF_BORDER" value="5"/>
+		<value name="SQ_TEX_CLAMP_BORDER" value="6"/>
+		<value name="SQ_TEX_MIRROR_ONCE_BORDER" value="7"/>
+	</enum>
+	<enum name="sq_tex_swiz">
+		<value name="SQ_TEX_X" value="0"/>
+		<value name="SQ_TEX_Y" value="1"/>
+		<value name="SQ_TEX_Z" value="2"/>
+		<value name="SQ_TEX_W" value="3"/>
+		<value name="SQ_TEX_ZERO" value="4"/>
+		<value name="SQ_TEX_ONE" value="5"/>
+	</enum>
+	<enum name="sq_tex_filter">
+		<value name="SQ_TEX_FILTER_POINT" value="0"/>
+		<value name="SQ_TEX_FILTER_BILINEAR" value="1"/>
+		<value name="SQ_TEX_FILTER_BASEMAP" value="2"/>
+		<value name="SQ_TEX_FILTER_USE_FETCH_CONST" value="3"/>
+	</enum>
+	<enum name="sq_tex_aniso_filter">
+		<value name="SQ_TEX_ANISO_FILTER_DISABLED" value="0"/>
+		<value name="SQ_TEX_ANISO_FILTER_MAX_1_1" value="1"/>
+		<value name="SQ_TEX_ANISO_FILTER_MAX_2_1" value="2"/>
+		<value name="SQ_TEX_ANISO_FILTER_MAX_4_1" value="3"/>
+		<value name="SQ_TEX_ANISO_FILTER_MAX_8_1" value="4"/>
+		<value name="SQ_TEX_ANISO_FILTER_MAX_16_1" value="5"/>
+		<value name="SQ_TEX_ANISO_FILTER_USE_FETCH_CONST" value="7"/>
+	</enum>
+	<enum name="sq_tex_dimension">
+		<value name="SQ_TEX_DIMENSION_1D" value="0"/>
+		<value name="SQ_TEX_DIMENSION_2D" value="1"/>
+		<value name="SQ_TEX_DIMENSION_3D" value="2"/>
+		<value name="SQ_TEX_DIMENSION_CUBE" value="3"/>
+	</enum>
+	<enum name="sq_tex_border_color">
+		<value name="SQ_TEX_BORDER_COLOR_BLACK" value="0"/>
+		<value name="SQ_TEX_BORDER_COLOR_WHITE" value="1"/>
+		<value name="SQ_TEX_BORDER_COLOR_ACBYCR_BLACK" value="2"/>
+		<value name="SQ_TEX_BORDER_COLOR_ACBCRY_BLACK" value="3"/>
+	</enum>
+	<enum name="sq_tex_sign">
+		<value name="SQ_TEX_SIGN_UNSIGNED" value="0"/>
+		<value name="SQ_TEX_SIGN_SIGNED" value="1"/>
+		<!-- biased: 2*color-1 (range -1,1 when sampling) -->
+		<value name="SQ_TEX_SIGN_UNSIGNED_BIASED" value="2"/>
+		<!-- gamma: sRGB to linear - doesn't seem to work on adreno? -->
+		<value name="SQ_TEX_SIGN_GAMMA" value="3"/>
+	</enum>
+	<enum name="sq_tex_endian">
+		<value name="SQ_TEX_ENDIAN_NONE" value="0"/>
+		<value name="SQ_TEX_ENDIAN_8IN16" value="1"/>
+		<value name="SQ_TEX_ENDIAN_8IN32" value="2"/>
+		<value name="SQ_TEX_ENDIAN_16IN32" value="3"/>
+	</enum>
+	<enum name="sq_tex_clamp_policy">
+		<value name="SQ_TEX_CLAMP_POLICY_D3D" value="0"/>
+		<value name="SQ_TEX_CLAMP_POLICY_OGL" value="1"/>
+	</enum>
+	<enum name="sq_tex_num_format">
+		<value name="SQ_TEX_NUM_FORMAT_FRAC" value="0"/>
+		<value name="SQ_TEX_NUM_FORMAT_INT" value="1"/>
+	</enum>
+	<enum name="sq_tex_type">
+		<value name="SQ_TEX_TYPE_0" value="0"/>
+		<value name="SQ_TEX_TYPE_1" value="1"/>
+		<value name="SQ_TEX_TYPE_2" value="2"/>
+		<value name="SQ_TEX_TYPE_3" value="3"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="TYPE" low="0" high="1" type="sq_tex_type"/>
+		<bitfield name="SIGN_X" low="2" high="3" type="sq_tex_sign"/>
+		<bitfield name="SIGN_Y" low="4" high="5" type="sq_tex_sign"/>
+		<bitfield name="SIGN_Z" low="6" high="7" type="sq_tex_sign"/>
+		<bitfield name="SIGN_W" low="8" high="9" type="sq_tex_sign"/>
+		<bitfield name="CLAMP_X" low="10" high="12" type="sq_tex_clamp"/>
+		<bitfield name="CLAMP_Y" low="13" high="15" type="sq_tex_clamp"/>
+		<bitfield name="CLAMP_Z" low="16" high="18" type="sq_tex_clamp"/>
+		<bitfield name="PITCH" low="22" high="30" shr="5" type="uint"/>
+		<bitfield name="TILED" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="FORMAT" low="0" high="5" type="a2xx_sq_surfaceformat"/>
+		<bitfield name="ENDIANNESS" low="6" high="7" type="sq_tex_endian"/>
+		<bitfield name="REQUEST_SIZE" low="8" high="9" type="uint"/>
+		<bitfield name="STACKED" pos="10" type="boolean"/>
+		<bitfield name="CLAMP_POLICY" pos="11" type="sq_tex_clamp_policy"/>
+		<bitfield name="BASE_ADDRESS" low="12" high="31" type="uint" shr="12"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="WIDTH" low="0" high="12" type="uint"/>
+		<bitfield name="HEIGHT" low="13" high="25" type="uint"/>
+		<bitfield name="DEPTH" low="26" high="31" type="uint"/>
+		<!-- 1d/3d have different bit configurations -->
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="NUM_FORMAT" pos="0" type="sq_tex_num_format"/>
+		<bitfield name="SWIZ_X" low="1" high="3" type="sq_tex_swiz"/>
+		<bitfield name="SWIZ_Y" low="4" high="6" type="sq_tex_swiz"/>
+		<bitfield name="SWIZ_Z" low="7" high="9" type="sq_tex_swiz"/>
+		<bitfield name="SWIZ_W" low="10" high="12" type="sq_tex_swiz"/>
+		<bitfield name="EXP_ADJUST" low="13" high="18" type="int"/>
+		<bitfield name="XY_MAG_FILTER" low="19" high="20" type="sq_tex_filter"/>
+		<bitfield name="XY_MIN_FILTER" low="21" high="22" type="sq_tex_filter"/>
+		<bitfield name="MIP_FILTER" low="23" high="24" type="sq_tex_filter"/>
+		<bitfield name="ANISO_FILTER" low="25" high="27" type="sq_tex_aniso_filter"/>
+		<bitfield name="BORDER_SIZE" pos="31" type="uint"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<bitfield name="VOL_MAG_FILTER" pos="0" type="sq_tex_filter"/>
+		<bitfield name="VOL_MIN_FILTER" pos="1" type="sq_tex_filter"/>
+		<bitfield name="MIP_MIN_LEVEL" low="2" high="5" type="uint"/>
+		<bitfield name="MIP_MAX_LEVEL" low="6" high="9" type="uint"/>
+		<bitfield name="MAX_ANISO_WALK" pos="10" type="boolean"/>
+		<bitfield name="MIN_ANISO_WALK" pos="11" type="boolean"/>
+		<bitfield name="LOD_BIAS" low="12" high="21" type="fixed" radix="5"/>
+		<bitfield name="GRAD_EXP_ADJUST_H" low="22" high="26" type="uint"/>
+		<bitfield name="GRAD_EXP_ADJUST_V" low="27" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="5" name="5">
+		<bitfield name="BORDER_COLOR" low="0" high="1" type="sq_tex_border_color"/>
+		<bitfield name="FORCE_BCW_MAX" pos="2" type="boolean"/>
+		<bitfield name="TRI_CLAMP" low="3" high="4" type="uint"/>
+		<bitfield name="ANISO_BIAS" low="5" high="8" type="fixed" radix="0"/> <!-- radix unknown -->
+		<bitfield name="DIMENSION" low="9" high="10" type="sq_tex_dimension"/>
+		<bitfield name="PACKED_MIPS" pos="11" type="boolean"/>
+		<bitfield name="MIP_ADDRESS" low="12" high="31" type="uint" shr="12"/>
+	</reg32>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/adreno/a3xx.xml b/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
new file mode 100644
index 000000000000..6717abc0a897
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
@@ -0,0 +1,1751 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+<import file="adreno/adreno_common.xml"/>
+<import file="adreno/adreno_pm4.xml"/>
+
+<enum name="a3xx_tile_mode">
+	<value name="LINEAR" value="0"/>
+	<value name="TILE_4X4" value="1"/>    <!-- "normal" case for textures -->
+	<value name="TILE_32X32" value="2"/>  <!-- only used in GMEM -->
+	<value name="TILE_4X2" value="3"/>    <!-- only used for CrCb -->
+</enum>
+
+<enum name="a3xx_state_block_id">
+	<value name="HLSQ_BLOCK_ID_TP_TEX" value="2"/>
+	<value name="HLSQ_BLOCK_ID_TP_MIPMAP" value="3"/>
+	<value name="HLSQ_BLOCK_ID_SP_VS" value="4"/>
+	<value name="HLSQ_BLOCK_ID_SP_FS" value="6"/>
+</enum>
+
+<enum name="a3xx_cache_opcode">
+	<value name="INVALIDATE" value="1"/>
+</enum>
+
+<enum name="a3xx_vtx_fmt">
+	<value name="VFMT_32_FLOAT" value="0x0"/>
+	<value name="VFMT_32_32_FLOAT" value="0x1"/>
+	<value name="VFMT_32_32_32_FLOAT" value="0x2"/>
+	<value name="VFMT_32_32_32_32_FLOAT" value="0x3"/>
+
+	<value name="VFMT_16_FLOAT" value="0x4"/>
+	<value name="VFMT_16_16_FLOAT" value="0x5"/>
+	<value name="VFMT_16_16_16_FLOAT" value="0x6"/>
+	<value name="VFMT_16_16_16_16_FLOAT" value="0x7"/>
+
+	<value name="VFMT_32_FIXED" value="0x8"/>
+	<value name="VFMT_32_32_FIXED" value="0x9"/>
+	<value name="VFMT_32_32_32_FIXED" value="0xa"/>
+	<value name="VFMT_32_32_32_32_FIXED" value="0xb"/>
+
+	<value name="VFMT_16_SINT" value="0x10"/>
+	<value name="VFMT_16_16_SINT" value="0x11"/>
+	<value name="VFMT_16_16_16_SINT" value="0x12"/>
+	<value name="VFMT_16_16_16_16_SINT" value="0x13"/>
+	<value name="VFMT_16_UINT" value="0x14"/>
+	<value name="VFMT_16_16_UINT" value="0x15"/>
+	<value name="VFMT_16_16_16_UINT" value="0x16"/>
+	<value name="VFMT_16_16_16_16_UINT" value="0x17"/>
+	<value name="VFMT_16_SNORM" value="0x18"/>
+	<value name="VFMT_16_16_SNORM" value="0x19"/>
+	<value name="VFMT_16_16_16_SNORM" value="0x1a"/>
+	<value name="VFMT_16_16_16_16_SNORM" value="0x1b"/>
+	<value name="VFMT_16_UNORM" value="0x1c"/>
+	<value name="VFMT_16_16_UNORM" value="0x1d"/>
+	<value name="VFMT_16_16_16_UNORM" value="0x1e"/>
+	<value name="VFMT_16_16_16_16_UNORM" value="0x1f"/>
+
+	<!-- seems to be no NORM variants for 32bit.. -->
+	<value name="VFMT_32_UINT" value="0x20"/>
+	<value name="VFMT_32_32_UINT" value="0x21"/>
+	<value name="VFMT_32_32_32_UINT" value="0x22"/>
+	<value name="VFMT_32_32_32_32_UINT" value="0x23"/>
+	<value name="VFMT_32_SINT" value="0x24"/>
+	<value name="VFMT_32_32_SINT" value="0x25"/>
+	<value name="VFMT_32_32_32_SINT" value="0x26"/>
+	<value name="VFMT_32_32_32_32_SINT" value="0x27"/>
+
+	<value name="VFMT_8_UINT" value="0x28"/>
+	<value name="VFMT_8_8_UINT" value="0x29"/>
+	<value name="VFMT_8_8_8_UINT" value="0x2a"/>
+	<value name="VFMT_8_8_8_8_UINT" value="0x2b"/>
+	<value name="VFMT_8_UNORM" value="0x2c"/>
+	<value name="VFMT_8_8_UNORM" value="0x2d"/>
+	<value name="VFMT_8_8_8_UNORM" value="0x2e"/>
+	<value name="VFMT_8_8_8_8_UNORM" value="0x2f"/>
+	<value name="VFMT_8_SINT" value="0x30"/>
+	<value name="VFMT_8_8_SINT" value="0x31"/>
+	<value name="VFMT_8_8_8_SINT" value="0x32"/>
+	<value name="VFMT_8_8_8_8_SINT" value="0x33"/>
+	<value name="VFMT_8_SNORM" value="0x34"/>
+	<value name="VFMT_8_8_SNORM" value="0x35"/>
+	<value name="VFMT_8_8_8_SNORM" value="0x36"/>
+	<value name="VFMT_8_8_8_8_SNORM" value="0x37"/>
+	<value name="VFMT_10_10_10_2_UINT" value="0x38"/>
+	<value name="VFMT_10_10_10_2_UNORM" value="0x39"/>
+	<value name="VFMT_10_10_10_2_SINT" value="0x3a"/>
+	<value name="VFMT_10_10_10_2_SNORM" value="0x3b"/>
+	<value name="VFMT_2_10_10_10_UINT" value="0x3c"/>
+	<value name="VFMT_2_10_10_10_UNORM" value="0x3d"/>
+	<value name="VFMT_2_10_10_10_SINT" value="0x3e"/>
+	<value name="VFMT_2_10_10_10_SNORM" value="0x3f"/>
+
+	<value name="VFMT_NONE" value="0xff"/>
+</enum>
+
+<enum name="a3xx_tex_fmt">
+	<value name="TFMT_5_6_5_UNORM" value="0x4"/>
+	<value name="TFMT_5_5_5_1_UNORM" value="0x5"/>
+	<value name="TFMT_4_4_4_4_UNORM" value="0x7"/>
+	<value name="TFMT_Z16_UNORM" value="0x9"/>
+	<value name="TFMT_X8Z24_UNORM" value="0xa"/>
+	<value name="TFMT_Z32_FLOAT" value="0xb"/>
+
+	<!--
+		The NV12 tiled/linear formats seem to require gang'd sampler
+		slots (ie. sampler state N plus N+1) for Y and UV planes.
+		They fetch yuv in single sam instruction, but still require
+		colorspace conversion in the shader.
+	 -->
+	<value name="TFMT_UV_64X32" value="0x10"/>
+	<value name="TFMT_VU_64X32" value="0x11"/>
+	<value name="TFMT_Y_64X32" value="0x12"/>
+	<value name="TFMT_NV12_64X32" value="0x13"/>
+	<value name="TFMT_UV_LINEAR" value="0x14"/>
+	<value name="TFMT_VU_LINEAR" value="0x15"/>
+	<value name="TFMT_Y_LINEAR" value="0x16"/>
+	<value name="TFMT_NV12_LINEAR" value="0x17"/>
+	<value name="TFMT_I420_Y" value="0x18"/>
+	<value name="TFMT_I420_U" value="0x1a"/>
+	<value name="TFMT_I420_V" value="0x1b"/>
+
+	<value name="TFMT_ATC_RGB" value="0x20"/>
+	<value name="TFMT_ATC_RGBA_EXPLICIT" value="0x21"/>
+	<value name="TFMT_ETC1" value="0x22"/>
+	<value name="TFMT_ATC_RGBA_INTERPOLATED" value="0x23"/>
+
+	<value name="TFMT_DXT1" value="0x24"/>
+	<value name="TFMT_DXT3" value="0x25"/>
+	<value name="TFMT_DXT5" value="0x26"/>
+
+	<value name="TFMT_2_10_10_10_UNORM" value="0x28"/>
+	<value name="TFMT_10_10_10_2_UNORM" value="0x29"/>
+	<value name="TFMT_9_9_9_E5_FLOAT" value="0x2a"/>
+	<value name="TFMT_11_11_10_FLOAT" value="0x2b"/>
+	<value name="TFMT_A8_UNORM" value="0x2c"/>    <!-- GL_ALPHA -->
+	<value name="TFMT_L8_UNORM" value="0x2d"/>
+	<value name="TFMT_L8_A8_UNORM" value="0x2f"/> <!-- GL_LUMINANCE_ALPHA -->
+
+	<!--
+		NOTE: GL_ALPHA and GL_LUMINANCE_ALPHA aren't handled in a similar way
+		to float16, float32.. but they seem to use non-standard swizzle too..
+		perhaps we can ditch that if the pattern follows of 0xn0, 0xn1, 0xn2,
+		0xn3 for 1, 2, 3, 4 components respectively..
+
+		Only formats filled in below are the ones that have been observed by
+		the blob or tested.. you can guess what the missing ones are..
+	 -->
+
+	<value name="TFMT_8_UNORM" value="0x30"/>     <!-- GL_LUMINANCE -->
+	<value name="TFMT_8_8_UNORM" value="0x31"/>
+	<value name="TFMT_8_8_8_UNORM" value="0x32"/>
+	<value name="TFMT_8_8_8_8_UNORM" value="0x33"/>
+
+	<value name="TFMT_8_SNORM" value="0x34"/>
+	<value name="TFMT_8_8_SNORM" value="0x35"/>
+	<value name="TFMT_8_8_8_SNORM" value="0x36"/>
+	<value name="TFMT_8_8_8_8_SNORM" value="0x37"/>
+
+	<value name="TFMT_8_UINT" value="0x38"/>
+	<value name="TFMT_8_8_UINT" value="0x39"/>
+	<value name="TFMT_8_8_8_UINT" value="0x3a"/>
+	<value name="TFMT_8_8_8_8_UINT" value="0x3b"/>
+
+	<value name="TFMT_8_SINT" value="0x3c"/>
+	<value name="TFMT_8_8_SINT" value="0x3d"/>
+	<value name="TFMT_8_8_8_SINT" value="0x3e"/>
+	<value name="TFMT_8_8_8_8_SINT" value="0x3f"/>
+
+	<value name="TFMT_16_FLOAT" value="0x40"/>
+	<value name="TFMT_16_16_FLOAT" value="0x41"/>
+	<!-- TFMT_FLOAT_16_16_16 -->
+	<value name="TFMT_16_16_16_16_FLOAT" value="0x43"/>
+
+	<value name="TFMT_16_UINT" value="0x44"/>
+	<value name="TFMT_16_16_UINT" value="0x45"/>
+	<value name="TFMT_16_16_16_16_UINT" value="0x47"/>
+
+	<value name="TFMT_16_SINT" value="0x48"/>
+	<value name="TFMT_16_16_SINT" value="0x49"/>
+	<value name="TFMT_16_16_16_16_SINT" value="0x4b"/>
+
+	<value name="TFMT_16_UNORM" value="0x4c"/>
+	<value name="TFMT_16_16_UNORM" value="0x4d"/>
+	<value name="TFMT_16_16_16_16_UNORM" value="0x4f"/>
+
+	<value name="TFMT_16_SNORM" value="0x50"/>
+	<value name="TFMT_16_16_SNORM" value="0x51"/>
+	<value name="TFMT_16_16_16_16_SNORM" value="0x53"/>
+
+	<value name="TFMT_32_FLOAT" value="0x54"/>
+	<value name="TFMT_32_32_FLOAT" value="0x55"/>
+	<!-- TFMT_32_32_32_FLOAT -->
+	<value name="TFMT_32_32_32_32_FLOAT" value="0x57"/>
+
+	<value name="TFMT_32_UINT" value="0x58"/>
+	<value name="TFMT_32_32_UINT" value="0x59"/>
+	<value name="TFMT_32_32_32_32_UINT" value="0x5b"/>
+
+	<value name="TFMT_32_SINT" value="0x5c"/>
+	<value name="TFMT_32_32_SINT" value="0x5d"/>
+	<value name="TFMT_32_32_32_32_SINT" value="0x5f"/>
+
+	<value name="TFMT_2_10_10_10_UINT" value="0x60"/>
+	<value name="TFMT_10_10_10_2_UINT" value="0x61"/>
+
+	<value name="TFMT_ETC2_RG11_SNORM" value="0x70"/>
+	<value name="TFMT_ETC2_RG11_UNORM" value="0x71"/>
+	<value name="TFMT_ETC2_R11_SNORM" value="0x72"/>
+	<value name="TFMT_ETC2_R11_UNORM" value="0x73"/>
+	<value name="TFMT_ETC2_RGBA8" value="0x74"/>
+	<value name="TFMT_ETC2_RGB8A1" value="0x75"/>
+	<value name="TFMT_ETC2_RGB8" value="0x76"/>
+
+	<value name="TFMT_NONE" value="0xff"/>
+</enum>
+
+<enum name="a3xx_color_fmt">
+	<value name="RB_R5G6B5_UNORM"       value="0x00"/>
+	<value name="RB_R5G5B5A1_UNORM"     value="0x01"/>
+	<value name="RB_R4G4B4A4_UNORM"     value="0x03"/>
+	<value name="RB_R8G8B8_UNORM"	    value="0x04"/>
+	<value name="RB_R8G8B8A8_UNORM"	    value="0x08"/>
+	<value name="RB_R8G8B8A8_SNORM"	    value="0x09"/>
+	<value name="RB_R8G8B8A8_UINT"	    value="0x0a"/>
+	<value name="RB_R8G8B8A8_SINT"	    value="0x0b"/>
+	<value name="RB_R8G8_UNORM"	    value="0x0c"/>
+	<value name="RB_R8G8_SNORM"	    value="0x0d"/>
+	<value name="RB_R8G8_UINT"	    value="0x0e"/>
+	<value name="RB_R8G8_SINT"	    value="0x0f"/>
+	<value name="RB_R10G10B10A2_UNORM"  value="0x10"/>
+	<value name="RB_A2R10G10B10_UNORM"  value="0x11"/>
+	<value name="RB_R10G10B10A2_UINT"   value="0x12"/>
+	<value name="RB_A2R10G10B10_UINT"   value="0x13"/>
+
+	<value name="RB_A8_UNORM"	    value="0x14"/>
+	<value name="RB_R8_UNORM"	    value="0x15"/>
+
+	<value name="RB_R16_FLOAT"          value="0x18"/>
+	<value name="RB_R16G16_FLOAT"       value="0x19"/>
+	<value name="RB_R16G16B16A16_FLOAT" value="0x1b"/> <!-- GL_HALF_FLOAT_OES -->
+	<value name="RB_R11G11B10_FLOAT"    value="0x1c"/>
+
+	<value name="RB_R16_SNORM"          value="0x20"/>
+	<value name="RB_R16G16_SNORM"       value="0x21"/>
+	<value name="RB_R16G16B16A16_SNORM" value="0x23"/>
+
+	<value name="RB_R16_UNORM"          value="0x24"/>
+	<value name="RB_R16G16_UNORM"       value="0x25"/>
+	<value name="RB_R16G16B16A16_UNORM" value="0x27"/>
+
+	<value name="RB_R16_SINT"	    value="0x28"/>
+	<value name="RB_R16G16_SINT"	    value="0x29"/>
+	<value name="RB_R16G16B16A16_SINT"  value="0x2b"/>
+
+	<value name="RB_R16_UINT"	    value="0x2c"/>
+	<value name="RB_R16G16_UINT"	    value="0x2d"/>
+	<value name="RB_R16G16B16A16_UINT"  value="0x2f"/>
+
+	<value name="RB_R32_FLOAT"          value="0x30"/>
+	<value name="RB_R32G32_FLOAT"       value="0x31"/>
+	<value name="RB_R32G32B32A32_FLOAT" value="0x33"/> <!-- GL_FLOAT -->
+
+	<value name="RB_R32_SINT"	    value="0x34"/>
+	<value name="RB_R32G32_SINT"	    value="0x35"/>
+	<value name="RB_R32G32B32A32_SINT"  value="0x37"/>
+
+	<value name="RB_R32_UINT"	    value="0x38"/>
+	<value name="RB_R32G32_UINT"	    value="0x39"/>
+	<value name="RB_R32G32B32A32_UINT"  value="0x3b"/>
+
+	<value name="RB_NONE"               value="0xff"/>
+</enum>
+
+<enum name="a3xx_cp_perfcounter_select">
+	<value value="0x00" name="CP_ALWAYS_COUNT"/>
+	<value value="0x03" name="CP_AHB_PFPTRANS_WAIT"/>
+	<value value="0x06" name="CP_AHB_NRTTRANS_WAIT"/>
+	<value value="0x08" name="CP_CSF_NRT_READ_WAIT"/>
+	<value value="0x09" name="CP_CSF_I1_FIFO_FULL"/>
+	<value value="0x0a" name="CP_CSF_I2_FIFO_FULL"/>
+	<value value="0x0b" name="CP_CSF_ST_FIFO_FULL"/>
+	<value value="0x0c" name="CP_RESERVED_12"/>
+	<value value="0x0d" name="CP_CSF_RING_ROQ_FULL"/>
+	<value value="0x0e" name="CP_CSF_I1_ROQ_FULL"/>
+	<value value="0x0f" name="CP_CSF_I2_ROQ_FULL"/>
+	<value value="0x10" name="CP_CSF_ST_ROQ_FULL"/>
+	<value value="0x11" name="CP_RESERVED_17"/>
+	<value value="0x12" name="CP_MIU_TAG_MEM_FULL"/>
+	<value value="0x16" name="CP_MIU_NRT_WRITE_STALLED"/>
+	<value value="0x17" name="CP_MIU_NRT_READ_STALLED"/>
+	<value value="0x1a" name="CP_ME_REGS_RB_DONE_FIFO_FULL"/>
+	<value value="0x1b" name="CP_ME_REGS_VS_EVENT_FIFO_FULL"/>
+	<value value="0x1c" name="CP_ME_REGS_PS_EVENT_FIFO_FULL"/>
+	<value value="0x1d" name="CP_ME_REGS_CF_EVENT_FIFO_FULL"/>
+	<value value="0x1e" name="CP_ME_MICRO_RB_STARVED"/>
+	<value value="0x28" name="CP_AHB_RBBM_DWORD_SENT"/>
+	<value value="0x29" name="CP_ME_BUSY_CLOCKS"/>
+	<value value="0x2a" name="CP_ME_WAIT_CONTEXT_AVAIL"/>
+	<value value="0x2b" name="CP_PFP_TYPE0_PACKET"/>
+	<value value="0x2c" name="CP_PFP_TYPE3_PACKET"/>
+	<value value="0x2d" name="CP_CSF_RB_WPTR_NEQ_RPTR"/>
+	<value value="0x2e" name="CP_CSF_I1_SIZE_NEQ_ZERO"/>
+	<value value="0x2f" name="CP_CSF_I2_SIZE_NEQ_ZERO"/>
+	<value value="0x30" name="CP_CSF_RBI1I2_FETCHING"/>
+</enum>
+
+<enum name="a3xx_gras_tse_perfcounter_select">
+	<value value="0x00" name="GRAS_TSEPERF_INPUT_PRIM"/>
+	<value value="0x01" name="GRAS_TSEPERF_INPUT_NULL_PRIM"/>
+	<value value="0x02" name="GRAS_TSEPERF_TRIVAL_REJ_PRIM"/>
+	<value value="0x03" name="GRAS_TSEPERF_CLIPPED_PRIM"/>
+	<value value="0x04" name="GRAS_TSEPERF_NEW_PRIM"/>
+	<value value="0x05" name="GRAS_TSEPERF_ZERO_AREA_PRIM"/>
+	<value value="0x06" name="GRAS_TSEPERF_FACENESS_CULLED_PRIM"/>
+	<value value="0x07" name="GRAS_TSEPERF_ZERO_PIXEL_PRIM"/>
+	<value value="0x08" name="GRAS_TSEPERF_OUTPUT_NULL_PRIM"/>
+	<value value="0x09" name="GRAS_TSEPERF_OUTPUT_VISIBLE_PRIM"/>
+	<value value="0x0a" name="GRAS_TSEPERF_PRE_CLIP_PRIM"/>
+	<value value="0x0b" name="GRAS_TSEPERF_POST_CLIP_PRIM"/>
+	<value value="0x0c" name="GRAS_TSEPERF_WORKING_CYCLES"/>
+	<value value="0x0d" name="GRAS_TSEPERF_PC_STARVE"/>
+	<value value="0x0e" name="GRAS_TSERASPERF_STALL"/>
+</enum>
+
+<enum name="a3xx_gras_ras_perfcounter_select">
+	<value value="0x00" name="GRAS_RASPERF_16X16_TILES"/>
+	<value value="0x01" name="GRAS_RASPERF_8X8_TILES"/>
+	<value value="0x02" name="GRAS_RASPERF_4X4_TILES"/>
+	<value value="0x03" name="GRAS_RASPERF_WORKING_CYCLES"/>
+	<value value="0x04" name="GRAS_RASPERF_STALL_CYCLES_BY_RB"/>
+	<value value="0x05" name="GRAS_RASPERF_STALL_CYCLES_BY_VSC"/>
+	<value value="0x06" name="GRAS_RASPERF_STARVE_CYCLES_BY_TSE"/>
+</enum>
+
+<enum name="a3xx_hlsq_perfcounter_select">
+	<value value="0x00" name="HLSQ_PERF_SP_VS_CONSTANT"/>
+	<value value="0x01" name="HLSQ_PERF_SP_VS_INSTRUCTIONS"/>
+	<value value="0x02" name="HLSQ_PERF_SP_FS_CONSTANT"/>
+	<value value="0x03" name="HLSQ_PERF_SP_FS_INSTRUCTIONS"/>
+	<value value="0x04" name="HLSQ_PERF_TP_STATE"/>
+	<value value="0x05" name="HLSQ_PERF_QUADS"/>
+	<value value="0x06" name="HLSQ_PERF_PIXELS"/>
+	<value value="0x07" name="HLSQ_PERF_VERTICES"/>
+	<value value="0x08" name="HLSQ_PERF_FS8_THREADS"/>
+	<value value="0x09" name="HLSQ_PERF_FS16_THREADS"/>
+	<value value="0x0a" name="HLSQ_PERF_FS32_THREADS"/>
+	<value value="0x0b" name="HLSQ_PERF_VS8_THREADS"/>
+	<value value="0x0c" name="HLSQ_PERF_VS16_THREADS"/>
+	<value value="0x0d" name="HLSQ_PERF_SP_VS_DATA_BYTES"/>
+	<value value="0x0e" name="HLSQ_PERF_SP_FS_DATA_BYTES"/>
+	<value value="0x0f" name="HLSQ_PERF_ACTIVE_CYCLES"/>
+	<value value="0x10" name="HLSQ_PERF_STALL_CYCLES_SP_STATE"/>
+	<value value="0x11" name="HLSQ_PERF_STALL_CYCLES_SP_VS"/>
+	<value value="0x12" name="HLSQ_PERF_STALL_CYCLES_SP_FS"/>
+	<value value="0x13" name="HLSQ_PERF_STALL_CYCLES_UCHE"/>
+	<value value="0x14" name="HLSQ_PERF_RBBM_LOAD_CYCLES"/>
+	<value value="0x15" name="HLSQ_PERF_DI_TO_VS_START_SP0"/>
+	<value value="0x16" name="HLSQ_PERF_DI_TO_FS_START_SP0"/>
+	<value value="0x17" name="HLSQ_PERF_VS_START_TO_DONE_SP0"/>
+	<value value="0x18" name="HLSQ_PERF_FS_START_TO_DONE_SP0"/>
+	<value value="0x19" name="HLSQ_PERF_SP_STATE_COPY_CYCLES_VS"/>
+	<value value="0x1a" name="HLSQ_PERF_SP_STATE_COPY_CYCLES_FS"/>
+	<value value="0x1b" name="HLSQ_PERF_UCHE_LATENCY_CYCLES"/>
+	<value value="0x1c" name="HLSQ_PERF_UCHE_LATENCY_COUNT"/>
+</enum>
+
+<enum name="a3xx_pc_perfcounter_select">
+	<value value="0x00" name="PC_PCPERF_VISIBILITY_STREAMS"/>
+	<value value="0x01" name="PC_PCPERF_TOTAL_INSTANCES"/>
+	<value value="0x02" name="PC_PCPERF_PRIMITIVES_PC_VPC"/>
+	<value value="0x03" name="PC_PCPERF_PRIMITIVES_KILLED_BY_VS"/>
+	<value value="0x04" name="PC_PCPERF_PRIMITIVES_VISIBLE_BY_VS"/>
+	<value value="0x05" name="PC_PCPERF_DRAWCALLS_KILLED_BY_VS"/>
+	<value value="0x06" name="PC_PCPERF_DRAWCALLS_VISIBLE_BY_VS"/>
+	<value value="0x07" name="PC_PCPERF_VERTICES_TO_VFD"/>
+	<value value="0x08" name="PC_PCPERF_REUSED_VERTICES"/>
+	<value value="0x09" name="PC_PCPERF_CYCLES_STALLED_BY_VFD"/>
+	<value value="0x0a" name="PC_PCPERF_CYCLES_STALLED_BY_TSE"/>
+	<value value="0x0b" name="PC_PCPERF_CYCLES_STALLED_BY_VBIF"/>
+	<value value="0x0c" name="PC_PCPERF_CYCLES_IS_WORKING"/>
+</enum>
+
+<enum name="a3xx_rb_perfcounter_select">
+	<value value="0x00" name="RB_RBPERF_ACTIVE_CYCLES_ANY"/>
+	<value value="0x01" name="RB_RBPERF_ACTIVE_CYCLES_ALL"/>
+	<value value="0x02" name="RB_RBPERF_STARVE_CYCLES_BY_SP"/>
+	<value value="0x03" name="RB_RBPERF_STARVE_CYCLES_BY_RAS"/>
+	<value value="0x04" name="RB_RBPERF_STARVE_CYCLES_BY_MARB"/>
+	<value value="0x05" name="RB_RBPERF_STALL_CYCLES_BY_MARB"/>
+	<value value="0x06" name="RB_RBPERF_STALL_CYCLES_BY_HLSQ"/>
+	<value value="0x07" name="RB_RBPERF_RB_MARB_DATA"/>
+	<value value="0x08" name="RB_RBPERF_SP_RB_QUAD"/>
+	<value value="0x09" name="RB_RBPERF_RAS_EARLY_Z_QUADS"/>
+	<value value="0x0a" name="RB_RBPERF_GMEM_CH0_READ"/>
+	<value value="0x0b" name="RB_RBPERF_GMEM_CH1_READ"/>
+	<value value="0x0c" name="RB_RBPERF_GMEM_CH0_WRITE"/>
+	<value value="0x0d" name="RB_RBPERF_GMEM_CH1_WRITE"/>
+	<value value="0x0e" name="RB_RBPERF_CP_CONTEXT_DONE"/>
+	<value value="0x0f" name="RB_RBPERF_CP_CACHE_FLUSH"/>
+	<value value="0x10" name="RB_RBPERF_CP_ZPASS_DONE"/>
+</enum>
+
+<enum name="a3xx_rbbm_perfcounter_select">
+	<value value="0" name="RBBM_ALAWYS_ON"/>
+	<value value="1" name="RBBM_VBIF_BUSY"/>
+	<value value="2" name="RBBM_TSE_BUSY"/>
+	<value value="3" name="RBBM_RAS_BUSY"/>
+	<value value="4" name="RBBM_PC_DCALL_BUSY"/>
+	<value value="5" name="RBBM_PC_VSD_BUSY"/>
+	<value value="6" name="RBBM_VFD_BUSY"/>
+	<value value="7" name="RBBM_VPC_BUSY"/>
+	<value value="8" name="RBBM_UCHE_BUSY"/>
+	<value value="9" name="RBBM_VSC_BUSY"/>
+	<value value="10" name="RBBM_HLSQ_BUSY"/>
+	<value value="11" name="RBBM_ANY_RB_BUSY"/>
+	<value value="12" name="RBBM_ANY_TEX_BUSY"/>
+	<value value="13" name="RBBM_ANY_USP_BUSY"/>
+	<value value="14" name="RBBM_ANY_MARB_BUSY"/>
+	<value value="15" name="RBBM_ANY_ARB_BUSY"/>
+	<value value="16" name="RBBM_AHB_STATUS_BUSY"/>
+	<value value="17" name="RBBM_AHB_STATUS_STALLED"/>
+	<value value="18" name="RBBM_AHB_STATUS_TXFR"/>
+	<value value="19" name="RBBM_AHB_STATUS_TXFR_SPLIT"/>
+	<value value="20" name="RBBM_AHB_STATUS_TXFR_ERROR"/>
+	<value value="21" name="RBBM_AHB_STATUS_LONG_STALL"/>
+	<value value="22" name="RBBM_RBBM_STATUS_MASKED"/>
+</enum>
+
+<enum name="a3xx_sp_perfcounter_select">
+	<value value="0x00" name="SP_LM_LOAD_INSTRUCTIONS"/>
+	<value value="0x01" name="SP_LM_STORE_INSTRUCTIONS"/>
+	<value value="0x02" name="SP_LM_ATOMICS"/>
+	<value value="0x03" name="SP_UCHE_LOAD_INSTRUCTIONS"/>
+	<value value="0x04" name="SP_UCHE_STORE_INSTRUCTIONS"/>
+	<value value="0x05" name="SP_UCHE_ATOMICS"/>
+	<value value="0x06" name="SP_VS_TEX_INSTRUCTIONS"/>
+	<value value="0x07" name="SP_VS_CFLOW_INSTRUCTIONS"/>
+	<value value="0x08" name="SP_VS_EFU_INSTRUCTIONS"/>
+	<value value="0x09" name="SP_VS_FULL_ALU_INSTRUCTIONS"/>
+	<value value="0x0a" name="SP_VS_HALF_ALU_INSTRUCTIONS"/>
+	<value value="0x0b" name="SP_FS_TEX_INSTRUCTIONS"/>
+	<value value="0x0c" name="SP_FS_CFLOW_INSTRUCTIONS"/>
+	<value value="0x0d" name="SP_FS_EFU_INSTRUCTIONS"/>
+	<value value="0x0e" name="SP_FS_FULL_ALU_INSTRUCTIONS"/>
+	<value value="0x0f" name="SP_FS_HALF_ALU_INSTRUCTIONS"/>
+	<value value="0x10" name="SP_FS_BARY_INSTRUCTIONS"/>
+	<value value="0x11" name="SP_VS_INSTRUCTIONS"/>
+	<value value="0x12" name="SP_FS_INSTRUCTIONS"/>
+	<value value="0x13" name="SP_ADDR_LOCK_COUNT"/>
+	<value value="0x14" name="SP_UCHE_READ_TRANS"/>
+	<value value="0x15" name="SP_UCHE_WRITE_TRANS"/>
+	<value value="0x16" name="SP_EXPORT_VPC_TRANS"/>
+	<value value="0x17" name="SP_EXPORT_RB_TRANS"/>
+	<value value="0x18" name="SP_PIXELS_KILLED"/>
+	<value value="0x19" name="SP_ICL1_REQUESTS"/>
+	<value value="0x1a" name="SP_ICL1_MISSES"/>
+	<value value="0x1b" name="SP_ICL0_REQUESTS"/>
+	<value value="0x1c" name="SP_ICL0_MISSES"/>
+	<value value="0x1d" name="SP_ALU_ACTIVE_CYCLES"/>
+	<value value="0x1e" name="SP_EFU_ACTIVE_CYCLES"/>
+	<value value="0x1f" name="SP_STALL_CYCLES_BY_VPC"/>
+	<value value="0x20" name="SP_STALL_CYCLES_BY_TP"/>
+	<value value="0x21" name="SP_STALL_CYCLES_BY_UCHE"/>
+	<value value="0x22" name="SP_STALL_CYCLES_BY_RB"/>
+	<value value="0x23" name="SP_ACTIVE_CYCLES_ANY"/>
+	<value value="0x24" name="SP_ACTIVE_CYCLES_ALL"/>
+</enum>
+
+<enum name="a3xx_tp_perfcounter_select">
+	<value value="0x00" name="TPL1_TPPERF_L1_REQUESTS"/>
+	<value value="0x01" name="TPL1_TPPERF_TP0_L1_REQUESTS"/>
+	<value value="0x02" name="TPL1_TPPERF_TP0_L1_MISSES"/>
+	<value value="0x03" name="TPL1_TPPERF_TP1_L1_REQUESTS"/>
+	<value value="0x04" name="TPL1_TPPERF_TP1_L1_MISSES"/>
+	<value value="0x05" name="TPL1_TPPERF_TP2_L1_REQUESTS"/>
+	<value value="0x06" name="TPL1_TPPERF_TP2_L1_MISSES"/>
+	<value value="0x07" name="TPL1_TPPERF_TP3_L1_REQUESTS"/>
+	<value value="0x08" name="TPL1_TPPERF_TP3_L1_MISSES"/>
+	<value value="0x09" name="TPL1_TPPERF_OUTPUT_TEXELS_POINT"/>
+	<value value="0x0a" name="TPL1_TPPERF_OUTPUT_TEXELS_BILINEAR"/>
+	<value value="0x0b" name="TPL1_TPPERF_OUTPUT_TEXELS_MIP"/>
+	<value value="0x0c" name="TPL1_TPPERF_OUTPUT_TEXELS_ANISO"/>
+	<value value="0x0d" name="TPL1_TPPERF_BILINEAR_OPS"/>
+	<value value="0x0e" name="TPL1_TPPERF_QUADSQUADS_OFFSET"/>
+	<value value="0x0f" name="TPL1_TPPERF_QUADQUADS_SHADOW"/>
+	<value value="0x10" name="TPL1_TPPERF_QUADS_ARRAY"/>
+	<value value="0x11" name="TPL1_TPPERF_QUADS_PROJECTION"/>
+	<value value="0x12" name="TPL1_TPPERF_QUADS_GRADIENT"/>
+	<value value="0x13" name="TPL1_TPPERF_QUADS_1D2D"/>
+	<value value="0x14" name="TPL1_TPPERF_QUADS_3DCUBE"/>
+	<value value="0x15" name="TPL1_TPPERF_ZERO_LOD"/>
+	<value value="0x16" name="TPL1_TPPERF_OUTPUT_TEXELS"/>
+	<value value="0x17" name="TPL1_TPPERF_ACTIVE_CYCLES_ANY"/>
+	<value value="0x18" name="TPL1_TPPERF_ACTIVE_CYCLES_ALL"/>
+	<value value="0x19" name="TPL1_TPPERF_STALL_CYCLES_BY_ARB"/>
+	<value value="0x1a" name="TPL1_TPPERF_LATENCY"/>
+	<value value="0x1b" name="TPL1_TPPERF_LATENCY_TRANS"/>
+</enum>
+
+<enum name="a3xx_vfd_perfcounter_select">
+	<value value="0" name="VFD_PERF_UCHE_BYTE_FETCHED"/>
+	<value value="1" name="VFD_PERF_UCHE_TRANS"/>
+	<value value="2" name="VFD_PERF_VPC_BYPASS_COMPONENTS"/>
+	<value value="3" name="VFD_PERF_FETCH_INSTRUCTIONS"/>
+	<value value="4" name="VFD_PERF_DECODE_INSTRUCTIONS"/>
+	<value value="5" name="VFD_PERF_ACTIVE_CYCLES"/>
+	<value value="6" name="VFD_PERF_STALL_CYCLES_UCHE"/>
+	<value value="7" name="VFD_PERF_STALL_CYCLES_HLSQ"/>
+	<value value="8" name="VFD_PERF_STALL_CYCLES_VPC_BYPASS"/>
+	<value value="9" name="VFD_PERF_STALL_CYCLES_VPC_ALLOC"/>
+</enum>
+
+<enum name="a3xx_vpc_perfcounter_select">
+	<value value="0" name="VPC_PERF_SP_LM_PRIMITIVES"/>
+	<value value="1" name="VPC_PERF_COMPONENTS_FROM_SP"/>
+	<value value="2" name="VPC_PERF_SP_LM_COMPONENTS"/>
+	<value value="3" name="VPC_PERF_ACTIVE_CYCLES"/>
+	<value value="4" name="VPC_PERF_STALL_CYCLES_LM"/>
+	<value value="5" name="VPC_PERF_STALL_CYCLES_RAS"/>
+</enum>
+
+<enum name="a3xx_uche_perfcounter_select">
+	<value value="0x00" name="UCHE_UCHEPERF_VBIF_READ_BEATS_TP"/>
+	<value value="0x01" name="UCHE_UCHEPERF_VBIF_READ_BEATS_VFD"/>
+	<value value="0x02" name="UCHE_UCHEPERF_VBIF_READ_BEATS_HLSQ"/>
+	<value value="0x03" name="UCHE_UCHEPERF_VBIF_READ_BEATS_MARB"/>
+	<value value="0x04" name="UCHE_UCHEPERF_VBIF_READ_BEATS_SP"/>
+	<value value="0x08" name="UCHE_UCHEPERF_READ_REQUESTS_TP"/>
+	<value value="0x09" name="UCHE_UCHEPERF_READ_REQUESTS_VFD"/>
+	<value value="0x0a" name="UCHE_UCHEPERF_READ_REQUESTS_HLSQ"/>
+	<value value="0x0b" name="UCHE_UCHEPERF_READ_REQUESTS_MARB"/>
+	<value value="0x0c" name="UCHE_UCHEPERF_READ_REQUESTS_SP"/>
+	<value value="0x0d" name="UCHE_UCHEPERF_WRITE_REQUESTS_MARB"/>
+	<value value="0x0e" name="UCHE_UCHEPERF_WRITE_REQUESTS_SP"/>
+	<value value="0x0f" name="UCHE_UCHEPERF_TAG_CHECK_FAILS"/>
+	<value value="0x10" name="UCHE_UCHEPERF_EVICTS"/>
+	<value value="0x11" name="UCHE_UCHEPERF_FLUSHES"/>
+	<value value="0x12" name="UCHE_UCHEPERF_VBIF_LATENCY_CYCLES"/>
+	<value value="0x13" name="UCHE_UCHEPERF_VBIF_LATENCY_SAMPLES"/>
+	<value value="0x14" name="UCHE_UCHEPERF_ACTIVE_CYCLES"/>
+</enum>
+
+<enum name="a3xx_intp_mode">
+	<value name="SMOOTH" value="0"/>
+	<value name="FLAT" value="1"/>
+	<value name="ZERO" value="2"/>
+	<value name="ONE" value="3"/>
+</enum>
+
+<enum name="a3xx_repl_mode">
+	<value name="S" value="1"/>
+	<value name="T" value="2"/>
+	<value name="ONE_T" value="3"/>
+</enum>
+
+<domain name="A3XX" width="32">
+	<!-- RBBM registers -->
+	<reg32 offset="0x0000" name="RBBM_HW_VERSION"/>
+	<reg32 offset="0x0001" name="RBBM_HW_RELEASE"/>
+	<reg32 offset="0x0002" name="RBBM_HW_CONFIGURATION"/>
+	<reg32 offset="0x0010" name="RBBM_CLOCK_CTL"/>
+	<reg32 offset="0x0012" name="RBBM_SP_HYST_CNT"/>
+	<reg32 offset="0x0018" name="RBBM_SW_RESET_CMD"/>
+	<reg32 offset="0x0020" name="RBBM_AHB_CTL0"/>
+	<reg32 offset="0x0021" name="RBBM_AHB_CTL1"/>
+	<reg32 offset="0x0022" name="RBBM_AHB_CMD"/>
+	<reg32 offset="0x0027" name="RBBM_AHB_ERROR_STATUS"/>
+	<reg32 offset="0x002e" name="RBBM_GPR0_CTL"/>
+	<reg32 offset="0x0030" name="RBBM_STATUS">
+		<bitfield name="HI_BUSY" pos="0" type="boolean"/>
+		<bitfield name="CP_ME_BUSY" pos="1" type="boolean"/>
+		<bitfield name="CP_PFP_BUSY" pos="2" type="boolean"/>
+		<bitfield name="CP_NRT_BUSY" pos="14" type="boolean"/>
+		<bitfield name="VBIF_BUSY" pos="15" type="boolean"/>
+		<bitfield name="TSE_BUSY" pos="16" type="boolean"/>
+		<bitfield name="RAS_BUSY" pos="17" type="boolean"/>
+		<bitfield name="RB_BUSY" pos="18" type="boolean"/>
+		<bitfield name="PC_DCALL_BUSY" pos="19" type="boolean"/>
+		<bitfield name="PC_VSD_BUSY" pos="20" type="boolean"/>
+		<bitfield name="VFD_BUSY" pos="21" type="boolean"/>
+		<bitfield name="VPC_BUSY" pos="22" type="boolean"/>
+		<bitfield name="UCHE_BUSY" pos="23" type="boolean"/>
+		<bitfield name="SP_BUSY" pos="24" type="boolean"/>
+		<bitfield name="TPL1_BUSY" pos="25" type="boolean"/>
+		<bitfield name="MARB_BUSY" pos="26" type="boolean"/>
+		<bitfield name="VSC_BUSY" pos="27" type="boolean"/>
+		<bitfield name="ARB_BUSY" pos="28" type="boolean"/>
+		<bitfield name="HLSQ_BUSY" pos="29" type="boolean"/>
+		<bitfield name="GPU_BUSY_NOHC" pos="30" type="boolean"/>
+		<bitfield name="GPU_BUSY" pos="31" type="boolean"/>
+	</reg32>
+	<!-- used in fw CP_WAIT_FOR_IDLE, similar to NQWAIT_UNTIL on a2xx: -->
+	<reg32 offset="0x0040" name="RBBM_NQWAIT_UNTIL"/>
+	<reg32 offset="0x0033" name="RBBM_WAIT_IDLE_CLOCKS_CTL"/>
+	<reg32 offset="0x0050" name="RBBM_INTERFACE_HANG_INT_CTL"/>
+	<reg32 offset="0x0051" name="RBBM_INTERFACE_HANG_MASK_CTL0"/>
+	<reg32 offset="0x0054" name="RBBM_INTERFACE_HANG_MASK_CTL1"/>
+	<reg32 offset="0x0057" name="RBBM_INTERFACE_HANG_MASK_CTL2"/>
+	<reg32 offset="0x005a" name="RBBM_INTERFACE_HANG_MASK_CTL3"/>
+
+	<bitset name="A3XX_INT0">
+		<bitfield name="RBBM_GPU_IDLE" pos="0" type="boolean"/>
+		<bitfield name="RBBM_AHB_ERROR" pos="1" type="boolean"/>
+		<bitfield name="RBBM_REG_TIMEOUT" pos="2" type="boolean"/>
+		<bitfield name="RBBM_ME_MS_TIMEOUT" pos="3" type="boolean"/>
+		<bitfield name="RBBM_PFP_MS_TIMEOUT" pos="4" type="boolean"/>
+		<bitfield name="RBBM_ATB_BUS_OVERFLOW" pos="5" type="boolean"/>
+		<bitfield name="VFD_ERROR" pos="6" type="boolean"/>
+		<bitfield name="CP_SW_INT" pos="7" type="boolean"/>
+		<bitfield name="CP_T0_PACKET_IN_IB" pos="8" type="boolean"/>
+		<bitfield name="CP_OPCODE_ERROR" pos="9" type="boolean"/>
+		<bitfield name="CP_RESERVED_BIT_ERROR" pos="10" type="boolean"/>
+		<bitfield name="CP_HW_FAULT" pos="11" type="boolean"/>
+		<bitfield name="CP_DMA" pos="12" type="boolean"/>
+		<bitfield name="CP_IB2_INT" pos="13" type="boolean"/>
+		<bitfield name="CP_IB1_INT" pos="14" type="boolean"/>
+		<bitfield name="CP_RB_INT" pos="15" type="boolean"/>
+		<bitfield name="CP_REG_PROTECT_FAULT" pos="16" type="boolean"/>
+		<bitfield name="CP_RB_DONE_TS" pos="17" type="boolean"/>
+		<bitfield name="CP_VS_DONE_TS" pos="18" type="boolean"/>
+		<bitfield name="CP_PS_DONE_TS" pos="19" type="boolean"/>
+		<bitfield name="CACHE_FLUSH_TS" pos="20" type="boolean"/>
+		<bitfield name="CP_AHB_ERROR_HALT" pos="21" type="boolean"/>
+		<bitfield name="MISC_HANG_DETECT" pos="24" type="boolean"/>
+		<bitfield name="UCHE_OOB_ACCESS" pos="25" type="boolean"/>
+	</bitset>
+
+
+	<!--
+		set in pm4 fw INVALID_JUMP_TABLE_ENTRY and CP_INTERRUPT (compare
+		to CP_INT_STATUS in a2xx firmware), so this seems to be the a3xx
+		way for fw to raise and irq:
+	 -->
+	<reg32 offset="0x0060" name="RBBM_INT_SET_CMD" type="A3XX_INT0"/>
+	<reg32 offset="0x0061" name="RBBM_INT_CLEAR_CMD" type="A3XX_INT0"/>
+	<reg32 offset="0x0063" name="RBBM_INT_0_MASK" type="A3XX_INT0"/>
+	<reg32 offset="0x0064" name="RBBM_INT_0_STATUS" type="A3XX_INT0"/>
+	<reg32 offset="0x0080" name="RBBM_PERFCTR_CTL">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0081" name="RBBM_PERFCTR_LOAD_CMD0"/>
+	<reg32 offset="0x0082" name="RBBM_PERFCTR_LOAD_CMD1"/>
+	<reg32 offset="0x0084" name="RBBM_PERFCTR_LOAD_VALUE_LO"/>
+	<reg32 offset="0x0085" name="RBBM_PERFCTR_LOAD_VALUE_HI"/>
+	<reg32 offset="0x0086" name="RBBM_PERFCOUNTER0_SELECT" type="a3xx_rbbm_perfcounter_select"/>
+	<reg32 offset="0x0087" name="RBBM_PERFCOUNTER1_SELECT" type="a3xx_rbbm_perfcounter_select"/>
+	<reg32 offset="0x0088" name="RBBM_GPU_BUSY_MASKED"/>
+	<reg32 offset="0x0090" name="RBBM_PERFCTR_CP_0_LO"/>
+	<reg32 offset="0x0091" name="RBBM_PERFCTR_CP_0_HI"/>
+	<reg32 offset="0x0092" name="RBBM_PERFCTR_RBBM_0_LO"/>
+	<reg32 offset="0x0093" name="RBBM_PERFCTR_RBBM_0_HI"/>
+	<reg32 offset="0x0094" name="RBBM_PERFCTR_RBBM_1_LO"/>
+	<reg32 offset="0x0095" name="RBBM_PERFCTR_RBBM_1_HI"/>
+	<reg32 offset="0x0096" name="RBBM_PERFCTR_PC_0_LO"/>
+	<reg32 offset="0x0097" name="RBBM_PERFCTR_PC_0_HI"/>
+	<reg32 offset="0x0098" name="RBBM_PERFCTR_PC_1_LO"/>
+	<reg32 offset="0x0099" name="RBBM_PERFCTR_PC_1_HI"/>
+	<reg32 offset="0x009a" name="RBBM_PERFCTR_PC_2_LO"/>
+	<reg32 offset="0x009b" name="RBBM_PERFCTR_PC_2_HI"/>
+	<reg32 offset="0x009c" name="RBBM_PERFCTR_PC_3_LO"/>
+	<reg32 offset="0x009d" name="RBBM_PERFCTR_PC_3_HI"/>
+	<reg32 offset="0x009e" name="RBBM_PERFCTR_VFD_0_LO"/>
+	<reg32 offset="0x009f" name="RBBM_PERFCTR_VFD_0_HI"/>
+	<reg32 offset="0x00a0" name="RBBM_PERFCTR_VFD_1_LO"/>
+	<reg32 offset="0x00a1" name="RBBM_PERFCTR_VFD_1_HI"/>
+	<reg32 offset="0x00a2" name="RBBM_PERFCTR_HLSQ_0_LO"/>
+	<reg32 offset="0x00a3" name="RBBM_PERFCTR_HLSQ_0_HI"/>
+	<reg32 offset="0x00a4" name="RBBM_PERFCTR_HLSQ_1_LO"/>
+	<reg32 offset="0x00a5" name="RBBM_PERFCTR_HLSQ_1_HI"/>
+	<reg32 offset="0x00a6" name="RBBM_PERFCTR_HLSQ_2_LO"/>
+	<reg32 offset="0x00a7" name="RBBM_PERFCTR_HLSQ_2_HI"/>
+	<reg32 offset="0x00a8" name="RBBM_PERFCTR_HLSQ_3_LO"/>
+	<reg32 offset="0x00a9" name="RBBM_PERFCTR_HLSQ_3_HI"/>
+	<reg32 offset="0x00aa" name="RBBM_PERFCTR_HLSQ_4_LO"/>
+	<reg32 offset="0x00ab" name="RBBM_PERFCTR_HLSQ_4_HI"/>
+	<reg32 offset="0x00ac" name="RBBM_PERFCTR_HLSQ_5_LO"/>
+	<reg32 offset="0x00ad" name="RBBM_PERFCTR_HLSQ_5_HI"/>
+	<reg32 offset="0x00ae" name="RBBM_PERFCTR_VPC_0_LO"/>
+	<reg32 offset="0x00af" name="RBBM_PERFCTR_VPC_0_HI"/>
+	<reg32 offset="0x00b0" name="RBBM_PERFCTR_VPC_1_LO"/>
+	<reg32 offset="0x00b1" name="RBBM_PERFCTR_VPC_1_HI"/>
+	<reg32 offset="0x00b2" name="RBBM_PERFCTR_TSE_0_LO"/>
+	<reg32 offset="0x00b3" name="RBBM_PERFCTR_TSE_0_HI"/>
+	<reg32 offset="0x00b4" name="RBBM_PERFCTR_TSE_1_LO"/>
+	<reg32 offset="0x00b5" name="RBBM_PERFCTR_TSE_1_HI"/>
+	<reg32 offset="0x00b6" name="RBBM_PERFCTR_RAS_0_LO"/>
+	<reg32 offset="0x00b7" name="RBBM_PERFCTR_RAS_0_HI"/>
+	<reg32 offset="0x00b8" name="RBBM_PERFCTR_RAS_1_LO"/>
+	<reg32 offset="0x00b9" name="RBBM_PERFCTR_RAS_1_HI"/>
+	<reg32 offset="0x00ba" name="RBBM_PERFCTR_UCHE_0_LO"/>
+	<reg32 offset="0x00bb" name="RBBM_PERFCTR_UCHE_0_HI"/>
+	<reg32 offset="0x00bc" name="RBBM_PERFCTR_UCHE_1_LO"/>
+	<reg32 offset="0x00bd" name="RBBM_PERFCTR_UCHE_1_HI"/>
+	<reg32 offset="0x00be" name="RBBM_PERFCTR_UCHE_2_LO"/>
+	<reg32 offset="0x00bf" name="RBBM_PERFCTR_UCHE_2_HI"/>
+	<reg32 offset="0x00c0" name="RBBM_PERFCTR_UCHE_3_LO"/>
+	<reg32 offset="0x00c1" name="RBBM_PERFCTR_UCHE_3_HI"/>
+	<reg32 offset="0x00c2" name="RBBM_PERFCTR_UCHE_4_LO"/>
+	<reg32 offset="0x00c3" name="RBBM_PERFCTR_UCHE_4_HI"/>
+	<reg32 offset="0x00c4" name="RBBM_PERFCTR_UCHE_5_LO"/>
+	<reg32 offset="0x00c5" name="RBBM_PERFCTR_UCHE_5_HI"/>
+	<reg32 offset="0x00c6" name="RBBM_PERFCTR_TP_0_LO"/>
+	<reg32 offset="0x00c7" name="RBBM_PERFCTR_TP_0_HI"/>
+	<reg32 offset="0x00c8" name="RBBM_PERFCTR_TP_1_LO"/>
+	<reg32 offset="0x00c9" name="RBBM_PERFCTR_TP_1_HI"/>
+	<reg32 offset="0x00ca" name="RBBM_PERFCTR_TP_2_LO"/>
+	<reg32 offset="0x00cb" name="RBBM_PERFCTR_TP_2_HI"/>
+	<reg32 offset="0x00cc" name="RBBM_PERFCTR_TP_3_LO"/>
+	<reg32 offset="0x00cd" name="RBBM_PERFCTR_TP_3_HI"/>
+	<reg32 offset="0x00ce" name="RBBM_PERFCTR_TP_4_LO"/>
+	<reg32 offset="0x00cf" name="RBBM_PERFCTR_TP_4_HI"/>
+	<reg32 offset="0x00d0" name="RBBM_PERFCTR_TP_5_LO"/>
+	<reg32 offset="0x00d1" name="RBBM_PERFCTR_TP_5_HI"/>
+	<reg32 offset="0x00d2" name="RBBM_PERFCTR_SP_0_LO"/>
+	<reg32 offset="0x00d3" name="RBBM_PERFCTR_SP_0_HI"/>
+	<reg32 offset="0x00d4" name="RBBM_PERFCTR_SP_1_LO"/>
+	<reg32 offset="0x00d5" name="RBBM_PERFCTR_SP_1_HI"/>
+	<reg32 offset="0x00d6" name="RBBM_PERFCTR_SP_2_LO"/>
+	<reg32 offset="0x00d7" name="RBBM_PERFCTR_SP_2_HI"/>
+	<reg32 offset="0x00d8" name="RBBM_PERFCTR_SP_3_LO"/>
+	<reg32 offset="0x00d9" name="RBBM_PERFCTR_SP_3_HI"/>
+	<reg32 offset="0x00da" name="RBBM_PERFCTR_SP_4_LO"/>
+	<reg32 offset="0x00db" name="RBBM_PERFCTR_SP_4_HI"/>
+	<reg32 offset="0x00dc" name="RBBM_PERFCTR_SP_5_LO"/>
+	<reg32 offset="0x00dd" name="RBBM_PERFCTR_SP_5_HI"/>
+	<reg32 offset="0x00de" name="RBBM_PERFCTR_SP_6_LO"/>
+	<reg32 offset="0x00df" name="RBBM_PERFCTR_SP_6_HI"/>
+	<reg32 offset="0x00e0" name="RBBM_PERFCTR_SP_7_LO"/>
+	<reg32 offset="0x00e1" name="RBBM_PERFCTR_SP_7_HI"/>
+	<reg32 offset="0x00e2" name="RBBM_PERFCTR_RB_0_LO"/>
+	<reg32 offset="0x00e3" name="RBBM_PERFCTR_RB_0_HI"/>
+	<reg32 offset="0x00e4" name="RBBM_PERFCTR_RB_1_LO"/>
+	<reg32 offset="0x00e5" name="RBBM_PERFCTR_RB_1_HI"/>
+	<reg32 offset="0x00ea" name="RBBM_PERFCTR_PWR_0_LO"/>
+	<reg32 offset="0x00eb" name="RBBM_PERFCTR_PWR_0_HI"/>
+	<reg32 offset="0x00ec" name="RBBM_PERFCTR_PWR_1_LO"/>
+	<reg32 offset="0x00ed" name="RBBM_PERFCTR_PWR_1_HI"/>
+	<reg32 offset="0x0100" name="RBBM_RBBM_CTL"/>
+	<reg32 offset="0x0111" name="RBBM_DEBUG_BUS_CTL"/>
+	<reg32 offset="0x0112" name="RBBM_DEBUG_BUS_DATA_STATUS"/>
+
+	<!-- CP registers -->
+	<reg32 offset="0x01c9" name="CP_PFP_UCODE_ADDR"/>
+	<reg32 offset="0x01ca" name="CP_PFP_UCODE_DATA"/>
+	<reg32 offset="0x01cc" name="CP_ROQ_ADDR"/>
+	<reg32 offset="0x01cd" name="CP_ROQ_DATA"/>
+	<reg32 offset="0x01d1" name="CP_MERCIU_ADDR"/>
+	<reg32 offset="0x01d2" name="CP_MERCIU_DATA"/>
+	<reg32 offset="0x01d3" name="CP_MERCIU_DATA2"/>
+	<!-- see a3xx_snapshot_cp_meq().. looks like the way to dump queue between pfp and pm4 -->
+	<reg32 offset="0x01da" name="CP_MEQ_ADDR"/>
+	<reg32 offset="0x01db" name="CP_MEQ_DATA"/>
+	<reg32 offset="0x01f5" name="CP_WFI_PEND_CTR"/>
+	<reg32 offset="0x039d" name="RBBM_PM_OVERRIDE2"/>
+
+	<reg32 offset="0x0445" name="CP_PERFCOUNTER_SELECT" type="a3xx_cp_perfcounter_select"/>
+	<reg32 offset="0x045c" name="CP_HW_FAULT"/>
+	<reg32 offset="0x045e" name="CP_PROTECT_CTRL"/>
+	<reg32 offset="0x045f" name="CP_PROTECT_STATUS"/>
+	<array offset="0x0460" name="CP_PROTECT" stride="1" length="16">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<reg32 offset="0x054d" name="CP_AHB_FAULT"/>
+
+	<reg32 offset="0x0d00" name="SQ_GPR_MANAGEMENT"/>
+	<reg32 offset="0x0d02" name="SQ_INST_STORE_MANAGMENT"/>
+	<reg32 offset="0x0e1e" name="TP0_CHICKEN"/>
+
+	<!-- these I guess or either SP or HLSQ since related to shader core setup: -->
+	<reg32 offset="0x0e22" name="SP_GLOBAL_MEM_SIZE" type="uint">
+		<doc>
+			The pair of MEM_SIZE/ADDR registers get programmed
+			in sequence with the size/addr of each buffer.
+		</doc>
+	</reg32>
+	<reg32 offset="0x0e23" name="SP_GLOBAL_MEM_ADDR"/>
+
+	<!-- GRAS registers -->
+	<reg32 offset="0x2040" name="GRAS_CL_CLIP_CNTL">
+		<bitfield name="IJ_PERSP_CENTER" pos="12" type="boolean"/>
+		<bitfield name="IJ_NON_PERSP_CENTER" pos="13" type="boolean"/>
+		<bitfield name="IJ_PERSP_CENTROID" pos="14" type="boolean"/>
+		<bitfield name="IJ_NON_PERSP_CENTROID" pos="15" type="boolean"/>
+		<bitfield name="CLIP_DISABLE" pos="16" type="boolean"/>
+		<bitfield name="ZFAR_CLIP_DISABLE" pos="17" type="boolean"/>
+		<bitfield name="VP_CLIP_CODE_IGNORE" pos="19" type="boolean"/>
+		<bitfield name="VP_XFORM_DISABLE" pos="20" type="boolean"/>
+		<bitfield name="PERSP_DIVISION_DISABLE" pos="21" type="boolean"/>
+		<bitfield name="ZERO_GB_SCALE_Z" pos="22" type="boolean">
+			<doc>aka clip_halfz</doc>
+		</bitfield>
+		<!-- set when gl_FragCoord.z is enabled in frag shader: -->
+		<bitfield name="ZCOORD" pos="23" type="boolean"/>
+		<bitfield name="WCOORD" pos="24" type="boolean"/>
+		<!-- set when frag shader writes z (so early z test disabled: -->
+		<bitfield name="ZCLIP_DISABLE" pos="25" type="boolean"/>
+		<bitfield name="NUM_USER_CLIP_PLANES" low="26" high="28" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2044" name="GRAS_CL_GB_CLIP_ADJ">
+		<bitfield name="HORZ" low="0" high="9" type="uint"/>
+		<bitfield name="VERT" low="10" high="19" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2048" name="GRAS_CL_VPORT_XOFFSET" type="float"/>
+	<reg32 offset="0x2049" name="GRAS_CL_VPORT_XSCALE" type="float"/>
+	<reg32 offset="0x204a" name="GRAS_CL_VPORT_YOFFSET" type="float"/>
+	<reg32 offset="0x204b" name="GRAS_CL_VPORT_YSCALE" type="float"/>
+	<reg32 offset="0x204c" name="GRAS_CL_VPORT_ZOFFSET" type="float"/>
+	<reg32 offset="0x204d" name="GRAS_CL_VPORT_ZSCALE" type="float"/>
+	<reg32 offset="0x2068" name="GRAS_SU_POINT_MINMAX">
+		<bitfield name="MIN" low="0" high="15" type="ufixed" radix="4"/>
+		<bitfield name="MAX" low="16" high="31" type="ufixed" radix="4"/>
+	</reg32>
+	<reg32 offset="0x2069" name="GRAS_SU_POINT_SIZE" type="fixed" radix="4"/>
+	<reg32 offset="0x206c" name="GRAS_SU_POLY_OFFSET_SCALE">
+		<bitfield name="VAL" low="0" high="23" type="fixed" radix="20"/>
+		<doc>range of -8.0 to 8.0</doc>
+	</reg32>
+	<reg32 offset="0x206d" name="GRAS_SU_POLY_OFFSET_OFFSET" radix="6" type="fixed">
+		<doc>range of -512.0 to 512.0</doc>
+	</reg32>
+	<reg32 offset="0x2070" name="GRAS_SU_MODE_CONTROL">
+		<bitfield name="CULL_FRONT" pos="0" type="boolean"/>
+		<bitfield name="CULL_BACK" pos="1" type="boolean"/>
+		<bitfield name="FRONT_CW" pos="2" type="boolean"/>
+		<bitfield name="LINEHALFWIDTH" low="3" high="10" radix="2" type="fixed"/>
+		<bitfield name="POLY_OFFSET" pos="11" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2072" name="GRAS_SC_CONTROL">
+		<!-- complete wild-ass-guess for sizes of these bitfields.. -->
+		<bitfield name="RENDER_MODE" low="4" high="7" type="a3xx_render_mode"/>
+		<bitfield name="MSAA_SAMPLES" low="8" high="11" type="a3xx_msaa_samples"/>
+		<bitfield name="RASTER_MODE" low="12" high="15"/>
+	</reg32>
+
+	<reg32 offset="0x2074" name="GRAS_SC_SCREEN_SCISSOR_TL" type="adreno_reg_xy"/>
+	<reg32 offset="0x2075" name="GRAS_SC_SCREEN_SCISSOR_BR" type="adreno_reg_xy"/>
+	<reg32 offset="0x2079" name="GRAS_SC_WINDOW_SCISSOR_TL" type="adreno_reg_xy"/>
+	<reg32 offset="0x207a" name="GRAS_SC_WINDOW_SCISSOR_BR" type="adreno_reg_xy"/>
+
+	<!-- RB registers -->
+	<reg32 offset="0x20c0" name="RB_MODE_CONTROL">
+		<!-- guess on the # of bits here.. -->
+		<bitfield name="GMEM_BYPASS" pos="7" type="boolean"/>
+		<doc>
+			RENDER_MODE is RB_RESOLVE_PASS for gmem->mem, otherwise RB_RENDER_PASS
+		</doc>
+		<bitfield name="RENDER_MODE" low="8" high="10" type="a3xx_render_mode"/>
+		<bitfield name="MRT" low="12" high="13" type="uint">
+			<doc>render targets - 1</doc>
+		</bitfield>
+		<bitfield name="MARB_CACHE_SPLIT_MODE" pos="15" type="boolean"/>
+		<bitfield name="PACKER_TIMER_ENABLE" pos="16" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x20c1" name="RB_RENDER_CONTROL">
+		<bitfield name="DUAL_COLOR_IN_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="YUV_IN_ENABLE" pos="1" type="boolean"/>
+		<bitfield name="COV_VALUE_INPUT_ENABLE" pos="2" type="boolean"/>
+		<!-- set when gl_FrontFacing is accessed in frag shader: -->
+		<bitfield name="FACENESS" pos="3" type="boolean"/>
+		<bitfield name="BIN_WIDTH" low="4" high="11" shr="5" type="uint"/>
+		<bitfield name="DISABLE_COLOR_PIPE" pos="12" type="boolean"/>
+		<!--
+			ENABLE_GMEM not set on mem2gmem..  so possibly it is actually
+			controlling blend or readback from GMEM??
+		 -->
+		<bitfield name="ENABLE_GMEM" pos="13" type="boolean"/>
+		<bitfield name="COORD_MASK" low="14" high="17" type="hex"/>
+		<bitfield name="I_CLAMP_ENABLE" pos="19" type="boolean"/>
+		<bitfield name="COV_VALUE_OUTPUT_ENABLE" pos="20" type="boolean"/>
+		<bitfield name="ALPHA_TEST" pos="22" type="boolean"/>
+		<bitfield name="ALPHA_TEST_FUNC" low="24" high="26" type="adreno_compare_func"/>
+		<bitfield name="ALPHA_TO_COVERAGE" pos="30" type="boolean"/>
+		<bitfield name="ALPHA_TO_ONE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x20c2" name="RB_MSAA_CONTROL">
+		<bitfield name="DISABLE" pos="10" type="boolean"/>
+		<bitfield name="SAMPLES" low="12" high="15" type="a3xx_msaa_samples"/>
+		<bitfield name="SAMPLE_MASK" low="16" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="0x20c3" name="RB_ALPHA_REF">
+		<bitfield name="UINT" low="8" high="15" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+	<array offset="0x20c4" name="RB_MRT" stride="4" length="4">
+		<reg32 offset="0x0" name="CONTROL">
+			<bitfield name="READ_DEST_ENABLE" pos="3" type="boolean"/>
+			<!-- both these bits seem to get set when enabling GL_BLEND.. -->
+			<bitfield name="BLEND" pos="4" type="boolean"/>
+			<bitfield name="BLEND2" pos="5" type="boolean"/>
+			<bitfield name="ROP_CODE" low="8" high="11" type="a3xx_rop_code"/>
+			<bitfield name="DITHER_MODE" low="12" high="13" type="adreno_rb_dither_mode"/>
+			<bitfield name="COMPONENT_ENABLE" low="24" high="27" type="hex"/>
+		</reg32>
+		<reg32 offset="0x1" name="BUF_INFO">
+			<bitfield name="COLOR_FORMAT" low="0" high="5" type="a3xx_color_fmt"/>
+			<bitfield name="COLOR_TILE_MODE" low="6" high="7" type="a3xx_tile_mode"/>
+			<bitfield name="COLOR_SWAP" low="10" high="11" type="a3xx_color_swap"/>
+			<bitfield name="COLOR_SRGB" pos="14" type="boolean"/>
+			<doc>
+				Pitch (actually, appears to be pitch in bytes, so really is a stride)
+				in GMEM, so pitch of the current tile.
+			</doc>
+			<bitfield name="COLOR_BUF_PITCH" low="17" high="31" shr="5" type="uint"/>
+		</reg32>
+		<reg32 offset="0x2" name="BUF_BASE">
+			<doc>offset into GMEM (or system memory address in bypass mode)</doc>
+			<bitfield name="COLOR_BUF_BASE" low="4" high="31" shr="5" type="hex"/>
+		</reg32>
+		<reg32 offset="0x3" name="BLEND_CONTROL">
+			<bitfield name="RGB_SRC_FACTOR" low="0" high="4" type="adreno_rb_blend_factor"/>
+			<bitfield name="RGB_BLEND_OPCODE" low="5" high="7" type="a3xx_rb_blend_opcode"/>
+			<bitfield name="RGB_DEST_FACTOR" low="8" high="12" type="adreno_rb_blend_factor"/>
+			<bitfield name="ALPHA_SRC_FACTOR" low="16" high="20" type="adreno_rb_blend_factor"/>
+			<bitfield name="ALPHA_BLEND_OPCODE" low="21" high="23" type="a3xx_rb_blend_opcode"/>
+			<bitfield name="ALPHA_DEST_FACTOR" low="24" high="28" type="adreno_rb_blend_factor"/>
+			<bitfield name="CLAMP_ENABLE" pos="29" type="boolean"/>
+		</reg32>
+	</array>
+
+	<reg32 offset="0x20e4" name="RB_BLEND_RED">
+		<bitfield name="UINT" low="0" high="7" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+	<reg32 offset="0x20e5" name="RB_BLEND_GREEN">
+		<bitfield name="UINT" low="0" high="7" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+	<reg32 offset="0x20e6" name="RB_BLEND_BLUE">
+		<bitfield name="UINT" low="0" high="7" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+	<reg32 offset="0x20e7" name="RB_BLEND_ALPHA">
+		<bitfield name="UINT" low="0" high="7" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+
+	<reg32 offset="0x20e8" name="RB_CLEAR_COLOR_DW0"/>
+	<reg32 offset="0x20e9" name="RB_CLEAR_COLOR_DW1"/>
+	<reg32 offset="0x20ea" name="RB_CLEAR_COLOR_DW2"/>
+	<reg32 offset="0x20eb" name="RB_CLEAR_COLOR_DW3"/>
+	<reg32 offset="0x20ec" name="RB_COPY_CONTROL">
+		<!-- not sure # of bits -->
+		<bitfield name="MSAA_RESOLVE" low="0" high="1" type="a3xx_msaa_samples"/>
+		<bitfield name="DEPTHCLEAR" pos="3" type="boolean"/>
+		<bitfield name="MODE" low="4" high="6" type="adreno_rb_copy_control_mode"/>
+		<bitfield name="MSAA_SRGB_DOWNSAMPLE" pos="7" type="boolean"/>
+		<bitfield name="FASTCLEAR" low="8" high="11" type="hex"/>
+		<bitfield name="DEPTH32_RESOLVE" pos="12" type="boolean"/> <!-- enabled on a Z32F copy -->
+		<bitfield name="GMEM_BASE" low="14" high="31" shr="14" type="hex"/>
+	</reg32>
+	<reg32 offset="0x20ed" name="RB_COPY_DEST_BASE">
+		<bitfield name="BASE" low="4" high="31" shr="5" type="hex"/>
+	</reg32>
+	<reg32 offset="0x20ee" name="RB_COPY_DEST_PITCH">
+		<doc>actually, appears to be pitch in bytes, so really is a stride</doc>
+		<!-- not actually sure about max pitch... -->
+		<bitfield name="PITCH" low="0" high="31" shr="5" type="uint"/>
+	</reg32>
+	<reg32 offset="0x20ef" name="RB_COPY_DEST_INFO">
+		<bitfield name="TILE" low="0" high="1" type="a3xx_tile_mode"/>
+		<bitfield name="FORMAT" low="2" high="7" type="a3xx_color_fmt"/>
+		<bitfield name="SWAP" low="8" high="9" type="a3xx_color_swap"/>
+		<bitfield name="DITHER_MODE" low="10" high="11" type="adreno_rb_dither_mode"/>
+		<bitfield name="COMPONENT_ENABLE" low="14" high="17" type="hex"/>
+		<bitfield name="ENDIAN" low="18" high="20" type="adreno_rb_surface_endian"/>
+	</reg32>
+	<reg32 offset="0x2100" name="RB_DEPTH_CONTROL">
+		<!--
+			guessing that this matches a2xx with the stencil fields
+			moved out into RB_STENCIL_CONTROL?
+		 -->
+		<bitfield name="FRAG_WRITES_Z" pos="0" type="boolean"/>
+		<bitfield name="Z_TEST_ENABLE" pos="1" type="boolean"/>
+		<bitfield name="Z_WRITE_ENABLE" pos="2" type="boolean"/>
+		<bitfield name="EARLY_Z_DISABLE" pos="3" type="boolean"/>
+		<bitfield name="ZFUNC" low="4" high="6" type="adreno_compare_func"/>
+		<bitfield name="Z_CLAMP_ENABLE" pos="7" type="boolean"/>
+		<doc>Z_READ_ENABLE bit is set for zfunc other than GL_ALWAYS or GL_NEVER</doc>
+		<bitfield name="Z_READ_ENABLE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2101" name="RB_DEPTH_CLEAR">
+		<doc>seems to be always set to 0x00000000</doc>
+	</reg32>
+	<reg32 offset="0x2102" name="RB_DEPTH_INFO">
+		<bitfield name="DEPTH_FORMAT" low="0" high="1" type="adreno_rb_depth_format"/>
+		<doc>
+			DEPTH_BASE is offset in GMEM to depth/stencil buffer, ie
+			bin_w * bin_h / 1024 (possible rounded up to multiple of
+			something??  ie. 39 becomes 40, 78 becomes 80.. 75 becomes
+			80.. so maybe it needs to be multiple of 8??
+		</doc>
+		<bitfield name="DEPTH_BASE" low="11" high="31" shr="12" type="hex"/>
+	</reg32>
+	<reg32 offset="0x2103" name="RB_DEPTH_PITCH" shr="3" type="uint">
+		<doc>
+			Pitch of depth buffer or combined depth+stencil buffer
+			in z24s8 cases.
+		</doc>
+	</reg32>
+	<reg32 offset="0x2104" name="RB_STENCIL_CONTROL">
+		<bitfield name="STENCIL_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="STENCIL_ENABLE_BF" pos="1" type="boolean"/>
+		<!--
+			set for stencil operations that require read from stencil
+			buffer, but not for example for stencil clear (which does
+			not require read).. so guessing this is analogous to
+			READ_DEST_ENABLE for color buffer..
+		 -->
+		<bitfield name="STENCIL_READ" pos="2" type="boolean"/>
+		<bitfield name="FUNC" low="8" high="10" type="adreno_compare_func"/>
+		<bitfield name="FAIL" low="11" high="13" type="adreno_stencil_op"/>
+		<bitfield name="ZPASS" low="14" high="16" type="adreno_stencil_op"/>
+		<bitfield name="ZFAIL" low="17" high="19" type="adreno_stencil_op"/>
+		<bitfield name="FUNC_BF" low="20" high="22" type="adreno_compare_func"/>
+		<bitfield name="FAIL_BF" low="23" high="25" type="adreno_stencil_op"/>
+		<bitfield name="ZPASS_BF" low="26" high="28" type="adreno_stencil_op"/>
+		<bitfield name="ZFAIL_BF" low="29" high="31" type="adreno_stencil_op"/>
+	</reg32>
+	<reg32 offset="0x2105" name="RB_STENCIL_CLEAR">
+		<doc>seems to be always set to 0x00000000</doc>
+	</reg32>
+	<reg32 offset="0x2106" name="RB_STENCIL_INFO">
+		<doc>Base address for stencil when not using interleaved depth/stencil</doc>
+		<bitfield name="STENCIL_BASE" low="11" high="31" shr="12" type="hex"/>
+	</reg32>
+	<reg32 offset="0x2107" name="RB_STENCIL_PITCH" shr="3" type="uint">
+		<doc>pitch of stencil buffer when not using interleaved depth/stencil</doc>
+	</reg32>
+	<reg32 offset="0x2108" name="RB_STENCILREFMASK" type="adreno_rb_stencilrefmask"/>
+	<reg32 offset="0x2109" name="RB_STENCILREFMASK_BF" type="adreno_rb_stencilrefmask"/>
+	<!-- VSC == visibility stream c?? -->
+	<reg32 offset="0x210c" name="RB_LRZ_VSC_CONTROL">
+		<doc>seems to be set to 0x00000002 during binning pass</doc>
+		<bitfield name="BINNING_ENABLE" pos="1" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x210e" name="RB_WINDOW_OFFSET">
+		<doc>X/Y offset of current bin</doc>
+		<bitfield name="X" low="0" high="15" type="uint"/>
+		<bitfield name="Y" low="16" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2110" name="RB_SAMPLE_COUNT_CONTROL">
+		<bitfield name="RESET" pos="0" type="boolean"/>
+		<bitfield name="COPY" pos="1" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2111" name="RB_SAMPLE_COUNT_ADDR"/>
+	<reg32 offset="0x2114" name="RB_Z_CLAMP_MIN"/>
+	<reg32 offset="0x2115" name="RB_Z_CLAMP_MAX"/>
+
+	<!-- PC registers -->
+	<reg32 offset="0x21e1" name="VGT_BIN_BASE">
+		<doc>
+			seems to be where firmware writes BIN_DATA_ADDR from
+			CP_SET_BIN_DATA packet..  probably should be called
+			PC_BIN_BASE (just using name from yamato for now)
+		</doc>
+	</reg32>
+	<reg32 offset="0x21e2" name="VGT_BIN_SIZE">
+		<doc>probably should be PC_BIN_SIZE</doc>
+	</reg32>
+	<reg32 offset="0x21e4" name="PC_VSTREAM_CONTROL">
+		<doc>SIZE is current pipe width * height (in tiles)</doc>
+		<bitfield name="SIZE" low="16" high="21" type="uint"/>
+		<doc>
+			N is some sort of slot # between 0..(SIZE-1).  In case
+			multiple tiles use same pipe, each tile gets unique slot #
+		</doc>
+		<bitfield name="N" low="22" high="26" type="uint"/>
+	</reg32>
+	<reg32 offset="0x21ea" name="PC_VERTEX_REUSE_BLOCK_CNTL"/>
+	<reg32 offset="0x21ec" name="PC_PRIM_VTX_CNTL">
+		<doc>
+			STRIDE_IN_VPC: ALIGN(next_outloc - 8, 4) / 4
+			(but, in cases where you'd expect 1, the blob driver uses
+			2, so possibly 0 (no varying) or minimum of 2)
+		</doc>
+		<bitfield name="STRIDE_IN_VPC" low="0" high="4" type="uint"/>
+		<bitfield name="POLYMODE_FRONT_PTYPE" low="5" high="7" type="adreno_pa_su_sc_draw"/>
+		<bitfield name="POLYMODE_BACK_PTYPE" low="8" high="10" type="adreno_pa_su_sc_draw"/>
+		<bitfield name="POLYMODE_ENABLE" pos="12" type="boolean"/>
+		<bitfield name="PRIMITIVE_RESTART" pos="20" type="boolean"/>
+		<bitfield name="PROVOKING_VTX_LAST" pos="25" type="boolean"/>
+		<!-- PSIZE bit set if gl_PointSize written: -->
+		<bitfield name="PSIZE" pos="26" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x21ed" name="PC_RESTART_INDEX"/>
+
+	<!-- HLSQ registers -->
+	<bitset name="a3xx_hlsq_vs_fs_control_reg" inline="yes">
+		<bitfield name="CONSTLENGTH" low="0" high="9" type="uint"/>
+		<bitfield name="CONSTSTARTOFFSET" low="12" high="20" type="uint"/>
+		<bitfield name="INSTRLENGTH" low="24" high="31" type="uint"/>
+	</bitset>
+	<bitset name="a3xx_hlsq_const_vs_fs_presv_range_reg" inline="yes">
+		<!-- are these a3xx_regid?? -->
+		<bitfield name="STARTENTRY" low="0" high="8"/>
+		<bitfield name="ENDENTRY" low="16" high="24"/>
+	</bitset>
+
+	<reg32 offset="0x2200" name="HLSQ_CONTROL_0_REG">
+		<bitfield name="FSTHREADSIZE" low="4" high="5" type="a3xx_threadsize"/>
+		<bitfield name="FSSUPERTHREADENABLE" pos="6" type="boolean"/>
+		<bitfield name="COMPUTEMODE" pos="8" type="boolean"/>
+		<bitfield name="SPSHADERRESTART" pos="9" type="boolean"/>
+		<bitfield name="RESERVED2" pos="10" type="boolean"/>
+		<bitfield name="CYCLETIMEOUTLIMITVPC" low="12" high="23" type="uint"/>
+		<bitfield name="FSONLYTEX" pos="25" type="boolean"/>
+		<bitfield name="CHUNKDISABLE" pos="26" type="boolean"/>
+		<bitfield name="CONSTMODE" pos="27" type="uint"/>
+		<bitfield name="LAZYUPDATEDISABLE" pos="28" type="boolean"/>
+		<bitfield name="SPCONSTFULLUPDATE" pos="29" type="boolean"/>
+		<bitfield name="TPFULLUPDATE" pos="30" type="boolean"/>
+		<bitfield name="SINGLECONTEXT" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2201" name="HLSQ_CONTROL_1_REG">
+		<bitfield name="VSTHREADSIZE" low="6" high="7" type="a3xx_threadsize"/>
+		<bitfield name="VSSUPERTHREADENABLE" pos="8" type="boolean"/>
+		<bitfield name="FRAGCOORDXYREGID" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="FRAGCOORDZWREGID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0x2202" name="HLSQ_CONTROL_2_REG">
+		<bitfield name="FACENESSREGID" low="2" high="9" type="a3xx_regid"/>
+		<bitfield name="COVVALUEREGID" low="18" high="25" type="a3xx_regid"/>
+		<bitfield name="PRIMALLOCTHRESHOLD" low="26" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2203" name="HLSQ_CONTROL_3_REG">
+		<bitfield name="IJPERSPCENTERREGID" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="IJNONPERSPCENTERREGID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="IJPERSPCENTROIDREGID" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="IJNONPERSPCENTROIDREGID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0x2204" name="HLSQ_VS_CONTROL_REG" type="a3xx_hlsq_vs_fs_control_reg"/>
+	<reg32 offset="0x2205" name="HLSQ_FS_CONTROL_REG" type="a3xx_hlsq_vs_fs_control_reg"/>
+	<reg32 offset="0x2206" name="HLSQ_CONST_VSPRESV_RANGE_REG" type="a3xx_hlsq_const_vs_fs_presv_range_reg"/>
+	<reg32 offset="0x2207" name="HLSQ_CONST_FSPRESV_RANGE_REG" type="a3xx_hlsq_const_vs_fs_presv_range_reg"/>
+	<reg32 offset="0x220a" name="HLSQ_CL_NDRANGE_0_REG">
+		<bitfield name="WORKDIM" low="0" high="1" type="uint"/>
+		<bitfield name="LOCALSIZE0" low="2" high="11" type="uint"/>
+		<bitfield name="LOCALSIZE1" low="12" high="21" type="uint"/>
+		<bitfield name="LOCALSIZE2" low="22" high="31" type="uint"/>
+	</reg32>
+	<array offset="0x220b" name="HLSQ_CL_GLOBAL_WORK" stride="2" length="3">
+		<doc>indexed by dimension</doc>
+		<reg32 offset="0" name="SIZE" type="uint"/>
+		<reg32 offset="1" name="OFFSET" type="uint"/>
+	</array>
+	<reg32 offset="0x2211" name="HLSQ_CL_CONTROL_0_REG"/>
+	<reg32 offset="0x2212" name="HLSQ_CL_CONTROL_1_REG"/>
+	<reg32 offset="0x2214" name="HLSQ_CL_KERNEL_CONST_REG"/>
+	<array offset="0x2215" name="HLSQ_CL_KERNEL_GROUP" stride="1" length="3">
+		<doc>indexed by dimension, global_size / local_size</doc>
+		<reg32 offset="0" name="RATIO" type="uint"/>
+	</array>
+	<reg32 offset="0x2216" name="HLSQ_CL_KERNEL_GROUP_Y_REG" type="uint"/>
+	<reg32 offset="0x2217" name="HLSQ_CL_KERNEL_GROUP_Z_REG" type="uint"/>
+	<reg32 offset="0x221a" name="HLSQ_CL_WG_OFFSET_REG"/>
+
+	<!-- VFD registers -->
+	<reg32 offset="0x2240" name="VFD_CONTROL_0">
+		<doc>
+			TOTALATTRTOVS is # of attributes to vertex shader, in register
+			slots (ie. vec4+vec3 -> 7)
+		</doc>
+		<bitfield name="TOTALATTRTOVS" low="0" high="17" type="uint"/>
+		<bitfield name="PACKETSIZE" low="18" high="21" type="uint"/>
+		<doc>STRMDECINSTRCNT is # of VFD_DECODE_INSTR registers valid</doc>
+		<bitfield name="STRMDECINSTRCNT" low="22" high="26" type="uint"/>
+		<doc>STRMFETCHINSTRCNT is # of VFD_FETCH_INSTR registers valid</doc>
+		<bitfield name="STRMFETCHINSTRCNT" low="27" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2241" name="VFD_CONTROL_1">
+		<doc>MAXSTORAGE could be # of attributes/vbo's</doc>
+		<bitfield name="MAXSTORAGE" low="0" high="3" type="uint"/>
+		<bitfield name="MAXTHRESHOLD" low="4" high="7" type="uint"/>
+		<bitfield name="MINTHRESHOLD" low="8" high="11" type="uint"/>
+		<bitfield name="REGID4VTX" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="REGID4INST" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0x2242" name="VFD_INDEX_MIN" type="uint"/>
+	<reg32 offset="0x2243" name="VFD_INDEX_MAX" type="uint"/>
+	<reg32 offset="0x2244" name="VFD_INSTANCEID_OFFSET" type="uint"/>
+	<reg32 offset="0x2245" name="VFD_INDEX_OFFSET" type="uint"/>
+	<array offset="0x2246" name="VFD_FETCH" stride="2" length="16">
+		<reg32 offset="0x0" name="INSTR_0">
+			<bitfield name="FETCHSIZE" low="0" high="6" type="uint"/>
+			<bitfield name="BUFSTRIDE" low="7" high="15" type="uint"/>
+			<bitfield name="INSTANCED" pos="16" type="boolean"/>
+			<bitfield name="SWITCHNEXT" pos="17" type="boolean"/>
+			<bitfield name="INDEXCODE" low="18" high="23" type="uint"/>
+			<bitfield name="STEPRATE" low="24" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="0x1" name="INSTR_1"/>
+	</array>
+	<array offset="0x2266" name="VFD_DECODE" stride="1" length="16">
+		<reg32 offset="0x0" name="INSTR">
+			<bitfield name="WRITEMASK" low="0" high="3" type="hex"/>
+			<!-- not sure if this is a bit flag and another flag above it, or?? -->
+			<bitfield name="CONSTFILL" pos="4" type="boolean"/>
+			<bitfield name="FORMAT" low="6" high="11" type="a3xx_vtx_fmt"/>
+			<bitfield name="REGID" low="12" high="19" type="a3xx_regid"/>
+			<bitfield name="INT" pos="20" type="boolean"/>
+			<doc>SHIFTCNT appears to be size, ie. FLOAT_32_32_32 is 12, and BYTE_8 is 1</doc>
+			<bitfield name="SWAP" low="22" high="23" type="a3xx_color_swap"/>
+			<bitfield name="SHIFTCNT" low="24" high="28" type="uint"/>
+			<bitfield name="LASTCOMPVALID" pos="29" type="boolean"/>
+			<bitfield name="SWITCHNEXT" pos="30" type="boolean"/>
+		</reg32>
+	</array>
+	<reg32 offset="0x227e" name="VFD_VS_THREADING_THRESHOLD">
+		<bitfield name="REGID_THRESHOLD" low="0" high="3" type="uint"/>
+		<!-- <bitfield name="RESERVED6" low="4" high="7" type="uint"/> -->
+		<bitfield name="REGID_VTXCNT" low="8" high="15" type="a3xx_regid"/>
+	</reg32>
+
+	<!-- VPC registers -->
+	<reg32 offset="0x2280" name="VPC_ATTR">
+		<bitfield name="TOTALATTR" low="0" high="8" type="uint"/>
+		<!-- PSIZE bit set if gl_PointSize written: -->
+		<bitfield name="PSIZE" pos="9" type="boolean"/>
+		<bitfield name="THRDASSIGN" low="12" high="27" type="uint"/>
+		<bitfield name="LMSIZE" low="28" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2281" name="VPC_PACK">
+		<!-- these are always seem to be set to same as TOTALATTR -->
+		<bitfield name="NUMFPNONPOSVAR" low="8" high="15" type="uint"/>
+		<bitfield name="NUMNONPOSVSVAR" low="16" high="23" type="uint"/>
+	</reg32>
+	<!--
+		varying interpolate mode.  One field per scalar/component
+		(since varying slots are scalar, so things don't have to
+		be aligned to vec4).
+		4 regs * 16 scalar components each => 16 vec4
+	 -->
+	<array offset="0x2282" name="VPC_VARYING_INTERP" stride="1" length="4">
+		<reg32 offset="0x0" name="MODE">
+			<bitfield name="C0" low="0"  high="1"  type="a3xx_intp_mode"/>
+			<bitfield name="C1" low="2"  high="3"  type="a3xx_intp_mode"/>
+			<bitfield name="C2" low="4"  high="5"  type="a3xx_intp_mode"/>
+			<bitfield name="C3" low="6"  high="7"  type="a3xx_intp_mode"/>
+			<bitfield name="C4" low="8"  high="9"  type="a3xx_intp_mode"/>
+			<bitfield name="C5" low="10" high="11" type="a3xx_intp_mode"/>
+			<bitfield name="C6" low="12" high="13" type="a3xx_intp_mode"/>
+			<bitfield name="C7" low="14" high="15" type="a3xx_intp_mode"/>
+			<bitfield name="C8" low="16" high="17" type="a3xx_intp_mode"/>
+			<bitfield name="C9" low="18" high="19" type="a3xx_intp_mode"/>
+			<bitfield name="CA" low="20" high="21" type="a3xx_intp_mode"/>
+			<bitfield name="CB" low="22" high="23" type="a3xx_intp_mode"/>
+			<bitfield name="CC" low="24" high="25" type="a3xx_intp_mode"/>
+			<bitfield name="CD" low="26" high="27" type="a3xx_intp_mode"/>
+			<bitfield name="CE" low="28" high="29" type="a3xx_intp_mode"/>
+			<bitfield name="CF" low="30" high="31" type="a3xx_intp_mode"/>
+		</reg32>
+	</array>
+	<array offset="0x2286" name="VPC_VARYING_PS_REPL" stride="1" length="4">
+		<reg32 offset="0x0" name="MODE">
+			<bitfield name="C0" low="0"  high="1"  type="a3xx_repl_mode"/>
+			<bitfield name="C1" low="2"  high="3"  type="a3xx_repl_mode"/>
+			<bitfield name="C2" low="4"  high="5"  type="a3xx_repl_mode"/>
+			<bitfield name="C3" low="6"  high="7"  type="a3xx_repl_mode"/>
+			<bitfield name="C4" low="8"  high="9"  type="a3xx_repl_mode"/>
+			<bitfield name="C5" low="10" high="11" type="a3xx_repl_mode"/>
+			<bitfield name="C6" low="12" high="13" type="a3xx_repl_mode"/>
+			<bitfield name="C7" low="14" high="15" type="a3xx_repl_mode"/>
+			<bitfield name="C8" low="16" high="17" type="a3xx_repl_mode"/>
+			<bitfield name="C9" low="18" high="19" type="a3xx_repl_mode"/>
+			<bitfield name="CA" low="20" high="21" type="a3xx_repl_mode"/>
+			<bitfield name="CB" low="22" high="23" type="a3xx_repl_mode"/>
+			<bitfield name="CC" low="24" high="25" type="a3xx_repl_mode"/>
+			<bitfield name="CD" low="26" high="27" type="a3xx_repl_mode"/>
+			<bitfield name="CE" low="28" high="29" type="a3xx_repl_mode"/>
+			<bitfield name="CF" low="30" high="31" type="a3xx_repl_mode"/>
+		</reg32>
+	</array>
+	<reg32 offset="0x228a" name="VPC_VARY_CYLWRAP_ENABLE_0"/>
+	<reg32 offset="0x228b" name="VPC_VARY_CYLWRAP_ENABLE_1"/>
+
+	<!-- SP registers -->
+	<bitset name="a3xx_vs_fs_length_reg" inline="yes">
+		<bitfield name="SHADERLENGTH" low="0" high="31" type="uint"/>
+	</bitset>
+
+	<bitset name="sp_vs_fs_obj_offset_reg" inline="yes">
+		<bitfield name="FIRSTEXECINSTROFFSET" low="0" high="15" type="uint"/>
+		<doc>
+			From register spec:
+			SP_FS_OBJ_OFFSET_REG.CONSTOBJECTSTARTOFFSET [16:24]: Constant object
+			start offset in on chip RAM,
+			128bit aligned
+		</doc>
+		<bitfield name="CONSTOBJECTOFFSET" low="16" high="24" type="uint"/>
+		<bitfield name="SHADEROBJOFFSET" low="25" high="31" type="uint"/>
+	</bitset>
+
+	<reg32 offset="0x22c0" name="SP_SP_CTRL_REG">
+		<!-- this bit is set during resolve pass: -->
+		<bitfield name="RESOLVE" pos="16" type="boolean"/>
+		<bitfield name="CONSTMODE" pos="18" type="uint"/>
+		<bitfield name="BINNING" pos="19" type="boolean"/>
+		<bitfield name="SLEEPMODE" low="20" high="21" type="uint"/>
+		<!-- L0MODE==1 when oxiliForceSpL0ModeBuffer=1 -->
+		<bitfield name="L0MODE" low="22" high="23" type="uint"/>
+	</reg32>
+	<reg32 offset="0x22c4" name="SP_VS_CTRL_REG0">
+		<bitfield name="THREADMODE" pos="0" type="a3xx_threadmode"/>
+		<bitfield name="INSTRBUFFERMODE" pos="1" type="a3xx_instrbuffermode"/>
+		<!-- maybe CACHEINVALID is two bits?? -->
+		<bitfield name="CACHEINVALID" pos="2" type="boolean"/>
+		<bitfield name="ALUSCHMODE" pos="3" type="boolean"/>
+		<doc>
+			The full/half register footprint is in units of four components,
+			so if r0.x is used, that counts as all of r0.[xyzw] as used.
+			There are separate full/half register footprint values as the
+			full and half registers are independent (not overlapping).
+			Presumably the thread scheduler hardware allocates the full/half
+			register names from the actual physical register file and
+			handles the register renaming.
+		</doc>
+		<bitfield name="HALFREGFOOTPRINT" low="4" high="9" type="uint"/>
+		<bitfield name="FULLREGFOOTPRINT" low="10" high="15" type="uint"/>
+		<bitfield name="THREADSIZE" pos="20" type="a3xx_threadsize"/>
+		<bitfield name="SUPERTHREADMODE" pos="21" type="boolean"/>
+		<doc>
+			From regspec:
+			SP_FS_CTRL_REG0.FS_LENGTH [31:24]: FS length, unit = 256bits.
+			If bit31 is 1, it means overflow
+			or any long shader.
+		</doc>
+		<bitfield name="LENGTH" low="24" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x22c5" name="SP_VS_CTRL_REG1">
+		<bitfield name="CONSTLENGTH" low="0" high="9" type="uint"/>
+		<!--
+			not sure about full vs half const.. I can't get blob generate
+			something with a mediump/lowp uniform.
+		 -->
+		<bitfield name="CONSTFOOTPRINT" low="10" high="19" type="uint"/>
+		<bitfield name="INITIALOUTSTANDING" low="24" high="30" type="uint"/>
+	</reg32>
+	<reg32 offset="0x22c6" name="SP_VS_PARAM_REG">
+		<bitfield name="POSREGID" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="PSIZEREGID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="POS2DMODE" pos="16" type="boolean"/>
+		<bitfield name="TOTALVSOUTVAR" low="20" high="24" type="uint"/>
+	</reg32>
+	<array offset="0x22c7" name="SP_VS_OUT" stride="1" length="8">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="A_REGID" low="0" high="7" type="a3xx_regid"/>
+			<bitfield name="A_HALF" pos="8" type="boolean"/>
+			<bitfield name="A_COMPMASK" low="9" high="12" type="hex"/>
+			<bitfield name="B_REGID" low="16" high="23" type="a3xx_regid"/>
+			<bitfield name="B_HALF" pos="24" type="boolean"/>
+			<bitfield name="B_COMPMASK" low="25" high="28" type="hex"/>
+		</reg32>
+	</array>
+	<array offset="0x22d0" name="SP_VS_VPC_DST" stride="1" length="4">
+		<reg32 offset="0x0" name="REG">
+			<doc>
+				These seem to be offsets for storage of the varyings.
+				Always seems to start from 8, possibly loc 0 and 4
+				are for gl_Position and gl_PointSize?
+			</doc>
+			<bitfield name="OUTLOC0" low="0" high="6" type="uint"/>
+			<bitfield name="OUTLOC1" low="8" high="14" type="uint"/>
+			<bitfield name="OUTLOC2" low="16" high="22" type="uint"/>
+			<bitfield name="OUTLOC3" low="24" high="30" type="uint"/>
+		</reg32>
+	</array>
+	<reg32 offset="0x22d4" name="SP_VS_OBJ_OFFSET_REG" type="sp_vs_fs_obj_offset_reg"/>
+	<doc>
+		SP_VS_OBJ_START_REG contains pointer to the vertex shader program,
+		immediately followed by the binning shader program (although I
+		guess that is probably just re-using the same gpu buffer)
+	</doc>
+	<reg32 offset="0x22d5" name="SP_VS_OBJ_START_REG"/>
+	<reg32 offset="0x22d6" name="SP_VS_PVT_MEM_PARAM_REG">
+		<bitfield name="MEMSIZEPERITEM" low="0" high="7" shr="7">
+			<doc>The size of memory that ldp/stp can address, in 128 byte increments.</doc>
+		</bitfield>
+		<bitfield name="HWSTACKOFFSET" low="8" high="23" type="uint"/>
+		<bitfield name="HWSTACKSIZEPERTHREAD" low="24" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x22d7" name="SP_VS_PVT_MEM_ADDR_REG">
+		<bitfield name="BURSTLEN" low="0" high="4"/>
+		<bitfield name="SHADERSTARTADDRESS" shr="5" low="5" high="31"/>
+	</reg32>
+	<reg32 offset="0x22d8" name="SP_VS_PVT_MEM_SIZE_REG"/>
+	<reg32 offset="0x22df" name="SP_VS_LENGTH_REG" type="a3xx_vs_fs_length_reg"/>
+	<reg32 offset="0x22e0" name="SP_FS_CTRL_REG0">
+		<bitfield name="THREADMODE" pos="0" type="a3xx_threadmode"/>
+		<bitfield name="INSTRBUFFERMODE" pos="1" type="a3xx_instrbuffermode"/>
+		<!-- maybe CACHEINVALID is two bits?? -->
+		<bitfield name="CACHEINVALID" pos="2" type="boolean"/>
+		<bitfield name="ALUSCHMODE" pos="3" type="boolean"/>
+		<doc>
+			The full/half register footprint is in units of four components,
+			so if r0.x is used, that counts as all of r0.[xyzw] as used.
+			There are separate full/half register footprint values as the
+			full and half registers are independent (not overlapping).
+			Presumably the thread scheduler hardware allocates the full/half
+			register names from the actual physical register file and
+			handles the register renaming.
+		</doc>
+		<bitfield name="HALFREGFOOTPRINT" low="4" high="9" type="uint"/>
+		<bitfield name="FULLREGFOOTPRINT" low="10" high="15" type="uint"/>
+		<bitfield name="FSBYPASSENABLE" pos="17" type="boolean"/>
+		<bitfield name="INOUTREGOVERLAP" pos="18" type="boolean"/>
+		<bitfield name="OUTORDERED" pos="19" type="boolean"/>
+		<bitfield name="THREADSIZE" pos="20" type="a3xx_threadsize"/>
+		<bitfield name="SUPERTHREADMODE" pos="21" type="boolean"/>
+		<bitfield name="PIXLODENABLE" pos="22" type="boolean"/>
+		<bitfield name="COMPUTEMODE" pos="23" type="boolean"/>
+		<doc>
+			From regspec:
+			SP_FS_CTRL_REG0.FS_LENGTH [31:24]: FS length, unit = 256bits.
+			If bit31 is 1, it means overflow
+			or any long shader.
+		</doc>
+		<bitfield name="LENGTH" low="24" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x22e1" name="SP_FS_CTRL_REG1">
+		<bitfield name="CONSTLENGTH" low="0" high="9" type="uint"/>
+		<bitfield name="CONSTFOOTPRINT" low="10" high="19" type="uint"/>
+		<bitfield name="INITIALOUTSTANDING" low="20" high="23" type="uint"/>
+		<bitfield name="HALFPRECVAROFFSET" low="24" high="30" type="uint"/>
+	</reg32>
+	<reg32 offset="0x22e2" name="SP_FS_OBJ_OFFSET_REG" type="sp_vs_fs_obj_offset_reg"/>
+	<doc>SP_FS_OBJ_START_REG contains pointer to fragment shader program</doc>
+	<reg32 offset="0x22e3" name="SP_FS_OBJ_START_REG"/>
+	<reg32 offset="0x22e4" name="SP_FS_PVT_MEM_PARAM_REG">
+		<bitfield name="MEMSIZEPERITEM" low="0" high="7" type="uint"/>
+		<bitfield name="HWSTACKOFFSET" low="8" high="23" type="uint"/>
+		<bitfield name="HWSTACKSIZEPERTHREAD" low="24" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x22e5" name="SP_FS_PVT_MEM_ADDR_REG">
+		<bitfield name="BURSTLEN" low="0" high="4"/>
+		<bitfield name="SHADERSTARTADDRESS" shr="5" low="5" high="31"/>
+	</reg32>
+	<reg32 offset="0x22e6" name="SP_FS_PVT_MEM_SIZE_REG"/>
+	<reg32 offset="0x22e8" name="SP_FS_FLAT_SHAD_MODE_REG_0">
+		<doc>seems to be one bit per scalar, '1' for flat, '0' for smooth</doc>
+	</reg32>
+	<reg32 offset="0x22e9" name="SP_FS_FLAT_SHAD_MODE_REG_1">
+		<doc>seems to be one bit per scalar, '1' for flat, '0' for smooth</doc>
+	</reg32>
+	<reg32 offset="0x22ec" name="SP_FS_OUTPUT_REG">
+		<bitfield name="MRT" low="0" high="1" type="uint">
+			<doc>render targets - 1</doc>
+		</bitfield>
+		<bitfield name="DEPTH_ENABLE" pos="7" type="boolean"/>
+		<bitfield name="DEPTH_REGID" low="8" high="15" type="a3xx_regid"/>
+	</reg32>
+	<array offset="0x22f0" name="SP_FS_MRT" stride="1" length="4">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="REGID" low="0" high="7" type="a3xx_regid"/>
+			<bitfield name="HALF_PRECISION" pos="8" type="boolean"/>
+			<bitfield name="SINT" pos="10" type="boolean"/>
+			<bitfield name="UINT" pos="11" type="boolean"/>
+		</reg32>
+	</array>
+	<array offset="0x22f4" name="SP_FS_IMAGE_OUTPUT" stride="1" length="4">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="MRTFORMAT" low="0" high="5" type="a3xx_color_fmt"/>
+		</reg32>
+	</array>
+	<reg32 offset="0x22ff" name="SP_FS_LENGTH_REG" type="a3xx_vs_fs_length_reg"/>
+
+	<reg32 offset="0x2301" name="PA_SC_AA_CONFIG"/>
+	<!-- TPL1 registers -->
+	<!-- assume VS/FS_TEX_OFFSET is same -->
+	<bitset name="a3xx_tpl1_tp_vs_fs_tex_offset" inline="yes">
+		<bitfield name="SAMPLEROFFSET" low="0" high="7" type="uint"/>
+		<bitfield name="MEMOBJOFFSET" low="8" high="15" type="uint"/>
+		<!-- not sure the size of this: -->
+		<bitfield name="BASETABLEPTR" low="16" high="31" type="uint"/>
+	</bitset>
+	<reg32 offset="0x2340" name="TPL1_TP_VS_TEX_OFFSET" type="a3xx_tpl1_tp_vs_fs_tex_offset"/>
+	<reg32 offset="0x2341" name="TPL1_TP_VS_BORDER_COLOR_BASE_ADDR"/>
+	<reg32 offset="0x2342" name="TPL1_TP_FS_TEX_OFFSET" type="a3xx_tpl1_tp_vs_fs_tex_offset"/>
+	<reg32 offset="0x2343" name="TPL1_TP_FS_BORDER_COLOR_BASE_ADDR"/>
+
+	<!-- VBIF registers -->
+	<reg32 offset="0x3001" name="VBIF_CLKON"/>
+	<reg32 offset="0x300c" name="VBIF_FIXED_SORT_EN"/>
+	<reg32 offset="0x300d" name="VBIF_FIXED_SORT_SEL0"/>
+	<reg32 offset="0x300e" name="VBIF_FIXED_SORT_SEL1"/>
+	<reg32 offset="0x301c" name="VBIF_ABIT_SORT"/>
+	<reg32 offset="0x301d" name="VBIF_ABIT_SORT_CONF"/>
+	<reg32 offset="0x302a" name="VBIF_GATE_OFF_WRREQ_EN"/>
+	<reg32 offset="0x302c" name="VBIF_IN_RD_LIM_CONF0"/>
+	<reg32 offset="0x302d" name="VBIF_IN_RD_LIM_CONF1"/>
+	<reg32 offset="0x3030" name="VBIF_IN_WR_LIM_CONF0"/>
+	<reg32 offset="0x3031" name="VBIF_IN_WR_LIM_CONF1"/>
+	<reg32 offset="0x3034" name="VBIF_OUT_RD_LIM_CONF0"/>
+	<reg32 offset="0x3035" name="VBIF_OUT_WR_LIM_CONF0"/>
+	<reg32 offset="0x3036" name="VBIF_DDR_OUT_MAX_BURST"/>
+	<reg32 offset="0x303c" name="VBIF_ARB_CTL"/>
+	<reg32 offset="0x3049" name="VBIF_ROUND_ROBIN_QOS_ARB"/>
+	<reg32 offset="0x3058" name="VBIF_OUT_AXI_AMEMTYPE_CONF0"/>
+	<reg32 offset="0x305e" name="VBIF_OUT_AXI_AOOO_EN"/>
+	<reg32 offset="0x305f" name="VBIF_OUT_AXI_AOOO"/>
+
+	<bitset name="a3xx_vbif_perf_cnt" inline="yes">
+		<bitfield name="CNT0" pos="0" type="boolean"/>
+		<bitfield name="CNT1" pos="1" type="boolean"/>
+		<bitfield name="PWRCNT0" pos="2" type="boolean"/>
+		<bitfield name="PWRCNT1" pos="3" type="boolean"/>
+		<bitfield name="PWRCNT2" pos="4" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x3070" name="VBIF_PERF_CNT_EN" type="a3xx_vbif_perf_cnt"/>
+	<reg32 offset="0x3071" name="VBIF_PERF_CNT_CLR" type="a3xx_vbif_perf_cnt"/>
+	<reg32 offset="0x3072" name="VBIF_PERF_CNT_SEL"/>
+	<reg32 offset="0x3073" name="VBIF_PERF_CNT0_LO"/>
+	<reg32 offset="0x3074" name="VBIF_PERF_CNT0_HI"/>
+	<reg32 offset="0x3075" name="VBIF_PERF_CNT1_LO"/>
+	<reg32 offset="0x3076" name="VBIF_PERF_CNT1_HI"/>
+	<reg32 offset="0x3077" name="VBIF_PERF_PWR_CNT0_LO"/>
+	<reg32 offset="0x3078" name="VBIF_PERF_PWR_CNT0_HI"/>
+	<reg32 offset="0x3079" name="VBIF_PERF_PWR_CNT1_LO"/>
+	<reg32 offset="0x307a" name="VBIF_PERF_PWR_CNT1_HI"/>
+	<reg32 offset="0x307b" name="VBIF_PERF_PWR_CNT2_LO"/>
+	<reg32 offset="0x307c" name="VBIF_PERF_PWR_CNT2_HI"/>
+
+
+	<reg32 offset="0x0c01" name="VSC_BIN_SIZE">
+		<bitfield name="WIDTH" low="0" high="4" shr="5" type="uint"/>
+		<bitfield name="HEIGHT" low="5" high="9" shr="5" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x0c02" name="VSC_SIZE_ADDRESS"/>
+	<array offset="0x0c06" name="VSC_PIPE" stride="3" length="8">
+		<reg32 offset="0x0" name="CONFIG">
+			<doc>
+				Configures the mapping between VSC_PIPE buffer and
+				bin, X/Y specify the bin index in the horiz/vert
+				direction (0,0 is upper left, 0,1 is leftmost bin
+				on second row, and so on).  W/H specify the number
+				of bins assigned to this VSC_PIPE in the horiz/vert
+				dimension.
+			</doc>
+			<bitfield name="X" low="0" high="9" type="uint"/>
+			<bitfield name="Y" low="10" high="19" type="uint"/>
+			<bitfield name="W" low="20" high="23" type="uint"/>
+			<bitfield name="H" low="24" high="27" type="uint"/>
+		</reg32>
+		<reg32 offset="0x1" name="DATA_ADDRESS"/>
+		<reg32 offset="0x2" name="DATA_LENGTH"/>
+	</array>
+	<reg32 offset="0x0c3c" name="VSC_BIN_CONTROL">
+		<doc>seems to be set to 0x00000001 during binning pass</doc>
+		<bitfield name="BINNING_ENABLE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0c3d" name="UNKNOWN_0C3D">
+		<doc>seems to be always set to 0x00000001</doc>
+	</reg32>
+	<reg32 offset="0x0c48" name="PC_PERFCOUNTER0_SELECT" type="a3xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0c49" name="PC_PERFCOUNTER1_SELECT" type="a3xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0c4a" name="PC_PERFCOUNTER2_SELECT" type="a3xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0c4b" name="PC_PERFCOUNTER3_SELECT" type="a3xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0c81" name="GRAS_TSE_DEBUG_ECO">
+		<doc>seems to be always set to 0x00000001</doc>
+	</reg32>
+
+	<reg32 offset="0x0c88" name="GRAS_PERFCOUNTER0_SELECT" type="a3xx_gras_tse_perfcounter_select"/>
+	<reg32 offset="0x0c89" name="GRAS_PERFCOUNTER1_SELECT" type="a3xx_gras_tse_perfcounter_select"/>
+	<reg32 offset="0x0c8a" name="GRAS_PERFCOUNTER2_SELECT" type="a3xx_gras_ras_perfcounter_select"/>
+	<reg32 offset="0x0c8b" name="GRAS_PERFCOUNTER3_SELECT" type="a3xx_gras_ras_perfcounter_select"/>
+	<array offset="0x0ca0" name="GRAS_CL_USER_PLANE" stride="4" length="6">
+		<reg32 offset="0x0" name="X"/>
+		<reg32 offset="0x1" name="Y"/>
+		<reg32 offset="0x2" name="Z"/>
+		<reg32 offset="0x3" name="W"/>
+	</array>
+	<reg32 offset="0x0cc0" name="RB_GMEM_BASE_ADDR"/>
+	<reg32 offset="0x0cc1" name="RB_DEBUG_ECO_CONTROLS_ADDR"/>
+	<reg32 offset="0x0cc6" name="RB_PERFCOUNTER0_SELECT" type="a3xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cc7" name="RB_PERFCOUNTER1_SELECT" type="a3xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0ce0" name="RB_FRAME_BUFFER_DIMENSION">
+		<bitfield name="WIDTH" low="0" high="13" type="uint"/>
+		<bitfield name="HEIGHT" low="14" high="27" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0e00" name="HLSQ_PERFCOUNTER0_SELECT" type="a3xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e01" name="HLSQ_PERFCOUNTER1_SELECT" type="a3xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e02" name="HLSQ_PERFCOUNTER2_SELECT" type="a3xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e03" name="HLSQ_PERFCOUNTER3_SELECT" type="a3xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e04" name="HLSQ_PERFCOUNTER4_SELECT" type="a3xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e05" name="HLSQ_PERFCOUNTER5_SELECT" type="a3xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e43" name="UNKNOWN_0E43">
+		<doc>seems to be always set to 0x00000001</doc>
+	</reg32>
+	<reg32 offset="0x0e44" name="VFD_PERFCOUNTER0_SELECT" type="a3xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e45" name="VFD_PERFCOUNTER1_SELECT" type="a3xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e61" name="VPC_VPC_DEBUG_RAM_SEL"/>
+	<reg32 offset="0x0e62" name="VPC_VPC_DEBUG_RAM_READ"/>
+	<reg32 offset="0x0e64" name="VPC_PERFCOUNTER0_SELECT" type="a3xx_vpc_perfcounter_select"/>
+	<reg32 offset="0x0e65" name="VPC_PERFCOUNTER1_SELECT" type="a3xx_vpc_perfcounter_select"/>
+	<reg32 offset="0x0e82" name="UCHE_CACHE_MODE_CONTROL_REG"/>
+	<reg32 offset="0x0e84" name="UCHE_PERFCOUNTER0_SELECT" type="a3xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0e85" name="UCHE_PERFCOUNTER1_SELECT" type="a3xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0e86" name="UCHE_PERFCOUNTER2_SELECT" type="a3xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0e87" name="UCHE_PERFCOUNTER3_SELECT" type="a3xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0e88" name="UCHE_PERFCOUNTER4_SELECT" type="a3xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0e89" name="UCHE_PERFCOUNTER5_SELECT" type="a3xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0ea0" name="UCHE_CACHE_INVALIDATE0_REG">
+		<!-- might be shifted right by 5, assuming 32byte cache line size.. -->
+		<bitfield name="ADDR" low="0" high="27" type="hex"/>
+	</reg32>
+	<reg32 offset="0x0ea1" name="UCHE_CACHE_INVALIDATE1_REG">
+		<!-- might be shifted right by 5, assuming 32byte cache line size.. -->
+		<bitfield name="ADDR" low="0" high="27" type="hex"/>
+		<!-- I'd assume 2 bits, for FLUSH/INVALIDATE/CLEAN? -->
+		<bitfield name="OPCODE" low="28" high="29" type="a3xx_cache_opcode"/>
+		<bitfield name="ENTIRE_CACHE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0ea6" name="UNKNOWN_0EA6"/>
+	<reg32 offset="0x0ec4" name="SP_PERFCOUNTER0_SELECT" type="a3xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ec5" name="SP_PERFCOUNTER1_SELECT" type="a3xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ec6" name="SP_PERFCOUNTER2_SELECT" type="a3xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ec7" name="SP_PERFCOUNTER3_SELECT" type="a3xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ec8" name="SP_PERFCOUNTER4_SELECT" type="a3xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ec9" name="SP_PERFCOUNTER5_SELECT" type="a3xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0eca" name="SP_PERFCOUNTER6_SELECT" type="a3xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ecb" name="SP_PERFCOUNTER7_SELECT" type="a3xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ee0" name="UNKNOWN_0EE0">
+		<doc>seems to be always set to 0x00000003</doc>
+	</reg32>
+	<reg32 offset="0x0f03" name="UNKNOWN_0F03">
+		<doc>seems to be always set to 0x00000001</doc>
+	</reg32>
+	<reg32 offset="0x0f04" name="TP_PERFCOUNTER0_SELECT" type="a3xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f05" name="TP_PERFCOUNTER1_SELECT" type="a3xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f06" name="TP_PERFCOUNTER2_SELECT" type="a3xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f07" name="TP_PERFCOUNTER3_SELECT" type="a3xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f08" name="TP_PERFCOUNTER4_SELECT" type="a3xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f09" name="TP_PERFCOUNTER5_SELECT" type="a3xx_tp_perfcounter_select"/>
+
+	<!-- this seems to be the register that CP_RUN_OPENCL writes: -->
+	<reg32 offset="0x21f0" name="VGT_CL_INITIATOR"/>
+
+	<!-- seems to be same as a2xx according to fwdump.. -->
+	<reg32 offset="0x21f9" name="VGT_EVENT_INITIATOR"/>
+	<reg32 offset="0x21fc" name="VGT_DRAW_INITIATOR" type="vgt_draw_initiator"/>
+	<reg32 offset="0x21fd" name="VGT_IMMED_DATA"/>
+</domain>
+
+<domain name="A3XX_TEX_SAMP" width="32">
+	<doc>Texture sampler dwords</doc>
+	<enum name="a3xx_tex_filter">
+		<value name="A3XX_TEX_NEAREST" value="0"/>
+		<value name="A3XX_TEX_LINEAR" value="1"/>
+		<value name="A3XX_TEX_ANISO" value="2"/>
+	</enum>
+	<enum name="a3xx_tex_clamp">
+		<value name="A3XX_TEX_REPEAT" value="0"/>
+		<value name="A3XX_TEX_CLAMP_TO_EDGE" value="1"/>
+		<value name="A3XX_TEX_MIRROR_REPEAT" value="2"/>
+		<value name="A3XX_TEX_CLAMP_TO_BORDER" value="3"/>
+		<value name="A3XX_TEX_MIRROR_CLAMP" value="4"/>
+	</enum>
+	<enum name="a3xx_tex_aniso">
+		<value name="A3XX_TEX_ANISO_1" value="0"/>
+		<value name="A3XX_TEX_ANISO_2" value="1"/>
+		<value name="A3XX_TEX_ANISO_4" value="2"/>
+		<value name="A3XX_TEX_ANISO_8" value="3"/>
+		<value name="A3XX_TEX_ANISO_16" value="4"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="CLAMPENABLE" pos="0" type="boolean"/>
+		<bitfield name="MIPFILTER_LINEAR" pos="1" type="boolean"/>
+		<bitfield name="XY_MAG" low="2" high="3" type="a3xx_tex_filter"/>
+		<bitfield name="XY_MIN" low="4" high="5" type="a3xx_tex_filter"/>
+		<bitfield name="WRAP_S" low="6" high="8" type="a3xx_tex_clamp"/>
+		<bitfield name="WRAP_T" low="9" high="11" type="a3xx_tex_clamp"/>
+		<bitfield name="WRAP_R" low="12" high="14" type="a3xx_tex_clamp"/>
+		<bitfield name="ANISO" low="15" high="17" type="a3xx_tex_aniso"/>
+		<bitfield name="COMPARE_FUNC" low="20" high="22" type="adreno_compare_func"/>
+		<bitfield name="CUBEMAPSEAMLESSFILTOFF" pos="24" type="boolean"/>
+		<!-- UNNORM_COORDS == CLK_NORMALIZED_COORDS_FALSE -->
+		<bitfield name="UNNORM_COORDS" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="LOD_BIAS" low="0" high="10" type="fixed" radix="6"/>
+		<bitfield name="MAX_LOD" low="12" high="21" type="ufixed" radix="6"/>
+		<bitfield name="MIN_LOD" low="22" high="31" type="ufixed" radix="6"/>
+	</reg32>
+</domain>
+
+<domain name="A3XX_TEX_CONST" width="32">
+	<doc>Texture constant dwords</doc>
+	<enum name="a3xx_tex_swiz">
+		<!-- same as a2xx? -->
+		<value name="A3XX_TEX_X" value="0"/>
+		<value name="A3XX_TEX_Y" value="1"/>
+		<value name="A3XX_TEX_Z" value="2"/>
+		<value name="A3XX_TEX_W" value="3"/>
+		<value name="A3XX_TEX_ZERO" value="4"/>
+		<value name="A3XX_TEX_ONE" value="5"/>
+	</enum>
+	<enum name="a3xx_tex_type">
+		<value name="A3XX_TEX_1D" value="0"/>
+		<value name="A3XX_TEX_2D" value="1"/>
+		<value name="A3XX_TEX_CUBE" value="2"/>
+		<value name="A3XX_TEX_3D" value="3"/>
+	</enum>
+	<enum name="a3xx_tex_msaa">
+		<value name="A3XX_TPL1_MSAA1X" value="0"/>
+		<value name="A3XX_TPL1_MSAA2X" value="1"/>
+		<value name="A3XX_TPL1_MSAA4X" value="2"/>
+		<value name="A3XX_TPL1_MSAA8X" value="3"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="TILE_MODE" low="0" high="1" type="a3xx_tile_mode"/>
+		<bitfield name="SRGB" pos="2" type="boolean"/>
+		<bitfield name="SWIZ_X" low="4" high="6" type="a3xx_tex_swiz"/>
+		<bitfield name="SWIZ_Y" low="7" high="9" type="a3xx_tex_swiz"/>
+		<bitfield name="SWIZ_Z" low="10" high="12" type="a3xx_tex_swiz"/>
+		<bitfield name="SWIZ_W" low="13" high="15" type="a3xx_tex_swiz"/>
+		<bitfield name="MIPLVLS" low="16" high="19" type="uint"/>
+		<bitfield name="MSAATEX" low="20" high="21" type="a3xx_tex_msaa"/>
+		<bitfield name="FMT" low="22" high="28" type="a3xx_tex_fmt"/>
+		<bitfield name="NOCONVERT" pos="29" type="boolean"/>
+		<bitfield name="TYPE" low="30" high="31" type="a3xx_tex_type"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="HEIGHT" low="0" high="13" type="uint"/>
+		<bitfield name="WIDTH" low="14" high="27" type="uint"/>
+		<!-- minimum pitch (for mipmap levels): log2(pitchalign / 16) -->
+		<bitfield name="PITCHALIGN" low="28" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<doc>INDX is index of texture address(es) in MIPMAP state block</doc>
+		<bitfield name="INDX" low="0" high="8" type="uint"/>
+		<doc>Pitch in bytes (so actually stride)</doc>
+		<bitfield name="PITCH" low="12" high="29" type="uint"/>
+		<doc>SWAP bit is set for BGRA instead of RGBA</doc>
+		<bitfield name="SWAP" low="30" high="31" type="a3xx_color_swap"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<!--
+		Update: the two LAYERSZn seem not to be the same thing.
+		According to Ilia's experimentation the first one goes up
+		to at *least* bit 14..
+		 -->
+		<bitfield name="LAYERSZ1" low="0" high="16" shr="12" type="uint"/>
+		<bitfield name="DEPTH" low="17" high="27" type="uint"/>
+		<bitfield name="LAYERSZ2" low="28" high="31" shr="12" type="uint"/>
+	</reg32>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/adreno/a4xx.xml b/drivers/gpu/drm/msm/registers/adreno/a4xx.xml
new file mode 100644
index 000000000000..69a9f9b02bc9
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a4xx.xml
@@ -0,0 +1,2409 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+<import file="adreno/adreno_common.xml"/>
+<import file="adreno/adreno_pm4.xml"/>
+
+<enum name="a4xx_color_fmt">
+	<value name="RB4_A8_UNORM" value="0x01"/>
+	<value name="RB4_R8_UNORM" value="0x02"/>
+	<value name="RB4_R8_SNORM" value="0x03"/>
+	<value name="RB4_R8_UINT" value="0x04"/>
+	<value name="RB4_R8_SINT" value="0x05"/>
+
+	<value name="RB4_R4G4B4A4_UNORM" value="0x08"/>
+	<value name="RB4_R5G5B5A1_UNORM" value="0x0a"/>
+	<value name="RB4_R5G6B5_UNORM" value="0x0e"/>
+	<value name="RB4_R8G8_UNORM" value="0x0f"/>
+	<value name="RB4_R8G8_SNORM" value="0x10"/>
+	<value name="RB4_R8G8_UINT" value="0x11"/>
+	<value name="RB4_R8G8_SINT" value="0x12"/>
+	<value name="RB4_R16_UNORM" value="0x13"/>
+	<value name="RB4_R16_SNORM" value="0x14"/>
+	<value name="RB4_R16_FLOAT" value="0x15"/>
+	<value name="RB4_R16_UINT" value="0x16"/>
+	<value name="RB4_R16_SINT" value="0x17"/>
+
+	<value name="RB4_R8G8B8_UNORM" value="0x19"/>
+
+	<value name="RB4_R8G8B8A8_UNORM" value="0x1a"/>
+	<value name="RB4_R8G8B8A8_SNORM" value="0x1c"/>
+	<value name="RB4_R8G8B8A8_UINT" value="0x1d"/>
+	<value name="RB4_R8G8B8A8_SINT" value="0x1e"/>
+	<value name="RB4_R10G10B10A2_UNORM" value="0x1f"/>
+	<value name="RB4_R10G10B10A2_UINT" value="0x22"/>
+	<value name="RB4_R11G11B10_FLOAT" value="0x27"/>
+	<value name="RB4_R16G16_UNORM" value="0x28"/>
+	<value name="RB4_R16G16_SNORM" value="0x29"/>
+	<value name="RB4_R16G16_FLOAT" value="0x2a"/>
+	<value name="RB4_R16G16_UINT" value="0x2b"/>
+	<value name="RB4_R16G16_SINT" value="0x2c"/>
+	<value name="RB4_R32_FLOAT" value="0x2d"/>
+	<value name="RB4_R32_UINT" value="0x2e"/>
+	<value name="RB4_R32_SINT" value="0x2f"/>
+
+	<value name="RB4_R16G16B16A16_UNORM" value="0x34"/>
+	<value name="RB4_R16G16B16A16_SNORM" value="0x35"/>
+	<value name="RB4_R16G16B16A16_FLOAT" value="0x36"/>
+	<value name="RB4_R16G16B16A16_UINT" value="0x37"/>
+	<value name="RB4_R16G16B16A16_SINT" value="0x38"/>
+	<value name="RB4_R32G32_FLOAT" value="0x39"/>
+	<value name="RB4_R32G32_UINT" value="0x3a"/>
+	<value name="RB4_R32G32_SINT" value="0x3b"/>
+
+	<value name="RB4_R32G32B32A32_FLOAT" value="0x3c"/>
+	<value name="RB4_R32G32B32A32_UINT" value="0x3d"/>
+	<value name="RB4_R32G32B32A32_SINT" value="0x3e"/>
+
+	<value name="RB4_NONE" value="0xff"/>
+</enum>
+
+<enum name="a4xx_tile_mode">
+	<value name="TILE4_LINEAR" value="0"/>
+	<value name="TILE4_2" value="2"/>
+	<value name="TILE4_3" value="3"/>
+</enum>
+
+<enum name="a4xx_vtx_fmt" prefix="chipset">
+	<!-- hmm, shifted one compared to a3xx?!?  -->
+	<value name="VFMT4_32_FLOAT" value="0x1"/>
+	<value name="VFMT4_32_32_FLOAT" value="0x2"/>
+	<value name="VFMT4_32_32_32_FLOAT" value="0x3"/>
+	<value name="VFMT4_32_32_32_32_FLOAT" value="0x4"/>
+
+	<value name="VFMT4_16_FLOAT" value="0x5"/>
+	<value name="VFMT4_16_16_FLOAT" value="0x6"/>
+	<value name="VFMT4_16_16_16_FLOAT" value="0x7"/>
+	<value name="VFMT4_16_16_16_16_FLOAT" value="0x8"/>
+
+	<value name="VFMT4_32_FIXED" value="0x9"/>
+	<value name="VFMT4_32_32_FIXED" value="0xa"/>
+	<value name="VFMT4_32_32_32_FIXED" value="0xb"/>
+	<value name="VFMT4_32_32_32_32_FIXED" value="0xc"/>
+
+	<value name="VFMT4_11_11_10_FLOAT" value="0xd"/>
+
+	<!-- beyond here it does not appear to be shifted -->
+	<value name="VFMT4_16_SINT" value="0x10"/>
+	<value name="VFMT4_16_16_SINT" value="0x11"/>
+	<value name="VFMT4_16_16_16_SINT" value="0x12"/>
+	<value name="VFMT4_16_16_16_16_SINT" value="0x13"/>
+	<value name="VFMT4_16_UINT" value="0x14"/>
+	<value name="VFMT4_16_16_UINT" value="0x15"/>
+	<value name="VFMT4_16_16_16_UINT" value="0x16"/>
+	<value name="VFMT4_16_16_16_16_UINT" value="0x17"/>
+	<value name="VFMT4_16_SNORM" value="0x18"/>
+	<value name="VFMT4_16_16_SNORM" value="0x19"/>
+	<value name="VFMT4_16_16_16_SNORM" value="0x1a"/>
+	<value name="VFMT4_16_16_16_16_SNORM" value="0x1b"/>
+	<value name="VFMT4_16_UNORM" value="0x1c"/>
+	<value name="VFMT4_16_16_UNORM" value="0x1d"/>
+	<value name="VFMT4_16_16_16_UNORM" value="0x1e"/>
+	<value name="VFMT4_16_16_16_16_UNORM" value="0x1f"/>
+
+	<value name="VFMT4_32_UINT" value="0x20"/>
+	<value name="VFMT4_32_32_UINT" value="0x21"/>
+	<value name="VFMT4_32_32_32_UINT" value="0x22"/>
+	<value name="VFMT4_32_32_32_32_UINT" value="0x23"/>
+	<value name="VFMT4_32_SINT" value="0x24"/>
+	<value name="VFMT4_32_32_SINT" value="0x25"/>
+	<value name="VFMT4_32_32_32_SINT" value="0x26"/>
+	<value name="VFMT4_32_32_32_32_SINT" value="0x27"/>
+
+	<value name="VFMT4_8_UINT" value="0x28"/>
+	<value name="VFMT4_8_8_UINT" value="0x29"/>
+	<value name="VFMT4_8_8_8_UINT" value="0x2a"/>
+	<value name="VFMT4_8_8_8_8_UINT" value="0x2b"/>
+	<value name="VFMT4_8_UNORM" value="0x2c"/>
+	<value name="VFMT4_8_8_UNORM" value="0x2d"/>
+	<value name="VFMT4_8_8_8_UNORM" value="0x2e"/>
+	<value name="VFMT4_8_8_8_8_UNORM" value="0x2f"/>
+	<value name="VFMT4_8_SINT" value="0x30"/>
+	<value name="VFMT4_8_8_SINT" value="0x31"/>
+	<value name="VFMT4_8_8_8_SINT" value="0x32"/>
+	<value name="VFMT4_8_8_8_8_SINT" value="0x33"/>
+	<value name="VFMT4_8_SNORM" value="0x34"/>
+	<value name="VFMT4_8_8_SNORM" value="0x35"/>
+	<value name="VFMT4_8_8_8_SNORM" value="0x36"/>
+	<value name="VFMT4_8_8_8_8_SNORM" value="0x37"/>
+
+	<value name="VFMT4_10_10_10_2_UINT" value="0x38"/>
+	<value name="VFMT4_10_10_10_2_UNORM" value="0x39"/>
+	<value name="VFMT4_10_10_10_2_SINT" value="0x3a"/>
+	<value name="VFMT4_10_10_10_2_SNORM" value="0x3b"/>
+	<value name="VFMT4_2_10_10_10_UINT" value="0x3c"/>
+	<value name="VFMT4_2_10_10_10_UNORM" value="0x3d"/>
+	<value name="VFMT4_2_10_10_10_SINT" value="0x3e"/>
+	<value name="VFMT4_2_10_10_10_SNORM" value="0x3f"/>
+
+	<value name="VFMT4_NONE" value="0xff"/>
+</enum>
+
+<enum name="a4xx_tex_fmt">
+	<!-- 0x00 .. 0x02 -->
+
+	<!-- 8-bit formats -->
+	<value name="TFMT4_A8_UNORM" value="0x03"/>
+	<value name="TFMT4_8_UNORM"  value="0x04"/>
+	<value name="TFMT4_8_SNORM"  value="0x05"/>
+	<value name="TFMT4_8_UINT"   value="0x06"/>
+	<value name="TFMT4_8_SINT"   value="0x07"/>
+
+	<!-- 16-bit formats -->
+	<value name="TFMT4_4_4_4_4_UNORM" value="0x08"/>
+	<value name="TFMT4_5_5_5_1_UNORM" value="0x09"/>
+	<!-- 0x0a -->
+	<value name="TFMT4_5_6_5_UNORM"   value="0x0b"/>
+
+	<!-- 0x0c -->
+
+	<value name="TFMT4_L8_A8_UNORM" value="0x0d"/>
+	<value name="TFMT4_8_8_UNORM"   value="0x0e"/>
+	<value name="TFMT4_8_8_SNORM"   value="0x0f"/>
+	<value name="TFMT4_8_8_UINT"    value="0x10"/>
+	<value name="TFMT4_8_8_SINT"    value="0x11"/>
+
+	<value name="TFMT4_16_UNORM" value="0x12"/>
+	<value name="TFMT4_16_SNORM" value="0x13"/>
+	<value name="TFMT4_16_FLOAT" value="0x14"/>
+	<value name="TFMT4_16_UINT"  value="0x15"/>
+	<value name="TFMT4_16_SINT"  value="0x16"/>
+
+	<!-- 0x17 .. 0x1b -->
+
+	<!-- 32-bit formats -->
+	<value name="TFMT4_8_8_8_8_UNORM" value="0x1c"/>
+	<value name="TFMT4_8_8_8_8_SNORM" value="0x1d"/>
+	<value name="TFMT4_8_8_8_8_UINT"  value="0x1e"/>
+	<value name="TFMT4_8_8_8_8_SINT"  value="0x1f"/>
+
+	<value name="TFMT4_9_9_9_E5_FLOAT"   value="0x20"/>
+	<value name="TFMT4_10_10_10_2_UNORM" value="0x21"/>
+	<value name="TFMT4_10_10_10_2_UINT"  value="0x22"/>
+	<!-- 0x23 .. 0x24 -->
+	<value name="TFMT4_11_11_10_FLOAT"   value="0x25"/>
+
+	<value name="TFMT4_16_16_UNORM" value="0x26"/>
+	<value name="TFMT4_16_16_SNORM" value="0x27"/>
+	<value name="TFMT4_16_16_FLOAT" value="0x28"/>
+	<value name="TFMT4_16_16_UINT"  value="0x29"/>
+	<value name="TFMT4_16_16_SINT"  value="0x2a"/>
+
+	<value name="TFMT4_32_FLOAT" value="0x2b"/>
+	<value name="TFMT4_32_UINT"  value="0x2c"/>
+	<value name="TFMT4_32_SINT"  value="0x2d"/>
+
+	<!-- 0x2e .. 0x32 -->
+
+	<!-- 64-bit formats -->
+	<value name="TFMT4_16_16_16_16_UNORM" value="0x33"/>
+	<value name="TFMT4_16_16_16_16_SNORM" value="0x34"/>
+	<value name="TFMT4_16_16_16_16_FLOAT" value="0x35"/>
+	<value name="TFMT4_16_16_16_16_UINT"  value="0x36"/>
+	<value name="TFMT4_16_16_16_16_SINT"  value="0x37"/>
+
+	<value name="TFMT4_32_32_FLOAT" value="0x38"/>
+	<value name="TFMT4_32_32_UINT"  value="0x39"/>
+	<value name="TFMT4_32_32_SINT"  value="0x3a"/>
+
+	<!-- 96-bit formats -->
+	<value name="TFMT4_32_32_32_FLOAT" value="0x3b"/>
+	<value name="TFMT4_32_32_32_UINT"  value="0x3c"/>
+	<value name="TFMT4_32_32_32_SINT"  value="0x3d"/>
+
+	<!-- 0x3e -->
+
+	<!-- 128-bit formats -->
+	<value name="TFMT4_32_32_32_32_FLOAT" value="0x3f"/>
+	<value name="TFMT4_32_32_32_32_UINT"  value="0x40"/>
+	<value name="TFMT4_32_32_32_32_SINT"  value="0x41"/>
+
+	<!-- 0x42 .. 0x46 -->
+	<value name="TFMT4_X8Z24_UNORM" value="0x47"/>
+	<!-- 0x48 .. 0x55 -->
+
+	<!-- compressed formats -->
+	<value name="TFMT4_DXT1"                  value="0x56"/>
+	<value name="TFMT4_DXT3"                  value="0x57"/>
+	<value name="TFMT4_DXT5"                  value="0x58"/>
+	<!-- 0x59 -->
+	<value name="TFMT4_RGTC1_UNORM"           value="0x5a"/>
+	<value name="TFMT4_RGTC1_SNORM"           value="0x5b"/>
+	<!-- 0x5c .. 0x5d -->
+	<value name="TFMT4_RGTC2_UNORM"           value="0x5e"/>
+	<value name="TFMT4_RGTC2_SNORM"           value="0x5f"/>
+	<!-- 0x60 -->
+	<value name="TFMT4_BPTC_UFLOAT"           value="0x61"/>
+	<value name="TFMT4_BPTC_FLOAT"            value="0x62"/>
+	<value name="TFMT4_BPTC"                  value="0x63"/>
+	<value name="TFMT4_ATC_RGB"               value="0x64"/>
+	<value name="TFMT4_ATC_RGBA_EXPLICIT"     value="0x65"/>
+	<value name="TFMT4_ATC_RGBA_INTERPOLATED" value="0x66"/>
+	<value name="TFMT4_ETC2_RG11_UNORM"       value="0x67"/>
+	<value name="TFMT4_ETC2_RG11_SNORM"       value="0x68"/>
+	<value name="TFMT4_ETC2_R11_UNORM"        value="0x69"/>
+	<value name="TFMT4_ETC2_R11_SNORM"        value="0x6a"/>
+	<value name="TFMT4_ETC1"                  value="0x6b"/>
+	<value name="TFMT4_ETC2_RGB8"             value="0x6c"/>
+	<value name="TFMT4_ETC2_RGBA8"            value="0x6d"/>
+	<value name="TFMT4_ETC2_RGB8A1"           value="0x6e"/>
+	<value name="TFMT4_ASTC_4x4"              value="0x6f"/>
+	<value name="TFMT4_ASTC_5x4"              value="0x70"/>
+	<value name="TFMT4_ASTC_5x5"              value="0x71"/>
+	<value name="TFMT4_ASTC_6x5"              value="0x72"/>
+	<value name="TFMT4_ASTC_6x6"              value="0x73"/>
+	<value name="TFMT4_ASTC_8x5"              value="0x74"/>
+	<value name="TFMT4_ASTC_8x6"              value="0x75"/>
+	<value name="TFMT4_ASTC_8x8"              value="0x76"/>
+	<value name="TFMT4_ASTC_10x5"             value="0x77"/>
+	<value name="TFMT4_ASTC_10x6"             value="0x78"/>
+	<value name="TFMT4_ASTC_10x8"             value="0x79"/>
+	<value name="TFMT4_ASTC_10x10"            value="0x7a"/>
+	<value name="TFMT4_ASTC_12x10"            value="0x7b"/>
+	<value name="TFMT4_ASTC_12x12"            value="0x7c"/>
+	<!-- 0x7d .. 0x7f -->
+
+	<value name="TFMT4_NONE"                  value="0xff"/>
+</enum>
+
+<enum name="a4xx_depth_format">
+	<value name="DEPTH4_NONE" value="0"/>
+	<value name="DEPTH4_16" value="1"/>
+	<value name="DEPTH4_24_8" value="2"/>
+	<value name="DEPTH4_32" value="3"/>
+</enum>
+
+<!--
+NOTE counters extracted from test-perf log with the following awful
+script:
+##################
+#!/bin/bash
+
+log=$1
+
+grep -F "counter
+countable
+group" $log | grep -v gl > shortlist.txt
+
+countable=""
+IFS=$'\n'; for line in $(cat shortlist.txt); do
+	# parse ######### group[$n]: $name
+	l=${line########### group}
+	if [ $l != $line ];  then
+		group=`echo $line | awk '{print $3}'`
+		echo "Group: $group"
+		continue
+	fi
+	# parse #########   counter[$n]: $name
+	l=${line###########   counter}
+	if [ $l != $line ]; then
+		countable=`echo $line | awk '{print $3}'`
+		#echo "  Countable: $countable"
+		continue
+	fi
+	# parse 		countable:
+	l=${line##		countable:}
+	if [ $l != $line ]; then
+		val=`echo $line | awk '{print $2}'`
+		echo "<value value=\"$val\" name=\"$countable\"/>"
+	fi
+
+done
+##################
+ -->
+<enum name="a4xx_ccu_perfcounter_select">
+	<value value="0" name="CCU_BUSY_CYCLES"/>
+	<value value="2" name="CCU_RB_DEPTH_RETURN_STALL"/>
+	<value value="3" name="CCU_RB_COLOR_RETURN_STALL"/>
+	<value value="6" name="CCU_DEPTH_BLOCKS"/>
+	<value value="7" name="CCU_COLOR_BLOCKS"/>
+	<value value="8" name="CCU_DEPTH_BLOCK_HIT"/>
+	<value value="9" name="CCU_COLOR_BLOCK_HIT"/>
+	<value value="10" name="CCU_DEPTH_FLAG1_COUNT"/>
+	<value value="11" name="CCU_DEPTH_FLAG2_COUNT"/>
+	<value value="12" name="CCU_DEPTH_FLAG3_COUNT"/>
+	<value value="13" name="CCU_DEPTH_FLAG4_COUNT"/>
+	<value value="14" name="CCU_COLOR_FLAG1_COUNT"/>
+	<value value="15" name="CCU_COLOR_FLAG2_COUNT"/>
+	<value value="16" name="CCU_COLOR_FLAG3_COUNT"/>
+	<value value="17" name="CCU_COLOR_FLAG4_COUNT"/>
+	<value value="18" name="CCU_PARTIAL_BLOCK_READ"/>
+</enum>
+
+<!--
+NOTE other than CP_ALWAYS_COUNT (which is the only one we use so far),
+on a3xx the countable #'s from AMD_performance_monitor disagreed with
+TRM.  All these #'s for a4xx come from AMD_performance_monitor, so
+perhaps they should be taken with a grain of salt
+-->
+<enum name="a4xx_cp_perfcounter_select">
+	<!-- first ctr at least seems same as a3xx, so we can measure freq -->
+	<value value="0" name="CP_ALWAYS_COUNT"/>
+	<value value="1" name="CP_BUSY"/>
+	<value value="2" name="CP_PFP_IDLE"/>
+	<value value="3" name="CP_PFP_BUSY_WORKING"/>
+	<value value="4" name="CP_PFP_STALL_CYCLES_ANY"/>
+	<value value="5" name="CP_PFP_STARVE_CYCLES_ANY"/>
+	<value value="6" name="CP_PFP_STARVED_PER_LOAD_ADDR"/>
+	<value value="7" name="CP_PFP_STALLED_PER_STORE_ADDR"/>
+	<value value="8" name="CP_PFP_PC_PROFILE"/>
+	<value value="9" name="CP_PFP_MATCH_PM4_PKT_PROFILE"/>
+	<value value="10" name="CP_PFP_COND_INDIRECT_DISCARDED"/>
+	<value value="11" name="CP_LONG_RESUMPTIONS"/>
+	<value value="12" name="CP_RESUME_CYCLES"/>
+	<value value="13" name="CP_RESUME_TO_BOUNDARY_CYCLES"/>
+	<value value="14" name="CP_LONG_PREEMPTIONS"/>
+	<value value="15" name="CP_PREEMPT_CYCLES"/>
+	<value value="16" name="CP_PREEMPT_TO_BOUNDARY_CYCLES"/>
+	<value value="17" name="CP_ME_FIFO_EMPTY_PFP_IDLE"/>
+	<value value="18" name="CP_ME_FIFO_EMPTY_PFP_BUSY"/>
+	<value value="19" name="CP_ME_FIFO_NOT_EMPTY_NOT_FULL"/>
+	<value value="20" name="CP_ME_FIFO_FULL_ME_BUSY"/>
+	<value value="21" name="CP_ME_FIFO_FULL_ME_NON_WORKING"/>
+	<value value="22" name="CP_ME_WAITING_FOR_PACKETS"/>
+	<value value="23" name="CP_ME_BUSY_WORKING"/>
+	<value value="24" name="CP_ME_STARVE_CYCLES_ANY"/>
+	<value value="25" name="CP_ME_STARVE_CYCLES_PER_PROFILE"/>
+	<value value="26" name="CP_ME_STALL_CYCLES_PER_PROFILE"/>
+	<value value="27" name="CP_ME_PC_PROFILE"/>
+	<value value="28" name="CP_RCIU_FIFO_EMPTY"/>
+	<value value="29" name="CP_RCIU_FIFO_NOT_EMPTY_NOT_FULL"/>
+	<value value="30" name="CP_RCIU_FIFO_FULL"/>
+	<value value="31" name="CP_RCIU_FIFO_FULL_NO_CONTEXT"/>
+	<value value="32" name="CP_RCIU_FIFO_FULL_AHB_MASTER"/>
+	<value value="33" name="CP_RCIU_FIFO_FULL_OTHER"/>
+	<value value="34" name="CP_AHB_IDLE"/>
+	<value value="35" name="CP_AHB_STALL_ON_GRANT_NO_SPLIT"/>
+	<value value="36" name="CP_AHB_STALL_ON_GRANT_SPLIT"/>
+	<value value="37" name="CP_AHB_STALL_ON_GRANT_SPLIT_PROFILE"/>
+	<value value="38" name="CP_AHB_BUSY_WORKING"/>
+	<value value="39" name="CP_AHB_BUSY_STALL_ON_HRDY"/>
+	<value value="40" name="CP_AHB_BUSY_STALL_ON_HRDY_PROFILE"/>
+</enum>
+
+<enum name="a4xx_gras_ras_perfcounter_select">
+	<value value="0" name="RAS_SUPER_TILES"/>
+	<value value="1" name="RAS_8X8_TILES"/>
+	<value value="2" name="RAS_4X4_TILES"/>
+	<value value="3" name="RAS_BUSY_CYCLES"/>
+	<value value="4" name="RAS_STALL_CYCLES_BY_RB"/>
+	<value value="5" name="RAS_STALL_CYCLES_BY_VSC"/>
+	<value value="6" name="RAS_STARVE_CYCLES_BY_TSE"/>
+	<value value="7" name="RAS_SUPERTILE_CYCLES"/>
+	<value value="8" name="RAS_TILE_CYCLES"/>
+	<value value="9" name="RAS_FULLY_COVERED_SUPER_TILES"/>
+	<value value="10" name="RAS_FULLY_COVERED_8X8_TILES"/>
+	<value value="11" name="RAS_4X4_PRIM"/>
+	<value value="12" name="RAS_8X4_4X8_PRIM"/>
+	<value value="13" name="RAS_8X8_PRIM"/>
+</enum>
+
+<enum name="a4xx_gras_tse_perfcounter_select">
+	<value value="0" name="TSE_INPUT_PRIM"/>
+	<value value="1" name="TSE_INPUT_NULL_PRIM"/>
+	<value value="2" name="TSE_TRIVAL_REJ_PRIM"/>
+	<value value="3" name="TSE_CLIPPED_PRIM"/>
+	<value value="4" name="TSE_NEW_PRIM"/>
+	<value value="5" name="TSE_ZERO_AREA_PRIM"/>
+	<value value="6" name="TSE_FACENESS_CULLED_PRIM"/>
+	<value value="7" name="TSE_ZERO_PIXEL_PRIM"/>
+	<value value="8" name="TSE_OUTPUT_NULL_PRIM"/>
+	<value value="9" name="TSE_OUTPUT_VISIBLE_PRIM"/>
+	<value value="10" name="TSE_PRE_CLIP_PRIM"/>
+	<value value="11" name="TSE_POST_CLIP_PRIM"/>
+	<value value="12" name="TSE_BUSY_CYCLES"/>
+	<value value="13" name="TSE_PC_STARVE"/>
+	<value value="14" name="TSE_RAS_STALL"/>
+	<value value="15" name="TSE_STALL_BARYPLANE_FIFO_FULL"/>
+	<value value="16" name="TSE_STALL_ZPLANE_FIFO_FULL"/>
+</enum>
+
+<enum name="a4xx_hlsq_perfcounter_select">
+	<value value="0" name="HLSQ_SP_VS_STAGE_CONSTANT"/>
+	<value value="1" name="HLSQ_SP_VS_STAGE_INSTRUCTIONS"/>
+	<value value="2" name="HLSQ_SP_FS_STAGE_CONSTANT"/>
+	<value value="3" name="HLSQ_SP_FS_STAGE_INSTRUCTIONS"/>
+	<value value="4" name="HLSQ_TP_STATE"/>
+	<value value="5" name="HLSQ_QUADS"/>
+	<value value="6" name="HLSQ_PIXELS"/>
+	<value value="7" name="HLSQ_VERTICES"/>
+	<value value="13" name="HLSQ_SP_VS_STAGE_DATA_BYTES"/>
+	<value value="14" name="HLSQ_SP_FS_STAGE_DATA_BYTES"/>
+	<value value="15" name="HLSQ_BUSY_CYCLES"/>
+	<value value="16" name="HLSQ_STALL_CYCLES_SP_STATE"/>
+	<value value="17" name="HLSQ_STALL_CYCLES_SP_VS_STAGE"/>
+	<value value="18" name="HLSQ_STALL_CYCLES_SP_FS_STAGE"/>
+	<value value="19" name="HLSQ_STALL_CYCLES_UCHE"/>
+	<value value="20" name="HLSQ_RBBM_LOAD_CYCLES"/>
+	<value value="21" name="HLSQ_DI_TO_VS_START_SP"/>
+	<value value="22" name="HLSQ_DI_TO_FS_START_SP"/>
+	<value value="23" name="HLSQ_VS_STAGE_START_TO_DONE_SP"/>
+	<value value="24" name="HLSQ_FS_STAGE_START_TO_DONE_SP"/>
+	<value value="25" name="HLSQ_SP_STATE_COPY_CYCLES_VS_STAGE"/>
+	<value value="26" name="HLSQ_SP_STATE_COPY_CYCLES_FS_STAGE"/>
+	<value value="27" name="HLSQ_UCHE_LATENCY_CYCLES"/>
+	<value value="28" name="HLSQ_UCHE_LATENCY_COUNT"/>
+	<value value="29" name="HLSQ_STARVE_CYCLES_VFD"/>
+</enum>
+
+<enum name="a4xx_pc_perfcounter_select">
+	<value value="0" name="PC_VIS_STREAMS_LOADED"/>
+	<value value="2" name="PC_VPC_PRIMITIVES"/>
+	<value value="3" name="PC_DEAD_PRIM"/>
+	<value value="4" name="PC_LIVE_PRIM"/>
+	<value value="5" name="PC_DEAD_DRAWCALLS"/>
+	<value value="6" name="PC_LIVE_DRAWCALLS"/>
+	<value value="7" name="PC_VERTEX_MISSES"/>
+	<value value="9" name="PC_STALL_CYCLES_VFD"/>
+	<value value="10" name="PC_STALL_CYCLES_TSE"/>
+	<value value="11" name="PC_STALL_CYCLES_UCHE"/>
+	<value value="12" name="PC_WORKING_CYCLES"/>
+	<value value="13" name="PC_IA_VERTICES"/>
+	<value value="14" name="PC_GS_PRIMITIVES"/>
+	<value value="15" name="PC_HS_INVOCATIONS"/>
+	<value value="16" name="PC_DS_INVOCATIONS"/>
+	<value value="17" name="PC_DS_PRIMITIVES"/>
+	<value value="20" name="PC_STARVE_CYCLES_FOR_INDEX"/>
+	<value value="21" name="PC_STARVE_CYCLES_FOR_TESS_FACTOR"/>
+	<value value="22" name="PC_STARVE_CYCLES_FOR_VIZ_STREAM"/>
+	<value value="23" name="PC_STALL_CYCLES_TESS"/>
+	<value value="24" name="PC_STARVE_CYCLES_FOR_POSITION"/>
+	<value value="25" name="PC_MODE0_DRAWCALL"/>
+	<value value="26" name="PC_MODE1_DRAWCALL"/>
+	<value value="27" name="PC_MODE2_DRAWCALL"/>
+	<value value="28" name="PC_MODE3_DRAWCALL"/>
+	<value value="29" name="PC_MODE4_DRAWCALL"/>
+	<value value="30" name="PC_PREDICATED_DEAD_DRAWCALL"/>
+	<value value="31" name="PC_STALL_CYCLES_BY_TSE_ONLY"/>
+	<value value="32" name="PC_STALL_CYCLES_BY_VPC_ONLY"/>
+	<value value="33" name="PC_VPC_POS_DATA_TRANSACTION"/>
+	<value value="34" name="PC_BUSY_CYCLES"/>
+	<value value="35" name="PC_STARVE_CYCLES_DI"/>
+	<value value="36" name="PC_STALL_CYCLES_VPC"/>
+	<value value="37" name="TESS_WORKING_CYCLES"/>
+	<value value="38" name="TESS_NUM_CYCLES_SETUP_WORKING"/>
+	<value value="39" name="TESS_NUM_CYCLES_PTGEN_WORKING"/>
+	<value value="40" name="TESS_NUM_CYCLES_CONNGEN_WORKING"/>
+	<value value="41" name="TESS_BUSY_CYCLES"/>
+	<value value="42" name="TESS_STARVE_CYCLES_PC"/>
+	<value value="43" name="TESS_STALL_CYCLES_PC"/>
+</enum>
+
+<enum name="a4xx_pwr_perfcounter_select">
+	<!-- NOTE not actually used.. see RBBM_RBBM_CTL.RESET_PWR_CTR0/1 -->
+	<value value="0" name="PWR_CORE_CLOCK_CYCLES"/>
+	<value value="1" name="PWR_BUSY_CLOCK_CYCLES"/>
+</enum>
+
+<enum name="a4xx_rb_perfcounter_select">
+	<value value="0" name="RB_BUSY_CYCLES"/>
+	<value value="1" name="RB_BUSY_CYCLES_BINNING"/>
+	<value value="2" name="RB_BUSY_CYCLES_RENDERING"/>
+	<value value="3" name="RB_BUSY_CYCLES_RESOLVE"/>
+	<value value="4" name="RB_STARVE_CYCLES_BY_SP"/>
+	<value value="5" name="RB_STARVE_CYCLES_BY_RAS"/>
+	<value value="6" name="RB_STARVE_CYCLES_BY_MARB"/>
+	<value value="7" name="RB_STALL_CYCLES_BY_MARB"/>
+	<value value="8" name="RB_STALL_CYCLES_BY_HLSQ"/>
+	<value value="9" name="RB_RB_RB_MARB_DATA"/>
+	<value value="10" name="RB_SP_RB_QUAD"/>
+	<value value="11" name="RB_RAS_RB_Z_QUADS"/>
+	<value value="12" name="RB_GMEM_CH0_READ"/>
+	<value value="13" name="RB_GMEM_CH1_READ"/>
+	<value value="14" name="RB_GMEM_CH0_WRITE"/>
+	<value value="15" name="RB_GMEM_CH1_WRITE"/>
+	<value value="16" name="RB_CP_CONTEXT_DONE"/>
+	<value value="17" name="RB_CP_CACHE_FLUSH"/>
+	<value value="18" name="RB_CP_ZPASS_DONE"/>
+	<value value="19" name="RB_STALL_FIFO0_FULL"/>
+	<value value="20" name="RB_STALL_FIFO1_FULL"/>
+	<value value="21" name="RB_STALL_FIFO2_FULL"/>
+	<value value="22" name="RB_STALL_FIFO3_FULL"/>
+	<value value="23" name="RB_RB_HLSQ_TRANSACTIONS"/>
+	<value value="24" name="RB_Z_READ"/>
+	<value value="25" name="RB_Z_WRITE"/>
+	<value value="26" name="RB_C_READ"/>
+	<value value="27" name="RB_C_WRITE"/>
+	<value value="28" name="RB_C_READ_LATENCY"/>
+	<value value="29" name="RB_Z_READ_LATENCY"/>
+	<value value="30" name="RB_STALL_BY_UCHE"/>
+	<value value="31" name="RB_MARB_UCHE_TRANSACTIONS"/>
+	<value value="32" name="RB_CACHE_STALL_MISS"/>
+	<value value="33" name="RB_CACHE_STALL_FIFO_FULL"/>
+	<value value="34" name="RB_8BIT_BLENDER_UNITS_ACTIVE"/>
+	<value value="35" name="RB_16BIT_BLENDER_UNITS_ACTIVE"/>
+	<value value="36" name="RB_SAMPLER_UNITS_ACTIVE"/>
+	<value value="38" name="RB_TOTAL_PASS"/>
+	<value value="39" name="RB_Z_PASS"/>
+	<value value="40" name="RB_Z_FAIL"/>
+	<value value="41" name="RB_S_FAIL"/>
+	<value value="42" name="RB_POWER0"/>
+	<value value="43" name="RB_POWER1"/>
+	<value value="44" name="RB_POWER2"/>
+	<value value="45" name="RB_POWER3"/>
+	<value value="46" name="RB_POWER4"/>
+	<value value="47" name="RB_POWER5"/>
+	<value value="48" name="RB_POWER6"/>
+	<value value="49" name="RB_POWER7"/>
+</enum>
+
+<enum name="a4xx_rbbm_perfcounter_select">
+	<value value="0" name="RBBM_ALWAYS_ON"/>
+	<value value="1" name="RBBM_VBIF_BUSY"/>
+	<value value="2" name="RBBM_TSE_BUSY"/>
+	<value value="3" name="RBBM_RAS_BUSY"/>
+	<value value="4" name="RBBM_PC_DCALL_BUSY"/>
+	<value value="5" name="RBBM_PC_VSD_BUSY"/>
+	<value value="6" name="RBBM_VFD_BUSY"/>
+	<value value="7" name="RBBM_VPC_BUSY"/>
+	<value value="8" name="RBBM_UCHE_BUSY"/>
+	<value value="9" name="RBBM_VSC_BUSY"/>
+	<value value="10" name="RBBM_HLSQ_BUSY"/>
+	<value value="11" name="RBBM_ANY_RB_BUSY"/>
+	<value value="12" name="RBBM_ANY_TPL1_BUSY"/>
+	<value value="13" name="RBBM_ANY_SP_BUSY"/>
+	<value value="14" name="RBBM_ANY_MARB_BUSY"/>
+	<value value="15" name="RBBM_ANY_ARB_BUSY"/>
+	<value value="16" name="RBBM_AHB_STATUS_BUSY"/>
+	<value value="17" name="RBBM_AHB_STATUS_STALLED"/>
+	<value value="18" name="RBBM_AHB_STATUS_TXFR"/>
+	<value value="19" name="RBBM_AHB_STATUS_TXFR_SPLIT"/>
+	<value value="20" name="RBBM_AHB_STATUS_TXFR_ERROR"/>
+	<value value="21" name="RBBM_AHB_STATUS_LONG_STALL"/>
+	<value value="22" name="RBBM_STATUS_MASKED"/>
+	<value value="23" name="RBBM_CP_BUSY_GFX_CORE_IDLE"/>
+	<value value="24" name="RBBM_TESS_BUSY"/>
+	<value value="25" name="RBBM_COM_BUSY"/>
+	<value value="32" name="RBBM_DCOM_BUSY"/>
+	<value value="33" name="RBBM_ANY_CCU_BUSY"/>
+	<value value="34" name="RBBM_DPM_BUSY"/>
+</enum>
+
+<enum name="a4xx_sp_perfcounter_select">
+	<value value="0" name="SP_LM_LOAD_INSTRUCTIONS"/>
+	<value value="1" name="SP_LM_STORE_INSTRUCTIONS"/>
+	<value value="2" name="SP_LM_ATOMICS"/>
+	<value value="3" name="SP_GM_LOAD_INSTRUCTIONS"/>
+	<value value="4" name="SP_GM_STORE_INSTRUCTIONS"/>
+	<value value="5" name="SP_GM_ATOMICS"/>
+	<value value="6" name="SP_VS_STAGE_TEX_INSTRUCTIONS"/>
+	<value value="7" name="SP_VS_STAGE_CFLOW_INSTRUCTIONS"/>
+	<value value="8" name="SP_VS_STAGE_EFU_INSTRUCTIONS"/>
+	<value value="9" name="SP_VS_STAGE_FULL_ALU_INSTRUCTIONS"/>
+	<value value="10" name="SP_VS_STAGE_HALF_ALU_INSTRUCTIONS"/>
+	<value value="11" name="SP_FS_STAGE_TEX_INSTRUCTIONS"/>
+	<value value="12" name="SP_FS_STAGE_CFLOW_INSTRUCTIONS"/>
+	<value value="13" name="SP_FS_STAGE_EFU_INSTRUCTIONS"/>
+	<value value="14" name="SP_FS_STAGE_FULL_ALU_INSTRUCTIONS"/>
+	<value value="15" name="SP_FS_STAGE_HALF_ALU_INSTRUCTIONS"/>
+	<value value="17" name="SP_VS_INSTRUCTIONS"/>
+	<value value="18" name="SP_FS_INSTRUCTIONS"/>
+	<value value="19" name="SP_ADDR_LOCK_COUNT"/>
+	<value value="20" name="SP_UCHE_READ_TRANS"/>
+	<value value="21" name="SP_UCHE_WRITE_TRANS"/>
+	<value value="22" name="SP_EXPORT_VPC_TRANS"/>
+	<value value="23" name="SP_EXPORT_RB_TRANS"/>
+	<value value="24" name="SP_PIXELS_KILLED"/>
+	<value value="25" name="SP_ICL1_REQUESTS"/>
+	<value value="26" name="SP_ICL1_MISSES"/>
+	<value value="27" name="SP_ICL0_REQUESTS"/>
+	<value value="28" name="SP_ICL0_MISSES"/>
+	<value value="29" name="SP_ALU_WORKING_CYCLES"/>
+	<value value="30" name="SP_EFU_WORKING_CYCLES"/>
+	<value value="31" name="SP_STALL_CYCLES_BY_VPC"/>
+	<value value="32" name="SP_STALL_CYCLES_BY_TP"/>
+	<value value="33" name="SP_STALL_CYCLES_BY_UCHE"/>
+	<value value="34" name="SP_STALL_CYCLES_BY_RB"/>
+	<value value="35" name="SP_BUSY_CYCLES"/>
+	<value value="36" name="SP_HS_INSTRUCTIONS"/>
+	<value value="37" name="SP_DS_INSTRUCTIONS"/>
+	<value value="38" name="SP_GS_INSTRUCTIONS"/>
+	<value value="39" name="SP_CS_INSTRUCTIONS"/>
+	<value value="40" name="SP_SCHEDULER_NON_WORKING"/>
+	<value value="41" name="SP_WAVE_CONTEXTS"/>
+	<value value="42" name="SP_WAVE_CONTEXT_CYCLES"/>
+	<value value="43" name="SP_POWER0"/>
+	<value value="44" name="SP_POWER1"/>
+	<value value="45" name="SP_POWER2"/>
+	<value value="46" name="SP_POWER3"/>
+	<value value="47" name="SP_POWER4"/>
+	<value value="48" name="SP_POWER5"/>
+	<value value="49" name="SP_POWER6"/>
+	<value value="50" name="SP_POWER7"/>
+	<value value="51" name="SP_POWER8"/>
+	<value value="52" name="SP_POWER9"/>
+	<value value="53" name="SP_POWER10"/>
+	<value value="54" name="SP_POWER11"/>
+	<value value="55" name="SP_POWER12"/>
+	<value value="56" name="SP_POWER13"/>
+	<value value="57" name="SP_POWER14"/>
+	<value value="58" name="SP_POWER15"/>
+</enum>
+
+<enum name="a4xx_tp_perfcounter_select">
+	<value value="0" name="TP_L1_REQUESTS"/>
+	<value value="1" name="TP_L1_MISSES"/>
+	<value value="8" name="TP_QUADS_OFFSET"/>
+	<value value="9" name="TP_QUAD_SHADOW"/>
+	<value value="10" name="TP_QUADS_ARRAY"/>
+	<value value="11" name="TP_QUADS_GRADIENT"/>
+	<value value="12" name="TP_QUADS_1D2D"/>
+	<value value="13" name="TP_QUADS_3DCUBE"/>
+	<value value="16" name="TP_BUSY_CYCLES"/>
+	<value value="17" name="TP_STALL_CYCLES_BY_ARB"/>
+	<value value="20" name="TP_STATE_CACHE_REQUESTS"/>
+	<value value="21" name="TP_STATE_CACHE_MISSES"/>
+	<value value="22" name="TP_POWER0"/>
+	<value value="23" name="TP_POWER1"/>
+	<value value="24" name="TP_POWER2"/>
+	<value value="25" name="TP_POWER3"/>
+	<value value="26" name="TP_POWER4"/>
+	<value value="27" name="TP_POWER5"/>
+	<value value="28" name="TP_POWER6"/>
+	<value value="29" name="TP_POWER7"/>
+</enum>
+
+<enum name="a4xx_uche_perfcounter_select">
+	<value value="0" name="UCHE_VBIF_READ_BEATS_TP"/>
+	<value value="1" name="UCHE_VBIF_READ_BEATS_VFD"/>
+	<value value="2" name="UCHE_VBIF_READ_BEATS_HLSQ"/>
+	<value value="3" name="UCHE_VBIF_READ_BEATS_MARB"/>
+	<value value="4" name="UCHE_VBIF_READ_BEATS_SP"/>
+	<value value="5" name="UCHE_READ_REQUESTS_TP"/>
+	<value value="6" name="UCHE_READ_REQUESTS_VFD"/>
+	<value value="7" name="UCHE_READ_REQUESTS_HLSQ"/>
+	<value value="8" name="UCHE_READ_REQUESTS_MARB"/>
+	<value value="9" name="UCHE_READ_REQUESTS_SP"/>
+	<value value="10" name="UCHE_WRITE_REQUESTS_MARB"/>
+	<value value="11" name="UCHE_WRITE_REQUESTS_SP"/>
+	<value value="12" name="UCHE_TAG_CHECK_FAILS"/>
+	<value value="13" name="UCHE_EVICTS"/>
+	<value value="14" name="UCHE_FLUSHES"/>
+	<value value="15" name="UCHE_VBIF_LATENCY_CYCLES"/>
+	<value value="16" name="UCHE_VBIF_LATENCY_SAMPLES"/>
+	<value value="17" name="UCHE_BUSY_CYCLES"/>
+	<value value="18" name="UCHE_VBIF_READ_BEATS_PC"/>
+	<value value="19" name="UCHE_READ_REQUESTS_PC"/>
+	<value value="20" name="UCHE_WRITE_REQUESTS_VPC"/>
+	<value value="21" name="UCHE_STALL_BY_VBIF"/>
+	<value value="22" name="UCHE_WRITE_REQUESTS_VSC"/>
+	<value value="23" name="UCHE_POWER0"/>
+	<value value="24" name="UCHE_POWER1"/>
+	<value value="25" name="UCHE_POWER2"/>
+	<value value="26" name="UCHE_POWER3"/>
+	<value value="27" name="UCHE_POWER4"/>
+	<value value="28" name="UCHE_POWER5"/>
+	<value value="29" name="UCHE_POWER6"/>
+	<value value="30" name="UCHE_POWER7"/>
+</enum>
+
+<enum name="a4xx_vbif_perfcounter_select">
+	<value value="0" name="AXI_READ_REQUESTS_ID_0"/>
+	<value value="1" name="AXI_READ_REQUESTS_ID_1"/>
+	<value value="2" name="AXI_READ_REQUESTS_ID_2"/>
+	<value value="3" name="AXI_READ_REQUESTS_ID_3"/>
+	<value value="4" name="AXI_READ_REQUESTS_ID_4"/>
+	<value value="5" name="AXI_READ_REQUESTS_ID_5"/>
+	<value value="6" name="AXI_READ_REQUESTS_ID_6"/>
+	<value value="7" name="AXI_READ_REQUESTS_ID_7"/>
+	<value value="8" name="AXI_READ_REQUESTS_ID_8"/>
+	<value value="9" name="AXI_READ_REQUESTS_ID_9"/>
+	<value value="10" name="AXI_READ_REQUESTS_ID_10"/>
+	<value value="11" name="AXI_READ_REQUESTS_ID_11"/>
+	<value value="12" name="AXI_READ_REQUESTS_ID_12"/>
+	<value value="13" name="AXI_READ_REQUESTS_ID_13"/>
+	<value value="14" name="AXI_READ_REQUESTS_ID_14"/>
+	<value value="15" name="AXI_READ_REQUESTS_ID_15"/>
+	<value value="16" name="AXI0_READ_REQUESTS_TOTAL"/>
+	<value value="17" name="AXI1_READ_REQUESTS_TOTAL"/>
+	<value value="18" name="AXI2_READ_REQUESTS_TOTAL"/>
+	<value value="19" name="AXI3_READ_REQUESTS_TOTAL"/>
+	<value value="20" name="AXI_READ_REQUESTS_TOTAL"/>
+	<value value="21" name="AXI_WRITE_REQUESTS_ID_0"/>
+	<value value="22" name="AXI_WRITE_REQUESTS_ID_1"/>
+	<value value="23" name="AXI_WRITE_REQUESTS_ID_2"/>
+	<value value="24" name="AXI_WRITE_REQUESTS_ID_3"/>
+	<value value="25" name="AXI_WRITE_REQUESTS_ID_4"/>
+	<value value="26" name="AXI_WRITE_REQUESTS_ID_5"/>
+	<value value="27" name="AXI_WRITE_REQUESTS_ID_6"/>
+	<value value="28" name="AXI_WRITE_REQUESTS_ID_7"/>
+	<value value="29" name="AXI_WRITE_REQUESTS_ID_8"/>
+	<value value="30" name="AXI_WRITE_REQUESTS_ID_9"/>
+	<value value="31" name="AXI_WRITE_REQUESTS_ID_10"/>
+	<value value="32" name="AXI_WRITE_REQUESTS_ID_11"/>
+	<value value="33" name="AXI_WRITE_REQUESTS_ID_12"/>
+	<value value="34" name="AXI_WRITE_REQUESTS_ID_13"/>
+	<value value="35" name="AXI_WRITE_REQUESTS_ID_14"/>
+	<value value="36" name="AXI_WRITE_REQUESTS_ID_15"/>
+	<value value="37" name="AXI0_WRITE_REQUESTS_TOTAL"/>
+	<value value="38" name="AXI1_WRITE_REQUESTS_TOTAL"/>
+	<value value="39" name="AXI2_WRITE_REQUESTS_TOTAL"/>
+	<value value="40" name="AXI3_WRITE_REQUESTS_TOTAL"/>
+	<value value="41" name="AXI_WRITE_REQUESTS_TOTAL"/>
+	<value value="42" name="AXI_TOTAL_REQUESTS"/>
+	<value value="43" name="AXI_READ_DATA_BEATS_ID_0"/>
+	<value value="44" name="AXI_READ_DATA_BEATS_ID_1"/>
+	<value value="45" name="AXI_READ_DATA_BEATS_ID_2"/>
+	<value value="46" name="AXI_READ_DATA_BEATS_ID_3"/>
+	<value value="47" name="AXI_READ_DATA_BEATS_ID_4"/>
+	<value value="48" name="AXI_READ_DATA_BEATS_ID_5"/>
+	<value value="49" name="AXI_READ_DATA_BEATS_ID_6"/>
+	<value value="50" name="AXI_READ_DATA_BEATS_ID_7"/>
+	<value value="51" name="AXI_READ_DATA_BEATS_ID_8"/>
+	<value value="52" name="AXI_READ_DATA_BEATS_ID_9"/>
+	<value value="53" name="AXI_READ_DATA_BEATS_ID_10"/>
+	<value value="54" name="AXI_READ_DATA_BEATS_ID_11"/>
+	<value value="55" name="AXI_READ_DATA_BEATS_ID_12"/>
+	<value value="56" name="AXI_READ_DATA_BEATS_ID_13"/>
+	<value value="57" name="AXI_READ_DATA_BEATS_ID_14"/>
+	<value value="58" name="AXI_READ_DATA_BEATS_ID_15"/>
+	<value value="59" name="AXI0_READ_DATA_BEATS_TOTAL"/>
+	<value value="60" name="AXI1_READ_DATA_BEATS_TOTAL"/>
+	<value value="61" name="AXI2_READ_DATA_BEATS_TOTAL"/>
+	<value value="62" name="AXI3_READ_DATA_BEATS_TOTAL"/>
+	<value value="63" name="AXI_READ_DATA_BEATS_TOTAL"/>
+	<value value="64" name="AXI_WRITE_DATA_BEATS_ID_0"/>
+	<value value="65" name="AXI_WRITE_DATA_BEATS_ID_1"/>
+	<value value="66" name="AXI_WRITE_DATA_BEATS_ID_2"/>
+	<value value="67" name="AXI_WRITE_DATA_BEATS_ID_3"/>
+	<value value="68" name="AXI_WRITE_DATA_BEATS_ID_4"/>
+	<value value="69" name="AXI_WRITE_DATA_BEATS_ID_5"/>
+	<value value="70" name="AXI_WRITE_DATA_BEATS_ID_6"/>
+	<value value="71" name="AXI_WRITE_DATA_BEATS_ID_7"/>
+	<value value="72" name="AXI_WRITE_DATA_BEATS_ID_8"/>
+	<value value="73" name="AXI_WRITE_DATA_BEATS_ID_9"/>
+	<value value="74" name="AXI_WRITE_DATA_BEATS_ID_10"/>
+	<value value="75" name="AXI_WRITE_DATA_BEATS_ID_11"/>
+	<value value="76" name="AXI_WRITE_DATA_BEATS_ID_12"/>
+	<value value="77" name="AXI_WRITE_DATA_BEATS_ID_13"/>
+	<value value="78" name="AXI_WRITE_DATA_BEATS_ID_14"/>
+	<value value="79" name="AXI_WRITE_DATA_BEATS_ID_15"/>
+	<value value="80" name="AXI0_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="81" name="AXI1_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="82" name="AXI2_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="83" name="AXI3_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="84" name="AXI_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="85" name="AXI_DATA_BEATS_TOTAL"/>
+	<value value="86" name="CYCLES_HELD_OFF_ID_0"/>
+	<value value="87" name="CYCLES_HELD_OFF_ID_1"/>
+	<value value="88" name="CYCLES_HELD_OFF_ID_2"/>
+	<value value="89" name="CYCLES_HELD_OFF_ID_3"/>
+	<value value="90" name="CYCLES_HELD_OFF_ID_4"/>
+	<value value="91" name="CYCLES_HELD_OFF_ID_5"/>
+	<value value="92" name="CYCLES_HELD_OFF_ID_6"/>
+	<value value="93" name="CYCLES_HELD_OFF_ID_7"/>
+	<value value="94" name="CYCLES_HELD_OFF_ID_8"/>
+	<value value="95" name="CYCLES_HELD_OFF_ID_9"/>
+	<value value="96" name="CYCLES_HELD_OFF_ID_10"/>
+	<value value="97" name="CYCLES_HELD_OFF_ID_11"/>
+	<value value="98" name="CYCLES_HELD_OFF_ID_12"/>
+	<value value="99" name="CYCLES_HELD_OFF_ID_13"/>
+	<value value="100" name="CYCLES_HELD_OFF_ID_14"/>
+	<value value="101" name="CYCLES_HELD_OFF_ID_15"/>
+	<value value="102" name="AXI_READ_REQUEST_HELD_OFF"/>
+	<value value="103" name="AXI_WRITE_REQUEST_HELD_OFF"/>
+	<value value="104" name="AXI_REQUEST_HELD_OFF"/>
+	<value value="105" name="AXI_WRITE_DATA_HELD_OFF"/>
+	<value value="106" name="OCMEM_AXI_READ_REQUEST_HELD_OFF"/>
+	<value value="107" name="OCMEM_AXI_WRITE_REQUEST_HELD_OFF"/>
+	<value value="108" name="OCMEM_AXI_REQUEST_HELD_OFF"/>
+	<value value="109" name="OCMEM_AXI_WRITE_DATA_HELD_OFF"/>
+	<value value="110" name="ELAPSED_CYCLES_DDR"/>
+	<value value="111" name="ELAPSED_CYCLES_OCMEM"/>
+</enum>
+
+<enum name="a4xx_vfd_perfcounter_select">
+	<value value="0" name="VFD_UCHE_BYTE_FETCHED"/>
+	<value value="1" name="VFD_UCHE_TRANS"/>
+	<value value="3" name="VFD_FETCH_INSTRUCTIONS"/>
+	<value value="5" name="VFD_BUSY_CYCLES"/>
+	<value value="6" name="VFD_STALL_CYCLES_UCHE"/>
+	<value value="7" name="VFD_STALL_CYCLES_HLSQ"/>
+	<value value="8" name="VFD_STALL_CYCLES_VPC_BYPASS"/>
+	<value value="9" name="VFD_STALL_CYCLES_VPC_ALLOC"/>
+	<value value="13" name="VFD_MODE_0_FIBERS"/>
+	<value value="14" name="VFD_MODE_1_FIBERS"/>
+	<value value="15" name="VFD_MODE_2_FIBERS"/>
+	<value value="16" name="VFD_MODE_3_FIBERS"/>
+	<value value="17" name="VFD_MODE_4_FIBERS"/>
+	<value value="18" name="VFD_BFIFO_STALL"/>
+	<value value="19" name="VFD_NUM_VERTICES_TOTAL"/>
+	<value value="20" name="VFD_PACKER_FULL"/>
+	<value value="21" name="VFD_UCHE_REQUEST_FIFO_FULL"/>
+	<value value="22" name="VFD_STARVE_CYCLES_PC"/>
+	<value value="23" name="VFD_STARVE_CYCLES_UCHE"/>
+</enum>
+
+<enum name="a4xx_vpc_perfcounter_select">
+	<value value="2" name="VPC_SP_LM_COMPONENTS"/>
+	<value value="3" name="VPC_SP0_LM_BYTES"/>
+	<value value="4" name="VPC_SP1_LM_BYTES"/>
+	<value value="5" name="VPC_SP2_LM_BYTES"/>
+	<value value="6" name="VPC_SP3_LM_BYTES"/>
+	<value value="7" name="VPC_WORKING_CYCLES"/>
+	<value value="8" name="VPC_STALL_CYCLES_LM"/>
+	<value value="9" name="VPC_STARVE_CYCLES_RAS"/>
+	<value value="10" name="VPC_STREAMOUT_CYCLES"/>
+	<value value="12" name="VPC_UCHE_TRANSACTIONS"/>
+	<value value="13" name="VPC_STALL_CYCLES_UCHE"/>
+	<value value="14" name="VPC_BUSY_CYCLES"/>
+	<value value="15" name="VPC_STARVE_CYCLES_SP"/>
+</enum>
+
+<enum name="a4xx_vsc_perfcounter_select">
+	<value value="0" name="VSC_BUSY_CYCLES"/>
+	<value value="1" name="VSC_WORKING_CYCLES"/>
+	<value value="2" name="VSC_STALL_CYCLES_UCHE"/>
+	<value value="3" name="VSC_STARVE_CYCLES_RAS"/>
+	<value value="4" name="VSC_EOT_NUM"/>
+</enum>
+
+<domain name="A4XX" width="32">
+	<!-- RB registers -->
+	<reg32 offset="0x0cc0" name="RB_GMEM_BASE_ADDR"/>
+	<reg32 offset="0x0cc7" name="RB_PERFCTR_RB_SEL_0" type="a4xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cc8" name="RB_PERFCTR_RB_SEL_1" type="a4xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cc9" name="RB_PERFCTR_RB_SEL_2" type="a4xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cca" name="RB_PERFCTR_RB_SEL_3" type="a4xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0ccb" name="RB_PERFCTR_RB_SEL_4" type="a4xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0ccc" name="RB_PERFCTR_RB_SEL_5" type="a4xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0ccd" name="RB_PERFCTR_RB_SEL_6" type="a4xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0cce" name="RB_PERFCTR_RB_SEL_7" type="a4xx_rb_perfcounter_select"/>
+	<reg32 offset="0x0ccf" name="RB_PERFCTR_CCU_SEL_0" type="a4xx_ccu_perfcounter_select"/>
+	<reg32 offset="0x0cd0" name="RB_PERFCTR_CCU_SEL_1" type="a4xx_ccu_perfcounter_select"/>
+	<reg32 offset="0x0cd1" name="RB_PERFCTR_CCU_SEL_2" type="a4xx_ccu_perfcounter_select"/>
+	<reg32 offset="0x0cd2" name="RB_PERFCTR_CCU_SEL_3" type="a4xx_ccu_perfcounter_select"/>
+	<reg32 offset="0x0ce0" name="RB_FRAME_BUFFER_DIMENSION">
+		<bitfield name="WIDTH" low="0" high="13" type="uint"/>
+		<bitfield name="HEIGHT" low="16" high="29" type="uint"/>
+	</reg32>
+	<reg32 offset="0x20cc" name="RB_CLEAR_COLOR_DW0"/>
+	<reg32 offset="0x20cd" name="RB_CLEAR_COLOR_DW1"/>
+	<reg32 offset="0x20ce" name="RB_CLEAR_COLOR_DW2"/>
+	<reg32 offset="0x20cf" name="RB_CLEAR_COLOR_DW3"/>
+	<reg32 offset="0x20a0" name="RB_MODE_CONTROL">
+		<!--
+		for non-bypass mode, these are bin width/height..  although
+		possibly bigger bitfields to hold entire width/height for
+		gmem-bypass??  Either way, it appears to need to be multiple
+		of 32..
+		-->
+		<bitfield name="WIDTH" low="0" high="5" shr="5" type="uint"/>
+		<bitfield name="HEIGHT" low="8" high="13" shr="5" type="uint"/>
+		<bitfield name="ENABLE_GMEM" pos="16" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x20a1" name="RB_RENDER_CONTROL">
+		<bitfield name="BINNING_PASS" pos="0" type="boolean"/>
+		<!-- nearly everything has bit3 set.. -->
+		<!-- bit5 set on resolve and tiling pass -->
+		<bitfield name="DISABLE_COLOR_PIPE" pos="5" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x20a2" name="RB_MSAA_CONTROL">
+		<bitfield name="DISABLE" pos="12" type="boolean"/>
+		<bitfield name="SAMPLES" low="13" high="15" type="uint"/>
+	</reg32>
+	<reg32 offset="0x20a3" name="RB_RENDER_CONTROL2">
+		<bitfield name="COORD_MASK" low="0" high="3" type="hex"/>
+		<bitfield name="SAMPLEMASK" pos="4" type="boolean"/>
+		<bitfield name="FACENESS" pos="5" type="boolean"/>
+		<bitfield name="SAMPLEID" pos="6" type="boolean"/>
+		<bitfield name="MSAA_SAMPLES" low="7" high="9" type="uint"/>
+		<bitfield name="SAMPLEID_HR" pos="11" type="boolean"/>
+		<bitfield name="IJ_PERSP_PIXEL" pos="12" type="boolean"/>
+		<!-- the 2 below are just educated guesses -->
+		<bitfield name="IJ_PERSP_CENTROID" pos="13" type="boolean"/>
+		<bitfield name="IJ_PERSP_SAMPLE" pos="14" type="boolean"/>
+		<!-- needs to be enabled to get nopersp values,
+		     perhaps other cases too? -->
+		<bitfield name="SIZE" pos="15" type="boolean"/>
+	</reg32>
+	<array offset="0x20a4" name="RB_MRT" stride="5" length="8">
+		<reg32 offset="0x0" name="CONTROL">
+			<bitfield name="READ_DEST_ENABLE" pos="3" type="boolean"/>
+			<!-- both these bits seem to get set when enabling GL_BLEND.. -->
+			<bitfield name="BLEND" pos="4" type="boolean"/>
+			<bitfield name="BLEND2" pos="5" type="boolean"/>
+			<bitfield name="ROP_ENABLE" pos="6" type="boolean"/>
+			<bitfield name="ROP_CODE" low="8" high="11" type="a3xx_rop_code"/>
+			<bitfield name="COMPONENT_ENABLE" low="24" high="27" type="hex"/>
+		</reg32>
+		<reg32 offset="0x1" name="BUF_INFO">
+			<bitfield name="COLOR_FORMAT" low="0" high="5" type="a4xx_color_fmt"/>
+			<!--
+			    guestimate position of COLOR_TILE_MODE..  this works out if
+			    common value is 2, like on a3xx..
+			 -->
+			<bitfield name="COLOR_TILE_MODE" low="6" high="7" type="a4xx_tile_mode"/>
+			<bitfield name="DITHER_MODE" low="9" high="10" type="adreno_rb_dither_mode"/>
+			<bitfield name="COLOR_SWAP" low="11" high="12" type="a3xx_color_swap"/>
+			<bitfield name="COLOR_SRGB" pos="13" type="boolean"/>
+			<!-- note: possibly some # of lsb's aren't there: -->
+			<doc>
+				Pitch (actually, appears to be pitch in bytes, so really is a stride)
+				in GMEM, so pitch of the current tile.
+			</doc>
+			<bitfield name="COLOR_BUF_PITCH" low="14" high="31" shr="4" type="uint"/>
+		</reg32>
+		<reg32 offset="0x2" name="BASE"/>
+		<reg32 offset="0x3" name="CONTROL3">
+			<!-- probably missing some lsb's.. and guessing upper size -->
+			<!-- pitch * cpp * msaa: -->
+			<bitfield name="STRIDE" low="3" high="25" type="uint"/>
+		</reg32>
+		<reg32 offset="0x4" name="BLEND_CONTROL">
+			<bitfield name="RGB_SRC_FACTOR" low="0" high="4" type="adreno_rb_blend_factor"/>
+			<bitfield name="RGB_BLEND_OPCODE" low="5" high="7" type="a3xx_rb_blend_opcode"/>
+			<bitfield name="RGB_DEST_FACTOR" low="8" high="12" type="adreno_rb_blend_factor"/>
+			<bitfield name="ALPHA_SRC_FACTOR" low="16" high="20" type="adreno_rb_blend_factor"/>
+			<bitfield name="ALPHA_BLEND_OPCODE" low="21" high="23" type="a3xx_rb_blend_opcode"/>
+			<bitfield name="ALPHA_DEST_FACTOR" low="24" high="28" type="adreno_rb_blend_factor"/>
+		</reg32>
+	</array>
+
+	<reg32 offset="0x20f0" name="RB_BLEND_RED">
+		<bitfield name="UINT" low="0" high="7" type="hex"/>
+		<bitfield name="SINT" low="8" high="15" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+	<reg32 offset="0x20f1" name="RB_BLEND_RED_F32" type="float"/>
+
+	<reg32 offset="0x20f2" name="RB_BLEND_GREEN">
+		<bitfield name="UINT" low="0" high="7" type="hex"/>
+		<bitfield name="SINT" low="8" high="15" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+	<reg32 offset="0x20f3" name="RB_BLEND_GREEN_F32" type="float"/>
+
+	<reg32 offset="0x20f4" name="RB_BLEND_BLUE">
+		<bitfield name="UINT" low="0" high="7" type="hex"/>
+		<bitfield name="SINT" low="8" high="15" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+	<reg32 offset="0x20f5" name="RB_BLEND_BLUE_F32" type="float"/>
+
+	<reg32 offset="0x20f6" name="RB_BLEND_ALPHA">
+		<bitfield name="UINT" low="0" high="7" type="hex"/>
+		<bitfield name="SINT" low="8" high="15" type="hex"/>
+		<bitfield name="FLOAT" low="16" high="31" type="float"/>
+	</reg32>
+	<reg32 offset="0x20f7" name="RB_BLEND_ALPHA_F32" type="float"/>
+
+	<reg32 offset="0x20f8" name="RB_ALPHA_CONTROL">
+		<bitfield name="ALPHA_REF" low="0" high="7" type="hex"/>
+		<bitfield name="ALPHA_TEST" pos="8" type="boolean"/>
+		<bitfield name="ALPHA_TEST_FUNC" low="9" high="11" type="adreno_compare_func"/>
+	</reg32>
+	<reg32 offset="0x20f9" name="RB_FS_OUTPUT">
+		<!-- per-mrt enable bit -->
+		<bitfield name="ENABLE_BLEND" low="0" high="7"/>
+		<bitfield name="INDEPENDENT_BLEND" pos="8" type="boolean"/>
+		<!-- a guess? -->
+		<bitfield name="SAMPLE_MASK" low="16" high="31"/>
+	</reg32>
+	<reg32 offset="0x20fa" name="RB_SAMPLE_COUNT_CONTROL">
+		<bitfield name="COPY" pos="1" type="boolean"/>
+		<bitfield name="ADDR" low="2" high="31" shr="2"/>
+	</reg32>
+	<!-- always 00000000 for binning pass, else 0000000f: -->
+	<reg32 offset="0x20fb" name="RB_RENDER_COMPONENTS">
+		<bitfield name="RT0" low="0" high="3"/>
+		<bitfield name="RT1" low="4" high="7"/>
+		<bitfield name="RT2" low="8" high="11"/>
+		<bitfield name="RT3" low="12" high="15"/>
+		<bitfield name="RT4" low="16" high="19"/>
+		<bitfield name="RT5" low="20" high="23"/>
+		<bitfield name="RT6" low="24" high="27"/>
+		<bitfield name="RT7" low="28" high="31"/>
+	</reg32>
+
+	<reg32 offset="0x20fc" name="RB_COPY_CONTROL">
+		<!-- not sure # of bits -->
+		<bitfield name="MSAA_RESOLVE" low="0" high="1" type="a3xx_msaa_samples"/>
+		<bitfield name="MODE" low="4" high="6" type="adreno_rb_copy_control_mode"/>
+		<bitfield name="FASTCLEAR" low="8" high="11" type="hex"/>
+		<bitfield name="GMEM_BASE" low="14" high="31" shr="14" type="hex"/>
+	</reg32>
+	<reg32 offset="0x20fd" name="RB_COPY_DEST_BASE">
+		<bitfield name="BASE" low="5" high="31" shr="5" type="hex"/>
+	</reg32>
+	<reg32 offset="0x20fe" name="RB_COPY_DEST_PITCH">
+		<doc>actually, appears to be pitch in bytes, so really is a stride</doc>
+		<!-- not actually sure about max pitch... -->
+		<bitfield name="PITCH" low="0" high="31" shr="5" type="uint"/>
+	</reg32>
+	<reg32 offset="0x20ff" name="RB_COPY_DEST_INFO">
+		<bitfield name="FORMAT" low="2" high="7" type="a4xx_color_fmt"/>
+		<bitfield name="SWAP" low="8" high="9" type="a3xx_color_swap"/>
+		<bitfield name="DITHER_MODE" low="10" high="11" type="adreno_rb_dither_mode"/>
+		<bitfield name="COMPONENT_ENABLE" low="14" high="17" type="hex"/>
+		<bitfield name="ENDIAN" low="18" high="20" type="adreno_rb_surface_endian"/>
+		<bitfield name="TILE" low="24" high="25" type="a4xx_tile_mode"/>
+	</reg32>
+	<reg32 offset="0x2100" name="RB_FS_OUTPUT_REG">
+		<!-- bit0 set except for binning pass.. -->
+		<bitfield name="MRT" low="0" high="3" type="uint"/>
+		<bitfield name="FRAG_WRITES_Z" pos="5" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2101" name="RB_DEPTH_CONTROL">
+		<!--
+			guessing that this matches a2xx with the stencil fields
+			moved out into RB_STENCIL_CONTROL?
+		 -->
+		<bitfield name="FRAG_WRITES_Z" pos="0" type="boolean"/>
+		<bitfield name="Z_TEST_ENABLE" pos="1" type="boolean"/>
+		<bitfield name="Z_WRITE_ENABLE" pos="2" type="boolean"/>
+		<bitfield name="ZFUNC" low="4" high="6" type="adreno_compare_func"/>
+		<bitfield name="Z_CLAMP_ENABLE" pos="7" type="boolean"/>
+		<bitfield name="EARLY_Z_DISABLE" pos="16" type="boolean"/>
+		<bitfield name="FORCE_FRAGZ_TO_FS" pos="17" type="boolean"/>
+		<doc>Z_READ_ENABLE bit is set for zfunc other than GL_ALWAYS or GL_NEVER</doc>
+		<bitfield name="Z_READ_ENABLE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2102" name="RB_DEPTH_CLEAR"/>
+	<reg32 offset="0x2103" name="RB_DEPTH_INFO">
+		<bitfield name="DEPTH_FORMAT" low="0" high="1" type="a4xx_depth_format"/>
+		<doc>
+			DEPTH_BASE is offset in GMEM to depth/stencil buffer, ie
+			bin_w * bin_h / 1024 (possible rounded up to multiple of
+			something??  ie. 39 becomes 40, 78 becomes 80.. 75 becomes
+			80.. so maybe it needs to be multiple of 8??
+		</doc>
+		<bitfield name="DEPTH_BASE" low="12" high="31" shr="12" type="hex"/>
+	</reg32>
+	<reg32 offset="0x2104" name="RB_DEPTH_PITCH" shr="5" type="uint">
+		<doc>stride of depth/stencil buffer</doc>
+	</reg32>
+	<reg32 offset="0x2105" name="RB_DEPTH_PITCH2" shr="5" type="uint">
+		<doc>???</doc>
+	</reg32>
+	<reg32 offset="0x2106" name="RB_STENCIL_CONTROL">
+		<bitfield name="STENCIL_ENABLE" pos="0" type="boolean"/>
+		<bitfield name="STENCIL_ENABLE_BF" pos="1" type="boolean"/>
+		<!--
+			set for stencil operations that require read from stencil
+			buffer, but not for example for stencil clear (which does
+			not require read).. so guessing this is analogous to
+			READ_DEST_ENABLE for color buffer..
+		 -->
+		<bitfield name="STENCIL_READ" pos="2" type="boolean"/>
+		<bitfield name="FUNC" low="8" high="10" type="adreno_compare_func"/>
+		<bitfield name="FAIL" low="11" high="13" type="adreno_stencil_op"/>
+		<bitfield name="ZPASS" low="14" high="16" type="adreno_stencil_op"/>
+		<bitfield name="ZFAIL" low="17" high="19" type="adreno_stencil_op"/>
+		<bitfield name="FUNC_BF" low="20" high="22" type="adreno_compare_func"/>
+		<bitfield name="FAIL_BF" low="23" high="25" type="adreno_stencil_op"/>
+		<bitfield name="ZPASS_BF" low="26" high="28" type="adreno_stencil_op"/>
+		<bitfield name="ZFAIL_BF" low="29" high="31" type="adreno_stencil_op"/>
+	</reg32>
+	<reg32 offset="0x2107" name="RB_STENCIL_CONTROL2">
+		<!--
+		This seems to be set by blob if there is a stencil buffer
+		at all in GMEM, regardless of whether it is enabled for
+		a particular draw (ie. RB_STENCIL_CONTROL).  Not really
+		sure if that is required or just a quirk of the blob
+		-->
+		<bitfield name="STENCIL_BUFFER" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2108" name="RB_STENCIL_INFO">
+		<bitfield name="SEPARATE_STENCIL" pos="0" type="boolean"/>
+		<doc>Base address for stencil when not using interleaved depth/stencil</doc>
+		<bitfield name="STENCIL_BASE" low="12" high="31" shr="12" type="hex"/>
+	</reg32>
+	<reg32 offset="0x2109" name="RB_STENCIL_PITCH" shr="5" type="uint">
+		<doc>pitch of stencil buffer when not using interleaved depth/stencil</doc>
+	</reg32>
+
+	<reg32 offset="0x210b" name="RB_STENCILREFMASK" type="adreno_rb_stencilrefmask"/>
+	<reg32 offset="0x210c" name="RB_STENCILREFMASK_BF" type="adreno_rb_stencilrefmask"/>
+	<reg32 offset="0x210d" name="RB_BIN_OFFSET" type="adreno_reg_xy"/>
+	<array offset="0x2120" name="RB_VPORT_Z_CLAMP" stride="2" length="16">
+		<reg32 offset="0x0" name="MIN"/>
+		<reg32 offset="0x1" name="MAX"/>
+	</array>
+
+	<!-- RBBM registers -->
+	<reg32 offset="0x0000" name="RBBM_HW_VERSION"/>
+	<reg32 offset="0x0002" name="RBBM_HW_CONFIGURATION"/>
+	<array offset="0x4" name="RBBM_CLOCK_CTL_TP" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<array offset="0x8" name="RBBM_CLOCK_CTL2_TP" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<array offset="0xc" name="RBBM_CLOCK_HYST_TP" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<array offset="0x10" name="RBBM_CLOCK_DELAY_TP" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<reg32 offset="0x0014" name="RBBM_CLOCK_CTL_UCHE "/>
+	<reg32 offset="0x0015" name="RBBM_CLOCK_CTL2_UCHE"/>
+	<reg32 offset="0x0016" name="RBBM_CLOCK_CTL3_UCHE"/>
+	<reg32 offset="0x0017" name="RBBM_CLOCK_CTL4_UCHE"/>
+	<reg32 offset="0x0018" name="RBBM_CLOCK_HYST_UCHE"/>
+	<reg32 offset="0x0019" name="RBBM_CLOCK_DELAY_UCHE"/>
+	<reg32 offset="0x001a" name="RBBM_CLOCK_MODE_GPC"/>
+	<reg32 offset="0x001b" name="RBBM_CLOCK_DELAY_GPC"/>
+	<reg32 offset="0x001c" name="RBBM_CLOCK_HYST_GPC"/>
+	<reg32 offset="0x001d" name="RBBM_CLOCK_CTL_TSE_RAS_RBBM"/>
+	<reg32 offset="0x001e" name="RBBM_CLOCK_HYST_TSE_RAS_RBBM"/>
+	<reg32 offset="0x001f" name="RBBM_CLOCK_DELAY_TSE_RAS_RBBM"/>
+	<reg32 offset="0x0020" name="RBBM_CLOCK_CTL"/>
+	<reg32 offset="0x0021" name="RBBM_SP_HYST_CNT"/>
+	<reg32 offset="0x0022" name="RBBM_SW_RESET_CMD"/>
+	<reg32 offset="0x0023" name="RBBM_AHB_CTL0"/>
+	<reg32 offset="0x0024" name="RBBM_AHB_CTL1"/>
+	<reg32 offset="0x0025" name="RBBM_AHB_CMD"/>
+	<reg32 offset="0x0026" name="RBBM_RB_SUB_BLOCK_SEL_CTL"/>
+	<reg32 offset="0x0028" name="RBBM_RAM_ACC_63_32"/>
+	<reg32 offset="0x002b" name="RBBM_WAIT_IDLE_CLOCKS_CTL"/>
+	<reg32 offset="0x002f" name="RBBM_INTERFACE_HANG_INT_CTL"/>
+	<reg32 offset="0x0034" name="RBBM_INTERFACE_HANG_MASK_CTL4"/>
+	<reg32 offset="0x0036" name="RBBM_INT_CLEAR_CMD"/>
+	<reg32 offset="0x0037" name="RBBM_INT_0_MASK"/>
+	<reg32 offset="0x003e" name="RBBM_RBBM_CTL"/>
+	<reg32 offset="0x003f" name="RBBM_AHB_DEBUG_CTL"/>
+	<reg32 offset="0x0041" name="RBBM_VBIF_DEBUG_CTL"/>
+	<reg32 offset="0x0042" name="RBBM_CLOCK_CTL2"/>
+	<reg32 offset="0x0045" name="RBBM_BLOCK_SW_RESET_CMD"/>
+	<reg32 offset="0x0047" name="RBBM_RESET_CYCLES"/>
+	<reg32 offset="0x0049" name="RBBM_EXT_TRACE_BUS_CTL"/>
+	<reg32 offset="0x004a" name="RBBM_CFG_DEBBUS_SEL_A"/>
+	<reg32 offset="0x004b" name="RBBM_CFG_DEBBUS_SEL_B"/>
+	<reg32 offset="0x004c" name="RBBM_CFG_DEBBUS_SEL_C"/>
+	<reg32 offset="0x004d" name="RBBM_CFG_DEBBUS_SEL_D"/>
+	<reg32 offset="0x0098" name="RBBM_POWER_CNTL_IP">
+		<bitfield name="SW_COLLAPSE" pos="0" type="boolean"/>
+		<bitfield name="SP_TP_PWR_ON" pos="20" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x009c" name="RBBM_PERFCTR_CP_0_LO"/>
+	<reg32 offset="0x009d" name="RBBM_PERFCTR_CP_0_HI"/>
+	<reg32 offset="0x009e" name="RBBM_PERFCTR_CP_1_LO"/>
+	<reg32 offset="0x009f" name="RBBM_PERFCTR_CP_1_HI"/>
+	<reg32 offset="0x00a0" name="RBBM_PERFCTR_CP_2_LO"/>
+	<reg32 offset="0x00a1" name="RBBM_PERFCTR_CP_2_HI"/>
+	<reg32 offset="0x00a2" name="RBBM_PERFCTR_CP_3_LO"/>
+	<reg32 offset="0x00a3" name="RBBM_PERFCTR_CP_3_HI"/>
+	<reg32 offset="0x00a4" name="RBBM_PERFCTR_CP_4_LO"/>
+	<reg32 offset="0x00a5" name="RBBM_PERFCTR_CP_4_HI"/>
+	<reg32 offset="0x00a6" name="RBBM_PERFCTR_CP_5_LO"/>
+	<reg32 offset="0x00a7" name="RBBM_PERFCTR_CP_5_HI"/>
+	<reg32 offset="0x00a8" name="RBBM_PERFCTR_CP_6_LO"/>
+	<reg32 offset="0x00a9" name="RBBM_PERFCTR_CP_6_HI"/>
+	<reg32 offset="0x00aa" name="RBBM_PERFCTR_CP_7_LO"/>
+	<reg32 offset="0x00ab" name="RBBM_PERFCTR_CP_7_HI"/>
+	<reg32 offset="0x00ac" name="RBBM_PERFCTR_RBBM_0_LO"/>
+	<reg32 offset="0x00ad" name="RBBM_PERFCTR_RBBM_0_HI"/>
+	<reg32 offset="0x00ae" name="RBBM_PERFCTR_RBBM_1_LO"/>
+	<reg32 offset="0x00af" name="RBBM_PERFCTR_RBBM_1_HI"/>
+	<reg32 offset="0x00b0" name="RBBM_PERFCTR_RBBM_2_LO"/>
+	<reg32 offset="0x00b1" name="RBBM_PERFCTR_RBBM_2_HI"/>
+	<reg32 offset="0x00b2" name="RBBM_PERFCTR_RBBM_3_LO"/>
+	<reg32 offset="0x00b3" name="RBBM_PERFCTR_RBBM_3_HI"/>
+	<reg32 offset="0x00b4" name="RBBM_PERFCTR_PC_0_LO"/>
+	<reg32 offset="0x00b5" name="RBBM_PERFCTR_PC_0_HI"/>
+	<reg32 offset="0x00b6" name="RBBM_PERFCTR_PC_1_LO"/>
+	<reg32 offset="0x00b7" name="RBBM_PERFCTR_PC_1_HI"/>
+	<reg32 offset="0x00b8" name="RBBM_PERFCTR_PC_2_LO"/>
+	<reg32 offset="0x00b9" name="RBBM_PERFCTR_PC_2_HI"/>
+	<reg32 offset="0x00ba" name="RBBM_PERFCTR_PC_3_LO"/>
+	<reg32 offset="0x00bb" name="RBBM_PERFCTR_PC_3_HI"/>
+	<reg32 offset="0x00bc" name="RBBM_PERFCTR_PC_4_LO"/>
+	<reg32 offset="0x00bd" name="RBBM_PERFCTR_PC_4_HI"/>
+	<reg32 offset="0x00be" name="RBBM_PERFCTR_PC_5_LO"/>
+	<reg32 offset="0x00bf" name="RBBM_PERFCTR_PC_5_HI"/>
+	<reg32 offset="0x00c0" name="RBBM_PERFCTR_PC_6_LO"/>
+	<reg32 offset="0x00c1" name="RBBM_PERFCTR_PC_6_HI"/>
+	<reg32 offset="0x00c2" name="RBBM_PERFCTR_PC_7_LO"/>
+	<reg32 offset="0x00c3" name="RBBM_PERFCTR_PC_7_HI"/>
+	<reg32 offset="0x00c4" name="RBBM_PERFCTR_VFD_0_LO"/>
+	<reg32 offset="0x00c5" name="RBBM_PERFCTR_VFD_0_HI"/>
+	<reg32 offset="0x00c6" name="RBBM_PERFCTR_VFD_1_LO"/>
+	<reg32 offset="0x00c7" name="RBBM_PERFCTR_VFD_1_HI"/>
+	<reg32 offset="0x00c8" name="RBBM_PERFCTR_VFD_2_LO"/>
+	<reg32 offset="0x00c9" name="RBBM_PERFCTR_VFD_2_HI"/>
+	<reg32 offset="0x00ca" name="RBBM_PERFCTR_VFD_3_LO"/>
+	<reg32 offset="0x00cb" name="RBBM_PERFCTR_VFD_3_HI"/>
+	<reg32 offset="0x00cc" name="RBBM_PERFCTR_VFD_4_LO"/>
+	<reg32 offset="0x00cd" name="RBBM_PERFCTR_VFD_4_HI"/>
+	<reg32 offset="0x00ce" name="RBBM_PERFCTR_VFD_5_LO"/>
+	<reg32 offset="0x00cf" name="RBBM_PERFCTR_VFD_5_HI"/>
+	<reg32 offset="0x00d0" name="RBBM_PERFCTR_VFD_6_LO"/>
+	<reg32 offset="0x00d1" name="RBBM_PERFCTR_VFD_6_HI"/>
+	<reg32 offset="0x00d2" name="RBBM_PERFCTR_VFD_7_LO"/>
+	<reg32 offset="0x00d3" name="RBBM_PERFCTR_VFD_7_HI"/>
+	<reg32 offset="0x00d4" name="RBBM_PERFCTR_HLSQ_0_LO"/>
+	<reg32 offset="0x00d5" name="RBBM_PERFCTR_HLSQ_0_HI"/>
+	<reg32 offset="0x00d6" name="RBBM_PERFCTR_HLSQ_1_LO"/>
+	<reg32 offset="0x00d7" name="RBBM_PERFCTR_HLSQ_1_HI"/>
+	<reg32 offset="0x00d8" name="RBBM_PERFCTR_HLSQ_2_LO"/>
+	<reg32 offset="0x00d9" name="RBBM_PERFCTR_HLSQ_2_HI"/>
+	<reg32 offset="0x00da" name="RBBM_PERFCTR_HLSQ_3_LO"/>
+	<reg32 offset="0x00db" name="RBBM_PERFCTR_HLSQ_3_HI"/>
+	<reg32 offset="0x00dc" name="RBBM_PERFCTR_HLSQ_4_LO"/>
+	<reg32 offset="0x00dd" name="RBBM_PERFCTR_HLSQ_4_HI"/>
+	<reg32 offset="0x00de" name="RBBM_PERFCTR_HLSQ_5_LO"/>
+	<reg32 offset="0x00df" name="RBBM_PERFCTR_HLSQ_5_HI"/>
+	<reg32 offset="0x00e0" name="RBBM_PERFCTR_HLSQ_6_LO"/>
+	<reg32 offset="0x00e1" name="RBBM_PERFCTR_HLSQ_6_HI"/>
+	<reg32 offset="0x00e2" name="RBBM_PERFCTR_HLSQ_7_LO"/>
+	<reg32 offset="0x00e3" name="RBBM_PERFCTR_HLSQ_7_HI"/>
+	<reg32 offset="0x00e4" name="RBBM_PERFCTR_VPC_0_LO"/>
+	<reg32 offset="0x00e5" name="RBBM_PERFCTR_VPC_0_HI"/>
+	<reg32 offset="0x00e6" name="RBBM_PERFCTR_VPC_1_LO"/>
+	<reg32 offset="0x00e7" name="RBBM_PERFCTR_VPC_1_HI"/>
+	<reg32 offset="0x00e8" name="RBBM_PERFCTR_VPC_2_LO"/>
+	<reg32 offset="0x00e9" name="RBBM_PERFCTR_VPC_2_HI"/>
+	<reg32 offset="0x00ea" name="RBBM_PERFCTR_VPC_3_LO"/>
+	<reg32 offset="0x00eb" name="RBBM_PERFCTR_VPC_3_HI"/>
+	<reg32 offset="0x00ec" name="RBBM_PERFCTR_CCU_0_LO"/>
+	<reg32 offset="0x00ed" name="RBBM_PERFCTR_CCU_0_HI"/>
+	<reg32 offset="0x00ee" name="RBBM_PERFCTR_CCU_1_LO"/>
+	<reg32 offset="0x00ef" name="RBBM_PERFCTR_CCU_1_HI"/>
+	<reg32 offset="0x00f0" name="RBBM_PERFCTR_CCU_2_LO"/>
+	<reg32 offset="0x00f1" name="RBBM_PERFCTR_CCU_2_HI"/>
+	<reg32 offset="0x00f2" name="RBBM_PERFCTR_CCU_3_LO"/>
+	<reg32 offset="0x00f3" name="RBBM_PERFCTR_CCU_3_HI"/>
+	<reg32 offset="0x00f4" name="RBBM_PERFCTR_TSE_0_LO"/>
+	<reg32 offset="0x00f5" name="RBBM_PERFCTR_TSE_0_HI"/>
+	<reg32 offset="0x00f6" name="RBBM_PERFCTR_TSE_1_LO"/>
+	<reg32 offset="0x00f7" name="RBBM_PERFCTR_TSE_1_HI"/>
+	<reg32 offset="0x00f8" name="RBBM_PERFCTR_TSE_2_LO"/>
+	<reg32 offset="0x00f9" name="RBBM_PERFCTR_TSE_2_HI"/>
+	<reg32 offset="0x00fa" name="RBBM_PERFCTR_TSE_3_LO"/>
+	<reg32 offset="0x00fb" name="RBBM_PERFCTR_TSE_3_HI"/>
+	<reg32 offset="0x00fc" name="RBBM_PERFCTR_RAS_0_LO"/>
+	<reg32 offset="0x00fd" name="RBBM_PERFCTR_RAS_0_HI"/>
+	<reg32 offset="0x00fe" name="RBBM_PERFCTR_RAS_1_LO"/>
+	<reg32 offset="0x00ff" name="RBBM_PERFCTR_RAS_1_HI"/>
+	<reg32 offset="0x0100" name="RBBM_PERFCTR_RAS_2_LO"/>
+	<reg32 offset="0x0101" name="RBBM_PERFCTR_RAS_2_HI"/>
+	<reg32 offset="0x0102" name="RBBM_PERFCTR_RAS_3_LO"/>
+	<reg32 offset="0x0103" name="RBBM_PERFCTR_RAS_3_HI"/>
+	<reg32 offset="0x0104" name="RBBM_PERFCTR_UCHE_0_LO"/>
+	<reg32 offset="0x0105" name="RBBM_PERFCTR_UCHE_0_HI"/>
+	<reg32 offset="0x0106" name="RBBM_PERFCTR_UCHE_1_LO"/>
+	<reg32 offset="0x0107" name="RBBM_PERFCTR_UCHE_1_HI"/>
+	<reg32 offset="0x0108" name="RBBM_PERFCTR_UCHE_2_LO"/>
+	<reg32 offset="0x0109" name="RBBM_PERFCTR_UCHE_2_HI"/>
+	<reg32 offset="0x010a" name="RBBM_PERFCTR_UCHE_3_LO"/>
+	<reg32 offset="0x010b" name="RBBM_PERFCTR_UCHE_3_HI"/>
+	<reg32 offset="0x010c" name="RBBM_PERFCTR_UCHE_4_LO"/>
+	<reg32 offset="0x010d" name="RBBM_PERFCTR_UCHE_4_HI"/>
+	<reg32 offset="0x010e" name="RBBM_PERFCTR_UCHE_5_LO"/>
+	<reg32 offset="0x010f" name="RBBM_PERFCTR_UCHE_5_HI"/>
+	<reg32 offset="0x0110" name="RBBM_PERFCTR_UCHE_6_LO"/>
+	<reg32 offset="0x0111" name="RBBM_PERFCTR_UCHE_6_HI"/>
+	<reg32 offset="0x0112" name="RBBM_PERFCTR_UCHE_7_LO"/>
+	<reg32 offset="0x0113" name="RBBM_PERFCTR_UCHE_7_HI"/>
+	<reg32 offset="0x0114" name="RBBM_PERFCTR_TP_0_LO"/>
+	<reg32 offset="0x0115" name="RBBM_PERFCTR_TP_0_HI"/>
+	<reg32 offset="0x0116" name="RBBM_PERFCTR_TP_1_LO"/>
+	<reg32 offset="0x0117" name="RBBM_PERFCTR_TP_1_HI"/>
+	<reg32 offset="0x0118" name="RBBM_PERFCTR_TP_2_LO"/>
+	<reg32 offset="0x0119" name="RBBM_PERFCTR_TP_2_HI"/>
+	<reg32 offset="0x011a" name="RBBM_PERFCTR_TP_3_LO"/>
+	<reg32 offset="0x011b" name="RBBM_PERFCTR_TP_3_HI"/>
+	<reg32 offset="0x011c" name="RBBM_PERFCTR_TP_4_LO"/>
+	<reg32 offset="0x011d" name="RBBM_PERFCTR_TP_4_HI"/>
+	<reg32 offset="0x011e" name="RBBM_PERFCTR_TP_5_LO"/>
+	<reg32 offset="0x011f" name="RBBM_PERFCTR_TP_5_HI"/>
+	<reg32 offset="0x0120" name="RBBM_PERFCTR_TP_6_LO"/>
+	<reg32 offset="0x0121" name="RBBM_PERFCTR_TP_6_HI"/>
+	<reg32 offset="0x0122" name="RBBM_PERFCTR_TP_7_LO"/>
+	<reg32 offset="0x0123" name="RBBM_PERFCTR_TP_7_HI"/>
+	<reg32 offset="0x0124" name="RBBM_PERFCTR_SP_0_LO"/>
+	<reg32 offset="0x0125" name="RBBM_PERFCTR_SP_0_HI"/>
+	<reg32 offset="0x0126" name="RBBM_PERFCTR_SP_1_LO"/>
+	<reg32 offset="0x0127" name="RBBM_PERFCTR_SP_1_HI"/>
+	<reg32 offset="0x0128" name="RBBM_PERFCTR_SP_2_LO"/>
+	<reg32 offset="0x0129" name="RBBM_PERFCTR_SP_2_HI"/>
+	<reg32 offset="0x012a" name="RBBM_PERFCTR_SP_3_LO"/>
+	<reg32 offset="0x012b" name="RBBM_PERFCTR_SP_3_HI"/>
+	<reg32 offset="0x012c" name="RBBM_PERFCTR_SP_4_LO"/>
+	<reg32 offset="0x012d" name="RBBM_PERFCTR_SP_4_HI"/>
+	<reg32 offset="0x012e" name="RBBM_PERFCTR_SP_5_LO"/>
+	<reg32 offset="0x012f" name="RBBM_PERFCTR_SP_5_HI"/>
+	<reg32 offset="0x0130" name="RBBM_PERFCTR_SP_6_LO"/>
+	<reg32 offset="0x0131" name="RBBM_PERFCTR_SP_6_HI"/>
+	<reg32 offset="0x0132" name="RBBM_PERFCTR_SP_7_LO"/>
+	<reg32 offset="0x0133" name="RBBM_PERFCTR_SP_7_HI"/>
+	<reg32 offset="0x0134" name="RBBM_PERFCTR_SP_8_LO"/>
+	<reg32 offset="0x0135" name="RBBM_PERFCTR_SP_8_HI"/>
+	<reg32 offset="0x0136" name="RBBM_PERFCTR_SP_9_LO"/>
+	<reg32 offset="0x0137" name="RBBM_PERFCTR_SP_9_HI"/>
+	<reg32 offset="0x0138" name="RBBM_PERFCTR_SP_10_LO"/>
+	<reg32 offset="0x0139" name="RBBM_PERFCTR_SP_10_HI"/>
+	<reg32 offset="0x013a" name="RBBM_PERFCTR_SP_11_LO"/>
+	<reg32 offset="0x013b" name="RBBM_PERFCTR_SP_11_HI"/>
+	<reg32 offset="0x013c" name="RBBM_PERFCTR_RB_0_LO"/>
+	<reg32 offset="0x013d" name="RBBM_PERFCTR_RB_0_HI"/>
+	<reg32 offset="0x013e" name="RBBM_PERFCTR_RB_1_LO"/>
+	<reg32 offset="0x013f" name="RBBM_PERFCTR_RB_1_HI"/>
+	<reg32 offset="0x0140" name="RBBM_PERFCTR_RB_2_LO"/>
+	<reg32 offset="0x0141" name="RBBM_PERFCTR_RB_2_HI"/>
+	<reg32 offset="0x0142" name="RBBM_PERFCTR_RB_3_LO"/>
+	<reg32 offset="0x0143" name="RBBM_PERFCTR_RB_3_HI"/>
+	<reg32 offset="0x0144" name="RBBM_PERFCTR_RB_4_LO"/>
+	<reg32 offset="0x0145" name="RBBM_PERFCTR_RB_4_HI"/>
+	<reg32 offset="0x0146" name="RBBM_PERFCTR_RB_5_LO"/>
+	<reg32 offset="0x0147" name="RBBM_PERFCTR_RB_5_HI"/>
+	<reg32 offset="0x0148" name="RBBM_PERFCTR_RB_6_LO"/>
+	<reg32 offset="0x0149" name="RBBM_PERFCTR_RB_6_HI"/>
+	<reg32 offset="0x014a" name="RBBM_PERFCTR_RB_7_LO"/>
+	<reg32 offset="0x014b" name="RBBM_PERFCTR_RB_7_HI"/>
+	<reg32 offset="0x014c" name="RBBM_PERFCTR_VSC_0_LO"/>
+	<reg32 offset="0x014d" name="RBBM_PERFCTR_VSC_0_HI"/>
+	<reg32 offset="0x014e" name="RBBM_PERFCTR_VSC_1_LO"/>
+	<reg32 offset="0x014f" name="RBBM_PERFCTR_VSC_1_HI"/>
+	<reg32 offset="0x0166" name="RBBM_PERFCTR_PWR_0_LO"/>
+	<reg32 offset="0x0167" name="RBBM_PERFCTR_PWR_0_HI"/>
+	<reg32 offset="0x0168" name="RBBM_PERFCTR_PWR_1_LO"/>
+	<reg32 offset="0x0169" name="RBBM_PERFCTR_PWR_1_HI"/>
+	<reg32 offset="0x016e" name="RBBM_ALWAYSON_COUNTER_LO"/>
+	<reg32 offset="0x016f" name="RBBM_ALWAYSON_COUNTER_HI"/>
+	<array offset="0x0068" name="RBBM_CLOCK_CTL_SP" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<array offset="0x006c" name="RBBM_CLOCK_CTL2_SP" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<array offset="0x0070" name="RBBM_CLOCK_HYST_SP" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<array offset="0x0074" name="RBBM_CLOCK_DELAY_SP" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<array offset="0x0078" name="RBBM_CLOCK_CTL_RB" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<array offset="0x007c" name="RBBM_CLOCK_CTL2_RB" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<array offset="0x0082" name="RBBM_CLOCK_CTL_MARB_CCU" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<array offset="0x0086" name="RBBM_CLOCK_HYST_RB_MARB_CCU" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<reg32 offset="0x0080" name="RBBM_CLOCK_HYST_COM_DCOM"/>
+	<reg32 offset="0x0081" name="RBBM_CLOCK_CTL_COM_DCOM"/>
+	<reg32 offset="0x008a" name="RBBM_CLOCK_CTL_HLSQ"/>
+	<reg32 offset="0x008b" name="RBBM_CLOCK_HYST_HLSQ"/>
+	<reg32 offset="0x008c" name="RBBM_CLOCK_DELAY_HLSQ"/>
+	<bitset name="A4XX_CGC_HLSQ">
+		<bitfield name="EARLY_CYC" low="20" high="22" type="uint"/>
+	</bitset>
+	<reg32 offset="0x008d" name="RBBM_CLOCK_DELAY_COM_DCOM"/>
+	<array offset="0x008e" name="RBBM_CLOCK_DELAY_RB_MARB_CCU_L1" stride="1" length="4">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<bitset name="A4XX_INT0">
+		<bitfield name="RBBM_GPU_IDLE" pos="0" type="boolean"/>
+		<bitfield name="RBBM_AHB_ERROR" pos="1" type="boolean"/>
+		<bitfield name="RBBM_REG_TIMEOUT" pos="2" type="boolean"/>
+		<bitfield name="RBBM_ME_MS_TIMEOUT" pos="3" type="boolean"/>
+		<bitfield name="RBBM_PFP_MS_TIMEOUT" pos="4" type="boolean"/>
+		<bitfield name="RBBM_ATB_BUS_OVERFLOW" pos="5" type="boolean"/>
+		<bitfield name="VFD_ERROR" pos="6" type="boolean"/>
+		<bitfield name="CP_SW_INT" pos="7" type="boolean"/>
+		<bitfield name="CP_T0_PACKET_IN_IB" pos="8" type="boolean"/>
+		<bitfield name="CP_OPCODE_ERROR" pos="9" type="boolean"/>
+		<bitfield name="CP_RESERVED_BIT_ERROR" pos="10" type="boolean"/>
+		<bitfield name="CP_HW_FAULT" pos="11" type="boolean"/>
+		<bitfield name="CP_DMA" pos="12" type="boolean"/>
+		<bitfield name="CP_IB2_INT" pos="13" type="boolean"/>
+		<bitfield name="CP_IB1_INT" pos="14" type="boolean"/>
+		<bitfield name="CP_RB_INT" pos="15" type="boolean"/>
+		<bitfield name="CP_REG_PROTECT_FAULT" pos="16" type="boolean"/>
+		<bitfield name="CP_RB_DONE_TS" pos="17" type="boolean"/>
+		<bitfield name="CP_VS_DONE_TS" pos="18" type="boolean"/>
+		<bitfield name="CP_PS_DONE_TS" pos="19" type="boolean"/>
+		<bitfield name="CACHE_FLUSH_TS" pos="20" type="boolean"/>
+		<bitfield name="CP_AHB_ERROR_HALT" pos="21" type="boolean"/>
+		<bitfield name="MISC_HANG_DETECT" pos="24" type="boolean"/>
+		<bitfield name="UCHE_OOB_ACCESS" pos="25" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x0099" name="RBBM_SP_REGFILE_SLEEP_CNTL_0"/>
+	<reg32 offset="0x009a" name="RBBM_SP_REGFILE_SLEEP_CNTL_1"/>
+	<reg32 offset="0x0170" name="RBBM_PERFCTR_CTL"/>
+	<reg32 offset="0x0171" name="RBBM_PERFCTR_LOAD_CMD0"/>
+	<reg32 offset="0x0172" name="RBBM_PERFCTR_LOAD_CMD1"/>
+	<reg32 offset="0x0173" name="RBBM_PERFCTR_LOAD_CMD2"/>
+	<reg32 offset="0x0174" name="RBBM_PERFCTR_LOAD_VALUE_LO"/>
+	<reg32 offset="0x0175" name="RBBM_PERFCTR_LOAD_VALUE_HI"/>
+	<reg32 offset="0x0176" name="RBBM_PERFCTR_RBBM_SEL_0" type="a4xx_rbbm_perfcounter_select"/>
+	<reg32 offset="0x0177" name="RBBM_PERFCTR_RBBM_SEL_1" type="a4xx_rbbm_perfcounter_select"/>
+	<reg32 offset="0x0178" name="RBBM_PERFCTR_RBBM_SEL_2" type="a4xx_rbbm_perfcounter_select"/>
+	<reg32 offset="0x0179" name="RBBM_PERFCTR_RBBM_SEL_3" type="a4xx_rbbm_perfcounter_select"/>
+	<reg32 offset="0x017a" name="RBBM_GPU_BUSY_MASKED"/>
+	<reg32 offset="0x017d" name="RBBM_INT_0_STATUS"/>
+	<reg32 offset="0x0182" name="RBBM_CLOCK_STATUS"/>
+	<reg32 offset="0x0189" name="RBBM_AHB_STATUS"/>
+	<reg32 offset="0x018c" name="RBBM_AHB_ME_SPLIT_STATUS"/>
+	<reg32 offset="0x018d" name="RBBM_AHB_PFP_SPLIT_STATUS"/>
+	<reg32 offset="0x018f" name="RBBM_AHB_ERROR_STATUS"/>
+	<reg32 offset="0x0191" name="RBBM_STATUS">
+		<bitfield name="HI_BUSY" pos="0" type="boolean"/>
+		<bitfield name="CP_ME_BUSY" pos="1" type="boolean"/>
+		<bitfield name="CP_PFP_BUSY" pos="2" type="boolean"/>
+		<bitfield name="CP_NRT_BUSY" pos="14" type="boolean"/>
+		<bitfield name="VBIF_BUSY" pos="15" type="boolean"/>
+		<bitfield name="TSE_BUSY" pos="16" type="boolean"/>
+		<bitfield name="RAS_BUSY" pos="17" type="boolean"/>
+		<bitfield name="RB_BUSY" pos="18" type="boolean"/>
+		<bitfield name="PC_DCALL_BUSY" pos="19" type="boolean"/>
+		<bitfield name="PC_VSD_BUSY" pos="20" type="boolean"/>
+		<bitfield name="VFD_BUSY" pos="21" type="boolean"/>
+		<bitfield name="VPC_BUSY" pos="22" type="boolean"/>
+		<bitfield name="UCHE_BUSY" pos="23" type="boolean"/>
+		<bitfield name="SP_BUSY" pos="24" type="boolean"/>
+		<bitfield name="TPL1_BUSY" pos="25" type="boolean"/>
+		<bitfield name="MARB_BUSY" pos="26" type="boolean"/>
+		<bitfield name="VSC_BUSY" pos="27" type="boolean"/>
+		<bitfield name="ARB_BUSY" pos="28" type="boolean"/>
+		<bitfield name="HLSQ_BUSY" pos="29" type="boolean"/>
+		<bitfield name="GPU_BUSY_NOHC" pos="30" type="boolean"/>
+		<bitfield name="GPU_BUSY" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x019f" name="RBBM_INTERFACE_RRDY_STATUS5"/>
+	<reg32 offset="0x01b0" name="RBBM_POWER_STATUS">
+		<bitfield name="SP_TP_PWR_ON" pos="20" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x01b8" name="RBBM_WAIT_IDLE_CLOCKS_CTL2"/>
+
+	<!-- CP registers -->
+	<reg32 offset="0x0228" name="CP_SCRATCH_UMASK"/>
+	<reg32 offset="0x0229" name="CP_SCRATCH_ADDR"/>
+	<reg32 offset="0x0200" name="CP_RB_BASE"/>
+	<reg32 offset="0x0201" name="CP_RB_CNTL"/>
+	<reg32 offset="0x0205" name="CP_RB_WPTR"/>
+	<reg32 offset="0x0203" name="CP_RB_RPTR_ADDR"/>
+	<reg32 offset="0x0204" name="CP_RB_RPTR"/>
+	<reg32 offset="0x0206" name="CP_IB1_BASE"/>
+	<reg32 offset="0x0207" name="CP_IB1_BUFSZ"/>
+	<reg32 offset="0x0208" name="CP_IB2_BASE"/>
+	<reg32 offset="0x0209" name="CP_IB2_BUFSZ"/>
+	<reg32 offset="0x020c" name="CP_ME_NRT_ADDR"/>
+	<reg32 offset="0x020d" name="CP_ME_NRT_DATA"/>
+	<reg32 offset="0x0217" name="CP_ME_RB_DONE_DATA"/>
+	<reg32 offset="0x0219" name="CP_QUEUE_THRESH2"/>
+	<reg32 offset="0x021b" name="CP_MERCIU_SIZE"/>
+	<reg32 offset="0x021c" name="CP_ROQ_ADDR"/>
+	<reg32 offset="0x021d" name="CP_ROQ_DATA"/>
+	<reg32 offset="0x021e" name="CP_MEQ_ADDR"/>
+	<reg32 offset="0x021f" name="CP_MEQ_DATA"/>
+	<reg32 offset="0x0220" name="CP_MERCIU_ADDR"/>
+	<reg32 offset="0x0221" name="CP_MERCIU_DATA"/>
+	<reg32 offset="0x0222" name="CP_MERCIU_DATA2"/>
+	<reg32 offset="0x0223" name="CP_PFP_UCODE_ADDR"/>
+	<reg32 offset="0x0224" name="CP_PFP_UCODE_DATA"/>
+	<reg32 offset="0x0225" name="CP_ME_RAM_WADDR"/>
+	<reg32 offset="0x0226" name="CP_ME_RAM_RADDR"/>
+	<reg32 offset="0x0227" name="CP_ME_RAM_DATA"/>
+	<reg32 offset="0x022a" name="CP_PREEMPT"/>
+	<reg32 offset="0x022c" name="CP_CNTL"/>
+	<reg32 offset="0x022d" name="CP_ME_CNTL"/>
+	<reg32 offset="0x022e" name="CP_DEBUG"/>
+	<reg32 offset="0x0231" name="CP_DEBUG_ECO_CONTROL"/>
+	<reg32 offset="0x0232" name="CP_DRAW_STATE_ADDR"/>
+	<array offset="0x0240" name="CP_PROTECT" stride="1" length="16">
+		<reg32 offset="0x0" name="REG" type="adreno_cp_protect"/>
+	</array>
+	<reg32 offset="0x0250" name="CP_PROTECT_CTRL"/>
+	<reg32 offset="0x04c0" name="CP_ST_BASE"/>
+	<reg32 offset="0x04ce" name="CP_STQ_AVAIL"/>
+	<reg32 offset="0x04d0" name="CP_MERCIU_STAT"/>
+	<reg32 offset="0x04d2" name="CP_WFI_PEND_CTR"/>
+	<reg32 offset="0x04d8" name="CP_HW_FAULT"/>
+	<reg32 offset="0x04da" name="CP_PROTECT_STATUS"/>
+	<reg32 offset="0x04dd" name="CP_EVENTS_IN_FLIGHT"/>
+	<reg32 offset="0x0500" name="CP_PERFCTR_CP_SEL_0" type="a4xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0501" name="CP_PERFCTR_CP_SEL_1" type="a4xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0502" name="CP_PERFCTR_CP_SEL_2" type="a4xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0503" name="CP_PERFCTR_CP_SEL_3" type="a4xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0504" name="CP_PERFCTR_CP_SEL_4" type="a4xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0505" name="CP_PERFCTR_CP_SEL_5" type="a4xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0506" name="CP_PERFCTR_CP_SEL_6" type="a4xx_cp_perfcounter_select"/>
+	<reg32 offset="0x0507" name="CP_PERFCTR_CP_SEL_7" type="a4xx_cp_perfcounter_select"/>
+	<reg32 offset="0x050b" name="CP_PERFCOMBINER_SELECT"/>
+	<array offset="0x0578" name="CP_SCRATCH" stride="1" length="23">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+
+
+	<!-- SP registers -->
+	<reg32 offset="0x0ec0" name="SP_VS_STATUS"/>
+	<reg32 offset="0x0ec3" name="SP_MODE_CONTROL"/>
+
+	<reg32 offset="0x0ec4" name="SP_PERFCTR_SP_SEL_0" type="a4xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ec5" name="SP_PERFCTR_SP_SEL_1" type="a4xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ec6" name="SP_PERFCTR_SP_SEL_2" type="a4xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ec7" name="SP_PERFCTR_SP_SEL_3" type="a4xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ec8" name="SP_PERFCTR_SP_SEL_4" type="a4xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ec9" name="SP_PERFCTR_SP_SEL_5" type="a4xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0eca" name="SP_PERFCTR_SP_SEL_6" type="a4xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ecb" name="SP_PERFCTR_SP_SEL_7" type="a4xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ecc" name="SP_PERFCTR_SP_SEL_8" type="a4xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ecd" name="SP_PERFCTR_SP_SEL_9" type="a4xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ece" name="SP_PERFCTR_SP_SEL_10" type="a4xx_sp_perfcounter_select"/>
+	<reg32 offset="0x0ecf" name="SP_PERFCTR_SP_SEL_11" type="a4xx_sp_perfcounter_select"/>
+
+	<reg32 offset="0x22c0" name="SP_SP_CTRL_REG">
+		<bitfield name="BINNING_PASS" pos="19" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x22c1" name="SP_INSTR_CACHE_CTRL">
+		<!-- set when VS in buffer mode: -->
+		<bitfield name="VS_BUFFER" pos="7" type="boolean"/>
+		<!-- set when FS in buffer mode: -->
+		<bitfield name="FS_BUFFER" pos="8" type="boolean"/>
+		<!-- set when both VS or FS in buffer mode: -->
+		<bitfield name="INSTR_BUFFER" pos="10" type="boolean"/>
+		<!-- TODO other bits probably matter when other stages active? -->
+	</reg32>
+
+	<bitset name="a4xx_sp_vs_fs_ctrl_reg0" inline="yes">
+		<!--
+			NOTE that SP_{VS,FS}_CTRL_REG1 are different, but so far REG0
+			appears to be the same..
+		-->
+		<bitfield name="THREADMODE" pos="0" type="a3xx_threadmode"/>
+		<!-- VARYING bit only for FS.. think it controls emitting (ei) flag? -->
+		<bitfield name="VARYING" pos="1" type="boolean"/>
+		<!-- maybe CACHEINVALID is two bits?? -->
+		<bitfield name="CACHEINVALID" pos="2" type="boolean"/>
+		<doc>
+			The full/half register footprint is in units of four components,
+			so if r0.x is used, that counts as all of r0.[xyzw] as used.
+			There are separate full/half register footprint values as the
+			full and half registers are independent (not overlapping).
+			Presumably the thread scheduler hardware allocates the full/half
+			register names from the actual physical register file and
+			handles the register renaming.
+		</doc>
+		<bitfield name="HALFREGFOOTPRINT" low="4" high="9" type="uint"/>
+		<bitfield name="FULLREGFOOTPRINT" low="10" high="15" type="uint"/>
+		<!-- maybe INOUTREGOVERLAP is a bitflag? -->
+		<bitfield name="INOUTREGOVERLAP" low="18" high="19" type="uint"/>
+		<bitfield name="THREADSIZE" pos="20" type="a3xx_threadsize"/>
+		<bitfield name="SUPERTHREADMODE" pos="21" type="boolean"/>
+		<bitfield name="PIXLODENABLE" pos="22" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0x22c4" name="SP_VS_CTRL_REG0" type="a4xx_sp_vs_fs_ctrl_reg0"/>
+	<reg32 offset="0x22c5" name="SP_VS_CTRL_REG1">
+		<bitfield name="CONSTLENGTH" low="0" high="7" type="uint"/>
+		<bitfield name="INITIALOUTSTANDING" low="24" high="30" type="uint"/>
+	</reg32>
+	<reg32 offset="0x22c6" name="SP_VS_PARAM_REG">
+		<bitfield name="POSREGID" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="PSIZEREGID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="TOTALVSOUTVAR" low="20" high="31" type="uint"/>
+	</reg32>
+	<array offset="0x22c7" name="SP_VS_OUT" stride="1" length="16">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="A_REGID" low="0" high="8" type="a3xx_regid"/>
+			<bitfield name="A_COMPMASK" low="9" high="12" type="hex"/>
+			<bitfield name="B_REGID" low="16" high="24" type="a3xx_regid"/>
+			<bitfield name="B_COMPMASK" low="25" high="28" type="hex"/>
+		</reg32>
+	</array>
+	<array offset="0x22d8" name="SP_VS_VPC_DST" stride="1" length="8">
+		<reg32 offset="0x0" name="REG">
+			<doc>
+				These seem to be offsets for storage of the varyings.
+				Always seems to start from 8, possibly loc 0 and 4
+				are for gl_Position and gl_PointSize?
+			</doc>
+			<bitfield name="OUTLOC0" low="0" high="7" type="uint"/>
+			<bitfield name="OUTLOC1" low="8" high="15" type="uint"/>
+			<bitfield name="OUTLOC2" low="16" high="23" type="uint"/>
+			<bitfield name="OUTLOC3" low="24" high="31" type="uint"/>
+		</reg32>
+	</array>
+
+	<reg32 offset="0x22e0" name="SP_VS_OBJ_OFFSET_REG">
+		<!-- always 00000000: -->
+		<doc>
+			From register spec:
+			SP_FS_OBJ_OFFSET_REG.CONSTOBJECTSTARTOFFSET [16:24]: Constant object
+			start offset in on chip RAM,
+			128bit aligned
+		</doc>
+		<bitfield name="CONSTOBJECTOFFSET" low="16" high="24" type="uint"/>
+		<bitfield name="SHADEROBJOFFSET" low="25" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x22e1" name="SP_VS_OBJ_START"/>
+	<reg32 offset="0x22e2" name="SP_VS_PVT_MEM_PARAM"/>
+	<reg32 offset="0x22e3" name="SP_VS_PVT_MEM_ADDR"/>
+	<reg32 offset="0x22e5" name="SP_VS_LENGTH_REG" type="uint"/>
+	<reg32 offset="0x22e8" name="SP_FS_CTRL_REG0" type="a4xx_sp_vs_fs_ctrl_reg0"/>
+	<reg32 offset="0x22e9" name="SP_FS_CTRL_REG1">
+		<bitfield name="CONSTLENGTH" low="0" high="7" type="uint"/>
+		<bitfield name="FACENESS" pos="19" type="boolean"/>
+		<bitfield name="VARYING" pos="20" type="boolean"/>
+		<bitfield name="FRAGCOORD" pos="21" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x22ea" name="SP_FS_OBJ_OFFSET_REG">
+		<bitfield name="CONSTOBJECTOFFSET" low="16" high="24" type="uint"/>
+		<bitfield name="SHADEROBJOFFSET" low="25" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x22eb" name="SP_FS_OBJ_START"/>
+	<reg32 offset="0x22ec" name="SP_FS_PVT_MEM_PARAM"/>
+	<reg32 offset="0x22ed" name="SP_FS_PVT_MEM_ADDR"/>
+	<reg32 offset="0x22ef" name="SP_FS_LENGTH_REG" type="uint"/>
+	<reg32 offset="0x22f0" name="SP_FS_OUTPUT_REG">
+		<bitfield name="MRT" low="0" high="3" type="uint"/>
+		<bitfield name="DEPTH_ENABLE" pos="7" type="boolean"/>
+		<!-- TODO double check.. for now assume same as a3xx -->
+		<bitfield name="DEPTH_REGID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="SAMPLEMASK_REGID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<array offset="0x22f1" name="SP_FS_MRT" stride="1" length="8">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="REGID" low="0" high="7" type="a3xx_regid"/>
+			<bitfield name="HALF_PRECISION" pos="8" type="boolean"/>
+			<bitfield name="COLOR_SINT" pos="10" type="boolean"/>
+			<bitfield name="COLOR_UINT" pos="11" type="boolean"/>
+			<bitfield name="MRTFORMAT" low="12" high="17" type="a4xx_color_fmt"/>
+			<bitfield name="COLOR_SRGB" pos="18" type="boolean"/>
+		</reg32>
+	</array>
+	<reg32 offset="0x2300" name="SP_CS_CTRL_REG0" type="a4xx_sp_vs_fs_ctrl_reg0"/>
+	<reg32 offset="0x2301" name="SP_CS_OBJ_OFFSET_REG"/>
+	<reg32 offset="0x2302" name="SP_CS_OBJ_START"/>
+	<reg32 offset="0x2303" name="SP_CS_PVT_MEM_PARAM"/>
+	<reg32 offset="0x2304" name="SP_CS_PVT_MEM_ADDR"/>
+	<reg32 offset="0x2305" name="SP_CS_PVT_MEM_SIZE"/>
+	<reg32 offset="0x2306" name="SP_CS_LENGTH_REG" type="uint"/>
+	<reg32 offset="0x230d" name="SP_HS_OBJ_OFFSET_REG">
+		<bitfield name="CONSTOBJECTOFFSET" low="16" high="24" type="uint"/>
+		<bitfield name="SHADEROBJOFFSET" low="25" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x230e" name="SP_HS_OBJ_START"/>
+	<reg32 offset="0x230f" name="SP_HS_PVT_MEM_PARAM"/>
+	<reg32 offset="0x2310" name="SP_HS_PVT_MEM_ADDR"/>
+	<reg32 offset="0x2312" name="SP_HS_LENGTH_REG" type="uint"/>
+
+	<reg32 offset="0x231a" name="SP_DS_PARAM_REG">
+		<bitfield name="POSREGID" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="TOTALGSOUTVAR" low="20" high="31" type="uint"/>
+	</reg32>
+	<array offset="0x231b" name="SP_DS_OUT" stride="1" length="16">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="A_REGID" low="0" high="8" type="a3xx_regid"/>
+			<bitfield name="A_COMPMASK" low="9" high="12" type="hex"/>
+			<bitfield name="B_REGID" low="16" high="24" type="a3xx_regid"/>
+			<bitfield name="B_COMPMASK" low="25" high="28" type="hex"/>
+		</reg32>
+	</array>
+	<array offset="0x232c" name="SP_DS_VPC_DST" stride="1" length="8">
+		<reg32 offset="0x0" name="REG">
+			<doc>
+				These seem to be offsets for storage of the varyings.
+				Always seems to start from 8, possibly loc 0 and 4
+				are for gl_Position and gl_PointSize?
+			</doc>
+			<bitfield name="OUTLOC0" low="0" high="7" type="uint"/>
+			<bitfield name="OUTLOC1" low="8" high="15" type="uint"/>
+			<bitfield name="OUTLOC2" low="16" high="23" type="uint"/>
+			<bitfield name="OUTLOC3" low="24" high="31" type="uint"/>
+		</reg32>
+	</array>
+	<reg32 offset="0x2334" name="SP_DS_OBJ_OFFSET_REG">
+		<bitfield name="CONSTOBJECTOFFSET" low="16" high="24" type="uint"/>
+		<bitfield name="SHADEROBJOFFSET" low="25" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2335" name="SP_DS_OBJ_START"/>
+	<reg32 offset="0x2336" name="SP_DS_PVT_MEM_PARAM"/>
+	<reg32 offset="0x2337" name="SP_DS_PVT_MEM_ADDR"/>
+	<reg32 offset="0x2339" name="SP_DS_LENGTH_REG" type="uint"/>
+
+	<reg32 offset="0x2341" name="SP_GS_PARAM_REG">
+		<bitfield name="POSREGID" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="PRIMREGID" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="TOTALGSOUTVAR" low="20" high="31" type="uint"/>
+	</reg32>
+	<array offset="0x2342" name="SP_GS_OUT" stride="1" length="16">
+		<reg32 offset="0x0" name="REG">
+			<bitfield name="A_REGID" low="0" high="8" type="a3xx_regid"/>
+			<bitfield name="A_COMPMASK" low="9" high="12" type="hex"/>
+			<bitfield name="B_REGID" low="16" high="24" type="a3xx_regid"/>
+			<bitfield name="B_COMPMASK" low="25" high="28" type="hex"/>
+		</reg32>
+	</array>
+	<array offset="0x2353" name="SP_GS_VPC_DST" stride="1" length="8">
+		<reg32 offset="0x0" name="REG">
+			<doc>
+				These seem to be offsets for storage of the varyings.
+				Always seems to start from 8, possibly loc 0 and 4
+				are for gl_Position and gl_PointSize?
+			</doc>
+			<bitfield name="OUTLOC0" low="0" high="7" type="uint"/>
+			<bitfield name="OUTLOC1" low="8" high="15" type="uint"/>
+			<bitfield name="OUTLOC2" low="16" high="23" type="uint"/>
+			<bitfield name="OUTLOC3" low="24" high="31" type="uint"/>
+		</reg32>
+	</array>
+	<reg32 offset="0x235b" name="SP_GS_OBJ_OFFSET_REG">
+		<bitfield name="CONSTOBJECTOFFSET" low="16" high="24" type="uint"/>
+		<bitfield name="SHADEROBJOFFSET" low="25" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x235c" name="SP_GS_OBJ_START"/>
+	<reg32 offset="0x235d" name="SP_GS_PVT_MEM_PARAM"/>
+	<reg32 offset="0x235e" name="SP_GS_PVT_MEM_ADDR"/>
+	<reg32 offset="0x2360" name="SP_GS_LENGTH_REG" type="uint"/>
+
+	<!-- VPC registers -->
+	<reg32 offset="0x0e60" name="VPC_DEBUG_RAM_SEL"/>
+	<reg32 offset="0x0e61" name="VPC_DEBUG_RAM_READ"/>
+	<reg32 offset="0x0e64" name="VPC_DEBUG_ECO_CONTROL"/>
+	<reg32 offset="0x0e65" name="VPC_PERFCTR_VPC_SEL_0" type="a4xx_vpc_perfcounter_select"/>
+	<reg32 offset="0x0e66" name="VPC_PERFCTR_VPC_SEL_1" type="a4xx_vpc_perfcounter_select"/>
+	<reg32 offset="0x0e67" name="VPC_PERFCTR_VPC_SEL_2" type="a4xx_vpc_perfcounter_select"/>
+	<reg32 offset="0x0e68" name="VPC_PERFCTR_VPC_SEL_3" type="a4xx_vpc_perfcounter_select"/>
+	<reg32 offset="0x2140" name="VPC_ATTR">
+		<bitfield name="TOTALATTR" low="0" high="8" type="uint"/>
+		<!-- PSIZE bit set if gl_PointSize written: -->
+		<bitfield name="PSIZE" pos="9" type="boolean"/>
+		<bitfield name="THRDASSIGN" low="12" high="13" type="uint"/>
+		<bitfield name="ENABLE" pos="25" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2141" name="VPC_PACK">
+		<bitfield name="NUMBYPASSVAR" low="0" high="7" type="uint"/>
+		<bitfield name="NUMFPNONPOSVAR" low="8" high="15" type="uint"/>
+		<bitfield name="NUMNONPOSVSVAR" low="16" high="23" type="uint"/>
+	</reg32>
+	<array offset="0x2142" name="VPC_VARYING_INTERP" stride="1" length="8">
+		<reg32 offset="0x0" name="MODE"/>
+	</array>
+	<array offset="0x214a" name="VPC_VARYING_PS_REPL" stride="1" length="8">
+		<reg32 offset="0x0" name="MODE"/>
+	</array>
+
+	<reg32 offset="0x216e" name="VPC_SO_FLUSH_WADDR_3"/>
+
+	<!-- VSC registers -->
+	<reg32 offset="0x0c00" name="VSC_BIN_SIZE">
+		<bitfield name="WIDTH" low="0" high="4" shr="5" type="uint"/>
+		<bitfield name="HEIGHT" low="5" high="9" shr="5" type="uint"/>
+	</reg32>
+	<reg32 offset="0x0c01" name="VSC_SIZE_ADDRESS"/>
+	<reg32 offset="0x0c02" name="VSC_SIZE_ADDRESS2"/>
+	<reg32 offset="0x0c03" name="VSC_DEBUG_ECO_CONTROL"/>
+	<array offset="0x0c08" name="VSC_PIPE_CONFIG" stride="1" length="8">
+		<reg32 offset="0x0" name="REG">
+			<doc>
+				Configures the mapping between VSC_PIPE buffer and
+				bin, X/Y specify the bin index in the horiz/vert
+				direction (0,0 is upper left, 0,1 is leftmost bin
+				on second row, and so on).  W/H specify the number
+				of bins assigned to this VSC_PIPE in the horiz/vert
+				dimension.
+			</doc>
+			<bitfield name="X" low="0" high="9" type="uint"/>
+			<bitfield name="Y" low="10" high="19" type="uint"/>
+			<bitfield name="W" low="20" high="23" type="uint"/>
+			<bitfield name="H" low="24" high="27" type="uint"/>
+		</reg32>
+	</array>
+	<array offset="0x0c10" name="VSC_PIPE_DATA_ADDRESS" stride="1" length="8">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<array offset="0x0c18" name="VSC_PIPE_DATA_LENGTH" stride="1" length="8">
+		<reg32 offset="0x0" name="REG"/>
+	</array>
+	<reg32 offset="0x0c41" name="VSC_PIPE_PARTIAL_POSN_1"/>
+	<reg32 offset="0x0c50" name="VSC_PERFCTR_VSC_SEL_0" type="a4xx_vsc_perfcounter_select"/>
+	<reg32 offset="0x0c51" name="VSC_PERFCTR_VSC_SEL_1" type="a4xx_vsc_perfcounter_select"/>
+
+	<!-- VFD registers -->
+	<reg32 offset="0x0e40" name="VFD_DEBUG_CONTROL"/>
+	<reg32 offset="0x0e43" name="VFD_PERFCTR_VFD_SEL_0" type="a4xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e44" name="VFD_PERFCTR_VFD_SEL_1" type="a4xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e45" name="VFD_PERFCTR_VFD_SEL_2" type="a4xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e46" name="VFD_PERFCTR_VFD_SEL_3" type="a4xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e47" name="VFD_PERFCTR_VFD_SEL_4" type="a4xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e48" name="VFD_PERFCTR_VFD_SEL_5" type="a4xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e49" name="VFD_PERFCTR_VFD_SEL_6" type="a4xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x0e4a" name="VFD_PERFCTR_VFD_SEL_7" type="a4xx_vfd_perfcounter_select"/>
+	<reg32 offset="0x21d0" name="VGT_CL_INITIATOR"/>
+	<reg32 offset="0x21d9" name="VGT_EVENT_INITIATOR"/>
+	<reg32 offset="0x2200" name="VFD_CONTROL_0">
+		<doc>
+			TOTALATTRTOVS is # of attributes to vertex shader, in register
+			slots (ie. vec4+vec3 -> 7)
+		</doc>
+		<bitfield name="TOTALATTRTOVS" low="0" high="7" type="uint"/>
+		<doc>
+		BYPASSATTROVS seems to count varyings that are just directly
+		assigned from attributes (ie, "vFoo = aFoo;")
+		</doc>
+		<bitfield name="BYPASSATTROVS" low="9" high="16" type="uint"/>
+		<doc>STRMDECINSTRCNT is # of VFD_DECODE_INSTR registers valid</doc>
+		<bitfield name="STRMDECINSTRCNT" low="20" high="25" type="uint"/>
+		<doc>STRMFETCHINSTRCNT is # of VFD_FETCH_INSTR registers valid</doc>
+		<bitfield name="STRMFETCHINSTRCNT" low="26" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2201" name="VFD_CONTROL_1">
+		<doc>MAXSTORAGE could be # of attributes/vbo's</doc>
+		<bitfield name="MAXSTORAGE" low="0" high="15" type="uint"/>
+		<bitfield name="REGID4VTX" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="REGID4INST" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0x2202" name="VFD_CONTROL_2"/>
+	<reg32 offset="0x2203" name="VFD_CONTROL_3">
+		<bitfield name="REGID_VTXCNT" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="REGID_TESSX" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="REGID_TESSY" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0x2204" name="VFD_CONTROL_4"/>
+	<reg32 offset="0x2208" name="VFD_INDEX_OFFSET"/>
+	<array offset="0x220a" name="VFD_FETCH" stride="4" length="32">
+		<reg32 offset="0x0" name="INSTR_0">
+			<bitfield name="FETCHSIZE" low="0" high="6" type="uint"/>
+			<bitfield name="BUFSTRIDE" low="7" high="16" type="uint"/>
+			<bitfield name="SWITCHNEXT" pos="19" type="boolean"/>
+			<bitfield name="INSTANCED" pos="20" type="boolean"/>
+		</reg32>
+		<reg32 offset="0x1" name="INSTR_1"/>
+		<reg32 offset="0x2" name="INSTR_2">
+			<bitfield name="SIZE" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="0x3" name="INSTR_3">
+			<!-- might well be bigger.. -->
+			<bitfield name="STEPRATE" low="0" high="8" type="uint"/>
+		</reg32>
+	</array>
+	<array offset="0x228a" name="VFD_DECODE" stride="1" length="32">
+		<reg32 offset="0x0" name="INSTR">
+			<bitfield name="WRITEMASK" low="0" high="3" type="hex"/>
+			<!-- not sure if this is a bit flag and another flag above it, or?? -->
+			<bitfield name="CONSTFILL" pos="4" type="boolean"/>
+			<bitfield name="FORMAT" low="6" high="11" type="a4xx_vtx_fmt"/>
+			<bitfield name="REGID" low="12" high="19" type="a3xx_regid"/>
+			<bitfield name="INT" pos="20" type="boolean"/>
+			<doc>SHIFTCNT appears to be size, ie. FLOAT_32_32_32 is 12, and BYTE_8 is 1</doc>
+			<bitfield name="SWAP" low="22" high="23" type="a3xx_color_swap"/>
+			<bitfield name="SHIFTCNT" low="24" high="28" type="uint"/>
+			<bitfield name="LASTCOMPVALID" pos="29" type="boolean"/>
+			<bitfield name="SWITCHNEXT" pos="30" type="boolean"/>
+		</reg32>
+	</array>
+
+	<!-- TPL1 registers -->
+	<reg32 offset="0x0f00" name="TPL1_DEBUG_ECO_CONTROL"/>
+	<!-- always 0000003a: -->
+	<reg32 offset="0x0f03" name="TPL1_TP_MODE_CONTROL"/>
+	<reg32 offset="0x0f04" name="TPL1_PERFCTR_TP_SEL_0" type="a4xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f05" name="TPL1_PERFCTR_TP_SEL_1" type="a4xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f06" name="TPL1_PERFCTR_TP_SEL_2" type="a4xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f07" name="TPL1_PERFCTR_TP_SEL_3" type="a4xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f08" name="TPL1_PERFCTR_TP_SEL_4" type="a4xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f09" name="TPL1_PERFCTR_TP_SEL_5" type="a4xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f0a" name="TPL1_PERFCTR_TP_SEL_6" type="a4xx_tp_perfcounter_select"/>
+	<reg32 offset="0x0f0b" name="TPL1_PERFCTR_TP_SEL_7" type="a4xx_tp_perfcounter_select"/>
+	<reg32 offset="0x2380" name="TPL1_TP_TEX_OFFSET"/>
+	<reg32 offset="0x2381" name="TPL1_TP_TEX_COUNT">
+		<bitfield name="VS" low="0" high="7" type="uint"/>
+		<bitfield name="HS" low="8" high="15" type="uint"/>
+		<bitfield name="DS" low="16" high="23" type="uint"/>
+		<bitfield name="GS" low="24" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2384" name="TPL1_TP_VS_BORDER_COLOR_BASE_ADDR"/>
+	<reg32 offset="0x2387" name="TPL1_TP_HS_BORDER_COLOR_BASE_ADDR"/>
+	<reg32 offset="0x238a" name="TPL1_TP_DS_BORDER_COLOR_BASE_ADDR"/>
+	<reg32 offset="0x238d" name="TPL1_TP_GS_BORDER_COLOR_BASE_ADDR"/>
+	<reg32 offset="0x23a0" name="TPL1_TP_FS_TEX_COUNT">
+		<bitfield name="FS" low="0" high="7" type="uint"/>
+		<bitfield name="CS" low="8" high="15" type="uint"/>
+	</reg32>
+	<reg32 offset="0x23a1" name="TPL1_TP_FS_BORDER_COLOR_BASE_ADDR"/>
+	<reg32 offset="0x23a4" name="TPL1_TP_CS_BORDER_COLOR_BASE_ADDR"/>
+	<reg32 offset="0x23a5" name="TPL1_TP_CS_SAMPLER_BASE_ADDR"/>
+	<reg32 offset="0x23a6" name="TPL1_TP_CS_TEXMEMOBJ_BASE_ADDR"/>
+
+	<!-- GRAS registers -->
+	<reg32 offset="0x0c80" name="GRAS_TSE_STATUS"/>
+	<reg32 offset="0x0c81" name="GRAS_DEBUG_ECO_CONTROL"/>
+	<reg32 offset="0x0c88" name="GRAS_PERFCTR_TSE_SEL_0" type="a4xx_gras_tse_perfcounter_select"/>
+	<reg32 offset="0x0c89" name="GRAS_PERFCTR_TSE_SEL_1" type="a4xx_gras_tse_perfcounter_select"/>
+	<reg32 offset="0x0c8a" name="GRAS_PERFCTR_TSE_SEL_2" type="a4xx_gras_tse_perfcounter_select"/>
+	<reg32 offset="0x0c8b" name="GRAS_PERFCTR_TSE_SEL_3" type="a4xx_gras_tse_perfcounter_select"/>
+	<reg32 offset="0x0c8c" name="GRAS_PERFCTR_RAS_SEL_0" type="a4xx_gras_ras_perfcounter_select"/>
+	<reg32 offset="0x0c8d" name="GRAS_PERFCTR_RAS_SEL_1" type="a4xx_gras_ras_perfcounter_select"/>
+	<reg32 offset="0x0c8e" name="GRAS_PERFCTR_RAS_SEL_2" type="a4xx_gras_ras_perfcounter_select"/>
+	<reg32 offset="0x0c8f" name="GRAS_PERFCTR_RAS_SEL_3" type="a4xx_gras_ras_perfcounter_select"/>
+	<reg32 offset="0x2000" name="GRAS_CL_CLIP_CNTL">
+		<bitfield name="CLIP_DISABLE" pos="15" type="boolean"/>
+		<bitfield name="ZNEAR_CLIP_DISABLE" pos="16" type="boolean"/>
+		<bitfield name="ZFAR_CLIP_DISABLE" pos="17" type="boolean"/>
+		<bitfield name="ZERO_GB_SCALE_Z" pos="22" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2003" name="GRAS_CNTL">
+		<bitfield name="IJ_PERSP" pos="0" type="boolean"/>
+		<bitfield name="IJ_LINEAR" pos="1" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2004" name="GRAS_CL_GB_CLIP_ADJ">
+		<bitfield name="HORZ" low="0" high="9" type="uint"/>
+		<bitfield name="VERT" low="10" high="19" type="uint"/>
+	</reg32>
+	<reg32 offset="0x2008" name="GRAS_CL_VPORT_XOFFSET_0" type="float"/>
+	<reg32 offset="0x2009" name="GRAS_CL_VPORT_XSCALE_0" type="float"/>
+	<reg32 offset="0x200a" name="GRAS_CL_VPORT_YOFFSET_0" type="float"/>
+	<reg32 offset="0x200b" name="GRAS_CL_VPORT_YSCALE_0" type="float"/>
+	<reg32 offset="0x200c" name="GRAS_CL_VPORT_ZOFFSET_0" type="float"/>
+	<reg32 offset="0x200d" name="GRAS_CL_VPORT_ZSCALE_0" type="float"/>
+	<reg32 offset="0x2070" name="GRAS_SU_POINT_MINMAX">
+		<bitfield name="MIN" low="0" high="15" type="ufixed" radix="4"/>
+		<bitfield name="MAX" low="16" high="31" type="ufixed" radix="4"/>
+	</reg32>
+	<reg32 offset="0x2071" name="GRAS_SU_POINT_SIZE" type="fixed" radix="4"/>
+	<reg32 offset="0x2073" name="GRAS_ALPHA_CONTROL">
+		<bitfield name="ALPHA_TEST_ENABLE" pos="2" type="boolean"/>
+		<bitfield name="FORCE_FRAGZ_TO_FS" pos="3" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x2074" name="GRAS_SU_POLY_OFFSET_SCALE" type="float"/>
+	<reg32 offset="0x2075" name="GRAS_SU_POLY_OFFSET_OFFSET" type="float"/>
+	<reg32 offset="0x2076" name="GRAS_SU_POLY_OFFSET_CLAMP" type="float"/>
+	<reg32 offset="0x2077" name="GRAS_DEPTH_CONTROL">
+		<!-- guestimating that this is GRAS based on addr -->
+		<bitfield name="FORMAT" low="0" high="1" type="a4xx_depth_format"/>
+	</reg32>
+	<reg32 offset="0x2078" name="GRAS_SU_MODE_CONTROL">
+		<bitfield name="CULL_FRONT" pos="0" type="boolean"/>
+		<bitfield name="CULL_BACK" pos="1" type="boolean"/>
+		<bitfield name="FRONT_CW" pos="2" type="boolean"/>
+		<bitfield name="LINEHALFWIDTH" low="3" high="10" radix="2" type="fixed"/>
+		<bitfield name="POLY_OFFSET" pos="11" type="boolean"/>
+		<bitfield name="MSAA_ENABLE" pos="13" type="boolean"/>
+		<!-- bit20 set whenever RENDER_MODE = RB_RENDERING_PASS -->
+		<bitfield name="RENDERING_PASS" pos="20" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x207b" name="GRAS_SC_CONTROL">
+		<!-- complete wild-ass-guess for sizes of these bitfields.. -->
+		<bitfield name="RENDER_MODE" low="2" high="3" type="a3xx_render_mode"/>
+		<bitfield name="MSAA_SAMPLES" low="7" high="9" type="uint"/>
+		<bitfield name="MSAA_DISABLE" pos="11" type="boolean"/>
+		<bitfield name="RASTER_MODE" low="12" high="15"/>
+	</reg32>
+	<reg32 offset="0x207c" name="GRAS_SC_SCREEN_SCISSOR_TL" type="adreno_reg_xy"/>
+	<reg32 offset="0x207d" name="GRAS_SC_SCREEN_SCISSOR_BR" type="adreno_reg_xy"/>
+	<reg32 offset="0x209c" name="GRAS_SC_WINDOW_SCISSOR_BR" type="adreno_reg_xy"/>
+	<reg32 offset="0x209d" name="GRAS_SC_WINDOW_SCISSOR_TL" type="adreno_reg_xy"/>
+	<reg32 offset="0x209e" name="GRAS_SC_EXTENT_WINDOW_BR" type="adreno_reg_xy"/>
+	<reg32 offset="0x209f" name="GRAS_SC_EXTENT_WINDOW_TL" type="adreno_reg_xy"/>
+
+	<!-- UCHE registers -->
+	<reg32 offset="0x0e80" name="UCHE_CACHE_MODE_CONTROL"/>
+	<reg32 offset="0x0e83" name="UCHE_TRAP_BASE_LO"/>
+	<reg32 offset="0x0e84" name="UCHE_TRAP_BASE_HI"/>
+	<reg32 offset="0x0e88" name="UCHE_CACHE_STATUS"/>
+	<reg32 offset="0x0e8a" name="UCHE_INVALIDATE0"/>
+	<reg32 offset="0x0e8b" name="UCHE_INVALIDATE1"/>
+	<reg32 offset="0x0e8c" name="UCHE_CACHE_WAYS_VFD"/>
+	<reg32 offset="0x0e8e" name="UCHE_PERFCTR_UCHE_SEL_0" type="a4xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0e8f" name="UCHE_PERFCTR_UCHE_SEL_1" type="a4xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0e90" name="UCHE_PERFCTR_UCHE_SEL_2" type="a4xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0e91" name="UCHE_PERFCTR_UCHE_SEL_3" type="a4xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0e92" name="UCHE_PERFCTR_UCHE_SEL_4" type="a4xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0e93" name="UCHE_PERFCTR_UCHE_SEL_5" type="a4xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0e94" name="UCHE_PERFCTR_UCHE_SEL_6" type="a4xx_uche_perfcounter_select"/>
+	<reg32 offset="0x0e95" name="UCHE_PERFCTR_UCHE_SEL_7" type="a4xx_uche_perfcounter_select"/>
+
+	<!-- HLSQ registers -->
+	<reg32 offset="0x0e00" name="HLSQ_TIMEOUT_THRESHOLD"/>
+	<reg32 offset="0x0e04" name="HLSQ_DEBUG_ECO_CONTROL"/>
+	<!-- always 00000000: -->
+	<reg32 offset="0x0e05" name="HLSQ_MODE_CONTROL"/>
+	<reg32 offset="0x0e0e" name="HLSQ_PERF_PIPE_MASK"/>
+	<reg32 offset="0x0e06" name="HLSQ_PERFCTR_HLSQ_SEL_0" type="a4xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e07" name="HLSQ_PERFCTR_HLSQ_SEL_1" type="a4xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e08" name="HLSQ_PERFCTR_HLSQ_SEL_2" type="a4xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e09" name="HLSQ_PERFCTR_HLSQ_SEL_3" type="a4xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e0a" name="HLSQ_PERFCTR_HLSQ_SEL_4" type="a4xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e0b" name="HLSQ_PERFCTR_HLSQ_SEL_5" type="a4xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e0c" name="HLSQ_PERFCTR_HLSQ_SEL_6" type="a4xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x0e0d" name="HLSQ_PERFCTR_HLSQ_SEL_7" type="a4xx_hlsq_perfcounter_select"/>
+	<reg32 offset="0x23c0" name="HLSQ_CONTROL_0_REG">
+		<!-- I guess same as a3xx, but so far only seen 08000050 -->
+		<bitfield name="FSTHREADSIZE" pos="4" type="a3xx_threadsize"/>
+		<bitfield name="FSSUPERTHREADENABLE" pos="6" type="boolean"/>
+		<bitfield name="SPSHADERRESTART" pos="9" type="boolean"/>
+		<bitfield name="RESERVED2" pos="10" type="boolean"/>
+		<bitfield name="CHUNKDISABLE" pos="26" type="boolean"/>
+		<bitfield name="CONSTMODE" pos="27" type="uint"/>
+		<bitfield name="LAZYUPDATEDISABLE" pos="28" type="boolean"/>
+		<bitfield name="SPCONSTFULLUPDATE" pos="29" type="boolean"/>
+		<bitfield name="TPFULLUPDATE" pos="30" type="boolean"/>
+		<bitfield name="SINGLECONTEXT" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x23c1" name="HLSQ_CONTROL_1_REG">
+		<bitfield name="VSTHREADSIZE" pos="6" type="a3xx_threadsize"/>
+		<bitfield name="VSSUPERTHREADENABLE" pos="8" type="boolean"/>
+		<bitfield name="RESERVED1" pos="9" type="boolean"/>
+		<bitfield name="COORDREGID" low="16" high="23" type="a3xx_regid"/>
+		<!-- set if gl_FragCoord.[zw] used in frag shader: -->
+		<bitfield name="ZWCOORDREGID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0x23c2" name="HLSQ_CONTROL_2_REG">
+		<bitfield name="PRIMALLOCTHRESHOLD" low="26" high="31" type="uint"/>
+		<bitfield name="FACEREGID" low="2" high="9" type="a3xx_regid"/>
+		<bitfield name="SAMPLEID_REGID" low="10" high="17" type="a3xx_regid"/>
+		<bitfield name="SAMPLEMASK_REGID" low="18" high="25" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0x23c3" name="HLSQ_CONTROL_3_REG">
+		<!-- register loaded with position (bary.f) -->
+		<bitfield name="IJ_PERSP_PIXEL" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="IJ_LINEAR_PIXEL" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="IJ_PERSP_CENTROID" low="16" high="23" type="a3xx_regid"/>
+		<bitfield name="IJ_LINEAR_CENTROID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<!-- 0x23c4 3 regids, lowest one goes to 0 when *not* per-sample shading -->
+	<reg32 offset="0x23c4" name="HLSQ_CONTROL_4_REG">
+		<bitfield name="IJ_PERSP_SAMPLE" low="0" high="7" type="a3xx_regid"/>
+		<bitfield name="IJ_LINEAR_SAMPLE" low="8" high="15" type="a3xx_regid"/>
+	</reg32>
+
+	<bitset name="a4xx_xs_control_reg" inline="yes">
+		<bitfield name="CONSTLENGTH" low="0" high="7" type="uint"/>
+		<bitfield name="CONSTOBJECTOFFSET" low="8" high="14" type="uint"/>
+		<bitfield name="SSBO_ENABLE" pos="15" type="boolean"/>
+		<bitfield name="ENABLED" pos="16" type="boolean"/>
+		<bitfield name="SHADEROBJOFFSET" low="17" high="23" type="uint"/>
+		<bitfield name="INSTRLENGTH" low="24" high="31" type="uint"/>
+	</bitset>
+	<reg32 offset="0x23c5" name="HLSQ_VS_CONTROL_REG" type="a4xx_xs_control_reg"/>
+	<reg32 offset="0x23c6" name="HLSQ_FS_CONTROL_REG" type="a4xx_xs_control_reg"/>
+	<reg32 offset="0x23c7" name="HLSQ_HS_CONTROL_REG" type="a4xx_xs_control_reg"/>
+	<reg32 offset="0x23c8" name="HLSQ_DS_CONTROL_REG" type="a4xx_xs_control_reg"/>
+	<reg32 offset="0x23c9" name="HLSQ_GS_CONTROL_REG" type="a4xx_xs_control_reg"/>
+	<reg32 offset="0x23ca" name="HLSQ_CS_CONTROL_REG" type="a4xx_xs_control_reg"/>
+	<reg32 offset="0x23cd" name="HLSQ_CL_NDRANGE_0">
+		<bitfield name="KERNELDIM" low="0" high="1" type="uint"/>
+		<!-- localsize is value minus one: -->
+		<bitfield name="LOCALSIZEX" low="2" high="11" type="uint"/>
+		<bitfield name="LOCALSIZEY" low="12" high="21" type="uint"/>
+		<bitfield name="LOCALSIZEZ" low="22" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x23ce" name="HLSQ_CL_NDRANGE_1">
+		<bitfield name="SIZE_X" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x23cf" name="HLSQ_CL_NDRANGE_2"/>
+	<reg32 offset="0x23d0" name="HLSQ_CL_NDRANGE_3">
+		<bitfield name="SIZE_Y" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x23d1" name="HLSQ_CL_NDRANGE_4"/>
+	<reg32 offset="0x23d2" name="HLSQ_CL_NDRANGE_5">
+		<bitfield name="SIZE_Z" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="0x23d3" name="HLSQ_CL_NDRANGE_6"/>
+	<reg32 offset="0x23d4" name="HLSQ_CL_CONTROL_0">
+		<bitfield name="WGIDCONSTID" low="0" high="11" type="a3xx_regid"/>
+		<bitfield name="KERNELDIMCONSTID" low="12" high="23" type="a3xx_regid"/>
+		<bitfield name="LOCALIDREGID" low="24" high="31" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0x23d5" name="HLSQ_CL_CONTROL_1">
+		<!-- GLOBALSIZECONSTID? "kernel size" -->
+		<bitfield name="UNK0CONSTID" low="0" high="11" type="a3xx_regid"/>
+		<bitfield name="WORKGROUPSIZECONSTID" low="12" high="23" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0x23d6" name="HLSQ_CL_KERNEL_CONST">
+		<!-- GLOBALOFFSETCONSTID -->
+		<bitfield name="UNK0CONSTID" low="0" high="11" type="a3xx_regid"/>
+		<bitfield name="NUMWGCONSTID" low="12" high="23" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0x23d7" name="HLSQ_CL_KERNEL_GROUP_X"/>
+	<reg32 offset="0x23d8" name="HLSQ_CL_KERNEL_GROUP_Y"/>
+	<reg32 offset="0x23d9" name="HLSQ_CL_KERNEL_GROUP_Z"/>
+	<reg32 offset="0x23da" name="HLSQ_CL_WG_OFFSET">
+		<!-- WGOFFSETCONSTID -->
+		<bitfield name="UNK0CONSTID" low="0" high="11" type="a3xx_regid"/>
+	</reg32>
+	<reg32 offset="0x23db" name="HLSQ_UPDATE_CONTROL"/>
+
+	<!-- PC registers -->
+	<reg32 offset="0x0d00" name="PC_BINNING_COMMAND">
+		<bitfield name="BINNING_ENABLE" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x0d08" name="PC_TESSFACTOR_ADDR"/>
+	<reg32 offset="0x0d0c" name="PC_DRAWCALL_SETUP_OVERRIDE"/>
+	<reg32 offset="0x0d10" name="PC_PERFCTR_PC_SEL_0" type="a4xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d11" name="PC_PERFCTR_PC_SEL_1" type="a4xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d12" name="PC_PERFCTR_PC_SEL_2" type="a4xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d13" name="PC_PERFCTR_PC_SEL_3" type="a4xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d14" name="PC_PERFCTR_PC_SEL_4" type="a4xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d15" name="PC_PERFCTR_PC_SEL_5" type="a4xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d16" name="PC_PERFCTR_PC_SEL_6" type="a4xx_pc_perfcounter_select"/>
+	<reg32 offset="0x0d17" name="PC_PERFCTR_PC_SEL_7" type="a4xx_pc_perfcounter_select"/>
+	<reg32 offset="0x21c0" name="PC_BIN_BASE"/>
+	<reg32 offset="0x21c2" name="PC_VSTREAM_CONTROL">
+		<doc>SIZE is current pipe width * height (in tiles)</doc>
+		<bitfield name="SIZE" low="16" high="21" type="uint"/>
+		<doc>
+			N is some sort of slot # between 0..(SIZE-1).  In case
+			multiple tiles use same pipe, each tile gets unique slot #
+		</doc>
+		<bitfield name="N" low="22" high="26" type="uint"/>
+	</reg32>
+	<reg32 offset="0x21c4" name="PC_PRIM_VTX_CNTL">
+		<!-- bit0 set if there is >= 1 varying (actually used by FS) -->
+		<bitfield name="VAROUT" low="0" high="3" type="uint">
+			<doc>in groups of 4x vec4, blob only uses values
+			0, 1, 2, 4, 6, 8</doc>
+		</bitfield>
+		<bitfield name="PRIMITIVE_RESTART" pos="20" type="boolean"/>
+		<bitfield name="PROVOKING_VTX_LAST" pos="25" type="boolean"/>
+		<!-- PSIZE bit set if gl_PointSize written: -->
+		<bitfield name="PSIZE" pos="26" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x21c5" name="PC_PRIM_VTX_CNTL2">
+		<bitfield name="POLYMODE_FRONT_PTYPE" low="0" high="2" type="adreno_pa_su_sc_draw"/>
+		<bitfield name="POLYMODE_BACK_PTYPE" low="3" high="5" type="adreno_pa_su_sc_draw"/>
+		<bitfield name="POLYMODE_ENABLE" pos="6" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x21c6" name="PC_RESTART_INDEX"/>
+	<reg32 offset="0x21e5" name="PC_GS_PARAM">
+		<bitfield name="MAX_VERTICES" low="0" high="9" type="uint"/><!-- +1, i.e. max is 1024 -->
+		<bitfield name="INVOCATIONS" low="11" high="15" type="uint"/><!-- +1, i.e. max is 32 -->
+		<bitfield name="PRIMTYPE" low="23" high="24" type="adreno_pa_su_sc_draw"/>
+		<bitfield name="LAYER" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x21e7" name="PC_HS_PARAM">
+		<bitfield name="VERTICES_OUT" low="0" high="5" type="uint"/>
+		<bitfield name="SPACING" low="21" high="22" type="a4xx_tess_spacing"/>
+		<bitfield name="CW" pos="23" type="boolean"/>
+		<bitfield name="CONNECTED" pos="24" type="boolean"/>
+	</reg32>
+
+	<!-- VBIF registers -->
+	<reg32 offset="0x3000" name="VBIF_VERSION"/>
+	<reg32 offset="0x3001" name="VBIF_CLKON">
+		<bitfield name="FORCE_ON_TESTBUS" pos="0" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x301c" name="VBIF_ABIT_SORT"/>
+	<reg32 offset="0x301d" name="VBIF_ABIT_SORT_CONF"/>
+	<reg32 offset="0x302a" name="VBIF_GATE_OFF_WRREQ_EN"/>
+	<reg32 offset="0x302c" name="VBIF_IN_RD_LIM_CONF0"/>
+	<reg32 offset="0x302d" name="VBIF_IN_RD_LIM_CONF1"/>
+	<reg32 offset="0x3030" name="VBIF_IN_WR_LIM_CONF0"/>
+	<reg32 offset="0x3031" name="VBIF_IN_WR_LIM_CONF1"/>
+	<reg32 offset="0x3049" name="VBIF_ROUND_ROBIN_QOS_ARB"/>
+	<reg32 offset="0x30c0" name="VBIF_PERF_CNT_EN0"/>
+	<reg32 offset="0x30c1" name="VBIF_PERF_CNT_EN1"/>
+	<reg32 offset="0x30c2" name="VBIF_PERF_CNT_EN2"/>
+	<reg32 offset="0x30c3" name="VBIF_PERF_CNT_EN3"/>
+	<reg32 offset="0x30d0" name="VBIF_PERF_CNT_SEL0" type="a4xx_vbif_perfcounter_select"/>
+	<reg32 offset="0x30d1" name="VBIF_PERF_CNT_SEL1" type="a4xx_vbif_perfcounter_select"/>
+	<reg32 offset="0x30d2" name="VBIF_PERF_CNT_SEL2" type="a4xx_vbif_perfcounter_select"/>
+	<reg32 offset="0x30d3" name="VBIF_PERF_CNT_SEL3" type="a4xx_vbif_perfcounter_select"/>
+	<reg32 offset="0x30d8" name="VBIF_PERF_CNT_LOW0"/>
+	<reg32 offset="0x30d9" name="VBIF_PERF_CNT_LOW1"/>
+	<reg32 offset="0x30da" name="VBIF_PERF_CNT_LOW2"/>
+	<reg32 offset="0x30db" name="VBIF_PERF_CNT_LOW3"/>
+	<reg32 offset="0x30e0" name="VBIF_PERF_CNT_HIGH0"/>
+	<reg32 offset="0x30e1" name="VBIF_PERF_CNT_HIGH1"/>
+	<reg32 offset="0x30e2" name="VBIF_PERF_CNT_HIGH2"/>
+	<reg32 offset="0x30e3" name="VBIF_PERF_CNT_HIGH3"/>
+	<reg32 offset="0x3100" name="VBIF_PERF_PWR_CNT_EN0"/>
+	<reg32 offset="0x3101" name="VBIF_PERF_PWR_CNT_EN1"/>
+	<reg32 offset="0x3102" name="VBIF_PERF_PWR_CNT_EN2"/>
+
+	<!--
+	Unknown registers:
+	(mostly related to DX11 features not used yet, I guess?)
+	-->
+
+	<!-- always 00000006: -->
+	<reg32 offset="0x0cc5" name="UNKNOWN_0CC5"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x0cc6" name="UNKNOWN_0CC6"/>
+
+	<!-- always 00000001: -->
+	<reg32 offset="0x0d01" name="UNKNOWN_0D01"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x0e42" name="UNKNOWN_0E42"/>
+
+	<!-- always 00040000: -->
+	<reg32 offset="0x0ec2" name="UNKNOWN_0EC2"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x2001" name="UNKNOWN_2001"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x209b" name="UNKNOWN_209B"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x20ef" name="UNKNOWN_20EF"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x2152" name="UNKNOWN_2152"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x2153" name="UNKNOWN_2153"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x2154" name="UNKNOWN_2154"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x2155" name="UNKNOWN_2155"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x2156" name="UNKNOWN_2156"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x2157" name="UNKNOWN_2157"/>
+
+	<!-- always 0000000b: -->
+	<reg32 offset="0x21c3" name="UNKNOWN_21C3"/>
+
+	<!-- always 00000001: -->
+	<reg32 offset="0x21e6" name="UNKNOWN_21E6"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x2209" name="UNKNOWN_2209"/>
+
+	<!-- always 00000000: -->
+	<reg32 offset="0x22d7" name="UNKNOWN_22D7"/>
+
+        <!-- always 00fcfc00: -->
+        <reg32 offset="0x2352" name="UNKNOWN_2352"/>
+
+</domain>
+
+
+<domain name="A4XX_TEX_SAMP" width="32">
+	<doc>Texture sampler dwords</doc>
+	<enum name="a4xx_tex_filter">
+		<value name="A4XX_TEX_NEAREST" value="0"/>
+		<value name="A4XX_TEX_LINEAR" value="1"/>
+		<value name="A4XX_TEX_ANISO" value="2"/>
+	</enum>
+	<enum name="a4xx_tex_clamp">
+		<value name="A4XX_TEX_REPEAT" value="0"/>
+		<value name="A4XX_TEX_CLAMP_TO_EDGE" value="1"/>
+		<value name="A4XX_TEX_MIRROR_REPEAT" value="2"/>
+		<value name="A4XX_TEX_CLAMP_TO_BORDER" value="3"/>
+		<value name="A4XX_TEX_MIRROR_CLAMP" value="4"/>
+	</enum>
+	<enum name="a4xx_tex_aniso">
+		<value name="A4XX_TEX_ANISO_1" value="0"/>
+		<value name="A4XX_TEX_ANISO_2" value="1"/>
+		<value name="A4XX_TEX_ANISO_4" value="2"/>
+		<value name="A4XX_TEX_ANISO_8" value="3"/>
+		<value name="A4XX_TEX_ANISO_16" value="4"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="MIPFILTER_LINEAR_NEAR" pos="0" type="boolean"/>
+		<bitfield name="XY_MAG" low="1" high="2" type="a4xx_tex_filter"/>
+		<bitfield name="XY_MIN" low="3" high="4" type="a4xx_tex_filter"/>
+		<bitfield name="WRAP_S" low="5" high="7" type="a4xx_tex_clamp"/>
+		<bitfield name="WRAP_T" low="8" high="10" type="a4xx_tex_clamp"/>
+		<bitfield name="WRAP_R" low="11" high="13" type="a4xx_tex_clamp"/>
+		<bitfield name="ANISO" low="14" high="16" type="a4xx_tex_aniso"/>
+		<bitfield name="LOD_BIAS" low="19" high="31" type="fixed" radix="8"/><!-- no idea how many bits for real -->
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="COMPARE_FUNC" low="1" high="3" type="adreno_compare_func"/>
+		<bitfield name="CUBEMAPSEAMLESSFILTOFF" pos="4" type="boolean"/>
+		<bitfield name="UNNORM_COORDS" pos="5" type="boolean"/>
+		<bitfield name="MIPFILTER_LINEAR_FAR" pos="6" type="boolean"/>
+		<bitfield name="MAX_LOD" low="8" high="19" type="ufixed" radix="8"/>
+		<bitfield name="MIN_LOD" low="20" high="31" type="ufixed" radix="8"/>
+	</reg32>
+</domain>
+
+<domain name="A4XX_TEX_CONST" width="32">
+	<doc>Texture constant dwords</doc>
+	<enum name="a4xx_tex_swiz">
+		<!-- same as a2xx? -->
+		<value name="A4XX_TEX_X" value="0"/>
+		<value name="A4XX_TEX_Y" value="1"/>
+		<value name="A4XX_TEX_Z" value="2"/>
+		<value name="A4XX_TEX_W" value="3"/>
+		<value name="A4XX_TEX_ZERO" value="4"/>
+		<value name="A4XX_TEX_ONE" value="5"/>
+	</enum>
+	<enum name="a4xx_tex_type">
+		<value name="A4XX_TEX_1D" value="0"/>
+		<value name="A4XX_TEX_2D" value="1"/>
+		<value name="A4XX_TEX_CUBE" value="2"/>
+		<value name="A4XX_TEX_3D" value="3"/>
+		<value name="A4XX_TEX_BUFFER" value="4"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="TILED" pos="0" type="boolean"/>
+		<bitfield name="SRGB" pos="2" type="boolean"/>
+		<bitfield name="SWIZ_X" low="4" high="6" type="a4xx_tex_swiz"/>
+		<bitfield name="SWIZ_Y" low="7" high="9" type="a4xx_tex_swiz"/>
+		<bitfield name="SWIZ_Z" low="10" high="12" type="a4xx_tex_swiz"/>
+		<bitfield name="SWIZ_W" low="13" high="15" type="a4xx_tex_swiz"/>
+		<bitfield name="MIPLVLS" low="16" high="19" type="uint"/>
+		<bitfield name="FMT" low="22" high="28" type="a4xx_tex_fmt"/>
+		<bitfield name="TYPE" low="29" high="31" type="a4xx_tex_type"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="HEIGHT" low="0" high="14" type="uint"/>
+		<bitfield name="WIDTH" low="15" high="29" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<!-- minimum pitch (for mipmap levels): log2(pitchalign / 32) -->
+		<bitfield name="PITCHALIGN" low="0" high="3" type="uint"/>
+		<bitfield name="BUFFER" pos="6" type="boolean"/>
+		<doc>Pitch in bytes (so actually stride)</doc>
+		<bitfield name="PITCH" low="9" high="29" type="uint"/>
+		<bitfield name="SWAP" low="30" high="31" type="a3xx_color_swap"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="LAYERSZ" low="0" high="13" shr="12" type="uint"/>
+		<bitfield name="DEPTH" low="18" high="30" type="uint"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<!--
+		like a3xx we seem to have two LAYERSZ's.. although this one
+		seems too small to be useful, and when it overflows blob just
+		sets it to zero..
+		 -->
+		<bitfield name="LAYERSZ" low="0" high="3" shr="12" type="uint"/>
+		<bitfield name="BASE" low="5" high="31" shr="5"/>
+	</reg32>
+	<reg32 offset="5" name="5"/>
+	<reg32 offset="6" name="6"/>
+	<reg32 offset="7" name="7"/>
+</domain>
+
+<domain name="A4XX_SSBO_0" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="BASE" low="5" high="31" shr="5"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<doc>Pitch in bytes (so actually stride)</doc>
+		<bitfield name="PITCH" low="0" high="21" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="ARRAY_PITCH" low="12" high="25" shr="12" type="uint"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<!-- bytes per pixel: -->
+		<bitfield name="CPP" low="0" high="5" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="A4XX_SSBO_1" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="CPP" low="0" high="4" type="uint"/>
+		<bitfield name="FMT" low="8" high="15" type="a4xx_color_fmt"/>
+		<bitfield name="WIDTH" low="16" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="HEIGHT" low="0" high="15" type="uint"/>
+		<bitfield name="DEPTH" low="16" high="31" type="uint"/>
+	</reg32>
+</domain>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml
new file mode 100644
index 000000000000..218ec8bb966e
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml
@@ -0,0 +1,400 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+
+<enum name="chip" bare="yes">
+	<value name="A2XX" value="2"/>
+	<value name="A3XX" value="3"/>
+	<value name="A4XX" value="4"/>
+	<value name="A5XX" value="5"/>
+	<value name="A6XX" value="6"/>
+	<value name="A7XX" value="7"/>
+</enum>
+
+<enum name="adreno_pa_su_sc_draw">
+	<value name="PC_DRAW_POINTS" value="0"/>
+	<value name="PC_DRAW_LINES" value="1"/>
+	<value name="PC_DRAW_TRIANGLES" value="2"/>
+</enum>
+
+<enum name="adreno_compare_func">
+	<value name="FUNC_NEVER" value="0"/>
+	<value name="FUNC_LESS" value="1"/>
+	<value name="FUNC_EQUAL" value="2"/>
+	<value name="FUNC_LEQUAL" value="3"/>
+	<value name="FUNC_GREATER" value="4"/>
+	<value name="FUNC_NOTEQUAL" value="5"/>
+	<value name="FUNC_GEQUAL" value="6"/>
+	<value name="FUNC_ALWAYS" value="7"/>
+</enum>
+
+<enum name="adreno_stencil_op">
+	<value name="STENCIL_KEEP" value="0"/>
+	<value name="STENCIL_ZERO" value="1"/>
+	<value name="STENCIL_REPLACE" value="2"/>
+	<value name="STENCIL_INCR_CLAMP" value="3"/>
+	<value name="STENCIL_DECR_CLAMP" value="4"/>
+	<value name="STENCIL_INVERT" value="5"/>
+	<value name="STENCIL_INCR_WRAP" value="6"/>
+	<value name="STENCIL_DECR_WRAP" value="7"/>
+</enum>
+
+<enum name="adreno_rb_blend_factor">
+	<value name="FACTOR_ZERO" value="0"/>
+	<value name="FACTOR_ONE" value="1"/>
+	<value name="FACTOR_SRC_COLOR" value="4"/>
+	<value name="FACTOR_ONE_MINUS_SRC_COLOR" value="5"/>
+	<value name="FACTOR_SRC_ALPHA" value="6"/>
+	<value name="FACTOR_ONE_MINUS_SRC_ALPHA" value="7"/>
+	<value name="FACTOR_DST_COLOR" value="8"/>
+	<value name="FACTOR_ONE_MINUS_DST_COLOR" value="9"/>
+	<value name="FACTOR_DST_ALPHA" value="10"/>
+	<value name="FACTOR_ONE_MINUS_DST_ALPHA" value="11"/>
+	<value name="FACTOR_CONSTANT_COLOR" value="12"/>
+	<value name="FACTOR_ONE_MINUS_CONSTANT_COLOR" value="13"/>
+	<value name="FACTOR_CONSTANT_ALPHA" value="14"/>
+	<value name="FACTOR_ONE_MINUS_CONSTANT_ALPHA" value="15"/>
+	<value name="FACTOR_SRC_ALPHA_SATURATE" value="16"/>
+	<value name="FACTOR_SRC1_COLOR" value="20"/>
+	<value name="FACTOR_ONE_MINUS_SRC1_COLOR" value="21"/>
+	<value name="FACTOR_SRC1_ALPHA" value="22"/>
+	<value name="FACTOR_ONE_MINUS_SRC1_ALPHA" value="23"/>
+</enum>
+
+<bitset name="adreno_rb_stencilrefmask" inline="yes">
+	<bitfield name="STENCILREF" low="0" high="7" type="hex"/>
+	<bitfield name="STENCILMASK" low="8" high="15" type="hex"/>
+	<bitfield name="STENCILWRITEMASK" low="16" high="23" type="hex"/>
+</bitset>
+
+<enum name="adreno_rb_surface_endian">
+	<value name="ENDIAN_NONE" value="0"/>
+	<value name="ENDIAN_8IN16" value="1"/>
+	<value name="ENDIAN_8IN32" value="2"/>
+	<value name="ENDIAN_16IN32" value="3"/>
+	<value name="ENDIAN_8IN64" value="4"/>
+	<value name="ENDIAN_8IN128" value="5"/>
+</enum>
+
+<enum name="adreno_rb_dither_mode">
+	<value name="DITHER_DISABLE" value="0"/>
+	<value name="DITHER_ALWAYS" value="1"/>
+	<value name="DITHER_IF_ALPHA_OFF" value="2"/>
+</enum>
+
+<enum name="adreno_rb_depth_format">
+	<value name="DEPTHX_16" value="0"/>
+	<value name="DEPTHX_24_8" value="1"/>
+	<value name="DEPTHX_32" value="2"/>
+</enum>
+
+<enum name="adreno_rb_copy_control_mode">
+	<value name="RB_COPY_RESOLVE" value="1"/>
+	<value name="RB_COPY_CLEAR" value="2"/>
+	<value name="RB_COPY_DEPTH_STENCIL" value="5"/>  <!-- not sure if this is part of MODE or another bitfield?? -->
+</enum>
+
+<bitset name="adreno_reg_xy" inline="yes">
+	<bitfield name="WINDOW_OFFSET_DISABLE" pos="31" type="boolean"/>
+	<bitfield name="X" low="0" high="14" type="uint"/>
+	<bitfield name="Y" low="16" high="30" type="uint"/>
+</bitset>
+
+<bitset name="adreno_cp_protect" inline="yes">
+	<bitfield name="BASE_ADDR" low="0" high="16"/>
+	<bitfield name="MASK_LEN" low="24" high="28"/>
+	<bitfield name="TRAP_WRITE" pos="29"/>
+	<bitfield name="TRAP_READ" pos="30"/>
+</bitset>
+
+<domain name="AXXX" width="32">
+	<brief>Registers in common between a2xx and a3xx</brief>
+
+	<reg32 offset="0x01c0" name="CP_RB_BASE"/>
+	<reg32 offset="0x01c1" name="CP_RB_CNTL">
+		<bitfield name="BUFSZ" low="0" high="5"/>
+		<bitfield name="BLKSZ" low="8" high="13"/>
+		<bitfield name="BUF_SWAP" low="16" high="17"/>
+		<bitfield name="POLL_EN" pos="20" type="boolean"/>
+		<bitfield name="NO_UPDATE" pos="27" type="boolean"/>
+		<bitfield name="RPTR_WR_EN" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x01c3" name="CP_RB_RPTR_ADDR">
+		<bitfield name="SWAP" low="0" high="1" type="uint"/>
+		<bitfield name="ADDR" low="2" high="31" shr="2"/>
+	</reg32>
+	<reg32 offset="0x01c4" name="CP_RB_RPTR" type="uint"/>
+	<reg32 offset="0x01c5" name="CP_RB_WPTR" type="uint"/>
+	<reg32 offset="0x01c6" name="CP_RB_WPTR_DELAY"/>
+	<reg32 offset="0x01c7" name="CP_RB_RPTR_WR"/>
+	<reg32 offset="0x01c8" name="CP_RB_WPTR_BASE"/>
+	<reg32 offset="0x01d5" name="CP_QUEUE_THRESHOLDS">
+		<bitfield name="CSQ_IB1_START" low="0" high="3" type="uint"/>
+		<bitfield name="CSQ_IB2_START" low="8" high="11" type="uint"/>
+		<bitfield name="CSQ_ST_START" low="16" high="19" type="uint"/>
+	</reg32>
+	<reg32 offset="0x01d6" name="CP_MEQ_THRESHOLDS">
+		<bitfield name="MEQ_END" low="16" high="20" type="uint"/>
+		<bitfield name="ROQ_END" low="24" high="28" type="uint"/>
+	</reg32>
+	<reg32 offset="0x01d7" name="CP_CSQ_AVAIL">
+		<bitfield name="RING" low="0" high="6" type="uint"/>
+		<bitfield name="IB1" low="8" high="14" type="uint"/>
+		<bitfield name="IB2" low="16" high="22" type="uint"/>
+	</reg32>
+	<reg32 offset="0x01d8" name="CP_STQ_AVAIL">
+		<bitfield name="ST" low="0" high="6" type="uint"/>
+	</reg32>
+	<reg32 offset="0x01d9" name="CP_MEQ_AVAIL">
+		<bitfield name="MEQ" low="0" high="4" type="uint"/>
+	</reg32>
+	<reg32 offset="0x01dc" name="SCRATCH_UMSK">
+		<bitfield name="UMSK" low="0" high="7" type="uint"/>
+		<bitfield name="SWAP" low="16" high="17" type="uint"/>
+	</reg32>
+	<reg32 offset="0x01dd" name="SCRATCH_ADDR"/>
+	<reg32 offset="0x01ea" name="CP_ME_RDADDR"/>
+
+	<reg32 offset="0x01ec" name="CP_STATE_DEBUG_INDEX"/>
+	<reg32 offset="0x01ed" name="CP_STATE_DEBUG_DATA"/>
+	<reg32 offset="0x01f2" name="CP_INT_CNTL">
+		<bitfield name="SW_INT_MASK" pos="19" type="boolean"/>
+		<bitfield name="T0_PACKET_IN_IB_MASK" pos="23" type="boolean"/>
+		<bitfield name="OPCODE_ERROR_MASK" pos="24" type="boolean"/>
+		<bitfield name="PROTECTED_MODE_ERROR_MASK" pos="25" type="boolean"/>
+		<bitfield name="RESERVED_BIT_ERROR_MASK" pos="26" type="boolean"/>
+		<bitfield name="IB_ERROR_MASK" pos="27" type="boolean"/>
+		<bitfield name="IB2_INT_MASK" pos="29" type="boolean"/>
+		<bitfield name="IB1_INT_MASK" pos="30" type="boolean"/>
+		<bitfield name="RB_INT_MASK" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x01f3" name="CP_INT_STATUS"/>
+	<reg32 offset="0x01f4" name="CP_INT_ACK"/>
+	<reg32 offset="0x01f6" name="CP_ME_CNTL">
+		<bitfield name="BUSY" pos="29" type="boolean"/>
+		<bitfield name="HALT" pos="28" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x01f7" name="CP_ME_STATUS"/>
+	<reg32 offset="0x01f8" name="CP_ME_RAM_WADDR"/>
+	<reg32 offset="0x01f9" name="CP_ME_RAM_RADDR"/>
+	<reg32 offset="0x01fa" name="CP_ME_RAM_DATA"/>
+	<reg32 offset="0x01fc" name="CP_DEBUG">
+		<bitfield name="PREDICATE_DISABLE" pos="23" type="boolean"/>
+		<bitfield name="PROG_END_PTR_ENABLE" pos="24" type="boolean"/>
+		<bitfield name="MIU_128BIT_WRITE_ENABLE" pos="25" type="boolean"/>
+		<bitfield name="PREFETCH_PASS_NOPS" pos="26" type="boolean"/>
+		<bitfield name="DYNAMIC_CLK_DISABLE" pos="27" type="boolean"/>
+		<bitfield name="PREFETCH_MATCH_DISABLE" pos="28" type="boolean"/>
+		<bitfield name="SIMPLE_ME_FLOW_CONTROL" pos="30" type="boolean"/>
+		<bitfield name="MIU_WRITE_PACK_DISABLE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x01fd" name="CP_CSQ_RB_STAT">
+		<bitfield name="RPTR" low="0" high="6" type="uint"/>
+		<bitfield name="WPTR" low="16" high="22" type="uint"/>
+	</reg32>
+	<reg32 offset="0x01fe" name="CP_CSQ_IB1_STAT">
+		<bitfield name="RPTR" low="0" high="6" type="uint"/>
+		<bitfield name="WPTR" low="16" high="22" type="uint"/>
+	</reg32>
+	<reg32 offset="0x01ff" name="CP_CSQ_IB2_STAT">
+		<bitfield name="RPTR" low="0" high="6" type="uint"/>
+		<bitfield name="WPTR" low="16" high="22" type="uint"/>
+	</reg32>
+
+	<reg32 offset="0x0440" name="CP_NON_PREFETCH_CNTRS"/>
+	<reg32 offset="0x0443" name="CP_STQ_ST_STAT"/>
+	<reg32 offset="0x044d" name="CP_ST_BASE"/>
+	<reg32 offset="0x044e" name="CP_ST_BUFSZ"/>
+	<reg32 offset="0x044f" name="CP_MEQ_STAT"/>
+	<reg32 offset="0x0452" name="CP_MIU_TAG_STAT"/>
+	<reg32 offset="0x0454" name="CP_BIN_MASK_LO"/>
+	<reg32 offset="0x0455" name="CP_BIN_MASK_HI"/>
+	<reg32 offset="0x0456" name="CP_BIN_SELECT_LO"/>
+	<reg32 offset="0x0457" name="CP_BIN_SELECT_HI"/>
+	<reg32 offset="0x0458" name="CP_IB1_BASE"/>
+	<reg32 offset="0x0459" name="CP_IB1_BUFSZ"/>
+	<reg32 offset="0x045a" name="CP_IB2_BASE"/>
+	<reg32 offset="0x045b" name="CP_IB2_BUFSZ"/>
+	<reg32 offset="0x047f" name="CP_STAT">
+		<bitfield pos="31" name="CP_BUSY"/>
+		<bitfield pos="30" name="VS_EVENT_FIFO_BUSY"/>
+		<bitfield pos="29" name="PS_EVENT_FIFO_BUSY"/>
+		<bitfield pos="28" name="CF_EVENT_FIFO_BUSY"/>
+		<bitfield pos="27" name="RB_EVENT_FIFO_BUSY"/>
+		<bitfield pos="26" name="ME_BUSY"/>
+		<bitfield pos="25" name="MIU_WR_C_BUSY"/>
+		<bitfield pos="23" name="CP_3D_BUSY"/>
+		<bitfield pos="22" name="CP_NRT_BUSY"/>
+		<bitfield pos="21" name="RBIU_SCRATCH_BUSY"/>
+		<bitfield pos="20" name="RCIU_ME_BUSY"/>
+		<bitfield pos="19" name="RCIU_PFP_BUSY"/>
+		<bitfield pos="18" name="MEQ_RING_BUSY"/>
+		<bitfield pos="17" name="PFP_BUSY"/>
+		<bitfield pos="16" name="ST_QUEUE_BUSY"/>
+		<bitfield pos="13" name="INDIRECT2_QUEUE_BUSY"/>
+		<bitfield pos="12" name="INDIRECTS_QUEUE_BUSY"/>
+		<bitfield pos="11" name="RING_QUEUE_BUSY"/>
+		<bitfield pos="10" name="CSF_BUSY"/>
+		<bitfield pos="9"  name="CSF_ST_BUSY"/>
+		<bitfield pos="8"  name="EVENT_BUSY"/>
+		<bitfield pos="7"  name="CSF_INDIRECT2_BUSY"/>
+		<bitfield pos="6"  name="CSF_INDIRECTS_BUSY"/>
+		<bitfield pos="5"  name="CSF_RING_BUSY"/>
+		<bitfield pos="4"  name="RCIU_BUSY"/>
+		<bitfield pos="3"  name="RBIU_BUSY"/>
+		<bitfield pos="2"  name="MIU_RD_RETURN_BUSY"/>
+		<bitfield pos="1"  name="MIU_RD_REQ_BUSY"/>
+		<bitfield pos="0"  name="MIU_WR_BUSY"/>
+	</reg32>
+	<reg32 offset="0x0578" name="CP_SCRATCH_REG0" type="uint"/>
+	<reg32 offset="0x0579" name="CP_SCRATCH_REG1" type="uint"/>
+	<reg32 offset="0x057a" name="CP_SCRATCH_REG2" type="uint"/>
+	<reg32 offset="0x057b" name="CP_SCRATCH_REG3" type="uint"/>
+	<reg32 offset="0x057c" name="CP_SCRATCH_REG4" type="uint"/>
+	<reg32 offset="0x057d" name="CP_SCRATCH_REG5" type="uint"/>
+	<reg32 offset="0x057e" name="CP_SCRATCH_REG6" type="uint"/>
+	<reg32 offset="0x057f" name="CP_SCRATCH_REG7" type="uint"/>
+
+	<reg32 offset="0x0600" name="CP_ME_VS_EVENT_SRC"/>
+	<reg32 offset="0x0601" name="CP_ME_VS_EVENT_ADDR"/>
+	<reg32 offset="0x0602" name="CP_ME_VS_EVENT_DATA"/>
+	<reg32 offset="0x0603" name="CP_ME_VS_EVENT_ADDR_SWM"/>
+	<reg32 offset="0x0604" name="CP_ME_VS_EVENT_DATA_SWM"/>
+	<reg32 offset="0x0605" name="CP_ME_PS_EVENT_SRC"/>
+	<reg32 offset="0x0606" name="CP_ME_PS_EVENT_ADDR"/>
+	<reg32 offset="0x0607" name="CP_ME_PS_EVENT_DATA"/>
+	<reg32 offset="0x0608" name="CP_ME_PS_EVENT_ADDR_SWM"/>
+	<reg32 offset="0x0609" name="CP_ME_PS_EVENT_DATA_SWM"/>
+	<reg32 offset="0x060a" name="CP_ME_CF_EVENT_SRC"/>
+	<reg32 offset="0x060b" name="CP_ME_CF_EVENT_ADDR"/>
+	<reg32 offset="0x060c" name="CP_ME_CF_EVENT_DATA" type="uint"/>
+	<reg32 offset="0x060d" name="CP_ME_NRT_ADDR"/>
+	<reg32 offset="0x060e" name="CP_ME_NRT_DATA"/>
+	<reg32 offset="0x0612" name="CP_ME_VS_FETCH_DONE_SRC"/>
+	<reg32 offset="0x0613" name="CP_ME_VS_FETCH_DONE_ADDR"/>
+	<reg32 offset="0x0614" name="CP_ME_VS_FETCH_DONE_DATA"/>
+
+</domain>
+
+<!--
+	Common between A3xx and A4xx:
+ -->
+
+<enum name="a3xx_rop_code">
+	<value name="ROP_CLEAR"         value="0"/>
+	<value name="ROP_NOR"           value="1"/>
+	<value name="ROP_AND_INVERTED"  value="2"/>
+	<value name="ROP_COPY_INVERTED" value="3"/>
+	<value name="ROP_AND_REVERSE"   value="4"/>
+	<value name="ROP_INVERT"        value="5"/>
+	<value name="ROP_XOR"           value="6"/>
+	<value name="ROP_NAND"          value="7"/>
+	<value name="ROP_AND"           value="8"/>
+	<value name="ROP_EQUIV"         value="9"/>
+	<value name="ROP_NOOP"          value="10"/>
+	<value name="ROP_OR_INVERTED"   value="11"/>
+	<value name="ROP_COPY"          value="12"/>
+	<value name="ROP_OR_REVERSE"    value="13"/>
+	<value name="ROP_OR"            value="14"/>
+	<value name="ROP_SET"           value="15"/>
+</enum>
+
+<enum name="a3xx_render_mode">
+	<value name="RB_RENDERING_PASS" value="0"/>
+	<value name="RB_TILING_PASS" value="1"/>
+	<value name="RB_RESOLVE_PASS" value="2"/>
+	<value name="RB_COMPUTE_PASS" value="3"/>
+</enum>
+
+<enum name="a3xx_msaa_samples">
+	<value name="MSAA_ONE" value="0"/>
+	<value name="MSAA_TWO" value="1"/>
+	<value name="MSAA_FOUR" value="2"/>
+	<value name="MSAA_EIGHT" value="3"/>
+</enum>
+
+<enum name="a3xx_threadmode">
+	<value value="0" name="MULTI"/>
+	<value value="1" name="SINGLE"/>
+</enum>
+
+<enum name="a3xx_instrbuffermode">
+	<!--
+	When shader size goes above ~128 or so, blob switches to '0'
+	and doesn't emit shader in cmdstream.  When either is '0' it
+	doesn't get emitted via CP_LOAD_STATE.  When only one is
+	'0' the other gets size 256-others_size.  So I think that:
+		BUFFER => execute out of state memory
+		CACHE  => use available state memory as local cache
+	NOTE that when CACHE mode, also set CACHEINVALID flag!
+
+	TODO check if that 256 size is same for all a3xx
+	 -->
+	<value value="0" name="CACHE"/>
+	<value value="1" name="BUFFER"/>
+</enum>
+
+<enum name="a3xx_threadsize">
+	<value value="0" name="TWO_QUADS"/>
+	<value value="1" name="FOUR_QUADS"/>
+</enum>
+
+<enum name="a3xx_color_swap">
+	<value name="WZYX" value="0"/>
+	<value name="WXYZ" value="1"/>
+	<value name="ZYXW" value="2"/>
+	<value name="XYZW" value="3"/>
+</enum>
+
+<enum name="a3xx_rb_blend_opcode">
+	<value name="BLEND_DST_PLUS_SRC" value="0"/>
+	<value name="BLEND_SRC_MINUS_DST" value="1"/>
+	<value name="BLEND_DST_MINUS_SRC" value="2"/>
+	<value name="BLEND_MIN_DST_SRC" value="3"/>
+	<value name="BLEND_MAX_DST_SRC" value="4"/>
+</enum>
+
+<enum name="a4xx_tess_spacing">
+	<value name="EQUAL_SPACING" value="0"/>
+	<value name="ODD_SPACING" value="2"/>
+	<value name="EVEN_SPACING" value="3"/>
+</enum>
+
+<doc>Address mode for a5xx+</doc>
+<enum name="a5xx_address_mode">
+	<value name="ADDR_32B" value="0"/>
+	<value name="ADDR_64B" value="1"/>
+</enum>
+
+<doc>
+    Line mode for a5xx+
+	Note that Bresenham lines are only supported with MSAA disabled.
+</doc>
+<enum name="a5xx_line_mode">
+	<value value="0x0"  name="BRESENHAM"/>
+	<value value="0x1"  name="RECTANGULAR"/>
+</enum>
+
+<doc>
+	Blob (v615) seem to only use SAM and I wasn't able to coerce
+	it to produce any other command.
+	Probably valid for a4xx+ but not enabled or tested on anything
+	but a6xx.
+</doc>
+<enum name="a6xx_tex_prefetch_cmd">
+	<doc> Produces garbage </doc>
+	<value value="0x0" name="TEX_PREFETCH_UNK0"/>
+	<value value="0x1" name="TEX_PREFETCH_SAM"/>
+	<value value="0x2" name="TEX_PREFETCH_GATHER4R"/>
+	<value value="0x3" name="TEX_PREFETCH_GATHER4G"/>
+	<value value="0x4" name="TEX_PREFETCH_GATHER4B"/>
+	<value value="0x5" name="TEX_PREFETCH_GATHER4A"/>
+	<doc> Causes reads from an invalid address </doc>
+	<value value="0x6" name="TEX_PREFETCH_UNK6"/>
+	<doc> Results in color being zero </doc>
+	<value value="0x7" name="TEX_PREFETCH_UNK7"/>
+</enum>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
new file mode 100644
index 000000000000..cab01af55d22
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -0,0 +1,2268 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+<import file="adreno/adreno_common.xml"/>
+
+<enum name="vgt_event_type" varset="chip">
+	<value name="VS_DEALLOC" value="0"/>
+	<value name="PS_DEALLOC" value="1" variants="A2XX-A6XX"/>
+	<value name="VS_DONE_TS" value="2"/>
+	<value name="PS_DONE_TS" value="3"/>
+	<doc>
+		Flushes dirty data from UCHE, and also writes a GPU timestamp to
+		the address if one is provided.
+	</doc>
+	<value name="CACHE_FLUSH_TS" value="4"/>
+	<value name="CONTEXT_DONE" value="5"/>
+	<value name="CACHE_FLUSH" value="6" variants="A2XX-A4XX"/>
+	<value name="VIZQUERY_START" value="7" variants="A2XX"/>
+	<value name="HLSQ_FLUSH" value="7" variants="A3XX-A4XX"/>
+	<value name="VIZQUERY_END" value="8" variants="A2XX"/>
+	<value name="SC_WAIT_WC" value="9" variants="A2XX"/>
+	<value name="WRITE_PRIMITIVE_COUNTS" value="9" variants="A6XX"/>
+	<value name="START_PRIMITIVE_CTRS" value="11" variants="A6XX"/>
+	<value name="STOP_PRIMITIVE_CTRS" value="12" variants="A6XX"/>
+	<!-- Not sure that these 4 events don't have the same meaning as on A5XX+ -->
+	<value name="RST_PIX_CNT" value="13" variants="A2XX-A4XX"/>
+	<value name="RST_VTX_CNT" value="14" variants="A2XX-A4XX"/>
+	<value name="TILE_FLUSH" value="15" variants="A2XX-A4XX"/>
+	<value name="STAT_EVENT" value="16" variants="A2XX-A4XX"/>
+	<value name="CACHE_FLUSH_AND_INV_TS_EVENT" value="20" variants="A2XX-A4XX"/>
+	<doc>
+		If A6XX_RB_SAMPLE_COUNT_CONTROL.copy is true, writes OQ Z passed
+		sample counts to RB_SAMPLE_COUNT_ADDR.  This writes to main
+		memory, skipping UCHE.
+	</doc>
+	<value name="ZPASS_DONE" value="21"/>
+	<value name="CACHE_FLUSH_AND_INV_EVENT" value="22" variants="A2XX"/>
+
+	<doc>
+		Writes the GPU timestamp to the address that follows, once RB
+		access and flushes are complete.
+	</doc>
+	<value name="RB_DONE_TS" value="22" variants="A3XX-"/>
+
+	<value name="PERFCOUNTER_START" value="23" variants="A2XX-A4XX"/>
+	<value name="PERFCOUNTER_STOP" value="24" variants="A2XX-A4XX"/>
+	<value name="VS_FETCH_DONE" value="27"/>
+	<value name="FACENESS_FLUSH" value="28" variants="A2XX-A4XX"/>
+
+	<!-- a5xx events -->
+	<value name="WT_DONE_TS" value="8" variants="A5XX-"/>
+	<value name="START_FRAGMENT_CTRS" value="13" variants="A5XX-"/>
+	<value name="STOP_FRAGMENT_CTRS" value="14" variants="A5XX-"/>
+	<value name="START_COMPUTE_CTRS" value="15" variants="A5XX-"/>
+	<value name="STOP_COMPUTE_CTRS" value="16" variants="A5XX-"/>
+	<value name="FLUSH_SO_0" value="17" variants="A5XX-"/>
+	<value name="FLUSH_SO_1" value="18" variants="A5XX-"/>
+	<value name="FLUSH_SO_2" value="19" variants="A5XX-"/>
+	<value name="FLUSH_SO_3" value="20" variants="A5XX-"/>
+
+	<doc>
+		Invalidates depth attachment data from the CCU.  We assume this
+		happens in the last stage.
+	</doc>
+	<value name="PC_CCU_INVALIDATE_DEPTH" value="24" variants="A5XX-"/>
+
+	<doc>
+		Invalidates color attachment data from the CCU.  We assume this
+		happens in the last stage.
+	</doc>
+	<value name="PC_CCU_INVALIDATE_COLOR" value="25" variants="A5XX-"/>
+
+	<doc>
+		Flushes the small cache used by CP_EVENT_WRITE::BLIT (which,
+		along with its registers, would be better named RESOLVE).
+	</doc>
+	<value name="PC_CCU_RESOLVE_TS" value="26" variants="A6XX"/>
+
+	<doc>
+		Flushes depth attachment data from the CCU.  We assume this
+		happens in the last stage.
+	</doc>
+	<value name="PC_CCU_FLUSH_DEPTH_TS" value="28" variants="A5XX-"/>
+
+	<doc>
+		Flushes color attachment data from the CCU.  We assume this
+		happens in the last stage.
+	</doc>
+	<value name="PC_CCU_FLUSH_COLOR_TS" value="29" variants="A5XX-"/>
+
+	<doc>
+		2D blit to resolve GMEM to system memory (skipping CCU) at the
+		end of a render pass.  Compare to CP_BLIT's BLIT_OP_SCALE for
+		more general blitting.
+	</doc>
+	<value name="BLIT" value="30" variants="A5XX-"/>
+
+	<doc>
+		Clears based on GRAS_LRZ_CNTL configuration, could clear
+		fast-clear buffer or LRZ direction.
+		LRZ direction is stored at lrz_fc_offset + 0x200, has 1 byte which
+		could be expressed by enum:
+			CUR_DIR_DISABLED = 0x0
+			CUR_DIR_GE = 0x1
+			CUR_DIR_LE = 0x2
+			CUR_DIR_UNSET = 0x3
+		Clear of direction means setting the direction to CUR_DIR_UNSET.
+	</doc>
+	<value name="LRZ_CLEAR" value="37" variants="A5XX-"/>
+
+	<value name="LRZ_FLUSH" value="38" variants="A5XX-"/>
+	<value name="BLIT_OP_FILL_2D" value="39" variants="A5XX-"/>
+	<value name="BLIT_OP_COPY_2D" value="40" variants="A5XX-A6XX"/>
+	<value name="UNK_40" value="40" variants="A7XX"/>
+	<value name="BLIT_OP_SCALE_2D" value="42" variants="A5XX-"/>
+	<value name="CONTEXT_DONE_2D" value="43" variants="A5XX-"/>
+	<value name="UNK_2C" value="44" variants="A5XX-"/>
+	<value name="UNK_2D" value="45" variants="A5XX-"/>
+
+	<!-- a6xx events -->
+	<doc>
+		Invalidates UCHE.
+	</doc>
+	<value name="CACHE_INVALIDATE" value="49" variants="A6XX"/>
+
+	<value name="LABEL" value="63" variants="A6XX-"/>
+
+	<!-- note, some of these are the same as a6xx, just named differently -->
+
+	<doc> Doesn't seem to do anything </doc>
+	<value name="DUMMY_EVENT" value="1" variants="A7XX"/>
+	<value name="CCU_INVALIDATE_DEPTH" value="24" variants="A7XX"/>
+	<value name="CCU_INVALIDATE_COLOR" value="25" variants="A7XX"/>
+	<value name="CCU_RESOLVE_CLEAN" value="26" variants="A7XX"/>
+	<value name="CCU_FLUSH_DEPTH" value="28" variants="A7XX"/>
+	<value name="CCU_FLUSH_COLOR" value="29" variants="A7XX"/>
+	<value name="CCU_RESOLVE" value="30" variants="A7XX"/>
+	<value name="CCU_END_RESOLVE_GROUP" value="31" variants="A7XX"/>
+	<value name="CCU_CLEAN_DEPTH" value="32" variants="A7XX"/>
+	<value name="CCU_CLEAN_COLOR" value="33" variants="A7XX"/>
+	<value name="CACHE_RESET" value="48" variants="A7XX"/>
+	<value name="CACHE_CLEAN" value="49" variants="A7XX"/>
+	<!-- TODO: deal with name conflicts with other gens -->
+	<value name="CACHE_FLUSH7" value="50" variants="A7XX"/>
+	<value name="CACHE_INVALIDATE7" value="51" variants="A7XX"/>
+</enum>
+
+<enum name="pc_di_primtype">
+	<value name="DI_PT_NONE" value="0"/>
+	<!-- POINTLIST_PSIZE is used on a3xx/a4xx when gl_PointSize is written: -->
+	<value name="DI_PT_POINTLIST_PSIZE" value="1"/>
+	<value name="DI_PT_LINELIST" value="2"/>
+	<value name="DI_PT_LINESTRIP" value="3"/>
+	<value name="DI_PT_TRILIST" value="4"/>
+	<value name="DI_PT_TRIFAN" value="5"/>
+	<value name="DI_PT_TRISTRIP" value="6"/>
+	<value name="DI_PT_LINELOOP" value="7"/>  <!-- a22x, a3xx -->
+	<value name="DI_PT_RECTLIST" value="8"/>
+	<value name="DI_PT_POINTLIST" value="9"/>
+	<value name="DI_PT_LINE_ADJ" value="0xa"/>
+	<value name="DI_PT_LINESTRIP_ADJ" value="0xb"/>
+	<value name="DI_PT_TRI_ADJ" value="0xc"/>
+	<value name="DI_PT_TRISTRIP_ADJ" value="0xd"/>
+
+	<value name="DI_PT_PATCHES0" value="0x1f"/>
+	<value name="DI_PT_PATCHES1" value="0x20"/>
+	<value name="DI_PT_PATCHES2" value="0x21"/>
+	<value name="DI_PT_PATCHES3" value="0x22"/>
+	<value name="DI_PT_PATCHES4" value="0x23"/>
+	<value name="DI_PT_PATCHES5" value="0x24"/>
+	<value name="DI_PT_PATCHES6" value="0x25"/>
+	<value name="DI_PT_PATCHES7" value="0x26"/>
+	<value name="DI_PT_PATCHES8" value="0x27"/>
+	<value name="DI_PT_PATCHES9" value="0x28"/>
+	<value name="DI_PT_PATCHES10" value="0x29"/>
+	<value name="DI_PT_PATCHES11" value="0x2a"/>
+	<value name="DI_PT_PATCHES12" value="0x2b"/>
+	<value name="DI_PT_PATCHES13" value="0x2c"/>
+	<value name="DI_PT_PATCHES14" value="0x2d"/>
+	<value name="DI_PT_PATCHES15" value="0x2e"/>
+	<value name="DI_PT_PATCHES16" value="0x2f"/>
+	<value name="DI_PT_PATCHES17" value="0x30"/>
+	<value name="DI_PT_PATCHES18" value="0x31"/>
+	<value name="DI_PT_PATCHES19" value="0x32"/>
+	<value name="DI_PT_PATCHES20" value="0x33"/>
+	<value name="DI_PT_PATCHES21" value="0x34"/>
+	<value name="DI_PT_PATCHES22" value="0x35"/>
+	<value name="DI_PT_PATCHES23" value="0x36"/>
+	<value name="DI_PT_PATCHES24" value="0x37"/>
+	<value name="DI_PT_PATCHES25" value="0x38"/>
+	<value name="DI_PT_PATCHES26" value="0x39"/>
+	<value name="DI_PT_PATCHES27" value="0x3a"/>
+	<value name="DI_PT_PATCHES28" value="0x3b"/>
+	<value name="DI_PT_PATCHES29" value="0x3c"/>
+	<value name="DI_PT_PATCHES30" value="0x3d"/>
+	<value name="DI_PT_PATCHES31" value="0x3e"/>
+</enum>
+
+<enum name="pc_di_src_sel">
+	<value name="DI_SRC_SEL_DMA" value="0"/>
+	<value name="DI_SRC_SEL_IMMEDIATE" value="1"/>
+	<value name="DI_SRC_SEL_AUTO_INDEX" value="2"/>
+	<value name="DI_SRC_SEL_AUTO_XFB" value="3"/>
+</enum>
+
+<enum name="pc_di_face_cull_sel">
+	<value name="DI_FACE_CULL_NONE" value="0"/>
+	<value name="DI_FACE_CULL_FETCH" value="1"/>
+	<value name="DI_FACE_BACKFACE_CULL" value="2"/>
+	<value name="DI_FACE_FRONTFACE_CULL" value="3"/>
+</enum>
+
+<enum name="pc_di_index_size">
+	<value name="INDEX_SIZE_IGN" value="0"/>
+	<value name="INDEX_SIZE_16_BIT" value="0"/>
+	<value name="INDEX_SIZE_32_BIT" value="1"/>
+	<value name="INDEX_SIZE_8_BIT" value="2"/>
+	<value name="INDEX_SIZE_INVALID"/>
+</enum>
+
+<enum name="pc_di_vis_cull_mode">
+	<value name="IGNORE_VISIBILITY" value="0"/>
+	<value name="USE_VISIBILITY" value="1"/>
+</enum>
+
+<enum name="adreno_pm4_packet_type">
+	<value name="CP_TYPE0_PKT" value="0x00000000"/>
+	<value name="CP_TYPE1_PKT" value="0x40000000"/>
+	<value name="CP_TYPE2_PKT" value="0x80000000"/>
+	<value name="CP_TYPE3_PKT" value="0xc0000000"/>
+	<value name="CP_TYPE4_PKT" value="0x40000000"/>
+	<value name="CP_TYPE7_PKT" value="0x70000000"/>
+</enum>
+
+<!--
+   Note that in some cases, the same packet id is recycled on a later
+   generation, so variants attribute is used to distinguish.   They
+   may not be completely accurate, we would probably have to analyze
+   the pfp and me/pm4 firmware to verify the packet is actually
+   handled on a particular generation.  But it is at least enough to
+   disambiguate the packet-id's that were re-used for different
+   packets starting with a5xx.
+ -->
+<enum name="adreno_pm4_type3_packets" varset="chip">
+	<doc>initialize CP's micro-engine</doc>
+	<value name="CP_ME_INIT" value="0x48"/>
+	<doc>skip N 32-bit words to get to the next packet</doc>
+	<value name="CP_NOP" value="0x10"/>
+	<doc>
+		indirect buffer dispatch.  prefetch parser uses this packet
+		type to determine whether to pre-fetch the IB
+	</doc>
+	<value name="CP_PREEMPT_ENABLE" value="0x1c" variants="A5XX"/>
+	<value name="CP_PREEMPT_TOKEN" value="0x1e" variants="A5XX"/>
+	<value name="CP_INDIRECT_BUFFER" value="0x3f"/>
+	<doc>
+		Takes the same arguments as CP_INDIRECT_BUFFER, but jumps to
+		another buffer at the same level. Must be at the end of IB, and
+		doesn't work with draw state IB's.
+	</doc>
+	<value name="CP_INDIRECT_BUFFER_CHAIN" value="0x57" variants="A5XX-"/>
+	<doc>indirect buffer dispatch.  same as IB, but init is pipelined</doc>
+	<value name="CP_INDIRECT_BUFFER_PFD" value="0x37"/>
+	<doc>
+		Waits for the IDLE state of the engine before further drawing.
+		This is pipelined, so the CP may continue.
+	</doc>
+	<value name="CP_WAIT_FOR_IDLE" value="0x26"/>
+	<doc>wait until a register or memory location is a specific value</doc>
+	<value name="CP_WAIT_REG_MEM" value="0x3c"/>
+	<doc>wait until a register location is equal to a specific value</doc>
+	<value name="CP_WAIT_REG_EQ" value="0x52"/>
+	<doc>wait until a register location is >= a specific value</doc>
+	<value name="CP_WAIT_REG_GTE" value="0x53" variants="A2XX-A4XX"/>
+	<doc>wait until a read completes</doc>
+	<value name="CP_WAIT_UNTIL_READ" value="0x5c" variants="A2XX-A4XX"/>
+	<doc>wait until all base/size writes from an IB_PFD packet have completed</doc>
+	<!--
+		NOTE: CP_WAIT_IB_PFD_COMPLETE unimplemented at least since a5xx fw, and
+		recycled for something new on a7xx
+	 -->
+	<value name="CP_WAIT_IB_PFD_COMPLETE" value="0x5d" varset="chip" variants="A2XX-A4XX"/>
+	<doc>register read/modify/write</doc>
+	<value name="CP_REG_RMW" value="0x21"/>
+	<doc>Set binning configuration registers</doc>
+	<value name="CP_SET_BIN_DATA" value="0x2f" variants="A2XX-A4XX"/>
+	<value name="CP_SET_BIN_DATA5" value="0x2f" variants="A5XX-"/>
+	<doc>reads register in chip and writes to memory</doc>
+	<value name="CP_REG_TO_MEM" value="0x3e"/>
+	<doc>write N 32-bit words to memory</doc>
+	<value name="CP_MEM_WRITE" value="0x3d"/>
+	<doc>write CP_PROG_COUNTER value to memory</doc>
+	<value name="CP_MEM_WRITE_CNTR" value="0x4f"/>
+	<doc>conditional execution of a sequence of packets</doc>
+	<value name="CP_COND_EXEC" value="0x44"/>
+	<doc>conditional write to memory or register</doc>
+	<value name="CP_COND_WRITE" value="0x45" variants="A2XX-A4XX"/>
+	<value name="CP_COND_WRITE5" value="0x45" variants="A5XX-"/>
+	<doc>generate an event that creates a write to memory when completed</doc>
+	<value name="CP_EVENT_WRITE" value="0x46" variants="A2XX-A6XX"/>
+	<value name="CP_EVENT_WRITE7" value="0x46" variants="A7XX-"/>
+	<doc>generate a VS|PS_done event</doc>
+	<value name="CP_EVENT_WRITE_SHD" value="0x58"/>
+	<doc>generate a cache flush done event</doc>
+	<value name="CP_EVENT_WRITE_CFL" value="0x59"/>
+	<doc>generate a z_pass done event</doc>
+	<value name="CP_EVENT_WRITE_ZPD" value="0x5b"/>
+	<doc>
+		not sure the real name, but this seems to be what is used for
+		opencl, instead of CP_DRAW_INDX..
+	</doc>
+	<value name="CP_RUN_OPENCL" value="0x31"/>
+	<doc>initiate fetch of index buffer and draw</doc>
+	<value name="CP_DRAW_INDX" value="0x22"/>
+	<doc>draw using supplied indices in packet</doc>
+	<value name="CP_DRAW_INDX_2" value="0x36" variants="A2XX-A4XX"/>  <!-- this is something different on a6xx and unused on a5xx -->
+	<doc>initiate fetch of index buffer and binIDs and draw</doc>
+	<value name="CP_DRAW_INDX_BIN" value="0x34" variants="A2XX-A4XX"/>
+	<doc>initiate fetch of bin IDs and draw using supplied indices</doc>
+	<value name="CP_DRAW_INDX_2_BIN" value="0x35" variants="A2XX-A4XX"/>
+	<doc>begin/end initiator for viz query extent processing</doc>
+	<value name="CP_VIZ_QUERY" value="0x23" variants="A2XX-A4XX"/>
+	<doc>fetch state sub-blocks and initiate shader code DMAs</doc>
+	<value name="CP_SET_STATE" value="0x25"/>
+	<doc>load constant into chip and to memory</doc>
+	<value name="CP_SET_CONSTANT" value="0x2d" variants="A2XX"/>
+	<doc>load sequencer instruction memory (pointer-based)</doc>
+	<value name="CP_IM_LOAD" value="0x27"/>
+	<doc>load sequencer instruction memory (code embedded in packet)</doc>
+	<value name="CP_IM_LOAD_IMMEDIATE" value="0x2b"/>
+	<doc>load constants from a location in memory</doc>
+	<value name="CP_LOAD_CONSTANT_CONTEXT" value="0x2e" variants="A2XX"/>
+	<doc>selective invalidation of state pointers</doc>
+	<value name="CP_INVALIDATE_STATE" value="0x3b"/>
+	<doc>dynamically changes shader instruction memory partition</doc>
+	<value name="CP_SET_SHADER_BASES" value="0x4a" variants="A2XX-A4XX"/>
+	<doc>sets the 64-bit BIN_MASK register in the PFP</doc>
+	<value name="CP_SET_BIN_MASK" value="0x50" variants="A2XX-A4XX"/>
+	<doc>sets the 64-bit BIN_SELECT register in the PFP</doc>
+	<value name="CP_SET_BIN_SELECT" value="0x51" variants="A2XX-A4XX"/>
+	<doc>updates the current context, if needed</doc>
+	<value name="CP_CONTEXT_UPDATE" value="0x5e"/>
+	<doc>generate interrupt from the command stream</doc>
+	<value name="CP_INTERRUPT" value="0x40"/>
+	<doc>copy sequencer instruction memory to system memory</doc>
+	<value name="CP_IM_STORE" value="0x2c" variants="A2XX"/>
+
+	<!-- For a20x -->
+<!-- TODO handle variants..
+	<doc>
+		Program an offset that will added to the BIN_BASE value of
+		the 3D_DRAW_INDX_BIN packet
+	</doc>
+	<value name="CP_SET_BIN_BASE_OFFSET" value="0x4b"/>
+ -->
+
+	<!-- for a22x -->
+	<doc>
+		sets draw initiator flags register in PFP, gets bitwise-ORed into
+		every draw initiator
+	</doc>
+	<value name="CP_SET_DRAW_INIT_FLAGS" value="0x4b"/>
+	<doc>sets the register protection mode</doc>
+	<value name="CP_SET_PROTECTED_MODE" value="0x5f"/>
+
+	<value name="CP_BOOTSTRAP_UCODE" value="0x6f"/>
+
+	<!-- for a3xx -->
+	<doc>load high level sequencer command</doc>
+	<value name="CP_LOAD_STATE" value="0x30" variants="A3XX"/>
+	<value name="CP_LOAD_STATE4" value="0x30" variants="A4XX-A5XX"/>
+	<doc>Conditionally load a IB based on a flag, prefetch enabled</doc>
+	<value name="CP_COND_INDIRECT_BUFFER_PFE" value="0x3a"/>
+	<doc>Conditionally load a IB based on a flag, prefetch disabled</doc>
+	<value name="CP_COND_INDIRECT_BUFFER_PFD" value="0x32" variants="A3XX"/>
+	<doc>Load a buffer with pre-fetch enabled</doc>
+	<value name="CP_INDIRECT_BUFFER_PFE" value="0x3f" variants="A5XX"/>
+	<doc>Set bin (?)</doc>
+	<value name="CP_SET_BIN" value="0x4c" variants="A2XX"/>
+
+	<doc>test 2 memory locations to dword values specified</doc>
+	<value name="CP_TEST_TWO_MEMS" value="0x71"/>
+
+	<doc>Write register, ignoring context state for context sensitive registers</doc>
+	<value name="CP_REG_WR_NO_CTXT" value="0x78"/>
+
+	<doc>Record the real-time when this packet is processed by PFP</doc>
+	<value name="CP_RECORD_PFP_TIMESTAMP" value="0x11"/>
+
+	<!-- Used to switch GPU between secure and non-secure modes -->
+	<value name="CP_SET_SECURE_MODE" value="0x66"/>
+
+	<doc>PFP waits until the FIFO between the PFP and the ME is empty</doc>
+	<value name="CP_WAIT_FOR_ME" value="0x13"/>
+
+	<!-- for a4xx -->
+	<doc>
+		Used a bit like CP_SET_CONSTANT on a2xx, but can write multiple
+		groups of registers.  Looks like it can be used to create state
+		objects in GPU memory, and on state change only emit pointer
+		(via CP_SET_DRAW_STATE), which should be nice for reducing CPU
+		overhead:
+
+		(A4x) save PM4 stream pointers to execute upon a visible draw
+	</doc>
+	<value name="CP_SET_DRAW_STATE" value="0x43" variants="A4XX-"/>
+	<value name="CP_DRAW_INDX_OFFSET" value="0x38"/>
+	<value name="CP_DRAW_INDIRECT" value="0x28" variants="A4XX-"/>
+	<value name="CP_DRAW_INDX_INDIRECT" value="0x29" variants="A4XX-"/>
+	<value name="CP_DRAW_INDIRECT_MULTI" value="0x2a" variants="A6XX-"/>
+	<value name="CP_DRAW_AUTO" value="0x24"/>
+
+	<doc>
+		Enable or disable predication globally. Also resets the
+		predicate to "passing" and the local bit to enabled when
+		enabling global predication.
+	</doc>
+	<value name="CP_DRAW_PRED_ENABLE_GLOBAL" value="0x19"/>
+
+	<doc>
+		Enable or disable predication locally. Unlike globally enabling
+		predication, this packet doesn't touch any other state.
+		Predication only happens when enabled globally and locally and a
+		predicate has been set. This should be used for internal draws
+		which aren't supposed to use the predication state:
+
+		CP_DRAW_PRED_ENABLE_LOCAL(0)
+		... do draw...
+		CP_DRAW_PRED_ENABLE_LOCAL(1)
+	</doc>
+	<value name="CP_DRAW_PRED_ENABLE_LOCAL" value="0x1a"/>
+
+	<doc>
+		Latch a draw predicate into the internal register.
+	</doc>
+	<value name="CP_DRAW_PRED_SET" value="0x4e"/>
+
+	<doc>
+		for A4xx
+		Write to register with address that does not fit into type-0 pkt
+	</doc>
+	<value name="CP_WIDE_REG_WRITE" value="0x74" variants="A4XX"/>
+
+	<doc>copy from ME scratch RAM to a register</doc>
+	<value name="CP_SCRATCH_TO_REG" value="0x4d"/>
+
+	<doc>Copy from REG to ME scratch RAM</doc>
+	<value name="CP_REG_TO_SCRATCH" value="0x4a"/>
+
+	<doc>Wait for memory writes to complete</doc>
+	<value name="CP_WAIT_MEM_WRITES" value="0x12"/>
+
+	<doc>Conditional execution based on register comparison</doc>
+	<value name="CP_COND_REG_EXEC" value="0x47"/>
+
+	<doc>Memory to REG copy</doc>
+	<value name="CP_MEM_TO_REG" value="0x42"/>
+
+	<value name="CP_EXEC_CS_INDIRECT" value="0x41" variants="A4XX-"/>
+	<value name="CP_EXEC_CS" value="0x33"/>
+
+	<doc>
+		for a5xx
+	</doc>
+	<value name="CP_PERFCOUNTER_ACTION" value="0x50" variants="A5XX"/>
+	<!-- switches SMMU pagetable, used on a5xx+ only -->
+	<value name="CP_SMMU_TABLE_UPDATE" value="0x53" variants="A5XX-"/>
+	<!-- for a6xx -->
+	<doc>Tells CP the current mode of GPU operation</doc>
+	<value name="CP_SET_MARKER" value="0x65" variants="A6XX-"/>
+	<doc>Instruct CP to set a few internal CP registers</doc>
+	<value name="CP_SET_PSEUDO_REG" value="0x56" variants="A6XX-"/>
+	<!--
+	pairs of regid and value.. seems to be used to program some TF
+	related regs:
+	 -->
+	<value name="CP_CONTEXT_REG_BUNCH" value="0x5c" variants="A5XX-"/>
+	<!-- A5XX Enable yield in RB only -->
+	<value name="CP_YIELD_ENABLE" value="0x1c" variants="A5XX"/>
+	<doc>
+		Enables IB2 skipping.  If both GLOBAL and LOCAL are 1 and
+		nothing is left in the visibility stream, then
+		CP_INDIRECT_BUFFER will be skipped, and draws will early return
+		from their IB.
+	</doc>
+	<value name="CP_SKIP_IB2_ENABLE_GLOBAL" value="0x1d" variants="A5XX-"/>
+	<value name="CP_SKIP_IB2_ENABLE_LOCAL" value="0x23" variants="A5XX-"/>
+	<value name="CP_SET_SUBDRAW_SIZE" value="0x35" variants="A5XX-"/>
+	<value name="CP_WHERE_AM_I" value="0x62" variants="A5XX-"/>
+	<value name="CP_SET_VISIBILITY_OVERRIDE" value="0x64" variants="A5XX-"/>
+	<!-- Enable/Disable/Defer A5x global preemption model -->
+	<value name="CP_PREEMPT_ENABLE_GLOBAL" value="0x69" variants="A5XX"/>
+	<!-- Enable/Disable A5x local preemption model -->
+	<value name="CP_PREEMPT_ENABLE_LOCAL" value="0x6a" variants="A5XX"/>
+	<!-- Yield token on a5xx similar to CP_PREEMPT on a4xx -->
+	<value name="CP_CONTEXT_SWITCH_YIELD" value="0x6b" variants="A5XX-"/>
+	<!-- Inform CP about current render mode (needed for a5xx preemption) -->
+	<value name="CP_SET_RENDER_MODE" value="0x6c" variants="A5XX"/>
+	<value name="CP_COMPUTE_CHECKPOINT" value="0x6e" variants="A5XX"/>
+	<!-- check if this works on earlier.. -->
+	<value name="CP_MEM_TO_MEM" value="0x73" variants="A5XX-"/>
+
+	<doc>
+		General purpose 2D blit engine for image transfers and mipmap
+		generation.  Reads through UCHE, writes through the CCU cache in
+		the PS stage.
+	</doc>
+	<value name="CP_BLIT" value="0x2c" variants="A5XX-"/>
+
+	<!-- Test specified bit in specified register and set predicate -->
+	<value name="CP_REG_TEST" value="0x39" variants="A5XX-"/>
+
+	<!--
+	Seems to set the mode flags which control which CP_SET_DRAW_STATE
+	packets are executed, based on their ENABLE_MASK values
+	
+	CP_SET_MODE w/ payload of 0x1 seems to cause CP_SET_DRAW_STATE
+	packets w/ ENABLE_MASK & 0x6 to execute immediately
+	 -->
+	<value name="CP_SET_MODE" value="0x63" variants="A6XX-"/>
+
+	<!--
+	Seems like there are now separate blocks of state for VS vs FS/CS
+	(probably these amounts to geometry vs fragments so that geometry
+	stage of the pipeline for next draw can start while fragment stage
+	of current draw is still running.  The format of the payload of the
+	packets is the same, the only difference is the offsets of the regs
+	the firmware code that handles the packet writes.
+
+	Note that for CL, starting with a6xx, the preferred # of local
+	threads is no longer the same as the max, implying that the shader
+	core can now run warps from unrelated shaders (ie.
+	CL_KERNEL_PREFERRED_WORK_GROUP_SIZE_MULTIPLE vs
+	CL_KERNEL_WORK_GROUP_SIZE)
+	 -->
+	<value name="CP_LOAD_STATE6_GEOM" value="0x32" variants="A6XX-"/>
+	<value name="CP_LOAD_STATE6_FRAG" value="0x34" variants="A6XX-"/>
+	<!--
+	Note: For IBO state (Image/SSBOs) which have shared state across
+	shader stages, for 3d pipeline CP_LOAD_STATE6 is used.  But for
+	compute shaders, CP_LOAD_STATE6_FRAG is used.  Possibly they are
+	interchangable.
+	 -->
+	<value name="CP_LOAD_STATE6" value="0x36" variants="A6XX-"/>
+
+	<!-- internal packets: -->
+	<value name="IN_IB_PREFETCH_END" value="0x17" variants="A2XX"/>
+	<value name="IN_SUBBLK_PREFETCH" value="0x1f" variants="A2XX"/>
+	<value name="IN_INSTR_PREFETCH" value="0x20" variants="A2XX"/>
+	<value name="IN_INSTR_MATCH" value="0x47" variants="A2XX"/>
+	<value name="IN_CONST_PREFETCH" value="0x49" variants="A2XX"/>
+	<value name="IN_INCR_UPDT_STATE" value="0x55" variants="A2XX"/>
+	<value name="IN_INCR_UPDT_CONST" value="0x56" variants="A2XX"/>
+	<value name="IN_INCR_UPDT_INSTR" value="0x57" variants="A2XX"/>
+
+	<!-- internal jumptable entries on a6xx+, possibly a5xx: -->
+
+	<!-- jmptable entry used to handle type4 packet on a5xx+: -->
+	<value name="PKT4" value="0x04" variants="A5XX-"/>
+	<!-- called when ROQ is empty, "returns" from an IB or merged sequence of IBs -->
+	<value name="IN_IB_END" value="0x0a" variants="A6XX-"/>
+	<!-- handles IFPC save/restore -->
+	<value name="IN_GMU_INTERRUPT" value="0x0b" variants="A6XX-"/>
+	<!-- preemption/context-swtich routine -->
+	<value name="IN_PREEMPT" value="0x0f" variants="A6XX-"/>
+
+	<!-- TODO do these exist on A5xx? -->
+	<value name="CP_SCRATCH_WRITE" value="0x4c" variants="A6XX"/>
+	<value name="CP_REG_TO_MEM_OFFSET_MEM" value="0x74" variants="A6XX-"/>
+	<value name="CP_REG_TO_MEM_OFFSET_REG" value="0x72" variants="A6XX-"/>
+	<value name="CP_WAIT_MEM_GTE" value="0x14" variants="A6XX"/>
+	<value name="CP_WAIT_TWO_REGS" value="0x70" variants="A6XX"/>
+	<value name="CP_MEMCPY" value="0x75" variants="A6XX-"/>
+	<value name="CP_SET_BIN_DATA5_OFFSET" value="0x2e" variants="A6XX-"/>
+	<!-- A750+, set in place of CP_SET_BIN_DATA5_OFFSET but has different values -->
+	<value name="CP_SET_UNK_BIN_DATA" value="0x2d" variants="A7XX-"/>
+	<doc>
+                Write CP_CONTEXT_SWITCH_*_INFO from CP to the following dwords,
+                and forcibly switch to the indicated context.
+	</doc>
+	<value name="CP_CONTEXT_SWITCH" value="0x54" variants="A6XX"/>
+	<!-- Note, kgsl calls this CP_SET_AMBLE: -->
+	<value name="CP_SET_CTXSWITCH_IB" value="0x55" variants="A6XX-"/>
+
+	<!--
+	Seems to always have the payload:
+	  00000002 00008801 00004010
+	or:
+	  00000002 00008801 00004090
+	or:
+	  00000002 00008801 00000010
+	  00000002 00008801 00010010
+	  00000002 00008801 00d64010
+	  ...
+	Note set for compute shaders..
+	Is 0x8801 a register offset?
+	This appears to be a special sort of register write packet
+	more or less, but the firmware has some special handling..
+	Seems like it intercepts/modifies certain register offsets,
+	but others are treated like a normal PKT4 reg write.  I
+	guess there are some registers that the fw controls certain
+	bits.
+	 -->
+	<value name="CP_REG_WRITE" value="0x6d" variants="A6XX"/>
+
+	<doc>
+		These first appear in a650_sqe.bin. They can in theory be used
+		to loop any sequence of IB1 commands, but in practice they are
+		used to loop over bins. There is a fixed-size per-iteration
+		prefix, used to set per-bin state, and then the following IB1
+		commands are executed until CP_END_BIN which are always the same
+		for each iteration and usually contain a list of
+		CP_INDIRECT_BUFFER calls to IB2 commands which setup state and
+		execute restore/draw/save commands. This replaces the previous
+		technique of just repeating the CP_INDIRECT_BUFFER calls and
+		"unrolling" the loop.
+	</doc>
+	<value name="CP_START_BIN" value="0x50" variants="A6XX-"/>
+	<value name="CP_END_BIN" value="0x51" variants="A6XX-"/>
+
+	<doc> Make next dword 1 to disable preemption, 0 to re-enable it. </doc>
+	<value name="CP_PREEMPT_DISABLE" value="0x6c" variants="A6XX"/>
+
+	<value name="CP_WAIT_TIMESTAMP" value="0x14" variants="A7XX-"/>
+	<value name="CP_GLOBAL_TIMESTAMP" value="0x15" variants="A7XX-"/>  <!-- payload 1 dword -->
+	<value name="CP_LOCAL_TIMESTAMP" value="0x16" variants="A7XX-"/>  <!-- payload 1 dword, follows 0x15 -->
+	<value name="CP_THREAD_CONTROL" value="0x17" variants="A7XX-"/>
+	<!-- payload 4 dwords, last two could be render target addr (one pkt per MRT), possibly used for GMEM save/restore?-->
+	<value name="CP_RESOURCE_LIST" value="0x18" variants="A7XX-"/>
+	<doc> Can clear BV/BR counters, or wait until one catches up to another </doc>
+	<value name="CP_BV_BR_COUNT_OPS" value="0x1b" variants="A7XX-"/>
+	<doc> Clears, adds to local, or adds to global timestamp </doc>
+	<value name="CP_MODIFY_TIMESTAMP" value="0x1c" variants="A7XX-"/>
+	<!-- similar to CP_CONTEXT_REG_BUNCH, but discards first two dwords?? -->
+	<value name="CP_CONTEXT_REG_BUNCH2" value="0x5d" variants="A7XX-"/>
+	<doc>
+		Write to a scratch memory that is read by CP_REG_TEST with
+		SOURCE_SCRATCH_MEM set. It's not the same scratch as scratch registers.
+		However it uses the same memory space.
+	</doc>
+	<value name="CP_MEM_TO_SCRATCH_MEM" value="0x49" variants="A7XX-"/>
+
+	<doc>
+		Executes an array of fixed-size command buffers where each
+		buffer is assumed to have one draw call, skipping buffers with
+		non-visible draw calls.
+	</doc>
+	<value name="CP_FIXED_STRIDE_DRAW_TABLE" value="0x7f" variants="A7XX-"/>
+
+	<doc>Reset various on-chip state used for synchronization</doc>
+	<value name="CP_RESET_CONTEXT_STATE" value="0x1f" variants="A7XX-"/>
+</enum>
+
+
+<domain name="CP_LOAD_STATE" width="32">
+	<doc>Load state, a3xx (and later?)</doc>
+	<enum name="adreno_state_block">
+		<value name="SB_VERT_TEX" value="0"/>
+		<value name="SB_VERT_MIPADDR" value="1"/>
+		<value name="SB_FRAG_TEX" value="2"/>
+		<value name="SB_FRAG_MIPADDR" value="3"/>
+		<value name="SB_VERT_SHADER" value="4"/>
+		<value name="SB_GEOM_SHADER" value="5"/>
+		<value name="SB_FRAG_SHADER" value="6"/>
+		<value name="SB_COMPUTE_SHADER" value="7"/>
+	</enum>
+	<enum name="adreno_state_type">
+		<value name="ST_SHADER" value="0"/>
+		<value name="ST_CONSTANTS" value="1"/>
+	</enum>
+	<enum name="adreno_state_src">
+		<value name="SS_DIRECT" value="0">
+			<doc>inline with the CP_LOAD_STATE packet</doc>
+		</value>
+		<value name="SS_INVALID_ALL_IC" value="2"/>
+		<value name="SS_INVALID_PART_IC" value="3"/>
+		<value name="SS_INDIRECT" value="4">
+			<doc>in buffer pointed to by EXT_SRC_ADDR</doc>
+		</value>
+		<value name="SS_INDIRECT_TCM" value="5"/>
+		<value name="SS_INDIRECT_STM" value="6"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="DST_OFF" low="0" high="15" type="uint"/>
+		<bitfield name="STATE_SRC" low="16" high="18" type="adreno_state_src"/>
+		<bitfield name="STATE_BLOCK" low="19" high="21" type="adreno_state_block"/>
+		<bitfield name="NUM_UNIT" low="22" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="STATE_TYPE" low="0" high="1" type="adreno_state_type"/>
+		<bitfield name="EXT_SRC_ADDR" low="2" high="31" shr="2"/>
+	</reg32>
+</domain>
+
+<domain name="CP_LOAD_STATE4" width="32" varset="chip">
+	<doc>Load state, a4xx+</doc>
+	<enum name="a4xx_state_block">
+		<!--
+		unknown: 0x7 and 0xf <- seen in compute shader
+
+		STATE_BLOCK = 0x6, STATE_TYPE = 0x2 possibly used for preemption?
+		Seen in some GL shaders.  Payload is NUM_UNIT dwords, and it contains
+		the gpuaddr of the following shader constants block.  DST_OFF seems
+		to specify which shader stage:
+
+		    16 -> vert
+		    36 -> tcs
+		    56 -> tes
+		    76 -> geom
+		    96 -> frag
+
+		Example:
+
+opcode: CP_LOAD_STATE4 (30) (12 dwords)
+        { DST_OFF = 16 | STATE_SRC = SS4_DIRECT | STATE_BLOCK = 0x6 | NUM_UNIT = 4 }
+        { STATE_TYPE = 0x2 | EXT_SRC_ADDR = 0 }
+        { EXT_SRC_ADDR_HI = 0 }
+                        0000: c0264100 00000000 00000000 00000000
+                0000: 70b0000b 01180010 00000002 00000000 c0264100 00000000 00000000 00000000
+
+opcode: CP_LOAD_STATE4 (30) (4 dwords)
+        { DST_OFF = 16 | STATE_SRC = SS4_INDIRECT | STATE_BLOCK = SB4_VS_SHADER | NUM_UNIT = 4 }
+        { STATE_TYPE = ST4_CONSTANTS | EXT_SRC_ADDR = 0xc0264100 }
+        { EXT_SRC_ADDR_HI = 0 }
+                        0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
+                        0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
+                        0000: 00000040 0000000c 00000000 00000000 00000000 00000000 00000000 00000000
+
+		STATE_BLOCK = 0x6, STATE_TYPE = 0x1, seen in compute shader.  NUM_UNITS * 2 dwords.
+
+		 -->
+		<value name="SB4_VS_TEX"    value="0x0"/>
+		<value name="SB4_HS_TEX"    value="0x1"/>    <!-- aka. TCS -->
+		<value name="SB4_DS_TEX"    value="0x2"/>    <!-- aka. TES -->
+		<value name="SB4_GS_TEX"    value="0x3"/>
+		<value name="SB4_FS_TEX"    value="0x4"/>
+		<value name="SB4_CS_TEX"    value="0x5"/>
+		<value name="SB4_VS_SHADER" value="0x8"/>
+		<value name="SB4_HS_SHADER" value="0x9"/>
+		<value name="SB4_DS_SHADER" value="0xa"/>
+		<value name="SB4_GS_SHADER" value="0xb"/>
+		<value name="SB4_FS_SHADER" value="0xc"/>
+		<value name="SB4_CS_SHADER" value="0xd"/>
+		<!--
+		for SSBO, STATE_TYPE=0 appears to be addresses (four dwords each),
+		STATE_TYPE=1 sizes, STATE_TYPE=2 addresses again (two dwords each)
+
+		Compute has it's own dedicated SSBO state, it seems, but the rest
+		of the stages share state
+		 -->
+		<value name="SB4_SSBO"   value="0xe"/>
+		<value name="SB4_CS_SSBO"   value="0xf"/>
+	</enum>
+	<enum name="a4xx_state_type">
+		<value name="ST4_SHADER" value="0"/>
+		<value name="ST4_CONSTANTS" value="1"/>
+		<value name="ST4_UBO" value="2"/>
+	</enum>
+	<enum name="a4xx_state_src">
+		<value name="SS4_DIRECT" value="0"/>
+		<value name="SS4_INDIRECT" value="2"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="DST_OFF" low="0" high="13" type="uint"/>
+		<bitfield name="STATE_SRC" low="16" high="17" type="a4xx_state_src"/>
+		<bitfield name="STATE_BLOCK" low="18" high="21" type="a4xx_state_block"/>
+		<bitfield name="NUM_UNIT" low="22" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="STATE_TYPE" low="0" high="1" type="a4xx_state_type"/>
+		<bitfield name="EXT_SRC_ADDR" low="2" high="31" shr="2"/>
+	</reg32>
+	<reg32 offset="2" name="2" varset="chip" variants="A5XX-">
+		<bitfield name="EXT_SRC_ADDR_HI" low="0" high="31" shr="0"/>
+	</reg32>
+</domain>
+
+<!-- looks basically same CP_LOAD_STATE4 -->
+<domain name="CP_LOAD_STATE6" width="32" varset="chip">
+	<doc>Load state, a6xx+</doc>
+	<enum name="a6xx_state_block">
+		<value name="SB6_VS_TEX"    value="0x0"/>
+		<value name="SB6_HS_TEX"    value="0x1"/>    <!-- aka. TCS -->
+		<value name="SB6_DS_TEX"    value="0x2"/>    <!-- aka. TES -->
+		<value name="SB6_GS_TEX"    value="0x3"/>
+		<value name="SB6_FS_TEX"    value="0x4"/>
+		<value name="SB6_CS_TEX"    value="0x5"/>
+		<value name="SB6_VS_SHADER" value="0x8"/>
+		<value name="SB6_HS_SHADER" value="0x9"/>
+		<value name="SB6_DS_SHADER" value="0xa"/>
+		<value name="SB6_GS_SHADER" value="0xb"/>
+		<value name="SB6_FS_SHADER" value="0xc"/>
+		<value name="SB6_CS_SHADER" value="0xd"/>
+		<value name="SB6_IBO"       value="0xe"/>
+		<value name="SB6_CS_IBO"    value="0xf"/>
+	</enum>
+	<enum name="a6xx_state_type">
+		<value name="ST6_SHADER" value="0"/>
+		<value name="ST6_CONSTANTS" value="1"/>
+		<value name="ST6_UBO" value="2"/>
+		<value name="ST6_IBO" value="3"/>
+	</enum>
+	<enum name="a6xx_state_src">
+		<value name="SS6_DIRECT" value="0"/>
+		<value name="SS6_BINDLESS" value="1"/> <!-- TODO does this exist on a4xx/a5xx? -->
+		<value name="SS6_INDIRECT" value="2"/>
+		<doc>
+		SS6_UBO used by the a6xx vulkan blob with tesselation constants
+		in this case, EXT_SRC_ADDR is (ubo_id shl 16 | offset)
+		to load constants from a UBO loaded with DST_OFF = 14 and offset 0,
+		EXT_SRC_ADDR = 0xe0000
+		(offset is a guess, should be in bytes given that maxUniformBufferRange=64k)
+		</doc>
+		<value name="SS6_UBO" value="3"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="DST_OFF" low="0" high="13" type="uint"/>
+		<bitfield name="STATE_TYPE" low="14" high="15" type="a6xx_state_type"/>
+		<bitfield name="STATE_SRC" low="16" high="17" type="a6xx_state_src"/>
+		<bitfield name="STATE_BLOCK" low="18" high="21" type="a6xx_state_block"/>
+		<bitfield name="NUM_UNIT" low="22" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="EXT_SRC_ADDR" low="2" high="31" shr="2"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="EXT_SRC_ADDR_HI" low="0" high="31" shr="0"/>
+	</reg32>
+	<reg64 offset="1" name="EXT_SRC_ADDR" type="address"/>
+</domain>
+
+<bitset name="vgt_draw_initiator" inline="yes">
+	<bitfield name="PRIM_TYPE" low="0" high="5" type="pc_di_primtype"/>
+	<bitfield name="SOURCE_SELECT" low="6" high="7" type="pc_di_src_sel"/>
+	<bitfield name="VIS_CULL" low="9" high="10" type="pc_di_vis_cull_mode"/>
+	<bitfield name="INDEX_SIZE" pos="11" type="pc_di_index_size"/>
+	<bitfield name="NOT_EOP" pos="12" type="boolean"/>
+	<bitfield name="SMALL_INDEX" pos="13" type="boolean"/>
+	<bitfield name="PRE_DRAW_INITIATOR_ENABLE" pos="14" type="boolean"/>
+	<bitfield name="NUM_INSTANCES" low="24" high="31" type="uint"/>
+</bitset>
+
+<!-- changed on a4xx: -->
+<enum name="a4xx_index_size">
+	<value name="INDEX4_SIZE_8_BIT" value="0"/>
+	<value name="INDEX4_SIZE_16_BIT" value="1"/>
+	<value name="INDEX4_SIZE_32_BIT" value="2"/>
+</enum>
+
+<enum name="a6xx_patch_type">
+  <value name="TESS_QUADS" value="0"/>
+  <value name="TESS_TRIANGLES" value="1"/>
+  <value name="TESS_ISOLINES" value="2"/>
+</enum>
+
+<bitset name="vgt_draw_initiator_a4xx" inline="yes">
+	<!-- When the 0x20 bit is set, it's the number of patch vertices - 1 -->
+	<bitfield name="PRIM_TYPE" low="0" high="5" type="pc_di_primtype"/>
+	<bitfield name="SOURCE_SELECT" low="6" high="7" type="pc_di_src_sel"/>
+	<bitfield name="VIS_CULL" low="8" high="9" type="pc_di_vis_cull_mode"/>
+	<bitfield name="INDEX_SIZE" low="10" high="11" type="a4xx_index_size"/>
+	<bitfield name="PATCH_TYPE" low="12" high="13" type="a6xx_patch_type"/>
+	<bitfield name="GS_ENABLE" pos="16" type="boolean"/>
+	<bitfield name="TESS_ENABLE" pos="17" type="boolean"/>
+</bitset>
+
+<domain name="CP_DRAW_INDX" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="VIZ_QUERY" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="1" name="1" type="vgt_draw_initiator"/>
+	<reg32 offset="2" name="2">
+		<bitfield name="NUM_INDICES" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="INDX_BASE" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<bitfield name="INDX_SIZE" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain name="CP_DRAW_INDX_2" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="VIZ_QUERY" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="1" name="1" type="vgt_draw_initiator"/>
+	<reg32 offset="2" name="2">
+		<bitfield name="NUM_INDICES" low="0" high="31" type="uint"/>
+	</reg32>
+	<!-- followed by NUM_INDICES indices.. -->
+</domain>
+
+<domain name="CP_DRAW_INDX_OFFSET" width="32">
+	<reg32 offset="0" name="0" type="vgt_draw_initiator_a4xx"/>
+	<reg32 offset="1" name="1">
+		<bitfield name="NUM_INSTANCES" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="NUM_INDICES" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="FIRST_INDX" low="0" high="31"/>
+	</reg32>
+
+	<stripe varset="chip" variants="A5XX-">
+		<reg32 offset="4" name="4">
+			<bitfield name="INDX_BASE_LO" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="5" name="5">
+			<bitfield name="INDX_BASE_HI" low="0" high="31"/>
+		</reg32>
+		<reg64 offset="4" name="INDX_BASE" type="address"/>
+		<reg32 offset="6" name="6">
+			<!-- max # of elements in index buffer -->
+			<bitfield name="MAX_INDICES" low="0" high="31"/>
+		</reg32>
+	</stripe>
+
+	<reg32 offset="4" name="4">
+		<bitfield name="INDX_BASE" low="0" high="31" type="address"/>
+	</reg32>
+
+	<reg32 offset="5" name="5">
+		<bitfield name="INDX_SIZE" low="0" high="31" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_DRAW_INDIRECT" width="32" varset="chip" prefix="chip" variants="A4XX-">
+	<reg32 offset="0" name="0" type="vgt_draw_initiator_a4xx"/>
+	<stripe varset="chip" variants="A4XX">
+		<reg32 offset="1" name="1">
+			<bitfield name="INDIRECT" low="0" high="31"/>
+		</reg32>
+	</stripe>
+	<stripe varset="chip" variants="A5XX-">
+		<reg32 offset="1" name="1">
+			<bitfield name="INDIRECT_LO" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="2" name="2">
+			<bitfield name="INDIRECT_HI" low="0" high="31"/>
+		</reg32>
+		<reg64 offset="1" name="INDIRECT" type="address"/>
+	</stripe>
+</domain>
+
+<domain name="CP_DRAW_INDX_INDIRECT" width="32" varset="chip" prefix="chip" variants="A4XX-">
+	<reg32 offset="0" name="0" type="vgt_draw_initiator_a4xx"/>
+	<stripe varset="chip" variants="A4XX">
+		<reg32 offset="1" name="1">
+			<bitfield name="INDX_BASE" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="2" name="2">
+			<!-- max # of bytes in index buffer -->
+			<bitfield name="INDX_SIZE" low="0" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="3" name="3">
+			<bitfield name="INDIRECT" low="0" high="31"/>
+		</reg32>
+	</stripe>
+	<stripe varset="chip" variants="A5XX-">
+		<reg32 offset="1" name="1">
+			<bitfield name="INDX_BASE_LO" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="2" name="2">
+			<bitfield name="INDX_BASE_HI" low="0" high="31"/>
+		</reg32>
+		<reg64 offset="1" name="INDX_BASE" type="address"/>
+		<reg32 offset="3" name="3">
+			<!-- max # of elements in index buffer -->
+			<bitfield name="MAX_INDICES" low="0" high="31" type="uint"/>
+		</reg32>
+		<reg32 offset="4" name="4">
+			<bitfield name="INDIRECT_LO" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="5" name="5">
+			<bitfield name="INDIRECT_HI" low="0" high="31"/>
+		</reg32>
+		<reg64 offset="4" name="INDIRECT" type="address"/>
+	</stripe>
+</domain>
+
+<domain name="CP_DRAW_INDIRECT_MULTI" width="32" varset="chip" prefix="chip" variants="A6XX-">
+	<enum name="a6xx_draw_indirect_opcode">
+		<value name="INDIRECT_OP_NORMAL"  value="0x2"/>
+		<value name="INDIRECT_OP_INDEXED" value="0x4"/>
+		<value name="INDIRECT_OP_INDIRECT_COUNT" value="0x6"/>
+		<value name="INDIRECT_OP_INDIRECT_COUNT_INDEXED" value="0x7"/>
+	</enum>
+	<reg32 offset="0" name="0" type="vgt_draw_initiator_a4xx"/>
+	<reg32 offset="1" name="1">
+		<bitfield name="OPCODE" low="0" high="3" type="a6xx_draw_indirect_opcode" addvariant="yes"/>
+		<doc>
+		DST_OFF same as in CP_LOAD_STATE6 - vec4 VS const at this offset will
+		be updated for each draw to {draw_id, first_vertex, first_instance, 0}
+		value of 0 disables it
+		</doc>
+		<bitfield name="DST_OFF" low="8" high="21" type="hex"/>
+	</reg32>
+	<reg32 offset="2" name="DRAW_COUNT" type="uint"/>
+	<stripe varset="a6xx_draw_indirect_opcode" variants="INDIRECT_OP_NORMAL">
+		<reg64 offset="3" name="INDIRECT" type="address"/>
+		<reg32 offset="5" name="STRIDE" type="uint"/>
+	</stripe>
+	<stripe varset="a6xx_draw_indirect_opcode" variants="INDIRECT_OP_INDEXED" prefix="INDEXED">
+		<reg64 offset="3" name="INDEX" type="address"/>
+		<reg32 offset="5" name="MAX_INDICES" type="uint"/>
+		<reg64 offset="6" name="INDIRECT" type="address"/>
+		<reg32 offset="8" name="STRIDE" type="uint"/>
+	</stripe>
+	<stripe varset="a6xx_draw_indirect_opcode" variants="INDIRECT_OP_INDIRECT_COUNT" prefix="INDIRECT">
+		<reg64 offset="3" name="INDIRECT" type="address"/>
+		<reg64 offset="5" name="INDIRECT_COUNT" type="address"/>
+		<reg32 offset="7" name="STRIDE" type="uint"/>
+	</stripe>
+	<stripe varset="a6xx_draw_indirect_opcode" variants="INDIRECT_OP_INDIRECT_COUNT_INDEXED" prefix="INDIRECT_INDEXED">
+		<reg64 offset="3" name="INDEX" type="address"/>
+		<reg32 offset="5" name="MAX_INDICES" type="uint"/>
+		<reg64 offset="6" name="INDIRECT" type="address"/>
+		<reg64 offset="8" name="INDIRECT_COUNT" type="address"/>
+		<reg32 offset="10" name="STRIDE" type="uint"/>
+	</stripe>
+</domain>
+
+<domain name="CP_DRAW_AUTO" width="32">
+	<reg32 offset="0" name="0" type="vgt_draw_initiator_a4xx"/>
+	<reg32 offset="1" name="1">
+		<bitfield name="NUM_INSTANCES" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg64 offset="2" name="NUM_VERTICES_BASE" type="address"/>
+	<reg32 offset="4" name="4">
+		<bitfield name="NUM_VERTICES_OFFSET" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="5" name="5">
+		<bitfield name="STRIDE" low="0" high="31" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_DRAW_PRED_ENABLE_GLOBAL" width="32" varset="chip">
+	<reg32 offset="0" name="0">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+	</reg32>
+</domain>
+
+<domain name="CP_DRAW_PRED_ENABLE_LOCAL" width="32" varset="chip">
+	<reg32 offset="0" name="0">
+		<bitfield name="ENABLE" pos="0" type="boolean"/>
+	</reg32>
+</domain>
+
+<domain name="CP_DRAW_PRED_SET" width="32" varset="chip">
+	<enum name="cp_draw_pred_src">
+		<!--
+			Sources 1-4 seem to be about combining reading
+			SO/primitive queries and setting the predicate, which is
+			a DX11-specific optimization (since in DX11 you can only
+			predicate on the result of queries).
+		-->
+		<value name="PRED_SRC_MEM" value="5">
+			<doc>
+				Read a 64-bit value at the given address and
+				test if it equals/doesn't equal 0.
+			</doc>
+		</value>
+	</enum>
+	<enum name="cp_draw_pred_test">
+		<value name="NE_0_PASS" value="0"/>
+		<value name="EQ_0_PASS" value="1"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="SRC" low="4" high="7" type="cp_draw_pred_src"/>
+		<bitfield name="TEST" pos="8" type="cp_draw_pred_test"/>
+	</reg32>
+	<reg64 offset="1" name="MEM_ADDR" type="address"/>
+</domain>
+
+<domain name="CP_SET_DRAW_STATE" width="32" varset="chip" variants="A4XX-">
+	<array offset="0" stride="3" length="100">
+		<reg32 offset="0" name="0">
+			<bitfield name="COUNT" low="0" high="15" type="uint"/>
+			<bitfield name="DIRTY" pos="16" type="boolean"/>
+			<bitfield name="DISABLE" pos="17" type="boolean"/>
+			<bitfield name="DISABLE_ALL_GROUPS" pos="18" type="boolean"/>
+			<bitfield name="LOAD_IMMED" pos="19" type="boolean"/>
+			<bitfield name="BINNING" pos="20" varset="chip" variants="A6XX-" type="boolean"/>
+			<bitfield name="GMEM" pos="21" varset="chip" variants="A6XX-" type="boolean"/>
+			<bitfield name="SYSMEM" pos="22" varset="chip" variants="A6XX-" type="boolean"/>
+			<bitfield name="GROUP_ID" low="24" high="28" type="uint"/>
+		</reg32>
+		<reg32 offset="1" name="1">
+			<bitfield name="ADDR_LO" low="0" high="31" type="hex"/>
+		</reg32>
+		<reg32 offset="2" name="2" varset="chip" variants="A5XX-">
+			<bitfield name="ADDR_HI" low="0" high="31" type="hex"/>
+		</reg32>
+	</array>
+</domain>
+
+<domain name="CP_SET_BIN" width="32">
+	<doc>value at offset 0 always seems to be 0x00000000..</doc>
+	<reg32 offset="0" name="0"/>
+	<reg32 offset="1" name="1">
+		<bitfield name="X1" low="0" high="15" type="uint"/>
+		<bitfield name="Y1" low="16" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="X2" low="0" high="15" type="uint"/>
+		<bitfield name="Y2" low="16" high="31" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_SET_BIN_DATA" width="32">
+	<reg32 offset="0" name="0">
+		<!-- corresponds to VSC_PIPE[n].DATA_ADDR -->
+		<bitfield name="BIN_DATA_ADDR" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<!-- seesm to correspond to VSC_SIZE_ADDRESS -->
+		<bitfield name="BIN_SIZE_ADDRESS" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain name="CP_SET_BIN_DATA5" width="32">
+	<reg32 offset="0" name="0">
+		<!-- equiv to PC_VSTREAM_CONTROL.SIZE on a3xx/a4xx: -->
+		<bitfield name="VSC_SIZE" low="16" high="21" type="uint"/>
+		<!-- equiv to PC_VSTREAM_CONTROL.N on a3xx/a4xx: -->
+		<bitfield name="VSC_N" low="22" high="26" type="uint"/>
+	</reg32>
+	<!-- BIN_DATA_ADDR -> VSC_PIPE[p].DATA_ADDRESS -->
+	<reg32 offset="1" name="1">
+		<bitfield name="BIN_DATA_ADDR_LO" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="BIN_DATA_ADDR_HI" low="0" high="31" type="hex"/>
+	</reg32>
+	<!-- BIN_SIZE_ADDRESS -> VSC_SIZE_ADDRESS + (p * 4)-->
+	<reg32 offset="3" name="3">
+		<bitfield name="BIN_SIZE_ADDRESS_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<bitfield name="BIN_SIZE_ADDRESS_HI" low="0" high="31"/>
+	</reg32>
+	<!-- new on a6xx, where BIN_DATA_ADDR is the DRAW_STRM: -->
+	<reg32 offset="5" name="5">
+		<bitfield name="BIN_PRIM_STRM_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="6" name="6">
+		<bitfield name="BIN_PRIM_STRM_HI" low="0" high="31"/>
+	</reg32>
+	<!--
+		a7xx adds a few more addresses to the end of the pkt
+	 -->
+	<reg64 offset="7" name="7"/>
+	<reg64 offset="9" name="9"/>
+</domain>
+
+<domain name="CP_SET_BIN_DATA5_OFFSET" width="32">
+	<doc>
+                Like CP_SET_BIN_DATA5, but set the pointers as offsets from the
+                pointers stored in VSC_PIPE_{DATA,DATA2,SIZE}_ADDRESS. Useful
+                for Vulkan where these values aren't known when the command
+                stream is recorded.
+	</doc>
+	<reg32 offset="0" name="0">
+		<!-- equiv to PC_VSTREAM_CONTROL.SIZE on a3xx/a4xx: -->
+		<bitfield name="VSC_SIZE" low="16" high="21" type="uint"/>
+		<!-- equiv to PC_VSTREAM_CONTROL.N on a3xx/a4xx: -->
+		<bitfield name="VSC_N" low="22" high="26" type="uint"/>
+	</reg32>
+	<!-- BIN_DATA_ADDR -> VSC_PIPE[p].DATA_ADDRESS -->
+	<reg32 offset="1" name="1">
+		<bitfield name="BIN_DATA_OFFSET" low="0" high="31" type="uint"/>
+	</reg32>
+	<!-- BIN_SIZE_ADDRESS -> VSC_SIZE_ADDRESS + (p * 4)-->
+	<reg32 offset="2" name="2">
+		<bitfield name="BIN_SIZE_OFFSET" low="0" high="31" type="uint"/>
+	</reg32>
+	<!-- BIN_DATA2_ADDR -> VSC_PIPE[p].DATA2_ADDRESS -->
+	<reg32 offset="3" name="3">
+		<bitfield name="BIN_DATA2_OFFSET" low="0" high="31" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_REG_RMW" width="32">
+	<doc>
+                Modifies DST_REG using two sources that can either be registers
+                or immediates. If SRC1_ADD is set, then do the following:
+
+			$dst = (($dst &amp; $src0) rot $rotate) + $src1
+
+		Otherwise:
+
+			$dst = (($dst &amp; $src0) rot $rotate) | $src1
+
+		Here "rot" means rotate left.
+	</doc>
+	<reg32 offset="0" name="0">
+		<bitfield name="DST_REG" low="0" high="17" type="hex"/>
+		<bitfield name="ROTATE" low="24" high="28" type="uint"/>
+		<bitfield name="SRC1_ADD" pos="29" type="boolean"/>
+		<bitfield name="SRC1_IS_REG" pos="30" type="boolean"/>
+		<bitfield name="SRC0_IS_REG" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="SRC0" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="SRC1" low="0" high="31" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_REG_TO_MEM" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="REG" low="0" high="17" type="hex"/>
+		<!-- number of registers/dwords copied is max(CNT, 1). -->
+		<bitfield name="CNT" low="18" high="29" type="uint"/>
+		<bitfield name="64B" pos="30" type="boolean"/>
+		<bitfield name="ACCUMULATE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="DEST" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="2" name="2" varset="chip" variants="A5XX-">
+		<bitfield name="DEST_HI" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain name="CP_REG_TO_MEM_OFFSET_REG" width="32">
+	<doc>
+                Like CP_REG_TO_MEM, but the memory address to write to can be
+                offsetted using either one or two registers or scratch
+                registers.
+	</doc>
+	<reg32 offset="0" name="0">
+		<bitfield name="REG" low="0" high="17" type="hex"/>
+		<!-- number of registers/dwords copied is max(CNT, 1). -->
+		<bitfield name="CNT" low="18" high="29" type="uint"/>
+		<bitfield name="64B" pos="30" type="boolean"/>
+		<bitfield name="ACCUMULATE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="DEST" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="2" name="2" varset="chip" variants="A5XX-">
+		<bitfield name="DEST_HI" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="OFFSET0" low="0" high="17" type="hex"/>
+		<bitfield name="OFFSET0_SCRATCH" pos="19" type="boolean"/>
+	</reg32>
+	<!-- followed by an optional identical OFFSET1 dword -->
+</domain>
+
+<domain name="CP_REG_TO_MEM_OFFSET_MEM" width="32">
+	<doc>
+                Like CP_REG_TO_MEM, but the memory address to write to can be
+                offsetted using a DWORD in memory.
+	</doc>
+	<reg32 offset="0" name="0">
+		<bitfield name="REG" low="0" high="17" type="hex"/>
+		<!-- number of registers/dwords copied is max(CNT, 1). -->
+		<bitfield name="CNT" low="18" high="29" type="uint"/>
+		<bitfield name="64B" pos="30" type="boolean"/>
+		<bitfield name="ACCUMULATE" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="DEST" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="2" name="2" varset="chip" variants="A5XX-">
+		<bitfield name="DEST_HI" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="OFFSET_LO" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<bitfield name="OFFSET_HI" low="0" high="31" type="hex"/>
+	</reg32>
+</domain>
+
+<domain name="CP_MEM_TO_REG" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="REG" low="0" high="17" type="hex"/>
+		<!-- number of registers/dwords copied is max(CNT, 1). -->
+		<bitfield name="CNT" low="19" high="29" type="uint"/>
+		<!-- shift each DWORD left by 2 while copying -->
+		<bitfield name="SHIFT_BY_2" pos="30" type="boolean"/>
+		<!-- does the same thing as CP_MEM_TO_MEM::UNK31 -->
+		<bitfield name="UNK31" pos="31" type="boolean"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="SRC" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="2" name="2" varset="chip" variants="A5XX-">
+		<bitfield name="SRC_HI" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain name="CP_MEM_TO_MEM" width="32">
+	<reg32 offset="0" name="0">
+		<!--
+		not sure how many src operands we have, but the low
+		bits negate the n'th src argument.
+		 -->
+		<bitfield name="NEG_A" pos="0" type="boolean"/>
+		<bitfield name="NEG_B" pos="1" type="boolean"/>
+		<bitfield name="NEG_C" pos="2" type="boolean"/>
+
+		<!-- if set treat src/dst as 64bit values -->
+		<bitfield name="DOUBLE" pos="29" type="boolean"/>
+		<!-- execute CP_WAIT_FOR_MEM_WRITES beforehand -->
+		<bitfield name="WAIT_FOR_MEM_WRITES" pos="30" type="boolean"/>
+		<!-- some other kind of wait -->
+		<bitfield name="UNK31" pos="31" type="boolean"/>
+	</reg32>
+	<!--
+	followed by sequence of addresses.. the first is the
+	destination and the rest are N src addresses which are
+	summed (after being negated if NEG_x bit set) allowing
+	to do things like 'result += end - start' (which turns
+	out to be useful for queries and accumulating results
+	across multiple tiles)
+	 -->
+</domain>
+
+<domain name="CP_MEMCPY" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="DWORDS" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="SRC_LO" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="SRC_HI" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="DST_LO" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<bitfield name="DST_HI" low="0" high="31" type="hex"/>
+	</reg32>
+</domain>
+
+<domain name="CP_REG_TO_SCRATCH" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="REG" low="0" high="17" type="hex"/>
+		<bitfield name="SCRATCH" low="20" high="22" type="uint"/>
+		<!-- number of registers/dwords copied is CNT + 1. -->
+		<bitfield name="CNT" low="24" high="26" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_SCRATCH_TO_REG" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="REG" low="0" high="17" type="hex"/>
+		<!-- note: CP_MEM_TO_REG always sets this when writing to the register -->
+		<bitfield name="UNK18" pos="18" type="boolean"/>
+		<bitfield name="SCRATCH" low="20" high="22" type="uint"/>
+		<!-- number of registers/dwords copied is CNT + 1. -->
+		<bitfield name="CNT" low="24" high="26" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_SCRATCH_WRITE" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="SCRATCH" low="20" high="22" type="uint"/>
+	</reg32>
+	<!-- followed by one or more DWORDs to write to scratch registers -->
+</domain>
+
+<domain name="CP_MEM_WRITE" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="ADDR_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="ADDR_HI" low="0" high="31"/>
+	</reg32>
+	<!-- followed by the DWORDs to write -->
+</domain>
+
+<enum name="cp_cond_function">
+	<value value="0" name="WRITE_ALWAYS"/>
+	<value value="1" name="WRITE_LT"/>
+	<value value="2" name="WRITE_LE"/>
+	<value value="3" name="WRITE_EQ"/>
+	<value value="4" name="WRITE_NE"/>
+	<value value="5" name="WRITE_GE"/>
+	<value value="6" name="WRITE_GT"/>
+</enum>
+
+<domain name="CP_COND_WRITE" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="FUNCTION" low="0" high="2" type="cp_cond_function"/>
+		<bitfield name="POLL_MEMORY" pos="4" type="boolean"/>
+		<bitfield name="WRITE_MEMORY" pos="8" type="boolean"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="POLL_ADDR" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="REF" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="MASK" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<bitfield name="WRITE_ADDR" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="5" name="5">
+		<bitfield name="WRITE_DATA" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<enum name="poll_memory_type">
+	<value value="0" name="POLL_REGISTER"/>
+	<value value="1" name="POLL_MEMORY"/>
+	<value value="2" name="POLL_SCRATCH"/>
+	<value value="3" name="POLL_ON_CHIP" varset="chip" variants="A7XX-"/>
+</enum>
+
+<domain name="CP_COND_WRITE5" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="FUNCTION" low="0" high="2" type="cp_cond_function"/>
+		<bitfield name="SIGNED_COMPARE" pos="3" type="boolean"/>
+		<!-- POLL_REGISTER polls a register at POLL_ADDR_LO. -->
+		<bitfield name="POLL" low="4" high="5" type="poll_memory_type"/>
+		<bitfield name="WRITE_MEMORY" pos="8" type="boolean"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="POLL_ADDR_LO" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="POLL_ADDR_HI" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="REF" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<bitfield name="MASK" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="5" name="5">
+		<bitfield name="WRITE_ADDR_LO" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="6" name="6">
+		<bitfield name="WRITE_ADDR_HI" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="7" name="7">
+		<bitfield name="WRITE_DATA" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain name="CP_WAIT_MEM_GTE" width="32">
+        <doc>
+                Wait until a memory value is greater than or equal to the
+                reference, using signed comparison.
+	</doc>
+	<reg32 offset="0" name="0">
+		<!-- Reserved for flags, presumably? Unused in FW -->
+		<bitfield name="RESERVED" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="POLL_ADDR_LO" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="POLL_ADDR_HI" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="REF" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain name="CP_WAIT_REG_MEM" width="32">
+        <doc>
+                This uses the same internal comparison as CP_COND_WRITE,
+                but waits until the comparison is true instead. It busy-loops in
+                the CP for the given number of cycles before trying again.
+	</doc>
+	<reg32 offset="0" name="0">
+		<bitfield name="FUNCTION" low="0" high="2" type="cp_cond_function"/>
+		<bitfield name="SIGNED_COMPARE" pos="3" type="boolean"/>
+		<bitfield name="POLL" low="4" high="5" type="poll_memory_type"/>
+		<bitfield name="WRITE_MEMORY" pos="8" type="boolean"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="POLL_ADDR_LO" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="POLL_ADDR_HI" low="0" high="31" type="hex"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="REF" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<bitfield name="MASK" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="5" name="5">
+		<bitfield name="DELAY_LOOP_CYCLES" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain name="CP_WAIT_TWO_REGS" width="32">
+	<doc>
+		Waits for REG0 to not be 0 or REG1 to not equal REF
+	</doc>
+	<reg32 offset="0" name="0">
+		<bitfield name="REG0" low="0" high="17" type="hex"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="REG1" low="0" high="17" type="hex"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="REF" low="0" high="31" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_DISPATCH_COMPUTE" width="32">
+	<reg32 offset="0" name="0"/>
+	<reg32 offset="1" name="1">
+		<bitfield name="X" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="Y" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="Z" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain name="CP_SET_RENDER_MODE" width="32">
+	<enum name="render_mode_cmd">
+		<value value="1" name="BYPASS"/>
+		<value value="2" name="BINNING"/>
+		<value value="3" name="GMEM"/>
+		<value value="5" name="BLIT2D"/>
+		<!-- placeholder name.. used when CP_BLIT packets with BLIT_OP_SCALE?? -->
+		<value value="7" name="BLIT2DSCALE"/>
+		<!-- 8 set before going back to BYPASS exiting 2D -->
+		<value value="8" name="END2D"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="MODE" low="0" high="8" type="render_mode_cmd"/>
+		<!--
+		normally 0x1/0x3, sometimes see 0x5/0x8 with unknown registers in
+		0x21xx range.. possibly (at least some) a5xx variants have a
+		2d core?
+		 -->
+	</reg32>
+	<!-- I think first buffer is for GPU to save context in case of ctx switch? -->
+	<reg32 offset="1" name="1">
+		<bitfield name="ADDR_0_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="ADDR_0_HI" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<!--
+		set when in GMEM.. maybe indicates GMEM contents need to be
+		preserved on ctx switch?
+		 -->
+		<bitfield name="VSC_ENABLE" pos="3" type="boolean"/>
+		<bitfield name="GMEM_ENABLE" pos="4" type="boolean"/>
+	</reg32>
+	<reg32 offset="4" name="4"/>
+	<!-- second buffer looks like some cmdstream.. length in dwords: -->
+	<reg32 offset="5" name="5">
+		<bitfield name="ADDR_1_LEN" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="6" name="6">
+		<bitfield name="ADDR_1_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="7" name="7">
+		<bitfield name="ADDR_1_HI" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<!-- this looks fairly similar to CP_SET_RENDER_MODE minus first dword -->
+<domain name="CP_COMPUTE_CHECKPOINT" width="32">
+	<!-- I think first buffer is for GPU to save context in case of ctx switch? -->
+	<reg32 offset="0" name="0">
+		<bitfield name="ADDR_0_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="ADDR_0_HI" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+	</reg32>
+	<reg32 offset="3" name="3"/>
+	<!-- second buffer looks like some cmdstream.. length in dwords: -->
+	<reg32 offset="4" name="4">
+		<bitfield name="ADDR_1_LEN" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="5" name="5">
+		<bitfield name="ADDR_1_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="6" name="6">
+		<bitfield name="ADDR_1_HI" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="7" name="7"/>
+</domain>
+
+<domain name="CP_PERFCOUNTER_ACTION" width="32">
+	<reg32 offset="0" name="0">
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="ADDR_0_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="ADDR_0_HI" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain varset="chip" name="CP_EVENT_WRITE" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="EVENT" low="0" high="7" type="vgt_event_type"/>
+		<!-- when set, write back timestamp instead of value from packet: -->
+		<bitfield name="TIMESTAMP" pos="30" type="boolean"/>
+		<bitfield name="IRQ" pos="31" type="boolean"/>
+	</reg32>
+	<!--
+	TODO what is gpuaddr for, seems to be all 0's.. maybe needed for
+	context switch?
+	 -->
+	<reg32 offset="1" name="1">
+		<bitfield name="ADDR_0_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="ADDR_0_HI" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<!-- ??? -->
+	</reg32>
+</domain>
+
+<domain varset="chip" name="CP_EVENT_WRITE7" width="32">
+	<enum name="event_write_src">
+		<!-- Write payload[0] -->
+		<value value="0" name="EV_WRITE_USER_32B"/>
+		<!-- Write payload[0] payload[1] -->
+		<value value="1" name="EV_WRITE_USER_64B"/>
+		<!-- Write (TIMESTAMP_GLOBAL + TIMESTAMP_LOCAL) -->
+		<value value="2" name="EV_WRITE_TIMESTAMP_SUM"/>
+		<value value="3" name="EV_WRITE_ALWAYSON"/>
+		<!-- Write payload[1] regs starting at payload[0] offset -->
+		<value value="4" name="EV_WRITE_REGS_CONTENT"/>
+	</enum>
+
+	<enum name="event_write_dst">
+		<value value="0" name="EV_DST_RAM"/>
+		<value value="1" name="EV_DST_ONCHIP"/>
+	</enum>
+
+	<reg32 offset="0" name="0">
+		<bitfield name="EVENT" low="0" high="7" type="vgt_event_type"/>
+		<bitfield name="WRITE_SAMPLE_COUNT" pos="12" type="boolean"/>
+		<!-- Write sample count at (iova + 16) -->
+		<bitfield name="SAMPLE_COUNT_END_OFFSET" pos="13" type="boolean"/>
+		<!-- *(iova + 8) = *(iova + 16) - *iova -->
+		<bitfield name="WRITE_SAMPLE_COUNT_DIFF" pos="14" type="boolean"/>
+
+		<!-- Next 4 flags are valid to set only when concurrent binning is enabled -->
+		<!-- Increment 16b BV counter. Valid only in BV pipe -->
+		<bitfield name="INC_BV_COUNT" pos="16" type="boolean"/>
+		<!-- Increment 16b BR counter. Valid only in BR pipe -->
+		<bitfield name="INC_BR_COUNT" pos="17" type="boolean"/>
+		<bitfield name="CLEAR_RENDER_RESOURCE" pos="18" type="boolean"/>
+		<bitfield name="CLEAR_LRZ_RESOURCE" pos="19" type="boolean"/>
+
+		<bitfield name="WRITE_SRC" low="20" high="22" type="event_write_src"/>
+		<bitfield name="WRITE_DST" pos="24" type="event_write_dst" addvariant="yes"/>
+		<!-- Writes into WRITE_DST from WRITE_SRC. RB_DONE_TS requires WRITE_ENABLED. -->
+		<bitfield name="WRITE_ENABLED" pos="27" type="boolean"/>
+	</reg32>
+
+	<stripe varset="event_write_dst" variants="EV_DST_RAM">
+		<reg32 offset="1" name="1">
+			<bitfield name="ADDR_0_LO" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="2" name="2">
+			<bitfield name="ADDR_0_HI" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="3" name="3">
+			<bitfield name="PAYLOAD_0" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="4" name="4">
+			<bitfield name="PAYLOAD_1" low="0" high="31"/>
+		</reg32>
+	</stripe>
+
+	<stripe varset="event_write_dst" variants="EV_DST_ONCHIP">
+		<reg32 offset="1" name="1">
+			<bitfield name="ONCHIP_ADDR_0" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="3" name="3">
+			<bitfield name="PAYLOAD_0" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="4" name="4">
+			<bitfield name="PAYLOAD_1" low="0" high="31"/>
+		</reg32>
+	</stripe>
+</domain>
+
+<domain name="CP_BLIT" width="32">
+	<enum name="cp_blit_cmd">
+		<value value="0" name="BLIT_OP_FILL"/>
+		<value value="1" name="BLIT_OP_COPY"/>
+		<value value="3" name="BLIT_OP_SCALE"/> <!-- used for mipmap generation -->
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="OP" low="0" high="3" type="cp_blit_cmd"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="SRC_X1" low="0" high="13" type="uint"/>
+		<bitfield name="SRC_Y1" low="16" high="29" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="SRC_X2" low="0" high="13" type="uint"/>
+		<bitfield name="SRC_Y2" low="16" high="29" type="uint"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="DST_X1" low="0" high="13" type="uint"/>
+		<bitfield name="DST_Y1" low="16" high="29" type="uint"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<bitfield name="DST_X2" low="0" high="13" type="uint"/>
+		<bitfield name="DST_Y2" low="16" high="29" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_EXEC_CS" width="32">
+	<reg32 offset="0" name="0">
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="NGROUPS_X" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="NGROUPS_Y" low="0" high="31" type="uint"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="NGROUPS_Z" low="0" high="31" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_EXEC_CS_INDIRECT" width="32" varset="chip" prefix="chip" variants="A4XX-">
+	<reg32 offset="0" name="0">
+	</reg32>
+	<stripe varset="chip" variants="A4XX">
+		<reg32 offset="1" name="1">
+			<bitfield name="ADDR" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="2" name="2">
+			<!-- localsize is value minus one: -->
+			<bitfield name="LOCALSIZEX" low="2" high="11" type="uint"/>
+			<bitfield name="LOCALSIZEY" low="12" high="21" type="uint"/>
+			<bitfield name="LOCALSIZEZ" low="22" high="31" type="uint"/>
+		</reg32>
+	</stripe>
+	<stripe varset="chip" variants="A5XX-">
+		<reg32 offset="1" name="1">
+			<bitfield name="ADDR_LO" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="2" name="2">
+			<bitfield name="ADDR_HI" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="3" name="3">
+			<!-- localsize is value minus one: -->
+			<bitfield name="LOCALSIZEX" low="2" high="11" type="uint"/>
+			<bitfield name="LOCALSIZEY" low="12" high="21" type="uint"/>
+			<bitfield name="LOCALSIZEZ" low="22" high="31" type="uint"/>
+		</reg32>
+	</stripe>
+</domain>
+
+<domain name="CP_SET_MARKER" width="32" varset="chip" prefix="chip" variants="A6XX-">
+	<doc>Tell CP the current operation mode, indicates save and restore procedure</doc>
+	<enum name="a6xx_marker">
+		<value value="1" name="RM6_BYPASS"/>
+		<value value="2" name="RM6_BINNING"/>
+		<value value="4" name="RM6_GMEM"/>
+		<value value="5" name="RM6_ENDVIS"/>
+		<value value="6" name="RM6_RESOLVE"/>
+		<value value="7" name="RM6_YIELD"/>
+		<value value="8" name="RM6_COMPUTE"/>
+		<value value="0xc" name="RM6_BLIT2DSCALE"/>  <!-- no-op (at least on current sqe fw) -->
+
+		<!--
+			These values come from a6xx_set_marker() in the
+			downstream kernel, and they can only be set by the kernel
+		-->
+		<value value="0xd" name="RM6_IB1LIST_START"/>
+		<value value="0xe" name="RM6_IB1LIST_END"/>
+		<!-- IFPC - inter-frame power collapse -->
+		<value value="0x100" name="RM6_IFPC_ENABLE"/>
+		<value value="0x101" name="RM6_IFPC_DISABLE"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<!--
+			NOTE: blob driver and some versions of freedreno/turnip set
+			b4, which is unused (at least by current sqe fw), but interferes
+			with parsing if we extend the size of the bitfield to include
+			b8 (only sent by kernel mode driver).  Really, the way the
+			parsing works in the firmware, only b0-b3 are considered, but
+			if b8 is set, the low bits are interpreted differently.  To
+			model this, without getting confused by spurious b4, this is
+			described as two overlapping bitfields:
+		 -->
+		<bitfield name="MODE" low="0" high="8" type="a6xx_marker"/>
+		<bitfield name="MARKER" low="0" high="3" type="a6xx_marker"/>
+	</reg32>
+</domain>
+
+<domain name="CP_SET_PSEUDO_REG" width="32" varset="chip" prefix="chip" variants="A6XX-">
+	<doc>Set internal CP registers, used to indicate context save data addresses</doc>
+	<enum name="pseudo_reg">
+		<value value="0" name="SMMU_INFO"/>
+		<value value="1" name="NON_SECURE_SAVE_ADDR"/>
+		<value value="2" name="SECURE_SAVE_ADDR"/>
+		<value value="3" name="NON_PRIV_SAVE_ADDR"/>
+		<value value="4" name="COUNTER"/>
+
+		<!--
+			On a6xx the registers are set directly and CP_SET_BIN_DATA5_OFFSET reads them,
+			but that doesn't work with concurrent binning because BR will be reading from
+			a different set of streams than BV is writing, so on a7xx we have these
+			pseudo-regs instead, which do the right thing.
+
+			The corresponding VSC registers exist, and they're written by BV when it
+			encounters CP_SET_PSEUDO_REG. When BR later encounters the same CP_SET_PSEUDO_REG
+			it will only write some private scratch registers which are read by
+			CP_SET_BIN_DATA5_OFFSET.
+
+			If concurrent binning is disabled then BR also does binning so it will also
+			write the "real" registers in BR.
+		-->
+		<value value="8" name="DRAW_STRM_ADDRESS"/>
+		<value value="9" name="DRAW_STRM_SIZE_ADDRESS"/>
+		<value value="10" name="PRIM_STRM_ADDRESS"/>
+		<value value="11" name="UNK_STRM_ADDRESS"/>
+		<value value="12" name="UNK_STRM_SIZE_ADDRESS"/>
+
+		<value value="16" name="BINDLESS_BASE_0_ADDR"/>
+		<value value="17" name="BINDLESS_BASE_1_ADDR"/>
+		<value value="18" name="BINDLESS_BASE_2_ADDR"/>
+		<value value="19" name="BINDLESS_BASE_3_ADDR"/>
+		<value value="20" name="BINDLESS_BASE_4_ADDR"/>
+		<value value="21" name="BINDLESS_BASE_5_ADDR"/>
+		<value value="22" name="BINDLESS_BASE_6_ADDR"/>
+	</enum>
+	<array offset="0" stride="3" length="100">
+		<reg32 offset="0" name="0">
+			<bitfield name="PSEUDO_REG" low="0" high="10" type="pseudo_reg"/>
+		</reg32>
+		<reg32 offset="1" name="1">
+			<bitfield name="LO" low="0" high="31"/>
+		</reg32>
+		<reg32 offset="2" name="2">
+			<bitfield name="HI" low="0" high="31"/>
+		</reg32>
+	</array>
+</domain>
+
+<domain name="CP_REG_TEST" width="32" varset="chip" prefix="chip" variants="A6XX-">
+	<doc>
+		Tests bit in specified register and sets predicate for CP_COND_REG_EXEC.
+		So:
+
+			opcode: CP_REG_TEST (39) (2 dwords)
+			        { REG = 0xc10 | BIT = 0 }
+			               0000: 70b90001 00000c10
+			opcode: CP_COND_REG_EXEC (47) (3 dwords)
+			               0000: 70c70002 10000000 00000004
+			opcode: CP_INDIRECT_BUFFER (3f) (4 dwords)
+
+		Will execute the CP_INDIRECT_BUFFER only if b0 in the register at
+		offset 0x0c10 is 1
+	</doc>
+	<enum name="source_type">
+		<value value="0" name="SOURCE_REG"/>
+		<!-- Don't confuse with scratch registers, this is a separate memory
+			 written into by CP_MEM_TO_SCRATCH_MEM. -->
+		<value value="1" name="SOURCE_SCRATCH_MEM" varset="chip" variants="A7XX-"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<!-- the register to test -->
+		<bitfield name="REG" low="0" high="17" varset="source_type" variants="SOURCE_REG"/>
+		<bitfield name="SCRATCH_MEM_OFFSET" low="0" high="17" varset="source_type" variants="SOURCE_SCRATCH_MEM"/>
+		<bitfield name="SOURCE" pos="18" type="source_type" addvariant="yes"/>
+		<!-- the bit to test -->
+		<bitfield name="BIT" low="20" high="24" type="uint"/>
+		<!-- skip implied CP_WAIT_FOR_ME -->
+		<bitfield name="SKIP_WAIT_FOR_ME" pos="25" type="boolean"/>
+		<!-- the predicate bit to set (new in gen3+) -->
+		<bitfield name="PRED_BIT" low="26" high="30" type="uint"/>
+		<!-- update the predicate reg directly (new in gen3+) -->
+		<bitfield name="PRED_UPDATE" pos="31" type="boolean"/>
+	</reg32>
+
+        <!--
+		In PRED_UPDATE mode, the predicate reg is updated directly using two
+		more dwords, ignoring other bits:
+
+			PRED_REG = (PRED_REG & ~PRED_MASK) | (PRED_VAL & PRED_MASK);
+	-->
+	<reg32 offset="1" name="PRED_MASK" type="hex"/>
+	<reg32 offset="2" name="PRED_VAL" type="hex"/>
+</domain>
+
+<!-- I *think* this existed at least as far back as a4xx -->
+<domain name="CP_COND_REG_EXEC" width="32">
+	<enum name="compare_mode">
+		<!-- use the predicate bit set by CP_REG_TEST -->
+		<value value="1" name="PRED_TEST"/>
+		<!-- compare two registers directly for equality -->
+		<value value="2" name="REG_COMPARE"/>
+		<!-- test if certain render modes are set via CP_SET_MARKER -->
+		<value value="3" name="RENDER_MODE" varset="chip" variants="A6XX-"/>
+		<!-- compare REG0 for equality with immediate -->
+		<value value="4" name="REG_COMPARE_IMM" varset="chip" variants="A7XX-"/>
+		<!-- test which of BR/BV are enabled -->
+		<value value="5" name="THREAD_MODE" varset="chip" variants="A7XX-"/>
+	</enum>
+	<reg32 offset="0" name="0" varset="compare_mode">
+		<bitfield name="REG0" low="0" high="17" variants="REG_COMPARE" type="hex"/>
+
+		<!-- the predicate bit to test (new in gen3+) -->
+		<bitfield name="PRED_BIT" low="18" high="22" variants="PRED_TEST" type="uint"/>
+		<bitfield name="SKIP_WAIT_FOR_ME" pos="23" varset="chip" variants="A7XX-" type="boolean"/>
+		<!-- With REG_COMPARE instead of register read from ONCHIP memory -->
+		<bitfield name="ONCHIP_MEM" pos="24" varset="chip" variants="A7XX-" type="boolean"/>
+
+		<!--
+			Note: these bits have the same meaning, and use the same
+			internal mechanism as the bits in CP_SET_DRAW_STATE.
+			When RENDER_MODE is selected, they're used as
+			a bitmask of which modes pass the test.
+		-->
+
+		<!-- RM6_BINNING -->
+		<bitfield name="BINNING" pos="25" variants="RENDER_MODE" type="boolean"/>
+		<!-- all others -->
+		<bitfield name="GMEM" pos="26" variants="RENDER_MODE" type="boolean"/>
+		<!-- RM6_BYPASS -->
+		<bitfield name="SYSMEM" pos="27" variants="RENDER_MODE" type="boolean"/>
+
+		<bitfield name="BV" pos="25" variants="THREAD_MODE" type="boolean"/>
+		<bitfield name="BR" pos="26" variants="THREAD_MODE" type="boolean"/>
+		<bitfield name="LPAC" pos="27" variants="THREAD_MODE" type="boolean"/>
+
+		<bitfield name="MODE" low="28" high="31" type="compare_mode" addvariant="yes"/>
+	</reg32>
+
+	<stripe varset="compare_mode" variants="PRED_TEST">
+		<reg32 offset="1" name="1">
+			<bitfield name="DWORDS" low="0" high="23" type="uint"/>
+		</reg32>
+	</stripe>
+
+	<stripe varset="compare_mode" variants="REG_COMPARE">
+		<reg32 offset="1" name="1">
+			<bitfield name="REG1" low="0" high="17" type="hex"/>
+			<!-- Instead of register read from ONCHIP memory -->
+			<bitfield name="ONCHIP_MEM" pos="24" varset="chip" variants="A7XX-" type="boolean"/>
+		</reg32>
+	</stripe>
+
+	<stripe varset="compare_mode" variants="RENDER_MODE">
+		<reg32 offset="1" name="1">
+			<bitfield name="DWORDS" low="0" high="23" type="uint"/>
+		</reg32>
+	</stripe>
+
+	<stripe varset="compare_mode" variants="REG_COMPARE_IMM">
+		<reg32 offset="1" name="1">
+			<bitfield name="IMM" low="0" high="31"/>
+		</reg32>
+	</stripe>
+
+	<stripe varset="compare_mode" variants="THREAD_MODE">
+		<reg32 offset="1" name="1">
+			<bitfield name="DWORDS" low="0" high="23" type="uint"/>
+		</reg32>
+	</stripe>
+
+	<reg32 offset="2" name="2">
+		<bitfield name="DWORDS" low="0" high="23" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_COND_EXEC" width="32">
+	<doc>
+                Executes the following DWORDs of commands if the dword at ADDR0
+                is not equal to 0 and the dword at ADDR1 is less than REF
+                (signed comparison).
+	</doc>
+	<reg32 offset="0" name="0">
+		<bitfield name="ADDR0_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="ADDR0_HI" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="ADDR1_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="ADDR1_HI" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="4" name="4">
+		<bitfield name="REF" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="5" name="5">
+		<bitfield name="DWORDS" low="0" high="31" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_SET_CTXSWITCH_IB" width="32">
+	<doc>
+                Used by the userspace driver to set various IB's which are
+                executed during context save/restore for handling
+                state that isn't restored by the
+                context switch routine itself.
+	</doc>
+	<enum name="ctxswitch_ib">
+		<value name="RESTORE_IB" value="0">
+			<doc>Executed unconditionally when switching back to the context.</doc>
+		</value>
+		<value name="YIELD_RESTORE_IB" value="1">
+                        <doc>
+				Executed when switching back after switching
+				away during execution of
+				a CP_SET_MARKER packet with RM6_YIELD as the
+				payload *and* the normal save routine was
+				bypassed for a shorter one. I think this is
+				connected to the "skipsaverestore" bit set by
+				the kernel when preempting.
+			</doc>
+		</value>
+		<value name="SAVE_IB" value="2">
+                        <doc>
+				Executed when switching away from the context,
+				except for context switches initiated via
+				CP_YIELD.
+                        </doc>
+		</value>
+		<value name="RB_SAVE_IB" value="3">
+			<doc>
+				This can only be set by the RB (i.e. the kernel)
+				and executes with protected mode off, but
+				is otherwise similar to SAVE_IB.
+
+				Note, kgsl calls this CP_KMD_AMBLE_TYPE
+			</doc>
+		</value>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="ADDR_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="ADDR_HI" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="DWORDS" low="0" high="19" type="uint"/>
+		<bitfield name="TYPE" low="20" high="21" type="ctxswitch_ib"/>
+	</reg32>
+</domain>
+
+<domain name="CP_REG_WRITE" width="32">
+	<enum name="reg_tracker">
+		<doc>
+			Keep shadow copies of these registers and only set them
+			when drawing, avoiding redundant writes:
+			- VPC_CNTL_0
+			- HLSQ_CONTROL_1_REG
+			- HLSQ_UNKNOWN_B980
+		</doc>
+		<value name="TRACK_CNTL_REG" value="0x1"/>
+		<doc>
+			Track RB_RENDER_CNTL, and insert a WFI in the following
+			situation:
+			- There is a write that disables binning
+			- There was a draw with binning left enabled, but in
+			  BYPASS mode
+			Presumably this is a hang workaround?
+		</doc>
+		<value name="TRACK_RENDER_CNTL" value="0x2"/>
+		<doc>
+			Do a mysterious CP_EVENT_WRITE 0x3f when the low bit of
+			the data to write is 0. Used by the Vulkan blob with
+			PC_MULTIVIEW_CNTL, but this isn't predicated on particular
+			register(s) like the others.
+		</doc>
+		<value name="UNK_EVENT_WRITE" value="0x4"/>
+		<doc>
+			Tracks GRAS_LRZ_CNTL::GREATER, GRAS_LRZ_CNTL::DIR, and
+			GRAS_LRZ_DEPTH_VIEW with previous values, and if one of
+			the following is true:
+			- GRAS_LRZ_CNTL::GREATER has changed
+			- GRAS_LRZ_CNTL::DIR has changed, the old value is not
+			  CUR_DIR_GE, and the new value is not CUR_DIR_DISABLED
+			- GRAS_LRZ_DEPTH_VIEW has changed
+			then it does a LRZ_FLUSH with GRAS_LRZ_CNTL::ENABLE
+			forced to 1.
+			Only exists in a650_sqe.fw.
+		</doc>
+		<value name="TRACK_LRZ" value="0x8"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="TRACKER" low="0" high="3" type="reg_tracker"/>
+	</reg32>
+	<reg32 offset="1" name="1"/>
+	<reg32 offset="2" name="2"/>
+</domain>
+
+<domain name="CP_SMMU_TABLE_UPDATE" width="32">
+	<doc>
+		Note that the SMMU's definition of TTBRn can take different forms
+		depending on the pgtable format.  But a5xx+ only uses aarch64
+		format.
+	</doc>
+	<reg32 offset="0" name="0">
+		<bitfield name="TTBR0_LO" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="TTBR0_HI" low="0" high="15"/>
+		<bitfield name="ASID" low="16" high="31"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<doc>Unused, does not apply to aarch64 pgtable format</doc>
+		<bitfield name="CONTEXTIDR" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="CONTEXTBANK" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain name="CP_START_BIN" width="32">
+	<reg32 offset="0" name="BIN_COUNT" type="uint"/>
+	<reg64 offset="1" name="PREFIX_ADDR" type="address"/>
+	<reg32 offset="3" name="PREFIX_DWORDS">
+		<doc>
+			Size of prefix for each bin. For each bin index i, the
+			prefix commands at PREFIX_ADDR + i * PREFIX_DWORDS are
+			executed in an IB2 before the IB1 commands following
+			this packet.
+		</doc>
+	</reg32>
+	<reg32 offset="4" name="BODY_DWORDS">
+		<doc>Number of dwords after this packet until CP_END_BIN</doc>
+	</reg32>
+</domain>
+
+<domain name="CP_WAIT_TIMESTAMP" width="32">
+	<enum name="ts_wait_value_src">
+		<!-- Wait for value at memory address to be >= SRC_0 (signed comparison) -->
+		<value value="0" name="TS_WAIT_GE_32B"/>
+		<!-- Wait for value at memory address to be >= SRC_0 (unsigned) -->
+		<value value="1" name="TS_WAIT_GE_64B"/>
+		<!-- Write (TIMESTAMP_GLOBAL + TIMESTAMP_LOCAL) -->
+		<value value="2" name="TS_WAIT_GE_TIMESTAMP_SUM"/>
+	</enum>
+
+	<enum name="ts_wait_type">
+		<value value="0" name="TS_WAIT_RAM"/>
+		<value value="1" name="TS_WAIT_ONCHIP"/>
+	</enum>
+
+	<reg32 offset="0" name="0">
+		<bitfield name="WAIT_VALUE_SRC" low="0" high="1" type="ts_wait_value_src"/>
+		<bitfield name="WAIT_DST" pos="4" type="ts_wait_type" addvariant="yes"/>
+	</reg32>
+
+	<stripe varset="ts_wait_type" variants="TS_WAIT_RAM">
+		<reg64 offset="1" name="ADDR" type="address"/>
+	</stripe>
+
+	<stripe varset="ts_wait_type" variants="TS_WAIT_ONCHIP">
+		<reg32 offset="1" name="ONCHIP_ADDR_0" low="0" high="31"/>
+	</stripe>
+
+	<reg32 offset="3" name="SRC_0"/>
+	<reg32 offset="4" name="SRC_1"/>
+</domain>
+
+<domain name="CP_BV_BR_COUNT_OPS" width="32">
+	<enum name="pipe_count_op">
+		<value name="PIPE_CLEAR_BV_BR" value="0x1"/>
+		<value name="PIPE_SET_BR_OFFSET" value="0x2"/>
+		<!-- Wait until for BV_counter > BR_counter -->
+		<value name="PIPE_BR_WAIT_FOR_BV" value="0x3"/>
+		<!-- Wait until (BR_counter + BR_OFFSET) > BV_counter -->
+		<value name="PIPE_BV_WAIT_FOR_BR" value="0x4"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="OP" low="0" high="3" type="pipe_count_op"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<bitfield name="BR_OFFSET" low="0" high="15" type="uint"/>
+	</reg32>
+</domain>
+
+<domain name="CP_MODIFY_TIMESTAMP" width="32">
+	<enum name="timestamp_op">
+		<value name="MODIFY_TIMESTAMP_CLEAR" value="0"/>
+		<value name="MODIFY_TIMESTAMP_ADD_GLOBAL" value="1"/>
+		<value name="MODIFY_TIMESTAMP_ADD_LOCAL" value="2"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield name="ADD" low="0" high="7" type="uint"/>
+		<bitfield name="OP" low="28" high="31" type="timestamp_op"/>
+	</reg32>
+</domain>
+
+<domain name="CP_MEM_TO_SCRATCH_MEM" width="32">
+	<doc>
+		Best guess is that it is a faster way to fetch all the VSC_STATE registers
+		and keep them in a local scratch memory instead of fetching every time
+		when skipping IBs.
+	</doc>
+	<reg32 offset="0" name="0">
+		<bitfield name="CNT" low="0" high="5" type="uint"/>
+	</reg32>
+	<reg32 offset="1" name="1">
+		<doc>Scratch memory size is 48 dwords`</doc>
+		<bitfield name="OFFSET" low="0" high="5" type="uint"/>
+	</reg32>
+	<reg32 offset="2" name="2">
+		<bitfield name="SRC" low="0" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="SRC_HI" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain name="CP_THREAD_CONTROL" width="32">
+	<enum name="cp_thread">
+		<value name="CP_SET_THREAD_BR" value="1"/>    <!-- Render -->
+		<value name="CP_SET_THREAD_BV" value="2"/>    <!-- Visibility -->
+		<value name="CP_SET_THREAD_BOTH" value="3"/>
+	</enum>
+	<reg32 offset="0" name="0">
+		<bitfield low="0" high="1" name="THREAD" type="cp_thread"/>
+		<bitfield pos="27" name="CONCURRENT_BIN_DISABLE" type="boolean"/>
+		<bitfield pos="31" name="SYNC_THREADS" type="boolean"/>
+	</reg32>
+</domain>
+
+<domain name="CP_FIXED_STRIDE_DRAW_TABLE" width="32">
+	<reg64 offset="0" name="IB_BASE"/>
+	<reg32 offset="2" name="2">
+		<!-- STRIDE * COUNT -->
+		<bitfield name="IB_SIZE" low="0" high="11"/>
+		<bitfield name="STRIDE" low="20" high="31"/>
+	</reg32>
+	<reg32 offset="3" name="3">
+		<bitfield name="COUNT" low="0" high="31"/>
+	</reg32>
+</domain>
+
+<domain name="CP_RESET_CONTEXT_STATE" width="32">
+	<reg32 offset="0" name="0">
+		<bitfield name="CLEAR_ON_CHIP_TS" pos="0" type="boolean"/>
+		<bitfield name="CLEAR_RESOURCE_TABLE" pos="1" type="boolean"/>
+		<bitfield name="CLEAR_GLOBAL_LOCAL_TS" pos="2" type="boolean"/>
+	</reg32>
+</domain>
+
+</database>
+

-- 
2.39.2


