Return-Path: <linux-arm-msm+bounces-76771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9D3BCC84D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 12:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AF2419E44A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 10:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C74283C82;
	Fri, 10 Oct 2025 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Plo3O7kl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2790E283129;
	Fri, 10 Oct 2025 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091908; cv=none; b=pqQZrhhpHP8gC/h2sXhrVvZdauQCNB8+Uyu+hYQQ98p7qzTtuFC/7iwbO3Hz7tAtLQJ10GsB892AUkiby2AiGEoMxjqL7jik+nUoCmStLswGIbTr7XY195RN0udeZBcv50DIVNentKsX88xjCwId/+1bm4hmND7kRakoIt0hY4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091908; c=relaxed/simple;
	bh=hP9FbED6Xms3uHSeVYNdOq3+y/08o5FPHKDtitOhj/E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YmUcMnh8Z2ZD3CN1dS4Kw0ZSe1IPcB1UQe72zLwuMIfEYav2w36Jw9R0gv5r8GqYv9pe4yFLfYWYJ+antvK4U3HJc/jHoSXIMqGlHqwE078NndNaowg8rNwJ4m5rc5eNUFFlLNQJYZ4Vz8HyYkqw3vrKbxgFXXAcM+39Fk51dd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Plo3O7kl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFCFC4CEF5;
	Fri, 10 Oct 2025 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760091906;
	bh=hP9FbED6Xms3uHSeVYNdOq3+y/08o5FPHKDtitOhj/E=;
	h=From:Subject:Date:To:Cc:From;
	b=Plo3O7klkbPvvfHQOUHwkeivDfXrldFeLW/4+Pr2sMrXcsZ1pvxbT4rjeSRw6LUH3
	 Hn/ZSvLSlYcdqBRIaPjY2Q3QUU1NYOLQYKIhv+D3qVDrwZF1Fhcp9CUBXbH8ZV1YNE
	 Ty/HC+BC4EMfs5D909VLPwV3oc4TZwRdXTmFScEo2MmT9zxHyLvLvkWUcLN6MTb4pK
	 /SOOXZ0krdWvreIJHiOfL1HgX0TZy3j8YjH7kf79Ks+ICGASEAvpl3Q1DU9RvehJFk
	 HmTy6wUjvOh5Fm7E6mLlWhfiOmEV2cqDGmGtuh2gaEVJSyvWWYPEziky8esern5ldc
	 Joj3G0Po6TLqA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] Drop unused USB4 master clock frequencies
Date: Fri, 10 Oct 2025 12:24:49 +0200
Message-Id: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPHe6GgC/x3MQQqDMBAF0KvIrBvIBO2iV5ES6vi1s4maaUQQ7
 27o8m3eSYasMHo1J2XsarqkCn40JN9PmuF0rKbgQ8eevfstq4qbRWKxoY0lFcMYp4zNBXgeuJN
 naEE1WDMmPf55/76uG0K2iA9sAAAA
X-Change-ID: 20251010-topic-gcc_usb4_unused_freq-2e01b15c624e
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760091904; l=828;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=hP9FbED6Xms3uHSeVYNdOq3+y/08o5FPHKDtitOhj/E=;
 b=UDV8izPvGJePSNzYvJcY4t1SuMy5c/HMWClNjqDsAs1L6anaBKCD8ibaNRI5C36BJthfg0zA+
 cki9eRVbr13B078Y0sDU5mYuNQPBbKT4U5laJZVCKyCs+vdJhAWnzZC
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The lowest frequency remains unused in practice across the board,
remove it from the frequency tables to reduce confusion (both user and
possibly software..).

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      clk: qcom: gcc-sc8280xp: Remove 85.71 MHz USB4 master clock frequency
      clk: qcom: gcc-x1e80100: Remove 85.71 MHz USB4 master clock frequency
      clk: qcom: gcc-glymur: Remove 85.71 MHz USB4 master clock frequency

 drivers/clk/qcom/gcc-glymur.c   | 1 -
 drivers/clk/qcom/gcc-sc8280xp.c | 1 -
 drivers/clk/qcom/gcc-x1e80100.c | 1 -
 3 files changed, 3 deletions(-)
---
base-commit: 0b2f041c47acb45db82b4e847af6e17eb66cd32d
change-id: 20251010-topic-gcc_usb4_unused_freq-2e01b15c624e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


