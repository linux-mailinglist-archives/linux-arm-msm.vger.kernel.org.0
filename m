Return-Path: <linux-arm-msm+bounces-20010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B498C8CF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 21:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344F91F240C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 19:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EA645007;
	Fri, 17 May 2024 19:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRWFqIQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D7321D;
	Fri, 17 May 2024 19:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715975430; cv=none; b=IBwAIO3jtLZYOghfR89g4dNTvUO/6eqYb5sVpmwbfBd7wrH76+4JzAAQ0FMItmHaQxzsjoygxcjw5E51A7/dLFpNdeubegTyPj22lI7lRVlf5mWagvRmvUkZQuc4zJStM1MZq1jWEqX3pFnYkgG9NIRXSZeVhmZMb1UVBM7j5RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715975430; c=relaxed/simple;
	bh=j+QC3kOhZwJKkXX5mPM4HY+DrnVzET6HccRVfuZP43Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jpf9AOgh0wD3jG6kjsMcuLGsJT7eWKOn8m9mTGJalQ/j7jabR1rhObKwzlveg38hWg5h8eA86t512T30eWjiSUXobKRRbFEE34ROAmN2pK9HluFmhHCjAWr394Gk11oAqLfqVYxJVmesaqD4bbkmnD70/Xu+iw6l1wKVifnECzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRWFqIQF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ecd9a81966so7086895ad.0;
        Fri, 17 May 2024 12:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715975428; x=1716580228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGDwCwwhr9iyyZbcO2LNbRmyKSJnbSVS/UCD4IYwGr8=;
        b=kRWFqIQFG1DuUVCLGEmakJneRpaarX/FdIXoIaeRR7om4a8z46CCe7LAUAPoWBIkKc
         qVz0sBLC92mEPlUiq/eAy+cSab/HZ3VaVJ5bQUrN5/EqAGGzDFFbpZmJg6MBnH/8Fy3V
         hM+af8ZQpHiJkn19Ro7Iv9jO7mYF6smEiE1Qi7VopEfUG8JQ3kGkruC91dHoBY6yJ/rV
         k3GbrpKqXHk28XXceRmhOhC1i3pcIiF68RihqtoqUzz7cMyiyOZeYzJnX0EU6NhuccO0
         pI9GzzfEY7cuf4acksZ9nhO7NDSkRPpY3kavlGb5d+CnXsarlZKQSUz77rKf9QCPsnzV
         auDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715975428; x=1716580228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGDwCwwhr9iyyZbcO2LNbRmyKSJnbSVS/UCD4IYwGr8=;
        b=VJlGM1xJk1PA+wUcmIdaKQ6tuUy0GTw3pfWZof20TNllYktDdkriCsvCMM+ydmztMN
         QhdpuA21e7oBggK/E+97m7zE2EViK+8lgKGVQfa9hcEchcCcbOGdyzvAB8ArFksLr0Ke
         Wfh8UBylaxk6Ha4hf+XEpbXcnKMm9NCTksLcCrkJboz4ssvRlFzdL1E6vh1NO+UHAE2z
         JZkHuuo8X0mQith7YG186Z5HtNlA6QCe6rmRKYL56/qZv0cMYd91pmMUvL8UkdIfZTNT
         VTH7dbiwP4IpvdRzVrj9P2WhVQPUcD17koGcdI7oG7Aqf42T7kLe+9I+kO9sUrBPIold
         AfDw==
X-Forwarded-Encrypted: i=1; AJvYcCXPqPLjiIHoU2L2psZZ02iW7jBKmqkiOTkme2fkAee8GRkDHBamQWYlcCvYxAx17ajUd3e634uiqH1cctXM55Ss0mgiqtr1kJnXq8sJAYoAkznrFRi/7hPisXz6MzXJgyZN4U7UPmsYG6m7TA==
X-Gm-Message-State: AOJu0YzJPmyXPC+vhBpO23oj4Jh1dKylQO+opl6qp7aapdXCvTxS+lDh
	Joj9QLYFW9f/rbBuiZYGQYf+8oAfhi3P0ijGt+HP6baT415vdZCx
X-Google-Smtp-Source: AGHT+IGED0PKOMspRHBg/lO86eagMfaS1Pal7MYA8gYSpyUm/2pAAGCaWIEFdpCNBk+5VKC7GhGXlA==
X-Received: by 2002:a17:902:d4ca:b0:1eb:3d68:fc2b with SMTP id d9443c01a7336-1f2ed3f863amr1029215ad.34.1715975427744;
        Fri, 17 May 2024 12:50:27 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d188dsm160529775ad.2.2024.05.17.12.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 12:50:26 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Nikita Travkin <nikita@trvn.ru>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Connor Abbott <cwabbott0@gmail.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Check for zap node availability
Date: Fri, 17 May 2024 12:50:19 -0700
Message-ID: <20240517195021.8873-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

This should allow disabling the zap node via an overlay, for slbounce.

Suggested-by: Nikita Travkin <nikita@trvn.ru>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d9ea15994ae9..a00241e3373b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -46,7 +46,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	}
 
 	np = of_get_child_by_name(dev->of_node, "zap-shader");
-	if (!np) {
+	if (!np || !of_device_is_available(np)) {
 		zap_available = false;
 		return -ENODEV;
 	}
-- 
2.45.1


