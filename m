Return-Path: <linux-arm-msm+bounces-18902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD9E8B6E6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 11:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EE0A285964
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 09:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49494127E2F;
	Tue, 30 Apr 2024 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fuKfgBAf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF18D128362
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714469680; cv=none; b=b+j0q7pWqyaRpbKBRGyc04KAu6k12kHXJh93FQOiK1oRvl2DDvG5jjmx0W8R5I/lYb8A51m+vaeiUNrYtA0ltRP2kF+sxnQ+usuO5Q9Rhp2SBXIJ6kAQBsOzt1ada1Hhs9J1eujwDgPf6m6NPghb22X3qvXGOJWRZV1CkAXckbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714469680; c=relaxed/simple;
	bh=k9NWBESpvLG5vWGkgDECyGlUm6v7jCcZsE1y+XKUUCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gsjhl9SUSdJSrpMYcwrZnu/dSK84ljX6Bn0btF60vlQ6NeAp/e0/TrOWatSTZAXQo9qwxMbyRV6bNfRfVcsLPANbwNOmX5YjZ5Zb/amgH6obM10ijy7kqNqo9TmBJa4DwK0mmtB4CDcCAx4/fAkId5U9Rof7GePeUdLZ+9gSpws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fuKfgBAf; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-572a092dd2dso238278a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714469677; x=1715074477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xpI5WAoKM9x04SKzVc9sX1ORhdeI2ZrvsKIYhkvbqIo=;
        b=fuKfgBAfaKQaF/p+fvnGIU/0vLX4APoJVGhPFi3iPdehG+op+bOiSruEejjiqyePT/
         IVVe7uB328aGrwiJC+aXzZBoKQQnxaTtUj1nGvh7IShSTaVOh7EU2dACZIb1BRjEPU7y
         +KU1rIR5RkMiXUTzTgBafRf3XTd3bmYUJQxsN/WNlolUjk5oc5OKjv5dx13gNvzJoRos
         7CdVWcGRKHX6ofpEEU+dUObBSEZ7exT4svP86a5V4a6Kf6ADzshV+SpZjF1y5MllawNc
         FMphnMhNcrNW5ujypuL+Xp9MUtXf/prT5sylMSUarQx/MRiRwYxgHRGiTlyDPpbqfhbn
         Mzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714469677; x=1715074477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpI5WAoKM9x04SKzVc9sX1ORhdeI2ZrvsKIYhkvbqIo=;
        b=EkwuJ+6nI5VzKJw7pO8aUGTluO2Pzq27bh5ZKcuEQXExzeypPwl5CrPKmDR3rJ+YFy
         ENXlgK8tv4UdWOfKOb84frKPYcpHSTICn6ExKC9CJTF0C6IHJ3xZ2KogwRtu/fS01d86
         aP+cwKxAc9Q1pcljaXN3Da6leBAtVMelxDUcH846u8NbsBg3Qku3iejPymdaRPad+x/g
         5Q8YlwPCUloOtyikMgDes970e/oUXY4ZCjZGFDga3HTO+erK8zi7POpwpn7Me57CBFNh
         P1GiL5SJgPHDh64FcsWOlSOdpAl/Msw6+UzqnLZy144Hs6Q1inppOSg8fHseynx1cVSS
         oHAQ==
X-Gm-Message-State: AOJu0Yx6vOmFkjXb8FgEcpdbeT5prcL4AorG6tU8bftK5QyD8218juQk
	gk3MkFf1yEuqb8ZZ57575B9L/iH/ttcDCOXhjgo6jSFdXsytGRTbpWNvM8bTrW0=
X-Google-Smtp-Source: AGHT+IF1hRM0MWJpCdc02GqdalwkS9joDUtSdv8iCT6RCkzWaJB273u6HmJra4KNhwmTA9fs7r7nRw==
X-Received: by 2002:a50:ab0d:0:b0:570:1ea8:cd1c with SMTP id s13-20020a50ab0d000000b005701ea8cd1cmr1510922edc.35.1714469676955;
        Tue, 30 Apr 2024 02:34:36 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id r19-20020aa7cb93000000b00572031756a8sm10071242edt.16.2024.04.30.02.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 02:34:36 -0700 (PDT)
Message-ID: <a35c0e9f-9f1f-44ea-8248-cc632c6db291@linaro.org>
Date: Tue, 30 Apr 2024 11:34:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] arm64: dts: qcom: delete wrong usb-role-switch
 properties
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
 <20240429-usb-link-dtsi-v1-11-87c341b55cdf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240429-usb-link-dtsi-v1-11-87c341b55cdf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2024 2:43 PM, Dmitry Baryshkov wrote:
> The usb-role-switch property doesn't make sense for the USB hosts which
> are fixed to either host or peripheral USB data mode. Delete
> usb-role-switch property being present in SoC dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

I'm more than sure all of these devices are physically capapable of
doing both modes, but the infra to switch modes / provide VBUS as
host was / is not hooked up or present yet

Konrad

