Return-Path: <linux-arm-msm+bounces-33390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A081A992F2A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D38DB1C23F36
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F761D934B;
	Mon,  7 Oct 2024 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1+zP1dA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299251D9340;
	Mon,  7 Oct 2024 14:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311182; cv=none; b=SGkFrfbmGocSDj7ddbkL1VmPxBfhDQO4A/bSjtMcxfCIGKvEuGVbvOuYCm5f7wZ4e9hg46ZzMOBDB47aBaPuEQUB3Xetfi0x6z1EI5+NaW9J6DpiyuLA9JBHgVA8du6eiVwGQqNZfYJVZonX+QQoNxQFbdUU+xLrHHe3P7wqxMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311182; c=relaxed/simple;
	bh=u/sC0j1r6dkF3Ofq61qc26FtZZ6r7jsNxEjDqqbDV4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aGHp+IAnHWmQNZP+gCePswmeSBJzqQuOUEHupMiO++i7rkXGSGumx40EU+UFi59+tGiQBcZYn5nrS+yMsT6O/1MdO7Dv+ZQTnK8bcI+Zw+2hX8Lvscjo4a06Kq6txGuWSkV2slkCRNSUfNcqm+lWhyglgp87ae/7cQ8iCQkbPJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1+zP1dA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794AEC4CEC6;
	Mon,  7 Oct 2024 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311181;
	bh=u/sC0j1r6dkF3Ofq61qc26FtZZ6r7jsNxEjDqqbDV4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l1+zP1dA3zr+/NZG6oGp+3lZGfDfliJJAbiPV7l9u3wsLukJV2kEdhZhwzrZiimdc
	 88HB7OiNg7Qu0P11VcNqN3anHuK2Jy6ANQkVKnWeqM7mrimVHiv243z3zMutwy9QI6
	 3R6Cw+U3XjjkiDvTkA8S7DGXPEKTyNBVBakWIW4QbkR/7yPpA99Pyr2D8jweyOB+HO
	 1SzM1/RqR/6MCoCQsjFZRVyPBGGjT2MiWcZsfHyMywIdFVxs+VRCFfYXbNNVyR9GBs
	 Iwz2r0Ch7eJSERdnqieaL6LiqqVGBZA6hWgpMpfUoGKLg7yU+R2yAlPmo6q/D1FuhF
	 b+Ib/1b5ylMCQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] arm64: dts: qcom: x1e80100: fix missing PCIe PHY clocks
Date: Mon,  7 Oct 2024 09:25:54 -0500
Message-ID: <172831116165.468342.17489268002228008386.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240916082307.29393-1-johan+linaro@kernel.org>
References: <20240916082307.29393-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


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

[2/3] arm64: dts: qcom: x1e80100: fix PCIe4 and PCIe6a PHY clocks
      commit: 27727cb6604e0998d03d9ec063b517b239d2bb0f
[3/3] arm64: dts: qcom: x1e80100: fix PCIe5 PHY clocks
      commit: 0b80b3c0f6d20f1bc1f7fea6176a8df15619e884

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

