Return-Path: <linux-arm-msm+bounces-20681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6B38D12AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D20CB22D51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607604D11B;
	Tue, 28 May 2024 03:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4sxVEAD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DD515491;
	Tue, 28 May 2024 03:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867168; cv=none; b=MdLPXJu3guZzTRvcNHWCjCPQkzwLKtUsVAASsi42hgu8zIf4CUANqkYpJKsTJLDR1u6KU2zLMhOlQHchS9+qx+YmNr6DLYG2PFYPM/Q/4wN56d9yOpDu6fPbdtQ14O1drRLv51S0Wwl3X4dl6Lwy0qhXloKBZFe4Nn8sdAbnCgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867168; c=relaxed/simple;
	bh=xf5C3FDeTtddTI7gc1BWXkPMUyU1jL7E4TFdgNgsAE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oiCX1cUosBNrNrG9fEMKg65SUn+R31Gf+oPHeJYiLYVuXLSgAMFHeLkQEDUvH4gptRgijg/q9lXg+UfaIPBSDl+wUUTRYIT4F8XKomwv2YnYW4ZdzSN8xOc+VK9K7ov89T54NmR/xPCP1hJPyexOHASS/0ASHl+mWxTEMm8JGvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4sxVEAD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD18C4AF0B;
	Tue, 28 May 2024 03:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867168;
	bh=xf5C3FDeTtddTI7gc1BWXkPMUyU1jL7E4TFdgNgsAE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T4sxVEADSksI673D62G3pGErU0lDyBl4S9wA8joNBPndRI0tQKuW2joos7lGucFQc
	 BR0v1SuMplZOjgGEypdZoQeeE8Rn1grdIeg7mX2XBrzYi71ePN+OJm0poeK3jz9vs9
	 No60rBpRJDUPxrYxUJ8aCbK8Bg0no1EWbLuXA0ntf0MwAPhhctiWk8EjWuz4wXDtBD
	 uw9hQncfm6v0/5J2hy/IL9qHHIaJ5ob4F1LgHgYXwn9uWLFyAKHlzaMH4IuwCm/s0I
	 NhMGX1aVFOseYUQhkXNc5Ab81YzX1PYk7IsJOaDnJw6bYpyKo7wm+PG06Pwh1Y0YAP
	 WlrlQfMukACPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix IPA firmware path
Date: Mon, 27 May 2024 22:32:14 -0500
Message-ID: <171686715142.523693.10826855816263922050.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527-yoga-ipa-fw-v1-1-99ac1f5db283@linaro.org>
References: <20240527-yoga-ipa-fw-v1-1-99ac1f5db283@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 May 2024 07:00:22 +0300, Dmitry Baryshkov wrote:
> Specify firmware path for the IPA network controller on the Lenovo Yoga
> C630 laptop. Without this property IPA tries to load firmware from the
> default location, which likely will fail.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix IPA firmware path
      commit: cae4c862d8b2d7debb07e6d831e079520163ac4f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

