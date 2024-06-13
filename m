Return-Path: <linux-arm-msm+bounces-22602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF35907898
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 18:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AD32B21287
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 16:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D3512FF8E;
	Thu, 13 Jun 2024 16:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pRfjDeHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434F112D757
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 16:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718297188; cv=none; b=PDFwTaT0/0GCrBSGmROxjafY4MRH94OJBwDorWlMH3uGZjZ110sLWFswxqgqteXf5ZTo+T52el6otk4lEUKqqoAbvlNHO7uGwFKA96ZKcUmtt7gA8PNC7pUgXNl2bE/wLvgxOSs/SYcpXUSPw42L6kPnvu7xE3HOEnwfTomwnbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718297188; c=relaxed/simple;
	bh=TFEvxYcNR2odBoLIfY4a1a6Nl0oUBXtJa4V4ZxBU50E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oEBIqqfzHts8PAUHMwedsgh8gxrCUnnz0S4beyB9957y1swNKRZJHplu21l2/NhEFOAQMxiYbrNkxHdjk9aqpU/6ZY2SyQijVyEkYj+Iswx7e/PAhq9xjN9MIPguIrL/1h9uBEe6UVMtlYxETf2Z2KEbCLimtg58/AuCbYmbnfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pRfjDeHc; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebd95f136bso13754321fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 09:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718297185; x=1718901985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUUMBBqT6Gf9bC5hMdhrVaF0TX1ZKnjFS5FlotLCl7c=;
        b=pRfjDeHctdF+BSjZJ4XOhHTVhks5G4XPiaTqCrR4HFhpH/f7jnMoDtKmrs4QXivdUO
         0uzjZoW3dT2zpKV8Z30VYKTlMjl4mwWBkOx/fpUTzNwEzbBvJ2XPM1oxltYTEg7ekrwA
         8+A3N4g2POHKYe5FtVdFQchgWYCIfalNcPenwAPh0qoRrUoXluJ8Qj8wOVvhyKrORg2u
         DSW/YamJZvnVoMQUkp1MCq5WtH+d/IWnE+94dDzyAKkOeoztmJyZcq+uwOe3+WSs+3H/
         hI07U+Ve77rR12tyNWmsznkjP/3x9RXDMULG0sZKvDE/Y0LNVASqmXZAUE5iReT8fE0C
         M/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718297185; x=1718901985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUUMBBqT6Gf9bC5hMdhrVaF0TX1ZKnjFS5FlotLCl7c=;
        b=s7PMLRrJQm4wYoaSFY08t5buVWzy+RGX05fBdQKhCLK4lvdxwx4wfzxdp4V5Ty+kd1
         PJGvH+ASAifeQV9RbNmVKVlEb76e6HBiMbUB5Rc9eZRk6aAw4GhuLTCE4K7mVuYBO3LI
         PXrj/nHBs1iCSzLsJWJQXwe3/uAXaXp4scU9AUIP76rQf/E01zmIzFxXTbmbrV/YFG4i
         PAniC0ts5Y1C1p+SIrVmr5ShbRnVuMS01JqjbWxgldnn7vHAEP0KGJVXDTIz66Dw+3el
         OEgSXYq6rwjBqXRKvEWek1tfjrQ/vHIp4gcPvF12P1tqut6LzJXdDHPmyVvUr/9NDu5D
         E5Lw==
X-Gm-Message-State: AOJu0YwPuAs2AHxfQpEcTXZzA/1h4mqC8eGos4w66F/R5lIFWi6jth8U
	FpvDbaMdyitDE8Jg3zfh1BHaGOWp46vASsd13PELYx7QRa7ygdphYdcSimMOLXU=
X-Google-Smtp-Source: AGHT+IFK/Ou59KJA6mFFlOVvHyKaDlrsRRSxR711OV4rnimnCh5lAVZoVqvG8OEh4SHCRj92/bKX/A==
X-Received: by 2002:a2e:9593:0:b0:2eb:eb8b:738 with SMTP id 38308e7fff4ca-2ec0e5d1345mr2240711fa.29.1718297185476;
        Thu, 13 Jun 2024 09:46:25 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76? ([2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec06519289sm2881781fa.2.2024.06.13.09.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 09:46:25 -0700 (PDT)
Message-ID: <37bbd466-742a-4a23-b3f7-97f8da109608@linaro.org>
Date: Thu, 13 Jun 2024 18:46:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] clk: qcom: Add support for Display clock Controllers
 on SA8775P
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_jkona@quicinc.com, quic_imrashai@quicinc.com
References: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
 <20240612-sa8775p-mm-clock-controllers-v1-6-db295a846ee7@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240612-sa8775p-mm-clock-controllers-v1-6-db295a846ee7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/24 12:47, Taniya Das wrote:
> Add support for display0 and display1 clock controllers on SA8775P
> platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Please merge this into one to save on boilerplate, take a look
at dispcc-sc8280xp.c

Konrad

