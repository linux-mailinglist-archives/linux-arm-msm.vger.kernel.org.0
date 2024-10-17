Return-Path: <linux-arm-msm+bounces-34757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B19A269D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77CFC1F23A22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 15:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268D51DED53;
	Thu, 17 Oct 2024 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvnvQmHe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1B21CBE8A;
	Thu, 17 Oct 2024 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179080; cv=none; b=JnrdoYW+JUClP25lLUN/mevcJaDkGJlEKVZClHBk6Blla4Rdr35p2u2k3v1dpRRoeeBNaeFPcug0qpUlKl+GWTTkci9JIh2fCVlc87Zuem9EZf+f8DWz6/rl9J20svT5Ngc3PZv23884blbINecrhu6Djyn5DbN/KQ+iWK2XIVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179080; c=relaxed/simple;
	bh=o/Bu+DMqsN2Xj4ZsXtQkiK4XJBd/5S864GKEP+F8iUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=idkYQV7E457Fck67R9w5UiZ7FKdMlB8RcCMFLrLmsA9WmY8NjMNgFZ19pNbZVSPivIj/DexwG460v0eIiwjwHkCIfetof+3N32nNCtzYynxjRfo8HWH8CPBqlWVqww8h0SFLbuWoCQ/zek5rzQJSi1hn810r2yAQhdq3gqMMJds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvnvQmHe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EA2C4CEC7;
	Thu, 17 Oct 2024 15:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729179079;
	bh=o/Bu+DMqsN2Xj4ZsXtQkiK4XJBd/5S864GKEP+F8iUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gvnvQmHeg6D18T5rLEZlG+grWfOu2+HO7dZDos7GvKEjDdMm1g9L8qbc1f/afckuR
	 GWPOg03xZlkyJgAl4s7QVvigaiemgYY0DDebiD0WQeyi3L9fEvpv2nEhDdUyFuZufC
	 cWZ7Z/Mtg5AyQehD0suqJuqNlyKNKlq8KURThACt0iK1gYvG0iAxXnn9RezqdCnjAb
	 z7VbZk9Ue6xWvPS6WLKXD77QVbeJM1RfR6pTowC6GAmi8CEdj9YA195pVyUtKjTutH
	 d7lAmRR52gsmkHq2h5DzCP3RsDuAfkjjz7xri/uzZDfZa7/7PkL6EEjLez2HQCJCoc
	 d1F0WYcwVZyUw==
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240916082307.29393-1-johan+linaro@kernel.org>
References: <20240916082307.29393-1-johan+linaro@kernel.org>
Subject: Re: (subset) [PATCH 0/3] arm64: dts: qcom: x1e80100: fix missing
 PCIe PHY clocks
Message-Id: <172917907574.278159.12489119040829163080.b4-ty@kernel.org>
Date: Thu, 17 Oct 2024 21:01:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 16 Sep 2024 10:23:04 +0200, Johan Hovold wrote:
> Add the missing clkref enable and pipediv2 clocks to the x1e80100 PCIe
> PHYs as needed for functional PCIe (e.g. without relying on boot
> firmware to have left these on).
> 
> Johan
> 
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: add missing x1e80100 pipediv2 clocks
      commit: 938ade15abaea765dfab32d906de45657067c11f

Best regards,
-- 
~Vinod



