Return-Path: <linux-arm-msm+bounces-87448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C315BCF3E27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37F4330373BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21E025EFBC;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2hGglQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB3A20FAA4;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619964; cv=none; b=Z0S+RPnMuwnNzDvXPdyz6/qWSAT/6KA7+1UcHgguzM/cCESrID8pz2c9gjPJh0IkVUy9I5IYPggNuDPzX9Hx3EiLQGf7k2rlRiyVnvVyVI4Az0OBSu1Il1TBR0hbde80KiTG8QZsiZk7OvtYVYH8YRrCVgLoi0e9XVBOKhOnoaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619964; c=relaxed/simple;
	bh=NwkKySNn7BVIR5kE9tveB2SWe15fk0mP4kndq0EbwdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E6fpQddvdnVOBImBHFrH2uHDgdGDISkiF54sNNz2KtT5tj8DgRk4lhCl08sjE1PCTFIjYBMPhMohXP92GTZf7BMbdQ/E8kICZE49p7B08lA/netsTF7LTFK/93Y/3HK/PZe5DhvI47HOsQpB17cmuqqqte3k53UqV9nF4z2pnOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2hGglQY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 229D4C116D0;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767619964;
	bh=NwkKySNn7BVIR5kE9tveB2SWe15fk0mP4kndq0EbwdQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=f2hGglQY4RMFeJmIVDGGrzbmoEPNrar+n5LN0qYJlSAoqa2s38SOLkh1PWNqEc1ec
	 6DCtLszxTjKIlGFCFFG3vxemT+Yp5ZBQ3EJXgP2/SrNxk3wbdrBbT2Y2dgvKPjWabD
	 ST3vynJMIUXRNd7EtCdQjN3tvTSa/XW72YtcNZidPBp1Y9PNS+lLlGTKGiR2Xql01E
	 cULS/AORavpimO77H65XyjDyb0KbOGbg5pgB2frzWorBT66wLX5malvH1tMjfMRQiD
	 tkMb8NCEeg2eEW9OekWouW44MKnyV8vrFMLTxG6EfB67C948bn9ZdFRn7U32tYa4s4
	 zR8wJ7FZJHpoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F907C79F8E;
	Mon,  5 Jan 2026 13:32:44 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Subject: [PATCH v4 0/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
Date: Mon, 05 Jan 2026 22:31:50 +0900
Message-Id: <20260105-slpi-v4-0-e6e0abfad3a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEa9W2kC/23MTQqDMBCG4atI1k2ZSTT9WfUepYsYRx3QKkkJL
 eLdG6XQIl1+wzzvJAJ5piDO2SQ8RQ483NPId5lwrb03JLlKWyhQBaIyMnQjS2fQkLb6hI5Eeh0
 91fxcM9db2i2Hx+BfazXict0EIkqQDgErOJZka3Vpesvd3g29WAJRfZGC4oNUQlVNUCIYV6PdI
 v0P6YQsagUWDrnOi180z/MbEXiS6AIBAAA=
X-Change-ID: 20251126-slpi-c616e3a391ce
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz, 
 Robert Eckelmann <longnoserob@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=NwkKySNn7BVIR5kE9tveB2SWe15fk0mP4kndq0EbwdQ=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDKj9+Y27Htl8eiaWNXhJrfJf5btOKQtPTFjZ7GAU/ile
 QUOrsdFOkpZGMS4GGTFFFl2uB3TyXRdGrFx9/4ymDmsTCBDGLg4BWAiB+Yz/E9SOZboO2nXyfgr
 LKrX71+PadjfJ6bdIq1g+sPQx2bXfxlGhjllOvyin3o5Dx29z8tUrZTwOOx1wOF3m3n7ch4p5nz
 +xAwA
X-Developer-Key: i=longnoserob@gmail.com; a=openpgp;
 fpr=B846C62C6945A558B1BBBF7630C0D50BEF63BF54
X-Endpoint-Received: by B4 Relay for longnoserob@gmail.com/default with
 auth_id=569
X-Original-From: Robert Eckelmann <longnoserob@gmail.com>
Reply-To: longnoserob@gmail.com

Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.

Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
---
Changes in v4:
- remove not needed status change
- Link to v3: https://lore.kernel.org/r/20251205-slpi-v3-0-a1320a074345@gmail.com

Changes in v3:
- remove stray newline at end of file
- Link to v2: https://lore.kernel.org/r/20251205-slpi-v2-0-dfe0b106cf1a@gmail.com

Changes in v2:
- adjusted firmware paths
- enabled i2c busses
- Link to v1: https://lore.kernel.org/r/20251126-slpi-v1-0-c101d08beaf2@gmail.com

---
Robert Eckelmann (3):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Adjust firmware paths
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and sort

 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 44 ++++++++++++++++------
 1 file changed, 32 insertions(+), 12 deletions(-)
---
base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
change-id: 20251126-slpi-c616e3a391ce

Best regards,
-- 
Robert Eckelmann <longnoserob@gmail.com>



