Return-Path: <linux-arm-msm+bounces-721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8456A7EC856
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5D921C208D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 16:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E680381BA;
	Wed, 15 Nov 2023 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LFcv9MQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B537428E1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 16:20:19 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D87E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:20:18 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c85a5776a0so12242351fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700065216; x=1700670016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YgZKA0DsdEM8wfBvKevVF7NO4a9xgKqf98z7VA8pCt4=;
        b=LFcv9MQUpSFeuwVXbqhBUtqHoUK4djj/xcRY8TJUDxr8hSdZBR/Aob8PnC6pZiFAWA
         z2aim21gSehuSrhpSytji5nsUvsn72Krh69RpXyv/2+Iv1Wc3CS5xJGAQCOcIct/XLOL
         c1Gwecw6qLV2HufkCsirfq+A6AkTPC+x9nRaWqzG/P6cgAxL7WZjzCiRCfanYV4RGAZU
         1bkZq7IPXa2T3JmlnP1oXD96TXydUGpJIZD97PTkHWn2CFUXhfo43875VTpRHbzHkDE8
         Q5wfNHc0pS0LiW0Faew1svroshISM7sfE2Y2IDXeqb7vgECSCWOqhyJqPdEeRttvZukP
         ihIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065216; x=1700670016;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgZKA0DsdEM8wfBvKevVF7NO4a9xgKqf98z7VA8pCt4=;
        b=sF+p0D5r6rFZW7PauFTzB4ZoX3/f85Iu1H4GYDlyGXF84Jli/6vfz1npKRYiQW0Gvy
         yglCTJk2CnDL9wEqgEMWTlzDl+moBqA3YzWSBeMOEwZpe8fjggCn+9LKp5P1NQVfgYo+
         YFCsXLOvKm2PXFAmdCKnnBCIWs09kY6wfiY45mKzKBTP+HEkAEAxynCoVZpNbr2tJQlc
         qNws0HwybpbgCb9KgwxITuuLLT0hAWqpppO9n5S1HIifE25yxbTcFnj8oxPm+tSVxurv
         qgfoCBRRrLVw1bnrCBBUa+jNY14Ycm75VIHOREuWKZ3qW/YbRdxCfEU9/0W8i//M2jGO
         bPDg==
X-Gm-Message-State: AOJu0Yz1i72y5e+jZ9gzqAR7A+ntlRboYigazPx2vA6VE8fwcR/ISbYD
	wY+R5IbPQlfvDaB6Ku7pZQQxtA==
X-Google-Smtp-Source: AGHT+IHk3uMUNlHK4NV9UcrNsdAssZ6J6dzByPvwjC/T3+TqTzTc7Q32W1dsQXYmHXcCyhCreLbElA==
X-Received: by 2002:a05:651c:10a5:b0:2bb:a28b:58e1 with SMTP id k5-20020a05651c10a500b002bba28b58e1mr4164080ljn.41.1700065216616;
        Wed, 15 Nov 2023 08:20:16 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k8-20020a05651c0a0800b002bce77e4ddfsm1699622ljq.97.2023.11.15.08.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:20:15 -0800 (PST)
Message-ID: <c1e604cf-4388-458a-835d-0674056aec5f@linaro.org>
Date: Wed, 15 Nov 2023 17:20:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845: correct Soundwire node name
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231111095617.16496-1-krzysztof.kozlowski@linaro.org>
 <20231111095617.16496-2-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231111095617.16496-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/11/23 10:56, Krzysztof Kozlowski wrote:
> Soundwire Devicetree bindings expect the Soundwire controller device
> node to be named just "soundwire":
> 
>    sdm845-db845c.dtb: swm@c85: $nodename:0: 'swm@c85' does not match '^soundwire(@.*)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

