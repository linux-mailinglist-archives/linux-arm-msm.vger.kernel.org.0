Return-Path: <linux-arm-msm+bounces-43144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAA69FB018
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 15:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C34016D0FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 14:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374D61AF0C3;
	Mon, 23 Dec 2024 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdJYg8jH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073351AB6CC;
	Mon, 23 Dec 2024 14:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734963928; cv=none; b=uWXQTy3BhZV+Hm6b3dVpFS90eBsuQuNxXAWROXs4UVq2xpaQ1f0FgR0QNetV9J9KqOFit4h45pLkD0dxMtVCsUOp/rr4ODFy9b378XuG8U2sawEV5IfDxH9iYJPYgaqiecJ3RxDZNNxvfehtK5unUC3cFOBYsgHWFqG4yVATZ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734963928; c=relaxed/simple;
	bh=GILBKGvCBjSZr2xCDxzm6fc/WEXlbThb+v3LXQegTMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RnbQj2gKwfXLpMOlnfuqDFCYclGVvHsMqIx6pg/v/AIVEyAN4aUYfQViBBLgl8Esw9A1HLJFSpnwJM+Kd57ovqRVooxeVPFPkTe5zfsD71ZbAtmr0Ufv8LCuxSsrDO0oPSjhXUboEFfH4oJ2IO/dtWIV1ecieV/60IpTHvLLdj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdJYg8jH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741CFC4CED4;
	Mon, 23 Dec 2024 14:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734963927;
	bh=GILBKGvCBjSZr2xCDxzm6fc/WEXlbThb+v3LXQegTMA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TdJYg8jHlzoq5yNuwvrrkRunv/U2u7qgHRmJOIP5BCF3zY6kutwWeeXzzyZwCOqbB
	 lmVdqwhkiAkHGu8EfnHh0V9igqrcfjExcWg/BXmKI+LaPEfodxbLrzGk56qUsh2ufW
	 o7l+Fupu/j+HljBFefjet2Kk1d+lUg3LJweoknKkR02KGaMl/BlEz9fsB6ptTYLkip
	 7KwXW+KDBv93s7Ng2dBGlMiWHoMJ/b3iB6lrvH57tqRmcWQanKjZGSX0WD+9+XZ/nK
	 fFr4ImmWtlqtmzUoWj5WPKCwc1hrR0+bM3pIoqoH8foJVbxJJyC5bQ+r+4X8MuoHLL
	 V/83TOLL9l3+w==
Message-ID: <26ba3710-9f7f-40ae-a65d-e1d6e384a142@kernel.org>
Date: Mon, 23 Dec 2024 15:25:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: platform: Add bindings for Qcom's EC
 on IT8987
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <Z2WxzvKRVcOz5d2V@linaro.org>
 <CAO_MupJ7JtXNgGyXcxGa+EGAvsu-yG0O6MgneGUBdCEgKNG+MA@mail.gmail.com>
 <Z2W2UhspMZNT1TRU@linaro.org>
 <c8677ae6-a145-411c-a221-02faa1ce809d@kernel.org>
 <CAO_Mup+YFAT5oFRGYucW5h_eGcfp4C5FzF20hM6xF=qMR1DdQw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAO_Mup+YFAT5oFRGYucW5h_eGcfp4C5FzF20hM6xF=qMR1DdQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/12/2024 16:07, Maya Matuszczyk wrote:
> 
> With similar ones at the end:
> Devkit:
> EC VER:00.29.00$
> LsFv:00.29.00$
> Qualcomm$
> WoS 8c GenX$
> ODM$
> MB:A0$
> BUILD DATE:
> 02/0//2/24$
> TIME:
> 14:33:35$
> 
> Slim7x:
> EC VER:00.60.00$
> LsFv:00.20.00$
> Qualcomm$
> WoS 8c GenX$
> ODM$
> MB:A0$
> BUILD DATE:
> 2024/07/25$
> TIME:
> 09:58:00$
> 
> 
> 
>>
>> If the FW across devices is the same, then fallbacks for these are fine
>> with me.
> 
> As the devkit has EC firmware that is handled the same way in DSDT
> tables of most of other x1e laptops with the same EC, and is a subset
> of what's done on Lenovo Yoga Slim 7x and Honor Magicbook Art 14 I
> think the devkit's compatible  + -ec would be a good pick.
> 
> This conversation is getting long and I feel like I've said everything
> I wanted to say, I'll just do what you tell me to do about the
> fallback and binding filename.

Go with a device specific compatible (I think I proposed in other
email). It is up to you if you want to add fallbacks. If you add
fallbacks, then please include some summary of above in commit msg or
binding description, so there will be a trace of that explanation/reason
for fallbacks.

Best regards,
Krzysztof

