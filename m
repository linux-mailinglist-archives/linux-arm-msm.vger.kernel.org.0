Return-Path: <linux-arm-msm+bounces-26636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2442C93786A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3D0B1F22707
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADAF13F435;
	Fri, 19 Jul 2024 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WL4x4e7h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072C584D04;
	Fri, 19 Jul 2024 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395539; cv=none; b=EgkciOkT3u88nU/GMP+/9juKYhXZTHnuaFI8sDZfnpwaDY5O+CcnYxHKpHMhYSFPylHAdEnsecnuvJy0VRixmY6Oz6Las9f2aX4gHNotlti6YnKhOjJ9j+whSyfV901HgKJ6zR2dh/c7IFMRQCz/A3mITVMhxhu7csWPveFAyHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395539; c=relaxed/simple;
	bh=0o5HbQ9wksGi48rXOfF8cOei+11f41vTaUmWrHiL+4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EHsXLFYFR4RXchf5ykLjOT7Zxk3x7GWUpODPyYVFIVcbumgH3WS63bVsP+19I5yud5Lcn7nA9PtZONESf5inP3Umhg07fyevxZpQdV2IUnmWERKZMw3N++s8I5e/7PlDyFYIq81JB4gJEmop1VRB4R68mWZ4V5+fQ75TblKc7II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WL4x4e7h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F586C4AF0D;
	Fri, 19 Jul 2024 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395538;
	bh=0o5HbQ9wksGi48rXOfF8cOei+11f41vTaUmWrHiL+4w=;
	h=From:To:Cc:Subject:Date:From;
	b=WL4x4e7h5VZFZduaqYGKVlBr8pNeph6OAcsCnpDuaiSt0lNiTI6B2VuOZIdzTVD93
	 aminKSr8vrb7sf2KH2wdPkFfobexTN18ZdM8sKhSY6yvRLPcG1qibBddrjTkN8FApK
	 PLtld7Sz14FNzv+go5PVzNrQMNU7+H2Tm9zEDBJqNsQmnMQHDnCk59QFuhJp6GL3vF
	 jPk+8hu0HqPmu3CQrNDTKRp3Mm9lfAeDq9LlYXggqvOwgYNEBtbkHelaihYUtstCoR
	 eOy15B/7PrHlyQeyuorQScGf2hLKriuMeVNqa5fpuQiSAKIAQ0p3BAGi7MAgvxTfz+
	 sJ2z83zfZ8I7g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sUncI-000000002Ox-2wkV;
	Fri, 19 Jul 2024 15:25:46 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/4] arm64: dts: qcom: sc8280xp: disable PCIe perst pull downs
Date: Fri, 19 Jul 2024 15:25:18 +0200
Message-ID: <20240719132522.9176-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I noticed that these issues had been reproduced in x1e80100-crd. Ideally
these should go into 6.11 as well.

Johan


Johan Hovold (4):
  arm64: dts: qcom: sc8280xp-crd: disable PCIe perst pull downs
  arm64: dts: qcom: sc8280xp-crd: clean up PCIe2a pinctrl node
  arm64: dts: qcom: sc8280xp-x13s: disable PCIe perst pull downs
  arm64: dts: qcom: sc8280xp-x13s: clean up PCIe2a pinctrl node

 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts        | 16 ++++++++--------
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts   | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.44.2


