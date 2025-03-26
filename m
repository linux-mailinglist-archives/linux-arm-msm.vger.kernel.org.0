Return-Path: <linux-arm-msm+bounces-52560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4511AA726A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 23:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26DE23B1ABC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 22:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A63263C78;
	Wed, 26 Mar 2025 22:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VOgg/BhS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0B3261399
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 22:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743029499; cv=none; b=WGhL2dZuD96X2SM/JJt2kvBzAMwJHaz3XWk7f5PzVKNDRHEDdY/86KTrdZ6FcTikg73nY1ntxl6Y5s0rZ3hsVr4gM92dLyRKtt6WIdjOYPCnKuT2iNJse24OkxwsQZVQ1PVaJYYL823mCKqdQfaQJACd0QW+nhJ/VPCvCEEpcKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743029499; c=relaxed/simple;
	bh=9W8BT1rU43QQlM3nGYO2e/Y+imPrehWaKApa5DpYXV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTVF5D3vFYqEgFMDKUw+c8uWuQcJrQQhEAy/VV2Q+0NJc/VP78yrM8e6P0glhNBItJfXC9+hgNUjrt1/xx3RG4ucuScUTBg9aNb7A4A/Hskxtn1pecWFVrD6lz/SY7LgDGnuVj4yu0MB2/gmMLzIkJTOBao6JI0hzZ9kgpduzUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VOgg/BhS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so2677075e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 15:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743029495; x=1743634295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9W8BT1rU43QQlM3nGYO2e/Y+imPrehWaKApa5DpYXV4=;
        b=VOgg/BhSmJAiJgAm87D3F8MZlouJMCeHJWZRBiDPasL6DIK3woDpOMmf2iMJBvMg0r
         ChZbfnDRwlfLleNBC2xvlEaYPb0jjMc61NQ2l9qz/MZ8g9jsJbEUrcJkHFGNCZJhes8O
         TCqwJ7m/znyuvVqfM53oC+wVuTjGiUIrd5f7bE8JDkKch+k+Ygpd2VwikAb4W+QMgVwH
         GpCznW3GSPzCRXNowYvZ5a2gkV4c1GNUkxzVRN61ACZh7oNkViMDah0tZTUIQjvA8BU1
         I91e5bs++ybUIwF79Wfxbvxul7FP5bTKnkIJbADRQ7y/NsPgYS+T9qBO1kcYj8ILAu4Q
         m8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743029495; x=1743634295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9W8BT1rU43QQlM3nGYO2e/Y+imPrehWaKApa5DpYXV4=;
        b=oXxC4ywfY/E3nK6aEb7OXpRhvvd/AK7OgrmGP37cKkLNQZb3gYlddFo36mxuIjpS7p
         7vFzwK2Ri/6mBr/A1uy2T8jd36eL1TiwLDA9R6z7lKT27Mq/3wfJpCRK5w/ATLIjjxqn
         hOm/bOxPFWBfcV/TZInvPKbHyRacp2zcYV2762FEDe+zm/klgOT2CPJpDcfajiur9Xx1
         ssio9Fcq7RFFVONmsqdOyXjIgJCnaYmH8k9GGc2IZEWc8hHtbotFb3ZmpXjHGHvBxGvP
         V+CZvj4efdfaSaOWb+3k74fLHnqbzYSZDt2hD7QVnwgikgxcqXvEa/v3aATUeqCqulnH
         6zOA==
X-Forwarded-Encrypted: i=1; AJvYcCXefy0+QgsJdBkXo0Ru4fBpRWNpWava6Wa+xip4AvGb+VRdOU4CMRbzvc0kWdm+06ZnTuVJu9d8JPx6ofvq@vger.kernel.org
X-Gm-Message-State: AOJu0YzAB2ewp/qvRcyiUmUQMkvc1U+z46KuC+nI0SSLG9o0CCc7Q0Cj
	mnMy+h1WSOz9CcCDbrQIkYqpzNtWVEf6ukCeH7seRBUGF2OzSNqVW1VMMD3nVdo=
X-Gm-Gg: ASbGncvRLz76C7pMpZy7D3+zPP4JAMnaCgwJOdH2U84ioh7X+vrB640wSzMxYhKSOl2
	Dg7fIQz3lTYQeuCv8FYEHaae061DAvUhDUkOZS62HD5DumFBxTIMAZEbS+0SbDEP4uxTbeRZtXD
	kg5EMsvceptg87BmhAUhkzRQgZx2czKt1OxPfiFAJQVLMlQr+dJsu+SXE0M6g+E6Lgh8gUGf9GS
	fgWdnZWYG+GbyVQA1SazThCXMctm8VuWN6xc76D5JugJ+71rfyrkqpLfdA/isMzsqZx6IeA4Y5G
	P78KENnBl8EWmm3eAwHw5GSuZeP6kUrsYI3gD+Sxxz6kNGK1bPetvlEfLiE/O9P6MN1khtLpukO
	s9VWPKYfYK8bzrH7bpWwS
X-Google-Smtp-Source: AGHT+IF3X3/hnoBsNfxpWnPlMXapCurjNlJImTiX0kVvl4eg95HRoqZ39nIoykw0ueeFjPTVdJiVag==
X-Received: by 2002:a05:600c:4712:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-43d84f5b6b9mr8578955e9.3.1743029495605;
        Wed, 26 Mar 2025 15:51:35 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d830f5708sm17268115e9.32.2025.03.26.15.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 15:51:35 -0700 (PDT)
Message-ID: <bd73de09-bf5f-43af-bdfa-70b3c9d82698@linaro.org>
Date: Wed, 26 Mar 2025 22:51:33 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] arm64: dts: qcom: sc7280: Add gpr node
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <99Kmw5-BXfX05ZwNUzOT9v3wiUXyJRCIyH_U5oOlBvz6-3i6cCbHAnDSD2431sH3adMtdNWeAwbc-05oPm405Q==@protonmail.internalid>
 <20250317054151.6095-2-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250317054151.6095-2-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/03/2025 05:41, Prasad Kumpatla wrote:
> Add GPR node along with APM(Audio Process Manager) and PRM(Proxy
> resource Manager) audio services.

Nitpick.

You've defined APM and RPM but not GPR.

Your triumvirate of TLAs is missing 1/3 !

Please add.

---
bod

