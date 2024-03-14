Return-Path: <linux-arm-msm+bounces-14151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C539187BFC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 16:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80CD628430A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 15:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B25271B2E;
	Thu, 14 Mar 2024 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R6WyTRQN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B4D71B24
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 15:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429669; cv=none; b=r6y1hRfgGHO2pYzJTfCKx72RLtqWvaE94Ogmf6bL7wgTwoATAF3LoEFES9cLgZtZD8CJDKOhjqDsugNOleHqM78FjriukN7X8tbbp4fyc3SUyM2q6MRWqxJ7aRkUlctfCAzoBDrFE3RB758giih+cqAgtDku3gmebpyFdY/U9bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429669; c=relaxed/simple;
	bh=3qp7EuCcJDWyl1w/w7HV9vaEXS3vL6DRzyPc9uiwcLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxHF7hcpihPGLAHSMBY1lcaVFrJYELU42AzMS039uuiddCyRLNK4SPLEchE1XHI5OQ3XdtCEzm7zFxjAyeRF5p6TNKz7VtYB03ItYEpIs06K+llkjKV3Y5/zf0U9A+DSux9iNTkTLLuIqchG8AS6vxOJb1NPHSjnrWtrnnq3cRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R6WyTRQN; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513a6416058so1691483e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 08:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710429666; x=1711034466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MjFOZJPYX73CnefUijbrY3nQsy7VaH6e8bUva2U60pU=;
        b=R6WyTRQN/gf7DHLfkkOo2QTlypBOhWr/9u8tJwiRwWTaGw5ZCxiLy2DcEWN28g29YX
         MWsIIjU9sDNvpgow7/SwMMClukpR/aVz4P48QIJO9DaK2I+wgP+EoEJndZuFQ/a4LWwz
         No8KUESh124lLkfQroSP2xZ3Q1PqamewbNF9s3WsIoQcJC8V/beLvAre0oegjzTu5rc9
         fLdUcv/0NOKBOAvlesapXQ9OmnVz9pPdD5PoPzCF+9QDKHIPN2Naux3kKm6/WB/wLXT0
         ne3Sha7WiJKDnB4AgKOwPYeusZXRNTFFOwMta8bYTE/C/Mw/kupAWimnloPXc6lnmkVZ
         /Ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429666; x=1711034466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjFOZJPYX73CnefUijbrY3nQsy7VaH6e8bUva2U60pU=;
        b=IAwEq/G3kt5RXpoAwN0JrfS+yeAaBxJAuiqQQC8vCN4HEfc5nzclCxvLkl4lCPfFiC
         J2q6t3ctgaZNhaUUGxjXYIVnveUScRGQrXPWGHlVKe/qT96Kw3kN6HRdkf9m98txOGQY
         OkV9TaXiSY1jNjHtt2PsyAwTNPPwU91MXn1yQHltyv595WFAZ0BTJc5hKXYXtkjBpcZc
         6B9ST3rIsRtL3Xw+3Uhgxpfg1kEG9B9D4N9KKtxuVRmrt+KeJ2BDwhOOhOPeGdqHOdgk
         /xJODLnnOSzjtP3cHXXend7JWp+Xarkfm94gVNkwWGcEvqpI9qGxri3Fl58sw70maYJc
         sRxw==
X-Gm-Message-State: AOJu0YxsNXMHQ5+6VSZLK0sFqPndlR+o0ObGXuaJWUSQqWtKHOwN1Wph
	aNCkQHfMgMkRment8tokmN6LUe0H7xwoT/k3CpLVZWOPNQtgdG1fm1h3LIjvmdL5G1A/SEm1S6l
	1pdk=
X-Google-Smtp-Source: AGHT+IE+KRwa0r5iZnvK4QfGOtpfWMCapXc8pPsdA3M7QuLbkyznnOBo3u7JpQbNe4pl0eTVpQ0H1w==
X-Received: by 2002:a05:6512:3d88:b0:513:a833:cda2 with SMTP id k8-20020a0565123d8800b00513a833cda2mr1518615lfv.53.1710429665784;
        Thu, 14 Mar 2024 08:21:05 -0700 (PDT)
Received: from [172.30.204.13] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f14-20020a05651232ce00b005139c3c584bsm307693lfg.241.2024.03.14.08.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 08:21:05 -0700 (PDT)
Message-ID: <7ddccc5b-80a4-40b1-8fa7-b2365722fb53@linaro.org>
Date: Thu, 14 Mar 2024 16:21:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: Add interconnects to UFS
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240313-sm8350-ufs-icc-v1-1-73fa2da99779@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240313-sm8350-ufs-icc-v1-1-73fa2da99779@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 02:32, Dmitry Baryshkov wrote:
> To ensure that UFS doesn't get disconnected from NoC, add interconnect properties
> to the UFS controller.
> 
> Fixes: 59c7cf814783 ("arm64: dts: qcom: sm8350: Add UFS nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

