Return-Path: <linux-arm-msm+bounces-35327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E3B9A9879
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CEA8B22F8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 05:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10458145A07;
	Tue, 22 Oct 2024 05:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALqHq1oq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2496139566;
	Tue, 22 Oct 2024 05:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575140; cv=none; b=rsU+EYiAK9UMzWIyRRT02Xrd0+GJIWZ4Oe+6DDvvLoT3o3gM2oxsn6VUBN131NUXM1/W+I04SlO9FVzI2qYbjo+vt3olWVBXObdTJcVz4Ad6dL2b8G3cjbd878Uj0ukprMjnqyDYk3Fjxw56iMJ/X+ZdxpM9y5rSyBTl7E2xGt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575140; c=relaxed/simple;
	bh=IC2s08flHKsv2NAHGXGxkxcj/BBZpwRMBVQZCveXR8g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TlR/5qvVMvHSjWboT7J8yGPaOr1HRZAA5hJ99sYfFgr+8FiAH6OM5OTqk3Cp7b5sLxReyI8J3tR9qYhBA2HQiMo8NY+pl5a/hY5HXf+zklnznTLmnzBE2mimYR1KeH+JRyPnjAWSWjPDWKx00aUwY6M+c8LczyolUHy/BXCY0vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALqHq1oq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86EFC4CEC3;
	Tue, 22 Oct 2024 05:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729575140;
	bh=IC2s08flHKsv2NAHGXGxkxcj/BBZpwRMBVQZCveXR8g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ALqHq1oqcJHgSJCIUKsYQbXxkRylvXEnJSh7AHvIjMPbTW9RtGbUCIHIuJaR1Q0eD
	 492Nc3WTdR6g8ZcBgaQTFbh942CbQ9Fvfnn/fdDjObw1CaxzNTJDHZzg+GTEoL7xH+
	 COVeJB8T1kceRK64xT7W1iXcoCRz3nc12G61y3hVKutSqJzFqlIh+Aq1Vokt9Ta8Zl
	 TrUeLLen7yYxy/FekeJDQAwnCTVJ77cbHQ9n9ahPI65V9IvJ/pOb71LY8F5sMcwpXT
	 o7kCiuzpqjWk3MPMOx3NUmRQ0gqy4GG0Ttf3m31uciILF5cJpf+zbDlWpNTGBijBtp
	 6IkXjGgxcQ5jA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241017-sar2130p-eusb2-v1-1-1cedd674ec64@linaro.org>
References: <20241017-sar2130p-eusb2-v1-1-1cedd674ec64@linaro.org>
Subject: Re: [PATCH] dt-bindings: phy: qcom: snps-eusb2: Add SAR2130P
 compatible
Message-Id: <172957513771.488852.7809851835581288714.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 11:02:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 17 Oct 2024 20:42:56 +0300, Dmitry Baryshkov wrote:
> Document the Synopsys eUSB2 PHY on the SAR2130P platform by using
> the SM8550 as fallback.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: qcom: snps-eusb2: Add SAR2130P compatible
      commit: 8e1e94619bd37915323a199ceed39ed5904e7fa6

Best regards,
-- 
~Vinod



