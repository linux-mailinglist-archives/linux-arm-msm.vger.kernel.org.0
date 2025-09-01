Return-Path: <linux-arm-msm+bounces-71436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBBEB3EE95
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F37B175F54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF8F261B9D;
	Mon,  1 Sep 2025 19:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcvXdx94"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421D8260563;
	Mon,  1 Sep 2025 19:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755972; cv=none; b=Rrv7fCi2snV2qr2rPEv/FlDSRHlX4HUHEtHZ0D7/oUEVSu0NlGrFh5RcIZ/8Vgnng+8qqM4aB+g+q4plVILPD0EoCiFVhd/86QDvL8xgX1Um+r7ndo7tgHp+rocnxXigkRDK+xb4Vl/emRKeiB9pFR1jCMdTfSsxirPy4anyJP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755972; c=relaxed/simple;
	bh=38k8K536dsthoyMzV/LOIf3lYjYi0pnAj3RkyV5TFjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mzixaqAPuiSVu1V4FGiYriDOGvQj8rFnA3L0bijdrj7ORa0hg+MreOnkDOt+Fs75ySqo/WzSYjTdsDmbAOBsfma/OromuiyUSq5m+f+ZntPzWINpgoR/QuGrZtAOpgHjQ26Xf6yXZl9BMZVKA9cgyj3bwJaSUFO+uuohTzw5+sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcvXdx94; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C9AC4CEFC;
	Mon,  1 Sep 2025 19:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755972;
	bh=38k8K536dsthoyMzV/LOIf3lYjYi0pnAj3RkyV5TFjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QcvXdx94gntZHdJDGRuJGGX34evaH0rhaHcOiBMXzFuY/xoY2w+XZetCFGtUl/BRh
	 IqDzxnVNlthIbRcwIUFC2R73vrymzhELFRxfV6kdgKCq2WFP9JchQBGTdbAr2RNVzY
	 L2+hJQwsyYOHUP+O3q/V/FiqC2fCgxzXX8Vfb/5E8+j+eqpDf0nJj/Y9nLcemRqcfI
	 OdaM3iFFL25bStXGZ2+dpb08ufNIP5rfK50BxH2jiRzu0iCI6ppaU9ATViR2r1EQfr
	 +gsTAPazBjQH0Hp3+cX5CUMjF71IsqpH24DQl5kkTc+TN0Qnduuvq0fJXNufjhxH3q
	 5RCBrCwNl+fXQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v4 0/3] Add initial device tree for Billion Capture+
Date: Mon,  1 Sep 2025 14:45:53 -0500
Message-ID: <175675595930.1796591.10706801069353985032.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811-rimob-initial-devicetree-v4-0-b3194f14aa33@protonmail.com>
References: <20250811-rimob-initial-devicetree-v4-0-b3194f14aa33@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Aug 2025 23:08:08 +0200, Cristian Cozzolino wrote:
> Billion Capture+ is a handset using the MSM8953 SoC released in 2017
> and sold by Flipkart.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add Flipkart
      commit: 922e16d1770624e25e2c751a257c88690f121b1c
[2/3] dt-bindings: arm: qcom: Add Billion Capture+
      commit: ba4857cc649a7a113252e849fbf12bc282399480
[3/3] arm64: dts: qcom: msm8953: Add device tree for Billion Capture+
      commit: a2dd7cf8477e825b8028b4e36c787cee0f00a033

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

