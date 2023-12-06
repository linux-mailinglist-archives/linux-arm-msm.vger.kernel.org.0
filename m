Return-Path: <linux-arm-msm+bounces-3550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA1E806FCA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0D581C20A4B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C43B36AFD;
	Wed,  6 Dec 2023 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXNKmmkA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC426112
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 04:33:25 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ca02def690so44786591fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 04:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701866004; x=1702470804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3zRu4zCL27OConZJ/dXxv4eky6lJ797ekbzBQIQO04=;
        b=IXNKmmkALdUYmNCaLPOkOPzqsmIR7eY3on8YPuaVQt9Wr0q/dtToVesgPg4MUPA+ZJ
         z+U9mfFROvwRFGAxIkSDReE9QHMz4qlVvmMommnBQH1+C276M1WErDuG7IhR4nTLZ+hT
         GFrdf9wvNA9ODHi9inf9verkrEekHGwv2qzVmrE7rvIJp8Ec5QH1ZcaFGq5KZNA+c58V
         qLJ+k/Jt4lUUNQDrBwjpSLMtohQcQmzVjzRwzRjpBMhZwFquFk+B+YD5ua0a20DgJHsM
         h/ck/AQlpHSqyn+avhpilp+LgLnNBK970InRUxwkXzUAPl4DijmCl9UtY+LCsqU6z4AH
         TCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701866004; x=1702470804;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3zRu4zCL27OConZJ/dXxv4eky6lJ797ekbzBQIQO04=;
        b=jPByFWVMbHQtiGLnVklvE/0T6lYxRZPoUgtQ+tkWsNKqpjj/byujaksuBntHkA/FR6
         0Woyyh+2GF0OQXLDkdBIv+Tui/dosOxIDH8NOo1ngqJV+sQqrVnq5VEd+4aOLzJobD//
         Lspxc324y0Xl+KXSvECQaodAr7P6CaWvt2YMiU89m3e7bylardX2awHlDb30T9TJSH2P
         VvY+9DsT9/DeVOhfEJHFivDUq1iilvjvOgl7uC41/g9uxsrePZ4C0U0u52kfpZANFD6A
         s6U/2rKbtLEjtEIGCPYZ+1PVH4Z90PylZw++QjOtaoX5mS7lDm+p0/yLgpffB5bUZPSI
         R/dw==
X-Gm-Message-State: AOJu0Yy12c4jgIOSmDOf0aDC7I+a2fvohhzTcuTdstFt00uUWtSNGgt2
	8+Abfugd8erY660+PYaVrjcoYn75GbXGUN18Q6PfGQ==
X-Google-Smtp-Source: AGHT+IFoYrIWZweW4wNRjzDa/vyq7mAaeL49kvARBEPAN6JpcwCEEcJFFsb4LcNLy+7tTIH6iLUxbg==
X-Received: by 2002:a2e:9b15:0:b0:2c9:fe01:7014 with SMTP id u21-20020a2e9b15000000b002c9fe017014mr515733lji.62.1701866003949;
        Wed, 06 Dec 2023 04:33:23 -0800 (PST)
Received: from [172.30.205.186] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t21-20020a2e8e75000000b002c9f82eb099sm1267851ljk.113.2023.12.06.04.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 04:33:23 -0800 (PST)
Message-ID: <88432969-a4ea-4fa4-a2c6-93d5fc9e8af8@linaro.org>
Date: Wed, 6 Dec 2023 13:33:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: qcom: use defines for interrupts
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231205153317.346109-1-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231205153317.346109-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 12/5/23 16:33, Krzysztof Kozlowski wrote:
> Replace hard-coded interrupt parts (GIC, flags) with standard defines
> for readability.  No changes in resulting DTBs.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Convert few more values to defines (GIC_PPI) - the tedious part which
>     Konrad wanted.
> ---
Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

