Return-Path: <linux-arm-msm+bounces-64717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 135DCB03084
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 11:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FF321899CFA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 09:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEEE25524D;
	Sun, 13 Jul 2025 09:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoIAcGlF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B647226CF0
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 09:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752400129; cv=none; b=oTT6ObE/gJsF3DM14KrmZq7JQf9jE1L3JUeNbgqviTn0ZiCamlZ0OuwexFy+Vxo7jOKUaHasHVlx5ZVi3FROwijOLGD7dDXHYOOXluBqb25YRx7ZmNtox21HoLvI/6ekVFxRbutluDGQFonaNGiPzMAxCHg1jh5Q4VpFg5h5JjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752400129; c=relaxed/simple;
	bh=vVRR7H+Oh1jOVVrd3OXMxD7IsYuOKBL4mwsfy0UVeI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahxl0uZmspWkeANQGq7R103onyqNB2ClK0ILfnVy0CzO3V7iQ9fCwkNavZOGRqIrD+lQNb53XRznha/a+ZI98Oi813cm2CWMt07egoTIbang3lpN6iKWHXBUD9bCZQ9j0/gpj5bx8jNFaAURiwcekVB0CkSPyNScQSKjFEcROOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoIAcGlF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-456108bf94bso3193395e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752400126; x=1753004926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=87Y6uvJuNXy1ilBMxkL0pceOrA+vw3WvrJEYq2nI520=;
        b=MoIAcGlFM7FSdDXz2MBMNuOsZ987/BNbYTs/WK8T0ZNaLq76kR9f73XaaaarFPranq
         j5eEDcl4tNPUfgOLl3ddkbzEXyzawkQTrZPl6sxMdrnWXAUKIt2pzKk2FNSrR6JfjYHM
         9CHGodVbbRaMLz/TmGc3m1hgdghlxDjpgp5c4AsCYuXfpRUtd/ofUa5OqVJ0sj2XMA/v
         o/0buI+50YShvQ/tlhUu7TtPHD4/6g3NHvK9jkwJ4C4w/LNjLaGQNUNLTIgupKK9LMQA
         TkQXiHrY1AUPQIXeOW5891qA3e+xVV6a/elxPru1dTfrR9ehYH5CnYgE7VORTDBQREM+
         7N4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752400126; x=1753004926;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87Y6uvJuNXy1ilBMxkL0pceOrA+vw3WvrJEYq2nI520=;
        b=tMN1bZip8aeOX4RD9CZjgkbge/sC0DcOK8Cnd1wkEadIEHOcJWdfaouCjx+U/Yaxks
         oZonCfugSePdNE67HbtUWFCNtHVrdNycxnG5zAIrMsbnjgjMPOdTH1UPkw5rMhoMPJBK
         JmWs31mRfdyhtrDuYV9Wic5OLgkZiFzuklCagA/TyrLQ7Bmrq9bfbYJiYN8ve62+AlkX
         m/yY0z66hZhrl85llHi4chik9yr79B5bqceT+klvpeLfA+d7S31BH+mp3heJ598yx5tP
         +JnuhakV2GsxQAdbM5zzrXxK13kPYEHRKQgRm/E2NzfPchBTK41bf4EI8kAeuQWN/rwz
         dPHA==
X-Gm-Message-State: AOJu0YzKuriB5mxC40NNSS+J2lyChblyRYyi2k2RQe3QtZ6xMfElNyMv
	pJrhXljuyEcpS6SVuncX5rBf9D6TWfsy82/D18uht9h21rlrm273GjYQ6HKonizMWo8=
X-Gm-Gg: ASbGncuQVEA4qM9voe3cnPPhwBcyG796BprZlb7nxRQKaQSqgGsLJwijEHr9HE1Rok/
	ocjI4Pcc8rOx/TznCHnHQSJM0uA9tmY1/jQn09w54JPsV5g/b7Af+XGCazbFmyzrovCkh++e1Mx
	2wbYmYYdefxmyu1UIMd4ZJ4IJQUsoI2jucOGJZTt9/xPsJR2IwMsvtNk6yD3xZiSd5B5bqfY+xH
	8lf181scoyXuTdz6n6lIzrruTMLs/8cH3QrcUR2a+yefKJ2LAhwl4ZYnYyOOMbCEunRsaS5lhSn
	fdiHSFOqRnR4xodSw001Zcd2K5sXcqve3MZnrUzOGUUFtELt/50IzRVt5zM3li+fDfyrkdK6vlC
	S4litlz3G/tFw0kE60xtRJfB+yUGnDdFa4SlDHvg/B5hdRP285od2xPpqxP1SE6Y=
X-Google-Smtp-Source: AGHT+IFYhc3CtD4A4MOtCvaPnngWumd1dv65EYgG6Om/yx8+SjrSSPGMr9gXNjJ44lHxB3thNgEtIw==
X-Received: by 2002:a05:600c:1d09:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-454ec15a834mr85731655e9.15.1752400126413;
        Sun, 13 Jul 2025 02:48:46 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e2cfsm9234034f8f.75.2025.07.13.02.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 02:48:45 -0700 (PDT)
Message-ID: <63e538bf-16ac-4f57-9578-2ae855f5727f@linaro.org>
Date: Sun, 13 Jul 2025 10:48:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/15] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-2-0bc5da82f526@linaro.org>
 <3376b0fb-f3c6-464a-9c35-30a3f589b856@linaro.org>
 <eac19ad2-78dc-44e9-bc02-517272ba737d@linaro.org>
 <3506d911-da9f-4639-9c83-aee0a637e9b4@linaro.org>
 <352421e6-f151-435b-8dce-6c02a6d0e747@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <352421e6-f151-435b-8dce-6c02a6d0e747@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/07/2025 10:39, Krzysztof Kozlowski wrote:
> Lack of in-kernel DTS is a good argument in your case, but you must
> mention ALL OTHER USERS:
> 1. All drivers in Linux
> 2. All other upstream projects, BSD, U-boot, everywhere upstream
> 3. ... all possible other users of the ABI, so out of tree DTS and out
> of tree kernel folks. This one is close to impossible to prove...
> Luckily we assume this point does not apply here at all. No one out of
> upstream trees uses these new bindings.

OK, if I get your meaning here.

More comprehensive commit logs and cover letter - including doing to the 
work to look into BSD and u-boot to make sure the change doesn't break 
things for them, which I'm nearly 100% sure is the case, is what you 
need here ?

I'm fairly sure the only real dependencies here are people following my 
development branch for the x1e laptops, who want to drop those patches 
and receive upstream stuff from -next/-stable.

---
bod

