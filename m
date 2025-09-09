Return-Path: <linux-arm-msm+bounces-72857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3340B5036E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 18:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C34E6360F6E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6BF3629B1;
	Tue,  9 Sep 2025 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFBt3qqs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21143629A5;
	Tue,  9 Sep 2025 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437007; cv=none; b=eRnL9aMJ1CmX+KgJSAlqERSD+WskZRJbyuIpfHe8PeBXQs6gta5IU5aTC5LBZqB44JsEpSJdwYqswLFMq4dZGot2Q9+Ko9eWRBTi5n29F1QOZTRv6TbCaWbLr9Gv11LOevjO2EnZFB05MbBQckbQssM2HiZSdA5DorR4prsswPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437007; c=relaxed/simple;
	bh=FReHiVM1MCdEGWk46H2+ByCbhpaLYp97Kox1znfUkjU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vwq5kv/uR7kQt8+XykUxTKNiEFRnociTBETJjNcld6+/V39F4MsPeNH7FxuJuLguld3eqwqvzMVNnR32YyS1iqxyRxfRKbztT+tnEIODyiuqbgQexMQi5D+V/7bfaFuwOLVxXC61nVXZ0CuDCNIttiznQMLZphCpWoMqmiqYGZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFBt3qqs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFD1C4CEF8;
	Tue,  9 Sep 2025 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437007;
	bh=FReHiVM1MCdEGWk46H2+ByCbhpaLYp97Kox1znfUkjU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bFBt3qqsasnvGBjRKp5NCEeJJ+sbXRrHeH5ukGLkZpqzlur/PO8BkzXeqKKLSiDNV
	 jN9rOk9mrGpU0cK+K9wK37i7ZRimdFtleuOxoqMtzBib7ek1mKeDR2YpcUDNXWYkA9
	 olvxCP8BR87Wke14Oxsj2oN/tJ+Mgj8f3ahYGrMO0NcmRMd161Cp2P93yG6nfmJgct
	 SbfAINyzTKaYJiQytMY77uYHReOYdp6wBxVN+iQDcqvoCgkW5nZkgN1vwAhE9qBDAU
	 tjKzM1RV+ZrVpxAiZfOpdAajWIiSxBykU+pxKb5uZ8n/IuVvtEYRp6cB24mmW6O7tp
	 tTZNDJQNVZ+bw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Drop redundant status from PMK8550 RTC
Date: Tue,  9 Sep 2025 11:56:35 -0500
Message-ID: <175743699549.2735486.15809929363689390983.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250908085331.56478-2-krzysztof.kozlowski@linaro.org>
References: <20250908085331.56478-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Sep 2025 10:53:32 +0200, Krzysztof Kozlowski wrote:
> The PMK8550 RTC is always enabled in its DTSI file since
> commit a791fc19965e ("arm64: dts: qcom: pmk8550: always enable RTC PMIC
> device"), so drop redundant status=okay in SM8650 boards.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: Drop redundant status from PMK8550 RTC
      commit: 318d441dfe6f40002dedb163f7d0fa493e225f67

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

