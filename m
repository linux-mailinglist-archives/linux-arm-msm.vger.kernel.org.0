Return-Path: <linux-arm-msm+bounces-20677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0558E8D129F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFDB51F21505
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B0E2E646;
	Tue, 28 May 2024 03:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUDc8FG3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B4A2E64C;
	Tue, 28 May 2024 03:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867164; cv=none; b=pxGZph+CsoGCcQRjdjLiT0g6kl4T6XeU4d5GJb8iDyuzIMdbGVBdL6OHXckgK8MNeD0RJgTmBWyA9SFLW+gbqd6pjb+Jk/C/W3FkV75Kq501U/oSyDJZUc560IBxuIkH22s0yaYfUn8cjXk8/aOBLQBkPG5ZlW8uWmtYbVXuinM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867164; c=relaxed/simple;
	bh=BNUfSENnQ3Xnu31LgNHC6atOJLd8mgwLZdHa7Nnqm+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IdhyFjcm4uoOFPyPcOcWqNrjKz9zo+ZqJgxyOEsjoMFMq6qW3HCKmgL6GOLVZCnO922esOwX5g6D96SSVuaohLNZIhwJ2IOibyEjAlHsy48Xbs3GYScAgVhVjIqMU04J8jA6eq0GkAianlokvAObDQhA2/2kf2ViRwY6YitCWp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUDc8FG3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9E6C32782;
	Tue, 28 May 2024 03:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867163;
	bh=BNUfSENnQ3Xnu31LgNHC6atOJLd8mgwLZdHa7Nnqm+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CUDc8FG3Ys5ntlJxaUlHzTN0P01QD07feXHr6BfnuOz7n+sDDn1PLymcLoa5oKEH0
	 fLLUZ5R/x3vh7aLrETM37RoX9Wbp54ZXbv6QymOxLbeDosZPjrcLPgkjfyVnUyYq6O
	 956b86GTbXtEqqCWRgmSZOfyaPJ3oMsgDT8iSh59eD1YyNxkGsdlhJ343vYD3++3lB
	 pI8Z7O6myx/qvNT7XNP6JyfGs1HtXMFpsXjvrJH6PnF7MEx6ONmO6iiDka4FKQdQqk
	 3DZOgqXfJoYw/n+RQhrVicaE6scVoJ03UBPw64dM6CctOExIti1+/mR3QIm5VOJXBT
	 pbh8rboP6ecpQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luca@z3ntu.xyz,
	Bryant Mairs <bryant@mai.rs>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: (subset) [PATCH v3 0/2] Add samsung-milletwifi
Date: Mon, 27 May 2024 22:32:10 -0500
Message-ID: <171686715163.523693.4500878990759287138.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240219214643.197116-1-bryant@mai.rs>
References: <20240219214643.197116-1-bryant@mai.rs>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 19 Feb 2024 22:43:15 +0100, Bryant Mairs wrote:
> This series adds support for samsung-milletwifi, the smaller cousin
> to samsung-matisselte. I've used the manufacturer's naming convention
> for consistency.
> 
> Hardware currently supported:
> - Display
> - Cover detection
> - Physical buttons
> - Touchscreen and touchkeys
> - Accelerometer
> 
> [...]

Applied, thanks!

[2/2] ARM: dts: qcom: Add support for Samsung Galaxy Tab 4 8.0 Wi-Fi
      commit: 49b9981a0ecae2bbb298d8b0c2b8058220038691

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

