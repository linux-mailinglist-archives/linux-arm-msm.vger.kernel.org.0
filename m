Return-Path: <linux-arm-msm+bounces-51505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 889B6A61BEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADD7E166540
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7925222CBC1;
	Fri, 14 Mar 2025 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgxoKlIr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED55205E01;
	Fri, 14 Mar 2025 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982527; cv=none; b=YpLzFMS9XpoZ9RNyRu04OrIaFbkH9q3aziyq+FhbooaDIyTmKYULBwoZGX1p9hMXExaHUwkdM2z4yVgUR9ZtD0yxsibbLhtATdRC2WSlHtfTg+i9TpmMGCmGSXWPWsBIJWIS7AxHpKvT1abgVB9KVZXRSm7c83lq9YmxXUizXTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982527; c=relaxed/simple;
	bh=L6vgfaLSzlfsSEVvfVqh3IC1CrjNDcTCsQfYaobv8v0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O225TVabDmQbvhCzs4jF455+7a4xeNLYdz7aq1oBChKTrMIXxQYS6FYG0sWkmGppC/O61aVF4cOkb2cZiGUyiv4iO+x2WlTHPdmBLE9u5eBvSy/2ofQXdI7CsOKy8NpVDMjrN80IPtJcXPEY4Kkz6V7bb20lEwCgJdLCRLsfRaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgxoKlIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564E9C4CEED;
	Fri, 14 Mar 2025 20:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982527;
	bh=L6vgfaLSzlfsSEVvfVqh3IC1CrjNDcTCsQfYaobv8v0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BgxoKlIrU0NvtWZisal07mJXtjnkoyGpSZJn0sEaMwTbqAg8gj0curHiYpj9IAusG
	 k6b0EjbXs5kjrWbydV79AkfMWHYhUDILH4UD3Ch3OYCCmL6fNm+/JrMD9Z+dIT0MTG
	 9kiEaXzqNWoZeEyxRsrEEMuTGHsQziWEIuF4jrJlWIbH7e9DdnHuPR/aSmLYHUgHpb
	 6aQYcJVwgTLkaEL5HdfWUqAsnUyQI4KxAWKFlC4m9tx+wf4OFtSYyKsYiQJDxaxGyQ
	 RPbPVbNtOj6zpU5Q4Q4zPkwwcaLF0tCihRbnObZt9qJww3fqsre258Ql/Qc3uMplcc
	 9AFE1/nXHgKBQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Drop duplicate DMIC supplies for X13S/CRD
Date: Fri, 14 Mar 2025 15:01:19 -0500
Message-ID: <174198247901.1604753.17679563363343872759.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20241203-x1e80100-va-mic-bias-v1-0-0dfd4d9b492c@linaro.org>
References: <20241203-x1e80100-va-mic-bias-v1-0-0dfd4d9b492c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 03 Dec 2024 18:44:01 +0100, Stephan Gerhold wrote:
> Drop the duplicated MIC BIAS supplies in "audio-routing" for the ThinkPad
> X13S and the X1E80100. "MIC BIASn" and "VA MIC BIASn" are mutually
> exclusive, only one of them can be active at the same time.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sc8280xp-x13s: Drop duplicate DMIC supplies
      commit: a2e617f4e6981aa514a569e927f90b0d39bb31b2
[2/2] arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC supplies
      commit: b49e37de8e70bc433b526a9f4382f72b7ac6492e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

