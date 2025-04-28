Return-Path: <linux-arm-msm+bounces-55845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28385A9E53A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 02:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B00B17ABEE3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Apr 2025 23:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F27215E8B;
	Mon, 28 Apr 2025 00:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNIe+crx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AF6747F;
	Mon, 28 Apr 2025 00:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745798456; cv=none; b=PBAvgLz6FOuur6ZZe6Umdv0G4maHD9kg2TUG97MEUeloTaoWnME+4xaCrwQhCMUKyFL2p4JjWiPAsxncXtnI6Y+tqTtFb0eZ42sJFC30WxzwLffyhocUUvOhtwdmcpbffdVcJkB9M3p4NcgflVzsPmUAGJdkZgvCtuR8lpTt95g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745798456; c=relaxed/simple;
	bh=W5vRtCF/3ch2I435tyzUXFE8e9gPD0WPo89DsXN3yFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIl/d7fT7TBul/X4IDYKDQtWuB7J2ras3NfixkI884OGQJ7BEq8CGMfOmrUsHA/W7pS/TVbqhG+l40IrvmcC7XLOGhS2d8KVeUFofI5cc3wYIylGEo7Vce0Haom/zOgN0zMMu4dAr6n4nGShwt2goDJPuvFou8xr1wWimvSQfgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNIe+crx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27541C4CEE3;
	Mon, 28 Apr 2025 00:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745798455;
	bh=W5vRtCF/3ch2I435tyzUXFE8e9gPD0WPo89DsXN3yFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNIe+crxuzWWQRBF09HOLl0icswmAE5ZEhB1btylcw3BdeE0++Wn6ufkvXhoPdvtC
	 rsZuelEPoRGVas5xWrkiOY92X3+In1cuEQYEiSaA9Ijfc8QYN6gJJ2VT1saTaTSPJF
	 XpJMeO0FqTTs7K9QBVygu/cSbE4EoXn3kWS3wLxeD5xAMqoBrDVJRP4SiXyJEEUbZP
	 ER9CFd4/S9bPByfXXwsyTeySFfDN5gxF3fvAcvq1Wnijpq7kAjujMu/lEc1wPnSKDf
	 n/mIT+CFvlO0z4WvORTyHw2bLE2iqIILGi4yiqzMmqKsB+3WPh37669kw4KvELhCvB
	 xDtwN7hFdA0Nw==
Date: Sun, 27 Apr 2025 20:00:53 -0400
From: Sasha Levin <sashal@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Vinod Koul <vkoul@kernel.org>, kishon@kernel.org, lumag@kernel.org,
	abel.vesa@linaro.org, neil.armstrong@linaro.org,
	quic_qianyu@quicinc.com, quic_ziyuzhan@quicinc.com,
	quic_devipriy@quicinc.com, quic_krichai@quicinc.com,
	manivannan.sadhasivam@linaro.org, johan+linaro@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.14 08/31] phy: qcom: qmp-pcie: Add X1P42100
 Gen4x4 PHY
Message-ID: <aA7FNcDNbb1H4Jis@lappy>
References: <20250407181054.3177479-1-sashal@kernel.org>
 <20250407181054.3177479-8-sashal@kernel.org>
 <Z_dt0F-XzGIJWhnz@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z_dt0F-XzGIJWhnz@hovoldconsulting.com>

On Thu, Apr 10, 2025 at 09:05:52AM +0200, Johan Hovold wrote:
>On Mon, Apr 07, 2025 at 02:10:24PM -0400, Sasha Levin wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> [ Upstream commit 0d8db251dd15d2e284f5a6a53bc2b869f3eca711 ]
>>
>> Add a new, common configuration for Gen4x4 V6 PHYs without an init
>> sequence.
>>
>> The bootloader configures the hardware once and the OS retains that
>> configuration by using the NOCSR reset line (which doesn't drop
>> register state on assert) in place of the "full reset" one.
>>
>> Use this new configuration for X1P42100's Gen4x4 PHY.
>>
>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Link: https://lore.kernel.org/r/20250203-topic-x1p4_dts-v2-3-72cd4cdc767b@oss.qualcomm.com
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Support for this SoC is not even in mainline yet so there is really no
>need to backport this one.
>
>Please drop from all stable queues.

Will do, thanks!

-- 
Thanks,
Sasha

