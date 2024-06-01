Return-Path: <linux-arm-msm+bounces-21379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D75078D7081
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 17:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80B0A1F2211D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 15:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8381E86F;
	Sat,  1 Jun 2024 15:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=danishpraka.sh header.i=@danishpraka.sh header.b="rqZM/y3i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-15.pe-b.jellyfish.systems (out-15.pe-b.jellyfish.systems [198.54.127.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3534D152533;
	Sat,  1 Jun 2024 15:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717254004; cv=none; b=rnu6oF+c6BrFPzIZIRVj6e2UUbR2+QV86chQ/vvyBA/+51vUCW3kknleZVpBPqS6JYD7iM6Z99FooM+E/Koa0w7riAxG3xw5JKWyWxYGE7w8mjmMZeYcz0l1ZXpD0QRvb3wnKNduFKKsimcb8VX00GliEl6VAZNuokcHv+BIcnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717254004; c=relaxed/simple;
	bh=lo3WERO5Od+lCrB7tZFl4JPJAq2xflULTe7KYhW0Ip4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQ5tsXZE/6zlFPRM4G9p80JPB2Up3iQc0nmuGX2lBcd3OCM5xRoYbfyAbbKr7IwXisZcrgNjqoyr+B9XgOsxPGedhkklecfRSmxZ0+SSTxuVC6+WeHnYMZz2rT50Xn02R5ZY/AXGsPSuMHgpJRTW4vzO8wyxU4rHho6yURZGTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=danishpraka.sh; spf=pass smtp.mailfrom=danishpraka.sh; dkim=fail (0-bit key) header.d=danishpraka.sh header.i=@danishpraka.sh header.b=rqZM/y3i reason="key not found in DNS"; arc=none smtp.client-ip=198.54.127.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=danishpraka.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=danishpraka.sh
Received: from output-router-d5c465c44-45n78 (new-01.privateemail.com [198.54.118.220])
	by pe-b.jellyfish.systems (Postfix) with ESMTPA id 4Vs2z80JgnzGq2w;
	Sat,  1 Jun 2024 14:52:52 +0000 (UTC)
Received: from MTA-07.privateemail.com (unknown [10.50.14.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by NEW-01.privateemail.com (Postfix) with ESMTPS id EB84D18000D0;
	Sat,  1 Jun 2024 10:52:51 -0400 (EDT)
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
	by mta-07.privateemail.com (Postfix) with ESMTP id C2E2918000B0;
	Sat,  1 Jun 2024 10:52:51 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=danishpraka.sh;
	s=default; t=1717253571;
	bh=lo3WERO5Od+lCrB7tZFl4JPJAq2xflULTe7KYhW0Ip4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rqZM/y3iohM9HsGn1TL+LI2bnfmZBtSDmTndpPLP5aColQqUihT4nopGxg9WBwE9Z
	 1hB13aEVLuf3WMdV+xW4vqPvHvWIqumpiCEmpmgBJnLTYC96oxrvsPHYMhmaXbmPyb
	 G+uNScvNqe4p9K+z360D+1exRHkQpuVoph96Ng62KovldpxMBMOFMuVmNXIWiTwZns
	 9DAtrZ/FUnhOUfyYLe4UV1aCRL5knt3sP348n/gHXN+OdCkY4sHgemNJA4hj3/Ig1x
	 pIoqtgNbYi17KQa9TGCUb/rd58VI+5iBaXgtVPFE8G+eqzLxb4iYb5dxBJFBjjS2LT
	 IDXsBXgSe9ecw==
Received: from localhost.localdomain (unknown [122.171.21.36])
	by mta-07.privateemail.com (Postfix) with ESMTPA;
	Sat,  1 Jun 2024 10:52:37 -0400 (EDT)
From: Danish Prakash <contact@danishpraka.sh>
To: 
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Danish Prakash <contact@danishpraka.sh>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM CLOUD AI (QAIC) DRIVER),
	dri-devel@lists.freedesktop.org (open list:QUALCOMM CLOUD AI (QAIC) DRIVER),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] Documentation/accel/qaic: Fix typo
Date: Sat,  1 Jun 2024 20:21:24 +0530
Message-ID: <20240601145216.32232-1-contact@danishpraka.sh>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <16b1bcb5-00c6-4b59-a880-188bed32d175@linuxfoundation.org>
References: <16b1bcb5-00c6-4b59-a880-188bed32d175@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Fixed a typo in the docs where 'phsyical'
was corrected to 'physical'.

Signed-off-by: Danish Prakash <contact@danishpraka.sh>
---
 Documentation/accel/qaic/qaic.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/accel/qaic/qaic.rst b/Documentation/accel/qaic/qaic.rst
index efb7771273bb..628bf2f7a416 100644
--- a/Documentation/accel/qaic/qaic.rst
+++ b/Documentation/accel/qaic/qaic.rst
@@ -93,7 +93,7 @@ commands (does not impact QAIC).
 uAPI
 ====
 
-QAIC creates an accel device per phsyical PCIe device. This accel device exists
+QAIC creates an accel device per physical PCIe device. This accel device exists
 for as long as the PCIe device is known to Linux.
 
 The PCIe device may not be in the state to accept requests from userspace at
-- 
2.45.1


