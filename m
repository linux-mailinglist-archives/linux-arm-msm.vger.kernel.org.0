Return-Path: <linux-arm-msm+bounces-41754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 399999EE881
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0552D2822F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 14:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5D32139C9;
	Thu, 12 Dec 2024 14:12:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 13.mo584.mail-out.ovh.net (13.mo584.mail-out.ovh.net [178.33.251.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3339211A0E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 14:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.251.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734012728; cv=none; b=EftdXjmt6202OVt3CGgQF0nHp2HdlalvzsBr2Jy0AEtP+GuAb4mMmx1mc6aJh1nCtmfsMPXaQy525HZABQxvm9tIXGY4gRRSMhpI4DDhYFad3NrP4qQXehK52tGJXvGUseFyKkzsdm84twofg7ysimUjBfwfHPsAV84tDCidYTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734012728; c=relaxed/simple;
	bh=ZpKue6r4eSqHb+2lWRYfZYYoTjy7HSoiuGKtYVz9IMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O7+/4j+aKhc7ibdTYHycZOFfinsB2VFaGSzCYvWxxb5BraWYT86vDhm9F6TEcRkp0+Ky4kd72qglzRZHac0UdzFwtqTvkx34+K59MQ/P92tPynrGcUvGL+a9HN1YRU4ECSmVBzDJKNOqtTVq7fUCYLH/1XJn8396Hg0CU8ny6Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.251.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.9.3])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4Y8DVN4qmfz1TD8
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 13:54:36 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-ks6hw (unknown [10.110.178.25])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B94391FD4F;
	Thu, 12 Dec 2024 13:54:35 +0000 (UTC)
Received: from etezian.org ([37.59.142.110])
	by ghost-submission-5b5ff79f4f-ks6hw with ESMTPSA
	id gDzDGBvrWmfP8QcAwrclww
	(envelope-from <andi@etezian.org>); Thu, 12 Dec 2024 13:54:35 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S0045e79d698-0c10-4535-8aa3-c02f7cae5ccf,
                    7E8E14E11F102121CE247F47C6B4DBC0808239E0) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 0/2] Qcom Geni exit path cleanups
Date: Thu, 12 Dec 2024 14:54:14 +0100
Message-ID: <20241212135416.244504-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16941415900673673799
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnheptdevueeiheeftedujefhheelieejvdevteelfefhheeutdelkedtveejudejgfdvnecukfhppeduvdejrddtrddtrddupddujeekrdefledrledtrdelvddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekgegmpdhmohguvgepshhmthhpohhuth

Hi,

I am submitting two trivial cleanups in this series. The first
replaces all instances of dev_err with dev_err_probe throughout
the probe function for consistency. The second improves the error
exit path by introducing a single 'goto' label for better
maintainability.

Thank you Mukesh for your reviews.

Thank you,
Andi

Changelog:
==========
v1 -> v2:
 - Updated the final return statement to return 'ret' instead of
   '0' for consistency. Since 'ret' already holds the value '0',
   this change is purely aesthetic.
 - Renamed the exit label from 'err_off' to 'err_resources' for
   improved clarity and alignment with its purpose.

Andi Shyti (2):
  i2c: qcom-geni: Use dev_err_probe in the probe function
  i2c: qcom-geni: Simplify error handling in probe function

 drivers/i2c/busses/i2c-qcom-geni.c | 55 ++++++++++++++----------------
 1 file changed, 26 insertions(+), 29 deletions(-)

-- 
2.45.2


