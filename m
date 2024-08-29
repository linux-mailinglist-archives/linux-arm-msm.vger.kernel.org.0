Return-Path: <linux-arm-msm+bounces-30136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D368C965211
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 23:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12B221C2120D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 21:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4006C1898E0;
	Thu, 29 Aug 2024 21:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pYYTadF2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139E118C009;
	Thu, 29 Aug 2024 21:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724967276; cv=none; b=NfjFcf9SJfhgSSDAVofDPnxfZG4BqRxN4SWkgYPdQ93VPEOpOH/IXQaebCPV1zgRHEeOQQ6K7Iho8CRVGVLf4ZgjGAAN5pcK67I4PKZZ3k7A3PCOBHm7cPBfJ1UAylfRzpIl+yq+cextytbPC6d5r29YDIXpp3I09IF9lX8HkoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724967276; c=relaxed/simple;
	bh=NhI1MGw5O8NlxxSvfTqfFzLEWRaKeD6kKZzqMi3QfBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpmGEbYwcOCSYASNQ3U09sZ9EKeyvv3WV5wPVrTURSGUCsoG8gApTGkAtM/c6iBP6s8gsaGO1lQpNw6o2vshygOGhvsN63yoU0A2reb1wYcjkMULrb8SFIGDMpsyyfvaopmiCEvSKrISMqKItb2TBXN5jj/AChto5FdpmWW7l3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pYYTadF2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266EDC4CEC1;
	Thu, 29 Aug 2024 21:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724967275;
	bh=NhI1MGw5O8NlxxSvfTqfFzLEWRaKeD6kKZzqMi3QfBQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pYYTadF2TD/FsKyHxiI5TCjJk0BNC6Suqt1lIH1cHmfdNPmLhne790y9xPYxDQlgM
	 2+mLgjOgzs4kC9FH+YkhchiKRSfnwXdZpKJuO0q/erm3HzkWETt0k0RVC2ClLJxJhF
	 q8iS+K++1dd70iYdhKTJw98DDBvebyuBs+nKFBYgVd6fgpXISaSPS20Rl3S5phwnet
	 z+9Hub5H7IDQ7E4wQNzvpFzcuVNuORkC2BHwfzBhUHLE6HoOfkcPl7Mz1uidjk6jF4
	 7pHIjDllLpuRZMvfj57O3KBl7t8HrrYOGtgU3gtnAaAocXLD8OVsw6rPHEaDeiZ/kL
	 Hf1bJrmzokYNw==
Message-ID: <e1d99e29-629b-4a5b-ace6-ff56e2b5e05a@kernel.org>
Date: Thu, 29 Aug 2024 23:34:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add orientation-switch to all
 USB+DP QMP PHYs
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240829-x1e80100-combo-qmpphys-add-orientation-switch-v1-1-5c61ea1794da@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240829-x1e80100-combo-qmpphys-add-orientation-switch-v1-1-5c61ea1794da@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 1:44 PM, Abel Vesa wrote:
> All three USB SS combo QMP PHYs need to power off, deinit, then init and
> power on again on every plug in event. This is done by forwarding the
> orientation from the retimer/mux to the PHY. All is needed is the
> orientation-switch property in each such PHY devicetree node. So add
> them.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

