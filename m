Return-Path: <linux-arm-msm+bounces-18329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797DE8AF417
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 18:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB6771C230E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 16:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECCF13D50C;
	Tue, 23 Apr 2024 16:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zPqn29Gw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D6F13CF91
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 16:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713889720; cv=none; b=aMhb73YRqTJtuu6qPv8x1qmH1o+lgqvF4mfjk0hRynsuFd1UFo2qxl46T8m0Rdz2f5LOl+Bk278c5K1RSunG6LEeJ7mISK6lPdXgOQjyl4ooH/d+Xw/VmoiZPxz+o6+EYOKM7P4cHZO8o8ShYIL0hg67jFZV5ybndbgN7FmVuh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713889720; c=relaxed/simple;
	bh=u10jUnV5IDjrF3qigV0Kcg5bqQzScV7FiuhI8S8dp5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmou92CAedYRBdUJ92ocnc7xB4yvN7rFAKwTyKtYi2cucwy+tfL0LwEpahEXolCMv6KJXSRNpsJKp8PVP+QoaXUs3eawZYGEZ3UvOfTLawQKFmU+2QH5wCCyBTEegzesOdr2Bejp6K1wHoedJK1nO/TIBZbHspKmoeY0VGb3YLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zPqn29Gw; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51b526f0fc4so2860239e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 09:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713889716; x=1714494516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4zO+T8/DOzCQtrJbOxhztGwyZx8qyfjvyqs0TKvYcbI=;
        b=zPqn29GwyY8ZvUg5m2MlYy7Dia+QuJoCLxJ4OGLzx9ppexTCYMEKXd7Bwbo81JwUW2
         spHQfLVX63Z/JHAfMYTA10goZdWVoX6U7FeQfx589/orOyontm0a2J/tJqdEUcHM+yWD
         4vdtow+xiVWWbF2l3pj/vEcPxE8SC4/VKwaMPL2wDqsTth806RWTva9G1ieQ1whec7Yt
         6ojoOvBdo5qa7vps485RhYWuuVFLu5SqtFPBKhf/g01R69hgt+3rCM5amYWAIK09ZPh6
         HplvxplFjofMReab1l/44gRSazncjMnviql37UmLRwce7UinKi0y1zVMG+WnrQTtx6Cf
         ab/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713889716; x=1714494516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4zO+T8/DOzCQtrJbOxhztGwyZx8qyfjvyqs0TKvYcbI=;
        b=G6jIbvYGuO1GZMVUsm6vLFJ9oT8nZK0c3sGJFY/88JH+QMLPiIpQX9ArrZiyW12/3i
         tJgxajbmlI3b5GkYsEEVENpjIcYQJLGujnqgZ37ifTOSDQif7wVu575eJXwm2OPWwCIu
         UKGSqVtPMwSJGzA05ZGCEJv1Il3WJHVrCrh+q7TbKrusL3moyCdhdcwcS3B8jwV5INnO
         f+nR0A+nelBKsUdFv6FikWqP8zyqm1oXQvvReABrDI4tT3AHC3lQ88eG3xW2m6p+BIc1
         qSKyFZ/up1Yd72U3Ph+fWGfubMaT/rgLYcKL1jsUqYVyJnD5EaT3mabB3PCo0Rw21Z8o
         epsA==
X-Forwarded-Encrypted: i=1; AJvYcCWaptMl/TWD1nYJdAy+rktmi61diccTVHWRlsXg9qYXPZSd9GWimY18eP0uA0QVehgambCT9YSrDEtvA16qh+aK/pUWZLw97RYGzD6dTA==
X-Gm-Message-State: AOJu0YwIe8LIvqh2GAAsxRKvwXCvTr+lKEtDOj6zWfy9ToV1CxVtyJIZ
	R+V4LN/9baVmjI++J5Pa7t9LcrUBR8Jl2Ih1WPlB1nm0sKZmfv9SxSP6c1wLutI=
X-Google-Smtp-Source: AGHT+IEOuAlhaaJQxnP2a++uUiRdJnjYuA5FRyqcqTId66NsqOBEEuVva004iyFbkf+AmumSQrPhwA==
X-Received: by 2002:ac2:4895:0:b0:517:87ba:aff3 with SMTP id x21-20020ac24895000000b0051787baaff3mr33591lfc.43.1713889716504;
        Tue, 23 Apr 2024 09:28:36 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d14-20020a05651233ce00b00516ceeae6a9sm2060603lfg.9.2024.04.23.09.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:28:35 -0700 (PDT)
Message-ID: <7f111799-a647-4b9c-8915-5a7be0c66d5e@linaro.org>
Date: Tue, 23 Apr 2024 18:28:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: msm8976: Add Adreno GPU
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240413170317.34553-1-a39.skl@gmail.com>
 <20240413170317.34553-4-a39.skl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240413170317.34553-4-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/13/24 19:03, Adam Skladowski wrote:
> Add Adreno GPU node.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---

[...]

> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					required-opps = <&rpmpd_opp_low_svs>;
> +					opp-supported-hw = <0xff>;

Doesn't look like this platform had any speed binning going on, can drop?

Konrad

