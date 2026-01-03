Return-Path: <linux-arm-msm+bounces-87326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721FCF03A3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 18:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5470C3013E92
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 17:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3241FCF41;
	Sat,  3 Jan 2026 17:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mo02qr2L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7A3C0C;
	Sat,  3 Jan 2026 17:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767462710; cv=none; b=je+86fu41bbd5jG6o/fOHkKmAkXMZ49975c8ul7vSx8IZvVM8wljAffKZw143opbyaDxIdkjUXhlBVb3g57X3ONKaISD5hHRD7/tmYneDGGb+7Ch2YMtdtaC8Z7LjXsuwJ4KDicguXhucFURcwAMGrUNtyAoMbSBu5BcRfoKX1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767462710; c=relaxed/simple;
	bh=xXJKn5ZjwF7cucJKs57KLIIFIjOY8BG7KX2LwIV5UHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hoMf06pXYzokj8jR3879pbyX93IqvssEMesVrDTW72C2zUliL4MNDuz6FuK1YLcj8aDUCWGgMEcHQd4Xpn8EBSYy+jxq9tbNXunX5rpGcC3IYniICqd6bMUR9ALtd8z6Giu+J1x6FNuMASTqbwPbhwatqTzI58gWYgjNpife+bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mo02qr2L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A73C113D0;
	Sat,  3 Jan 2026 17:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767462710;
	bh=xXJKn5ZjwF7cucJKs57KLIIFIjOY8BG7KX2LwIV5UHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mo02qr2LnmjN/shdvtHi0oj7SHQ/h+fDQSV811zWsLAV74WtqR8PasHuMQ5TfFNGj
	 /57g4C43HzaXR/5lK0tJJQkTP9txeH8wO5lCEQtUrH35hoOSdpEx+L6DXKHRbnX8w9
	 QFp/OXTBY6j0sgOkYpU0gn5K1JFRXNRY4wS4J6W193Wakmge9kcH5EYqrkk5xd8TwI
	 mj0lJE/TXrG0tIOnYkt2UiSytgHdLe1uwzkC/9v59LmOYQQLY7Y99+7uiyR538flpA
	 qCusaIIuHKzPXlF3pIPzgzzqDRGOWXkPnZtNcU240qEYDRStD/2mONs4foD9wnkXa/
	 qrGyOH5PxYWMg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] sdm845: Update firmware paths
Date: Sat,  3 Jan 2026 11:51:42 -0600
Message-ID: <176746270357.2648843.16986204903349256474.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
References: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 22 Dec 2025 20:05:36 +0100, David Heidelberg wrote:
> Update the paths for phones, where there are no patches pending which
> includes the firmware path update.
> 
> I haven't touched the sdm845-mtp and db845c intentionally.
> 
> After merging, I'll notify distros and send MR against droid-juicer.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sdm845-oneplus: Update firmware paths
      commit: 29e87dc07d705bd92d57fff77703ca272779e6a0
[2/4] arm64: dts: qcom: sdm845-axolotl: Update firmware paths
      commit: 5eac5422c0c0a8a14800405b658e99beaacf90de
[3/4] arm64: dts: qcom: sdm845-samsung-starqltechn: Update firmware paths
      commit: 7e46a9c78880f4a7589bb31f8887ea3edb0596b4
[4/4] arm64: dts: qcom: sdm845-xiaomi-polaris: Update firmware paths
      commit: 86057e01967b8eeb8604904322003de044528e7a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

