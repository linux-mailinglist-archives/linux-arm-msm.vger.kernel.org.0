Return-Path: <linux-arm-msm+bounces-87466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C51CF40B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B40B303EB75
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AE82C0F8E;
	Mon,  5 Jan 2026 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKe+2d/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2506428B3E7;
	Mon,  5 Jan 2026 14:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622079; cv=none; b=vF0Ocwwnyx4s5P6HnT659FreiDWushfQj+hGJlgiBbr0Le5ZwnIab17HWQ5dA3DH8VlJTdL0+F/3iIqtqCGAafj/3sD1IYXbgNe/J4+UOo+RN6g7yequGS8d6QCC/7jYfy5b7BwzJsx+1nECHRGvHTJVyvtJmq1NoIhr+Cm9wXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622079; c=relaxed/simple;
	bh=h4mjCJChvn5YkA8mFrxKeasEgzSmTrzJxVW+yN2m3ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pGrbx2r1uIScJgKMbLKgj3kU5lpSLwgazbbk5vOPJOyocvp9IPCEt8sQznunGApVAg/Uy7QXw3TVTh+B+ATxL/5OyXI1Kp5tiBIUAtu9l27jLPijVamBbOo/wW9JITF7TPdKvy20BMJVDiVYaJGKvM+D6TrH83wXYS/M8g4VXUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKe+2d/r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD34C16AAE;
	Mon,  5 Jan 2026 14:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622078;
	bh=h4mjCJChvn5YkA8mFrxKeasEgzSmTrzJxVW+yN2m3ic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sKe+2d/rFdAvy3fGy8MFaYMCJ9uJjcCwtUrGwkyP7Vcdgg/eZBpDFT54o72j4YDE1
	 nXCshyRMJ/QcLKEh4FVHU/b8GZ2V9GLtMDaoZuH38onFOoBzKmdhuLRXh8R3Swmr1l
	 0TKXxAF+9uu/Pfp4Ef6FR/3wsU+GcZP4yhsuXAd7no0c6bukRGvZUMwR1/qakOZeU3
	 ggpAMMIr+rOQmfK+zFL8NMIq9yOD/qfNNJvvSvlDXEC4nib+fO6bPJbFuJHz4bPDIi
	 TNW/+USuv9qHrSi8aFe31RIL8y+9rFzsF/PWstzsK+kEbTjT8GHxIxBaKywDDhPB4w
	 2NNSIDiZynCBg==
From: Bjorn Andersson <andersson@kernel.org>
To: Dylan Van Assche <me@dylanvanassche.be>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 0/3] ath10k calibration variants for sdm845 phones
Date: Mon,  5 Jan 2026 08:07:13 -0600
Message-ID: <176762206375.2923194.12723826670757222058.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
References: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Nov 2025 16:37:45 +0100, David Heidelberg wrote:
> Let's leaverage linux-firmware and use calibration from the board-2.bin.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sdm845-oneplus: add ath10k calibration variant
      commit: 252f98ecb3c71acd818592443496252ecd5ccd6f
[2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add ath10k calibration variant
      commit: ea6926f61a857531d02a72bb5b040e23573fb393
[3/3] arm64: dts: qcom: sdm845-shift-axolotl: Add ath10k calibration variant
      commit: 31deed7b05079b2eb24589d37778466a2a55f4f2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

