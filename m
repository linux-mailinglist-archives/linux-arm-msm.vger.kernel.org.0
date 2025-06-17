Return-Path: <linux-arm-msm+bounces-61638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D545ADDDF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 23:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FE543B6EDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6E52F273E;
	Tue, 17 Jun 2025 21:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGhOi+vp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A6D1898E8;
	Tue, 17 Jun 2025 21:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195860; cv=none; b=K7Xr+ZYltJ3Dhg+XHcLfFyqnUHRAswgGBDe+kVlWnEly3hI9t+flkDpADJ1bj2aj73e8zkMZJhd3cx+zYc3yTRGXnPBTzdwsdqOCgp/2WEhAbtNQ5NVmi0ANMbgoexqpJ5FIXtYQD9OFVEBBlJxOD+NjglEUc1UseOSdepHMLpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195860; c=relaxed/simple;
	bh=HLdj1RAJaIGD84HxtDU2IWkE9JCDgRDgJcFGNUfCqH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UlWWbMAVRcanrk3GH6EOa0PoSM8aM3ezl/hwMsqVpt2cofLNW9BCVycyHec4Z5Y/gEJgNEhTBgpyubJk/aOaWqf44EZyye3ZI3mFFkeKMoxvnuTXAaC9zhobLAILvpT1hfGieiO3F6nn+AcFxT9WX7vkWsHrSQ1CZ36XfvEGQ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGhOi+vp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C16C4CEF0;
	Tue, 17 Jun 2025 21:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750195860;
	bh=HLdj1RAJaIGD84HxtDU2IWkE9JCDgRDgJcFGNUfCqH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QGhOi+vpR9TlQ2Ti2FHJfG2ck6o8vb630b1z3j/RfBIaCpw/rLAMy7kazloYLDmiy
	 GDUP5reHo9d/pOIXTr3iaV6cA14HlSvpB4zCD8mQ9TLIuBsls6dX81sn6LDhayejof
	 ujskiXK1cOlkILEjuveS7eZM8QsEeab1F54E9bDJS1gqUsgesArNQZaKr/87sBWZ1g
	 Ta093XNYkDl3G17K/B6SAR3nmxxUrrmogfnCCp2AJm4A9eQz6+vONAqaFDhEHeVx6A
	 Z6GhaVF8FHKfl5ypyFWdrZCX2cpnZnjiAnIdtpZ6OjlcXdBw8FlWVPwmr8QG4SkpRs
	 PONVr5I76JMCw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] rpmsg: Use strscpy() instead of strscpy_pad()
Date: Tue, 17 Jun 2025 16:30:53 -0500
Message-ID: <175019584843.714789.14726473013728304074.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429104543.66927-2-thorsten.blum@linux.dev>
References: <20250429104543.66927-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 29 Apr 2025 12:45:43 +0200, Thorsten Blum wrote:
> kzalloc() already zero-initializes the destination buffer, making
> strscpy() sufficient for safely copying the name. The additional NUL-
> padding performed by strscpy_pad() is unnecessary.
> 
> The size parameter is optional, and strscpy() automatically determines
> the size of the destination buffer using sizeof() when the argument is
> omitted. RPMSG_NAME_SIZE is equal to sizeof(rpdev->id.name) and can be
> removed - remove it.
> 
> [...]

Applied, thanks!

[1/1] rpmsg: Use strscpy() instead of strscpy_pad()
      commit: 28b825975b8feb352e996d77f679e790b4d84913

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

