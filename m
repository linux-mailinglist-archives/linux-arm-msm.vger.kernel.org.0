Return-Path: <linux-arm-msm+bounces-26342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61336932735
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 15:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F079CB236D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 13:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC32419AD4B;
	Tue, 16 Jul 2024 13:12:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C450C19AD52
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721135545; cv=none; b=TvQDNg4/EBYGDUu2lsQal9rhUWR8eN5I9kzsCYT3+b46NdpQYLVflvxfovWTWBBslY8yS4lbiOhVRcD7it5ZhyhVQ4iSgGQ2v95wvPZK3FWUSOaaC7Yf5zBTaKu17SRhwsTDC0ivFnQgLrlOjm6/2/qbjkVKKMsvfOVT84Vh6uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721135545; c=relaxed/simple;
	bh=89eKhLjmh9pK9XKXeeHqM39D1cInD+Qdggol4Xw1vBo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AixEck+TAr/yMLbJ/Tra4g0B0rj84piTvCZob86VPHkKRZ7dtb0u+aVhinuA7osI7YkJw0yDmqzxN7u6ffvEV8k0Io8UoYN0pANUGUay1WL/ed8p2V4lQFvgsY1TiOuH8c/5rN+1jybnBlrDBD2UdtdkyGHv/qeFks0ZlAlzAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2ada:8dc9:1826:6616])
	by xavier.telenet-ops.be with bizsmtp
	id oDCG2C0073EiDc401DCGf8; Tue, 16 Jul 2024 15:12:16 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sThyK-002MTq-Fh;
	Tue, 16 Jul 2024 15:12:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sThya-00Fq0z-58;
	Tue, 16 Jul 2024 15:12:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: qcom: QCOM_TZMEM_* should depend on QCOM_TZMEM
Date: Tue, 16 Jul 2024 15:12:14 +0200
Message-Id: <74947f7f132a811cc951749907b01bd25dcf23e6.1721135509.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm TrustZone interface memory allocator is specific to
Qualcomm firmware.  Hence add a dependency on QCOM_TZMEM, to prevent
asking the user about these options when configuring a kernel without
Qualcomm firmware support.  Various Qualcomm drivers already select the
main QCOM_SCM gatekeeper symbol, which in turn selects QCOM_TZMEM, so it
is auto-enabled when needed.

While at it, add "Qualcomm" to the one-line summary for the choice
option, to make it clear this is not related to generic TrustZone
support.

Fixes: 84f5a7b67b61bfeb ("firmware: qcom: add a dedicated TrustZone buffer allocator")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/qcom/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 7f6eb41747346a4f..c607574397e9a7e7 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -15,7 +15,8 @@ config QCOM_TZMEM
 	select GENERIC_ALLOCATOR
 
 choice
-	prompt "TrustZone interface memory allocator mode"
+	prompt "Qualcomm TrustZone interface memory allocator mode"
+	depends on QCOM_TZMEM
 	default QCOM_TZMEM_MODE_GENERIC
 	help
 	  Selects the mode of the memory allocator providing memory buffers of
-- 
2.34.1


