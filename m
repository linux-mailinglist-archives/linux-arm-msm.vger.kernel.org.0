Return-Path: <linux-arm-msm+bounces-8273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3883C810
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 17:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94EDBB25439
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 16:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0427912FF8C;
	Thu, 25 Jan 2024 16:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMt0/VGy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3053512FF7D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706200308; cv=none; b=kFvfd0xdytUX/vOWQVyYkNdMvCpQ9RMsbi4pB3EcBEaaIXah9egUrmPOfDkCdS/uSeFpopTec/eCdX5ZDwhwzGOQv1VMp2HW3wIIzANMQKBHzc53MdqfPKa2duPkgZhC+Tul30jhaVLEqfs2fLJMfRslyBbg6F3l/fWWsqoGzME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706200308; c=relaxed/simple;
	bh=MZKWkX75/WD66NsinU0R8DD7Gnp8wiXbU1Jb0hyFr+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpyKIIRJt16z6Idb8SzSuZjqEnrDtolc5V0dFuroTD96bBOA3JpBPNrvMuyksXa5siqChF+w0xr++Vi89HmpYL4bvnDk2sR9cxixXbCNEuABKSh49V3BYSy9XdMlHqWsiEG1N9TlvJAJIV63nfLUeYJP0Olv7J8dAWrwbCZMS3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMt0/VGy; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5100c3f7df1so3946464e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 08:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706200305; x=1706805105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHt9cw9hi+emNh71kc/Y1SwsbEiHyqR1F+qFgT8zHaI=;
        b=mMt0/VGy8hcd01n5ZwINxofsG1T38YlxvBHfnzw2vKMv0ZTUhGFEA03oTxvZxWfA7S
         8lxvrb+Ri1c8TAAzf+QLBXrEHqZacEcJRbjN2siU9uy7IGdZfSwxGuNMtfDWGPS4IWj5
         z8UpQWqofHmild1/CINxWyiXLv0mBQ1udLLub9mJQCdDkJjKHMUcYVbqMgSHYbUWwdJ0
         6ODl2MR5NyYAwXbwW+ocdi9dNQ9rgRfhqFGH3u87QCR5lL6mghQf3mh7g/elKmXTK9eW
         tfbRZXk1JoGhG+Tp5Cl92omwWR7D4ByCugZqSj46KJlotIU44gxMvfQKU+p58Glg4bRL
         xAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706200305; x=1706805105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHt9cw9hi+emNh71kc/Y1SwsbEiHyqR1F+qFgT8zHaI=;
        b=nKh2xixWSdunC7w179qyWuO0p9dQXY8cOr0IADtlFIjhhmrMzfmo9yqkhjulLqvfz7
         Fku0ns1NHnp5TZ9UXdEWf2fzLb8jI9oVgmW2mUjb6Qlu4hltF51pyenobHB21ihO1P9A
         iYF7Uh8WTkEXjZqCQEdwXIhg3CwhxaA0lzfrDZWuMIp672PH3njjgmVgFHVe7ONil06C
         SzTKHZtndmZ89Mus+qYU8VwAep/H6IAO9E+HQUmJprDLzS/Yh7TtRk/mAzV7gv808yid
         e2Df16cgwrDKkb5bMrW6PHitbHPGiVMds0NI7a3mEjKBYtbyHUISa2IhgqHxUPlBbBfw
         GgZA==
X-Gm-Message-State: AOJu0Yw1+AFTaJ688DkGySdAV9sHfuaH1AbP4P1yQteHrYOxwkgeYXP/
	oeBuVRpCcr7M9oFrZJhe9J6EWxB1jKIdc/PyfcT7ME09XqCbu4WI1MrsnWFPKQY=
X-Google-Smtp-Source: AGHT+IEIxBsCNyRypg+gLOgOnR1oEjXMKLRsv11AIrGxHqtyz4LYV+aOkVm+21pMQfUYxcNuLGfUJQ==
X-Received: by 2002:a05:6512:3a8d:b0:510:146a:a122 with SMTP id q13-20020a0565123a8d00b00510146aa122mr63068lfu.46.1706200305167;
        Thu, 25 Jan 2024 08:31:45 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b0050eebe0b7d2sm2931938lfs.183.2024.01.25.08.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 08:31:44 -0800 (PST)
Message-ID: <e018d258-6503-471f-9aaf-88d8eae112ee@linaro.org>
Date: Thu, 25 Jan 2024 17:31:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: apq8026-lg-lenok: Add vibrator support
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240121-lenok-vibrator-v1-1-d4703ff92021@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240121-lenok-vibrator-v1-1-d4703ff92021@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/21/24 11:09, Luca Weiss wrote:
> This device has a vibrator attached to the CAMSS_GP0_CLK, use clk-pwm
> and pwm-vibrator to make the vibrator work.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

now your mainlined smartwatch can wake you up!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

