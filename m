Return-Path: <linux-arm-msm+bounces-50128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CB1A4D6A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BB89188A523
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 08:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2162F1FBE8A;
	Tue,  4 Mar 2025 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lo1VmYry"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439A71FBCA9
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077476; cv=none; b=MVfJ4KeCTGk2+/HWWBAewbONBC0fRHGtVZk+xxM1DHSRamuKlRz/fDrN44q42Ch0agEKt1UibVDDKKEhh/jD84+HonHJDCRPennhRjF+wHNCHP7j7B8AsaJ71QqpuPwpiUMRBaZPTg86+izVHZY+c6Qwxuaf4OWrTZxZ2Qy9HuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077476; c=relaxed/simple;
	bh=KH3nMYakHro6elhaWLocPclcTEHSIfo+DXjkmYQmSBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agoaGS7sMuSPnntjYIwuoWpARbZ6RNcpdnfjlrw35s2EuO2wGFjeKhdhJBGkC8C6MC6IlvrGgy2Q3okUTHprmfw5gA64EWrf/mQj58kW0mPTtTupuFduKtC4AGRjsk/Y//SjAbQFbXcoc6ugz4pl7xDJJsSU2zHEdviCZDXiHe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lo1VmYry; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30baf244a97so4144091fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 00:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077472; x=1741682272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZVbEQw6RFiytzLhO8ZjD5z9kjTR3miKMHmSj3wWemVg=;
        b=lo1VmYryAiBxPVDFIZC5eSkNeqBI3deA4pp5EhTPCjr20kw90PmXx/I618ird/ga8f
         daZjZvXvOrqK+PgohZmmxDJ1YRWaPqUFF4ng3fO8hE6vdlTpxeA4lmykiQNBn2noVQ6b
         KJQJXjBG/e5HQUaEMkugy/42Lq3yTDfpfdUKnC+H0DuK6wwaw8imvybxzL7l38RuRl20
         4uiFO85T6BkwziKY8/Is8Oec4zeXy91ThjmtaknsrlSD2OdrObQ7yzXxSgf5SyaP8BYU
         X0eBcorAx+o1uSEQcbVG97kMBPSfxghxp+MWCXH9CdUQoGfBDCqtIj2sc0UnDCZBDc5v
         2SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077472; x=1741682272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVbEQw6RFiytzLhO8ZjD5z9kjTR3miKMHmSj3wWemVg=;
        b=Bij2ZzPzj5mKVyjItwPLTkLg8JX0UP3Vo2H0fiuQB0jMB6XzqgN3+G54khltVPqB1t
         6am72AqrOyDxrri1PEafT1c5OU1hH/HytaoGGELUdw1gKHo29UwZdRciW95oQJ512eyP
         BfCuf9YFDx+I8zD/W+kNwnVUSwFV43ja0Unjd2laWIRvsLObECa7UfF9VwMD+F2GkZ6R
         Xc39C79z94+AJcdlrNDm33uyD9BXK1g3d594A5E8CPXvIsFug4pLlGGkmBCq4887sP9E
         PDD6wDbNZ1/+wcN7OwkbdvxfJ8LCFS4L6fiYSxjEUaxQjM6uPqDf9Sf5WmEWSANOTgN6
         Lz3A==
X-Forwarded-Encrypted: i=1; AJvYcCVKYLTluKqI4UTwHsQJ7i/u5g1RxHb2ndTE7nlUPLpZSKN6GILdWh6NhtmYejbjowUUHjYAkJryF8TtiRJl@vger.kernel.org
X-Gm-Message-State: AOJu0YyWkwA/lg3xABUxxVJ1X2zdO+dtNZys75EVOHxGzAeky1K/CkrJ
	qq9ZsIUN6++oqRfjeYNfniIDurGEeQeQbKwNPgSX1RFqwF1VgCliy3yb6IR+qUQ=
X-Gm-Gg: ASbGnct62dVUmsSM+Mz0avA5S3Ij6dNYPZD5Mhx6Jd7C4JoRF4tPny1IlpsvDrRJ65O
	4+RGukvkDNtZrRbiP/Iaglps/KkeojBFo7NC2z+nlkr9ErUROwOhhFeQusgAvpS4AaqLzYQZ5Rp
	eGYEaBLAKRJPF9N69tcfxz0pltjMd+6JUQRtLKFjzxtKBPH6sOczI6XIAZjgAmcTVo2Nh+LaEpC
	TptnvZrRzmVBNDSTSNW6Dmi49N3icI0JNzgKM8UPbIvzj4e9n2C/XAEaWNZt6yjWaWAPogEy/c6
	zetVEeI//gqipvzb6dWVi05CmbTGWGxk4/f53PipljEumCcAz+wGP+vgoKiCBtPK+ltMQSB1/RR
	h2KTyN2MS8l7NKhY99XlC4Uk=
X-Google-Smtp-Source: AGHT+IHGTvkTD9fu2h/LbSP9/Yd5RUBp+SzgqOd1D6QzYUrOIsCFuwNCMHHcoRnNNIvYs952GekM0A==
X-Received: by 2002:a2e:bc87:0:b0:309:1c59:ec89 with SMTP id 38308e7fff4ca-30bcbb0c89amr3368341fa.7.1741077472196;
        Tue, 04 Mar 2025 00:37:52 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30ba4ac5f05sm10058081fa.22.2025.03.04.00.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 00:37:50 -0800 (PST)
Message-ID: <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
Date: Tue, 4 Mar 2025 10:37:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
Content-Language: ru-RU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/25 01:53, Dmitry Baryshkov wrote:
> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>> domains.
> 
> Are those really required to access the registers of the cammcc? Or is
> one of those (MXC?) required to setup PLLs? Also, is this applicable
> only to sm8550 or to other similar clock controllers?

Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
not on any SM8450 or SM8650 powered board for instance, however it does
not exclude an option that the problem has to be fixed for other clock
controllers, but it's Qualcomm to confirm any other touched platforms,
for instance x1e80100-camcc has it resolved right at the beginning.

To my understanding here 'required-opps' shall also be generalized, so
the done copy from x1e80100-camcc was improper, and the latter dt-binding
should be fixed.

--
Best wishes,
Vladimir

