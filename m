Return-Path: <linux-arm-msm+bounces-23961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38390914F1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3D0BB20F6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CBC13FD79;
	Mon, 24 Jun 2024 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rof1ZWoj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D038013F456
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719237043; cv=none; b=BGZFZv9i7vP05s9mcdodqDLcC5euDnTCOGYYUdL5Gbyjz9ITWJ6j1NKgHgrI/hh902CbEWxHpuIaluVUcfvh64E2USGObLzP9vV5BGjd9mYrChSFd3Kkw2J6rdte7ARfdjnIufTt4NJNAwJc57e9NAq91pTAt7gH5FTzasrIPIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719237043; c=relaxed/simple;
	bh=z/BP83XswNHp6PKHMVxMubSbUIJXlLjkKrnsqidS72A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRPP+84YmREkSlP5qAGP6x9/HEsJwspZ6bIk9JTYmAovisJKyHId1ObGvdEg0BINg/osDrz7ekGvIlWn22HLYzdiPaFf6/sQxWFhvK4CO9CwoTkZgy3fnVDWxXDWNC6SHW32QfYq16x9Uebo9/hY8fkf0PVBTSB48e60YbgVSUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rof1ZWoj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42172ed3597so25736195e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 06:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719237040; x=1719841840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/BP83XswNHp6PKHMVxMubSbUIJXlLjkKrnsqidS72A=;
        b=rof1ZWojpIIVFC/eolnsqhgcuAvtBrfMVyLuWO7oSY8oYou1sET6JPh8hpYTPXNMrr
         G5E4jHjfPNabx9e+2V59lb3g34rNddCLFVCTCVDE1/qup6t3bVsa8H9n3QcbVM3Ih89u
         75EGeeYcWhC+fo4KoCY5P1+vHiMFSlwkvljyK7/6Moe6vPVxstpcK6zPMoMZC2U1uLY/
         JgncHpdCZtLvCt+336+hZIH4yFBi21oL+0HfRmeYFWXFa/Ty4ENTSLNkBjPWNxyhiAbj
         ryKbkc/xoS421ihJX7HCIIfDFo4SVqcSUOa9FMr6glMNbTO5dkp9/wYQuP6RwZ2+d/bD
         0PYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719237040; x=1719841840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/BP83XswNHp6PKHMVxMubSbUIJXlLjkKrnsqidS72A=;
        b=gJv8P6Ai9y5VhwvG05+MkliVtnubOZMtZmMLvaBMQdRhVj6oL7NlHwE0JSGwwR1tAU
         oR6cs/1bj/N975E1tjtqOSvGKhBJAF7+vG+LJoulu2ZFa+fEXQ/gQH2zX2Tps2ih58Vz
         qv/cs888BlZEetuE60/d68urww8ND/oHe1tIECab7ZkyDsmiBGzMRFzriYtnrfnO3UPM
         khWCa6lQpkMb6dNLQdd8eytGk7dYib9PzLkmtAndWLDZ++/ZTShlrhHaLWnXamYcCie7
         SSF5SlwxHJP7yEZ/gC2nWi9nz5TCTfOcfsZmMM7zXJ29Ytro7FEsPdynfd94fMvt5GTR
         7gPA==
X-Forwarded-Encrypted: i=1; AJvYcCV+I5Y+bAauq6qbGND/fuF0HdprqBNzXTHO0Sm0m9r0jgCElxHUHCncKkUS7tjt4diwetRAJKhE27NynMHUNpvOyao3o3UxdpHArcRjxQ==
X-Gm-Message-State: AOJu0YxURMRRnfDC2301eIR9DsIgpCGbSytU7Tk8LX0GU9Q+Q9+mWBMd
	ym4mHMqkOnE54Zcu5saJUia+9kBluF5UNMXz7nRSqRVfF6Pu6cbaRdbNI+Emv0o=
X-Google-Smtp-Source: AGHT+IH0UOtcj7+Y/gX1YrYCTnHSIxnGgjDowvhX2IrtJQXZnFX5JX7IQwW3SiXT2NAml6AWjrCWcQ==
X-Received: by 2002:a05:600c:450e:b0:424:8836:310c with SMTP id 5b1f17b1804b1-424893f0aa9mr49757345e9.5.1719237040128;
        Mon, 24 Jun 2024 06:50:40 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247b608f94sm88234675e9.0.2024.06.24.06.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 06:50:39 -0700 (PDT)
Message-ID: <4d2f4a52-826e-44be-b242-55b50708692d@linaro.org>
Date: Mon, 24 Jun 2024 14:50:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 0/5] Add sc7180 camss subsys support
To: gchan9527@gmail.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2024 13:13, George Chan via B4 Relay wrote:
> - Add RFT tag to all patches, since no tested-by at all.

Have you not tested this updated series ?

---
bod

