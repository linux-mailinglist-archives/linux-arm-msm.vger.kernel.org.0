Return-Path: <linux-arm-msm+bounces-61049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 946E7AD6677
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3E293AD20A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359FA2236F8;
	Thu, 12 Jun 2025 04:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4bpqTBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048D3223321;
	Thu, 12 Jun 2025 04:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700862; cv=none; b=aJgVKWt2kTxy58O0hQCjsXjFPynN7m62i0H3KSt9aBrqceRmNMdq57MbffsxrLlFEGiQn27aTVXXkZbdldiErArq5WqlXqrTG6f/3YDrx5lY6RyVdt6FBuLVxUYrptbrw5p7QRbJOVPtGINZjoes5ACHs9TdHOsQyE0S8y21Z3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700862; c=relaxed/simple;
	bh=XrRnPW4i8g+EE6wExOMowCi5/zyzGT+vghLHGrMqlh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q2cvApz0oCi8Gi0hgmp6hpzbee8Gp3fWZzJOdvd5Tblfu2MBUkNYgJuHr/LMmDf6AOGthZcPhOIKMz2XjXZR9oNHxvvxKa75JK7ov1t629wlueSpnK32vNSQKy/YZ9EVTNFdPEDsURbLgbYUHbwanHS0VzWA41qCnGZfBTzjW0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4bpqTBM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F98C4CEF2;
	Thu, 12 Jun 2025 04:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700861;
	bh=XrRnPW4i8g+EE6wExOMowCi5/zyzGT+vghLHGrMqlh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D4bpqTBMIk6s6SHw5Cq7AiRWLWE4DyEJXAkXXzk7BE8D3gKbnfyDJ0O57ykJuTbP0
	 WPa9ApGBFAUetJeJ3jjU2CtJQm20zkztcJzbCRGe0oxv2GY9gCGh3S1ifRb0MqRpH6
	 1WoxO38vWQA3H2GgqGB7l9U9viixieEtlE5iKqUlCmLxzJ4WDgi16zvEw2JrvoeWWT
	 QlzQw9tbidhOoI9eNqgXmTtvuTeM0MqQFK63IX+EeGtQzmYV2dEByRsL6t60eR3igr
	 qJaxJcQ5V0Q9IY36pUS7pOBcmZnw/Q1HJUtEe0CTPOY8YR2x0DEwEJTMDJkgIWpire
	 pUFWQY1WZsX6A==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add devicetree aliases for mmc on multiple MSM8974 devices
Date: Wed, 11 Jun 2025 23:00:42 -0500
Message-ID: <174970084206.547582.8116096585283415678.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610-msm8974-mmc-alias-v2-0-1d8808478fba@lucaweiss.eu>
References: <20250610-msm8974-mmc-alias-v2-0-1d8808478fba@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Jun 2025 19:03:48 +0200, Luca Weiss wrote:
> Add an alias for the internal storage so it always becomes mmcblk0 and
> - where applicable - SD card becomes mmcblk1.
> 
> This avoids issues with internal storage becoming mmcblk1 unexpectedly
> and aligns this board with other boards that use MMC storage.
> 
> 
> [...]

Applied, thanks!

[1/3] ARM: dts: qcom: msm8974-oneplus-bacon: Add alias for mmc0
      commit: d9abbfd3212b5873e827e3760cc698686d7a8c3b
[2/3] ARM: dts: qcom: msm8974-hammerhead: Add alias for mmc0
      commit: 9dd98b0f7a646c08f357189e9d5e733df08f0430
[3/3] ARM: dts: qcom: msm8974-sony-xperia-rhine: Add alias for mmc0 & mmc1
      commit: fb84f0ec527c50c54ab662d45c441f6789ec3550

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

