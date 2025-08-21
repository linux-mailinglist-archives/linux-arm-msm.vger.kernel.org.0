Return-Path: <linux-arm-msm+bounces-70196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 408CAB2FBD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 16:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D1543A665D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 14:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD3E1F463B;
	Thu, 21 Aug 2025 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DpuhgHNs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBF41A9FB7
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784857; cv=none; b=eltppJM520bdD3AGjKtpxIrEkcv7Pd5BGBs+TQlXP+QvvcpdpSj4yxsAfSaInElMEUN3NI4CWyJQc74EI+MWBu53oTQUvF1NfXHD8Mh7LCioVVVK24iDNCljVGWWWHNjGe1vHO9FETLwFg+y4/hvHF2b39dFGwTDQmJfgUry1SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784857; c=relaxed/simple;
	bh=n8EeR8AlRHg9lyRDsjg6aUEaZNeYvKvFAxGGH0Dl8PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNXiei8HZ0jhOPsXxlEgwfXCYNN4OQlMViyRhS2uqTGsThTUJFvlcZkQAUzz+lbLkEXC5SxWmJ+fVfm8s9MNz2b9tfoSORNTvt9ys8011h8Fa+9BHV4KEPbFVBLrjrdg5Sy/keAbHjV6fRSxHf+8hsdkkjYpdK1VO/kef+USp+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DpuhgHNs; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b05a49cso7878165e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 07:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755784854; x=1756389654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8EeR8AlRHg9lyRDsjg6aUEaZNeYvKvFAxGGH0Dl8PE=;
        b=DpuhgHNsOHT65Vei5tB/ZB30cwg4KJLeNLOztB1MDSGorv5MCbJZlG++uRsV3H5Jr2
         gVYqtrxDLBrDh/CtasgWJXUeUetYIHNlY+A7L/fNEDmk5kJnhW0LYXEWP29JW1f8zzek
         KEM47op/Swxzfy/AJtcWq0Owfv974khND0fm6evYn4qOicuahcyEYvGYrk0bi0kRzDHZ
         710hALMOUbWX8HPfxWwNX7U6JIULGluTl7U5yHVxb1FOejycOwyESTQDTNYiI3SdUpC0
         DRcek3NXySP78HjLtk0W3x1UuS1pyGOmTWHmnruE4AqkOsOKWoxbMH0YIBoKKAmVxM0q
         Li5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755784854; x=1756389654;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8EeR8AlRHg9lyRDsjg6aUEaZNeYvKvFAxGGH0Dl8PE=;
        b=Spacx5PRaIxXCnfrQxmYm4KqhDcMLQUmV1aYaXW11rUYSQKe4zR1v0tJaHs812DtJV
         4lqFvlwTkopSo+mmx8V1w1PygaQsxxVYsijfymYikFTMoHDDfFivn4AHE90aJHdWGQMO
         vZvzRRLlOd/DVNpxJ7KhPz4SRXpb9r1QrFYwaZY+ub8wXUUt1C6yErkUZ/WSZ/qcAfG2
         zTXFgn3p1d8o8kkVcu2wDLHkOF2GHLLmVK4IjZj4w2TImIq0iF2j6BE1RZa+Twlry8c9
         Krmx0bQWssm+nV8JNVN7TouaWNla2kZ+rdq3eIK3QmPE9DSQTfxnxwJ9tPfWAFL5mTsd
         Wbjw==
X-Forwarded-Encrypted: i=1; AJvYcCXRhhaZhrmj2tffbaruDu/OhjCIRrOA+ykLII8ebnNjbBqlkHhxYBSlRgzpA0vLQF+Yj/2U2vOqQ0TlkSI4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxhh4JJfpztrUjfSA+iGoo60bU1tSV8h35VusoA1WmMGjxdeCd
	TC7jM4fHgxdKlIYGoI5l/kNty3kYSN5vbBhYlCMyr9pzQ51QqoUajThkvO4RAklc5Qc=
X-Gm-Gg: ASbGncs58ToK9N2sJw03Kode6Qd6IHsxhnP/+t8u+4EOGw6fLWIAos0NYeHM13LYfHE
	YCc8LOchStK7euCL7kwdT5ztc80YHKE3KpeKZ2KInCmIR8Rodv2k/MqV9H8D5dxmIewx5d4ZxV4
	jxHjQQ8yIKUUYKf6F2qMu3Y/+o90vzmjymtT7lz7yPVWt35f9mg1BvZ3nBLa1wDGOBsb/amlQsu
	umC7zMDS22gQ7t0weazUyE0zSFkyjgeNBBxWIJVPj86q6kpVr2IoS/TCsQBMTFE2/gS/bKczlEq
	AzN4dHGvM71ulioDcuE5e+wt7RrmpmJU/k4tGfpcSjIP8Uxs0u3hige7gqtfq11mGSYdC6lcO4N
	e6U6jzabXNQyf+Q44MMqY7rfpSJmW2yybMH+9wIn0TpcjYQUNEUwQZEq1uLiemZWC
X-Google-Smtp-Source: AGHT+IHkgchaFKWj5e1UqRbNztw1zXa8xxHeaBCgL2s4YsQqE8YJMTF31NEBDYvPnsH/XtrEWLoDDw==
X-Received: by 2002:a05:600c:a43:b0:456:1d4e:c127 with SMTP id 5b1f17b1804b1-45b4d7d687amr24197735e9.8.1755784854158;
        Thu, 21 Aug 2025 07:00:54 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e8de85bsm12008615e9.7.2025.08.21.07.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 07:00:53 -0700 (PDT)
Message-ID: <9863f7e7-ef3e-4f57-bbbe-9ac4aa88a426@linaro.org>
Date: Thu, 21 Aug 2025 15:00:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: iris: vpu3x: Add MNoC low power handshake
 during hardware power-off
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20250821-sm8650-power-sequence-fix-v3-1-645816ba3826@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250821-sm8650-power-sequence-fix-v3-1-645816ba3826@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2025 11:54, Dikshita Agarwal wrote:
> Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
> reading the LPI status register. Introduce a handshake loop to ensure
> MNoC enters low power mode reliably during VPU3 hardware power-off with
> timeout handling.

So right now upstream we have an incorrect power-off sequence.

In which case this is a bug fix and needs a Fixes: tag.

---
bod

