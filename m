Return-Path: <linux-arm-msm+bounces-67393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4EB1848A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EDA556801A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 15:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D81C271469;
	Fri,  1 Aug 2025 15:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QLhWYn7c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EABE271A7B
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754060893; cv=none; b=WEKIAEirKMZnTBhfmVbrrKsT8zuATQewbzeIJRsFHHfIzvWDQ2P8KrVEkysnn42frWtOOuvMfIy+Sju8fp37d0PNaAy7tSTnfqH3c5uQn6PT5bREr83eJwjhT2ROTJg/22wMbmUliGwPG/bZo7Cx+8X8WwH5MEAX23O8dgnyRnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754060893; c=relaxed/simple;
	bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNCcdTGr2UuqxvIWjrwK/jb8IGZwE0cPhOlzyVKz26sl2V+U2+pkiwXfuPLEuxYWOkdQ5y9cpuiLA+PXDKa1lshJNA2wzQ9+3bAB8fsaVyBf83QaUtn1RrD2oVW4ZW/q0rj4MaGbNEYsEhOPIf8urPeKg4TmyMunoSCBZs2X38g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QLhWYn7c; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso1495373a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 08:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754060891; x=1754665691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
        b=QLhWYn7co9gs0vvPVRm9pFeJsuLHmNIdxeDKqG3DPnzT+Ogqp/826Homy9yZO8Gj1+
         oerLQGKf1ruq5KQmVS6ZO5k2U2KS3fupQoWonzv0gPXyeGwNL03JQNJN3nXXTcpRkhQq
         Qa4xFRMetKeJIki27PEobrRewrG3hm0yJv/Oa8bG15zhvs+gXMUzuGQEOLEcdBflXDrm
         uV2ijDoCvEGEEAmkKJlgRCMyHvMumE+QoCB+Yn7KQ7iFKSbb3hiCdypv2U7qlsE+ddct
         wNTiGc9vFOEdkcf5ytiW0sYeIdQln3E+TSv7d3LO+1sfVhWBD7Q10RpQD1fdAZuk40F2
         eyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754060891; x=1754665691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
        b=VQCuf3y5lDXtJ4P2baVYgtBlB9gD6faaXyeG8OxRXvOkV9vMLMwbGKwSl3hQsJQFIF
         tNkcPZiN6uCMimDawTDL+9rVHg0tsZUZYDwxuBNbo6Tdgv2VGUmP3YjXJAu1rLKcH5S3
         ZckQ67xFmBo1HGRMy5ezFuFG//AmvHQH17cDv8+Z+NhSHMsv06ExeYxpzQRNMcw4DvNN
         /yJW10LNk6bInExaj6X1eeanqZ/NlSQu/aBVx9qWfKWQS88Uchdck1VCLb6ieDazzX8/
         f7aAVCnhhiK6nhjLt3L830n1spsbMeC+K1aszWBIOXGEACEBakbBIR7c9AbhMy54Mi9b
         naEg==
X-Gm-Message-State: AOJu0YxIlif9wJryQq8nAKsCDJ8jALpSWbbnQIQzl2iF2bIxlqjHxBsF
	5J78k43NbcXXA6RtE0Ec9bqxSCO1kYRj6X0+8Fo5Du4fr7FaM6THGen1IVL7Lvjbv/zh7eizeEp
	enLVvhfIfZw==
X-Gm-Gg: ASbGnctuslk1+Fo/vtIoZsAsRpPgV97yZ/YAma9Z9J/UN5lMnBnwToXTCdn2zBcQBdO
	1mA64gXuHB2uMDWsBgQKLjrXfHer5Zn9hy0GUpND7R1LjyLlKMNEakZZTYeAl5Xw8Y4zxKm0rKN
	A9tF/FL70vFwRC57WXLOW54nliz/ZTk1r4ztTZujGEsxDVgjuyJCmyZ4CBUWJYUOv2WnEikNqYo
	A5euyxkRkTFO6EZ77jOEyPVyR2al5TXwQgZu8Q+YLtPwJKSnQf/VfPiummcVK0Rby4tmWQBxoDv
	RH22jife0ihC9AuFCb89ANWgkVB9GUn/TcyNT1K6UkGW3sRdmZWc4nrA9wsUdCwSByeFfmLcPVP
	s+a7djkEZuezUofzIjA==
X-Google-Smtp-Source: AGHT+IFayGqBx8hW294QxMt2k98HLw7+m+LZMmht2Y8J5kauLQORFEs1yvXOy9+cvVSKakLHEQx1Ag==
X-Received: by 2002:a17:902:db11:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-2422a6b1521mr43892835ad.35.1754060890630;
        Fri, 01 Aug 2025 08:08:10 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:08:10 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:28 +0800
Subject: [PATCH v14 04/13] drm/msm/dpu: fix mixer number counter on
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-4-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=DETqfYzbBAU3+ZrJj8OiSBo60uswBpiJ+Fiol09/aeqJuM42nOixyKlbhgbx+R/Qv/ErHOuBJ
 OZ4elEmcauaA0/mjq4r+cq1buvaWss0mroaRogcSvaeaex/i2K5+B0T
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Current code only supports usage cases with one pair of mixers at
most. To support quad-pipe usage case, two pairs of mixers need to
be reserved. The lm_count for all pairs is cleared if a peer
allocation fails in current implementation. Reset the current lm_count
to an even number instead of completely clearing it. This prevents all
pairs from being cleared in cases where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2c77c74fac0fda649da8ce19b7b3c6cb32b9535c..3f344322b7f214d0050986e675b32522f8eb0ba7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -374,7 +374,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Reset lm_count to an even index. This will drop the previous
+		 * primary mixer if failed to find its peer.
+		 */
+		lm_count &= ~1;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1


