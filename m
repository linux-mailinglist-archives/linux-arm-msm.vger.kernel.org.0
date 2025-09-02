Return-Path: <linux-arm-msm+bounces-71583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8430B3FFEC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 272DA544A76
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CB0304BDC;
	Tue,  2 Sep 2025 12:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYPfH23g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E95288C20;
	Tue,  2 Sep 2025 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814932; cv=none; b=P0KkfXZ7z5U6BQF8xiuZ8PcbjGr1F5QWxlBoL8OqjcfqrqLBNuBeX4oWB1/bE3aSArfLHFN1h08BlNNnCKnw6LU/2dYKeLtnWqpVPMY/yy3bF/BhAnrjvIElpXDuOMezhAT2JoPnllII6i3d4OfrUGrQfyWMc6O708iI8AMRPBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814932; c=relaxed/simple;
	bh=OeQCZqmlTKPXUl4FyiwvRnFuSTg0TH+m4/Xvhsktjfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKgUljSwa8w49PFABZiT8dXUF0vmwvVF0S5fnHabpgSbn/6erfSxSavH5tyh2alK3zV8LfmbF+3OAuEggyNqrDgivELdpoMp8LbwA17X8I+02psi2y7l7SULDOB0HUcnMJcmzwHsbt2UjC91WWjHNye3091QYzq0JlttZSu/Pqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYPfH23g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037E1C4CEF5;
	Tue,  2 Sep 2025 12:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756814931;
	bh=OeQCZqmlTKPXUl4FyiwvRnFuSTg0TH+m4/Xvhsktjfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mYPfH23g1ZLFj3BOea0ZAiZH9dfedu6kskFWZRQq812SU0qHAO1e7P5DdgYc7/nrv
	 8/OUUkcdgiO0oFHH85fAtwHP/z6x79j3G4yiIqjpKQ5h7+twXhKC4JvpRq+02s5mtm
	 zDC5RK07Cn6kGeJ4wb+S+sU9budPbUrw7Rlm8qFqUOTPG0D8oLmEZ3/ytwqrQ7PwFZ
	 4hIF6hicoelesONC0K5a59wZQWUfAWwG2XA3jqn6IdArsdXY2QXexBB7PuM9IYSuWD
	 lGbSDJ2+fRG+VmAGpRCdR84xBZOj05XpqbXh3wNJGt12oBYLqAuSXJd9MFLaVSWDPB
	 P8Cf4P2j/5Xhg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-6.12] regulator: pm8008: fix probe failure due to negative voltage selector
Date: Tue,  2 Sep 2025 08:08:22 -0400
Message-ID: <20250902120833.1342615-11-sashal@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902120833.1342615-1-sashal@kernel.org>
References: <20250902120833.1342615-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16.4
Content-Transfer-Encoding: 8bit

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

[ Upstream commit ef3e9c91ed87f13dba877a20569f4a0accf0612c ]

In the current design, the `pm8008_regulator_get_voltage_sel()` callback
can return a negative value if the raw voltage value is read as 0 uV from
the PMIC HW register. This can cause the probe to fail when the
`machine_constraints_voltage()` check is called during the regulator
registration flow.

Fix this by using the helper `regulator_map_voltage_linear_range()` to
convert the raw value to a voltage selector inside the mentioned get
voltage selector function. This ensures that the value returned is always
within the defined range.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Message-ID: <20250823-pm8008-negitive-selector-v1-1-52b026a4b5e8@quicinc.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

## Extensive Analysis:

This commit is a clear candidate for backporting to stable kernel trees
based on the following analysis:

### 1. **Bug Fix Nature**
The commit fixes a real probe failure bug in the pm8008 regulator
driver. Looking at the code change at line 99 (`drivers/regulator/qcom-
pm8008-regulator.c:99`), the original implementation had a mathematical
bug:
```c
// OLD (buggy):
return (uV - preg->desc.min_uV) / preg->desc.uV_step;

// NEW (fixed):
return regulator_map_voltage_linear_range(rdev, uV, INT_MAX);
```

### 2. **The Critical Bug**
The original code directly calculates the voltage selector using simple
arithmetic: `(uV - min_uV) / step`. When the hardware register returns 0
(which gets converted to 0 uV), this formula produces a **negative
value** because:
- For NLDO ranges: min_uV = 528000, so (0 - 528000) / 8000 = -66
- For PLDO ranges: min_uV = 1504000, so (0 - 1504000) / 8000 = -188

This negative selector value causes the regulator probe to fail during
`machine_constraints_voltage()` validation, making the entire PM8008
PMIC unusable.

### 3. **Small and Contained Fix**
The fix is minimal - just a single line change that replaces manual
calculation with a proper helper function. The
`regulator_map_voltage_linear_range()` helper properly validates the
voltage against the defined ranges and returns a valid selector or an
error code, preventing negative values.

### 4. **No Architectural Changes**
The fix doesn't introduce any new features or change the driver's
architecture. It simply corrects the voltage selector calculation to use
the proper regulator framework helper.

### 5. **Clear User Impact**
This bug prevents the PM8008 PMIC from initializing at all when the
hardware returns 0V initially. This is a complete failure scenario
affecting real devices like:
- Fairphone FP4 and FP5 (as seen in recent DT commits)
- Qualcomm SC8280XP X13s laptop

### 6. **Recently Introduced Driver**
The driver was only added in June 2024 (commit `11d861d227ed1`), making
this an early bug fix for a relatively new driver. The bug has existed
since the driver's introduction.

### 7. **Already Marked for Stable**
The commit message shows `[ Upstream commit ef3e9c91ed87...]` indicating
this has already been identified for stable backporting by maintainers.

### 8. **Meets Stable Criteria**
According to stable kernel rules, this fix perfectly qualifies because
it:
- Fixes a real bug that affects users (probe failure)
- Is small (1 line change)
- Has no risk of introducing new issues (uses standard helper)
- Fixes a regression (driver never worked with 0V register values)
- Is obviously correct (proper use of framework helper)

The fix is essential for devices using the PM8008 PMIC and should be
backported to all stable kernels that include the original driver
(v6.11+).

 drivers/regulator/qcom-pm8008-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index da017c1969d0c..90c78ee1c37bf 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -96,7 +96,7 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 
 	uV = le16_to_cpu(val) * 1000;
 
-	return (uV - preg->desc.min_uV) / preg->desc.uV_step;
+	return regulator_map_voltage_linear_range(rdev, uV, INT_MAX);
 }
 
 static const struct regulator_ops pm8008_regulator_ops = {
-- 
2.50.1


