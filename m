Return-Path: <linux-arm-msm+bounces-23278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0756B90F6CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9907A284A50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 19:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6275153398;
	Wed, 19 Jun 2024 19:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xnPJP2aC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F27225AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718824614; cv=none; b=MEyq1NNtQf8yw5QfpoV0AXiCqUjo6daX9Qk6ucbVyV5vOZQE1uzVaVnZZSN98LOu5Onhw/tJKglftrbXYeP4zTUPVYJ5nfclUFbZQkfWj1A2ILY3m/fCKGGcukHnipQfp6Ib8D9+/gfmi8EpYXgdOo74x8ckv2xfQhQMnRfv01M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718824614; c=relaxed/simple;
	bh=bGrAT0XuX6HIRNqdaF1eFEFv7sX4k+pappk3LlTHjpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNYZgtDUKuoJx2VE1izf0HHpv/WZF3RmMPseG/gXyqy7GwOZubHCvle1fvTnQsoXnXZvtpl28wuW5Y9DCVq+RneOLPTHHnFaeXc6pLrwyFmHoFkF32klLCq+CFB13cIE5l2BhcSpiW/s5GshP+NmLFVSR/MQL6rMS5wlxQVPM2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xnPJP2aC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57d1d614049so69413a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 12:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718824611; x=1719429411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xW27As3CyhfzKxmc2us+WS7TrU6cHg0Z4tjRes0sYro=;
        b=xnPJP2aCDh2MMIGK+izEkA5UWO4CLVd5mTLPlKoPTP/34HHjI/IWKpQE+l6qQdUnt2
         XIikaR6voKPDNObpX4hrWAVRBJ2v/FVhsyRDvukg/VZ9p+37qFD+syDdBJAcTu/HuQeD
         y6hnMLLlDO3tF9R3aqFOjq07gNR5B3v3Px61LPimNpdVp1NxPvqfRSHH3dgI3YxxYBJO
         Jr2ujzZQuHAwZfZLGLSLUupNYtqDlNBchgQa3ek5nP6jEen6Ess2kVpkFnNNYbgnWHWt
         yTYZgiZyhJxUHMHaQT1HG9qH11h6PY9+ao9+k61mtrpZ9rPWdqdXKDMvOJv0H2DTM4nz
         wm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718824611; x=1719429411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xW27As3CyhfzKxmc2us+WS7TrU6cHg0Z4tjRes0sYro=;
        b=Dk7SdwIJ8IhhgWcoeNTzIsukK52ahQVyjhXOaD1XBTliJuKU3v2QE5W1MdFzQ2DRwb
         A/cj4UfMz6HxczbsCPl9OeQtkbev2l1z4i9b6IK9u7i0y7P+HLtBO2R6fDRI/OUY4nwW
         RT+EkexNUOSXQj53DK4IGCjWjnGoRr04qM5RQbN6zVGOM8F+9s8XgOCPBuU9Ctr6N4hc
         zHOCdCYtHu6DE8UNCYp+zn+Ebq83sTY1ND4p1DoiMMg3AO10RYi75XZVc9AUJ+H9V9Qs
         Yp0ZilR0gVxcLIKN9Id7rMxi+YSob6j5KywPapByPdjJKMvHrqdHmqB8/Hrx5Ep8zWpA
         x2wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs9FtJC8i9vdvoQT0e7r90DOcNkGnH8p+TI75ofa3QbEaZITN6mTYCi3LxHh8QXbcAPqqw8dDZrQzaU8sqE1vMsSvCkPmLPmVWFZWJlQ==
X-Gm-Message-State: AOJu0YyNqOvvQesNsNnHr2qI5Hn3gR7PpqUvwoI3qaryctt1IYQ/aNxq
	J2iR5Fqepwp4y/IcfWluZCqr1ck0c/XBEXx2fT9cL5VMXA4Ur474DFjLSgpP1Og=
X-Google-Smtp-Source: AGHT+IFwU14UM0dtxkXha3cXVSm5zW59OPajkJoXmZPv7v7qen57UTQtx+vhLPPHRqijWQnwtuQjeQ==
X-Received: by 2002:a50:ee92:0:b0:57c:6d9a:914e with SMTP id 4fb4d7f45d1cf-57d0bff1a34mr2084327a12.30.1718824610830;
        Wed, 19 Jun 2024 12:16:50 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4dba:9578:7545:6874? ([2a00:f41:9028:9df3:4dba:9578:7545:6874])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cbbb5576csm8108656a12.89.2024.06.19.12.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 12:16:50 -0700 (PDT)
Message-ID: <58025447-b916-43e6-ad07-0b11710edc3c@linaro.org>
Date: Wed, 19 Jun 2024 21:16:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-gplus-fl8005a: Add sound and
 modem
To: "Lin, Meng-Bo" <linmengbo06890@proton.me>, linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20240619111523.54301-1-linmengbo06890@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240619111523.54301-1-linmengbo06890@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/19/24 13:15, Lin, Meng-Bo wrote:
> Enable sound and modem for the GPLUS FL8005A.
> The setup is similar to most MSM8916 devices, i.e.:
> 
>   - QDSP6 audio
>   - Earpiece/headphones/microphones via digital/analog codec in
>     MSM8916/PM8916
>   - WWAN Internet via BAM-DMUX
> 
> Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

