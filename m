Return-Path: <linux-arm-msm+bounces-88355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4759BD0DAE3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62BBF30215E8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6E62D94A1;
	Sat, 10 Jan 2026 19:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISUn2ubo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0A12D7810;
	Sat, 10 Jan 2026 19:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072298; cv=none; b=HRPvzxaBKzjBfWnuSnDNqw9mbC39DlNfCaa8kDY0LpwYxrIaZH42hrtgiYpQEcPmyVU+gfUNKuxDz9RDabji6sbX1dU9rCtm3VthTatojfDuigtsEvPtYBA0nz2Ax1RL8kzO+91l3WzYOHW/I1J4meI7XukJxgqw2WypiMdB9VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072298; c=relaxed/simple;
	bh=wV7GovKah71HcWA4mQDRvoBXw1cxkeoEympQyhlK2MM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lTu874iIzewJTCVTPIJwE3gcXDRWRM6K1Us0WK2T4IK40LpkWh/Qp6Aa5UAsy0ogFsQJUkOLetW3aLekYe+hUdeFQpB1dqe0wPG3ACu3TEKGG0FSocmihgwivChp25N2Gy8CgM77QAQzfElZaD2RJC0IQ5JIgbRUMXC1mV3BH0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISUn2ubo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571DEC4CEF1;
	Sat, 10 Jan 2026 19:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072298;
	bh=wV7GovKah71HcWA4mQDRvoBXw1cxkeoEympQyhlK2MM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ISUn2ubod8AgTt90yFanpB65qsY5O0hI6DbZE+yXJgTc3TGQcs4tLzJ727T5l1JBS
	 dR8J9HIJLblVQux9dPDazD1Zv+Z3yE4WAlWDPA/paXhVXOI8FNxCTgZIMnsNxzKf9o
	 fORuUJqrn2Y4WYtVPt5UCoGeecoAlsgFw226ttej1P9ddV/JeGOscXQUeqBgs6h7Ap
	 kBOgzt6Lp5ZtuoyfDMuj9LSGV2HTFJKVmqKX6MUCEMRghOV56vRISlaRjQIZaBvfVe
	 OSdJrLEEi2zP1db2qwdmpaSuPfkNhQ1AUJToitdw9x35ub2BNv+iY4ucStn9lGzkjO
	 5TwUGs/U3Ap0Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [RFT PATCH 1/2] arm64: dts: qcom: ipq5018: Correct USB DWC3 wrapper interrupts
Date: Sat, 10 Jan 2026 13:11:21 -0600
Message-ID: <176807228459.3708332.1322342442812092208.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106185123.19929-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260106185123.19929-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Jan 2026 19:51:24 +0100, Krzysztof Kozlowski wrote:
> Interrupts for DWC3 node were completely mixed up - SPI interrupt 62 is
> not listed in reference manual at all.  It was also causing dtbs_check
> warnings:
> 
>   ipq5018-rdp432-c2.dtb: usb@8af8800 (qcom,ipq5018-dwc3): interrupt-names:0: 'pwr_event' was expected
>   ipq5018-rdp432-c2.dtb: usb@8af8800 (qcom,ipq5018-dwc3): interrupt-names: ['hs_phy_irq'] is too short
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: ipq5018: Correct USB DWC3 wrapper interrupts
      commit: d106f9681d1952b7c19726b0713cee6ae11211f5
[2/2] arm64: dts: qcom: ipq9574: Complete USB DWC3 wrapper interrupts
      commit: bd2dc325db8c8cb29b65b0c636e31babc2bfeddf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

