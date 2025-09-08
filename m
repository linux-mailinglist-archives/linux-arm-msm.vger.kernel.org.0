Return-Path: <linux-arm-msm+bounces-72635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DBFB498AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 20:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 546BB16E648
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EEAD1CAA92;
	Mon,  8 Sep 2025 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4VsoV9J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F221F31C56E;
	Mon,  8 Sep 2025 18:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757357284; cv=none; b=UQPNnO2Ua5+oeinu7MDNt7IAxbTzF3E23mjlfk1n/lR5nhvliM0GXFYRjC3noCRbA2lDN+9z6CfL4jszQZAdRg7gezmxGoj/0wfX8dKXD5xjAjip9bXcJvSbbppPJ1iJK751u7UNp8AIygbXI9LqPxS7I6OkqwmGCUweVMWIVCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757357284; c=relaxed/simple;
	bh=nrCz2Ce0M359+SInF2ghabB0YsSAoH7kKyxoIgf6BVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y6xIy3ReDOdHmk9BtsnyOkjfMzZNaJYD3B2UZWQ98NpR78mca6udVISyDnkWABNgWpYodOI7+SxZBTD13FnGK7LiX28PMXYjh9aARtUkkjc2YvPdH4AwZjPLnddkWWm5fHdSQTVb0GYyzsyzieCVDMyk05Cb04HfQgmyXR6xGQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4VsoV9J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801B8C4CEF1;
	Mon,  8 Sep 2025 18:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757357283;
	bh=nrCz2Ce0M359+SInF2ghabB0YsSAoH7kKyxoIgf6BVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m4VsoV9JR0uvKNH+Z7tw5ONgwzJEllOybVdFb5l6JWb89mDEZ0cybPLnYf8Jav11Z
	 fBE8X0GGyVrqyMYPwqcWMFQPCLj5C1KJ6QI6euASRL540aWMQ3UGfKG7UPQUfP/mUo
	 gO3CLALZ5Pgfco1MC+paLgOCWo+RLQCDHIf/t3md5+h5F+a9Vrh7roZdXFayAwcje8
	 oNfUZdYuOPIV1X22EcKcn/2A0Ob+AiugJFsZ9Oj30dItiFZqbPDK1AEquX5ObPStB6
	 Qn3J+wPtxrxdydz1pTpBtWzcTySHWsTaqbLo6xuOrYdaQ4heU6/Fuvj//z6PQekN3f
	 MRAosX+6q824g==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com,
	prasad.kumpatla@oss.qualcomm.com
Subject: Re: (subset) [PATCH v9 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
Date: Mon,  8 Sep 2025 13:47:58 -0500
Message-ID: <175735727829.2621347.16995874471828591592.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250903151337.1037246-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Sep 2025 20:43:29 +0530, Mohammad Rafi Shaik wrote:
> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
> The updates include adding the necessary audio device tree support and the
> required dependencies.
> 
> Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the
> same SoC  platform. Therefore, the audio support changes are included
> in a single patch set for consistency and ease of maintenance.
> 
> [...]

Applied, thanks!

[2/8] arm64: dts: qcom: qcs6490-audioreach: Add AudioReach support for QCS6490
      commit: 7c6de7511149da119b3aa9476ce5f746b9a3c786
[3/8] arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
      commit: eec852a4c84259c0fe68aaaed60c26dbf49b4ff2
[4/8] arm64: dts: qcom: qcs6490-audioreach: Enable LPASS macros clock settings for audioreach
      commit: d3c438554c6600fdc49430279e147aae1cb33876
[5/8] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
      commit: b6b4c9f76a8b173a1a1455d181d19b5ab8842a47
[6/8] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
      commit: 48b5ea6de47f58a0b5d1641ea8eb78157666d4a5
[7/8] arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370 headset codec
      commit: aa04c298619ff2621691ef1df5e243637d777222
[8/8] arm64: dts: qcom: qcm6490-idp: Add sound card
      commit: 7fd5b4a203cf88d1ad87aff27f9f23aed7b6dbd4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

