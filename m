Return-Path: <linux-arm-msm+bounces-80164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E96A0C2E9EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 01:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85D4B420CCB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 00:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC5B1D5154;
	Tue,  4 Nov 2025 00:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nk4LDSoh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6F619D8A8;
	Tue,  4 Nov 2025 00:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762216116; cv=none; b=n4/KWAO1XjaNwMEY7aC6NSdlFuImlHS2jTKRe7ggavHNqorLaSGcT8oTdjnvlB7wXuQV5quU4R5a630zaKo/NIU22WwEmpEqo02c11QFfuQ51QEK8kvkqzMaF6xTwh5yiWs2jYUsDHPVqQAfpoWRu3u10nTQfvMxIC+zUq2ptXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762216116; c=relaxed/simple;
	bh=GNd8DtUH/hAFWV05+vj9sNq6QySoWHuCL5IRYvvkda0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeJZWX8RmTlMVjNHaGrCunuW4KNVj1l1sImA2CNADaVD1e5gS8xI6T9xCnV9niB4GhBOIL1iB1XJ6IcOex8LNdnu9cDgtJI8J3hj8+EX5vCYO8vxkBkcG3s3wki5+1R9yL+ymbv4QkS25b5TR+w4i0rJ2+GkzLTksmMJkfjs8QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nk4LDSoh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D07FC4CEE7;
	Tue,  4 Nov 2025 00:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762216116;
	bh=GNd8DtUH/hAFWV05+vj9sNq6QySoWHuCL5IRYvvkda0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nk4LDSohvaXE0+GDRa8nlEiCoyuHTFAWKJfhL89z6NfcsmxPjs7n/IzoNJ5GLBXpo
	 8OXDzN+JVIq+0pQciUis7mgPrQ/yUWUHQzdiCcEbSihj9yc/0qg7DBRMQ/5Lda1XGN
	 7t/SluF6IifZs9UqFuZ72q+wGN8cYrgqFehTpZUAi26L953Qh+4xgRN/NPI4Sdcfop
	 5t5y34pnZl33UofGhurk/6fUJg6+sexevt3nzSpWHdQKuZ3GRR+43+FJLLt+xpuOVt
	 IRw7m48pQZP9NCZF3RcWoeZn9Z5QRuk4jjG8iazHuka8x4sguAmuNpsCiLyQ8U9htY
	 /k2NR96K7vtZg==
Date: Mon, 3 Nov 2025 19:28:34 -0500
From: Sasha Levin <sashal@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>, andersson@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.17-5.4] pinctrl: qcom: make the pinmuxing strict
Message-ID: <aQlIsqXOBCy-qv_U@laps>
References: <20251009155752.773732-1-sashal@kernel.org>
 <20251009155752.773732-60-sashal@kernel.org>
 <1cd57f5c-d829-4dbd-aac9-b07d0e155e4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1cd57f5c-d829-4dbd-aac9-b07d0e155e4e@oss.qualcomm.com>

On Thu, Oct 09, 2025 at 06:08:03PM +0200, Konrad Dybcio wrote:
>On 10/9/25 5:55 PM, Sasha Levin wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> [ Upstream commit cc85cb96e2e4489826e372cde645b7823c435de0 ]
>>
>> The strict flag in struct pinmux_ops disallows the usage of the same pin
>> as a GPIO and for another function. Without it, a rouge user-space
>> process with enough privileges (or even a buggy driver) can request a
>> used pin as GPIO and drive it, potentially confusing devices or even
>> crashing the system. Set it globally for all pinctrl-msm users.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>
>I didn't receive more related patches, but this had quite some
>dependencies (in pinctrl core and individual per-SoC drivers), which I'm
>not sure are worth all digging up and resolving conflicts

Dropped, thanks!

-- 
Thanks,
Sasha

