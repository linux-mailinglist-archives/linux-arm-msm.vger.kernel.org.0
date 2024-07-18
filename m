Return-Path: <linux-arm-msm+bounces-26549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE78934C51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 13:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0CCB1C2081D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 11:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B10B12EBCA;
	Thu, 18 Jul 2024 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URbxCITs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4D71BF37
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 11:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721301644; cv=none; b=pQHIll/Lhgx8Ma0KacSSwNVk2QT2uLSBVKWRhPEui+F7L9Kme/yk7sQhs5Hm/j7XlZmcEEaVyUAAt1iGA0UxX5StVp/SKfWxKF+LXBltiXw6Vm6jpvDPkjAjq2kmi8WrwkohBN5xsGF20sx4Gkr8irAMJ1gsFaV45GN24MGp8cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721301644; c=relaxed/simple;
	bh=iv20VAb6LpGASS19cXeiUPfpWaZEMqnqCnGgiQW6vis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7DkCelF9u21OjJQxpm/uTCNy7HNa/psawbHQycRYveP8CKeBDJ2WAf/MUkLM2p0VuR9LBYW8+4npOC/tYS1BLnuGlL1BwKn7DDaGkGYciwtqnEWmZE0IZrhiSPmyudC91adRH2FP/ECenYY91RshM6q35Atpne/VY5RCKw5DNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URbxCITs; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5a156556fb4so789367a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 04:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721301641; x=1721906441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QdPwyZBp9vMOZVz7lUUwmgecgkSCLrQ0rjAotCotg+0=;
        b=URbxCITsmn4bBsiPBcaL2vGYW4aLQvVBlzg6TbQniJFHUoUEcKH3F2mf9zoOyytjBi
         jzABDgIPIdjBBN0ZnU1nbIBnXb8m6WN8KNNzkx3/Ak7GE2/ZhocyRplVk5kE5m8VNp2R
         /rhxinEFe38pedzpjBGKvhcvlLKi0KZu+vDEzOIs1ntKffLzXUslKu4gJZDAp0qy1RLm
         I9rcHtUyUOG4+UWxg2/Yc1JP3eumjy/Gpy4In893GukRTxWX0qqmPdN54fM2F8MWPPER
         GapLT6ZpopB8lYFRRqO5Bg9oV/cvZZdvbsjmEjmRHMgSzOPv46vrEP/ZucnfW9ShGlcu
         vvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721301641; x=1721906441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdPwyZBp9vMOZVz7lUUwmgecgkSCLrQ0rjAotCotg+0=;
        b=VB2LDaGz/QnqeR8TvpKbW1yY6iQzLX6Z6sYY6m+zJCBCVdonybbUFCZo9Nmsloc1cO
         Hs51W8VG/XWavyAEzAH+lM45oaOZnzKNoXAGhiwti4HqUn+W/f0EgcVk8OLl6iqI68zw
         UoAg5u79LHDSEAKXtBoLtN7rSBMefIO2stM4lmaiRb1p19pz2e+3RGJ4Y/gQlTKgO2D7
         p6PKObdcIcrHbIfqgqHSiMkk0QVBu7BSIjWIPesRZbwyZKczTRqmGbq4IUJB+LFody4L
         HsNKP1a7xEs0gRuy3/rYZuc1147cSK7YN4HRIcQfRqv8Nxiw8rjFBYG3weeEFSd9bKBn
         KazA==
X-Forwarded-Encrypted: i=1; AJvYcCV9nwuigauztTiSaBnjSoLhoK0fPOup7eQGzmvo1NniMPJsb40AIRyTx6T9j9n4S85v2wUrkINlawcyNwKRMMIQsVYNteWKqIK1Vfwr9w==
X-Gm-Message-State: AOJu0Yxn7Vk5SQF7SeZMebOxnoxVCa89jV/QLEFRL6ocreKhY7K8CCms
	keU5dA8i0vug0KlDGp/BmGanVw7YCDHP8py2Le9Ca/6/ftfULm7R3sD+cSyQyqk=
X-Google-Smtp-Source: AGHT+IF9iu6NNq9VCQIGnpytgnvrD3+aeNGAuSKJw8t9yX/qIIYfxpIVf1/g3LyDNbi2qcTT3rtY4A==
X-Received: by 2002:a17:906:a387:b0:a77:f2c5:84b7 with SMTP id a640c23a62f3a-a7a01131319mr342413466b.5.1721301640476;
        Thu, 18 Jul 2024 04:20:40 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7f1e20sm545466566b.116.2024.07.18.04.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 04:20:40 -0700 (PDT)
Message-ID: <39df7ff4-7f22-4715-a0f7-eb2475bd7b55@linaro.org>
Date: Thu, 18 Jul 2024 13:20:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: Add Broadcast_AND region in
 LLCC block
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rajendra Nayak
 <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240718-x1e80100-dts-llcc-add-broadcastand_region-v1-1-20b6edf4557e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240718-x1e80100-dts-llcc-add-broadcastand_region-v1-1-20b6edf4557e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2024 12:20 PM, Abel Vesa wrote:
> Add missing Broadcast_AND region to the LLCC block for x1e80100,
> as the LLCC version on this platform is 4.1 and it provides the region.
> 
> This also fixes the following error caused by the missing region:
> 
> [    3.797768] qcom-llcc 25000000.system-cache-controller: error -EINVAL: invalid resource (null)
> 
> Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Please fix the commit title

Konrad

