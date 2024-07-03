Return-Path: <linux-arm-msm+bounces-24958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C99924FB2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C759C1C229BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287B222338;
	Wed,  3 Jul 2024 03:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZS8pyjHo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F8A208B6;
	Wed,  3 Jul 2024 03:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977861; cv=none; b=Db+80MBSHZzdijpVu19tqKYdYUFpkq3dEKbWSm1Vgh681DMyjc0o4MRrP5RJ5rL7vqZOb8JndchkStSbOdz4v1b2AsRaCJ3ixo8SVRfU0ORWU8piVzn0aRO/F1zRfjXq6B5xKpD2+8GlQb5vcjrduro/azVw4osZ2YPRUTiWyDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977861; c=relaxed/simple;
	bh=LDY0wUONNPlXPiOHcu/v0kfKPu9Prik7f6N6f6Hz8UI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BNXR8c45YXdHnrKLfjjCJwUwIrYiX76DjKQKCOD0GHn3xC0DvgBEdQmDoRCYquXKnhrIOTfNx10h4sRJTrJ8lsfVy9GxThkpmytC8/1PtfNRU+JnL1OHU0f6tgKJ2/ZdeyFm3tnI5w81GDK0o5eL7nTT2rPen3udZzhOmTDjHHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZS8pyjHo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0A5C4AF0C;
	Wed,  3 Jul 2024 03:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977860;
	bh=LDY0wUONNPlXPiOHcu/v0kfKPu9Prik7f6N6f6Hz8UI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZS8pyjHoPZq4dCTUggQLXhPJJA3IYkVZHbrPXRaooN1zzywkCgZgeEgmg1ymF9Y3B
	 phGB+5Tk+wXv0noL+lU+R105dHEDICnFzPyyuXpFJGmiryqRtm5ijyRu/O1QvUwpwx
	 ErxIPh7pKibwUCkxqedqMPM2p2/hjEpgYnnvrijqUo58cdc0OWiL5thQjmFYnTSWLo
	 e+/UjakBk7OZk3sbY15O22xNZmR9g0PqQa20hmKWePQiDDn5541Fh2RLl5RFNu6At+
	 BWi7+6y5nRLnOhIGmdnQMaoVXmRsxPo/lqy/pG7lsISTjqy3sUT3FwIhbanmGanT3j
	 JIAkfWaEaT9+g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: sa8775p-ride: support both board variants
Date: Tue,  2 Jul 2024 22:37:23 -0500
Message-ID: <171997785364.348959.11850842213264862621.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627114212.25400-1-brgl@bgdev.pl>
References: <20240627114212.25400-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Jun 2024 13:42:09 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Split the current .dts into two: the existing one keeps the name and
> supports revision 2 of the board while patch 2 adds a .dts for revision 3.
> 
> Changes since v2:
> - use correct phy-mode for Rev3
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: add sa8775p-ride Rev 3
      commit: 9ca49bb26ef64ffd0edd1a037e0b00b8e32617dc
[2/3] arm64: dts: qcom: move common parts for sa8775p-ride variants into a .dtsi
      commit: fe15631117f8d85b1bc4e0c3b434c78be483a43d
[3/3] arm64: dts: qcom: sa8775p-ride-r3: add new board file
      commit: 818c2676e5816dad5a77df5a1c0d99d0e160d0b1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

