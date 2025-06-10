Return-Path: <linux-arm-msm+bounces-60871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEA7AD426B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 21:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2B457A5B27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA6C25F7A2;
	Tue, 10 Jun 2025 19:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tkNyE+SH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231F025E80E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 19:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749582168; cv=none; b=cz89RVXkln6s8uxmla6v9qyKa7NvhI2MQn8Azpi6L2FG0a8JdsVRYnaL7SHu0xTqGIDoIfl3po26HehrNoF8AW3CfKvkt22swammAscNS0LulHBzXfsx7G7/doXLe6E5x/lfaVnlKe+JQvXxCSNkXdEYsyF8vOdhTzsnizpT6YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749582168; c=relaxed/simple;
	bh=rVgCB7d7YXT7wIutQuTOIOcSHXIfRaLciYLBxJ/BQ+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rohkWTk9IrnUjUV3Ws95QRVK4yaRvZKYYUlQvHk1my1L+U2n7MKRHzawu1yv7pK9W8e13Xyz2ERTeBmRqDTfKo2wQRAAi7Sa3+zkP5NCbGhzENpPiAt+gKy2Fb02C9ttjNEeDHV3rGQNzdWXCI8ksl1Mss3F6Stw3Ys46hWuQvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tkNyE+SH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so825285e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749582165; x=1750186965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0B62z85gJOzviEKEobgsDAJxP79FoIq671m5PuGPz8=;
        b=tkNyE+SHO/Fhy64hJhu5/hPcHaFrMEYeizRhKYv0ev/fqpw4zW9kVf61EFaX8SZuJ4
         bdiial7zjsftKx5H0ygPk2lVicILHo+DV0lRaeV1kYfIrmO8sTcGXg13AM/yGCLv0DME
         DFLXrWJ2zy8iZjlnqkjk2K7DU0D9uR1fZi+/uArnBhW8FDPo5mHGTJTp6yyrrBgvUgu7
         1v6N1QkM4cVZyz7SJ4KsEVng0lxxfzF48F6HB+xlecVg8Gt8uJk6gDYvtUwyRkR0QHQe
         0RbwhEvLW9siuXaIf/HeoYJQUx3WEPYlLIzokSlc9V1h06I0epzd/bz7o02NRoAjZeBR
         PEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749582165; x=1750186965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0B62z85gJOzviEKEobgsDAJxP79FoIq671m5PuGPz8=;
        b=h3GgHBjRQWRZPlTv4kJ7n8Rkxr43PhN2a5GYrtdOYPs/TNiEWDHg7Hi5mcCdONC24+
         xmq0081Up7EUHXtnuh80av0LixtV9Jw3Ti3JZxZy+3mzH0PRzQ1sSa41ZqHsVF1+CP10
         zZrxSWadxbg61quEg8m12gLlunWAvSYtZ6adTqig6BbIsg8PdtPERChguWraX6z9FkWa
         CptXGayeXKIrxjRNScDA62RMbbvU3anP6qicQgAIoJP4ak5/A9nAfXOyM/FwQDqor05S
         uOrNUX9JZaHB5yK60Ja+MF45PTEgiFPPjLZO/y3172AZsnSLzkkynfJIMrzpZUs5eRKn
         fH2w==
X-Gm-Message-State: AOJu0YzUoXwdHUiYrcmPjT/sQAJTQ2neKcRBQ2W6fp5XlbYu9r4vNX+Q
	ilBNqLczesQluIDa9eye5Cmh3+U7Y1tqCHtCSlWfeATVGLfLaoIukcx3ZYPP73Gjq98=
X-Gm-Gg: ASbGncvzrKcPA/duDEL5CxjJNxEWb9q+9gEsK+FVdvBx+wiwj5i6bT+UR6n1Y+EUn0v
	52lpJ5e646JKUJPkQCHozuMx5/NdPUeYaxxmgM69k7UbS3p1HeOs7L8gA5Of0/di97QMJNxiX14
	PFzG1N0PJH0CE4vFr+D6LKfWWteSoZ1xhwlivlT22ic7SiW6u+6hfn4uyVY2/7ZpNhz8lRz+P2f
	Buebvjc4+tKov9EjFzmGgik7LwQn+Z57Y4Bn0v8k9XJne1gP+QuqcinAd2+p5TzYkby1k6qp9bx
	9IDhPG+q4vX38RlP+s8j/cXRTGrkaXw2QgtltL76IxAwVl3ICVdbrYAfDV0UihMfesqIT7ZQ2mB
	mASxvPwczNDw4XPS3J5c5wyE6UV0=
X-Google-Smtp-Source: AGHT+IFwHj1Ai6p+bfN7fWQ4SsvEeoKINwwWMCKycaDl0KtYSEyjI42LVgjGupK18UiLTuO2p2Q3dg==
X-Received: by 2002:a05:600c:c494:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-4532426d53bmr4645735e9.2.1749582165343;
        Tue, 10 Jun 2025 12:02:45 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce1afasm151989555e9.10.2025.06.10.12.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 12:02:44 -0700 (PDT)
Message-ID: <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
Date: Tue, 10 Jun 2025 20:02:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>
>> List feedback from DT people is isp@ is the correct prefix.
>>
> 
> My bad, but I don't understand this comment, it seems irrelevant...
> 
> The expressed concern is about the novel label name.

I mean to say the feedback from Krzysztof was that we should use isp@ 
not camss@ and I agree.

---
bod

