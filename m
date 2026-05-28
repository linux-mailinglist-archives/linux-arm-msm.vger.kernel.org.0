Return-Path: <linux-arm-msm+bounces-110047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFbJL/a4F2qwOggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 05:39:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B6E5EC3AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 05:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93BDA3020EDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 03:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF2D3126D0;
	Thu, 28 May 2026 03:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDrd4RbX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537263101B0;
	Thu, 28 May 2026 03:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779939571; cv=none; b=pvWDoHCJNgPoPZKDcnJpBh9das+AykfTtCW8GEn7jPQGVIaca5knK8G03QKeRAOEziF0ykTjHQiz16CflXkYPxyrnCuhmS+E7rAn0EeHowUsp/nT7Pb8FL4IAdrJQX+q6CnOJsXuqGNRFAqRd0/05ZAAXa1f8yfZEdZfaA9DIMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779939571; c=relaxed/simple;
	bh=ke7HvLdLefDj+v9czBNoRTxNhOufQCAgn7Qfxki38Bk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PVpl3hv1mIIMvX1GXs+ZKNbomggjQc8Dqnzujzv7FrmWl7VwsO59WkJ5xzheBo2yffRH/pR89EvIL7hJtLcqW9qW+K72CmhI3iYOk3IS0Vbv4ihhVoOm/bsU5u+ycMDZYw8IpKkl2HqtkkD9oE3LcynsWuxbHbCLm/Q9PKD9lQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDrd4RbX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DD69C19425;
	Thu, 28 May 2026 03:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779939570;
	bh=ke7HvLdLefDj+v9czBNoRTxNhOufQCAgn7Qfxki38Bk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fDrd4RbXmzepZfOCfSdodJmx8RqeZf36eMHZgsxSdKhaP7I/9WVSG4HtV59FnUaVz
	 i2hn+iMeSj/ANXe24FQU+qtdCb9mYlzL53s/b4PLIg+Qc38xspeEAQ4ITw3aBHd8BP
	 L19ty6Q/fclyjTGLzldqNwYoEItWn4x9IRVKVnyP9DPHpv5A6bMvwlkRegYmSLl2qs
	 XWL+GWNTyNvPV7XArek4XWO9dv3eUpN1ct92SZIeUldZblT9KmblXTz/dA7FvFS4Su
	 RmLSwNjLb2uQrKlna4VgVy46HwH6sVA3yZ5OkPdLCqAm6VrcPr7Y7V0s5ONbCKqasE
	 Iva1IKg8CVPfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656B6CD6E45;
	Thu, 28 May 2026 03:39:30 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] Add cpufreq to MSM8960
Date: Wed, 27 May 2026 20:39:27 -0700
Message-Id: <20260527-expressatt_cpufreq-v2-0-b9b7726ccb6d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XQ0WrDIBQG4FcJXs+ixpg0jLH3GCUYPSaypOnUS
 EvJu88kg5Ux6OUv53wH/zvy4Cx4VGd35CBab6dzCuwlQ6qX5w6w1SkjRpggBc0xXC8OvJchNOo
 yGwdfWAiRV62sNC0ESotpwNjrhn6c9pzG5mSH/RGNq7DZdfa606x8oHGYZtV/wg1Hhikm/KiV5
 NSoXL53o7TDQU3j23rrmdQoOYKTjRmk73EUmGANxNCCEMaBP9U4oY+amWFounmdiXmyjqLkyij
 SFpL9sVrpAacw2lBnsTwQtHbRWx8md9v6jnQr46da/l+1MX0e86o0mumyqorj7xF0WpblG1I0Y
 MHAAQAA
X-Change-ID: 20260513-expressatt_cpufreq-66638ba8d156
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Ilia Lin <ilia.lin@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779939569; l=3382;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=ke7HvLdLefDj+v9czBNoRTxNhOufQCAgn7Qfxki38Bk=;
 b=ZHDH7p6//jV4zZAz7g1u6LCwqUGnaKuS7ve3ru1Woi3B+iOxk2F+qYK5VzX+L5omsj/hoedJE
 b23/V/l0MIqBfh7IQpjvbrGDgwzAxqkKdWDEm+p1tWHmdSZJdGWdNPT
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110047-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.989];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,smankusors.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 38B6E5EC3AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Similar to APQ8064, cpufreq is enabled with this small patch series.

Tests:

// Show available frequencies
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
384000 486000 594000 702000 810000 918000 1026000 1080000 1134000 1242000 1350000 1512000
$ cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_available_frequencies
384000 486000 594000 702000 810000 918000 1026000 1080000 1134000 1242000 1350000 1512000
 
// Show current governor
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
schedutil
$ cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
schedutil
 
// set low freq
$ echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
384000
 
// set mid freq
$ echo 1026000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
1026000
 
// set max freq
$ echo 1512000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
1512000
 
// set low freq
$ echo 384000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
384000
 
// set mid freq
$ echo 1026000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
1026000
 
// set max freq
$ echo 1512000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
1512000
 
// SAW2 regulators
$ cat /sys/class/regulator/regulator.*/microvolts 2>/dev/null | head -2
1200000
1150000

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v2:
- undo saw2 compatible rename
- update dts schema
- formatting
- Link to v1: https://lore.kernel.org/r/20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com

---
Rudraksha Gupta (3):
      dt-bindings: opp: Allow optional -vN suffix in opp-microvolt property name
      soc: qcom: spm: Add MSM8960 SAW2 CPU support
      ARM: dts: qcom: msm8960: Add CPU frequency scaling support

 .../devicetree/bindings/opp/opp-v2-kryo-cpu.yaml   |   2 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 129 +++++++++++++++++++++
 drivers/soc/qcom/spm.c                             |  20 +++-
 3 files changed, 149 insertions(+), 2 deletions(-)
---
base-commit: 3131ff5a117498bb4b9db3a238bb311cbf8383ce
change-id: 20260513-expressatt_cpufreq-66638ba8d156
prerequisite-message-id: <20260527-expressatt-touchkey-v2-1-049dca41fc3a@gmail.com>
prerequisite-patch-id: 2b24e9ba47500ef05d38e37b40d8ca2dceb4716a
prerequisite-message-id: <20260527-expressatt_camera_flash-v6-0-de0f150024e4@gmail.com>
prerequisite-patch-id: ab8b8d87fd2d518c4c5b5dace3f22238d1abbe49
prerequisite-patch-id: 466e1f74760f1a5ba7c222d01953aed6ea787390
prerequisite-patch-id: 7ef7df61e7ef6476a35811d765f522f793d9ecc7
prerequisite-message-id: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
prerequisite-patch-id: 27c37aa51fe76043b4998137d106689ed5ae6c91
prerequisite-patch-id: e477ee37abf167c55659f5e591b070b176187ca7
prerequisite-patch-id: 9680b63831f2be63607bff2175639c1987af5e85
prerequisite-patch-id: ee275dc3aec6159072d0a9efb66d18468a72ad57

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



