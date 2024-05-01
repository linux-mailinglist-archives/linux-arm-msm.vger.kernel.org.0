Return-Path: <linux-arm-msm+bounces-19092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A5B8B908F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 22:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1AA11C22D63
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 20:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26FA165FDB;
	Wed,  1 May 2024 20:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0O3zROe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7331165FD6;
	Wed,  1 May 2024 20:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714594865; cv=none; b=AC77seHbRfsuQl6U5GAGkJv0IR/SvBc5h7k2msGqzA9GiScQAv0WsPs8Q5FOFTHTg9v6xgqsVpzkLxPrcANLdX6GEUyi7F3b3k4Z+YTVUiCG52U/RLlDwYlHcrC/RxhcfW/m9jg+IwAXdvc2BmGG64xCZDeN4qLz/2yBcCnE/WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714594865; c=relaxed/simple;
	bh=olhnGhWW9T7dUREv2jUGSZbWmrEBLYqKt6GcWwBayFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JHMmnLMXQhjd0pCmWW+a2SBwGGuwbNjurWc9/ClPi3i5raHMi4J0q6phgOhiSkXYEcqsyiTvIua4vOpPg2jya7Y5j8c9MqEXAxI/XiC1fq4xUIjid3+gm5qzrj84hvE4o6/suPvQvgfUKydCJSjLRWpZR1AoHIIpzcIgj0qGPsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0O3zROe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A45C072AA;
	Wed,  1 May 2024 20:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714594865;
	bh=olhnGhWW9T7dUREv2jUGSZbWmrEBLYqKt6GcWwBayFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i0O3zROenWvyHZbyAcqZnGflfuYmM9XeFLYDKwEQ15RYWB0ySz2YEeON4LsDfvdZX
	 mtLdYGUI1x+aCu53SkyGE41sUfIz/nPuRR8Ckce24TXD28Cw8LB2GnRah0PzNjXiwe
	 hzv4dCr8udD4fmI5YSZT3HzujzU19k1Ez/HCd7etFh0BYiwLEqkgc8AgZJv7jXh8Au
	 o1XCjs9Vq3kLiaZDwcH/CjHfo+E4/DDNE+tziab3JGk3SDGlJr4gUcoXpICapy42iv
	 rS1G+mjqrJ8G6Orgoz0PKkLP/4LMdBgu4ZbtvnVsPB7DCrFrVi5Oss5KsYgaeCD4km
	 mEzTxgUQ5Yx2A==
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom,wcnss: fix bluetooth address example
Date: Wed,  1 May 2024 15:20:55 -0500
Message-ID: <171459484208.41039.8589351728569617321.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240501075005.4588-1-johan+linaro@kernel.org>
References: <20240501075005.4588-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 01 May 2024 09:50:05 +0200, Johan Hovold wrote:
> The 'local-bd-address' property is used to pass a unique Bluetooth
> device address from the boot firmware to the kernel and should otherwise
> be left unset.
> 
> Update the example to reduce the risk that a non-zero address will be
> used by default in some devicetree.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: soc: qcom,wcnss: fix bluetooth address example
      commit: dff55f66aaba931c71ba5f20906f0a75c4df1da8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

