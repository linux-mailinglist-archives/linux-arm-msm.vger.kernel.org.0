Return-Path: <linux-arm-msm+bounces-82674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEFFC73D55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 12:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 896C12AFF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 11:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3080E32D0D9;
	Thu, 20 Nov 2025 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v7vXYeYg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8753332C945
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 11:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763639566; cv=none; b=UONEF2qgMLQPA6N+NRYAuOQMPOnHxATt2b3QKBwsW/4irLBJ70AXJyZZBcgDQ7uolRykgDC391ECtQOdyYQK662+WUZpS0zvsKCu50uXam2hZXHV6NM7XuAFBcOB58MtrKCHmhE/wCxJ58rXiVT7+Vje59Agbd55sA86b1Lp4cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763639566; c=relaxed/simple;
	bh=p63LggUjA2Mwlm0TlfEXg8s8OBroErGX+ciNpQvn8mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtQFy9B3nBdCelD5XEeM95m12n6/E65i1dmkigVjVxW18fNjI0O9HGfhatbyTioMWDEvbVNc832sNo8xNnbaUbzLo7lDac/xfFIN1UQVwPfdBu/TPmfm7um4ivRi8mmC2v8MppPP2eo7BhfJt913RtOnoKQUwlQzziZkKlletk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v7vXYeYg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso13409175e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 03:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763639562; x=1764244362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4CHeyGudbu1LXeqUG0mQSvHnHZEWEYW2FGlxYtxIq8E=;
        b=v7vXYeYgYJqYw/UjdN5lk6IRLhICGZmAzB3i8GnrlDAW6EJBNVPeLAc7qSuQKqpTas
         BO8XaX36sJeHR52Nd+VThvlGrpuFm/zxZe9tJeU8c1GLIK9ZPfYG/kSfbajd3qWTM40b
         SgnMfSPIA8NlrUkjplFGKigIUZ4gH/d3+vUWuztaImDcsSJLVM2j0+eBur0zGanJ7QbS
         dpKUqsU1Im5jAjykQWH7eYNBWya+9/spgxmBXXf3XZYukn2Wvicszyz0vs2g0b+aDICs
         YgaUpfC6hltsXZAtPKtG9xvm9DZOnpWRDiUg5pnIbN/OfDc9bwv+IMrIoCmtXJCntWGr
         om7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763639562; x=1764244362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CHeyGudbu1LXeqUG0mQSvHnHZEWEYW2FGlxYtxIq8E=;
        b=K0JPAbHyMrGx6rJS5Ib8MV8oDmkMAjf/F79Qh28oYJ3iuIQ1zNYFiHRXzB/MXETM9y
         kJve8KzPYav1fvL1y9MWQNqshrlIpghAiUoy2MMYb4zVJGPNZEIbcAxSAfnewGoAiMIT
         fPxUNNQ2NvfLTiZxreonWSF0PZOiUTdAea3F7eezC2HT7/LHt+jT0e9xpBWZKQE/LrmS
         qW6g+9wEDyj7MVZRPF+7MWxKvxlqE0ae7UKVsGdnVlngBzmCokXl2eZbAp5UlRFip/XN
         OoWL15Nx2ZqRlsUbM6pr4cQxX1oJPmCXmP3ER5y8LV4Sy7PlAsrXzGrqXgdwXE+/eg7h
         oaZA==
X-Forwarded-Encrypted: i=1; AJvYcCVK0me6UcENflKIMRDuAIesBpJu9MDEgfLJ1JTNBT67xWZywBg+7Dx8v60PjGc3y2YOAjW/N1CtNJ+Oty2k@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlzl2oeeWAq0P6jJttWiJ/k7MUOhXDM5LcXPOL0dg5tdybi+GX
	T8Kh7B32E0uxcCYAiU5CYRW0VXEQvZa1mFl4qhEL2cfZZ0LQzbVbZlR1ZF6Mkjv7Dc7ZyjIO0xH
	dYm4M
X-Gm-Gg: ASbGncu3Jv5NPzuWRqp6BZnzvjA8DPyDC7jlbBMHGAXd/d9mnb5c53bnFf0Gte/wW6K
	kEjX9tHIQV6Giz/pvDgfl/VI5qnJ7D7M/pCaY9RPiDDWvdQyrAtgSo5+w8khw0ZdYPpubHzIa5R
	W0djcexKJo/j58vFVvkim+I9OA4RukmPdrYIXEuE2b0VjO/3Y+GYY5mj0K1f07FNH7iWaWLVC8K
	E8xVJ1f8maIDUen8rUKi+Wu4j8Fo8xvD3FlwrPmw56UXfWxKgFOjAGb73+NvXhgL68R8eTgScsp
	0k18zIp4sx0X98CLngOz3kTVWFN+Vidp4qxdl+I6Pm4hz4HIgz/Z+sqLMJvs2HHHkHQG6t3k1uw
	sWjMgYFUIobXfzFt8a5xG3ZqKD/bgzqspvE9Vr2I2YoXjxZgU1AKW/0pPwQthpFjCovbA1P/kO9
	9R/nx7+4k=
X-Google-Smtp-Source: AGHT+IFQPVYPXKXlC3tClVZjt8tudwUH2eZNOfDOIy5RAo7064xIrtSc2NGzDPCzYB2IJcqqv9ZM/g==
X-Received: by 2002:a05:600c:3515:b0:477:7a5c:6a8e with SMTP id 5b1f17b1804b1-477b9eb69e3mr20765905e9.9.1763639561736;
        Thu, 20 Nov 2025 03:52:41 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a973dbabsm65564845e9.3.2025.11.20.03.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:52:39 -0800 (PST)
Date: Thu, 20 Nov 2025 13:52:36 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Use BRANCH_HALT_DELAY for UFS
 PHY symbol
Message-ID: <xucvtz75jqhnxlfsxceapa4leal3qj4z2zrulx4ucvrcqonnt6@ff7jkcg4obhn>
References: <20251119-gcc_ufs_phy_clk_branch_delay-v1-1-292c3e40b8c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-gcc_ufs_phy_clk_branch_delay-v1-1-292c3e40b8c7@oss.qualcomm.com>

On 25-11-19 23:23:03, Taniya Das wrote:
> Switch the halt_check method from BRANCH_HALT to BRANCH_HALT_DELAY for
> gcc_ufs_phy_rx_symbol_0_clk, gcc_ufs_phy_rx_symbol_1_clk, and
> gcc_ufs_phy_tx_symbol_0_clk. These clocks are externally sourced and do
> not require polling for halt status.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

