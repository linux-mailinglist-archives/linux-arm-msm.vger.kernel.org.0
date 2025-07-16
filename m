Return-Path: <linux-arm-msm+bounces-65216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C9AB07420
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 393D33ACC08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5F62F2701;
	Wed, 16 Jul 2025 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvLMByKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A582F2729
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752663591; cv=none; b=WtqgZIeHiFPAFMcKf1+NITHX1zsVrNMnAKcnApWOUn9F3+cx2YT1gN76dmcwPNEvpcvx/mq2U0QrcJqm22LHuX9ZXP6eFtL2EcMgKZG2Q0dIU0EgTR7qvcJCfkqiDcZNJLikZlHCCUO/7cSX5vvoaKBJDUOCppuo5ABAcioIZbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752663591; c=relaxed/simple;
	bh=RdqRsNDKKQgfrmCzzuSlgn+ij1i4HNnTBhYJQ0dea1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1lWQLnyIod2KLonnSe+EIL7tTTXZJvJE6Hjo/mkrkZMCc6er4MSe4h8Dul678gqZW0IUBRbD8Uva9du0n3PB6RspfVskT8sX/vPhNsAfkm49PQoPOySvCPJlE1lESIlB8rkSSCWXiaPknIlXaAtPYAjV5rPn3dKNOabBFSbgiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvLMByKW; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so22101285e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752663589; x=1753268389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ePoCatCn8uwrUkfz5cDfhTqogA3pDEPeb9x1/QWcKE=;
        b=gvLMByKWWrz/Je21u/3w94ywjHh/tG5rkSpEu7VlmghZTilm9RXPY+RVoMAMJXksla
         b9+fiylhJAmnML3q9lrgDt8Soa2jVA6kO9EW+8HMNBSfZTwsPbwKMIoGlsy2/egVH2vT
         NqCQ2qJ8JsWbNNntz/57I7zToJIPGQD2lnSY0FuXFT8ihW2nDdKoWQ+6MlCeji7EQLhc
         Ab2p4nY7SHOewCtYwJbwg6o2thxcQjzuAv7XfMea5YV1njfFKtBW/M5HVpiGcgCPlmGi
         waa/J0deZaea7W7wefY2Mf62WowpKH+70ZU3bFIVcoyEdSavBsyBMV5QF4rM54unV6GB
         G6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752663589; x=1753268389;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ePoCatCn8uwrUkfz5cDfhTqogA3pDEPeb9x1/QWcKE=;
        b=cGaE4FVUF9zs81VT0/lCCmdN2gK66M5mivnWTlWAs6d2o4LithSJg6biSRErY2hBDS
         h7IkKkXCbP8s2Kp8oAFigRQVVYFstTh9g440VjUlPOBqLhSxl+0AVZ67kXqbP0lyIx9l
         ra+5GqRaqiHROphnfEnppO834e/oRE1ij+BbllKmPcU2cZvXfNtZfy/2bkCkjCLgnVvt
         dQh778VzjLx+JqPMB2tTbFu5nM5l0aPQY/Z61m/2oPl5i8kETxj+/vxaO6ZfNDSszWIF
         8w/3VrFS3UWAfawORKQd1JQPDyCS6KXZFXUyGh6Y+BMSB+TuM0WAVKV9gypN4YYXnoFq
         0Nhg==
X-Forwarded-Encrypted: i=1; AJvYcCVfKj/SH/OxTVljkTLO4zHrzzs685zSFSot4Dt3AJDwNfJ6rDdOT/CqNCNbOFhkjChHUYlnFxOXqAvS2t1C@vger.kernel.org
X-Gm-Message-State: AOJu0Yydk1HDOPcl4nr12oUYFLsVMIx4KuHy36w291jRLGHBk1ewpyjU
	kqxGxz9eKYhsPrM5iJRACjrnZPVbS37oGoA1I3fyw28CfXLM17RnZULWakaCnpiAqGc=
X-Gm-Gg: ASbGncvA5sOVVDr9LZD6BCwi4/2wdK1VR6avwzvu8rabw9HHfyNlIz+Gjkvtv7qF17n
	gghMnJvcc9zvWJIaI7i9N45RkxeWrmoCS5hDpK/OWbMAIvRDBn3oKXDQA45KgeBIzTb/5UEnGlq
	5F9wzaQYAuUI7KfIRml6NPltgSxXMigUQ7hXzlvpVyV4dar66qrh7dUStk0sXMZ1UHdGAiGkJ8F
	cPg0nswZcoGkqu50cOgSRZ7twoKb9y5YrdMwVFpvD3yM2v3Bvg8JJukDKFDlHQ65VRsCRArNHuZ
	GERdd2AlKw7Zl2Z4iqQHGR4gSdQhtZ6eeHPPqqXOjzDdjo/J5cLyULoXQQq2KB4rrXgKPtBLzWr
	QKycM99YRN4PEmUiy3Dkp/Ef3yccmaB98pFH95edobDBSaFXZvPzmHysbw1TK3iw=
X-Google-Smtp-Source: AGHT+IFW0OX33KBpiLU6YOL+IJgDcuTQ1zq15zYqdjMf2JYYuPC7KCK+xgulExDW9Uc9Bd9opQZwkQ==
X-Received: by 2002:a05:600c:3f09:b0:456:d25:e416 with SMTP id 5b1f17b1804b1-4562e331640mr20250845e9.6.1752663588670;
        Wed, 16 Jul 2025 03:59:48 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b600722780sm9817655f8f.23.2025.07.16.03.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 03:59:48 -0700 (PDT)
Message-ID: <40784fe0-3c70-4e1e-8b42-fa7230c2485d@linaro.org>
Date: Wed, 16 Jul 2025 11:59:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/15] media: qcom: camss: Add support for PHY API
 devices
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-4-0bc5da82f526@linaro.org>
 <CAFEp6-0hDqgYsjOy2mCC6ssK2LkMM0z7L_szS+M_wSMeMe3pMg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-0hDqgYsjOy2mCC6ssK2LkMM0z7L_szS+M_wSMeMe3pMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/2025 10:36, Loic Poulain wrote:
>> +       if (!phy_np) {
>> +               if (!res->legacy_phy)
>> +                       return -ENODEV;
>> +
>> +               for (i = 0; i < camss->res->csiphy_num; i++) {
>> +                       ret = msm_csiphy_subdev_init_legacy(camss, &camss->csiphy[i],
>> +                                                           &res->csiphy_res[i],
>> +                                                           res->csiphy_res[i].csiphy.id);
>> +                       if (ret < 0) {
>> +                               dev_err(camss->dev,
>> +                                       "Failed to init csiphy%d sub-device: %d\n",
>> +                                       i, ret);
>> +                               return ret;
>> +                       }
>> +                       camss->csiphy[i].phy = ERR_PTR(-ENODEV);
>>                  }
> So what happens if we have `phy_np` and `!of_device_is_available`, we
> just continue without any phy initialized?

Hmm. Good question.

Yes but, that's probably not what we want.

Thanks, I will look into this.

---
bod

