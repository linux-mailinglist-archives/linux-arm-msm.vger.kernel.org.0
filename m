Return-Path: <linux-arm-msm+bounces-21590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE398FB1B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07EA5281155
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9AC145B0A;
	Tue,  4 Jun 2024 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dueXGwna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2364413C8FE
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717502480; cv=none; b=dltjmd9RzULHdKrY2D/puDrMC2muNAd5JW5eM8KcgTNZhOxtrawjmLfh7JDhEsYfGdkRpkpNztChim9gNDpqE9EML6/9ESi95c68dSALA/SKBgyt94ReS6MhgniumESbpS8ai2gAxgz9j4qxHL48WZkvI5skoDEVdzLzZb2IZnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717502480; c=relaxed/simple;
	bh=aqnSFG+sYc0/RHxsrKrsG7o29UpbZ3oTecXD37lxYT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oS84uEiPOvi26n7aJ3N4PY3CYpdQoEbOt5dunEv0eRx9FVV1scQp/KHCJY09GN47uZkfKmFKszVt3JEGSOl5xttMzKmRMSpTi/0laTb8ncf1YiYXE6hNKadaGvijTgpeHFxVd+ErLhgc9g4kEmYjx+XezPLHUnooB+XokjnWs94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dueXGwna; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a68f10171bdso286192266b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 05:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717502477; x=1718107277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3/Vuq7S2WG8oNel0jOUvOm+4hHdWaPfXg39TcdwYqA=;
        b=dueXGwna6qBV2UCgTKhhlwpXMjEn7Kx4IAGv/h6Wa+6DXaV1wTfmMhbrU2U+HBqe61
         mQLvGLh4PGVG+OaqSGGYdA2c2MTQD7aprsXh+hJqPzHPz2nMC5id8Ay/LNX+gxi+W9x3
         8AfXDE/IuHcq5X2HNq5rbAviu+qy2GMgv8+k9EUGbSzSN0odYl18NH8hIv0LOjTelThf
         wny8w2Whq5QFnkqPn+oL8hrb0zXaZ8HCed/r7YwFKb1gKPOHgkEdSspOzuk8B2SbHo+9
         y44o/E7Fm72iOvaE5N9CzTPXdzggC6Bx/1X623VuwgE2vTySKTROYfbMIvjhZOLYGrr1
         MrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717502477; x=1718107277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3/Vuq7S2WG8oNel0jOUvOm+4hHdWaPfXg39TcdwYqA=;
        b=t/rN09QV8+yhDcrtEi9ALzn/j4dVn5y4ZLLbwgobYlR/izxv/3EIULTOs+5IJut+wM
         ospcfSU38duNtP81f8cY6xYPbGfgLOigeJ28GfHJWd3Iey44lainpaepcySKTYjqNc4C
         2Y6Umkg4grsoEAV5L8uHeo1LNZPlLSVdRG3P3ey+wy02G+WnbQpKm32Grtt2M5P13qWW
         7PYQcPGRxvzMwY5PAJF0aHx2NAfFy6wgPO4mNWfp1PE7CEkFGqUWknVJviCXAiIQHd0a
         dKxCLdG8hdfKvH7OBs4wAKg87mUDHh4/2uUfQynsG1sXGv6yIIjX9lKcRlkbqVLUFCVH
         R4pw==
X-Gm-Message-State: AOJu0Yxp0gzNzgfQsPqBC6GbwD9KZsNEAlui79IUJmNnO5L8bcuUAnQr
	QQpRAgHlQsu1UXcO6nfHiEkeJveUKYI0hNguq8MQJljtFDE7+pBve+IzTOoCf7o=
X-Google-Smtp-Source: AGHT+IGzxD9Hi80rZQQwWRuOwlSpf9vOWUJP2t47hbgEFwS+tvPJIcBrnUEo5052eKF7zfgJR3kWAg==
X-Received: by 2002:a17:906:2f05:b0:a63:3e99:6565 with SMTP id a640c23a62f3a-a682022f671mr922154266b.23.1717502477281;
        Tue, 04 Jun 2024 05:01:17 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:a035:2af2:8d85:1f72? ([2a00:f41:909a:a11e:a035:2af2:8d85:1f72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68fbebec36sm338287166b.162.2024.06.04.05.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 05:01:16 -0700 (PDT)
Message-ID: <4c1d77e3-3fe7-4ee6-8872-3924a1b2ef9f@linaro.org>
Date: Tue, 4 Jun 2024 14:01:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Disable the SMB2360 4th
 instance by default
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240603-x1e80100-dts-pmics-drop-4th-smb2360-from-crd-v2-1-fb63973cc07d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240603-x1e80100-dts-pmics-drop-4th-smb2360-from-crd-v2-1-fb63973cc07d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/3/24 10:17, Abel Vesa wrote:
> The CRD board doesn't have the 4th SMB2360 PMIC populated while the QCP
> does. So enable it on QCP only. This fixes the warning for the missing
> PMIC on CRD as well.
> 
> Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Fetched all R-b and T-b tags

Almost..

gotta do it twice to make sure it's posted

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

