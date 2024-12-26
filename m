Return-Path: <linux-arm-msm+bounces-43430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4649FCE9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66D5416311A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D351F1CDFBC;
	Thu, 26 Dec 2024 22:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dr/RKrfv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83ED1CDA15;
	Thu, 26 Dec 2024 22:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252744; cv=none; b=XIXE5wE1ClCjtqky1Pc7YwDbqftPZlLUbWIGatxQI2/mOzv1LwLVYGZBi8i5S3Ki2IuLAYzTWuKHWW7gA8vts2v5PAfKrC9xrkYQicuTZw1/DYK+E+VHCGkmFrTrI7y4X2Rb/r7uSq22X4F1+N+E2dFuR1kTNU7CTzHOnhTN6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252744; c=relaxed/simple;
	bh=lKH/4cln0sE52Lv6TJc1V0uDfCe8rzgz30O+z/efP3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u429Vo9BrcgJfBFqEL7cIYUaMTXtYOP5CHnro5wvKPjgaiGC/VzsTsrMw/+S5rU8EYnhK/2Jt1a+CI60XL7J9lBPhnXF4tzDvfCypumch9E+sIZG9jRognaJ6opMQr2RuzNXR6E4lLU9Sy1rO49OHAO7x131JY3Q1Ybqh5vAnrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dr/RKrfv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369F1C4CED3;
	Thu, 26 Dec 2024 22:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252744;
	bh=lKH/4cln0sE52Lv6TJc1V0uDfCe8rzgz30O+z/efP3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dr/RKrfv0LdEDos6FSdqD1GJ9bdYSIiNviOxPMgpxScW4hKwbRf4MoLazD/bLZWFK
	 Lc2x78k2D4r7JDAA7NtHHvfu+CEKHbw0MduGE5mUTdLoa55SWIabnBsPPWkTixcPis
	 hZ3E901I3MzPZAmsfh0TfDV2sWwz5tWZoeQ3YyHiCHEYHqnuSlS3K1zkUkMXkFGEXu
	 4DcTGqFjsx1L8dC3nQJvMJIfTqONIxLaIhVT5hXxoQMK9j29LOMvLe/DOtmmL455VK
	 0/RodC5nQJWqzjfNxWG9SfHLisCYqWuCpwlRIbS029vXZqHK3bbWmtJczpd3fJbS0c
	 L9Lz2GKbMzoQg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 0/3] arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14
Date: Thu, 26 Dec 2024 16:38:34 -0600
Message-ID: <173525273251.1449028.3771578833072395409.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202-hp-omnibook-x14-v3-0-0fcd96483723@oldschoolsolutions.biz>
References: <20241202-hp-omnibook-x14-v3-0-0fcd96483723@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 02 Dec 2024 20:41:28 +0100, Jens Glathe wrote:
> Introduce device tree for the HP Omnibook X Laptop 14-fe0750ng
> (hp-omnibook-x14). It is a Laptop based on the Qualcomm Snapdragon
> X Elite SoC. There seem to be other SKUs, some with Wifi-7 (WCN7850)
> instead of Wifi-6E (WCN6855). This dt explicitly supports WCN6855,
> I haven't found a good way yet to describe both.
> 
> PDF link: https://www8.hp.com/h20195/V2/GetPDF.aspx/c08989140
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add HP Omnibook X 14
      commit: 6ba121febf852718afa48d0ca062a74fa7cafe1c
[3/3] arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14
      commit: 6f18b8d4142c3174e08136f0b1ce400441d53330

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

