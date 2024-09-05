Return-Path: <linux-arm-msm+bounces-30915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF12096D9EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 599FB1F23054
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 13:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BF219CCE7;
	Thu,  5 Sep 2024 13:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZ9kSqVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8747E1CFBC;
	Thu,  5 Sep 2024 13:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725542033; cv=none; b=Ng22uE6dsclmE8QZgcgr1mujXmXxtwvKQgQd1hN8QwdkYLvi1tyjJe47QhOjMLWMkFcwU7jMVrc/aIRrGSmXyaM0JoN+rffDgGSvaedoUyGM8lU8wCwq1eCysdtAGeXXXm+Z8QykGlmeUI7Y44Re2J7OXYqB+7oyYOXiVZ12lyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725542033; c=relaxed/simple;
	bh=wW0ff2EldvqC/GcrU2aNtVQMYEYXhK4WpgRcXeEhjAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CtmLxTn9HpM2mR/jAEGzAGkERKmtlMzSQQ3zaW0GxxVm8JwGQDUI+tUBhc9SQ5rU6isq1GOfSiRDkcbT7xx/cAZeAgi6RvSJHZFxtGZEklxHBQDI4xW+0WXs/iNCCHV5l2GILqbKKTGXrTrUz2YOxWhOdI4CfLXAy3exyrADkM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZ9kSqVf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84140C4CEC3;
	Thu,  5 Sep 2024 13:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725542033;
	bh=wW0ff2EldvqC/GcrU2aNtVQMYEYXhK4WpgRcXeEhjAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hZ9kSqVfLciBWuBH9zxa2bUru4yHZCf5bFVq7czfAdtifBOCZwuhvjmUWEIiCLs2r
	 rroBcO0+m5kRDp7uag957dwhHw7v2ixo51IUm8DZVC7Upvv1fyrZGnE4C/70miQ5if
	 iZblQMiVn3wROVVjzY0c/dA+YcgnkoBeJ9UpClujgFeJZltxbwln806Fg82LOmAdis
	 YE3/GhiFxMgCrv4sSiVzY68L2ljU3eW9PE2jVTGyPQnB+CWe37oJAvdcgUKQhdfrZu
	 WUpGNI8qkfrOVM4L7/QXEwSD4y7r9RaNQ0UmHPXjbut0+eh9oSBl3dw0sURRekHsuk
	 Fqshxy0UKvvUA==
Message-ID: <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org>
Date: Thu, 5 Sep 2024 15:13:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Dmitry Baryshkov <dbaryshkov@gmail.com>, Johan Hovold <johan@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Kalle Valo <kvalo@kernel.org>
References: <20240905122023.47251-1-brgl@bgdev.pl>
 <20240905122023.47251-2-brgl@bgdev.pl>
 <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
 <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
 <CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
 <CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5.09.2024 3:00 PM, Bartosz Golaszewski wrote:
> On Thu, Sep 5, 2024 at 2:56 PM Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>>
>>>>
>>>> As you are going to post another revision, please also add
>>>>
>>>> qcom,ath11k-calibration-variant
>>>>
>>>
>>> I had it in earlier revisions. The only one we could add here would be
>>> the one from X13s as QCom has not yet released the data for the CRD.
>>> Johan and Konrad were against adding this here if it doesn't refer to
>>> the correct one so I dropped it.
>>
>> As Kalle usually merges data with some delay it's not infrequent to
>> have DTS which names calibration variant, but board-2.bin doesn't have
>> corresponding data. The driver safely falls back to the data without
>> variant if it can find it. Als  usually it's us who supply the
>> calibration name.
>>
> 
> Johan, Konrad,
> 
> What do you think? Do we know the exact name and should I add it or
> should we wait until it's in board-2.bin?

If we can agree on the string identifier with Kalle in advance, we can
add it even before the boardfile drops

Konrad

