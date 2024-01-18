Return-Path: <linux-arm-msm+bounces-7567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 815B1831E88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 18:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04B7EB222E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 17:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D682D04B;
	Thu, 18 Jan 2024 17:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhTB3x0n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9498F2D60D
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705599491; cv=none; b=mDXQA9xm9GjEXB2DQPGPX1awSquiLnwnA3Srhqm5V8NJ8E+M8qPibw8Uj3JwIDXojhTXM+Tza1CT21rofmdazcNA1z0sAZFf+9UULpW6dluhty1c8fvZi7dFzBX46mPC6X42/4WCartp8T5EDYz24yt82bNbajt6IDxQwm08bs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705599491; c=relaxed/simple;
	bh=USbiBAFx2QR9T8zJlpG0DggR1335IIYgSLno/FFoYpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type; b=XGgHFT5ZnG2eD2jAzQQBU/EV8eBUP/kGQ78yTmOM1Uq3jMhyb2LHI4Smax39UjugglDVJwb35jLEH0gPs4LsUSFbqYTlYwjoUxo7SATortwCGb0IX2lE0Gf6+cLepbHdLFblhKzT06LZLpqbhHdXXaIKv/HqblMBw5d+455yias=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhTB3x0n; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50ed808db11so10415857e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 09:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705599487; x=1706204287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USbiBAFx2QR9T8zJlpG0DggR1335IIYgSLno/FFoYpA=;
        b=QhTB3x0nhZqzZRkOIjxblrHk7kY35E/TKGlgEUql7vWjiCF1oCXPmBAf5kVCzMDwRg
         hs9nyiR4HItEjLZu8S6GbWhtOmrSispR7IfD1ALBVwuisJVeHv12xZOc/VNmK72G9ogH
         5V/qGAaoud8WN+SIuZuN2xlnZpdpQoDyYv5h/FWsbfLIyxg1KBiBrofnlGaLbA71IOfS
         d/HzFrxDJCytchKKe/B1Tc7XeL5CVejX2zi1gRQU1t5FaFu3fW1nohYhU5di9U/cJo6c
         xS7lvd3U4YeiLYsydDF25y74jwdGx3cj1O9l2+Sl6axtUADac+bsBu3daI3Tm0bchwOu
         NsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705599487; x=1706204287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=USbiBAFx2QR9T8zJlpG0DggR1335IIYgSLno/FFoYpA=;
        b=ok2Vix1jqFEBr+akLu6V29odC5vPpWJpcdS91PgJTC+II+vehxYuMVYh96EgyVE/Lo
         Pg4ronkvl9yD4w1rmAx0Ge8FSvDhwwrP2cRUbY5rH8bSzyGe77UZhdrAAxPKH/mY99VM
         7XPZ0lDzqn1wDL6IiqMKxShfzXuWiDwNGEVKI82iw3v9f0kC/0tWg1Ns2VmG+XlP9Up5
         HMN/YyEP2eXU8ojKIC+HlYzukhnGdeA1Aj4IfsEKalUpRhVmj14Zb2HIv74EMqscU+8V
         /2SJ2P+IX/1upVIHT4KamQWE2lgEX+rVl7dG9J1M4nMfEZZQMZ1UHkpx1i9YOJ+eaHT3
         dAqw==
X-Gm-Message-State: AOJu0YwuInsxV6sx2Ks3BI7twAs1gbAjkjKUM53HffflDMMYcTgew9N/
	J5fJP/SXWDgklRVOg+r625pYFO9ziI0ys1n1iwE2HjzoCy8YHmh1Uxm2MAfR7FE=
X-Google-Smtp-Source: AGHT+IGX5HQ/2vpX/u40ngVjY5ht/YNwLWkLzeyiosoUeR1bTug4Y6o+o1VPqNfBhBW02qcXxpAkPg==
X-Received: by 2002:a19:8c49:0:b0:50e:7224:ad4f with SMTP id i9-20020a198c49000000b0050e7224ad4fmr686910lfj.59.1705599487646;
        Thu, 18 Jan 2024 09:38:07 -0800 (PST)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z6-20020a19f706000000b0050e8d5504e1sm711831lfe.294.2024.01.18.09.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 09:38:07 -0800 (PST)
Message-ID: <0e41134b-aeb3-488d-aa06-72be155cf992@linaro.org>
Date: Thu, 18 Jan 2024 18:38:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: rename PM2250 to PM4125
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240114-pm2250-pm4125-rename-v1-0-71a0a103c3d5@linaro.org>
 <20240114-pm2250-pm4125-rename-v1-2-71a0a103c3d5@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240114-pm2250-pm4125-rename-v1-2-71a0a103c3d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/14/24 18:42, Dmitry Baryshkov wrote:
> According to all the documentation there is no such thing as PM2250, it
> has been replaced with PM4125. Use correct name for the PMIC.

<repeat my reply from the last patch>

I would appreciate if you could resend with that explanation.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

