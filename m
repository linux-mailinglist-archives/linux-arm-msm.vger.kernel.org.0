Return-Path: <linux-arm-msm+bounces-71496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FD4B3F506
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 08:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292882025D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DE92E1751;
	Tue,  2 Sep 2025 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhNiLz8g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0660433991
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756793315; cv=none; b=Iqw8BXUWD6OPieU3bFQAzrxyGcvpWb/7hWvrHiDqR/lo/nKl1dEMP0Bq39cmgwvFxQ8OYYkY4Im813KSYu6smzYRhth0nb1/AKMvb+jsJnNHF6z81fAeNDS8cTg03HFzkWptaEk1ilnvEaHRbGKp6oHwHamSMtEdE5w/kjChduI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756793315; c=relaxed/simple;
	bh=QLmvwmUq5h9swX0zLB+DgvjIevRVWS9QWn5BkMcxYSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i73Euhq4845qqkbhf6DDAnj47Per02sVeWwMFfUzIUl9t1ai5w72WQv9q1jyeBqoqtG/6hsYzemrbySzPs/GGM52Hc0UfjlFx3JREUdb/FupbXiL2qolkzXKqrByrwekj1Y6gcAtWdaXtB7IVkzM1PuHcLsFnjeVxqDySyzeMLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhNiLz8g; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b80a514c8so2839495e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 23:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756793312; x=1757398112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aHeN40gFm9aSbsJ2megLoxDLeCwIuUbaDBPA1LSwj44=;
        b=QhNiLz8g0TrScz4X7OJPwJIH7hmIE/Oj0Ta2PJqrXafUpkHMyz4CVopN6y8cwXB/8m
         DhkabecL/PUpfASzzvtYW1cZwZuQ50QKjVRVJ7xMqnkX7GKfuonvp4f4MX5PK7OFAAzn
         z/fX9sOgGM/ZcbZB4NY0jF0DlQ6+NzzAFoB8Pxt5R3o/HOs1oLRBLvgypv3hi+jc5U+K
         zZmeUVzimdCJAYFl8HKCzL5BPt7Wt2jbs9cng+zEGmQcN0iVLJ0rJgSvNh85viJrKYPB
         6Vi3SjTn4qlbpSes3xlFPD9l38d463D973q5r4s+2NY0Z9URb71c6FCoGyCW8jH82Hsh
         iwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756793312; x=1757398112;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHeN40gFm9aSbsJ2megLoxDLeCwIuUbaDBPA1LSwj44=;
        b=VLCSGaRYiEpRw24kiVAVSi5LWR1AyS/hPH9eppSLkRSaquT47hG2Z6nhk977y224PZ
         VaI6tln0/1RPsat+QscTJYjqSIqrF3K8ptDv3QO4oaWV1rEVEi+h7JfNM/A+jdbepcSa
         HvAbQrYOnxId2CK4mHUhcNcWRgaMNo+736D2L7OBpOsSZ6YovYWhLD3L7fK6Tr/BnT+Z
         Wi0XWU8A7r64DINYhHse7fb7879XY9QzplHY5QuHGiHzG+qW0CFWjFx6jpBgu+/ZZCEl
         f52LLRFZ29C9b5/vz+o3EvNkJZ2/CatMBRLD0z1NEpcprS76cmKPbSv9DXEYrpP94UC2
         FYAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJZavdGI8lfdXEmwasJpQDHsZQDSBSEfsGvl25BndgeEZNyNGQVxrGJQkvniyLdfGXD2Yv+i+w7pBVMNU4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr9fv+ZvtxEcnqzg7OGoNINkc6DFVaGdbBAD18r5rRfPjuubwa
	0GD/Xe15jISEgJC2QyLOfFApAZFgMYVQfEEF8tlv+Cpjt8Wqdfu23vycNpk0eN0nORg=
X-Gm-Gg: ASbGncuXQAGfKFPeBhuvTXnpLF+Bacxfgk4dKaSy5pn38iqnchWhbU2JMlGtqINxvMl
	CVRlwDrtMPIcVar0Rbxj2u6qtUoI3BGKTELuBBhrKg/VOFWBWC6lhYgTWaP8PXlNa/I0X7cnXIg
	OeNt5zOxV7kHa7+dKYrB9bON2m1xjEFUoCgLANxkWm/9Cffbz2eRfta2JoGNuQtRBySFSfqX6j/
	8wePDpotgJ85t+xu41hIkRBExODDG8m6OJpbRdHGH2dhSt7pP0EHLkimfnUy8Tnmq9yPPls7VTi
	kzqza61mgpkZqvUWQ6fBq8JCvPq5q+qlew2fGYWUsNPsmq6p6h50oWyjYcPI//yJNT/Xt+Tlznp
	Cr+W9LegeKrJ3S+Z8CaWZcLwCQUwVmbNcc8N4d3VA4dGitscPIBBsnA==
X-Google-Smtp-Source: AGHT+IEB5wuckpDue9hE5Qf/P4F7Pt5W6ZlSWYjEWe35YrVRkFYFEWEYhjdcJ24PGqJvwq+T4CniLA==
X-Received: by 2002:a05:600c:37ce:b0:450:d5ed:3c20 with SMTP id 5b1f17b1804b1-45b81f23e6cmr60632745e9.6.1756793312438;
        Mon, 01 Sep 2025 23:08:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e380b77sm187960455e9.11.2025.09.01.23.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 23:08:31 -0700 (PDT)
Message-ID: <6889f493-f37b-43a5-add8-8e170e295492@linaro.org>
Date: Tue, 2 Sep 2025 08:08:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: Fix playback quality
 distortion
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
References: <20250901074403.137263-2-krzysztof.kozlowski@linaro.org>
 <bect6bxzxmxguqsrxkchbkhhxgz5lmnzzkwwjyvaca7qtlfz4r@lxmmfto2qkm4>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <bect6bxzxmxguqsrxkchbkhhxgz5lmnzzkwwjyvaca7qtlfz4r@lxmmfto2qkm4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/09/2025 04:40, Dmitry Baryshkov wrote:
> On Mon, Sep 01, 2025 at 09:44:04AM +0200, Krzysztof Kozlowski wrote:
>> Commit bb4a0f497bc1 ("ASoC: codecs: lpass: Drop unused
>> AIF_INVALID first DAI identifier") removed first entry in enum with DAI
>> identifiers, because it looked unused.  Turns out that there is a
>> relation between DAI ID and "RX_MACRO RX0 MUX"-like kcontrols which use
>> "rx_macro_mux_text" array.  That "rx_macro_mux_text" array used first
>> three entries of DAI IDs enum, with value '0' being invalid.
>>
>> The value passed tp "RX_MACRO RX0 MUX"-like kcontrols was used as DAI ID
>> and set to configure active channel count and mask, which are arrays
>> indexed by DAI ID.
>>
>> After removal of first AIF_INVALID DAI identifier, this kcontrol was
>> updating wrong entries in active channel count and mask arrays which was
>> visible in reduced quality (distortions) during headset playback on the
>> Qualcomm SM8750 MTP8750 board.  It seems it also fixes recording silence
>> (instead of actual sound) via headset, even though that's different
>> macro codec.
> 
> Wouldn't it be easier to assign 1 to RX_MACRO_AIF1_PB,
> TX_MACRO_AIF1_CAP, etc.?

That would be basically revert of mentioned commit, so same arguments as
I used in that commit.

Best regards,
Krzysztof

