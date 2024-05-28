Return-Path: <linux-arm-msm+bounces-20741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C39BA8D1B15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3654B1F25F9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 12:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A1116D9DC;
	Tue, 28 May 2024 12:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qsj6x/zP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A7416D9AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716899025; cv=none; b=gIEaxicJZxeStj+svZhP5ocGqDN5vUKSmiSs7Xlq+D6WB1Mm+KXKPggTYv3kP4b4LASGy3Vxh96pvZ4kKIYvXg1/lzTPqkvXH3s+aeH+3EclIMTSDsyK3QK8hb3HUh6VdUaCjvYZTfihx5sWfqAbWGp32U/AA2AC0jSCNliGwhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716899025; c=relaxed/simple;
	bh=Oo1VVCN2iEcCIq5omFSHUtr3GmVK7LdxTr9vvNWVUh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GrQDb7qbgiJvp3Fx3AqK3nIOCWX0Z6ikseirochxCZljskMrSA3us0RZfsRDqgeGYpkev2ma/lNzjXIMwhSBY1nOdP45EnYS9XrYTx/aMX1py6Swh5e6GT3JJqkUFbfoPFmXBnFliuXlxA73D8MAmYfH6o23tJ4IYNNbKrACH20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qsj6x/zP; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-529597d77b4so931970e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 05:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716899022; x=1717503822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZ442P+0Or7Cam9asGbhPN4ke6dVv33PDSrllNSNeqk=;
        b=Qsj6x/zPx7b2lEKWq5aQ+81OTIDgntQzKdGKicSBJ6Rjaiwk/6ZK/0IhftTfZl93pp
         UjiY2XGmfjtkqN+IM7HkChnY6foNuE/9w4HKnaju6CJQnJZ5F9bG69dz2DIurPfDmZma
         rUkc6MpLcuT4c+0s9Av5Pq/h+vQiuDL2YskVvq0paPiER75Fk4x3U4vYMFnch5h1AnxK
         r0/zYctt5o27vL+fwzHgk+eVMg7ZvuhFRppFCqvlr7b5WvOrwlJ8tuj7QNOrI4PlaWZK
         cTAAtM/Lo25AoNIFIUuZg3gxI8vyq5dkEiFXS84POlE8DHop2nLyU+FLp9gDhiDPftaf
         WI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716899022; x=1717503822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ442P+0Or7Cam9asGbhPN4ke6dVv33PDSrllNSNeqk=;
        b=csbemnzAqjkDwVGgTV6bVKF0WVQfx1lcFxLwfaIDKAYcW/FdUjXC3tBUDaVjoUb/26
         jLWmDuFklb4lt2uQi8OR12Rr00t00MsU6XlCMIPrbulhX00CIM53/jCqowZXOK+qoCaR
         L1udDc2loKLtD87OrWR22NB55VMwmBHJLceose6bHasrmvkrmjioIVqeUxqXk7VHIiLz
         Lipo/Gt5cv/Mwd5gbb2QZtTlg79MCqEkEraMkLf3fIbwhuLb1WFy1IIcI6sJBoHgg8bP
         obO8yOIV8xLV1bbf+HldJIMmOIDzc34EkV9Chhy9ZOxFbQdLj0ZXEDAlgFrhxUvSGTln
         Xv1w==
X-Gm-Message-State: AOJu0YyEYJijMiFGtg8fyuUMTrm4tu1zEZF5taJa0fsTOrULYVuJB7o1
	ykmZIwJAuI0+R3n7LK+NRFzwjRJ2ALDWW3Srf/rJxGsY4zk5FLALuubULMPv+RM=
X-Google-Smtp-Source: AGHT+IEMiL8/rxeov6f0rfbAIQ1+IJo4FyBFPKOFDMPbev0fJ32U+UVbC+sisGredaGC0FdKXRDYCA==
X-Received: by 2002:a05:6512:3d26:b0:529:b609:fa0c with SMTP id 2adb3069b0e04-529b609fa64mr2671414e87.67.1716899020625;
        Tue, 28 May 2024 05:23:40 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c97:23a9:35bc:df2e:d894:2c76? ([2a00:f41:c97:23a9:35bc:df2e:d894:2c76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296ee4a645sm947955e87.68.2024.05.28.05.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:23:40 -0700 (PDT)
Message-ID: <699a2b74-a06b-4f44-9756-b7d5aead88af@linaro.org>
Date: Tue, 28 May 2024 14:23:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: x1e80100: Add ports nodes to USB1
 SS[0-2] PHYs and controllers
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
 <20240527-x1e80100-dts-pmic-glink-v1-1-7ea5c8eb4d2b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240527-x1e80100-dts-pmic-glink-v1-1-7ea5c8eb4d2b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/27/24 10:07, Abel Vesa wrote:
> All PHYs, being QMP combo type, implement both USB and DP. Add the port
> nodes for high-speed, super-speed and DP to all 3 PHYs belonging to
> USB1. Also add the counterpart nodes for the DWC3 controllers.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

You can substitute this with

https://lore.kernel.org/linux-arm-msm/20240512-typec-fix-sm8250-v4-8-ad153c747a97@linaro.org/

Konrad

