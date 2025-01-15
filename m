Return-Path: <linux-arm-msm+bounces-45126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3973A12366
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 13:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BAED7A15E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 12:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617702475EF;
	Wed, 15 Jan 2025 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Znz9P2lr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E3D2475E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736942556; cv=none; b=CWewteK+qVeM1ANmBg6bX/szVwT6RCMJEDsHPeDEBU/n5kdsPHM2MCJYoNrMCyeAxxyRCJZlrUUSx5HPDyB08bTtW7IOCE/v7k9p+3uu/ZJF1DCN9aEQWdN/jitRO/OWOGgQaEzkbWq6RhTCtfVVnut3Ff64FKXbt4zWE7zFA5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736942556; c=relaxed/simple;
	bh=GxiMUN5sqtriveaI/HLFwTpRRwlH2UsAEbUeMqe17Qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8eK984e9lK6LWs8BUCykVGutKOxOmW4gdMWm1UFI+NaNySugnHw5qB+bfEc/yv8LwyTh7TDPrtNaplX8EMNyrGXwVnXSLpKb/xvB65gHpdGXAmZx2q/2HW4giO4gH6o1erqIPQEdmO/KLk1EqmtS7n88i/Js7Wf61gGYL9jU/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Znz9P2lr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so5434942f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 04:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736942552; x=1737547352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J09817AefuwhTALG6OGHGhgUnuZ4yA9WXWtiMWd3gZ4=;
        b=Znz9P2lrJglPk3coNHRK0cjlTWtCC43MgS+5q2HzRml0qL9kN81Li9nCKchc4RWK6P
         9YFjRWa7ppEjv8dyvqe0EQNL12SVVVOS+1JyO/Kkpqut0t1o2ckANKOidtCoTkuCh7R4
         Ct0EQzixYjscKyG/ZpqMJbNYwU2wp7ajE+YgO/5Zz7qOVaFaCEF0VsfmPg9AL7OF35im
         EABtqqArw/vHjh6xSTA7pmzkH3MVQXHiagNeoBqcHXfE11UpbykR0AFh4HR8kQkto7TF
         XJ1ZVP1bgP6nN/CPkNZavBwu97BKKtHJGOG4jOX73PPJhhnVmvlPi4IdJEXOv1oBbkhl
         P/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942552; x=1737547352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J09817AefuwhTALG6OGHGhgUnuZ4yA9WXWtiMWd3gZ4=;
        b=DTXWXLXcsrFERh7QjaUpIOA1/nvcEmqDiljulxWlWZ7lTbnIZc5zHoEfrDUM7J44FT
         7czHbs6n2VsZ4mN6h8ULW6TC4FqTXuhyW/4b3pGzCpXIjcnqcNpcQ9siAWh3wRRoeqJ4
         8BrPqWRk7MJtW3IstKqZhz9dibXvfmFIeixjpO1uq8nSi90flP0RflOhXZhBBxTXXgSv
         lPtJsz67QdxybHhzwTIWBtbHN1N667qvo+wLXUGs2LQRLHr3GRRx2ZaKxtHh+6iVEAxY
         JnpqKD7LX+1HGtjmSHYQ3GQw0NbZadBslT7eLLJ3OU8QzK+26eEIN/ZkN7PUT4wh3u+H
         U7wQ==
X-Gm-Message-State: AOJu0YzEom2c8/GZOAa6IrT8rGQgyYcJooXJzQXLgA2Nh1qeqk9pi71J
	RKZruD5aArPFzkx7APRBl1RBEzzcpI/TvOo2jYqGYRNkEsi5lIZfjzd5Y0XKUI8=
X-Gm-Gg: ASbGncuOtg6uyKzeetTUVZDVHMDuI7ab/V0P6BdF6log1s3tfJOwQlsLwFlAZjkva2Q
	RCR1HI/9+kNgZ1aEmIpVVuR/+qngRd8Y5jugzJ25kdE0o35TjPWWc9UWM0SlV+b9Cr0giWGkXqW
	VUz/ZX+BdemAj3tVHRTjMFAn1mJ0zvNAIaTrNR7BYo8PiDReClEoXxonLaSjG3g9VwdqBftVn/h
	qIHLsc9tD5PoVyNr+VV1FNGM9ZQhAzQXtaPJ0OtjUyty8ifICcQnVDb97I9Xr3LI2wq7w==
X-Google-Smtp-Source: AGHT+IFfKyGn52ipjdfPZD6RVd7v4EFf3NGE8QU70ELIZjBpZX1RbqBIB9xbQUWlnKSlaXcoGcGZmA==
X-Received: by 2002:a5d:5847:0:b0:38b:e32a:10a6 with SMTP id ffacd0b85a97d-38be32a12d5mr6050542f8f.41.1736942552589;
        Wed, 15 Jan 2025 04:02:32 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c1d6sm17718135f8f.50.2025.01.15.04.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 04:02:32 -0800 (PST)
Message-ID: <8322416c-5762-4b64-80aa-7ef1b0b0287c@linaro.org>
Date: Wed, 15 Jan 2025 12:02:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
 <20250115-switch_gdsc_mode-v3-2-9a24d2fd724c@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250115-switch_gdsc_mode-v3-2-9a24d2fd724c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/01/2025 09:30, Renjiang Han wrote:
> The POWER_CONTROL register addresses are not constant and can vary across
> the variants. Also as per the HW recommendation, the GDSC mode switching
> needs to be controlled from respective GDSC register and this is a uniform
> approach across all the targets. Hence use dev_pm_genpd_set_hwmode() API
> which controls GDSC mode switching using its respective GDSC register.

This paragraph is difficult to read and understand. Try something a bit 
more like "Use dev_pm_genpd_set_hwmode() API to control GDSC mode 
switching. Do that because of reason x, y z"

"We are making this change because of reason a, b, c"

Basically just try to state the facts as clearly and concisely as possible.

---
bod

