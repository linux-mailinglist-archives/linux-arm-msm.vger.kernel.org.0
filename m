Return-Path: <linux-arm-msm+bounces-79024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E10C11BD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A6C31A2888E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FF332D7F9;
	Mon, 27 Oct 2025 22:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQDrgJyK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ED52E54BC;
	Mon, 27 Oct 2025 22:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604490; cv=none; b=X14rNPZSEoFGnN36VqRsUpNIBOeX9Fm0Ur5sZ9+sglKktxoUvX1yGHtNLxBu8f6aZo2SHv6wHKCEamLoWpsZw4atpnkuJZN1O02B8l638iJ2DUz8noxeFo7Vx6+1bX4fRe3IA4yLyLJMlRpL9IHePT/Fa1T/MQZWNWOY3PljjYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604490; c=relaxed/simple;
	bh=Gtc2AYnPB4za2PS+Rr6W7no/j9YNfqzzRZSlGpPjRzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dm5eU0zFahy8Ras15bOuRBU0S+x3nGpHNz/2EATaiKHNK8oFHCSbR6CDHO/VdyinfRg4suy1leSjWhiT+QeRAetAh3SVly/yQGuBYO28NbyU0LBqn02V1FWb2WDkQxfXd7zgdsyrPRfjOU7PpCslVhwxeXOcglyWEkibi8RY86o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQDrgJyK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE64BC4CEF1;
	Mon, 27 Oct 2025 22:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604489;
	bh=Gtc2AYnPB4za2PS+Rr6W7no/j9YNfqzzRZSlGpPjRzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dQDrgJyKYsIdj28xx2RCyh3Btr12CwSRl2QygYxaEr6cwBCKjd4hOb4Sowwli7tgV
	 NKsma/GsH+vTkiBLO1di4cmHF9Lq/j4AIBjlVMGHRO8Z1aoEvVEhxVxzG3K8Ed1ghc
	 tVgOz9EsP/2tB8+FQAZQk6ChtNs0XSmFMf2OJ6MIiyvj99DhU8LVGpDsbnc+N6yez9
	 lPDXdmTdHwmUZiIO2ZVcez7sGXHHYw5VgRZ3yRaTJ8n9Aq+Na4rKrtni5peXoIRoVN
	 GC2R/RXQeqg3mRd1ow3JSFaBbmq0bZnCbluXt0W5yyjI95GThUh0k9nN49G8xX392u
	 6+xP+D2Np/zqw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 0/3] qrb2210-rb1: HDMI/I2S audio playback support
Date: Mon, 27 Oct 2025 17:36:45 -0500
Message-ID: <176160465245.73268.4944449689124127284.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
References: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Oct 2025 07:06:40 +0100, Alexey Klimov wrote:
> This series adds a feature to playback/output audio via HDMI
> on the Qualcomm RB1 board. Since RB1 and RB2 are very similar
> to each and other and most likely use the same mainboard therefore
> this series is pretty much a rework of the similar patchset for RB2.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: qcm2290: add APR and its services
      commit: f8d21b5e4caa7a8e06cf6c08d85f6e992562a667
[2/3] arm64: dts: qcom: qcm2290: add LPASS LPI pin controller
      commit: 1fc30731562bb45e53e09d40fc69bc4364310b6e
[3/3] arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio playback support
      commit: acb854eba80dceb12329cbe162122491f13a8a2a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

