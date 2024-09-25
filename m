Return-Path: <linux-arm-msm+bounces-32462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9047898566F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 11:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 743561C22867
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 09:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A0215C15B;
	Wed, 25 Sep 2024 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="JJ4qxbTi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C65515C136;
	Wed, 25 Sep 2024 09:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727256966; cv=none; b=o3iTOf9aLzK4hDz50A+bq2MWu+it872KEOGdCfJdWqCPiBmW2vkqfd9cTdPbJj3S2wNtvworvj2dqtJkrYyQWU1w+/LIvJA9aQbByfa898U9oy4KZ80E1fUOPk1GGlvuHmA7hsZexu4Qm5EHutplhTZ7qvu6tXiOS6V+u5OIIA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727256966; c=relaxed/simple;
	bh=CSyw/rmUFgoF3lhN+3SxM6fPIijxXPqwH+NyFYCYIdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYQMOllVv8Qa+gxmvowMzKyMEuQNytyguK7TSr/zH5jDNIBAZh5PZXAG7uhKcF5FLUSDofdUllCsQji3bFCba5r7RG5HGs8+bfhtJwQz3sptaRzRv3r52IjAbZ6Eu537lcFYJPPmzFCtGKHSvyuAO9As1XtqhQu2SqHfIuxWeeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=JJ4qxbTi; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=A7Vne/vD04XPaVw8nS9P4ozVjWxkAVK8DIWS6/xVwKQ=;
	t=1727256964; x=1727688964; b=JJ4qxbTix9L0bTXGkOlhjrzJyRiGLOsHglzO8+T9BpRz7x4
	q2MTP1YQcmvco31kCMyfWsGTk6991ExI5yts8Aa9pxKjLNnjE1Tx2ynqsT4fd9CrpygY8L2jnwVAC
	4/KJT6oZyJQ3KRruhbCVmYvGL2Wvodcdoycv12pqqE4TtXqu/yd2QaaHRiXRR9WVceZ2H8kd6W3pI
	tfaqV+MHyCL7UJ6hn5gm/TDc+TQ8lPCJdHKMH4S8f0youwtQQpr0FRImBZoRjVgFYt0peoWK8ZKtD
	fnvwRgTxESmEkZriF+eH8HDTGZOoPfTTi+uGChQwWCgr1cg9+OT2egsb0S/f9YTA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1stOR7-0003iw-QJ; Wed, 25 Sep 2024 11:35:53 +0200
Message-ID: <e1089f44-5415-4a46-a8fb-9711f122a6bd@leemhuis.info>
Date: Wed, 25 Sep 2024 11:35:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] firmware: qcom: scm: fix SMC calls on ARM32
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Andrew Halaney
 <ahalaney@redhat.com>, Elliot Berman <quic_eberman@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rudraksha Gupta <guptarud@gmail.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240911-tzmem-null-ptr-v2-0-7c61b1a1b463@linaro.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20240911-tzmem-null-ptr-v2-0-7c61b1a1b463@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1727256964;9deb32e6;
X-HE-SMSGID: 1stOR7-0003iw-QJ

On 11.09.24 11:07, Bartosz Golaszewski wrote:
> The new TZ Mem allocator assumes the SCM driver is always probed which
> apparently isn't the case on older platforms. Add a proper workaround.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - use likely() for the more likely branch in smc_args_free()
> - Link to v1: https://lore.kernel.org/r/20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org

Thx for working on this. This afaics is fixing a regression from the
6.11 cycle; we already missed fixing this for 6.11[1], but please allow
me to ask: is that something that bothers many people and thus should
maybe be fixed rather sooner than later? No pressure, just wondering, as
it seems the review is making slow progress.

Ciao, Thorsten

[1] a 'CC: stable...' thus might be wise, but of course that's up to you
Bartosz!

> ---
> Bartosz Golaszewski (2):
>       firmware: qcom: scm: fix a NULL-pointer dereference
>       firmware: qcom: scm: fall back to kcalloc() for no SCM device bound
> 
>  drivers/firmware/qcom/qcom_scm-smc.c | 28 ++++++++++++++++++++++++----
>  drivers/firmware/qcom/qcom_scm.c     |  2 +-
>  2 files changed, 25 insertions(+), 5 deletions(-)
> ---
> base-commit: 6708132e80a2ced620bde9b9c36e426183544a23
> change-id: 20240909-tzmem-null-ptr-2a9ddd9889aa
> 
> Best regards,


