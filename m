Return-Path: <linux-arm-msm+bounces-42518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 555D89F4972
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22AF2188D0B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321E31E32C3;
	Tue, 17 Dec 2024 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XuW87E2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7397B1D934D
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734433278; cv=none; b=pGt91c27F7qZt0GdfPV7VTu8BfSOgIWSfUfsfTF+IOAOzh3vjbuNfVWQlbE80AJlWPSRa72hx/qMQ3dVwuqsRjYLi+kBO5tB0DqEENdc+uXt5i3KXyFBJhvMgd57Yubm2oM/rotd4RIpwWYecHfWtYnua78UrCtlT6SA1LHfbZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734433278; c=relaxed/simple;
	bh=dzPlS4ShwjaasN3bD3BbmPZQWpeBj1znPpLJMJF6C4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uiMHffJPqrIm0q4rl+z/ntpNgTxekqzRRlkGWV3k7D03brA3hbo7RZaqBEMk10u3RNGYELLu3Jd0Mwu7j7BR7qbqqyv+TDEMA5kgkvGh2SoZz8khJienNfnoGI43hja/TLRvm1Mm1HRcNb7U6opSfk3Eg2dHVkrfWUKZ6Z9+AaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XuW87E2X; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so2696384f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 03:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734433275; x=1735038075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w03D1ux3okaczBtpEnBHqfwxiSrA7LCvMwRhSIk4Nrk=;
        b=XuW87E2XezKEUY+WFNprN5/dC7F2X4qj2ZhuGUDT4kBUVGkz98BDHSLPUkvvIomqzR
         WK/Xwy+baAnfPIeauIiJA0JpAeK2c9ujS2he3oDf/NzqPUzMk3r88iDEEXJUpufoqolL
         JXnaSPjUayHRvoqvu8AmW9e5TiBstW49riZyNwlkXbxxGnyg2682croqnndSYBsBsTVa
         5Cuh+B2m5bWmN2r0nausRanGAbQKfOS+Hr58u6quho0WoVyZ874AQNejY1j3O6pu4FCt
         dSeU6d3HLjck4HWc7HG3xDBHPkA1IZ83fSMnKgd7Iq5Ih9MDAQl6J7MHri7eYKEsfwWY
         YhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433275; x=1735038075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w03D1ux3okaczBtpEnBHqfwxiSrA7LCvMwRhSIk4Nrk=;
        b=Yj39Hy9H+lnKwpk+WnKd29MwMcbQwn9SnJi43JeYCzqxUsIki3kLIlAbpy0VSorkIl
         YsfyFPbzt+QlJ+xYJSP8taCF2OByLDaXKjyrUrnk8wbLp2JkD4oa/SftT8vUgDLUfBtA
         Lb1EIFexdCEWpSEwombO780j7kM3uWLH1Wck6tJezoGVANXB85jnOeQupAZwQfRRgE0E
         lmLNMsGcYyzdlks7kS5X/ZLAHal1TZVeKRsCoYQdSWYrmJJWeyFsAoa2aELkp25LSjw1
         C5ne6HRvLI1AXfFCpp4yyMRjkQNL5FyLHSE1tahmeXTImdOOJlhYEmCfN/irLgyrFhio
         Qzvg==
X-Forwarded-Encrypted: i=1; AJvYcCX87vZIww4BjLvQ4JjcZjWAck6TZIMhbeoXpZnc5CEScerm8rKLIR38MVg7F9nQQbeFK1GgS309BLA9ID+l@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtHTt59aXCj+UoJLqWbctqhVqJuDATLemW0FfpaXXYsccfrwC
	b/Yz+uFKgc/5LbDZCYwV2XFhO7dwEUbbvbWar2CWW5Q18pJjCp4Lu9/kgGlwHtYbYpbFil8NirT
	S
X-Gm-Gg: ASbGnct+8wtIS93QFq0MYwZPc+pOZUFrS6QPwwVc1oK7QV50dSsR4Vp0GzeAQr2Gc7b
	lDVqX7Gvjryi36ru25x3L0awh35W3opsI0+xOZ9YYvzL9+/A70Mpb66BGXEBQvn0j8p3ZCdzYg4
	XWa1llsMLd3ifqNSkmlFbh+dbHD1q2g9a61cTfmcBHAaQ5CfSzckHGTxWEi0DBOtB9IVjTwMIB/
	xboMxDElQTphzp72ZydN3WkG1njCD4FwaAtiqnsUqTnSox1uUtQbf12uQLqCcMDr0ibWw==
X-Google-Smtp-Source: AGHT+IHN8F/bOTxwVgEj+Ryru3sGmbFULrRGiG+LPfJhyOB7pJk2kTCEvnFKgGCazxS5j/XYxa6EKA==
X-Received: by 2002:a5d:5f88:0:b0:385:f821:e97e with SMTP id ffacd0b85a97d-38880af11e2mr15512297f8f.9.1734433274696;
        Tue, 17 Dec 2024 03:01:14 -0800 (PST)
Received: from [192.168.0.27] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80605d9sm10774311f8f.95.2024.12.17.03.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 03:01:14 -0800 (PST)
Message-ID: <236d41cf-ddc7-46e9-91b2-190c165461b2@linaro.org>
Date: Tue, 17 Dec 2024 11:01:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: qcs615: add venus node
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
 <20241217-add-venus-for-qcs615-v5-3-747395d9e630@quicinc.com>
 <83fcb683-d610-4e47-bcce-128453a0afef@linaro.org>
 <3cb0d715-3756-4cef-bcc0-3bb550811c73@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3cb0d715-3756-4cef-bcc0-3bb550811c73@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/12/2024 09:54, Renjiang Han wrote:
> 
>   I think when your change review passes, we only need to remove the
> 
>   video-decoder and video-encoder nodes in the device tree.

Yes but the _point_ is we shouldn't be adding in driver configuration to 
dts.

Which means I don't think your patch can be applied until we resolve in 
impasse in venus.

---
bod

