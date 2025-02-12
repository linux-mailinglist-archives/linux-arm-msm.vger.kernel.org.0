Return-Path: <linux-arm-msm+bounces-47829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B4EA33328
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 00:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0574B167A4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178D0205AD1;
	Wed, 12 Feb 2025 23:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWUnh897"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C722204587;
	Wed, 12 Feb 2025 23:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739401485; cv=none; b=QuRgMY40XcFOJmp38lw0yIqUzUhrSvJaQeBWVBom1zOz+qPt9mV8F2uP/BbASgt6Nl7hYpeY0OCstvRHwJJ0GF24ZGbXK3DK/af6glQtFCYe6tpglb5JlWhD3CZu3xA1+StlL5HdIZe8vZHXNdYtdxPNYfkRMbTet4Y9VliSa3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739401485; c=relaxed/simple;
	bh=whc0meljq8d//xyWaoGWRpTBZvYd9FKdXjbcFve5bNw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RimwBl+3DB9pAw0RXxuUJuge+OuMWYHQBX/8eLThdgJ+sHaXUz64TCj19LJjmqya3KLhWff9JxbJkrWyxZ3J9r2/Pg1FbDh47KBYsfCBLvsEf7SbdTxMRZNmgYxTCgPcdBI+/9xKpKo6R36tiAeA1IoJq4r2ysPZvePmWu+jPks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWUnh897; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f7f1e1194so4848845ad.2;
        Wed, 12 Feb 2025 15:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739401482; x=1740006282; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=izwOSozCDTiy2Nz+ObEcnYlYVvdl0bBlgB59WdBOADk=;
        b=ZWUnh8974EoaNC1Li8kuc1cQziQhaHrspdLAY6pj4dP/1nD9KhAvwbIIv4LQj+KvzG
         MxGLqNkTQnVEPqGgiOKFBNDDSM+0JVvNH5r4mCd+JAYWGRHh7qWbjuPq79aOaPE4wjly
         erzJVX13Jr76YnnKezvfAFXVHE1/yNd4s3tKvJ5bVKx6ue2xSuWaIlt0HHvIe4NDPnQG
         EL8X9mWuUzqwDN4H0t4P2EDeqDv2IwamCep3XbfmicxcWmxSQjG4lQV03ehKDL45z5AC
         jkhC7CEa/86dHCOB3Z3kIiCT8e9Ve15tt3cNOaLCN+nQnqjs0eeskdce0fluNcEYWSF+
         Dugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739401482; x=1740006282;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izwOSozCDTiy2Nz+ObEcnYlYVvdl0bBlgB59WdBOADk=;
        b=P7PrI65HZL/1E2ON3bkthGM4d/k7GKFLQQUsdNMVN0gnOZpHgHB5PHzzOk1Bm6DQ25
         +XTD7m+pMFtyIKrp7FoAAYRaOBTXuvGJ1d4YlLclmVH3IdO8VpVUzn1bvPDyScXNYWG5
         ESytoMKETFUj3gLm3ithzNXI1NSNGuN5BZkP5NNd/7KJswo8xhE45+ca50nUSmSXmRU9
         gPXtl5+W54As+Q94VYFzdYRx7vS48z8xQCSn0eAWA+jdgHnP95xHGTMkle/g7zKZNeM6
         Ela+LOU7b+5kXpPgEcXR8jlNLrTyoGto7yrYymnttF/dXWXmCZf8Fssf5pOUBxQR4xjp
         OeMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKklQrp5SBrd+LL7kL2d0fZPL7u/L6Ib5KATuUuzlXALbGFJCyqmsLF6/o3YEroHjwGA+o1GgtQusbpCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2/Hsustg4Qtf9qW9rwtamr6BmFYB/2DTaf+X5Mm9E9wn4avNs
	kN7/dfkp/PWUSSJv0Um9hn4X5AbHfx36IHj6Yuic41zI7WK0z7v5
X-Gm-Gg: ASbGncul4pMybg2t/FJqFzEpNcMGCw4/4ZyRdc+OiErq3ui7oVfDDvezy0sALHERfel
	CC8zi/DDRixMoVFAi84tb8T1epXEZmfdLayO/21iX0kBDNbTQ0IVkg0SWDpeZvvQV/DiHjoajie
	3r2U/hL+zCyIRGuDsb+ryT5rxRiScE1wgggGjjmgLf21Ef3JGMh5TugeKXyTsKNO1nn/BqfUxW+
	FGVjuvA2Yl3K62vZ7L6NYD0Q78uY07zIlClvpPhROuDEV0SYiJwlNJu+RfU+oYXwWyhXVMApFSW
	/rwdHjSs5nhHBRm6CszN4Itd
X-Google-Smtp-Source: AGHT+IHYVNpBJ+hs2SKF43WLDbYcsITXIHpe9AoNBckhGg8EsmihGHFjjFi/bOt0ArQ9OzpKlr29tQ==
X-Received: by 2002:a17:902:f541:b0:220:c067:7be0 with SMTP id d9443c01a7336-220c0677e32mr45783155ad.6.1739401482397;
        Wed, 12 Feb 2025 15:04:42 -0800 (PST)
Received: from [127.0.1.1] ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556da47sm695655ad.187.2025.02.12.15.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:04:42 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
Subject: [PATCH v2 0/2] drm/msm/dp: Fix Type-C Timing
Date: Wed, 12 Feb 2025 15:03:45 -0800
Message-Id: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANEorWcC/x3N0QqDIBTG8VcJrye0Y+ba1d5jjNHyaEJlO7oyo
 nefdPmDj/+3s4DkMLB7sTPCxQXnpwy4FKzr28kidzqbQQmyhCvwoMdbJd965jXqphGNUq0ULO9
 nQuPS2Xq+sg35kceesD0LlYFVbR8wwixWRtFvJPLZ1H2tsW746Yq26GNaxkS1kqDg4XFak+xMP
 cSBHccfhiwtAq0AAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, 
 Tanmay Shah <tanmay@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@chromium.org>, 
 "James A. MacInnes" <james.a.macinnes@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739401480; l=2022;
 i=james.a.macinnes@gmail.com; h=from:subject:message-id;
 bh=whc0meljq8d//xyWaoGWRpTBZvYd9FKdXjbcFve5bNw=;
 b=/+dHVSi8w/zrS8YQiMpVK5J8B8OGqD9Fv40WhguqSpTjkv8yGf9TRXrA9AHGFEAiU5FDMMShT
 z3G7HubmMjpDk5krBpgj3hlVsYK8Y85dMXvheX1MU6UZ+9wOGk5NWEL
X-Developer-Key: i=james.a.macinnes@gmail.com; a=ed25519;
 pk=3z+XoIMKkNT7N5GL2WOp/Lcz2ghtr7b8RBCa1usTz9U=

SDM845 Type-C DisplayPort output inactive on DP Monitor and tears on HDMI.

During testing and research found that the dp and dpu drivers more
closely match later incarnations of the Android driver.
Compared against the 4.9 Android and found the porch timing and
wide bus elements were disabled.
Tested by commenting out code and the graphical glitches on
HDMI improved.
Fully turning off wide_bus resolved the single vertical line and
vblank errors when using non-native resolutions.
Removing the porch adjustment fixed HDMI and DisplayPort operated
correctly (for the first time) for all monitor supported resolutions.

Changes v1:
- Patch 1/2: Separated the descriptor from the sc7180 and turned off
             wide_bus support.
- Patch 2/2: Removed porch timing adjustment.

Changes v2:
- Patch 1/2: Removed unneeded assignment.
             Increased verbosity of commit message.
- Patch 2/2: Added comments to explain use of wide_bus_en.
             Increased verbosity of commit message.

Verified functionality on SDM845 using Lantronix SOM.
Tested with Type-C to DisplayPort and Dell Monitor.
Tested with Type-C hub with HDMI to Samsung 4k TV.

James A. MacInnes (2):
  drm/msm/dp: Disable wide bus support for SDM845
  drm/msm/disp: Correct porch timing for SDM845

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++----
 drivers/gpu/drm/msm/dp/dp_display.c                  | 7 ++++++-
 2 files changed, 10 insertions(+), 5 deletions(-)

--
2.43.0

---
James A. MacInnes (2):
      drm/msm/dp: Disable wide bus support for SDM845
      drm/msm/disp: Correct porch timing for SDM845

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.c                  |  7 ++++++-
 2 files changed, 15 insertions(+), 6 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250212-sdm845_dp-6ed993977a53

Best regards,
-- 
James A. MacInnes <james.a.macinnes@gmail.com>


