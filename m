Return-Path: <linux-arm-msm+bounces-43393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9749FCCC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1351163283
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413891DBB0C;
	Thu, 26 Dec 2024 18:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F125hghx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDBA1DB933;
	Thu, 26 Dec 2024 18:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237649; cv=none; b=FFxikRra0OTK71T9Os6d0S4lfLqWDrqL/Yb/z5p+LY5zKQGG8EzVykajD+TjjX9wH0r0iaHtLcAI1EspVOxaBaYx2doPkHt/0QbNT7ZDpDff8xaN9b84lA5GcEVGXFSQACqKNOnwB023QBdsqVmZGyz2WtaJ7OYoPNSbjrdBuc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237649; c=relaxed/simple;
	bh=GpWvEosYE+MOeVXHv894f/KZ6FRugQ2cd6d3kLMslic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HhYplg1UoRNAZIT4iGW9Fx/EaEy5nprjLCTUjeO5wsn3KgFiaVOYTILi+dRKROCfd4fk1CPq5lzE0codtCjl33/csOpnfJShGfYT1BfE5XpjOxHmuVnquftTWRui6ohF0EsRV8sSg8mQz8iF96f728ov79m8Ciltniq1ntZb/yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F125hghx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2FAC4CED7;
	Thu, 26 Dec 2024 18:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237648;
	bh=GpWvEosYE+MOeVXHv894f/KZ6FRugQ2cd6d3kLMslic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F125hghxBNOlXLdOwrWiCjfAsNKmEciiZ1/msGR9ulBFdZQlv7JNu2qMdQDlNr/lN
	 4yzEMBd6JF/xSv/dKdjBqfJR4yz8nDMvMgc7S5/kCktUFCuExrBZEuH+NOrDQVkqJr
	 zvyHxXNMBIPXWTy8LAmnIfxXo8Bjzvs7SPMYubjnPHXta/YmYFZL/xsucbUw6JBJpN
	 cI7/p19f+LQAdt7g7jkiaq9Ib/Ii1pyOWfM+knpBDbxh5yZ/DlbZIJvFrM10UKkGh5
	 j7g4bTgkNiiN1Pb/62ysGQfjnUMwqGewFrRJ4eJJxyIyQyAvtaa0WY7ZbRIu3fdNy0
	 u/r3ojuTE+HQw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Fix uart1 interconnect path
Date: Thu, 26 Dec 2024 12:26:46 -0600
Message-ID: <173523761376.1412574.9908609145092222648.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220-sm6350-uart1-icc-v1-1-f4f10fd91adf@fairphone.com>
References: <20241220-sm6350-uart1-icc-v1-1-f4f10fd91adf@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Dec 2024 09:59:50 +0100, Luca Weiss wrote:
> The path MASTER_QUP_0 to SLAVE_EBI_CH0 would be qup-memory path and not
> qup-config. Since the qup-memory path is not part of the qcom,geni-uart
> bindings, just replace that path with the correct path for qup-config.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6350: Fix uart1 interconnect path
      commit: be2f81eaa2c8e81d3de5b73dca5e133f63384cb3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

