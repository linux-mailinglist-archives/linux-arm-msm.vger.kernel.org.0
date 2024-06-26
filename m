Return-Path: <linux-arm-msm+bounces-24389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71636919A4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 00:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D568C1F23674
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 22:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47581922D5;
	Wed, 26 Jun 2024 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TarhnWxt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC6416DECE
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719439244; cv=none; b=r0frLi3lK3+CsC6bdG+pv86Ol/E6qtzIfbmfPfltNpWhS+damycJ3fQUHVEmosSQpADTlxILfsNEjV0vCWy9iIbEwY+9A60TthAVhYrEnTEfCLa8MtiCkX0Ls68gkLnXvVBfyGpYx67XDvOnFRhf+3kBryJ6Gt+Qa7IgBsJT5bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719439244; c=relaxed/simple;
	bh=gvmC1346MmDk0t3iSMJUF+N7dqvo1b3jn0ulpMyO8V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRslpMzyHPm5ZxhgZaBbXLYf2lBOczaNWcVPrhQlynhxYCL5nrpUdwDGT0t614Voaj21R2R6JV6SwEAAtBfO6Nf4FaKbL3TbPOV5UZhRCWw0+l9v5HaXA/nqbSUwUBg8BO/nINYVM0j0I99IE9yLOi2ighRAMn2T+qOeL8BXVzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TarhnWxt; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so4741539e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 15:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719439241; x=1720044041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pj/nWr9R0o1AMKMsYJRQq0ZEmOgyeZ/JY1dSLu0yeL0=;
        b=TarhnWxtEcfmjysr7J/TmjI1WW4qcLJU/R9m7+1MgCSU9673NwetTzvJdunJXeQSw7
         80lbTGrjiqgPOnIzvrJGShYyp0AZ0+kVjWWgwxgYfJzCSuBE2xETPtjmQFINNKjKCyW9
         vj3RJeKhHNzTV2Y7Augub8zhAenN6bWuVyq30qpayheCix4+mKKuW0vJ4clJ75PwMbJi
         DHkEN/YJ6LMz0xS9jCdka9Qkyo1u49lg0b+jdaT2fcDC6f1wVMqumuXPtogdy7X3IQKl
         FZ8UWEjytg903UVWr1ohIpq7bLaoXQcDYF5FtvalcSOln1MbTUb6fqrWObzK+munKl2Y
         whnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719439241; x=1720044041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pj/nWr9R0o1AMKMsYJRQq0ZEmOgyeZ/JY1dSLu0yeL0=;
        b=NwD1qKzomY0ExeW9pZLvShi3nnqUUXscvsI4w+DJIFU3gl6/p2FwqJQcPqzQTmewGp
         /GXI/ak2UxVns+ZGK0QNuYk1cEojG0gdAEqBRbl7hPn0zBQx4lsvo82eT828YWeZq8dD
         SrIqgan1YOmfgHCTff4UaQWYa7NKt+6efAtoFftSx+mlMlaRIAjUVLMn4lozeHfj6T5I
         Tux+Y7TFdGs3I2YvFRrA9d1IJVDAih0lF/neJFeo6uJnC/OauIGwGZPBjZ2Mf8/UyqgA
         ZC2Je5UfMAICOnxdPhSe+jT0wqkHyS1OScz69wd/e23SS9QiU8jQaaAtsGD9IqjQ+JXQ
         i13Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVGxqpZn35jJwBt6t2xUN4VLgn+PujsIhIfeP32YIR4rgEcxEB1eUBfjHBDsy+3ym5R5FPxlTJZOutQ4aAsNPPfFbF4MITGigcDN8mZQ==
X-Gm-Message-State: AOJu0YzekOm8o1ghbMsac5kBx0tWf0iWVLPb+0pNLsyVtv4iM4oUGAcc
	NjvgfWXdnRGhV4ILxl4xeCsWWGzCz5xRcNYhaoaLBOnXRgCwKU7pbldF4gSu6Oc=
X-Google-Smtp-Source: AGHT+IEzkEwlSn3wePny4O5r6XyYn9tUWSErcLZK7yJB3IGNMgVAot+DNy6F2E0jNVxUeXN93S5R8Q==
X-Received: by 2002:ac2:5617:0:b0:52c:b606:2b2 with SMTP id 2adb3069b0e04-52ce0673b84mr6942987e87.46.1719439238957;
        Wed, 26 Jun 2024 15:00:38 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a725cc93794sm304031666b.170.2024.06.26.15.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 15:00:38 -0700 (PDT)
Message-ID: <9938a67b-1f6b-4955-b4c0-a9f78c55f276@linaro.org>
Date: Thu, 27 Jun 2024 00:00:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] arm64: dts: qcom: ipq9574: Add icc provider
 ability to gcc
To: Varadarajan Narayanan <quic_varada@quicinc.com>,
 Georgi Djakov <djakov@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_anusha@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <ZjshR0ekcn0gxwOa@hu-varada-blr.qualcomm.com>
 <CAA8EJpqENsojPQmCbma_nQLEZq8nK1fz1K0JdtvLd=kPrH_DBw@mail.gmail.com>
 <1a08ef42-b52f-4c97-90d7-e7fdee7725b4@linaro.org>
 <Zmgb+OjdBNw71sC1@hu-varada-blr.qualcomm.com>
 <176137e5-6312-4d46-97b6-c4494bc1c61b@kernel.org>
 <ZmlAdETV0+6Md8HC@hu-varada-blr.qualcomm.com>
 <e24cfd23-6f77-46a0-b020-9cb3daef6930@kernel.org>
 <Zml4RQ5R5s3mVMnI@hu-varada-blr.qualcomm.com>
 <8e32a8be-dbbf-49ca-92a1-2fe3c8bfb571@kernel.org>
 <ZmpsOdsl9AMTSH88@hu-varada-blr.qualcomm.com>
 <ZnKKjomRQtJS2ZgL@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <ZnKKjomRQtJS2ZgL@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2024 9:36 AM, Varadarajan Narayanan wrote:

[...]


> Tested the patches with both gcc and nsscc providers having
> 'sync_state' set to icc_sync_state.
> 
> 	# dmesg | grep synced
> 	[    3.029820] qcom,gcc-ipq9574 1800000.clock-controller: interconnect provider is in synced state
> 	[    3.470106] qcom,nsscc-ipq9574 39b00000.clock-controller: interconnect provider is in synced state
> 
> I can see that icc_sync_state is getting called and clocks
> related to paths with zero bandwidth are getting disabled.
> 
> Will post the NSSCC patches to get the full picture.

Going back to the original question, does removing interconnects = from
things like PCIe now make them not work / crash the device, which would
indicate the NoC clocks were indeed gated?

Konrad

