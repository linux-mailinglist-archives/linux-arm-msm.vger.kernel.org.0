Return-Path: <linux-arm-msm+bounces-87898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB977CFDFAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 14:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B62430B8CDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 13:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD1233F8AC;
	Wed,  7 Jan 2026 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfLxdgSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA7533F8A3
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792511; cv=none; b=SBhuqOxwDVgbvu6gl9Np9vShrBfTHcoGX9b9f1rIAm57tyCjwPTO91c98EZkDpFbR/8mufnvtW38P0mikFwKmOyG3HCBMzqHXIoH516RRp8BIrktLHsOaDcFDNXQMgpJhhUhWLULIAImsIt+xUTjcCcVQd+/M6xbMMt/02nv3/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792511; c=relaxed/simple;
	bh=4043nn6qswbC3R1CDYRZmMZVB+UZoK9L+jeskiyq/IQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnPXY8SWKJCztbNzglrVptHt+pVfTdcG4k/GIyVOmQbtP4VyYipolSv/sUUN0yurBjOGRvlTSAYAMfEH7see+LjgDIEx77IZ2vcZ5VWKx+KPU/fb3h59qLidEAM7yZAl2KGFfv+uk3CkCfqxFwWpvafIeWCPuG+QPNmozUg/gkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfLxdgSL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477770019e4so17261365e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 05:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767792508; x=1768397308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8DjhrIBjxiw5uwIMKqO1RXHujHZ57yqKGJRAwZxaGU=;
        b=LfLxdgSLHowF9BD93MXtMEea6vhrKlX9yuQ7UjaPTJY+5BoMYyRcbTvNavC3tf4QFN
         0EGaUHQLNyZRcGcZj8u02jtc2WkJDzpoARR1i4ING/6nVvXjztt6KvNlIhjrBWF6MJYL
         7AEDfWrSDewXpwqyd5nFyE/bJpHWxfnIRJyRyZbSvXwBSfKchcI/Q7ASIqEipcAVeFKx
         tiXKqVcpg6eRdeZug4rTz9SagXaYb8le66NjQBq63iYXCP7MHaLMBAhOAD9BnRXkPtu3
         4FU7GZZ5U03d8QJuOsFQWA+AUWOBnZlsRHr7aXuzKDmz9rR8d4mJLTbGTmeVFp+7CryV
         wUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767792508; x=1768397308;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8DjhrIBjxiw5uwIMKqO1RXHujHZ57yqKGJRAwZxaGU=;
        b=O9nkGFEH4zcC5qFIzWrMo5JaEj6yYGxAE7yN1WYZUkb0AHeKxN3+71A1ORWjyYGH1L
         qBtD0+R32JLKxHILvklv4AGKnBymGtGXM9jIkvR2qJqptHzdwv/XWc7qzJ1fSgu7+p6L
         3KV44xZ9Sl3+2+dH6XAV89gRtMp6LtCHZo7WFKMKeJeXH2TyEGxdEw09qVr58vRqpSTG
         +99KWWco09x3WNrgQ+SAdYEkXY3YG9hLhj4DIIakM2v/eu7A5P2q4pc/yiY3wJ308f1U
         kHXiCN5rhleDpeP1A1MfsU1q9BhPA2ANbusRBvklCjzvdbrYSQ6SE7Ars2AK4Ice0l0R
         sEcg==
X-Forwarded-Encrypted: i=1; AJvYcCXAXB9i9cMJnJv05O/sFYvaUPT2IMBIzjLIdvh4BUanJXfhBqq7Uc9LCTolEJi5TWc8qsLi3hBTrlf8iuuh@vger.kernel.org
X-Gm-Message-State: AOJu0YzCdKjnqMWIgT+zB90Teeu+ZksmXe5F08M3JYvZ+XT3DjAyN7sp
	+WnT6QtcpsFQkUkyIfDq7xpWY56xwoBIBnInmG/LkTPrrCiFvMkKhv1YRcfIbsdm4i0=
X-Gm-Gg: AY/fxX5zagQAnqph7EYxfhuhhjz3XsQxfVUK0gtUzm46oBMcZuQI6z5mC7fbUKcfWBV
	EeQKx+tAY/CzfzvHx05KkANA+2O5BCqNP0waC3k3uAPox1FAY+hc6fZY3BQPw6FXLlz2pR4YyJE
	b8wRck9AiFxlK77x4MYXAHLAZOa0aLGr66ekAB77pVIU0qHT7jv0/AqKNwch2YhF7P+C1xe+Gau
	P5WHXv/eZyksULRRxeVUyBFVjjRyoV7DhiD455bsG/ucBqICZ7rPsy6E3HrxLPHZrlUiAHLsoke
	vifLJ0VjUJlIJEQ4ln3vzdkFHy3jNmGtsc1KFfpfc3MA1Ew6IR4hsAWfdQiU4BmA8JyJTOiKhgB
	rTRI3L+9vIjYi9RQcl71er1WLAos45yasAg/SCVSbEP7m+KJUqLMU+JBTqNjVC9+sc+OaID7chx
	8zlK4l1o6ezAV/selk2h1Rf2WGHsZrIZ6Fog/jyOybu8rRaRdj99zPtXP6v0fo/qU=
X-Google-Smtp-Source: AGHT+IF+Nsaoa5Avs43YfgZgEUZD/BpbPQ3IhAdlo4fic+DilL/m+MXb7BEEQIQBujANzszqHLm1rA==
X-Received: by 2002:a05:600c:3b90:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-47d84b3864cmr32189615e9.27.1767792508026;
        Wed, 07 Jan 2026 05:28:28 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f84besm14380385e9.1.2026.01.07.05.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 05:28:27 -0800 (PST)
Message-ID: <87c2ac96-5c30-40e2-8f89-55b7c3417db8@linaro.org>
Date: Wed, 7 Jan 2026 13:28:26 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2026 09:39, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this overlay reflects the possibility of
> attaching an optional camera sensor.
> For this reason, the camera sensor configuration is
> placed in talos-evk-camera.dtso, rather than
> modifying the base talos-evk.dts.
I'm not sure how many headers there are on this board but could you 
include in the commit log which one of those ports the sensor should be 
attached to.

As I look at the RB5 board for example we have CAM1, CAM2 where as it 
happens CAM2 == imx577 for that mezzanine.

---
bod

