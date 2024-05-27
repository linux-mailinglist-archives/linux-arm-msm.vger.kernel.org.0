Return-Path: <linux-arm-msm+bounces-20519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 589E38CF7E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AB9D1C20CA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E1F13C9C6;
	Mon, 27 May 2024 03:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdO8xQY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB9513C9AF;
	Mon, 27 May 2024 03:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778882; cv=none; b=bbf7L1R+YowkJAONdpgLGzu4x70LdjVMU+AKMLBJEjd7aJ9g3Gs1Fts24qRhf9kR4SCfBJwSiUUuvL2TCL1f6O9ZDBEhRk41M7ZYJOWS1p84UbYGqAhtT6ILAiJ4sr4HroNFtFegFU2vMDRwUIpo2Bs1aIQPLD/jeXqg/KMDAYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778882; c=relaxed/simple;
	bh=4oIBt+Oze7JZUvQ8I0NOz8ieFRbSdIHIE37ok0QYyyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WeU0Ugo3EjG0RripH0AqjPUJ4tJm1yztA+x1MhstSz9uFfb7YOW+getnz85KRTALgx3MnpfCjg82tr8uaVqrs2+6O0uF3KSG504Kkj9lUuYi+87/BjWqtuukv6YTndGGAF5YoMIa5qsBP66LSKD/GAI6n0+g7Nbw5YCZvDbyd54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdO8xQY3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05071C4AF07;
	Mon, 27 May 2024 03:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778881;
	bh=4oIBt+Oze7JZUvQ8I0NOz8ieFRbSdIHIE37ok0QYyyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tdO8xQY3K5SQk6CNApH6EHQvs2B77rce7Q8YUlpYDHtKPGSgQJKMi3klNJayzEiUH
	 fZhWU1+aPwChMQ5Eerf4EcvRO+pZuczL7VeapXQYTmS1xED5ctXqqmfFXO+iHNZsSo
	 l+oP5g4n+SuIGkFRtPz2SXaNhlC4fUlOH4YJKlD8VrHOt9U0ua1tCUMDfIiJ9d6VD1
	 uA98ZrADDBQo4l/lAXU9iJMwoX+EJg1pBEqzOE33/JcdtCBZbrNuRnv8PmZy44+9WL
	 aVuVNt4hrTlfDEYBHpZ23J2vgi9YtFz0F4zA4XV4meUf86u2+buPWKVjG/30L2UBxn
	 4Y3P3S3IjJFUw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Rayyan Ansari <rayyan@ansari.sh>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Bryant Mairs <bryant@mai.rs>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: msm8226-microsoft-common: Enable smbb explicitly
Date: Sun, 26 May 2024 22:00:45 -0500
Message-ID: <171677884206.490947.10451944265355674116.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424174206.4220-1-rayyan@ansari.sh>
References: <20240424174206.4220-1-rayyan@ansari.sh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Apr 2024 18:42:06 +0100, Rayyan Ansari wrote:
> Enable the smbb node explicitly for MSM8x26 Lumia devices. These devices
> rely on the smbb driver in order to detect USB state.
> 
> It seems that this was accidentally missed in the commit that this
> fixes.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: qcom: msm8226-microsoft-common: Enable smbb explicitly
      commit: 81a0a21b6159c6a9ed1e39c23e755cd05a102ce3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

