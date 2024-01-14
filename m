Return-Path: <linux-arm-msm+bounces-7234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 772E782D161
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jan 2024 17:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0F8D1C20D75
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jan 2024 16:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249A95234;
	Sun, 14 Jan 2024 16:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MIQik8Nk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9AC290F
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jan 2024 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3374c693f92so6046510f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jan 2024 08:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705248780; x=1705853580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PK6B4lIcnEeALYHSYIJtJi6scK3wBTo91ND0+T8BXG4=;
        b=MIQik8Nk2969SPS3unPxZtejEY1wW+/c/FnjbgdJAZS6IsbOFPzhvhOx8jSYW58E3b
         CHbc09uNbb84Q/tsp+mBsNggVWMJwhYx0VgwLIoZesoHQLcXu9y4nv/W3N7yAp+8uGZK
         GnwU/LL+AZ99fcwCU/XgqbzsezBX1TT0I91uAftUHDNuD5WM3f5zX1DnX/xMoMD++dVJ
         tkj7EBEk0IyLou260E39RUHwT+hUejjY11FFPZZe0PD5UeOCAPNN7pup92jrkgtkBZL2
         2/8XVObKme54tQZSqVsge7AkBF8nZ3IBe4GSLVPpeoWbJm6YgiQfDSUjO+F2nMZhOzBU
         J5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705248780; x=1705853580;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PK6B4lIcnEeALYHSYIJtJi6scK3wBTo91ND0+T8BXG4=;
        b=BZzgEtb8tkHIEc8mUscdt5NJJEU8nqmkF2nsdveOHfIEA+MLfQ7vG4z5PxSKSPqUHo
         +f+8glwDKtCW8tPxp7qmCyx8dTdsZrZJbXNwqJghpNC1icv7hYVY4qteno4nuFSs4E0w
         ERWvTwb/PVcDUBLwcTg/9YBR3yYmRYdCCNDIV56dI3aRf4mxQ8UnNSpk0sEWCKDiL03w
         HUWPD55y1o8Ltahysj63SyCD8trWrHmnMML/k9gjB2BS+A4TZcP581iw6p/SMbCqGY1v
         ftuZZtIVtMevaBd63d6cwkpoW0dbmmTvtxAE7LqQT03tDXCIcJaPffpAWYeka439+R00
         omaw==
X-Gm-Message-State: AOJu0YzuP1lQm9RfLxaDSYeJOhORQemQ0K+G2X8cswBbsijf+Z54yFZT
	8NHhWUr5kfDbbKT8ch3mqiLFxL6Vy1KQwA==
X-Google-Smtp-Source: AGHT+IGpum5IDzpXeQ9A/9V/dvzpLzlcrn9xiwR0V2h2sXZ5LoD408R10SsfEmXPPCQp+VatR6FysQ==
X-Received: by 2002:a5d:6a0f:0:b0:336:7449:2da4 with SMTP id m15-20020a5d6a0f000000b0033674492da4mr2709385wru.95.1705248779753;
        Sun, 14 Jan 2024 08:12:59 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id e19-20020a5d5953000000b0033609b71825sm9451486wri.35.2024.01.14.08.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 08:12:59 -0800 (PST)
Message-ID: <8097c0e0-3096-431b-9b35-46dc063202cb@linaro.org>
Date: Sun, 14 Jan 2024 16:12:58 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] usb: typec: qcom-pmic-typec: allow different
 implementations for the port backend
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-8-182d9aa0a5b3@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-8-182d9aa0a5b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/01/2024 20:55, Dmitry Baryshkov wrote:
> Follow the PD PHY changes and rework Type-C port implementation to
> become an encapsulated backend. While this is not required for the
> PMI632, it will us later to enable Type-C handling on earlier platforms,
> including, but not limited to SDM845, SDM660 and MSM8998.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


