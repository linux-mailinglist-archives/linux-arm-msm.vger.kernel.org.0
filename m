Return-Path: <linux-arm-msm+bounces-68591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC79B21936
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C04CF621FCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FCD27BF7E;
	Mon, 11 Aug 2025 23:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGxHlbl+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6646327AC34;
	Mon, 11 Aug 2025 23:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954843; cv=none; b=mtnfKgplT+TsQixyc8gkxri3zGXL+j5Kqq7rOzvJqrJ4wHp2D7na9S3IkQO1cT+xwhTJlFgdtWEAcGES1pE9EztQIW8mofjsanWum2xDpnKS1GlCBbxqWk1JpH9D1RBScuEiZc5yen2W2lcStvEQbqBs4mWT5pQBqQ84ro36fuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954843; c=relaxed/simple;
	bh=a5tovRa+eVDP4wRSHPCwx8Q1hsXSRBgLpTLe9f/CIl0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ukioS+mKBbn4QUhyrQbmZZChuUwDqR0pGUo+WWBwQW0jlgrVWbvWGsgcg4Lx1xgtjRRqYzl9qqStkfR8RWN+5vRVJ3g91es4QQsMJlmZB6pl6BhlDRxxw8pYVUIDebMHxBHzmIL/58QTfQ5vUIcfdgCwl1ldyFgu/Qp5UWAcYME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGxHlbl+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6075BC2BCC9;
	Mon, 11 Aug 2025 23:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954843;
	bh=a5tovRa+eVDP4wRSHPCwx8Q1hsXSRBgLpTLe9f/CIl0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nGxHlbl+rSAjIxoS5ffXVa5ozpLeMiKlG5Yg4U8v/5KmgBJsazCfyXGD1r4GSr23e
	 F0PFGQW7+wyqjV9imErowZg+cpnAXHvuH8nDDSPCqB22tx8Pj9C+S4Xq8zEEcmCIGc
	 L0wujEJup5yR0kyZ/zO7zUH9x5OU6u9m2GblAicGp7EUeqWGM8tNrVeGJGUMjkl/ZP
	 iUlVw9Ba6WCqXtZ+qst8AIIKYEF8e9b8vRAEqNiGEBUQvrRhmBWiLWehS+AKCedA3G
	 tB9H8Qi0MGNqDZISVGihc59G5uqlWCo6/CifVfbdJx/gtjTRCcSsLtxIfuZWiOSPae
	 jSPQXRJ/LF7ag==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: arm: qcom: Drop redundant free-form SoC list
Date: Mon, 11 Aug 2025 18:26:59 -0500
Message-ID: <175495482427.157244.5386288573332819108.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724132436.77160-2-krzysztof.kozlowski@linaro.org>
References: <20250724132436.77160-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Jul 2025 15:24:37 +0200, Krzysztof Kozlowski wrote:
> The schema and Devicetree specification defines how list of top-level
> compatibles should be created, thus first paragraph explaining this is
> completely redundant.
> 
> The list of SoCs is redundant as well, because the schema lists them.
> On the other hand, Linux kernel should not be place to store marketing
> names of some company products, so such list is irrelevant here.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: arm: qcom: Drop redundant free-form SoC list
      commit: f93e5882134a314760d47536d93b57fbd32d0da1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

