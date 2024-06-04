Return-Path: <linux-arm-msm+bounces-21594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D11178FB200
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D161B22B84
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76B9145FE8;
	Tue,  4 Jun 2024 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTlQw2b7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16065145B32
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 12:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717503526; cv=none; b=VvYcwKm+V6zCTfFb1ZQpzB/bsEZmaqy+OV/DEATimr738wW5cqAIXvEhoybF/x7jOoHNW+VNz4MxMeYgjx3aG8xCZerCp5GQJfiSDVubZ2t6DY7rtgl5uMoMemeWt4aCr00ZkCi3ft2vh1ZcmJ18nFlah28PyQaZ3TEuk9NeXqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717503526; c=relaxed/simple;
	bh=bMG7RvBmDOkqx6HToRknYbCvXlHhwizfl3ox1z2+VLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5x/fHKm7u3dWfK+L1dx0om+dF82hRPd+PxChry+U8SyuErehtmBsbscLCnCrwENYDIWaExmjeiP21Su7J3+Z0jU22alsyjvLJo6nnIVUrCFPYU3Qrc1fmIjzHJz2+ao/M8ixVaKOP6WfR1/XzbZzr9x4IAZkU2dLiIF9cqF/zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTlQw2b7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a68fc86acfaso354311766b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 05:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717503522; x=1718108322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/f5gcn/gTUAWBZ3gaiWLhvClesIPejw9W8fPNXojgY=;
        b=jTlQw2b7HMNpIRmKXor4JevFfV6l2cGI8ZKYHt5FOJUY4bKmimzZSXuiUck29vXDUz
         hJo+v8jYIrKRVc7CN3qbbYZRxTzAWo4XFUuRtM4DWua0fL1ooF2EDWk8pt+opjfA2EpZ
         LOEE5YhtjquluLwSI7zHCvXoqGfMI2lwxLIpFW+lJEmjJBgU49uuzeaoA/D7iJi/njkw
         WBtsnPc2TWvpMO5+VCmDCiUHeGYIC8PMjthHwdhKghQXOQOfhuKEn5nfWP+u9zscmvRy
         zttvrMjPDv5Jw8wxVr4SEQALypeHfX0+9gEpyi9AatzlfQT54kkoSxAvEJoSguebSQqE
         GwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717503522; x=1718108322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/f5gcn/gTUAWBZ3gaiWLhvClesIPejw9W8fPNXojgY=;
        b=rzoulEI8mCZPL6mxLMV0IZ/nXUTTcij3gqulZnIq3IFwpPimcvHI/D+16MJF0eFt/s
         Dbo/d6G+b30WNW4jQ6smxI/gVTqfhp7m5vWT+PIBQxP3J9WS6d7PcaoSXGL3iDGUO/8c
         1o/6X1BZB+FatB1AzYs95jhT7+x0UeZDhdlpb19Ov4tecAm08TvOifOwzjEsETfGokYr
         vwYNZ2dEC6h5rmzVFP+1rpZiQuk9nyl5TMa5ZrnNHpoD2+bFNZfdSxCDoy2lRJ4C9Qfr
         9Euc2yu2E/SiKmzhfXThyS52IEZQKBB4TPa9LHXtr9PNRMEYXWpbzRHD30xOUAw4Jgll
         WCag==
X-Forwarded-Encrypted: i=1; AJvYcCXuwm24CBADTXyMmNOMiuYepdGyhZXNq9ipqB/AQMLhNdyo5ybbQnFMsn6oIstER+kKfv2QvOE2OiasQxJJUW7dFO0UHRmIjKkh5ID9TA==
X-Gm-Message-State: AOJu0YyUXafVmuSJvySxHff++95tcOf71L0ISk0XWnT1sapnOVAO9tnB
	Hpl23rNOQJW8GsOmqa3kBsJOuSpXcDnqJoe793NmsOktsCr4Z6SKBfT3vs2n6yY=
X-Google-Smtp-Source: AGHT+IEXNoxMtI7ICaXqzcQdFet4MgSRtFpxYFqM2yeMMrmzQXZ9URAcl0bri5e4o/dqtHxHzUPSdw==
X-Received: by 2002:a17:907:20ec:b0:a5a:5b1a:e2e4 with SMTP id a640c23a62f3a-a69543d9983mr189395966b.20.1717503522358;
        Tue, 04 Jun 2024 05:18:42 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:a035:2af2:8d85:1f72? ([2a00:f41:909a:a11e:a035:2af2:8d85:1f72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68a2fc6efesm511558066b.161.2024.06.04.05.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 05:18:42 -0700 (PDT)
Message-ID: <0d0b48c2-c8de-417b-8180-4eb2aa24c9f7@linaro.org>
Date: Tue, 4 Jun 2024 14:18:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom: Add initial support for HTC One (M8)
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240603-m8-support-v1-0-c7b6a1941ed2@me.ssier.org>
 <20240603-m8-support-v1-2-c7b6a1941ed2@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240603-m8-support-v1-2-c7b6a1941ed2@me.ssier.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/3/24 08:28, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add initial device tree for the HTC One (M8) smartphone.
> 
> Initial support includes:
>   - eMMC
>   - Power button
>   - USB
>   - Vibrator
>   - Volume buttons (GPIO)
>   - Wi-Fi
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

