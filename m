Return-Path: <linux-arm-msm+bounces-29214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5457895A249
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 18:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 862761C21E34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 16:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4873A16A925;
	Wed, 21 Aug 2024 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MqcT6dGp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAE91531EC;
	Wed, 21 Aug 2024 16:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724256069; cv=none; b=knn/4sK836xBgitECNf8aWWkpLPkFMGlQ0P9o6gl7t6lDC9pNgi6qRquv7X12TDwBLa6VXYH6DJ1uBtUztTiT1jOHuKh3CJk+F/fwySE0uNss103ymbV2cS0j0cfp7vcL/N1M7FmRQNkDbBKj67kXD3E91JaZix3XCKnr3ckwGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724256069; c=relaxed/simple;
	bh=CAUZXpXnG9ZvIcTVO9nouC9DEfciWXqTkgjQkKbQ0yQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=um+G1p6cjHYG7L2FcnHzeBpDwlAFoF3U6kdER1Lm7z/cufQYrz6OP2La/i2HljkiIKrdgJgxw4daI2ttzBZWFvVZvV9zGsSulEoAqKXrsmB0mb1RIMdDrF0rD70hvM44hewX2tp2TlSZD5WQASfQr92K7h/+g+1bmjlalW0Z818=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqcT6dGp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405D3C32781;
	Wed, 21 Aug 2024 16:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724256068;
	bh=CAUZXpXnG9ZvIcTVO9nouC9DEfciWXqTkgjQkKbQ0yQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MqcT6dGpFerSZjk0CBCMtpVX8LdLPJR9+UzPKn5WRncD6in7RxuJsaAJ1LiJ5w94l
	 D5re2YouVYs1IIJVK+uyWZfy8556zqKLaXJBS5fkgYmZZZ/2Aj3Eb37++Vu8i6Sfgn
	 CkED23kzdKbk9vd7uuZx6hf7hzmBqbYHv2vfWuMfBtNlQAnyHfdLmqSyADWAxbGxHl
	 bHuxC8PJ7rPgoRc49dk22JnIGyITeGCSW3WH1GHdWJUJNaQrfdMV6VTM8wb5mQBZeV
	 otJNxsWTOhLQFWTJVpNYFM2ETcDva0/jY3SPRoUr2FlGWFHxZShbBAUU/1Sq8oOLcy
	 7OE3DKhl96uxw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8150-mtp: drop incorrect amd,imageon
Date: Wed, 21 Aug 2024 11:01:05 -0500
Message-ID: <172425606113.1363342.3894007804849486807.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821140116.436441-1-krzysztof.kozlowski@linaro.org>
References: <20240821140116.436441-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 21 Aug 2024 16:01:16 +0200, Krzysztof Kozlowski wrote:
> The SM8150 MTP board does not have magically different GPU than the
> SM8150, so it cannot use amd,imageon compatible, also pointed by
> dtbs_check:
> 
>   sm8150-mtp.dtb: gpu@2c00000: compatible: 'oneOf' conditional failed, one must be fixed:
>     ['qcom,adreno-640.1', 'qcom,adreno', 'amd,imageon'] is too long
>     'qcom,adreno-640.1' does not match '^qcom,adreno-[0-9a-f]{8}$'
>     'qcom,adreno-640.1' does not match '^amd,imageon-200\\.[0-1]$'
>     'amd,imageon' was expected
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8150-mtp: drop incorrect amd,imageon
      commit: cad5b06c1fc71fe98272b26031b0560770094970

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

