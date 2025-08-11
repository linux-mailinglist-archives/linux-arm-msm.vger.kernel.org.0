Return-Path: <linux-arm-msm+bounces-68592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E98B21938
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD774622213
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D3D27F000;
	Mon, 11 Aug 2025 23:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkVp38Kc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D7827146A;
	Mon, 11 Aug 2025 23:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954844; cv=none; b=BKpB+qHJLKAZ3Erpcq2kXjmGMZjFRQWJxHJKq6Vbikw3IUKfGChEfeeOpbRlGrNfSHE9wujPevzojtg66d27iLZfXWg5cr9GE/FsLsZ59Mi9lhPYw3uKkO6Ut3uMza6I2MUrRkQxSLsMT6FzgasVqdpk3BSxg2MGvZHRLtYTgcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954844; c=relaxed/simple;
	bh=4twpda1qle+kSEU88TGP7eLiMI7FxT31TKcU8JwV5s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXM21t6OSh/FC3NCeWk5Z3m2mQnLMNn6u2dbJPenTs+CPm4Ssv2i70QsXhTJoJbo91In/H5chk/F8FCoxUaZn4OP9gAxFv/RlylEolXSNnprP+cfrjCyZMU6elfX1pKP0UOHkUAkU7Y1OkZP04GkGJ3/CBgh+8WF3plos5B/r3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkVp38Kc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33472C4CEFD;
	Mon, 11 Aug 2025 23:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954843;
	bh=4twpda1qle+kSEU88TGP7eLiMI7FxT31TKcU8JwV5s8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CkVp38KcUFdZ/fc+mDNKFE3SLgJC9sCkqB1GFTtUf+YpMjGZJu+B9f+/AXjCdlM+x
	 2V/b6R6VvNhqLpKzUM0K+ptlIKGTmgUelzUgQ6AsTOjEg9YzTvojQmwuPG2bPxI+gh
	 uWWEEAjJkGhBq0CP7Fh4JTk2GRrnbSaBGrqf+fSNutySKUBylpdQPW9cc1898VSOh1
	 vmghjLijHMFyGk8/BveXFBDAJfr9lfPm+CyPzaZIwhX9BYunLC0w4Gk7xWd6k3ZxXO
	 nSlHuUgRi3AG6tdK7LcMQGw1z3Co0RwQ+aCQ0eCaNw3G1NbnqpVV7lzcmFNgh+V9r8
	 EnLOjpgkmHmIQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH] dt-bindings: arm: qcom-soc: Document new Milos and Glymur SoCs
Date: Mon, 11 Aug 2025 18:27:00 -0500
Message-ID: <175495482450.157244.15814882520059016459.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716162412.27471-2-krzysztof.kozlowski@linaro.org>
References: <20250716162412.27471-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Jul 2025 18:24:13 +0200, Krzysztof Kozlowski wrote:
> Extend the schema enforcing correct SoC-block naming to cover Milos
> (compatibles already accepted by some maintainers for next release) and
> Glymur (posted on mailing lists [1]) SoCs.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: qcom-soc: Document new Milos and Glymur SoCs
      commit: 474aa14da0e160f2f3fb002b64b8363ae91f9590

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

