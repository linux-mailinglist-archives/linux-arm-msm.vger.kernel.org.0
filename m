Return-Path: <linux-arm-msm+bounces-32662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9329D9882A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 12:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501DB283981
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 10:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7ED189503;
	Fri, 27 Sep 2024 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZB2sASHh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166C4185956
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2024 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433454; cv=none; b=StqvcjSUSJFMd7EOcBLc+wPhpmZNgar96sy7imEH/Pk78DEW0i6XKYfpPIPrKhZTuP6RKCget3U7MCoD+PfsL23mWCyS2EVo5Iv7CZiBACE/GZbsTwiBiYhsJhAmQXMwzkoy0qzk41e9dXxDIXlJagVCSMWWKoGOAbNOZK2ko9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433454; c=relaxed/simple;
	bh=OgP3jifrL8Ct5x65TV8/lEd2rCG5LjI4wvV4B4XvfJs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XXJRr8XNJfhG7RTkXIICTRmIekCDpMsV+ZaCvUNT/zQfWb+rrFUUIeOIr0fZSE87rS4VDC3J7AykUrkV6b7N2SZgnnyj3hfLAIqu6twQsoZ8pZ20zoQjUHIKSgSGi5Vv1Ihsb5Tg/k+zBB+jGa7Nyu290YD6QwUux74MYU7vTBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZB2sASHh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5389fca1fdbso115442e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2024 03:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727433451; x=1728038251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxCQQv8nseHXKvWI2V2VeIzQSET9G7fTF+kn5DAMxlM=;
        b=ZB2sASHhk1b1IuRU/5enpZnbYuwFLtO1RkgP3x/HL4JxawDctsN+EpJ6cjbxKDBXEP
         LL657nFOce1jKt92V43+Kb2MX4UmAEa9DZTvvYPI5DLNGrSxK99DyIUh9+uXkLbRM/pl
         hevFaAEjV7YuGzg2IjDbO3nWzpukWumoWx4qOqBk3qtUDzR9dj8B+PLgH1sXierJm9Pk
         n8pK+4UVJqlwwpCEhwC25CcRIKPS8qBJOrhpxaildTa7LLJeP+x8YI6cfWxoE1bIBsku
         6YUeXgHlEfsh1Sdq2sMDuWkZhs9qFYAkeSTX+O5Jf81bWdLPZa1Kf8D1jto2F4E/dmRG
         sWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433451; x=1728038251;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxCQQv8nseHXKvWI2V2VeIzQSET9G7fTF+kn5DAMxlM=;
        b=KCMirrrvIrgLi9Dz7jZ55ZlThiIc84YpJnXtpPPYF5fyYi18JMF7Fqb9Fsakmzz4wY
         N1BztLercCMZbU5xUpr0HSx666ou1bAc4FawDsOhGvFpWR9vbk+U07sFS8CpLBoQDS9O
         IfvMNPoivCTJaDSqWZSSJvlieskJkGh7vlbBFc1Ap/SueC3TjC3wAMzFZEP8oFyvXlwL
         OI61XYs+PuFYzfUD/w/655i0E1H2jqNbBGv7xdWd+S2ulPfK5fGEhv0b7v8kax73z7dK
         vzxru5/Uw0K8vEs6/AmpbAP/77wvWtdY9f/cgpgV9tktPJUKjwjftCEwyhclKI6sSFVI
         CtIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXglsmQtdGYKbJSqLq0N3Z1arhRDZQJFevPuewbWrRlM0YN+Ou76h0Nh4Lula5Uv2r/Y4jIAWDxEtVkAoU@vger.kernel.org
X-Gm-Message-State: AOJu0YyZCO+CeO6SQqxpG11FBgljYsqpXVpPHW+yLYg/5qIJh7H0755L
	SeRTaLwAerlaeyIdz4ubWQ//j5y1B57rB3pdG8tjmgZxjR4Ni0aguuNuwk9j1bU=
X-Google-Smtp-Source: AGHT+IG7ynyLstx3Pi9UHSoRCnsUH8RtujLbfgmjOqmHaTU+xxXzj+c1HpZYW8sJlwwRrZw4mKcYDg==
X-Received: by 2002:a05:6512:b90:b0:52c:ce28:82bf with SMTP id 2adb3069b0e04-5389fc42665mr360337e87.5.1727433451098;
        Fri, 27 Sep 2024 03:37:31 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-538a043b3eesm254529e87.230.2024.09.27.03.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 03:37:30 -0700 (PDT)
Message-ID: <b0cd4862-3060-4c01-b861-6fe1e650d088@linaro.org>
Date: Fri, 27 Sep 2024 13:37:21 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm: qcom: sm8550: Change camcc power domain from
 MMCX to MXC
Content-Language: en-US
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/27/24 13:32, Vladimir Zapolskiy wrote:
> The problem is trivial to reproduce and the fix is trivial to verify,
> it's sufficient to enable SM8550 camera clock controller and a CCI
> controller, for instance on SM8550-QRD CCI0 or CCI1 can be enabled:
> 
>      &cci0 {
> 	status = "okay";
>      };
> 
> I made a special effort to check that the power domain in SM8550 camcc
> is sufficient to be replaced, and Titan and other provided GDSCs can
> be turned on/off, if the clock controller is disconneced from MMCX and
> MMCX is off according to /sys/kernel/debug/pm_genpd/pm_genpd_summary.
> 

Additionally it makes sense to mention that the fix alone has been already
sent for a review as an RFT change:

* https://lore.kernel.org/all/20240612214812.1149019-1-vladimir.zapolskiy@linaro.org/

--
Best wishes,
Vladimir

