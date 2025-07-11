Return-Path: <linux-arm-msm+bounces-64637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5A2B0241D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 20:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D216A466DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 18:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242CD1D8E07;
	Fri, 11 Jul 2025 18:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOWiCejV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F6B42A9D;
	Fri, 11 Jul 2025 18:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752259863; cv=none; b=loZa4dvIJJiCNbOR7LgDSmI3HF1VP37n6wTmIl9YsX3XERrQPLy8M7YMUHl8klHXEcFdTjePV3fI5BBprKlsPo5R7KCxVdSz/8MK2GQjzT5AMWsOL0PCARQKeSowiXS7cPUJ9KQ7Eo0EYikZ5VUIe2zIQ3fH1FYKKEZyxw/piKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752259863; c=relaxed/simple;
	bh=W9lBABHVu1ZqV5tgAeODhf823CeWjZ+bm3tKrupqntc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=byiYVriwHM0iNOJNP/SWzNMmm0c+nOEK0kyneMdyM6jvdBmLC4B+pqSK8aqqRR1AVAgH6BGQqukSwvHkpCztDf1d4fFJF3ll760jXhr41joCLS/u9txuHfXuj1TyRepksaVBkyn1aHq4VhaXrC6ykHY4HdB5bQEBagv9MjSb5DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOWiCejV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae6f8d3bcd4so296612266b.1;
        Fri, 11 Jul 2025 11:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752259859; x=1752864659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZQHanT8tZIknmdWw3icjNoNbayNbgeABsx8BPJoAwU=;
        b=iOWiCejVgCscR5D2VNIXLNlTn2A9X4E+qTaLilJhQ0skPk8ErEVRw6mPIueRTdHHng
         rkFxbC+ig9KnonW2OGrUHXmKibLWKTnuLzSZ/AhmOz3XLDllPsgKU/XQcjhP0UsKmOFr
         /+0Nubv1Y/9f/zREy3PF+YVc0GHQGBLN/NxFHeHICvdDcBAqRv1fXCUDm2a5oynmCz7e
         EHv3Tj3j3Owg+l8aiyMpN2Sn2L51WzGP9EdURQF0b3d1dBif/HCkLOwF5k6vUUo0EzhZ
         3XnMPdA7r2+oqBRYNYG4l2yU2bf+4cyKgm/sUKl6Lwkrylna9CIkt9IbhMcHFPFHeXHG
         5cOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752259859; x=1752864659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZQHanT8tZIknmdWw3icjNoNbayNbgeABsx8BPJoAwU=;
        b=Eo5CqGHlCpDycbBn8hlZXQwTH/n4imbArbJP7+TkkiKse6jy0I/jH1ramD+v0vhsO5
         8d8f2nglR4TkdZHwbFRKtlMZoOz9Ar0tqofiGaoXZ9Iu8CVu3mTcMCyBcDXexshDcEP7
         YwWrvGhB1oxTLpT9rO2Hl++igZPRbsfkk1QQv2qMMeN0pYPcZxgZQ12KC99ZzGc66iJg
         Se2Rjd2btVXN/3svbGfGVor+8L6UYru/KNBtDABsWLXXTCLbzonzdPH07Oj3vt6KpZcH
         ni2O6hkRUrYQ4YLQf5vXeNbKuDHQF4c7rvrvEyE2aQR4EMMj/zsmLYJP/l3ITLXem/vW
         E2gw==
X-Forwarded-Encrypted: i=1; AJvYcCX3/ISQDtZCFtQDmWEIClHc1yELjJrfZu3Xepob5NTzI554Z+m3E/cvCLRBP0GFAP87iGGSCtKJLYDx@vger.kernel.org, AJvYcCXYhr/+3mcCVM63OAWXwevy5HlCmIZHZLw+TGo5t0tmW26u52cnVI6JvH4VVrHPcL8j77f7llycHSZIuHsz4g==@vger.kernel.org, AJvYcCXbjY9Zqlm9mzulhHt/zwWmZ23ES/HX5xXebH9CxVHnVojkfRX5msROJGwvRg/sCxJ0ij8lPSssju4sI1o7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3b76yIxClA4cZmEKr7jDv0Wi2f5RmAL6WSZOozDSLMKwurlT+
	wyz9LM2ctXvGbkFBiMhBZxnhoZViW1BpB3XrVcuXEdS7qAU3aEf6K6Jy
X-Gm-Gg: ASbGnctHoAHSsaXBVRN3tdgE4H4YRiH7hyFrdkkXdk22zIHpiTKhLntxdNvApef/HQa
	WxxUOMbZnlILAp4vJzsKTaMrnFV8mUYa9qFZiDP3qyJSBe1SJEEqYLAssJ5D0QeUaMpNmWeoS+r
	4BVyoOxvuklnRFN+8pIO9r9lyOuvuElZn/tybJqdKV1ZzR9rX4KXvKYXXRB8yucm1L3d7QwZYfx
	4fcmaKUISmfJ8cHOxlVkcGeMS1J7YDkMZjNwCAiirUWiQEGg4awrvauadX5r2CoOGqTOLqF0OLC
	hswprGqr9el7ohClkyhnCQpbqk7AjlwLf5zVe1cf71kKdTH/Usc1LoJePRtDEoenGpWgXJ6gCrr
	j8B50+iVfh8GuAELolbQjEhz5qzPuwRu9kAE0ySE=
X-Google-Smtp-Source: AGHT+IH+vujR6naTWSXF9WmG4xCAWzeyYNtLeQFYRnwqOcARMgZVrqiQ65jzWDB7+1qCip8+TNucXg==
X-Received: by 2002:a17:907:3e91:b0:ad2:2fe3:7074 with SMTP id a640c23a62f3a-ae7010feeeemr414117366b.14.1752259859329;
        Fri, 11 Jul 2025 11:50:59 -0700 (PDT)
Received: from [192.168.1.140] ([86.127.44.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8264636sm333703666b.86.2025.07.11.11.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 11:50:59 -0700 (PDT)
Message-ID: <88d46d36-bbc2-4f61-8f9c-8fb0ece32ed9@gmail.com>
Date: Fri, 11 Jul 2025 21:50:57 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add Dell Inspiron 7441 / Latitude 7455
 (X1E-80-100)
To: Val Packett <val@packett.cool>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250706205723.9790-2-val@packett.cool>
Content-Language: en-US
From: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>
In-Reply-To: <20250706205723.9790-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Val,

On 7/6/25 23:50, Val Packett wrote:
> The unified series for Dell Thena laptops.
> 
> Changes since v2[1]:
> 
> - Fixed From/Co-developed-by on the big patch
> - Fixed one remaining "inspirIon"
> - Fixed codec/cpu alphabetical order in audio nodes (copy-paste..)
> - Made the common dtsi an 'x1-' one in preparation for x1p models
> 
> [1]: https://lore.kernel.org/all/20250701231643.568854-1-val@packett.cool/
> 
> Bryan O'Donoghue (2):
>    dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
>    arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455
> 
> Val Packett (3):
>    dt-bindings: arm: qcom: Add Dell Latitude 7455
>    firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude
>      7455
>    drm/panel-edp: Add BOE NE14QDM panel for Dell Latitude 7455
> 
>   .../devicetree/bindings/arm/qcom.yaml         |    2 +
>   arch/arm64/boot/dts/qcom/Makefile             |    4 +
>   arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   | 1657 +++++++++++++++++
>   .../x1e80100-dell-inspiron-14-plus-7441.dts   |   52 +
>   .../dts/qcom/x1e80100-dell-latitude-7455.dts  |   53 +
>   drivers/firmware/qcom/qcom_scm.c              |    2 +
>   drivers/gpu/drm/panel/panel-edp.c             |    1 +
>   7 files changed, 1771 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts
> 

Thanks much for the effort!
For the series:

Reviewed-by: Laurentiu Tudor <laurentiu.tudor1@dell.com>

