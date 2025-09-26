Return-Path: <linux-arm-msm+bounces-75328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D96F7BA43F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 16:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75D6B1C077E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 14:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6230014B953;
	Fri, 26 Sep 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVcu420t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A00B28695;
	Fri, 26 Sep 2025 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758897342; cv=none; b=jM1zxZyixXKgkIWJ/JipTvCeG8yj7nerZFzanWUHQu59FkEPIwulhMUE9S52Qn/Sgwa3gGunw+V3MjNmLZAOeeZqNr22axiFoJqbQQLOwj96grUaot9RJ0AfNKrMVexKUjyYKJPwi5LOaQDkAbHFALb/pJ3fWk55sgNBAe9wVeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758897342; c=relaxed/simple;
	bh=4ErWGllig68MIzmkI1+71mpcjf3nSLa/cjV31w8WLmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LKT3uLlfprupIGUoSbNhK7LtZ8hLmiOOjvPv51EKNzEdD5xkNenpYUYsO2WiwI6iQTVYFlGYuI2twz58DfnoZNG5Soc7He3MVMCZp6sjahClxQ23PhS+zDmnbZmFSH4xIrmu2MhCIae6iQ8T8SpnM+XVOj+MZ4PSwoYfOBT0VT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVcu420t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1465C4CEF7;
	Fri, 26 Sep 2025 14:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758897341;
	bh=4ErWGllig68MIzmkI1+71mpcjf3nSLa/cjV31w8WLmQ=;
	h=From:To:Cc:Subject:Date:From;
	b=YVcu420t5lkha48JafLN6zkUoDbPlihkxhVlptSmDZ5MPmAH38Dnc4brLmX1/vRJD
	 VNueQeGAmXdtpZiec7Q0fHmzcI2TT/GpVvwh8XgrTJtolO4smauF37cXgCvdvqKHI/
	 NjFzM9PrjQvprwQsTyB2ITXRwuRZfc3CGQQUr+hcl7/0vqZ06NPtUdJkjEY/cPLJ8t
	 wu5it6mLdhRkK/ybhN9h7GFORLhzoNtOBGC5ZSVjeW/ujCwgk560jqTut7HaaGTfA7
	 FQOl9uGJ2dZ9ZifoWCb3UOdUyFrYsr2LhLh+T4jOSsVUEnfMpA/F7GTPjWLKqmg4kI
	 1WY+Yc9tR+8LA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v29Xr-000000001kt-1pL7;
	Fri, 26 Sep 2025 16:35:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] soc: qcom: ocmem/pbs: fix device leaks on lookup
Date: Fri, 26 Sep 2025 16:35:09 +0200
Message-ID: <20250926143511.6715-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes device leaks in the Qualcomm SoC drivers when looking
up platform devices using of_find_device_by_node().

Johan


Johan Hovold (2):
  soc: qcom: ocmem: fix device leak on lookup
  soc: qcom: pbs: fix device leak on lookup

 drivers/soc/qcom/ocmem.c    | 2 +-
 drivers/soc/qcom/qcom-pbs.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.49.1


