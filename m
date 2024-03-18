Return-Path: <linux-arm-msm+bounces-14404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C7587EBE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 16:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 002A928403F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 15:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACAB4F214;
	Mon, 18 Mar 2024 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDyoLoWO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E58D4F1E1;
	Mon, 18 Mar 2024 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710775096; cv=none; b=b/dJZ962fBcsYaI4ugHmJkGazEjVxSrV2JJesc1iFVKdTjiAuo37wyKyzRVGxFRbDFpXqmPeu/9j+WyBBDD9Gylu8E3V4qocI31NqGaoAdHGcFoTis1FGOywkzuzH3MnVQG63LqDmo0rzfUvPVq6RhnV5NoL4er6gKAWY5lKLMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710775096; c=relaxed/simple;
	bh=oC5+asc/QICklzkaAGgwcBOXlJD1QTbEuepLI6tiLK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DfYOVcqluAXuwchRfpSf0mcDRiT7Fo+MSlzQtOP/0uvCKCRTWbueR3cQDHx0vMyDJWKqIr5ZQ0ttt1fNYBYkN5JVB9FWh6PkBl++BnOrJtruUHfkImEd9WJIaLcJP2Pr7AHlc1rDg2xiNgS18E0YvXqRw3vaJpFT4Oje+OlFCEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDyoLoWO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DB4C433F1;
	Mon, 18 Mar 2024 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710775096;
	bh=oC5+asc/QICklzkaAGgwcBOXlJD1QTbEuepLI6tiLK4=;
	h=From:Subject:Date:To:Cc:From;
	b=mDyoLoWOWiCMEdXkx9n4YUsSumpF7e0vY4o0+dcywNoZYOFhQJu8b+BBfWUJNmVXW
	 8qIKWvn/+20UknH5eve3jLM+/c0KsletfNrB0YU5do/uij0otwMNu+Bx9uSFmin/8U
	 Chp/ydjf2qDxKbOoFiwuvrM5AtFWR9HbYbDkBo0qzwDnnitfjK6IGcTwUtjRMUvpg4
	 DXKiUuXQ3EToJttPodl88lTjWY4ZazZb2sL+dZS+czu+gBpUA3t0VwRruaaKvgOPeM
	 nwwHWkJi1hVy+iU1jnbVpL1Z2KMJlfA671AGWoQHVp8w/6oui+X4slGzDxSdv/a6C6
	 +UxULlQSoRhnw==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] clk: qcom: Fix two driver Kconfig dependencies
Date: Mon, 18 Mar 2024 08:18:09 -0700
Message-Id: <20240318-fix-some-qcom-kconfig-deps-v1-0-ea0773e3df5a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADFb+GUC/x3MSwqAMAwA0atI1gb8FFGvIi40pjWIrTYggnh3i
 8sHwzygHIUV+uyByJeoBJ9Q5hnQOnnHKEsyVEVlirps0cqNGnbGk8KOGwVvxeHChyJRN3NnbFP
 PE6TBETnV/3wY3/cDQTKEwWwAAAA=
To: sboyd@kernel.org, andersson@kernel.org
Cc: konrad.dybcio@linaro.org, mturquette@baylibre.com, 
 bryan.odonoghue@linaro.org, neil.armstrong@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=919; i=nathan@kernel.org;
 h=from:subject:message-id; bh=oC5+asc/QICklzkaAGgwcBOXlJD1QTbEuepLI6tiLK4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKk/os3W/5/js5uf9dIj70fWxW9K/h8vOOhSxFT+q3TyL
 +d13LNDOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEYmQYGWZIrzavPbZ00eln
 4nzXusULZRc9r3fbff13z0XNXUpLar4yMjzdeSKaZc7qN4Kcfvkfuz5/e2ufbzl5lewq/jMXN3M
 /1+EBAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

This series fixes two Kconfig warnings that I recently saw crop up in my
build tests because the dependencies for newly added drivers in 6.8 are
not correct.

This is now the fourth set of changes to avoid warnings of this nature
for the exact same reason... is there anything that can be done to
ensure this does not continue to happen? See

  b6bcd1c0c27e ("clk: qcom: fix some Kconfig corner cases")
  75d1d3a433f0 ("clk: qcom: Fix SM_GPUCC_8450 dependencies")
  e8d66d02defd ("clk: qcom: Fix SM_CAMCC_8550 dependencies")

---
Nathan Chancellor (2):
      clk: qcom: Fix SC_CAMCC_8280XP dependencies
      clk: qcom: Fix SM_GPUCC_8650 dependencies

 drivers/clk/qcom/Kconfig | 2 ++
 1 file changed, 2 insertions(+)
---
base-commit: 3066c521be9db14964d78c6c431c97a424468ded
change-id: 20240318-fix-some-qcom-kconfig-deps-cc9be94f63ba

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


