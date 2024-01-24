Return-Path: <linux-arm-msm+bounces-8128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201483A9ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 13:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3562C1C20A71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 12:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36ED97765D;
	Wed, 24 Jan 2024 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mixDwAe9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7FA76918
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099754; cv=none; b=nxPoqCu0mIxNtxARgXcYPdxEpHD9r1y7qq4iCtAMBm3xZmoWeIN5plV3tGAb8xe3tCON44hZuAmbwI0gtfHEWdnRjWzRVXV+VKeywluj+JnSIcnP0O2Im9IrWebhK/NUlBnCZwXFtGQKk5XDk8eUQgElltIZWuPZrGWOeMlIWaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099754; c=relaxed/simple;
	bh=pLgVD7WyIgCYs/WnD6GmQ3oHmu+7tZfoy04+P4DpDZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uIh/tq1bGXvuXHbW9A/d+pGGox7yUptiJEFxTy2knYcE7qm2HCZigrFYeaWw8Fb7TUZbrb96wJmp4m1BM1/3o6heJNGUF3PuJ7zEDold7VXRbVOipyylfXD98Oi6xgoZEYkBhsam2uJXfcYDzUU9ynfDPlvjK6HB/LOJKz9cY/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mixDwAe9; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51013a784easo481269e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 04:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706099750; x=1706704550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTNcfdZ46DhDQS1PfdxwvcCFPFv6QbUHhAVtqKGltxk=;
        b=mixDwAe9HfZecm2AU9y0GLnrya598wpZ+qQbWRfZ8eYZ2Cyk4igjkNsa383L5fWMZg
         o0Na2rSWd9BEe2HYfoASbFAQM5cNtSQxX5FMgLjZzTYdSeFB9qQdWQIxg8rE32FpuJRw
         6nIAzT4aZ3Tot+yeWtEWD+6DoWNGq9QM7ES/IUlFmO0d6QjWVcnTFzr4gaa9KSyjX539
         cpLFf3NXdZkwjb1l0SN4JR7QqLTGHQtFGisiWg3BUQlGJytOnA2xKZn0brqB/MK6bYCj
         E1WrXIYOZNpNaKDktEg3vkbJxUZCeHfRocMungmJu14m0e2a0F7SSQxfLXeHNL52i6Ck
         fGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706099750; x=1706704550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTNcfdZ46DhDQS1PfdxwvcCFPFv6QbUHhAVtqKGltxk=;
        b=griumWXPggbr38GU1TXIYwJnBJKWrdyNAPxLZO6ps2eUxD1vnoVAPP/YUGnp0dwzsz
         2h5hoMk6IueXf0gJcTHF4sfh7An+TSF256Ge4uOT+RVGujDZPGmplIjPesgUAAVlb1vg
         f5ApU/XnCx0np4q1YLM3A3Dq8xIuR1cutfHzOsIddDL3xvCWH/r7qbdnDtdU+zN3qC6R
         CurJYryuqKP/BRwTMjYhzq4pSFpwsgxxwZwS5EA0n2hvbEcWImVUMIx1fNZBi9zlfj1Y
         JvJ9IUNccaWBq9f62OK5hXjNnGOhPek00XeVWhUC55hRqJfF4lMmEcMorshvr05gV6Dw
         YDpA==
X-Gm-Message-State: AOJu0Yw686i1Gzm5kmsuYm7i/VovrzbqAI4LNnelZ2Nx+b7kiCrfA84E
	6yKgDCvoSy0DCOwTxZy5v9SkQqaEpEkxjHx8URPfTk1dfaHD6E4aIGgXSJ5ucfI=
X-Google-Smtp-Source: AGHT+IEm7tXXCAhpWSFvaPOrGruncb0eF+DHMJ82djxJSAgDaATGdy90bGKiUrTnBBvihqISw7Xd7g==
X-Received: by 2002:ac2:558d:0:b0:50e:9a0d:d3fb with SMTP id v13-20020ac2558d000000b0050e9a0dd3fbmr1407083lfg.273.1706099750766;
        Wed, 24 Jan 2024 04:35:50 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p26-20020a19f01a000000b005100ed58b76sm207756lfc.308.2024.01.24.04.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:35:50 -0800 (PST)
Message-ID: <7d9d14ce-7db6-4796-98c9-60d1f72fff6a@linaro.org>
Date: Wed, 24 Jan 2024 13:35:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: defconfig: Enable MAX20411 regulator driver
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240123-sa8295p-gpu-v3-0-d5b4474c8f33@quicinc.com>
 <20240123-sa8295p-gpu-v3-8-d5b4474c8f33@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-sa8295p-gpu-v3-8-d5b4474c8f33@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/24/24 05:25, Bjorn Andersson wrote:
> The Qualcomm SA8295P ADP board uses a max20411 to power the GPU
> subsystem.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

