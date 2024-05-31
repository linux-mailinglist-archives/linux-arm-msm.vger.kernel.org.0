Return-Path: <linux-arm-msm+bounces-21194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C70D8D5A71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 08:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DC831C21264
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 06:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76A07D07F;
	Fri, 31 May 2024 06:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=danishpraka.sh header.i=@danishpraka.sh header.b="CZ9uHnDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-06.pe-b.jellyfish.systems (out-06.pe-b.jellyfish.systems [198.54.127.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A62B28DA5;
	Fri, 31 May 2024 06:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717136402; cv=none; b=u08Ajc9+SI6yUgdG9IwgHS05MwriZbsI6bJ6f9CE5pdz0rwlJlPJHzaS9oTF06GEvp27XN0S+GmMKnYW2ITHl5VANdS+RxiSlxNLCbJGNkZMtKk3NBN6w/kYFHXfW1JMdATe2yTz/dNz7JWYDIGaPAkcIWnB/mlamURD9I/vK2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717136402; c=relaxed/simple;
	bh=jgp/6vz5V2JFZNzmdgRvgt76fGnP/p9jwDavyuTA2x4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IdZ2eK9nCopgySIn4ZZbNBeXAoT4p7VQ/x/HQCSZhWbpc2xk6HSXDv4c+hNlsGSftEBzWBaHu8i8S9TNts8xy4R+XYcb7ipse6ujJ7VvCgU0W0BZ6k/Tq4z2ZTA8K9GPx7yOSDK8jz+lwiV4mxCmn4xz+inVt/+YoXrQVAR8irk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=danishpraka.sh; spf=pass smtp.mailfrom=danishpraka.sh; dkim=fail (0-bit key) header.d=danishpraka.sh header.i=@danishpraka.sh header.b=CZ9uHnDW reason="key not found in DNS"; arc=none smtp.client-ip=198.54.127.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=danishpraka.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=danishpraka.sh
Received: from output-router-d5c465c44-d7pgd (new-01.privateemail.com [198.54.118.220])
	by pe-b.jellyfish.systems (Postfix) with ESMTPA id 4VrCQX2qQmzFpjr;
	Fri, 31 May 2024 06:10:12 +0000 (UTC)
Received: from MTA-11-1.privateemail.com (unknown [10.50.14.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by NEW-01.privateemail.com (Postfix) with ESMTPS id 53FA918000D0;
	Fri, 31 May 2024 02:10:12 -0400 (EDT)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
	by mta-11.privateemail.com (Postfix) with ESMTP id 26E3018000AB;
	Fri, 31 May 2024 02:10:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=danishpraka.sh;
	s=default; t=1717135812;
	bh=jgp/6vz5V2JFZNzmdgRvgt76fGnP/p9jwDavyuTA2x4=;
	h=From:To:Cc:Subject:Date:From;
	b=CZ9uHnDWJwYV0T89EfGrrHtbGYozHYy7/V6P5ziIKYLiwWAcT0ptbB0rXP5NAr9QG
	 /Y9gKDGMzA74quXo5RDeOLrnidvSsA7e6FsYcQMa0I91iP9T+Drsh9SX6zRWX768Wy
	 w1JAZq8fNAVLlOeX6+QS1cexlR4hcfNWnEGztFHD/F08MZ8mJ9l17kYgLshM2FmfTz
	 SapSqOY81rlF5vYnF/CsqhijsQ3SdQGkm+rWed1SaMd4uImzQksFEdDTZoO9k3R1wv
	 9GT9umEKVAXcmAiUUyLCmnBgs501S62DCBDfgDfZJIL6cYhHC9hSXHAh8GrFiEAHer
	 syfTGYslsolwQ==
Received: from localhost.localdomain (unknown [106.196.30.82])
	by mta-11.privateemail.com (Postfix) with ESMTPA;
	Fri, 31 May 2024 02:09:55 -0400 (EDT)
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
Subject: [PATCH] Documentation/accel/qaic: Fix typo 'phsyical'
Date: Fri, 31 May 2024 11:39:26 +0530
Message-ID: <20240531060929.5281-1-contact@danishpraka.sh>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

(as part of LFX Linux Mentorship program)

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


