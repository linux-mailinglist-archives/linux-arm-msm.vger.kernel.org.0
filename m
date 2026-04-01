Return-Path: <linux-arm-msm+bounces-101203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GrkNfOOzGnXTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:20:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F6F37433A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 05:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B72593070014
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 03:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F093806B8;
	Wed,  1 Apr 2026 03:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="lFv8scxc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9FE37F8D3
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 03:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013365; cv=none; b=thK/xPnM37ywUvSBQ9k/WQg6NwBgHvhiD7OqH4zB7eGmrPYUNPMxN09FV1oCKGSsbRJyiwJmHqXJpdAvHSWg2e1oC72MFiNw7pgCylcQe8sqiA7kquD77kG7zL5Cb9al7XmmWxfs53FAvAVIxVK7UrU9bVS/2lW7dZw9iFflCeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013365; c=relaxed/simple;
	bh=3Cg+LNqweQ6c1bsyjxzyjVlWx4GC5+id9Gc5bYkRg2U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A66gjEvnJFhZhW0WsZpsHkwiI/5uEB36afqWxo7zsQJTyFIbXCh+7mYEnuAOWn3PAal9uiOqS84oMJ35dYz+rcD+9e6EDwiGGWOxG1ivgD0o6m15rgskXoqqZYSEmAd9y8Vx5PU63pvTbPAgFmq4KgDgVUw4kVwegf/PUSVeUZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=lFv8scxc; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jT1Ep2dNDtPyO+bNApnNtdUbbiWrC7hl5nQUJtP/iqo=;
	b=lFv8scxcK11ddki7+05AhL9tJYA0ycEFjAducqb3KRG0Rflzdzd0XX6qxVd8q0GiLT3SYa
	huWEsKhv1urPq9jqxtf6aTZ9p+wz9wbVj7FLfcn6Bhbvqf+PL14JSRSShOmneHESwhn3hK
	PQdSe9fRyItRoeo632tIFhfN6Yg9+YcJMGjlqd1tqD5DbQDE9ZjkdjsivjSeme8aRLQFGx
	gFHF8ZNmPYQw5rFXpc2JdsJ5zVNLLwiru/wXKFk5oVRW4IngRVLH3oL4Ly3Z4OQ3ee/Pbb
	yFBm1i4ko4IlhDnGYUl6f9MKnW+gk5dIEZL+b4IL1FpXRK3u3CLNyepJ2CibYw==
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH v7 00/15] arm64: dts: qcom: sdm845-lg: Improve hardware
 support in devicetree
Date: Tue, 31 Mar 2026 20:15:05 -0700
Message-Id: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQ3U7DMAwF4FeZck2Qnd92Qoj3QFwkqbsVtnYkX
 cU07d3Jug1WQS+PLX+yzpElig0ltlwcWaShSU3X5mAfFiysXbsi3lQ5MwFCQ4nI3/fVYdPyqk8
 cbVBIuqwC1Cwf7CLVzdeIvb5dcqTPfTb7y5BtKSU3msvF05WEG7lzLW34gBx5IXSwSoH03r/su
 tRvXfygvkuPXVw9szO+blLfxcP4+ICjfgXl/Y+ZAy6kV97aEqpAf7hRG8S9YCaCyIImNGRAGOn
 qGUHeCaKYCDILHlWoSypdXs4I6kdAFHoiqCw47QxoAC+MnRH0ryBg2oPOQgEB6zq4QhVzgrkJB
 qSYCubcZFlZCA6NxvCPcDqdvgG6VnFRUgIAAA==
X-Change-ID: 20250911-judyln-dts-17c41e59dc0f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pavel Machek <pavel@ucw.cz>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013347; l=5079;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=3Cg+LNqweQ6c1bsyjxzyjVlWx4GC5+id9Gc5bYkRg2U=;
 b=LffKWDeRCXRS3cGke62M5mJhKqYPYnDFkRK0sAIcvxg6R4g3tfyv2gOcGS/Hw8reN+FjNQnur
 VpGGWEXZYz2CePmbZHWLiTk2SGJT0ZU5bTMnMd7MpbOfLXfmSuIWbDW
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101203-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,postmarketos.org,oss.qualcomm.com,ucw.cz];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tuta.io:email,postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid]
X-Rspamd-Queue-Id: B0F6F37433A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rollup of improved hardware support via devicetree for LG G7 ThinQ
(judyln) from sdm845-mainline kernel fork

Notably, this patch-series enables full DRM acceleration and wifi,
among other small improvements in individual commits

after this patch-series the main things that remain to be worked
on include touchscreen, audio, and modem.

Depends upon panel driver patch-series https://lore.kernel.org/all/20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org/T/#r9a976ca01e309b6c03100e984a26a0ffc2fe2002

Co-developed-by: Amir Dahan <system64fumo@tuta.io>
Co-developed-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Amir Dahan <system64fumo@tuta.io>
Signed-off-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Changes in v7:
- Reorganize commits
- Add firmware-paths for judyp
- Reword framebuffer reference commit message
- Squash qups and dma-controllers commits
- Link to v6: https://lore.kernel.org/r/20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org

Changes in v6:
- Mistakes were made with b4 and branch was rebuilt, hopefully correctly
- Split more things that got mixed into the sort commit (qups and venus)
- Added more backlight properties from downstream
- Framebuffer added back in
- Update compatible for panel
- Add qcom,te-source
- Reference memory region in framebuffer instead of reg
- Correction to rmtfs_mem
- Set lab/ibb to 5.5V
- Fixed flashlight/torch
- Update commit message for gsi-loader=self
- Update LG to capitalized in firmware paths
- Remove qcom,snoc-host-cap-skip-quirk dependency (break wifi)
- Enable dma controllers
- Link to v5: https://lore.kernel.org/r/20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org

Changes in v5:
- update system64's email
- reduce lab/ibb voltage range
- status should go last
- remove rebase leftovers
- fix flashlight
- Link to v4: https://lore.kernel.org/r/20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org

Changes in v4:
- add panel identifier in addition to ddic
- make sde_te pull-down
- fixup flash current
- remove framebuffer reserved-mem
- remove manual lower guard
- depend upon https://lore.kernel.org/all/20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz/T
- reword commits
- Link to v3: https://lore.kernel.org/r/20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org

Changes in v3:
- change firmware paths to lowercase 'lg' (matching dt-bindings)
- fix signoffs
- add wifi dmesg to commit message
- remove regulator-always-on from ibb
- remove framebuffer
- remove msm ids
- don't continue commit subject into commit messages
- split bluetooth node
- add sbu uart details to commit message
- change ipa gsi-loader to self
- Link to v2: https://lore.kernel.org/r/20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org

Changes in v2:
- sort at the start
- drop unnecessary labels
- drop unnecessary gmu
- multi-led
- split fb-panel changes
- expand upon firmware commit message
- use qcom,calibration-variant instead of
  qcom,ath10k-calibration-variant
- change firmware paths to include "LG"
- remove framebuffer reservation
- add lab/ibb

- Link to v1: https://lore.kernel.org/r/20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org

---
Amir Dahan (1):
      arm64: dts: qcom: sdm845-lg-common: Add LEDs

Christopher Brown (1):
      arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger

Paul Sajna (13):
      arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
      arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
      arm64: dts: qcom: sdm845-lg-judyp: Define firmware paths for judyp
      arm64: dts: qcom: sdm845-lg-common: Enable venus
      arm64: dts: qcom: sdm845-lg-common: Enable qups and their dma controllers
      arm64: dts: qcom: sdm845-lg: Add uarts and Bluetooth
      arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
      arm64: dts: qcom: sdm845-lg-judyln: Add display panel
      arm64: dts: qcom: sdm845-lg: Add wifi nodes
      arm64: dts: qcom: sdm845-lg-common: Add chassis-type
      arm64: dts: qcom: sdm845-lg-common: Add camera flash
      arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self', add memory-region
      arm64: dts: qcom: sdm845-lg-{judyln, judyp}: Reference memory region in fb

 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 228 +++++++++++++++++++------
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 129 +++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   |  30 +++-
 3 files changed, 319 insertions(+), 68 deletions(-)
---
base-commit: 674feabdc26e80c4dbc884d7b6e2d2a4b93919e6
change-id: 20250911-judyln-dts-17c41e59dc0f
prerequisite-message-id: <20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org>
prerequisite-patch-id: e51151ea7f8fdad6ad7d90713febc5c6b6fc4f9c
prerequisite-patch-id: b3dd44250da9cd12bc5b2d0d7e865dbe19ceed92
prerequisite-patch-id: fd6c8077806cb03fcf37d0e0d730314c2760e334

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>


