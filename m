Return-Path: <linux-arm-msm+bounces-27167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5993EC1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 05:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAF8BB21954
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 03:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4644286AEE;
	Mon, 29 Jul 2024 03:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZ1owvHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A8A8624A;
	Mon, 29 Jul 2024 03:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225525; cv=none; b=Km3j83u4toXrBYYcPb/hgyKmXgNLLrNdvoS9t2dascGluP/IAZEfuPX7GulmtL6VA8b0a+INbi1cS5hDDzSb8+5hO4PIVd9RMRnC35kXIQZt3/TslUtiu4n4Jpqmgt0Cen5L4SKcHRplloOzNMJcqeq8rohzGKbU1QCwHQpvJMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225525; c=relaxed/simple;
	bh=DcCutIRnHGIvBroxpHoWosDV9XSl7soXC29a6zMj094=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N+NSDKlzpJjN40a3ZAuhZxXWLtOcHNEP0TCz3Cb3HMLMJG8elCKbS92Vk9K1BGQr34kXztJN8oado0ADBkMyU3Z49rz8g6vJXANgqAAm5y4OSyG2xzndQ2lCe5jAwITGxW8ABAk0GhwS7W0fVj9TX5wnhKZnfRSMV61lrPDRlvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZ1owvHO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F710C32786;
	Mon, 29 Jul 2024 03:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225525;
	bh=DcCutIRnHGIvBroxpHoWosDV9XSl7soXC29a6zMj094=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sZ1owvHO5/C5CRxZnk3ZHjZwVsuLfCprzhu/7agE0IPl0FFq61ebWIw+0hkd+Rdce
	 dy9oChiwtWXmhRBi1f94qVQMO0znNn7nvus/b+GsvJdUTCklZYxnZOP9Ik10pFcBlj
	 bmtnUvVFYs6osNhmorzA37nOIFoH5W5Vj78YHSkwfqxzIKeRtFyUYZlFd9x5Uo1ufT
	 iRMVXJVhISmRS4kER/sWsKHVdujWY1BHGY7MVbRal49f2rdMkW7HoCvbsfnP5uWjZl
	 JyUlGqMrT7T/yD0fYJQadU+Z44awasVcynH99BA6jwR2Rm1OgdT3r+uDm3eOFYJYO9
	 x9jIhBFWCk8Sg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: dts: qcom: sc8280xp: disable PCIe perst pull downs
Date: Sun, 28 Jul 2024 22:58:11 -0500
Message-ID: <172222551320.175430.4080234514481079668.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240719132522.9176-1-johan+linaro@kernel.org>
References: <20240719132522.9176-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Jul 2024 15:25:18 +0200, Johan Hovold wrote:
> I noticed that these issues had been reproduced in x1e80100-crd. Ideally
> these should go into 6.11 as well.
> 
> Johan
> 
> 
> Johan Hovold (4):
>   arm64: dts: qcom: sc8280xp-crd: disable PCIe perst pull downs
>   arm64: dts: qcom: sc8280xp-crd: clean up PCIe2a pinctrl node
>   arm64: dts: qcom: sc8280xp-x13s: disable PCIe perst pull downs
>   arm64: dts: qcom: sc8280xp-x13s: clean up PCIe2a pinctrl node
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sc8280xp-crd: disable PCIe perst pull downs
      commit: 7313361396d1db9c4d5a485ec5cf904792f5bd62
[2/4] arm64: dts: qcom: sc8280xp-crd: clean up PCIe2a pinctrl node
      commit: 60a99c4c10d41f4bbb54ec8a70dbdbc98eff18eb
[3/4] arm64: dts: qcom: sc8280xp-x13s: disable PCIe perst pull downs
      commit: a59e55237c477c7003f06c0297a80510434b3fe6
[4/4] arm64: dts: qcom: sc8280xp-x13s: clean up PCIe2a pinctrl node
      commit: dfd06c0e7ff7af10b34fbd6526a08e078a1e876b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

