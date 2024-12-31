Return-Path: <linux-arm-msm+bounces-43737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E69FEF05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 12:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF01A3A2ACC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 11:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75E819309E;
	Tue, 31 Dec 2024 11:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5tqCrWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95985192D7E
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 11:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735643386; cv=none; b=XhTrX/QzTzoDskdS+dQGMKNVydW8zMXbXM1cvEfPQWm2MZUgj1iYY7lPBekbZv5IIGj+YgQGO+1V3HPtLQR0QtMYtdT4IJnr/+yxqqppxAE8Z7wRXJuHCoIp3SVUzTN/ToRmUde7jCfvtFRmRfPtcCQ9xZp5t/JTNFdj/E4x1TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735643386; c=relaxed/simple;
	bh=CZQrp3ljcPGAGgTKtH6TnT0akhIhaKad5XpyBTsLY9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tOCGaSl7mzwpaUFkhwg55xEGGe7wMWh9GA2EqV/t+oZFMt5FRZd1cYWprgm0RLTww/fWKAUBbFU/MBhPJdrT8PdREy4GySUWXdohoKSxnC+QzXXqHyMSgDusZ/5RkeSXZqqBJmVaI1P4ynUL/9IMTQwKcGLon1jOVVf1l41Mcu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5tqCrWt; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso9647831f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 03:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735643383; x=1736248183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mh8UYWaZc8WrVxKRwykbsoh7O86a7wx9Ng47k23FtHw=;
        b=s5tqCrWtKraouzU9+pCS0X4ejOyWYzCvtoiYHShK8elgI41wEu895sywAI5xnJS1Ma
         +osiZ16wodiyTf8eR67X2dAJjFWQNWtK9v7EaqeARwjBqXP4sBixd09XlF9UCTY+jKyq
         obL/z3PCD7/3dbjzsDHQx2Pj+KGYgISlZ/5XgSb1cdzNIccDyud4zVyIyJ6/q/9Zfrpu
         y8rtuNoTRYGbZdJWmtf6Bj/WVeJe6yJr5JamZGwW25t/qQNSM76BjobqMkG5rj6P3vf/
         xUt7pIgHwoc0hZTrCYM2eDVq/XTWZTv3NGhG7AiNjsw8Sl3aTl2GhK6q4R0AKAfmexfp
         yD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735643383; x=1736248183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh8UYWaZc8WrVxKRwykbsoh7O86a7wx9Ng47k23FtHw=;
        b=JpPRVJICp+QYeKUGM98NYY1R+StJP6TKQ5zc1mlFovv8N2VqW0ocyEgJcsSkTTeFuq
         c4ycWgVAxB5gFSAicVYIt+XRM8N0aPSAvBLJJDUVw4V0/5RZa0fvr8mOG6uRFOFl6p1V
         V+Wt4hfbJ7fexq5GA8609yfmqJnXk3z3phm90WsnSYNSDFDgTBPW64rKT9eJ1H1nNL54
         sg7kLWashDQTaT7PbDDMU0NRM85Gr8pziVDGnzzhmlMH9aO8/7zQKTykqlMH4BvDp5TA
         n+hgV4AgONSh2kZ4U/IbH7liYgx3E6/uL6pmlzSgYjM0TivcBOokzwyib3NZp4HMhLSb
         wk7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWz+8lbas8Un3HAtqpjtLeDhsDAsDCOAahun9CpkrVhfnYHtvAQ/onFVGwUxQE+cJxPxB4VlDkKe4rmPWuj@vger.kernel.org
X-Gm-Message-State: AOJu0YyX3/qHEbhzGN97jnDYpnRo+FSezLWVKLEyTgzosZ5vi83FgGNp
	u0RyZLOANJeyzNXNFZ/Qc9SRok/Cu/CoGj0LCsiXfTYl4w381L1GoFjPC8cMN1g=
X-Gm-Gg: ASbGncthjO4H7dZOl0XKBTv5Xuj7wf3Xb2xdjJeLzzqglmEo44FcLxYmF/midOUxVVe
	fgIJ29/3DRIvb9SPcpymF9qUaK552+vEfdLLUrCjF81V6GF182sXFKbd/0IsGMAV2/++aXSkMdn
	VZAvyniXiEwOf3EkKE8Ss33pHx48iF4FNyjhnnewn92E/MZxZqaBu1xveCZXEcuTcb92TmJzTuF
	HIVXhMThc4rplOdCSrA5mpPYgi7uybCgzkhNI3m167HOqMBBgfcUhv2xHLmVOPK206/iQ==
X-Google-Smtp-Source: AGHT+IFaNhrfsnfvBxSp1tViYSz7o2qMK2dzhldDNDYiuudm1kNGgf7qZsGXiU9LTOK5Js6Pse/c7w==
X-Received: by 2002:a05:6000:1568:b0:385:dc45:ea22 with SMTP id ffacd0b85a97d-38a223f835dmr31212643f8f.39.1735643382887;
        Tue, 31 Dec 2024 03:09:42 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829120sm33379893f8f.6.2024.12.31.03.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 03:09:42 -0800 (PST)
Message-ID: <583ec206-e670-4aa0-9490-4ee6397800e5@linaro.org>
Date: Tue, 31 Dec 2024 11:09:40 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] platform: arm64: add Huawei Matebook E Go (sc8280xp)
 EC driver
To: Pengyu Luo <mitltlatltl@gmail.com>, quic_aiquny@quicinc.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dmitry.baryshkov@linaro.org, gregkh@linuxfoundation.org,
 hdegoede@redhat.com, heikki.krogerus@linux.intel.com,
 ilpo.jarvinen@linux.intel.com, konradybcio@kernel.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, nikita@trvn.ru,
 platform-driver-x86@vger.kernel.org, robh@kernel.org, sre@kernel.org
References: <1dff7a78-1693-45d7-8ee3-357b33848595@quicinc.com>
 <20241231074437.239979-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241231074437.239979-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/12/2024 07:44, Pengyu Luo wrote:
> Please search
> 'device name + acpi table' on the internet, someone dumped it and uploaded
> it, in SSDT, check ECCD. I am not sure if huawei allows users to dump it.
> So I don't provide it here.

There's a repository of ACPI dumps here:

https://github.com/aarch64-laptops/build/tree/master/misc

including the Huawei Matebook E - not sure if that should include the 
"Matebook E Go"

https://github.com/aarch64-laptops/build/tree/master/misc/huawei-matebooke-2019

You could provide it there.

---
bod

