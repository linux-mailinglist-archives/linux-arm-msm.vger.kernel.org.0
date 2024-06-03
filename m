Return-Path: <linux-arm-msm+bounces-21526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B0F8FA5E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 00:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DE951F22714
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 22:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F68D13CA9C;
	Mon,  3 Jun 2024 22:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCfF74C1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC7F136994
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717454352; cv=none; b=cIC14HQKLaCsUObuOpxcX5StRGQjF7KiAwvi2iitTSmANr0tgHRjIFfe1kXovNNh2PIGbjK8EnRmowo8IsDAiQMnNZjRepLuYo4XcK4cXtowNQgIq2rnFqfpjoKjCqbb1atbwOgrkfjnNmwQhfPDhHm6vypZAtvw4N0pccHYHUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717454352; c=relaxed/simple;
	bh=S7vVY+UmRDi+pV5H4sot6+8c83hLwtXako5ifIMtJmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzHjMnkO1nv7Dv9nsJQTZ3Fshdd9OCkWEpl9RFCfWukkLeXt8SDuuw5eWZm+SRzbTeaPunj2YEDQtMBzy0oYUVDX/NqApawvg/mrSJPzBV4xPosHbfMWIzAR7gqEvgU/ONm50NaYLVTkrxhZtwIU+I+CjVBtIbt8YHZnKN4uNb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jCfF74C1; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57a20ccafc6so4248342a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 15:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717454349; x=1718059149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0z7Aez1r6Kap3gX9stwvKDhhS8GNo1pWPDSc1k7y3dg=;
        b=jCfF74C1QNnZ/9R8PAEY50CYGNTOw3af9USbxYyrddguCKJfIsi+9j61JpaBEo9Skq
         SNpbtzYPVgzxdvhZvLKRNf2krCy5gc934XJwTTKZ6T0bEcM65lnjjwaNIZ/TS3PRwPrq
         5QvjOpziJQQx+SQiAKMqYAGquZCtcS02S8TSLdtr6NkJckk0/SZevZRqr3st+0VduxGI
         rzrhg39URfqHwEx3jb+bOO/CyAHLPdje8ehU0pyCCZAntatVgErRuZ/lp+xac4jGbnhD
         74aulU4vx+xfB/T54HUJi60miwfOisWZL0uuOdZ1ETpirmuj8IlUPwPAb9+BRZ0G/H9b
         ZFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717454349; x=1718059149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0z7Aez1r6Kap3gX9stwvKDhhS8GNo1pWPDSc1k7y3dg=;
        b=mZXuvTfYlbBVaDy1SnCR04kQOxXh671dPYKK/FxHvd/Fgpfstn2Qlc7j44saSm7k/j
         18m619Pva6YOzLIveKwECUa3R2ljGdnLcLX+aFeIuV0AjbvRgbDAzJfv+HMVAFWFh7On
         IEBy+C2wHcfxFdf4c6yckX/D4nLzh5WmjaOPn/x8r6EfTnZZBBWkSXiX74jLVr/klB/J
         u4zS4PcpC+cO464YhUBGaSKSFz/9C3k6P2WRiZP3o8WOU4NuM6kymh2uICnMr1npzaea
         FBektz1+sExft7nHTkUM2y7MevexQ7ELwJN0+opJxA3TadduFsqT5hAHm0FvCuvkryUm
         N6Ew==
X-Gm-Message-State: AOJu0YylfknzGFmknYstlgoZn4ALNl0ksFZD/SEt9c/0Dp4OXF00LHPE
	aSwGiVSolDkPjI+vK8cizxcypihgiv8qf3wrJYE86P8ADI3bho9i8AMz3/7Zfyg=
X-Google-Smtp-Source: AGHT+IHVf/Fn1G3AKRm8TQjzZya6z11Pw5O0AsnZQ8ZtNgbuy8Z7NHyvjzcx/QWbek2XZTEmcGVxKQ==
X-Received: by 2002:a50:f686:0:b0:578:657c:df3b with SMTP id 4fb4d7f45d1cf-57a363b3609mr6618186a12.25.1717454349143;
        Mon, 03 Jun 2024 15:39:09 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:fd07:77c4:c6d7:eec? ([2a00:f41:909a:a11e:fd07:77c4:c6d7:eec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a7e6a8e14sm317517a12.87.2024.06.03.15.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 15:39:08 -0700 (PDT)
Message-ID: <4a97279b-16e6-4356-b554-2c3f1c3de256@linaro.org>
Date: Tue, 4 Jun 2024 00:39:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Disable the SMB2360 4th
 instance by default
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240602-x1e80100-dts-pmics-drop-4th-smb2360-from-crd-v1-1-0adf4dd87a9b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240602-x1e80100-dts-pmics-drop-4th-smb2360-from-crd-v1-1-0adf4dd87a9b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/2/24 16:56, Abel Vesa wrote:
> The CRD board doesn't have the 4th SMB2360 PMIC populated while the QCP
> does. So enabled it on QCP only.
> 
> Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

