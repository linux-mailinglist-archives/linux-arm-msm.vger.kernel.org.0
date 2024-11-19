Return-Path: <linux-arm-msm+bounces-38297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A6E9D22B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 10:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2838B24167
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 09:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F6D1C1AB3;
	Tue, 19 Nov 2024 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D3jEhbYT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB2D18C939
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732009573; cv=none; b=BsIYB6X1xXlKC5c9M6dJEuzRBFLy2ZRTfTfksTe83hV9SXvzxR/zSnhFRTCsOnvwWMvMh1S+YDYe0aT0wZle1SyCY9XvTfh4foNeCStLHkMPwcXeCDqkvQuprgsvQdoJ9KmLe974UHZiq2g97ge+5x2e6eBkyYlW9v+PSMszq3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732009573; c=relaxed/simple;
	bh=ve4mTfja6XZIEAPB66fNc2JLJByQxXnjYLnW16rs0uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LN4PwhGXWMF1s/nFoEKaaCyl1Vh5uWytZV7gp4ENIyDWUEDHaA6oGbkVxLYU2VptCsENQm5Jmavv0Krp+e2JsUxdDlwcCc4IGTmaXVdB2pTfPdWRiyiFK1CEkZ3HDiqwnI8If2o8UZ71ACeXo/TcYnhZDmdr1rRdtb6ulGUhxYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D3jEhbYT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so34315115e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 01:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732009570; x=1732614370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uW/Lrt7vQtMqvBoYmRgnoHpbirDah5r4yqywUagnRFg=;
        b=D3jEhbYTRrh8F90tSFroNByt1iwlpr6C7frhjAL77UvKSozWW1bbEJPN8fV00CyxS9
         oD7k9hf1Pp78AWdS0uhmO7X5E+uyJgKB+oAzpW5I4mKGPSpyQSS6ySQo0RBixmeTElci
         KxdQJPPK0BrXk90ZVhT29TEbqZoHODxTLT1wL3HXJ5poxyFGHtjIEIqgq14wBR1/eyUT
         W4+FwVSsLi8Am14lGMd/72+xNMFXdqQHjIKjH38lPuHsYraeiW3kgBSZ9UtjD4FPQQJS
         fSE9aAKzxCTZr4G7k25PdU3kmi9sAMyILBksecHXFnH3aDchrqpRxNfqDeFk2zMTTy5R
         YkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732009570; x=1732614370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uW/Lrt7vQtMqvBoYmRgnoHpbirDah5r4yqywUagnRFg=;
        b=wSRlBeKt/kxrBjjoHqCsRaxGhHrqyzf1t2rykUVXLWlc34GDwtw04BVISBjHcl8Snr
         vhj+iCz4f2l3KeL7JEy+Ge24Xlibv1U8ObS+BM3s17LbZBf7412pwK4b6G5yxkM4s76Z
         VJVXcu7pX+0CVvCb56CHnplDnkdp7vllHQjb4U/q/R7dsZuMxLeZlGXL8rQTBWI+uFxX
         /5AevX+lPfTGtOhYEXfidY1yV1VVF1eb/Zkqw+tegmObY3XHlO400A8SpRi8trHEcx9b
         Z9FokdcwWsz8lpkguNWLqwTXxuXHuU3j2QgGgMhvyss+dhxnr1jdPRY3L5wc9h+WaoS9
         SgWA==
X-Gm-Message-State: AOJu0YzTWuQMvoWTagE4/SPwOYVPMUbV+aB1BWzyhslaBssh0k4znqwy
	iko59Qx7XeEXgZOsShZcjWTckweBGFJBlfYr4j04HagdjBdt7rgFZBPVgvesWhg=
X-Google-Smtp-Source: AGHT+IG7ogy4qzTkt9UfxSsrDtJHiZVKufG5KQETrDc6UaR8utEe0hQYbj3RdkOsqApJp3Nvq6UZSA==
X-Received: by 2002:a05:600c:1d9e:b0:431:5ce4:bcf0 with SMTP id 5b1f17b1804b1-432df74d88bmr147004725e9.15.1732009569697;
        Tue, 19 Nov 2024 01:46:09 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab721d7sm190627805e9.9.2024.11.19.01.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 01:46:09 -0800 (PST)
Message-ID: <bad60452-41b3-42fb-acba-5b7226226d2d@linaro.org>
Date: Tue, 19 Nov 2024 09:46:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: Add support for multiple power-domains for
 a clock controller.
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <1898ad2e-a6ea-43ef-af1a-25229b4771db@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1898ad2e-a6ea-43ef-af1a-25229b4771db@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2024 06:08, Taniya Das wrote:
> 
> Bryan, as we were already in discussion with Bjorn to post the patches 
> which take care of Multi GDSC and PLL requirements, I would request to 
> kindly hold this series posting. I am in the final discussions with 
> Bjorn to handle it gracefully to post the series.

Is this not 'graceful' ?

Hmm. What specifically don't you like about this series ?

---
bod

