Return-Path: <linux-arm-msm+bounces-6693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48482827BAF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 00:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 535331C220AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 23:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC4856475;
	Mon,  8 Jan 2024 23:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+7RGMXv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DE55645E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 23:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e47dc8b0eso11462205e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 15:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704757503; x=1705362303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kpE4qjeetNEvv2r2f+0SxvAe1muEwFSilksS8BiXRqc=;
        b=V+7RGMXvtO2I3zQh6Uf+7I++ZiXRzIEhKwPl86hBtUjAZsobYxAUXGptSMcFPPGpTs
         xyR0c3LqP2PvbTKaxBkYkNy/5lRkGy3sef4g+X7SXzZhKdppWxpYweKtLu8cTy6o5rug
         Xl6ySxgZXrFfSCMUOhiEWj2VY8bVzfFoqa9Ygy/V7jUvFIwiAdtA7lmkb+ySyc8Y/Zkf
         IFZcRFrrizXvLrVF0AN7TmbtA90umArRDM1HyRskjigNfICChRF5oYMNlI2ysK1UGFz+
         7DMMrUHvNroUSKb5oM28robR1ayJ6cL+3RFvWQpzJVpvBga2BearNU0WsdxMjkXJTB3J
         5J9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704757503; x=1705362303;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kpE4qjeetNEvv2r2f+0SxvAe1muEwFSilksS8BiXRqc=;
        b=hk6kem3EyVCKukWRCxCN8AKa+ryMb5qvqHrv4iA4bTXH0ujIpMHhZPYxCBtatmzzSb
         ck+PzdmaJ9Qe/pX2fC4Ik9Vm1KfxzL31smdaM+asYbJTveH5UodIRJm8ncLHedV0EOjW
         MCPGYbZErPMk2FL/ncMz8gngjRkQo5RV8nKdSOSZsBqdlrlQz1yi0WBATR8UBDn0cbWx
         4tB425DFSH9ydeQ2cusy13UE+H2d0DRvDBR6b8wH3xOAwqGxMh7/QActChDsWm0RhLw/
         bZBy5lwIAcuIEqXND0uNp1e5Lu6bMZZW/K8XE/Cg3S8iRwctcsjbwhiRIIu2bDviwcNO
         hoxA==
X-Gm-Message-State: AOJu0YzxB9gZRmURx50sKK/f/FhyNYK+3uTXj0DwdRehwq2sQL7K1BT0
	jxaOZQQ9etbkTOt35nYtwkOr3IAejPRFWg==
X-Google-Smtp-Source: AGHT+IERrmwHOLhdJIube3b8XFQkbiWoBjMVF94oGhwhvLiqJt7I5hYP6vW1ivHxK4fG9uN2quaqQw==
X-Received: by 2002:a05:600c:ccb:b0:40e:4c1a:e87c with SMTP id fk11-20020a05600c0ccb00b0040e4c1ae87cmr395739wmb.119.1704757503250;
        Mon, 08 Jan 2024 15:45:03 -0800 (PST)
Received: from [192.168.100.48] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id i12-20020adff30c000000b00336b8461a5esm819712wro.88.2024.01.08.15.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 15:45:02 -0800 (PST)
Message-ID: <5c274f9c-6270-455f-8b82-fcba992e3b83@linaro.org>
Date: Mon, 8 Jan 2024 23:45:02 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] Qualcomm GCC/VIDEOCC reset overhaul for Venus
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2024 12:32, Konrad Dybcio wrote:
> Some resets associated with venus require a larger delay for the hardware
> on the other end to function properly. These seem to fall into three
> categories:
> 
> - 150us for 8250 and earlier
> - 400us for 8350 and friends
> - 1000us for >=8450
> 

What's your reference for these delay values ?

---
bod


