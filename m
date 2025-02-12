Return-Path: <linux-arm-msm+bounces-47682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B85A31CFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 04:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E36CE1684C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 03:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893BA1D517E;
	Wed, 12 Feb 2025 03:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCrOkfMN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E81271839;
	Wed, 12 Feb 2025 03:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739331758; cv=none; b=khCrT8ZaC7yWjJJCOYOy8YRqzqm/HCf1QgXV3ddj9XnlP9vuwE4wLb0GCQUhdiI9Kfl0P8ijELcCRNcFGHoJ0AKvuUCvqoESK7wWYbgIfgRZqNlnADFBYdVcIeod7cZh/SSlHSeaxM3+tf3cU3cfY1+accNo/3e+0nYiRYwH5pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739331758; c=relaxed/simple;
	bh=oYBJHXHSEzLNFulSa4RhotpYdkAEQVYRyJ9lCJLWK9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bcEzowb+dswFHXzAseSNLWjzOeMUpsRtGBsRPsHsXG+dgFyv3z8xTAw/UE59DWfkVJE+VRLqyEVtcpBI0bSFnXjxRkxDvHYIfH7v7vQ1jaCo+QYfzo14UYsuB9Kgu77Hs/jM1VhzNZdookZN3dwjDKS/zrTzwSnfRiZdLqVY9OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCrOkfMN; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f44353649aso9331640a91.0;
        Tue, 11 Feb 2025 19:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739331756; x=1739936556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfn2rbouZ2ozUUBc7aOtqtXF6ZHrkqLiBHsQHYHVXP0=;
        b=VCrOkfMN0Kwg0UBIZV/igA8dafU8eHUzwn2LYtY9skYelO1YWeTZco94+UNI2nXsmp
         VU4NLpX+pwIaICWYcAA08Css1gauMoBuJ3oIRZdBFUG5STcoBNIAcQ5T6yoP8E91d1x+
         Os/vVpQ8R5ekRQTAJCAIRXsfqU8/p5HGcz/kKVAFkoDr+GxdxYjti0oguCz1L+ymGHAx
         ANdUrYHSp7sgyfz6l4p09OTbfKkVmZ0trKPsQ5hSL0zCQag/y3LIrZUNduTuoMqTO3l+
         OePJ5jxRAjXpVWn9pFSt1A3iJMm2N/+uKiOahxm2emadON/CRyQVHN7vXyMH+aejbH89
         EAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739331756; x=1739936556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zfn2rbouZ2ozUUBc7aOtqtXF6ZHrkqLiBHsQHYHVXP0=;
        b=vSBYaY5VDV5f1des3yhWoj3btbdU76blambovzCOCRCLnNdU3O3/WHT+e9zI/dkrfu
         Slo7QdON43X9PzrvGsZ54wXhdVE7mO8ohhXtBHz5f1J3N2i6KU3F4KfxYwTADNjEPNhm
         B5iprgPe78m08IR7MredleQ884tyq7Yi1GV7m6GP/1Vps/1On7QjibFKKwc3VeZKR/Di
         UlDq0bz0QY8AMxdCtf7BJ/xO1YYo9rxFNf6j2mBMXfxywcQL/QgNLeiOVLXoWtHlYB2k
         6NWMLbGbmrptmnB4XuHIMdB2Q42Txd8W0niHZNhqAfIC+OH1zgNLkcg429IXJ2T9Q3HU
         hQ0w==
X-Gm-Message-State: AOJu0YxKi0euXZPdv1kqhyYYvfwuzBiAQ0S9+8nwh2y0cLQ+fjwa/Pih
	4hCdT2nsT9WLBhMHJ4YWviMFPmVNvH3GC6xDd4dUiYfP0QUgDfPTafzgCdUh
X-Gm-Gg: ASbGncsVxtD8e3aJkpq/w7ayKiSWHrMyAwUqRbM1RrM9Dt9ERv8GElDXKHZFQcIJ4KC
	pCaoHwhCjsM7hEpWg475vzBGn0cA/QQFj7+TNGbQJmvF6fnsIk0kO7tcgj8Y1gUA9M5a0ndHRNB
	zfTSBXBCYAGKkKK0Wt19CiETbr8+Y4wiCfU6ApYa6yIT1q3aQ5ZnphGA0vYfiTN5sEyIJWBzm7z
	X46YC8zETvTPaY0wgf0M5/edb5YEr/huPvW5niB4oiIqSH6WLDwFExA1tJ93qWIP0UdmNbiu5kp
	sHlDYtGxBmWUeC18J19bLdkj9Fevz8A6pj/3gg==
X-Google-Smtp-Source: AGHT+IFBRaqk+8z6sGaecrn4RA+swjdJMwXUizMLvf4h6mNQVgiCImpZAKamyAW0ztq2udeDQy5KkQ==
X-Received: by 2002:a05:6a00:4094:b0:730:7d3f:8c70 with SMTP id d2e1a72fcca58-7322c615803mr2910642b3a.21.1739331755961;
        Tue, 11 Feb 2025 19:42:35 -0800 (PST)
Received: from localhost.localdomain ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73218c206a6sm2304923b3a.49.2025.02.11.19.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 19:42:35 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	"James A. MacInnes" <james.a.macinnes@gmail.com>
Subject: [PATCH 0/2] drm/msm/dp: Fix Type-C Timing
Date: Tue, 11 Feb 2025 19:42:23 -0800
Message-ID: <20250212034225.2565069-1-james.a.macinnes@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SDM845 DisplayPort output inop on DP Monitor and tears on HDMI.

Fixed
 - SDM845 does not support wide mode.
 - SDM845 does not need porch shift.

Verified functionality on SDM845.

James A. MacInnes (2):
  drm/msm/dp: Disable wide bus support for SDM845
  drm/msm/disp: Correct porch timing for SDM845

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++----
 drivers/gpu/drm/msm/dp/dp_display.c                  | 7 ++++++-
 2 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.43.0


