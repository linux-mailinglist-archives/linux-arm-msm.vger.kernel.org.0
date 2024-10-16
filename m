Return-Path: <linux-arm-msm+bounces-34617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CDD9A0E50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B03961F2421C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEDC212F03;
	Wed, 16 Oct 2024 15:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHfnLT0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE0A212EF4;
	Wed, 16 Oct 2024 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092743; cv=none; b=uaUwRbT+GSDyDkdRuBQ5uhLLO480cposJhre49RtTVdy1k+be6+89sDy3HMtHxJzb07Yvpy2S8hOEIdoSek/rWO9P8tN6CVXiSRYdyizOy9laOpTU5W3g2lkcjTqD+rAHOktULtsawL5cmRjIO6KiATbcgDUggnsl1n9JUmE7wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092743; c=relaxed/simple;
	bh=ysjl+LsVvwQZLzvbVnsv64YXulN1/Zfefr4efFAmQ0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSXSYJvKJdMmL9vFKkt7NqL7uruuOutT/jh86BhNVg4ifotyZDbqDmIfNp694MfJwtSbxz1vcjAN2uq+oAnQdxnRLCAuaKoc07b9eWzc/T1wTzbo8i7c9aH2ghtQM0TWVrH1IidcEv4UHp6FCYgHpFjXgGp4ub4YILJVOaOOspo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHfnLT0J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F76C4CED1;
	Wed, 16 Oct 2024 15:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729092742;
	bh=ysjl+LsVvwQZLzvbVnsv64YXulN1/Zfefr4efFAmQ0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BHfnLT0JGS7GkdrYdaPw+9blFZAKmVh3uRtRnn6dQ7DsqMY7jRWmE27MgwPWWVCEi
	 90u3tP3+tSrOwDN1mSqm+TZl7mUY2jZzHzhObUm7sAADFopysV5xs8d9CBuhn3Tvhs
	 jWeVEXlznl1UoX2ug1oNpOMDr34nrysS0hT4USXBLmalQTqG+WPCJYLEf+uDyq8cRo
	 7jhppRUw0kvQHAwuSYCAZFdme6teXGGxm+RBPYEcyCipORTrSnHqTeywHfgmlTsw+s
	 fNs26YZwEGJdPt5lSGj2KiYb3+hcryFsSirfamgEWpr/vDCeOhtN+9XpmtuOr4vui5
	 0ZuHWz2MKLeYA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Jonathan Marek <jonathan@marek.ca>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/3] arm64: dts: qcom: x1e80100: enable OTG on USB-C controllers
Date: Wed, 16 Oct 2024 10:32:17 -0500
Message-ID: <172909273715.703216.3388545350000459055.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241011231624.30628-1-jonathan@marek.ca>
References: <20241011231624.30628-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 11 Oct 2024 19:16:21 -0400, Jonathan Marek wrote:
> These 3 controllers support OTG and the driver requires the usb-role-switch
> property to enable OTG. Add the property to enable OTG by default.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: x1e80100: enable OTG on USB-C controllers
      commit: f042bc234c2e00764b8aa2c9e2f8177cdc63f664
[2/3] arm64: dts: qcom: x1e80100-crd: enable otg on usb ports
      commit: 2dd3250191bcfe93b0c9da46624af830310400a7
[3/3] arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports
      commit: 1a48dd7b9ac809d1bd0fd2fef509abba83433846

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

