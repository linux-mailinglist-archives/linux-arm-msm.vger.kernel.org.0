Return-Path: <linux-arm-msm+bounces-88150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B0CD068C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 00:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C5DA30082C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 23:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291CB33344D;
	Thu,  8 Jan 2026 23:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaDAOUIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EAD26E70E;
	Thu,  8 Jan 2026 23:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767914979; cv=none; b=nRco4H93NA2w1H4wLARKtzegjNl2EK87bJh2UMYPZFTTq12EwX0RXv7lZT0VcUAP9FGL+1nRiZqIQsz62RLTvrIMWNicggEPM7upvbS26YPHRjGs7ucX7BBktHluJsbKyU1uBReY/2DPbfX33OKEWUhzYpuZpdsKa06Cw/+d1Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767914979; c=relaxed/simple;
	bh=Rw3b/I81KHL7rDt7WZsRA6q5wG50TRlXUqsg2VrqzSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N5Q1FEM+VX6ABXOoLA7KaBV5n5dJzEXrqnymwWrAIg5Pib+GzgytI5s7sJJlDSZTO6aaPomyWvbS8rhORv7m+SIvvdUT3B8lt01hYS5SrR5icQq+3TcaNsjCLZdMowaIIrtQamuOrVVULgP7MgeYVwmhLqzRroyPOwo2+Npwu7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaDAOUIY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BCEC116C6;
	Thu,  8 Jan 2026 23:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767914978;
	bh=Rw3b/I81KHL7rDt7WZsRA6q5wG50TRlXUqsg2VrqzSg=;
	h=From:Date:Subject:To:Cc:From;
	b=LaDAOUIYfdcS1TELNDZjf6/2IqXXfGW9tJJF8AlT3amw0KHLz9m4RzhPpyFj0eUwO
	 NkBhHLaa4ImtevJtSzL/7gXNCnJEsHk79Z3H1XX8ESpkJ59wXKL+/6RpIq2l15CV0N
	 zCQSF+DO1Z38ppubYSyswD8prBuFDD+RBJW9PxrDck8LviJp+WGDOhzsjBOKKS1GY/
	 UWleuMUSKLsIeCBFE4EexrdxldpVclpji9HV49gz9eb4QvdVZvkBRt33eEbZbnFk+Y
	 aiGKhCCqHynXF3WvHn8yik682hKDChFuk+YnPkVGwQy9Jg+7feUnHXmCQgX9xOBMU1
	 FwUSkYrQcnf4g==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 08 Jan 2026 16:29:25 -0700
Subject: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN0QrCMAxA0V8ZeTbQDifDXxGRNYkasetIZxHH/
 n1VH8/LvQtkMZUMx2YBk6JZ01jhdw3QfRhvgsrV0Lr24LzrkS1izBF5utBsTxxKUsaPWELWgkE
 6pr2jQL6HGplMrvr+DU7nv/MrPITmbxXWdQMS7Q8DggAAAA==
X-Change-ID: 20260108-drm-msm-dp_ctrl-avoid-zero-div-be5dc40cbc18
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Rw3b/I81KHL7rDt7WZsRA6q5wG50TRlXUqsg2VrqzSg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkJtvckMppmf1ITXfHmyfb7Mzas2bhW59SuK76O7ketn
 kTdWRa5t6OUhUGMi0FWTJGl+rHqcUPDOWcZb5yaBDOHlQlkCAMXpwBMZOYERobLr3oXTIlLNNns
 qfGj32ri40sRd+SPHXM9f9HMNfvJkSYlhv8uosfs1tsuObR9s++ClsJ9u15fTJVmZdraah9R+mM
 P91UGAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

An (admittedly problematic) optimization change in LLVM 20 [1] turns
known division by zero into the equivalent of __builtin_unreachable(),
which invokes undefined behavior if it is encountered in a control flow
graph, destroying code generation. When compile testing for x86_64,
objtool flags an instance of this optimization triggering in
msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():

  drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream

The zero division happens if the else branch in the first if statement
in msm_dp_ctrl_config_msa() is taken because pixel_div is initialized to
zero and it is not possible for LLVM to eliminate the else branch since
rate is still not known after inlining into msm_dp_ctrl_on_stream().
Change pixel_div to one to make the division well defined in the
presence of an unsupported rate, relying on the DRM_ERROR print to
indicate the error to the user.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [1]
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cbcc7c2f0ffc..e4731c059ed8 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2395,7 +2395,7 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 			       bool is_ycbcr_420)
 {
 	u32 pixel_m, pixel_n;
-	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
+	u32 mvid, nvid, pixel_div = 1, dispcc_input_rate;
 	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
 	u32 const link_rate_hbr2 = 540000;
 	u32 const link_rate_hbr3 = 810000;

---
base-commit: 66691e272e40c91305f1704695e0cb340cd162ff
change-id: 20260108-drm-msm-dp_ctrl-avoid-zero-div-be5dc40cbc18

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


