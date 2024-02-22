Return-Path: <linux-arm-msm+bounces-12192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2178A85FB0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 15:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 971ACB275A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 14:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C388F1482F8;
	Thu, 22 Feb 2024 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WKO7ZBf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9763814601D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708611632; cv=none; b=icO2BzCw8og69wDWCq1zC0vCcGX/v10QA4SupQ6Ts6vQQ/5kuNM3JQCMzupVbX0vQx26zpJ0x8af79uLvGJRETlbkNK8YEpbcMr/XlOtmdtJ5hTgzExhBg4LHFHdwicqZk5n9mHkPVZX5ay4I57sDMKpKCR4MoqtnGtWyIPAsZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708611632; c=relaxed/simple;
	bh=vMwXfTOsGAPaIiJbWe6+PEuvWPhyLMyGXx4mMKKmFfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eoAdSW1n0trt5X6Exnx0QK1kdv7gkmIhdukNI8UPeLxuoKSiNKJvqxu04T/0OUDd/WjqxltXwQGyOXBuxp+mHveLVL7mXEXOD9wYm89iWuRQwS82d9atRExNhgTRaiwOBYf8p+laJHYmaVeubzCStasjjf3FoGxBlG70omN5doU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WKO7ZBf6; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d26227d508so7126451fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 06:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708611629; x=1709216429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3O05M00MskrvO0vNAJks7yOCsnkVAKf6Wo+gM6c65zg=;
        b=WKO7ZBf6vgGLiQX9BJfrXeNHBhOBX71pH5ZyNZb4HSjRGFqSnCVUppth9tXYEW4N9G
         D9xIHNQJqpFdoHVVkDYSIkVBY/W8IxwsCAcHLGahbt68g1ZlSPjbdGzMUT8KcExu29Ho
         UNYox9el3Nm+jNRh+lqBfHUx1viRYkfk8cvy/nrrJQWNrRk/tsxv7pg0f8GL0v2GdQiW
         q2/hkkn0ItoV1LD44FH0aYPzYeTgSAB1Se1wznKJR3T8nYuoLnP0Y0m8ib5OshwTOBXC
         XmKXabvkknZB91I1oFjBp8REuRlXX9fSRNdCcu8pYLP4JWNzEfsjFZlxRq63/jb9k7Oi
         EXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708611629; x=1709216429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3O05M00MskrvO0vNAJks7yOCsnkVAKf6Wo+gM6c65zg=;
        b=jgN14LEF4QxtYwToQN7JZBaA5g2Z8eU8WrA9eG5ysvFVe8/dSs0YRz9dV4ARYp805t
         x8BjlqYsCFQxmPRYn5VC1bkMV41sPhlP4OcjpXem085Z9/w0m36B2qB0iWIAi2St/UOM
         oQYSElhzOtEmePEQfDyXhV/meg3KRK86+fM6M7wCdUv6wVR6mN6lHcec4XCoFbpEWT7s
         qm1pD3Bgg/sIlrmg3dzuZBvWD+vfnDzg1tT1V3N5KRrgGuCZqp0dzEK95w3IL0en8LY8
         uwxPoo82JLSrXt3QUjgell2bseFzS1nZhUWfl7osPKp2ZlnetxPPOHz6LyDa7+dpM/Gn
         vGVw==
X-Gm-Message-State: AOJu0Yy3rdGmABShijzlmXNIFoDe/v0qqgBn1mi3lEPI+FzzXEErgXDD
	dsoxf87nHpjAbbDEFQZkcM84gjNxcIuU7K2maPREPVyWvMpXi9vVdHf+VVHjtBo=
X-Google-Smtp-Source: AGHT+IEj4iJ0zZhJ/VDoBh+V5uhh51gCaP86FTZKZ/4HGf9uGEs7VdypZjt3BjFtNmBKCljLENHBkg==
X-Received: by 2002:a05:651c:210:b0:2d2:42ff:483c with SMTP id y16-20020a05651c021000b002d242ff483cmr6499497ljn.33.1708611628623;
        Thu, 22 Feb 2024 06:20:28 -0800 (PST)
Received: from [87.246.222.14] (netpanel-87-246-222-14.pol.akademiki.lublin.pl. [87.246.222.14])
        by smtp.gmail.com with ESMTPSA id a10-20020a2e860a000000b002d11746a310sm2334173lji.13.2024.02.22.06.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 06:20:28 -0800 (PST)
Message-ID: <7a24048c-467d-484d-ad92-438275135e97@linaro.org>
Date: Thu, 22 Feb 2024 15:20:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: x1e80100: Add dedicated pmic
 dtsi
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240222-x1e80100-dts-smb2360-v3-0-85a691d4f68a@linaro.org>
 <20240222-x1e80100-dts-smb2360-v3-2-85a691d4f68a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240222-x1e80100-dts-smb2360-v3-2-85a691d4f68a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/22/24 15:19, Abel Vesa wrote:
> Add dedicated file for x1e80100 PMICs, add the all 3 smb2360 PMIC nodes
> with the eUSB2 repeater nodes.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 51 ++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> new file mode 100644
> index 000000000000..04301f772fbd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Linaro Limited
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +};

This seems redundant

But otherwise lgtm

Konrad

