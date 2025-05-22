Return-Path: <linux-arm-msm+bounces-59001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F04BAC03FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 07:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C041E1B60FFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 05:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4471624E5;
	Thu, 22 May 2025 05:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+MA0KHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B5813C3C2;
	Thu, 22 May 2025 05:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747891544; cv=none; b=o0TBjaDDQ1LRl9qpCMxHEZLSW+FZO9f3vpFouznW/NNdy2gJyuY/hl4KbrZTOtg4b4lz+LaCH30zHVFYpdo9pdGbydb0hHcuFjEH75g/y1rGUb342AJIESJ8yQ+Zp4ZbnTbly7WapfBumZYnBVEY5xvqf6UR4OzZP4RBARbO/CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747891544; c=relaxed/simple;
	bh=GcQ29PqkQhOZajU7gZeFJhPAP7GSVZz80HHjiyDlmJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tB/y+s4YfTJV8IChlfcL0vWwyrFDc20WPzqEHkguECT8bD2mmDSMKoQixA7OoCu1z8H0WC6b1kqN7A3Mpsq5El18ueWaBHqqilM3pFcXPUL/VWkVOn5Gh2JyCpPR5ybvmy8WEo3Bd5Kl2lqcCG4DgXep+srduxhWEBcDGKPXAgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+MA0KHb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC42FC4CEEB;
	Thu, 22 May 2025 05:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747891543;
	bh=GcQ29PqkQhOZajU7gZeFJhPAP7GSVZz80HHjiyDlmJw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=r+MA0KHbZD0hcbnGYnuPYIvZNWk/efmWp6dZ36BJyWvsmlEu7Ht8vyW2Pyh+NrKdr
	 JGY1LNmZViBmEE8/zKSW9tiDR6pO+jHUtX1t0C5SRDmYYO1vu6e/dXNs4prIqTNjcz
	 IxgDdhMxpb+BQjl3yONO8V7oNXSV2KHCqaZ01J0JIiMt9v5VlB6j3dSopS+sp/RkY6
	 9rLpCgTvCHS7Npo/JUXZ1gdMSqyl6khCGIjlnSCMkN4YlyQaKapZHWFNd73k0gieQi
	 UiXtXbbd+cAOEiDbkp+pCUbnkveucNYEB3dnPHynkXSHnSeKp4HzHY0CEWr5SfSxOR
	 LHyamgKf7u4Gg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F9AC54756;
	Thu, 22 May 2025 05:25:43 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+fenglin.wu.oss.qualcomm.com@kernel.org>
Date: Thu, 22 May 2025 13:25:27 +0800
Subject: [PATCH] mailmap: update email address for Fenglin Wu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-update_mailmap-v1-1-4176bc0765c0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEa1LmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMj3dKClMSS1PjcxMyc3MQCXbMUIwNzEwNL8zQLUyWgpoKi1LTMCrC
 B0bG1tQA22/JUYAAAAA==
X-Change-ID: 20250522-update_mailmap-6d2074097f85
To: Bjorn Andersson <andersson@kernel.org>, kernel@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747891542; l=1082;
 i=fenglin.wu@oss.qualcomm.com; s=20240327; h=from:subject:message-id;
 bh=1NkkIYA1fD3jjn3mWE8Axbp3lyQ/V9+qH0smQGVHfMw=;
 b=Elx97E/qpeLvqm0wgHi/D/CVTtPYDk/hA3DHUTdMcxJ4tzMUrttx+obozqqIWuMrmvftP5r7p
 1rOrqEaM2WUDlDiTd9sVbLxbLLNWJMs6GlP1ixfNUfm3N2dCq/wJ+yh
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=BF8SA4IVDk8/EBCwlBehKtn2hp6kipuuAuDAHh9s+K4=
X-Endpoint-Received: by B4 Relay for fenglin.wu@oss.qualcomm.com/20240327
 with auth_id=406
X-Original-From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Reply-To: fenglin.wu@oss.qualcomm.com

From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Qualcomm is migrating email address from quicinc.com to
oss.qualcomm.com.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 60f8ed80ec109924bf73d36c0b8b232cfe68b9a6..a05a67d554bd35f71fc4f460d94490bf58af93e3 100644
--- a/.mailmap
+++ b/.mailmap
@@ -234,7 +234,8 @@ Felipe W Damasio <felipewd@terra.com.br>
 Felix Kuhling <fxkuehl@gmx.de>
 Felix Moeller <felix@derklecks.de>
 Feng Tang <feng.79.tang@gmail.com> <feng.tang@intel.com>
-Fenglin Wu <quic_fenglinw@quicinc.com> <fenglinw@codeaurora.org>
+Fenglin Wu <fenglin.wu@oss.qualcomm.com> <fenglinw@codeaurora.org>
+Fenglin Wu <fenglin.wu@oss.qualcomm.com> <quic_fenglinw@quicinc.com>
 Filipe Lautert <filipe@icewall.org>
 Finn Thain <fthain@linux-m68k.org> <fthain@telegraphics.com.au>
 Fiona Behrens <me@kloenk.dev>

---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250522-update_mailmap-6d2074097f85

Best regards,
-- 
Fenglin Wu <fenglin.wu@oss.qualcomm.com>



