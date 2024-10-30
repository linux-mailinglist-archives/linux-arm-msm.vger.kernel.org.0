Return-Path: <linux-arm-msm+bounces-36416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5409B613F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 12:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CAE81C21AEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4823D1E7648;
	Wed, 30 Oct 2024 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HTEIxt0r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103861E573A
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287063; cv=none; b=iy/ypvuZvYVpYSMnKKsP0z4t5XfERoMg29QXUKtFQiFZ3gP/EHB+6X3EbI5t7zQhoGfasEW5ueI6Q07SawTKzJ218l+ZpAjkGHbsd9kxMh7wYGZSaQYLNoVxo9zsRlbeXpJmaVLtHFPBJq1tqlgnOjYLdrRt4EZKROoMRE6UiHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287063; c=relaxed/simple;
	bh=0+ANpT2OwyxJuotxxojjjQEkhl3iqGOnYjPNdkQvZcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTuOhqKAW14qxTVL0Sruxmg3JERNMD9tcvQs4wr9K6h62P3KJRWHPTgSynFq9g4huLNRxYo0UxkFKSMFhueSdB1ZBR5UdNr9GWp+EoHyAoeq/eg3uJDCTaIre0XLwmAqTcBS+1AsuqzltQPzyL6HfcBuFGFAmxtJemE537esaew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HTEIxt0r; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53b15bc0731so859860e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 04:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730287059; x=1730891859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=356ISyJwQrslqNkIAE5HnlpLPQYYjpzgyFzJpPVwQPo=;
        b=HTEIxt0r9BXBs5d/AUM6yTcC/3Im3SZEnrBDMg2oCOeMdotCzLZQWpeC+WE2qGcspH
         yadIowxjNkPX6hoffaivkBECYNsMn10UiSzxsyvZFi4lNAMFP5bA4Kc2VddZKcDauv9b
         yxBhRdvPh4CzVfH9CMbEdIZa+/bG9GTiiRfPZYZp13v5MW7kim2lNpulsgYz5cvVIbiE
         TQhRCbzFTrEfJosECQkyDeXS6UR3EE0wUi7yvVKQ2qOBJI++OtOGtREG31Lz1RrsPZXW
         UqMcds5o+VqY5jIX1ZzR5TgzXUExkpVYcMLwMfYOkk+nO1dAAwYHFftrNdn9SD5hWNLT
         4rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287059; x=1730891859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=356ISyJwQrslqNkIAE5HnlpLPQYYjpzgyFzJpPVwQPo=;
        b=CsvJsFyRXfsPui4aPVlFKNGqtkf637OpBQmGFL09T/zQpZRuSWxCTmvRtT+ivQ52SL
         M7dJ8sycPK+ZZTbVThJndlEHp48FN30fpRr9vscPljI/gjMkCBwDtjBNf470DEnzAC4I
         lJWCTUYX1RjAdoTK+7FLcWG8fjTEIM6X7eAQWwRWm7rHChO9dHjY/SNr1K+rgEuCll6i
         SebIHUTf6tg1PijnQNWd7B6aFUmE+Fod7Kpa2OvvE4KtjemOilnRzsOkKLgSDXxNvSOm
         t/5P10tKxDr5SnDkJe3ZZcVYC3dmMs26rSRHOq7XiaGpPXY+tv1iyqBiZuN4kT8xn63S
         yNwg==
X-Forwarded-Encrypted: i=1; AJvYcCXb6SPQosi7P53wBMJRZ1asORYUedCZ4TYzfyBVNjyfR8m101OZmEfKkF8nWAlUMk6kb6i/1jrWatzK41Ab@vger.kernel.org
X-Gm-Message-State: AOJu0YzBXxvDCVoOXkbyVe4U9jEqnEHAyDKZZxtfrJA5nP+qJQmm0J3L
	/2ahnw1GSxFPFE2FIMx8FJTFYJgUQhG0y21wkpEoUFV3umlQo1u1Htx7+8idhxc=
X-Google-Smtp-Source: AGHT+IGnM+oSnQStBfWKHreFs9i4FFNZc119m+7yiPhy6glNaO5Ho0YNgrbESTHVYDwlQmgkL1c1/w==
X-Received: by 2002:a05:6512:2255:b0:53b:1369:fcf6 with SMTP id 2adb3069b0e04-53b348b955dmr2386293e87.1.1730287058996;
        Wed, 30 Oct 2024 04:17:38 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb819070bsm223221e87.5.2024.10.30.04.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 04:17:38 -0700 (PDT)
Message-ID: <78f6bfc4-69f6-4a1f-a47d-6347910dfb46@linaro.org>
Date: Wed, 30 Oct 2024 13:17:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] media: qcom: camss: Restructure
 camss_link_entities
Content-Language: en-US
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
 <20241030105347.2117034-5-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241030105347.2117034-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/24 12:53, Vikram Sharma wrote:
> Refactor the camss_link_entities function by breaking it down into
> three distinct functions. Each function will handle the linking of
> a specific entity separately, enhancing readability.

I kindly ask to exclude this change from the series, it is unrelated to
the support of a new platform in CAMSS driver.

Please send it separately and rebased on the current state of CAMSS
source code.

> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 159 ++++++++++++++--------
>   1 file changed, 105 insertions(+), 54 deletions(-)

--
Best wishes,
Vladimir

