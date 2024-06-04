Return-Path: <linux-arm-msm+bounces-21672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB7E8FBD64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 22:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC8C71C210CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 20:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABCE14A61B;
	Tue,  4 Jun 2024 20:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pn/4RFmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B5C140366;
	Tue,  4 Jun 2024 20:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717533286; cv=none; b=Fr54kxDJS457xC3gLLT9x+qdgG/e/2NpOFlh4T9gTPO1AhphYJpdPBFIe7rSMi8iVxDlCvcIPO+BFvx2/j9Z+fllUMfmWgyQBmkJIRgcMSEV8Mz9e4lhDFNvj/tViEOXIj6ZLilEI6lHYN/IRsSVgGdzwpWxO9t13chLx20FTZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717533286; c=relaxed/simple;
	bh=t/Iix1YlalREUNAkAGmD5+kSuxQb/H8mBr6yvJWWpR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XC73yviAF3EtQA2CdTav5eVpOGRWqm0IsDBiaDG6kTK3Dssl3Tk57Bn0we+k5i2rFioLdpV3+88+KLOdDI7IIteiSkcSmMg+h/bHnkriwHQIxglvhZnTfLsPGEyyL7ElxcfeNxXwS4qinVfZVmB4/dwm11wfo3QhGTOQg385nf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pn/4RFmP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31584C2BBFC;
	Tue,  4 Jun 2024 20:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717533285;
	bh=t/Iix1YlalREUNAkAGmD5+kSuxQb/H8mBr6yvJWWpR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pn/4RFmPccqCJvRAhqGwP335K8sqkPOSbgNHIkAscVcSqapzXr/+9/C2TmTrnwF6l
	 s5xte9A5mmM538UehYItRNWYQY2dYXae+5kS8YKttEdoODQ64LB++I40LY6zGIl/qh
	 wilToRV0sivHlHmOBsWbuMhyrLAq+CV9OrK266Ic/4g/mwaFryGczaXT2U5XTRmzQB
	 UdUy+t+R3859d38snmZpUquYQoK0mlPN5n1LmpUUNfx24Wi5kXaHwwCmymrijbIAF9
	 wDGIal7QzCkh8oFoBf8fLy0l9JoixtChSTF/XLrbHexbXu6axIcaLE6EmMqw57wAdv
	 jhPu5On0P7G5w==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] Use mboxes instead of syscon for APCS (arm32 & arm64)
Date: Tue,  4 Jun 2024 15:34:42 -0500
Message-ID: <171753327818.708182.102935741283235992.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz>
References: <20240424-apcs-mboxes-v1-0-6556c47cb501@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Apr 2024 18:23:53 +0200, Luca Weiss wrote:
> The first patch is for removing a bogus error warning I've noticed while
> developing this on msm8226 - there the patches are also coming later for
> this SoC since apcs is getting hooked up to cpufreq there also.
> 
> Apart from usages from the qcom,smsm driver (patches coming!) all other
> usages of the apcs mailbox now go via the mailbox driver - where one is
> used, so some arm32 boards will continue using "qcom,ipc*" properties in
> the short or long term.
> 
> [...]

Applied, thanks!

[3/7] arm64: dts: qcom: msm8916: Use mboxes properties for APCS
      commit: 3e971470619d80dd343e3abd80cb997bcb48f200
[4/7] arm64: dts: qcom: msm8939: Use mboxes properties for APCS
      commit: 22e4e43484c4dd1f29a72cc62411072758e0681a
[5/7] arm64: dts: qcom: msm8953: Use mboxes properties for APCS
      commit: 11dff973ebe21950c7c5221919141fb0cb16354e
[6/7] arm64: dts: qcom: msm8976: Use mboxes properties for APCS
      commit: a3d5570d8c8c6efc3d15d015b517f4e8bd11898f
[7/7] arm64: dts: qcom: msm8994: Use mboxes properties for APCS
      commit: ba5d9a91f8c3caf6867b3b87dce080d056222561

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

