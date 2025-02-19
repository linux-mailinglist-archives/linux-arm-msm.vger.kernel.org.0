Return-Path: <linux-arm-msm+bounces-48528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 735D2A3C411
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 16:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CF8A16646C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 15:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0C61F9421;
	Wed, 19 Feb 2025 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5SZ/Q8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6E21B983E;
	Wed, 19 Feb 2025 15:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739980061; cv=none; b=sNEB44uSt6V50r8curJhJP01xs+ZikhGyWVNkbV/1kj99P0DaZwK/iUATqHU7jKS8vmXHM7tv3175so7XGZWKdMegEppZxRtJdyr8cgaRlb+SXvpZQur8YrGWmuuLSUuIkw7Ze2EkJfLi54eBs5B2xsgDw+A/x0nL6+3fmavXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739980061; c=relaxed/simple;
	bh=Mv6lw/jGIKU2yqM0WT6dMZP0js12PkMDpy+2BlT3EXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBjWlFzVVER6/CWJj2whrbhA7h8HGhWVHjJi0iUABKPIjMQPxddkLyGyN6u+S3YWyZWFySdIYyYMM2714IPoq6PCok2uX+AFdSdBIcQ6gxfrpUuZa5Sfpa8jUdwWXYIQM4Eo05l1qs2CZ7/Mv8ZmNX3FOiWRH+PxF0PP9Ps0Uis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5SZ/Q8T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8154C4CED6;
	Wed, 19 Feb 2025 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739980059;
	bh=Mv6lw/jGIKU2yqM0WT6dMZP0js12PkMDpy+2BlT3EXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5SZ/Q8TlTSym5axjkf4B0lABrOiAJSE+3+el4CHQbtqYyN/b/ilxkiY48sXr+Xsj
	 cYpLq/2PqYLL2qdn6UrWRW1VzY5OugiKJ3bn5bZwzRda1j2DoZaW3T2iO8uztbXlGT
	 VkMjEJrOcuWe6COfPz1qOXp8Qx7sZpSaI4bF7znbicNKtvrPXnohDtAwCUjDHSIbvu
	 VA6NOM4aNe0Fyze72UVZ2FvouWj+R04uzRCNLZBg3Yngoqm/4Tm3tp4+sPzdvYXYTw
	 x8MMPXpLulksa8cufMmh0mzaP112b4Nw7hYo4amSRjD7k2Bh+sHMG0Pho2dqs/3jih
	 +/2vzZPWx3+qg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tkmIe-000000003ew-3yZ9;
	Wed, 19 Feb 2025 16:47:49 +0100
Date: Wed, 19 Feb 2025 16:47:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: x1e80100: Drop unused passive
 thermal trip points for CPU
Message-ID: <Z7X9JIDVMorYGuS1@hovoldconsulting.com>
References: <20250219-x1e80100-thermal-fixes-v1-0-d110e44ac3f9@linaro.org>
 <20250219-x1e80100-thermal-fixes-v1-4-d110e44ac3f9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-x1e80100-thermal-fixes-v1-4-d110e44ac3f9@linaro.org>

On Wed, Feb 19, 2025 at 12:36:21PM +0100, Stephan Gerhold wrote:
> There are currently two passive trip points defined for the CPU, but no
> cooling devices are attached to the thermal zones. We don't have support
> for cpufreq upstream yet, but actually this is redundant anyway because the
> CPU is throttled automatically when reaching high temperatures.
> 
> Drop the passive trip points and keep just the critical shutdown as safety
> measure in case the throttling fails.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Looks good. Perhaps we should backport this one as well in case the
current passive trip points cause unnecessary work to done for no
reason.

Either way:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan

