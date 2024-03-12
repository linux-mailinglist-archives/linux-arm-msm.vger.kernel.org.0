Return-Path: <linux-arm-msm+bounces-13915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 129478791B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 11:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1BBF281BF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 10:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2697A78661;
	Tue, 12 Mar 2024 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmhqjXA/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016478267
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710238179; cv=none; b=kPSA0MX1SDzqomDogL+8GKaJy8BjP8PIkzidZALFCbzv0CZ0X/D3l3rBh8bkc+hfzk9pm1zNVfesH5NkL6oOmJDCW+Srqdf0JgOF+S+DzHq5PEWUI+7rABzRgxvjo9X/pAQEDf1WfNBwTUS2vTr6IZn7ahEOIn50ZI5LyyZ1ZY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710238179; c=relaxed/simple;
	bh=UsYofHyo4ltDXBqykR0WqBX41CM4bURUmCq1AXyvn7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVXcuArhUXo/+XJQFN252uRWSC/WF4eUKT+G8YibOjl3UJNQtOBOzjfDfWWoNhMrXpNMf9H1V/KZhtvtA3PH+FM78xH08pABj5r/Cpns5M+fp70ynew8VOX8+ZnFt1PAU46bFyCXfY8YE+migwWcsGnkC/K/7YpwjzJTUWb/K4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmhqjXA/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-513a08f2263so2708099e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710238175; x=1710842975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5KrrCc46zY3EaqIGg4J3SGWx16jAIeBYBlePvonNCY=;
        b=HmhqjXA/RVCUGjVZganzZhYcONy6NeI7o+nTk5+cTVNCgU86gUlMd15tH+FM41O/1D
         TdfF1eC9An0MRFgcW2SSsOj51nn0Mj34OSboy9f08LfhQzWlphe6aqAwzI4EnTGt3FpN
         bUg3Jkl3ZIbHdnGa9NrCr4nxcWpm6L4c333JqYziR46u/f4Py0tfzgaXx/bN8qGXoIbS
         9IBNpygI95Bcvh+tfTdbaGQWQnshlRqzs2hm3kYr4KmAihX2Rj5/z6yCwpqjvklWsJIP
         rAfJ5KjQzTR89juKxM29IPc3GSWIYAO8LV866abSwkNOZHMdvKtlUXXHpytY3w7Fi5U/
         Hsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710238175; x=1710842975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5KrrCc46zY3EaqIGg4J3SGWx16jAIeBYBlePvonNCY=;
        b=nIvDGt1eos82h0VxcX2uJ+Pikj+oGYNsOp4t8coYaBTtzux2UjydGl55JJjWHjW/v2
         hE2Sa7qyeLDCSPIkZBlt9ok6dkwaJPscq3zkkal4a55k+IRSRfkXvznnyh0cj2Mu/O4u
         4t+rrsSYHHu779znQB5470nocu3qHbQPL7vNbaaj/jxZwLj3vxyo13ZKU2te3vxllarH
         sWVKROn0Pmih14r/PADQGcA2mch+QRgP2zJSlurA7IoorTIrxiy7/kjrDOuTU80oaHkl
         PQWCGHBbZInTRpZAlz1RW64g0ihzbpTQZxs1HLy+3v3RvVyj682plJx7pen+J7JasXrl
         q4QA==
X-Forwarded-Encrypted: i=1; AJvYcCU8c2EBMCktAIqFAKjcU2Y96lyCkQFGp0gjBk/hCLZDSxTCPG3pXXujSGVpf9Mzygx5cXxGTnJy6xtWHPb+uYrwiv59bwH8vx2dkumYDg==
X-Gm-Message-State: AOJu0Ywo7bVuIqUgg2H7fKoFKcUubzpXWVkqyQEQEe8FkzMHSd0E2ONE
	gQx3EHsAJoyu1Q04sftUvF5DOopPpkDq4bjYF/uL9rX4iBB/z8KObF99EbArE/F6nPCBoIzfDrs
	YHv4=
X-Google-Smtp-Source: AGHT+IEkXdl2lHpg/byD8Mwn15KSShXIciPqlDeiel+w9pEtBrJuFdZHUd3+FxLp1yhPfQh1t2aUog==
X-Received: by 2002:a19:3847:0:b0:513:7:fc3c with SMTP id d7-20020a193847000000b005130007fc3cmr5174830lfj.55.1710238175047;
        Tue, 12 Mar 2024 03:09:35 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id r15-20020ac25f8f000000b005134c52debbsm1507310lfe.162.2024.03.12.03.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 03:09:34 -0700 (PDT)
Message-ID: <f3644045-6061-4281-8fbf-25054798bc45@linaro.org>
Date: Tue, 12 Mar 2024 11:09:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8916-samsung-fortuna: Add
 touchscreen
To: Raymond Hackley <raymondhackley@protonmail.com>,
 linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Joe Mason <buddyjojo06@outlook.com>
References: <20240312074536.62964-1-raymondhackley@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240312074536.62964-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/12/24 08:45, Raymond Hackley wrote:
> From: Joe Mason <buddyjojo06@outlook.com>
> 
> Like msm8916-samsung-a3u-eur, the Grand Prime uses a Zinitix BT541
> touchscreen. Add it together with the necessary fixed-regulator to the
> device tree.
> 
> Signed-off-by: Joe Mason <buddyjojo06@outlook.com>
> [Raymond: Move to fortuna-common. Use interrupts-extended]
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

