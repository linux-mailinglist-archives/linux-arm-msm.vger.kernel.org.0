Return-Path: <linux-arm-msm+bounces-14034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCC587B13A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 20:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE98F28E84B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 19:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319E326ADB;
	Wed, 13 Mar 2024 18:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z4nVMhfz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738EB7580D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 18:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710354747; cv=none; b=fIKgeKe18h09iS2hn6g8fuCFSlHFHhY9vup97ROGoEQUGEh/L0Sm1SoZhaVOQXBisvWap/274lyh0CXYXUIHs4ubVJUXkBSXfhT1vTsrczFo1qiMpyFHJ/LwPUJDK9IJRwwowskXVYz8LOIPFGCkwEiFcdb4w366+EPDaXei+W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710354747; c=relaxed/simple;
	bh=DmirhLhHmvPnVjPsWgHzgkUR3c2uacOPJ52RQk/Sgu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JXfrw9HNyq+fB42XdKPrkYmqoJPKr7bPvtQo74hztHH/wwHVr6+7oCvO4mTtybpX5oIgwC1iKYJD3gYo3QK6i6ZAlcuLneuN7kvF4QZ0qjw4imSLwi3MnqypS+NFwffVQJWnKCRBZOi5SSHbXjTIzOXjqVoyXx5KTp5KVnMf9cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z4nVMhfz; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5101cd91017so263708e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 11:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710354744; x=1710959544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c46CXhHIkfJWzpxGuQS1ConTUqzy9VFRi62kx/9tVb0=;
        b=z4nVMhfzBPR1AXSL9XQenL1ciy1Vz9Un+UqPwvmviYoRe9fTtYcyYgDSIDx01NWG1T
         IHmjlgnFN/hbnPKuNc+g7M3T9S0rdok/wW02JXi7rae3KJ5WYrcbUS5OHx39J/+AhoKo
         NjoJgFiXK7UpdQmIi3hKl2le3wqzgfQrc2WEQqe7y3w5ncVtcXb2rlc/A8mfCRWI9FO5
         qHXWmFg033csT/MOaEpt4ZGUg8A+oXOnfydMYhDB8gSUY9uIGzwJ3HxhfQfzwFwLSbET
         E/+03zjrIRWS1D523TyMYhba+3GbmLs8maVAxYaTlPZQfelTs7j/9NNXNjjXl5YOY5+O
         44CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710354744; x=1710959544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c46CXhHIkfJWzpxGuQS1ConTUqzy9VFRi62kx/9tVb0=;
        b=hNUHol53jCEWQfaWT9o5RyL+glgCiYCp42S/rxjyFXmxQg5zaYHId7fZqmER63Yexx
         5we5RZ5mV2K92A3vOrhIn2LR/pYqCO5K8fQP34b1h2cqSCaqr7crip7ajzPrCgjXAsjh
         W5+o12FDxkzQ+fkwfjCnwVDadUGrX1TgAb9z/1GcacP4kdjpiZQi4cCZ90udht7qvsGy
         HeIY+bKOT3TaHgrRAALiHRIV+7nkxCAjD1o4oeCFn7SiN2+WrGBgmcsFyPjSBq9e7J+S
         jSLTO5wwt/BFifpLRMWWYWoynHETelB3djD5hyVIUkcQCkiG1Oa00Y7N4ios/s+AQ+7k
         p4bw==
X-Gm-Message-State: AOJu0YysqPu+OvMhkYbPZR2BqbxFwAwd/HntsGrrAevByGhI0UwVfeSV
	uRR4X7M8S4/1pteGKp3FD664DjpQ33Jwl6RcRE6fqRtaeBcYHlkLYW5PNpiQEo0=
X-Google-Smtp-Source: AGHT+IHf78ai9oWGrDz80Yon9mpdoWYbkk2sC2HWOSooJ207ZNh1Pw6Fq+km1zFujDhy0w0y5k/d+w==
X-Received: by 2002:a05:6512:368a:b0:513:c146:fc02 with SMTP id d10-20020a056512368a00b00513c146fc02mr2429517lfs.6.1710354743640;
        Wed, 13 Mar 2024 11:32:23 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a8-20020a056512374800b00513b324cc32sm1113882lfs.268.2024.03.13.11.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 11:32:23 -0700 (PDT)
Message-ID: <eda651eb-6b8c-4cb0-ac08-c38666599338@linaro.org>
Date: Wed, 13 Mar 2024 19:32:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add initial support for rb5gen2
 SOM
Content-Language: en-US
To: Wasim Nazir <quic_wasimn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240313071238.3290-1-quic_wasimn@quicinc.com>
 <20240313071238.3290-3-quic_wasimn@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240313071238.3290-3-quic_wasimn@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:12, Wasim Nazir wrote:
> Rb5gen2 SOM is based on QCS8550 SoC, used for Rb5gen2 board.
> This initial version describes regulators & ufs storage.

[...]

> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l1g_1p2>;
> +	vccq-max-microamp = <1200000>;

You want regulator-allow-set-mode and regulator-allowed-modes,
unless for some reason you want them to be in HPM permanently,
in which case you should definitely comment why

Konrad

