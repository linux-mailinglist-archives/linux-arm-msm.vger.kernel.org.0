Return-Path: <linux-arm-msm+bounces-28676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E15953BA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E22111C21D79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E426E1547F2;
	Thu, 15 Aug 2024 20:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVSrTCgs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88E71547E6;
	Thu, 15 Aug 2024 20:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754463; cv=none; b=jgcii78EgbVmm9JhTmn4MmWzOiVRz6LfDpPK5asmvfcoDfmTjDJJjx/RAl7SQZQin+M8qOQlw7EJ1p3tr5XZIrd3EK2jF8mN0Aovhwewssczn2te0JHE4AGtUftAU0DUXrhYBg0KVjit2FoceYPINoMzH6u/zTKbyZ9MlNy01ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754463; c=relaxed/simple;
	bh=uFuic+2vqicR7/+1/tImJdOWqzO6aQkFQ0OWS+u2juo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a2hFsbbzLRQwQeGReb/pUpEcU+1Th9uGRkgWuzka4cv9oL1xbS3cWvIK868Vvpbt3B3Y1KfINWeQV/A3oijfq3k3lwJ0YDVUdbthg7mewo8yM0YD7fXPq7RN/F8qyPUVL2f9ufpIojZ3zmhCarL9+2IlZb9akc5gE6m8cuqPO78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVSrTCgs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF7FC4AF11;
	Thu, 15 Aug 2024 20:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754463;
	bh=uFuic+2vqicR7/+1/tImJdOWqzO6aQkFQ0OWS+u2juo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVSrTCgsc2b9s3msl9x9ZrdRK9ji0G46OTHa61OMg12deauHipwFBLVgY2ixun1WM
	 sLWSpfFeRbBV1ePMMynwsPnGrnxgr+uVMwUI6Z699KjTi/NzZo6zTCYn7qim1rzipd
	 CAQl/JT1VQJqYrXSje5dwzBSxi/1/dsJWw/LGQbNy6hBV6iujQIXhrpAldfV0J6FRU
	 ie5zZdGIit33hDOuICbf4peNiJiONVxJ5GLOCn7aZfyB1VQsLjEFWMvDkvCk53SjRo
	 eervDHR4vSgTbP2TBIGbCYfgqY8OfsRDzwrYFNOcO1zrCpf0pgXz2a7fx6OwUGmFSV
	 gPUb/4atJG0RA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc8280xp-x13s: Enable RGB sensor
Date: Thu, 15 Aug 2024 15:40:22 -0500
Message-ID: <172375444828.1011236.14314234683729140549.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240806-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-v3-1-199767fb193d@linaro.org>
References: <20240806-b4-linux-next-24-07-31-camss-sc8280xp-lenovo-rgb-v2-v3-1-199767fb193d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Aug 2024 10:45:43 +0100, Bryan O'Donoghue wrote:
> Enable the main RGB sensor on the Lenovo x13s a five megapixel 2 lane DPHY
> MIPI sensor connected to cisphy0.
> 
> With the pm8008 patches recently applied to the x13s dtsi we can now also
> enable the RGB sensor. Once done we have all upstream support necessary for
> the RGB sensor on x13s.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp-x13s: Enable RGB sensor
      commit: 21927e94caa5ae05ab2361a5c6e63d52624e8381

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

