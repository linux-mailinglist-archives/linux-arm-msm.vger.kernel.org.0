Return-Path: <linux-arm-msm+bounces-18323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D248AF3D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 18:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7728D1C225A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 16:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1757713D281;
	Tue, 23 Apr 2024 16:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9X85Q1S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442A713CF90
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713889398; cv=none; b=u7Xgm8n0NUZi2NbOuk5B3akLuBuiOjT18ep0LQhzrcHZkbS8/Ylmi3M9MufE717oD54rB4fZzDhvgV34zLG7YxqBY/ESRPTje/eLJ89dFgsSXVGJA0J553PY7ZWlHGN/WmvOPSjyYHrXfwPCBgEo1b3WITL0xsKDFzy66z8rj/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713889398; c=relaxed/simple;
	bh=di3fBEWaf3r4JLUJjdiQ27NJdTUJM55Vizjr1hVxt4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJ71GLO3YVGggMaBoVcSt1bMIIG2msWhTJYvhEcSCFaQF/3/HJFa+9Xav/k8hM+xzJ7y82+pnuYX4l/fQjIVw/QxyG93d3XHcwwYIS0r5Kj7VijJ0fEbZBWNfrj8bN9eMf6cStU1AP9m4/eEsUDa/WHn5gGJMYjXBWBgFwXeQhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9X85Q1S; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d8a24f8a3cso74099261fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713889393; x=1714494193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eV3JYQjvg7ps2tDw1BUY+qYafvfWNiGj6kHpWXZPB7M=;
        b=J9X85Q1SCGqjEgx8+ytKq+l3Fo4gRU3extrqVg/EW4ZS21Rpr5MRa6dQwBqbzkxGHp
         Pb4cePJpPECjcoq/mwbAP/O205/5qwcdpgbKPhejLW+3K2FfafmTh+hHGn1KhnDGlaQ4
         gUorWi71SkrjvuXSsK/KzFFmHiTGb9obhZkCTmefBetw3afqTKy3cNApoEoqd31KzOhS
         TOnKce16VYlxdc2qjx0tUn0e2jtYj3zYku50FU4+UgBQXl7LfvmHCuXTvTN8gTLaf7bb
         AEYoj4rjxsVPkr23ezYdWxxPgNcW3a84/neDEpix4vlRIHOg7mzH/Tj9xRLPRimIWurh
         qssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713889393; x=1714494193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eV3JYQjvg7ps2tDw1BUY+qYafvfWNiGj6kHpWXZPB7M=;
        b=PtldVpmH0XxhWoTktha8j+338YTOPaoiYHYHj167nZ86srtktw+PiQfU99dYBLIkVg
         KrHC9dDvA+cfQ3n3FRhXFkN+FT3Xy6EHUVd0XRS0ljSMAB22pERoaM35gmAKdvDExp/i
         Dc9ROQJ+04yfWUpZ8pWfcT2UgzUYeV+M5ICZaBFz8pF4oM5sFeb0lJJ/7LXvJgSyLU6J
         OB7/2JR+Y/WZcnE9AFPDwLsdbN5Dp44eRMosukAnH9aJy2LX9h9O+8KcOpCXxBGeQdb0
         drXAPWxe75W3P7jYG0EhE2A5Kf5B6J+MY/tWV/YtvweGwckIKtOJ17USVvsLeulQHy3i
         V9WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN5sRfOTZVV7arOmYPDTkLvBfpP0KeRjwB7+k0BYs47/6b94ChxzJL4u16F9Oh2l1ylYTGL8nYaabjwhinswTw9UGqMl59zX5Si+TLfA==
X-Gm-Message-State: AOJu0YwXEB2ID60wgFAf0oDoGD1eI4/S4+PNox96w5vwkCe8pWyzHiOS
	mJVP8Gcq21fdfIce8r0UKO0WKOpwjd5RUHAOuUNYfjyJqhTcxUjiDZ1qk+YWJWz97Qsptn4KuqQ
	C
X-Google-Smtp-Source: AGHT+IG6D6t4oovl9EKg9UPxHrmD6SGFGORMtpSatzoOpPt6wgyrSwG5hvAvInKw3kGGJ2qbs5jrQw==
X-Received: by 2002:a2e:834b:0:b0:2d8:7363:ff36 with SMTP id l11-20020a2e834b000000b002d87363ff36mr7848169ljh.37.1713889393341;
        Tue, 23 Apr 2024 09:23:13 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u15-20020a2e854f000000b002db706ec5f7sm1735182ljj.98.2024.04.23.09.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:23:13 -0700 (PDT)
Message-ID: <2efd6856-0e20-4b0f-93d3-60926ba2e4f3@linaro.org>
Date: Tue, 23 Apr 2024 18:23:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dmaengine: qcom: Drop hidma DT support
To: "Rob Herring (Arm)" <robh@kernel.org>, Sinan Kaya <okaya@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240423161413.481670-1-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240423161413.481670-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/23/24 18:14, Rob Herring (Arm) wrote:
> The DT support in hidma has been broken since commit 37fa4905d22a
> ("dmaengine: qcom_hidma: simplify DT resource parsing") in 2018. The
> issue is the of_address_to_resource() calls bail out on success rather
> than failure. This driver is for a defunct QCom server platform where
> DT use was limited to start with. As it seems no one has noticed the
> breakage, just remove the DT support altogether.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

