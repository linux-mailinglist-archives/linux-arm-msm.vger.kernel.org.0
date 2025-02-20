Return-Path: <linux-arm-msm+bounces-48766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14825A3E792
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 23:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81597189F80E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 22:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FD126460D;
	Thu, 20 Feb 2025 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kPHlDZmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F931EE02A
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 22:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740090888; cv=none; b=uvtftmr9YMBGwYhzdea29RCW42qIjB8UjBoMb6i4CJOBsREKeEwYXsIltFlrJ/Hrvn0CliAmhO8MBXRiMXi5G4ckDfj86X/kePXGoOlepFm6upSab/2O14YDUhk0LlPmJf9N5f73R1HF+eJCv9ooszAelFz3P+VRVRhEPaLKTNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740090888; c=relaxed/simple;
	bh=mR0mUeFeZCaF51isva3tjv2Z2QlQmyqjWpLJF1WjFwY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IhJHqkC92Pgrr/NY5JjSqJ1tEHiNFr/HqAZocxmo4yRjkBAK91rSjxbrixLwj1mf6Pz5oAXYGooA2dBbclwbl1Mv47qFGSptwQdWwW5ZgJ7Jx4sV1QNpwsx9TCbYseofFPjNMk7UJfrYfFXM9y6p0nCwvwmYpDhdxAwyCGFLkYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kPHlDZmU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-439950a45daso9468265e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 14:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740090885; x=1740695685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=phlci97ebZekU4b5KeuZl5+WtfcQbkZeGNBOFT410xE=;
        b=kPHlDZmUuUs7QGBqV6KjCYFqfNpz2qJ77uoakCxwFgeFB5X81nLcy7/LmS+m9EB80U
         pbVjyztOZPp4wILnTpTMZMqnHRPSoMyV6+R8shCqu7+W2J1u/Q3TjS95J1no6IS+Rk6e
         9cdr10K7z+V/CW1O+YeSuogcXuYjEtgTaH7gbmWH11VS/IawaPck2aNfPol8LEbGhIiW
         Kcu77cwbADo60cOZ+mLDVLimaV6M3Yri41eeq3Rkn7AA+JIdi5lhDXECJExNtfHyXqPn
         DduxwBZyG23oiLr4FjclUgriyomgaGo8j3k9SOoTZTAEGe9SgDyEL0+6pJI3J7qnAXyd
         K7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740090885; x=1740695685;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phlci97ebZekU4b5KeuZl5+WtfcQbkZeGNBOFT410xE=;
        b=KBVwmhfEq20EEuWufZeFnFXIOmGBD3NbjoveRMPyRHKyBn2aGM66JQOTEznoGeync7
         39bEpHPsjTVpY8RXzjJHIN78lO2PIC74grsqEeu6blWH64MfwjVhdaDP0bsSOcvsWRQR
         uYKTSFaV00nuqrGR3sB8wbPgWoJ8t32wcFvx592jUZiNszIy2m6ZsdJbClOtv9J8ywIy
         IyUvCYvL48C49oM+qVGXCd4S06rnJZgbK+nEtVsSSw10F5Pj8qYAS7emL6scGmGk/1qz
         PsjHERynrQD2+wyy9B5bZVqJtgwqdwlF9XP3Rwo904kqBXIcAWzd/Z32Lka/pWDjoGoW
         b9fg==
X-Forwarded-Encrypted: i=1; AJvYcCU3hqqN/owQcC4V5MXf70t1WioIZXIYvgwkUZvpQFyladx62HA7b1AgaHQ5fkhHmWf7ZZ3c4eZCaIam+U7v@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcv6H5E1hY9Tv499CeJF0okMoCA5QQwl2Ghxlo5HkaOj2bHbaL
	vnQNpIgDLCeCjoiL2xDV/Itv8CjPdDM1DoOHby2RJXPfrjnqPCmC0ETt3zQzQnM=
X-Gm-Gg: ASbGncvm7iClyoyRz6glbuoYshSfjaVmge2n2QHN/bvViPNpcMzbe/sy0aFV3zlAs2i
	wXNoB6r4LdQjLjKJXRC3UnNEyUp7PsBkaVq5+UEheHflc7mXNf6iA0niuDkostTItqm18zRyaNs
	8SyoXRw155k2hvowg+wKywG8vOjlWOv1LFWr6CL4OesV4QOo0mQwUtdkkE5KGka1aQUWQjoTGLU
	JDhrTMglZYc5Bvi+qzaTkaew2GEjLxZxtwIm3MSs/+9moKr/N5OvPB0zS6HHRG7lodlUN1/5fOC
	+YKQ0Zl3/f99QkP0Z5in60eJ8eZE6zsNyfihIJ4ZbSEAqoKmyPZoYdet
X-Google-Smtp-Source: AGHT+IEiEoJK5yBKqQlvbOAtC7qPbenK5M2XniNaSRU80N9OG0U+b3MWoNR0jG3TB6eA2sEmMFi/zg==
X-Received: by 2002:a5d:6d8c:0:b0:38f:4531:397a with SMTP id ffacd0b85a97d-38f6e757a02mr842468f8f.3.1740090885393;
        Thu, 20 Feb 2025 14:34:45 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65dfsm22129677f8f.64.2025.02.20.14.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 14:34:44 -0800 (PST)
Message-ID: <4c89d0a0-c0f3-494f-b85d-6c1d5041bba8@linaro.org>
Date: Thu, 20 Feb 2025 22:34:42 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
 <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
 <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
 <d4c4ecf0-9094-4341-8711-78a48e5d1344@linaro.org>
 <d444f1fb-42a0-48ef-83bc-d5aab9282b22@quicinc.com>
 <gzjyyl2kzv52zsewn5zf6ei65fymyi4pspvsmsjaqj5sklfxvc@bkg46saulni5>
 <fcc31cc7-67bd-4102-a53f-ebe66b4fd1a7@linaro.org>
 <3da96df2-1127-49bf-8114-282cc488c194@quicinc.com>
 <6b0684a0-a519-463f-b7be-176a4752a786@linaro.org>
Content-Language: en-US
In-Reply-To: <6b0684a0-a519-463f-b7be-176a4752a786@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/02/2025 22:31, Bryan O'Donoghue wrote:
> It seems to me anyway we should try to push as much of this into core 
> logic to be reused as possible.

But there's no valid use-case for doing

ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);

in the driver and then conditionally doing it again in really_probe().

Its an either/or.

---
bod

