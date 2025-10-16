Return-Path: <linux-arm-msm+bounces-77590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9CFBE3B7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 15:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BC844EE5DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 13:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08745339B4D;
	Thu, 16 Oct 2025 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lznjt33l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF84317A2E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760621520; cv=none; b=ElCBrm7//GO/U71bH9bQRwe3XDFo66JiL0idx2C1dcEo7boAOMnkkJWzOuhwW7LPiHZVB1rKEYEbM3NGklW3rd2ihp8ua3VqHOhdjenxmGx7IDYGWUjlu68AqKAvba4QoALz8t8eTq7ye3nbqhPHAGm8DGLotnSb6ApzSQr746c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760621520; c=relaxed/simple;
	bh=RFh/gqvFYe3mrthIbrCFXM9FsiCYqUCmiQDRUcSGYj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8RTxIwCWFJaqFIpVZZJ5II7v2f83OTYvde4XX6USyJMmXodUTJmMMNRK3km/e6S0uCG6li1+Mtzj51I+zmZAECLY20MQUPZyZAtYtVeSqaLIT6i5PJCM6s130YegORMPRFA2Z3L0Y8EDD8EAnlgkBa8aoRU4qPqiyhW7/tMMOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lznjt33l; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-58b002614d2so121490e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760621516; x=1761226316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVVxXst564TPeNRQIV0Zrdb17qt+RXom9Ra+osC/9Kg=;
        b=Lznjt33lDzi8vg9xW3aQmvZ5FOGRz0ZA0fkxtRfF6xXDtriiqL6widdjmiFIH85+lz
         +2VSOO2vt50e2hhDmYGvaJmqElcspSdumVCf9uN/kUgK3tqXDxTnR4Hf1CUyXq9ucngB
         RXhu4oDSaZE2CQ0Ynxk5KdcNX32LI5CWRCr/iXD07xi55j9/ntVZuy0OSYTJwnSq8FV7
         KwsEOTcWmyMVv216hXzxKhamoR8210lKSnECqmDCNGNB0mWhvVG3n7ICrxOyGu1h0ryC
         Y8tP1ckgthMv0ZIzSiz7XCgDTj+rsVMjg0HnNdbgJ0dPROIpFKXA1r7uitDJt2hIXDmc
         Wlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760621516; x=1761226316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVVxXst564TPeNRQIV0Zrdb17qt+RXom9Ra+osC/9Kg=;
        b=tSDinVkF7LBanu1aJKhQAOmzRkqrU3EEc6HLUycRGkJcuoLdv3VaF4Xv5FTt8Y1qAQ
         omN0CBpmbOW5z6CKEUlTrXWZ+U9lMS8hYwg5Ow5aSOgT/fTdCZmqmdwi1G4akc3SrV2J
         mko+qowNiRkWniCELWz5xmgWqXt5/87ZfFZjoOG0Km/k0u9INBf3NrJBt4Z4EB93FTm5
         Sro6Lq/pVLwmXRWqEpTYM2tFZxv3wHKwYqNBsVWOl/lA9Q9uuSPIubxTWQwyPAsxZFC0
         wW1zN58x+oy2h47VjJ4/YjsAgzT5VMTmCX99zpKboDlWOQybZNQWoRY0EAOkzkXUR63p
         +khw==
X-Forwarded-Encrypted: i=1; AJvYcCVOb9S2n660AoU5awGgYEei/r0YeFV2/Kz6wo2jS8C5WmghoMoeACXZnnAscxIJ06Pb5uJ34hC6DslhK/lS@vger.kernel.org
X-Gm-Message-State: AOJu0YyFPXzy+c+CpkRE+9ysIkJfmOLeW/kAwgHvZq83YpQemTBGlpSb
	iXuMTWDRCpMUY9FKjRDMIQzkWQNb0Su0ac5KS/BB4+YSlT3WhintVwNb4xqaRvk/wbA=
X-Gm-Gg: ASbGncv61EmjfZLQX1hgTpA5bwV+TtlT4N7yD2RYL/HIWZ9OMoV8b+JjXiUCxZQ39RQ
	T4Fo9/Z3UAtwU/zM1/GmbWJTCmO1egusU8ScO35IdHWuL+p51ZV3Pf4Reb+YkW1kFJT7DsAeYvL
	XmD3Eih/1oVbjmNBZ4gBY8dkGlo8uweakSz5NRoJetP2vT9vOUqWEdYqkXriz5KB12a2v5MkPRh
	NYt5nQZCiKbv8e8hVNe2wfHbnmzsjpa1dkt+lXKyvNPYiJ7TxYHos+itrqSTqdbckCrHbrCKm/W
	puQ6r357KQnzsce4JuW2srWB0v9/jxDL7kY6RQxs62ExEcwQKl+tmGBKMpu4bcnGUwJMucDC8x7
	osTsIRaj5Cz64OmPWsxMUJYa3y3+5gfeEsZDu6+PcmDAXRv+VUV4q3OpfKzL4C0dK6jd5QbKuBo
	zvzAt4xoej4+p7MxBpCUknYm7Jd9BplRD8ss+WMKZYCjUwlf65eyKVx7xT1uioZriTl9pT1Q==
X-Google-Smtp-Source: AGHT+IE1afceVs8PBuaZj9exPtYlK0QfXyVjdYDJJxq6s9C8bQx673U2F0e4V3yJkwmn8me+a4KtbA==
X-Received: by 2002:a05:6512:2393:b0:55f:5965:e4e5 with SMTP id 2adb3069b0e04-591d85703bemr10189e87.6.1760621515969;
        Thu, 16 Oct 2025 06:31:55 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f91c0sm7100030e87.41.2025.10.16.06.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:31:55 -0700 (PDT)
Message-ID: <fb491c3a-6786-4daa-b3ee-53756b3d9b44@linaro.org>
Date: Thu, 16 Oct 2025 16:31:54 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: dt-bindings: Add qcom,sm6150-camss
Content-Language: ru-RU
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-1-e7f64ac32370@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251016-sm6150-camss-v1-1-e7f64ac32370@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/25 13:22, Wenmeng Liu wrote:
> Add bindings for qcom,sm6150-camss in order to support the camera
> subsystem found in Qualcomm Talos EVK board.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Looks good, please add my RB to the next version.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

