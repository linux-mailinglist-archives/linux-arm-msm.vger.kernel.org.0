Return-Path: <linux-arm-msm+bounces-79030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33272C11C17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 069C31A22294
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297983321DD;
	Mon, 27 Oct 2025 22:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvRWF2YA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016CC331A76;
	Mon, 27 Oct 2025 22:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604498; cv=none; b=Ddq+ipISwtujAhBLDhwBtFIC7/s6/w+gvRsPUPYY3uvBruFGpZP7z57KapqHlEU2r84MjmB/cw5nS8yrPXYC5q1bn7UmbQOuDUfEsxyBwH+0WJlzBsBMoOr9qZQMigP7PZKxE9xnRPW5tvGEr3tRypZBc1COYt/fd5H0mb18ONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604498; c=relaxed/simple;
	bh=pNvdR1WIEhGAfr/vd1Vos5+a8d4ypKt3XzWs2/vgzyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eqzRIyVtvMcP8SaUMBxFYa/8kWyW7yrTGWE5r0Ah199BVJNLpJOr9mqyXN4onpdIyNjQA9I2KTAXLWPfU4nR1SuKaw9geJ8uzoQ9PCepCntaiMsrjPDrz1uu76EovSBcx6w63Iyw3x5Er34UKvNBgD5QvcsZYgBxX8Iq1NGFEEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvRWF2YA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95EBC4CEFB;
	Mon, 27 Oct 2025 22:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604497;
	bh=pNvdR1WIEhGAfr/vd1Vos5+a8d4ypKt3XzWs2/vgzyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DvRWF2YAZpc5uTdfze5IkrJzTmqIhGCKM7fxHLkwZlO+CtTg1pB7DXbAsDt9prqwR
	 oC5N/QLETXVphsxwJcfv3IYK3MZC9uTYRVg0/Nb+LpCy5/M5PocJnIDli1A7YfBRdX
	 7CiqWT9EyUXUDOKVzBRoNqXmMD6aLdtJuLnjNFrqtKMVVBVi96jtNas8tPPIZkRIGz
	 xjqB19LjEiv7ZLubI8ttssGF8qbyf5i7gd5DsdEKB7MAVApJi0dbZKATdFGdN2uPvF
	 ytP0sxPfjYHJzU/q45heWVErDzJpT9ETrTd4zyZ7bHvIcTmsn2mPhT0Iw8lM4lERn0
	 yvLverdyMfJag==
From: Bjorn Andersson <andersson@kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/3] starqltechn: fix max77705 device irqs
Date: Mon, 27 Oct 2025 17:36:51 -0500
Message-ID: <176160465198.73268.5619968947710161219.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926-starqltechn-correct_max77705_nodes-v5-0-c6ab35165534@gmail.com>
References: <20250926-starqltechn-correct_max77705_nodes-v5-0-c6ab35165534@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Sep 2025 20:13:25 +0300, Dzmitry Sankouski wrote:
> For max77705 charger and fuelgauge subdevice, use max77705 interrupt
> controller.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sdm845-starqltechn: remove (address|size)-cells
      commit: 4133486382364f60ea7e4f2c9070555689d9606e
[2/3] arch: arm64: dts: qcom: sdm845-starqltechn: fix max77705 interrupts
      commit: 4372b15d89e253e40816f0bde100890cddd25a81

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

