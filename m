Return-Path: <linux-arm-msm+bounces-43517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 077009FD80D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 23:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 904243A04A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 22:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E41412CDAE;
	Fri, 27 Dec 2024 22:48:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net [178.33.251.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B887B80BFF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Dec 2024 22:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.251.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735339716; cv=none; b=idcISA8JT1kg08Nt69HzCYgZbp8rIykiR9vFH+wf+bZAnGSi7Ak3SX0X5KczHBNPaeGXcl5C8wnNikg/rwFppqUY3cUU3SaRD236lH+OZTLDMkYbw6s05ptFnuCGTr/yHkql45MhsijJN5tgmQvjQYQUJhKBg361D3O/ILfT4Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735339716; c=relaxed/simple;
	bh=DxdHL7LIje2MX7oGa/lfMwXrPUrGRfOLbpDUT/+I7wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=igblydFIpxgOcHcsyG4fYVp2uwKC8f8LD5guiBbvlIDnXBqW2oGdyZX5mT3jI8D4hHFewxgoWxQYtSixyO+TqVVToVIt+3HLMCuku3d4Aa7EcwBZLc78CcrCYthApb7NUruevALxxwULSD5LJOR3fmE0u0NTEYcT2q5O8VN0WC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.251.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.2.235])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4YKgHJ5pMmz1rMZ
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Dec 2024 22:32:44 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-mwjd2 (unknown [10.110.164.1])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9905B1FDBF;
	Fri, 27 Dec 2024 22:32:43 +0000 (UTC)
Received: from etezian.org ([37.59.142.107])
	by ghost-submission-5b5ff79f4f-mwjd2 with ESMTPSA
	id iI9sFwsrb2faWgAA37XCKA
	(envelope-from <andi@etezian.org>); Fri, 27 Dec 2024 22:32:43 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S00192d5a8ae-d094-4402-895c-817d716359ce,
                    1CF389E8DC6EE1CDBE94366E1222F406669E166D) smtp.auth=andi@etezian.org
X-OVh-ClientIp:197.26.54.218
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH v3 0/2] Qcom Geni exit path cleanups
Date: Fri, 27 Dec 2024 23:32:28 +0100
Message-ID: <20241227223230.462395-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3101854246940052045
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddruddvtddgudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpedtveeuieehfeetudejhfehleeijedvveetleefhfehuedtleektdevjedujefgvdenucfkphepuddvjedrtddrtddruddpudeljedrvdeirdehgedrvddukedpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth

Hi,

I am submitting two trivial cleanups in this series. The first
replaces all instances of dev_err with dev_err_probe throughout
the probe function for consistency. The second improves the error
exit path by introducing a single 'goto' label for better
maintainability.

Thank you Mukesh and Vladimir for your reviews.

Thank you,
Andi

Changelog:
----------
v2 -> v3:
 - Don't forget to assign ret the proper value.
 - Add tags in patch 1.
v1 -> v2:
 - Updated the final return statement to return 'ret' instead of
   '0' for consistency. Since 'ret' already holds the value '0',
   this change is purely aesthetic.
 - Renamed the exit label from 'err_off' to 'err_resources' for
   improved clarity and alignment with its purpose.

Andi Shyti (2):
  i2c: qcom-geni: Use dev_err_probe in the probe function
  i2c: qcom-geni: Simplify error handling in probe function

 drivers/i2c/busses/i2c-qcom-geni.c | 56 ++++++++++++++----------------
 1 file changed, 27 insertions(+), 29 deletions(-)

-- 
2.45.2


