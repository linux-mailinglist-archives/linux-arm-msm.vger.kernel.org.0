Return-Path: <linux-arm-msm+bounces-23499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D16911A62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 07:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 269901C2140F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 05:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF2413C802;
	Fri, 21 Jun 2024 05:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eC8QAcQf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA4113BC05;
	Fri, 21 Jun 2024 05:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718947764; cv=none; b=NxxTBUYfacYnwbBybgUp3v7rA16YNzGTkAIsXjLDdPl68Xw9qZ5GPBAsuy42dpphdoiVzRzdFGfqHVJG1kxxeR7C8+tZJdtJ35TVbBiLTQRwJ0pYk7E5qebkRZkfats7b1SnUiB1/GnSRIMvfKSWuw6+J0fWUyVhtGUrYsZ74PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718947764; c=relaxed/simple;
	bh=3Ha8JKwhF5Z2/rByQNvH87GGlHIB1dldZAvCXqFR0s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ye3qM1JuHfa+RcfXDHbu3oW+7tO8nRy6i10zBUAfIztAAft94uZjedzcx0zfmgM1lM88u53/toAUxCLHN7T/PX/UnY9gxAJm8EbRHc+z83mGZokmWz/6f4pDAM3EsB1QzlhiFWis/IKqEfa+N8UBwjyrpapsevcJhY0aEC02Z2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eC8QAcQf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7385C4AF07;
	Fri, 21 Jun 2024 05:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718947763;
	bh=3Ha8JKwhF5Z2/rByQNvH87GGlHIB1dldZAvCXqFR0s4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eC8QAcQf0/VF1Mbd02KXKc6qKqQTkG+zkvWR1dhp3u6QZ/cn3IvXdF+TFZw74FPsY
	 hztDXRRkwtSGMnkETCHAyKsVSQ3CUwhjn2fCiS6kI+QAKIMyf7KaFd5Q7ZC1eAt8Ek
	 ch/a9DCcg6Q1S76/mAimGQzPZRMNZuECbcrgowGnFolhCDqppTJv0sm2si+Df/Z+Cv
	 yvgaSvo0b/34HnYhiWkTdNGF5N7OPl1TQV0U+1aA5nyCrzrvqxTofYQBIBJldo8QkV
	 l/dcCL95ANTsCGzGmvmF00/2GIpZD5G/ICjAOZrC9f2ZpJ8DTaTzK1kcniezg9QU4v
	 /9+6HoL7QZmnw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: fix WCD audio codec TX port mapping
Date: Fri, 21 Jun 2024 00:29:17 -0500
Message-ID: <171894775426.6672.7923263657729724958.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611142555.994675-1-krzysztof.kozlowski@linaro.org>
References: <20240611142555.994675-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Jun 2024 16:25:54 +0200, Krzysztof Kozlowski wrote:
> Starting with the LPASS v11 (SM8550 also X1E80100), there is an
> additional output port on SWR2 Soundwire instance, thus WCD9385 audio
> codec TX port mapping should be shifted by one.  This is a necessary fix
> for proper audio recording via analogue microphones connected to WCD9385
> codec (e.g. headset AMIC2).
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100-crd: fix WCD audio codec TX port mapping
      commit: dfce1771680c70a437556bc81e3e1e22088b67de
[2/2] arm64: dts: qcom: x1e80100-crd: fix DAI used for headset recording
      commit: 74de2ecf1c418c96d2bffa7770953b8991425dd2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

