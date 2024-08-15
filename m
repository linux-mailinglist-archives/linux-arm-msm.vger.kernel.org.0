Return-Path: <linux-arm-msm+bounces-28700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE49C953BFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37C59B21810
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B43B16DC13;
	Thu, 15 Aug 2024 20:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkxuetE4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719FF1509AF;
	Thu, 15 Aug 2024 20:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754495; cv=none; b=kL4vsYoMXtxLoUWNAveltOhI0+W1NinsB4R8NcisDVvZSQKsfjT8YrCGxm8HcW8lkX1ol+ydTbmUgY9mze1Z9SpnVydi1qUOWzimI0K7+3+Vdt8RE9yOJn/xxxn9AID+up1KAN+EVbDNpbSpOa0k4wf8SRHTVkx4JPjxQTc0ZCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754495; c=relaxed/simple;
	bh=Ph7uztK2I8wTRwqkfcq3PaLlgq4H9YIwOSe02lnlKxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KIadmXPyqpLocCNAeRcEsHN0N6pPu7dM6AKgf5D5SyIbi2O9rR2w6xnqqZjVWfXVZzzC54F1YwK2Zfuw9rASDPUNVxbx5tWEcVKEvl0MiePFJgi8coKqcrNij7v+Dxxa4ey5wj10Rh6mpHSdzfbHMH7TeqPoo1cAiVAq3QZDFNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkxuetE4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1621C4AF0B;
	Thu, 15 Aug 2024 20:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754494;
	bh=Ph7uztK2I8wTRwqkfcq3PaLlgq4H9YIwOSe02lnlKxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mkxuetE4lei1pqkDE+KIx0rJkG9hXkuAZGe5g97ggrcusTzDbfqqIgS0OQ/d5STwe
	 0KfQmVa0WPDb91QsD0b/gn/IFY5nvat2gS28/UhkVIgHP4yAfCJFp+RHZbgHHEuU1p
	 ADnFXU367mMj4WkLJS03iuk8UDxrfQ0NahOhj0mUb7clxL6RD/QRYVxZrPjmb3RxRO
	 HBCPMrvLu+e3ueGqzWh1k+fjhFAy44uPSDMRFJxZccklFtNXPilt0x7zi/Ci07LEPr
	 wq3NSwv0TryhQTtITOmxCtrgs96eTlEc3Z4VmcU+eDBVcc1e0rKr3FPV+YBObRJMAA
	 7ink3X2KF08hQ==
From: Bjorn Andersson <andersson@kernel.org>
To: devicetree@vger.kernel.org,
	Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: qcom,qcs404-turingcc: convert to dtschema
Date: Thu, 15 Aug 2024 15:40:46 -0500
Message-ID: <172375444812.1011236.15390985762561922644.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716085622.12182-2-rayyan.ansari@linaro.org>
References: <20240716085622.12182-2-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 16 Jul 2024 09:56:20 +0100, Rayyan Ansari wrote:
> Convert the bindings for the Turing Clock Controller on QCS404 from
> the old text format to yaml.
> 
> 

Applied, thanks!

[1/1] dt-bindings: clock: qcom,qcs404-turingcc: convert to dtschema
      commit: d0c2eccf64fd5b1a995c048cb6ad6fc53727fb17

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

