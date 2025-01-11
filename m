Return-Path: <linux-arm-msm+bounces-44813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F973A0A5F9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 21:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 810393A8624
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 20:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA7E1B87F7;
	Sat, 11 Jan 2025 20:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOKCdF9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2381B1B87EA;
	Sat, 11 Jan 2025 20:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736628230; cv=none; b=mA5SIHn0j9Uy3RCHuaQkb0D7+Tftkks2DtPFIkLKqmxeSXFadD6DC+gFgF3IrPaSQD7y9zRSvRl1GyZcn3pvzIwUbQDF0KIClUE2+GHwIqA5u6wUs92/Y+zx9x9zC/o9niSf2B1CDlvpC0KxLRPvdfWPABgq+L3ep2CfgSKSvL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736628230; c=relaxed/simple;
	bh=i3ohCwWuPojAbZHy+npGrANyo56kkxySOrwgtHKKL7o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N2e1Fqyx4lbw5MxEaKzgoVAeC4hnOv2agz6CAFEUtsB69Y+SCgHpqlemiICqEJV3F/TbcV97s7Tk2Uyddt1awuDQKMLGW21TvX4onN4aJ4uwrUUfkxQR7mxzA2NIDwYahe2L4MNczGGTU0Ush8x9plX3DhLRHJYl9Z8x8fdge4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOKCdF9e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58599C4CEE3;
	Sat, 11 Jan 2025 20:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736628229;
	bh=i3ohCwWuPojAbZHy+npGrANyo56kkxySOrwgtHKKL7o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TOKCdF9eUCCI4oHpFP6HNtLKyg8chAgbZ55PyVw0Z8bqw/yEtgIkKUsT45N0JvbhA
	 2hlP+swcbS9Q/TBJckRRCjOTV4+CGkLa0V9VQfr84TXONULMyhulPSZqKh88GSon9L
	 MJ+WRfF9bo+Y0L5+O7pEUcptw08tUqszp/R8XWaVhgl43XOnxrklm1um7sEeB7Ntb9
	 EwEf2YDmBVgQyghNmb4fmi6O6HDDKhJAymTZ8PG4g7p7mSnQMVzNPJAenFerKLCfBc
	 9tyi3+A+bwYMKrTCRKJ3w6F5ry/Z+DZ+qegV5zGu6LkahgJc3Q+xcu4Wf3uCwGnZD0
	 BGyd6uC6K8ILA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink: Drop redundant pg assignment before taking lock
Date: Sat, 11 Jan 2025 14:43:45 -0600
Message-ID: <173662822226.416676.10210723833467956622.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250111172326.101779-1-krzysztof.kozlowski@linaro.org>
References: <20250111172326.101779-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Jan 2025 18:23:26 +0100, Krzysztof Kozlowski wrote:
> Commit e9f826b0459f ("soc: qcom: pmic_glink: simplify locking with
> guard()") was on top of a fix [1] which was moving the 'pg =
> __pmic_glink' assignment into the critical section.  Unfortunately the
> actual fix was not applied and instead rebased version of the next patch
> got in.  The resulting code is in general correct, but now there is a
> duplicated assignment 'pg = __pmic_glink'.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pmic_glink: Drop redundant pg assignment before taking lock
      commit: 576d3e274a45cd528978431db54d0ffff04d2964

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

