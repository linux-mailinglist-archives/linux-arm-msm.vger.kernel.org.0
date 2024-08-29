Return-Path: <linux-arm-msm+bounces-30147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 297189653A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 01:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB779285358
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 23:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C18B18FC8C;
	Thu, 29 Aug 2024 23:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/QQxC6L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F8D18FC8F;
	Thu, 29 Aug 2024 23:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724975296; cv=none; b=iY+ORiyiTTKpCxU0iCBtKTL8+1/PbtMckM7gkuq1+90fMl6Si4iqdfm+eKrWR3HMP0SD++b7fMBZgwcLXCZ0Tc5KgWxUDpRcs1s7bdRAButJUO5Kj5+SjWm7xBz3p/U9kTqvTC+XUhI2mZOsInpvfXwtW5+clNqqIhfrheYENIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724975296; c=relaxed/simple;
	bh=BH875prCn+PfwioJJ2snL1/4Hjks8Rs0vBty3m/lOMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxjQR1Ub+huZB4NqliEXjfcRdvyLWFTMVtR7M1wrLZEYgcr17CJ8/7gbqFb8fPu2+3QXPViy1nBx+2HQgAcANDOaIZo7QE8Xi7dbP+gVxsysCIE1VZuhv1gSb9/eJdoLlyGpOk+Svg95tjyNVh5QPd+YbYGRt/A0w9ukKO17T5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/QQxC6L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A70DC4CEC1;
	Thu, 29 Aug 2024 23:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724975295;
	bh=BH875prCn+PfwioJJ2snL1/4Hjks8Rs0vBty3m/lOMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D/QQxC6LVhiPSRmeMCS1xkl2Ztq3zEpen4Uib/dNVEbagWW8U0FvDpCiF/yeErH7K
	 o5IvOE2Yl6MegKcHeaef77Ji2Wb5MsFg5xcLkJpkKXZRsjRVvbu+tV/JmgisnKWUtC
	 I/BqIyPsX7ugq+pEMvELyJq1XUh2S/50jmZnEUDSSOFFU46asd+UiNJm83Wgip17rl
	 noemTpEAkntPmrUX/9GY3m6nj8oTrV9PKl0Tv7KCds0tYo1ySL5orkgfJuvvVbOnfc
	 cJrZjR2aVyl+PqBY1kiiCAHuabmoUVxLW33/+qgQLKPyDwqFnSzq+gkQRIf8t5j+d7
	 drnMozaBmcVkQ==
Message-ID: <38a214e8-6c32-4045-a5c1-c9159e81c55d@kernel.org>
Date: Fri, 30 Aug 2024 01:48:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: pbs: Simplify with dev_err_probe()
To: Yu Jiaoliang <yujiaoliang@vivo.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240829124813.3264437-1-yujiaoliang@vivo.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240829124813.3264437-1-yujiaoliang@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 2:48 PM, Yu Jiaoliang wrote:
> Error handling in probe() can be a bit simpler with dev_err_probe().
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> ---


Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

