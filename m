Return-Path: <linux-arm-msm+bounces-52728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D97D6A744C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 08:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63C473A4E95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 07:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BB4212B0E;
	Fri, 28 Mar 2025 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Glm+OIzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774D517A2E0
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 07:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148207; cv=none; b=lo93jxAAK/DLOENZ2UjxA5qe/QptY/nPXBuwxe//mYs25IuFui0x8WS5u4Lqt4/uXn2YoRRRnzlgLjt/s0uUkSQaX0Dem6nkZmTwWWngD+EAof0IlDe9v2Wf/5fC3sNiC9lDmkcE6ay+yCwmQZNRVsIeKuLj/2AHWS/R3O5ecFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148207; c=relaxed/simple;
	bh=BwOUj6dz3u4rDfoOLF+xUv/0pSmVzvjJWmh7H3R6JRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShS8JoogmV9zp0+kewqGIHCTkkD2Pn4kjBZ8J8fHIc9fuFq5abA5mk0qxFVqvnVNX51tlsfr2ekz0FgC3mdowGePr1+wSB7qShjvWlGyWYqxCDS6DiosBNbEuBRx+48T4l/UaS94a39Z1oB7in3H8tK/mRbQKnwCCS4IOMY1kzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Glm+OIzQ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3912622c9c0so165772f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 00:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743148204; x=1743753004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JvBkkOjgd6wmR24LHiItQPiCzJB//UP4blLg1J2M0zY=;
        b=Glm+OIzQJmhP5ETpserAWu/wtklm6C/BPZqV+TqcL/5jYVwL28XujT+nQ9JZsSULl9
         eFnKbufkGZs35DOKCTRit5eLBe4H//lLPxB2W/BHxhf0+GRfKNj/lF74ZC1TKxFLfK8d
         LLyH+kCr4gp1yygZOlszGO0ZxD3OOtLh4nbptrESXJZldTom9KIpV1jL3wepDYx86fgl
         xBm0qnACfc3BilHTTaKcI5kK/J7sQyfnLQS2Uaxye2Eu0oWUhPABM6KkwBFKj9ooBPZH
         VXIzHxshOWzLkxCOSYS2Wyu9Cz8sIUMmAKPm4xU9nCkgER/YVn0Wzetff4fNPkshwYL8
         SzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148204; x=1743753004;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvBkkOjgd6wmR24LHiItQPiCzJB//UP4blLg1J2M0zY=;
        b=FaNrpLs7AIkVjnmdh4or8N/mLj0qrQTozXT9kLfO3kQBxJD1vBDihXmHlw66hEGx2D
         NBfTQbB8czgBQCtVxZ5RZgK8cFHDpvp7gP92scz4FZY81bKqrwh63WLjP7H4nIPfn/rV
         BGleQTyrdrXwjchwpNE7AV8ayVEEr5oA+sHBuRj2qCR0SSG8C4HE/X3m9MoDukjbNTtE
         jv0tOdAOhqPnRJSP9d8UGHV80CsJj/yBQC2Y+Ai6+fET3aYaF8kmVMpi4he5ZDHjQRJX
         RcUj2osKv3gXlvm0oh8ZLuMWyGt/U21JiAB2YxJqrUKt0dAQwZEudg0o9G+OfJXafN/R
         xisA==
X-Gm-Message-State: AOJu0Yw4UYHeMu/V5B1CNkr357ljfj8F1nZGKr8zLimU8QZEjPYq8SOE
	AW5o2OpdKsylm+cyD5JW55lv+/84vXufATADTvPGHWZ1ix0UhReO4cETwIjTq5w=
X-Gm-Gg: ASbGncu86NfzSFoPik1/DYTKbLM+D8youxX+Y3/Vpxqm1EhU/c3Prs+dRx1VQW6PbY4
	z8298mQSw0IBqYyDkIi2bRAim6lwePsTlw7Esem6YuSg0qeQIdWeOlqUF1HxnmNzzZvyUQrme2P
	k+od1QHZkJyO13ZwkJm5ugpXramOhOdrEZVRlx/ZwLoSI1Myi7zPuzbATLiZCNZ2kVCyOpbN5KF
	gG10VaZFmI7LA0dHMnQyNpQ8OSH1HpDmxvCvDhxqyxJV6drnx/7d8Q94SQv0+k6qReC2hNEdUw6
	I1oZ4vt0m1ou4+xB6aPOB48AnxhwaAp76j1yAOFfa5mvutQd9ojHvBnfSuCLAgk=
X-Google-Smtp-Source: AGHT+IF8uUTX/rYqBQY5beQcjV0f65fHlz5xNO3COypgoYe4eaMTJCL9tDcu4xtDoeHDnHmzm4LPpw==
X-Received: by 2002:a05:600c:4f94:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-43d85f1125fmr23257925e9.7.1743148203687;
        Fri, 28 Mar 2025 00:50:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efeb11sm62141455e9.22.2025.03.28.00.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 00:50:02 -0700 (PDT)
Message-ID: <97bbb764-41a4-49ef-b99d-7225ea7364ca@linaro.org>
Date: Fri, 28 Mar 2025 08:50:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/13] arm: dts: qcom: Switch to undeprecated
 qcom,calibration-variant
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2025 10:58, Krzysztof Kozlowski wrote:
> Dependency
> ==========
> RFC, because this should be merged release after driver support is
> merged:
> https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/T/#t
> 
> Change will affect out of tree users, like other projects, of this DTS.
> 
> Description
> ===========
> The property qcom,ath10k/11k-calibration-variant was deprecated in favor
> of recently introduced generic qcom,calibration-variant, common to all
> Qualcomm Atheros WiFi bindings.

Above changes were merged to mainline, thus patchset is safe now to be
applied (as far as Linux is concerned).

Best regards,
Krzysztof

