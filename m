Return-Path: <linux-arm-msm+bounces-26648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 860F1937C98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 20:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9FF51C214B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 18:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85A814600C;
	Fri, 19 Jul 2024 18:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nLAQRj54"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4201482E0
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 18:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721414466; cv=none; b=H1cTrziwFag26r8xBRo+BmdD03kiNci+HLHbYiWyOeIxVbkJpAM/WdguBmGltUFJzPJ/EgvHpMAbuMhnqWPhLCfHtR+tZ6f44Z+TOSFFzCyOm17vXg0HsoSg6+6WhV5Z4nEXiN5+KV8ufw8pgXg2sLtYrrF+BewelTMPuaPBcww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721414466; c=relaxed/simple;
	bh=XX1jAWjCcKii67DLBo/W1AnuLPC++cWcmF3Yn2K+zaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tw7yaZ2DW05Q8NfJP/lSEDjC6mBfhrKFYiY0sJ+JwDOuuRNtfTuYs1GWq0R0pz3h3zrW+JqMa4iVfzTxQdOWEwGibJf4PbOcGmPvptccUpMz35hsA+dnhoi7TN2ZwcNryzJYseRI2xuslTZzrII8glKMPxPW2yak/xMKqIKeiyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nLAQRj54; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eec7e43229so31153041fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 11:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721414463; x=1722019263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u1hVqqEpX01vxnIQk7bKheH7JfBVKu556U4cNc0pHgg=;
        b=nLAQRj54TnCSr1HhKRXanvXttB3T2O7JmFKBX31q6pvusxy3KxX6sw+nJcgNYV2bf4
         4eIGa4qSKOfopGNn74lvdOSoJ5XPM5hDrKgBW33uEh3ymvzomi1qIxqqSHQAx4xHPMBZ
         8Hqcxa5X5Owm2jZsmNzAAp2w9C2N0AUFlzS9UpydZvTfmLy/FZ/uQ3nKwD50VvCa11Kp
         m4yqeYiyNVQcLZ0HflWsFUzZOpt0y5Gc0jxglBzmNUKxOJWEuf91Tns6l1V6AqIAiAhh
         5LunqH9Va8DLIxMJu6M2F89TxrdnDfnUej4r9xzQbOPdhVkToHGPRyHWKA5bfFOzlLhA
         Zmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721414463; x=1722019263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1hVqqEpX01vxnIQk7bKheH7JfBVKu556U4cNc0pHgg=;
        b=Zj6MoW0VL07QcW8Txd++SzM7aTjCMCVA09VNf8hiXTK7tuS1gASNgpTJ6VNDr3QRLN
         ryDpx/RSQcNWmzoGfhkLJ2mDJGHXyp7uQeXO+b0lU1cL/+3OjYXWVEo4tgcL/xGIXtCq
         2OpNehzQSyK1to6rVLRVhtxMn+hg3lYD3YKvzQCr01nc2+kn5EcJT/Q2M7fnNxbyeZrR
         H4K9oE0ENKnVSzCvv2SJE+EYRUGR0mCzHmbb04hxvGWNXzl0E4KoTQ58JP/WAEFOnjBn
         PUm2t9Qkc88VIdT65S4goAGfzqlBylHjyltjJabr8qM8XJbur+RqmflAZx8PwMhQ8ck+
         3NEw==
X-Forwarded-Encrypted: i=1; AJvYcCV7G/JRHVSkDwPx94n8SAFGZaDitefeGIsSWOalvs2ZE/5jRN2v4frTRNsqkDu++MULSBL+wtaA+v6Zf4nXBEJlBoxlIsDTRICoE7LGig==
X-Gm-Message-State: AOJu0YyzJ5luiqkEtkjKOErIwJ/4SlhvX3ReqAGei9D1tQyfaZm1Wc7n
	Ag+eQRKKHj2tg4jC3i3M7xBJrMrngJjp27NPd3rp67J07X61weIUpl1RvcrXpks=
X-Google-Smtp-Source: AGHT+IGjOXIWyCuVLfxTuUePnbChIqYcmobxrZuFImG0EUwVKkwt7WjnN7IBAUWc7OO5Lj+fJFwyNQ==
X-Received: by 2002:a2e:9090:0:b0:2ee:8ce9:3037 with SMTP id 38308e7fff4ca-2ef1681e836mr3858281fa.37.1721414463150;
        Fri, 19 Jul 2024 11:41:03 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c2f87dcsm1539883a12.68.2024.07.19.11.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 11:41:02 -0700 (PDT)
Message-ID: <08942d6b-2daa-42b0-8b32-d98116f6b4ef@linaro.org>
Date: Fri, 19 Jul 2024 20:41:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp-x13s: disable PCIe perst
 pull downs
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240719132522.9176-1-johan+linaro@kernel.org>
 <20240719132522.9176-4-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240719132522.9176-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.07.2024 3:25 PM, Johan Hovold wrote:
> Disable the PCIe perst pull-down resistors to save some power.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

