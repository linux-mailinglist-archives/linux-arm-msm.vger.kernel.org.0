Return-Path: <linux-arm-msm+bounces-73769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F4DB59E84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 18:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B2441C03630
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166F337C0E7;
	Tue, 16 Sep 2025 16:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmkkYajz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD67B37428E;
	Tue, 16 Sep 2025 16:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041907; cv=none; b=aSz9XkR2/3Ca26H0rEwrY6qYhWNTCY+tVv/j364W5OrSLZpw9GcuXAn7rh0USzw9ZLXYGxqXiP88eOLLCXSAl/qu6pUhaJukhIhMiW6chKxjc2tQCQJ3HoBxwX3oGZDS8oSBwAXVSmuNgK0ONwelRoGhuH03ioKs6xxI0+Dh3Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041907; c=relaxed/simple;
	bh=SXi1EKAdy0I/dpgsKHpKXnQX5eu78TkOmFeIYmHeBkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lvCJgUp/YOILr1QtQK4apIIzfbl5fl/UhRrpKLpBvF8YuK+g411uyvsCwuXaQ1t95c8CoeI3mCCgOaBO8IEFAAXv4ruZ8OFcfgmUfGNvXwGn3eFAPWRi60WavKQYmYfHBOnncFmSBza8w1beBEk/atYIM14lM1S7s2USr8k0c5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmkkYajz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F2FC4CEFA;
	Tue, 16 Sep 2025 16:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041906;
	bh=SXi1EKAdy0I/dpgsKHpKXnQX5eu78TkOmFeIYmHeBkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YmkkYajzVozM1FDQlaDYCXeRprGQDqmiFSaQonji8iYHAqXy5elzVJE2v73hAXVoL
	 Rv8w4Cg+rGlB2Eok+mUQ7FLl5QUg1Y8NMssPeTGT9nATCSBpTKTpJW1MQGsvi7ZTLf
	 +MAJ3by1OEKPyCu6JRHbsex0deWrDoNAntE31Ba31858+gz8kLA0EgrVl1XD6OcRWj
	 xSxDmbn//qLPCPzTef91ee347jtEFoLw4Av38+5cjlaeN/qpMLTh4RWJCs6eKua5gR
	 Xpi5D0SRPbSDCbnc5XAsUEjIqRmIrpJ5sr35P5p9rRSUSl2uJjaqv6hYCvIyi+Hbt/
	 soHfADW9gZAmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vandhiadevan Karunamoorthy <vkarunam@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: add QUP3 I2C node
Date: Tue, 16 Sep 2025 11:58:09 -0500
Message-ID: <175804189850.3983789.14744477278659700393.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915-ipq5018-i2c-v1-1-46bbf27396d6@outlook.com>
References: <20250915-ipq5018-i2c-v1-1-46bbf27396d6@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Sep 2025 13:24:18 +0400, George Moussalem wrote:
> Add node to support I2C bus inside of IPQ5018.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5018: add QUP3 I2C node
      commit: 435712ac13a58ba006af741b8d759034a69b808d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

