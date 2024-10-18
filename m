Return-Path: <linux-arm-msm+bounces-34978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B099A4202
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 17:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1D57288BA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 15:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E9920010F;
	Fri, 18 Oct 2024 15:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3xQvM09"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C156E16BE3A;
	Fri, 18 Oct 2024 15:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729264310; cv=none; b=WiAWTXlmEr0rEqFb7aQ8jMhErc23yiX5Y+Myk+10vfai22Pb/t9UlYppwwfKn8AgREPl/pe9Uo7OaQtbNq1KX98M0SC66zPDDtG6jcpoNopDN/q0RIsH6wC3EjTET2ye5kpFck+TIl7/cDTF5RvkuRzjHTAy1VV/locwnAPGFaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729264310; c=relaxed/simple;
	bh=ozQGRjTiJsgBjbD1hrI8hLdNjmZDLyuYj4VRqdkZMfs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XDmFEZbFQVchunDBJ2IJcoWee3etD5ZDUufeQjho7OMmZvNj7JocahjEFOMztbTuS8Xef+/1SEfJSIs2tHfTv9olkGsuXL4Jr2xiaYYiiSqBHuWOLbBb81ncR3XVdGZcCBC6xlJXxAXc960OQK8EVsP4wxiZG/jv25Pds/cc3bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3xQvM09; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BAEC4CEC3;
	Fri, 18 Oct 2024 15:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729264310;
	bh=ozQGRjTiJsgBjbD1hrI8hLdNjmZDLyuYj4VRqdkZMfs=;
	h=From:To:Cc:Subject:Date:From;
	b=o3xQvM092JnNMfXjoiZXQ3+03M4ehf+23ubfGB63ZUkeZcA6TcPHiiEj1O/FkZ1ty
	 F4e+jaMZ/V7rVsM5dqLbmJUsa88Ud2R3o97PZqdQ+y099WhpGIDaWtzJwkJq65ojPr
	 jcgntWoGHOLS5LrcXLFq55jYN/8EdpChcmHgRWPQS5LHahiHkt4t42Hu53K3dzEPGx
	 qEjhzWmr3Sm3uNSuxdyeeP0r4J8jrr5K94+1lGA3Pa8qt+pEiIuisx3JXasvn+Bces
	 jnZNab9TtabZfeuFYQd5JKb8O7SYEO9Rm5nm5PtOlPFil/jGA8O0S9//dxmEbkb5Sy
	 XdxW58/uAiOUg==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm: a6xx: avoid excessive stack usage
Date: Fri, 18 Oct 2024 15:11:38 +0000
Message-Id: <20241018151143.3543939-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Clang-19 and above sometimes end up with multiple copies of the large
a6xx_hfi_msg_bw_table structure on the stack. The problem is that
a6xx_hfi_send_bw_table() calls a number of device specific functions to
fill the structure, but these create another copy of the structure on
the stack which gets copied to the first.

If the functions get inlined, that busts the warning limit:

drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]

Mark all of them as 'noinline_for_stack' ensure we only have one copy
of the structure per function.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index cdb3f6e74d3e..5699e0420eb8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -259,7 +259,8 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
-static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+/* noinline to avoid having multiple copies of 'msg' on stack */
+static noinline_for_stack void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/* Send a single "off" entry since the 618 GMU doesn't do bus scaling */
 	msg->bw_level_num = 1;
@@ -287,7 +288,7 @@ static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
 
-static void a619_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a619_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	msg->bw_level_num = 13;
 
@@ -346,7 +347,7 @@ static void a619_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[0][0] = 0x40000000;
 }
 
-static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/*
 	 * Send a single "off" entry just to get things running
@@ -385,7 +386,7 @@ static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][2] =  0x60000001;
 }
 
-static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/*
 	 * Send a single "off" entry just to get things running
@@ -416,7 +417,7 @@ static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
 
-static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/*
 	 * Send a single "off" entry just to get things running
@@ -447,7 +448,7 @@ static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
 
-static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/*
 	 * Send a single "off" entry just to get things running
@@ -478,7 +479,7 @@ static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
 
-static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/*
 	 * Send a single "off" entry just to get things running
@@ -509,7 +510,7 @@ static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
 
-static void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	msg->bw_level_num = 12;
 
@@ -565,7 +566,7 @@ static void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] = 0x60000001;
 }
 
-static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	msg->bw_level_num = 1;
 
@@ -590,7 +591,7 @@ static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] = 0x60000001;
 }
 
-static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
 	msg->bw_level_num = 1;
-- 
2.39.5


