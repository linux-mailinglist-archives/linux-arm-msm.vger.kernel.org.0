Return-Path: <linux-arm-msm+bounces-85034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9FBCB58ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 11:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93670301791A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C418B305045;
	Thu, 11 Dec 2025 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sYm21SbQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47843064A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765450170; cv=none; b=jhUgjcnx2BrwTffdzT+jXhkxqwmOlBjsW3sV4JWn+Pp9de+sEJNVEDGYMnEhG0OncD4uHeb6YZ838Qan1WbFOjWJAkoqLJaZdrKWSoKRVMhbQJyNiVMRxKuVpkkLTkfHKZVcpDBRdM5o12VwkIFXzblrxDYhHBhVTw8LlqHnczk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765450170; c=relaxed/simple;
	bh=Jc6+Ys+XHen8v80U0lVjY12DVN2DFWCFxOekVIhcmJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qblJHTZfhXNYs+uzW1USZaqGv2aoDWnKTS9jvBJhGAt4hzvpDL3843ktJv2e+PAaoq8pCwfZ+iFrTqJ4P3wPKYTcyqM1/9SYgmWf3KySkjRfsV8kLDSV0Hd4rgWnvAT9KKr6OYBrJQQQ2x4HGdJft7Vv3s6EIF6lEKrU3q9zDfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sYm21SbQ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5986cd85d83so101450e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 02:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765450167; x=1766054967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3kd4yW1gc1Gruxageeys0GxddFeeTYgSHK0aHKOuEo=;
        b=sYm21SbQbAN5LV3ce1hSwNUoL8mqlhBYICP9v2goIi7tRgqGd9Hi79PO7cx0K/1wam
         +QmvNY1T5fsUyJciThnsLTVZFIRg994f5NKLjCtpYfXnlPguBvmBJmH3Xhcg9x4cc+dJ
         WOIsupzaKPzoi+QlJTdvzyNBLzHJqba7jmFFnD7QQQkgFl0sLK20aitBV/41XirzpQ4d
         Eugp7SRpFOFwo90DOSqL3WR9IvwrtXLU89AFv8rjw2lu6oxTHRs236ubE3HS4P9+GEzk
         L6Ipr2KyTi95jb3DimP7NlUY4b+oBWKaRIOVam11qFUzvwmYHwDt0UGgOKVhv+Qt8zDc
         iYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450167; x=1766054967;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3kd4yW1gc1Gruxageeys0GxddFeeTYgSHK0aHKOuEo=;
        b=WzW4+i8mk37UoPpxucgUxKCwNdM4Lxca/62yCwUNTE+r6bIgf1Cas6B9BLraQMUSn5
         e3px55DGsDoPcn68hkLQm4DgliZin0hLBe93mz9bP/7bKW1KsIOn/Dzm/Fj/FJq1Jxtm
         ZZBG190obsxx57nrZ9JR8IaROEInrcFj7myBZ6JHAhriC7HAzNqIohL0iUPRUXQXl78/
         MdiVUY07Uga3L0zBTjjLZdoRlpZ/E7vkfflYFNJQB7ksIcxAvBWpKpr92/zxnGL2KX1J
         deZ15+cbP7bKd+MgJdF+P+EclB5MuvAAfOaWVp/WV95LXGmsYaxcO+YyVrZ+ezy/6kRf
         ydiw==
X-Forwarded-Encrypted: i=1; AJvYcCWU4c2SU8LgSpa9+r+IvbGijtMFljodMQYS6oCV9I0j6k2m5HDWQ2YBXCxh7b5Ijq//fMQH8BpotQQYeCod@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFIeHNsy8COWfc2060+uQXO6LEikiuRb6lChCaG3Uq6ae5ekC
	Y+NTpq1wv3kmqEayPQ8QNca0OSrf90iWC4zmQuAKJ8sWVnBOc8oy9v8K30mDFxHI2gw=
X-Gm-Gg: AY/fxX6L3VGIFtSzHj7RJ0If7lS0MmI0QD5gyH/YKWT1vpq0mbqUAXvQ9SdhLD7VIPQ
	hwMppDKhpSzuUuNY/ovt6p82By5zcePldLfh6w6avHugbgYwym/r/ArWpAoyDYxMib5/emEi/dI
	jJmaQESPpS2ij30ZgR+2zf8yRiWR0MJ2rGbFtbwa58kTSyhD5eJ0Obt0cll6zXzbI1e/iY1c20R
	ZwuuMYOSffV/Vze4umetNrDEgli9j+RuNqdAyXjBa9sE8uvBMOY+ZAogbPW+koT840jdYeMalMA
	q7zVjP4sUl/gpruugkfRC1zkzmk2/M2j1Sm8K6zL+VD3Wgr9X5gXPhDdLxzQ4WjgnDHilIP2iBb
	itbIGgIN0OBG9Q5+JiVGKM/5cxn2M95BU4XKEOEW8FiYTV9tXwRbUM6h3MsP+WMPVHkr8f/z3fC
	yn6pkdcaoixMZDablZ4YNZO237xr0xI9xcJGVzcqUhCThETHNv8AbGKtJHgxGJiJtbwA==
X-Google-Smtp-Source: AGHT+IFt6XeeZKHv7sJfFbXi7ZwTZ/XAVBJkSAg3r7xDq8QS7bdQubNXrv3Qvi50WCHnpPFPH5YD9g==
X-Received: by 2002:a05:6512:2399:b0:597:d7a1:aa9c with SMTP id 2adb3069b0e04-598ee52a41bmr1124042e87.3.1765450166708;
        Thu, 11 Dec 2025 02:49:26 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f44d6bsm764789e87.37.2025.12.11.02.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 02:49:26 -0800 (PST)
Message-ID: <809c23e7-954a-4d7e-92e1-0d2da820bdd9@linaro.org>
Date: Thu, 11 Dec 2025 12:49:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-6-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251211014846.16602-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/25 03:48, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

