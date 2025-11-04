Return-Path: <linux-arm-msm+bounces-80320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C0EC316DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 15:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A7154634EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 14:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114F132C957;
	Tue,  4 Nov 2025 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFdYFdVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DCC32BF5B
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 14:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762265209; cv=none; b=fXAnBCmKLy6D5c3qkHqme+5ABmhKZOl/WRNufyBgDmDIpiD9hTq3LqK9e7u4IMGpXeelQXkGSce1w3TfFl5Uw7ohxCFjFAsnPm15ahlduK4mXT9xUQyF7nikp3KgL/2BgKP3IyxtfgIQzHkGBqxfCgeg7Tn1betHDj3fLNHLcU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762265209; c=relaxed/simple;
	bh=r8ZaJI6BkiaamKZiw/nt98SY/yLk2GfAiTnSKou1nxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CVKzPomNm6p8Dp6IW7/W4bMoWXiXODcGGaR+OSiFgywAydt6i9LbxFC8WJ2AGdh4G/PUjXUv/WDINS5qnBld8NNGX9wVfLaGRHGWp+85+UpiuYzF0ZyXW0PM7d6AY8nG5XgAVucFz50t3JLo1i/9EoTVaHZw7C7plfZTcXWCqW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFdYFdVg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so45174195e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 06:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762265205; x=1762870005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jggE3W0Hv8sJtJDyKDC+MYoM1lxEF9SIqkGx01U6ZJk=;
        b=XFdYFdVgcB7XY9NLBlhgIy3ojEda/jQ4vpbTHIalN1jkUp2QmFGKJYauRFSEU+Q080
         07E8fuB6Vu7tLlkMoniMil6LOD8o2hmXA38S3rfS1S0YA7Qn4TgVy+Npge06bYSY+T4t
         g8HXtQ2K8zzJB2gTKFitWahfKvew90zDzxueeo2ay50vAt0A4oUnRPbTLrYLiqYYVLiK
         Fs42Z5TC1GVkP1PAifImElmNbs20YsFmdvo3/TlehFLmQDyDmfUX/AUi7G5Dk1/13Qox
         sNWBfy6wdxsoo454Qqj1gyEAm+frBjXcvhT6m2T40oawJO+qZ8IArnzS3Ol/0h0hm+2+
         E4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762265205; x=1762870005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jggE3W0Hv8sJtJDyKDC+MYoM1lxEF9SIqkGx01U6ZJk=;
        b=X8WN+3HgGaeaL365ixZT7Y9yFIpftWAh4kONH1LJoURroN94Vlf50mgw8FjQuwuay0
         QQUGo5I1vUD7WG4ulXMXB77/64INN9E4U3bn4M4sEoueSa5riAFqUwEEczYxuyQxbLE0
         UaKwp+P3xdEzgmm/5lFEtyp7+Cn1hJLWr8nV8DdTwaCl6XN2+Nxau3PltjLxOatve6Xd
         kQZx0/XUC3z2acroW3bhgfPRtzueb+ebO+X7PGhXUbz+WpMwpQKluFSCVVFggcPL5p35
         UuthO1ap+LFFhtvURpx/s08FNuWg2rpIEeRCJXSQX4uMeRr/M0XHAYwQBLtLndVz7GMb
         lCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHyuKASazglkoZHQyX0pdcWlUY5rJF5PBZ2Y/P0bOnfUVBxXy4XinUBS26wHHt6UGK1j6u1RfnQnFJ1a7s@vger.kernel.org
X-Gm-Message-State: AOJu0YyY8S0CPdbmmvsD1QK10zZxC7aH/X3x24R/dOrkJpNa6OTU91t3
	2RnFlAbadHSAKrs9LUc55UmGbS7ou7r2EALLii/bHYbawoAk4sFDEdSb
X-Gm-Gg: ASbGncswS2eeepPifiMXwt82SNm8JBV+L0JHUEhodq3E92rWHii2J06xA3GwEOfmQU3
	aIbB30NcJxr7059BcCrvak1GJmgx6sMH71A/a/YnhXtNPTqaYs86sudU/qA1KLZ1hjmCpQqr64v
	wiFX/k4EXPpVPwkct9ckh2fySy0cKaHaP3kpQYK8wQIeSQPDOlouBNyUDcbknIQMY/aEeM3EYlI
	eaLCv5AlZFeQNmrUvk7M1FgoZpfg9I5BewNpjXTx3V0wvsauU2HrSBqPOtgQSldL/BCuVubaSNu
	7Iv1dIL84wG72htVK/dtEnw3qomDY/aZ1uv1/GIYRZ8kJl5jnkrQHOzAT9mLN67b/8JG8Z+o4tX
	vSc9C1fCbYzCbNeeIQMpb5gKzz8yJIRUUwcqTv37l8ADrnVZQDuSRMF+Ir9bBZZo7mwh8BivuoH
	nadbWyJkipyReM6o3DuLIlnndQ+JcZ3w==
X-Google-Smtp-Source: AGHT+IHsNLmv0MXPqVJXEKP05hHhFlO/+G8am2HvW7myoY1c6ojUSIh+/0N7JlnwOU/BddGjYdbzcw==
X-Received: by 2002:a05:600c:8b8c:b0:471:b5d:2db9 with SMTP id 5b1f17b1804b1-477308ab095mr153289115e9.21.1762265204067;
        Tue, 04 Nov 2025 06:06:44 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47754adcd08sm52511205e9.5.2025.11.04.06.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:06:43 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ilia Lin <ilia.lin@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 0/1] cpufreq: qcom: handle ipq806x with no SMEM
Date: Tue,  4 Nov 2025 15:06:29 +0100
Message-ID: <20251104140635.25965-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series handle a small device family of ipq806x
devices (Google OnHub) that doesn't have SMEM init.

We improve the SMEM driver and apply a workaround in
the cpufreq driver.

(I didn't add the review tag as the patch changed
 with the new implementation)

Changes v3:
- Drop first 2 patch as they got merged
- Use of_match_node
Changes v2:
- Rename error macro to INIT_ERR_PTR
- Return -ENODEV from smem probe
- Restructure if condition in cpufreq driver

Christian Marangi (1):
  cpufreq: qcom-nvmem: add compatible fallback for ipq806x for no SMEM

 drivers/cpufreq/qcom-cpufreq-nvmem.c | 35 ++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

-- 
2.51.0


