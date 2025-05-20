Return-Path: <linux-arm-msm+bounces-58781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 787E8ABE37A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BCCB1612C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7219327A927;
	Tue, 20 May 2025 19:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rjyEKmom"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2B3242D95
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 19:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768440; cv=none; b=V6bVJLsuJ0abKV8FPwInfbZP7w7P4r+3Cj1W/Mj8mLnqhbo2S1hWWg1BMZqD1dq/VqKWt1DjoeR/98CltljWtQGqsAM5bfIgR279I/xCwWz1ouDvMZHmhW8jKRVZh/+RSjMkNP8e9uQxiTFFjVUbKkw/i7bVAbmG0SRMjCkM9/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768440; c=relaxed/simple;
	bh=Gg/5+OCk/JudsRhzmSzNzSjmr7paX/t9QtRcjJ+oG1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFDCi4Q5bojU++2j9rg9x8c+knoJc8wDbUc7EddTCoxmCddTivW6hilPyP4WwSdDabW9q8b2b0/r2HBOWjGPfUSIN6X3vwBBWGsYk0JI9jtSKbv+6YIg9DoUArUIFGcI5okppeJX/exFL/JxbpTabOW8iukhkxbLSzPaJAD+kQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rjyEKmom; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442ea95f738so49609085e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 12:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747768437; x=1748373237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I2ItjY+ppg/pynow7rBGAmh3XSiTvHkJttkVqK8jN38=;
        b=rjyEKmomrbo9OLuE8V3A/iyAW4qPfEdpJpzRZBgxbQgf96I1Q5Ckpcq26xPSMUZ9hi
         KJOB3c5DHS7zMoKbKd2rPmzNg1Grui8zZl86gQJRvz8VGh/pLabYqmHGX9GULd6cy63F
         tmlRNVO8CgFLNKAPPKDemwOf0Dip6i1zDswMSK9fmbTf9Pqg8opklyOtGqcCzERyFl0E
         OGVy9UJib0cF7N9131E2K/0PktyAP6FSv8A1pWLhfOQ00BGOhTLTuxPoAeQo1x2vaC3Y
         7C4dXUKwQcK3rzdXtzk7efdzTwP+4TcETOoF7VnsSXsTiR+/fHsWcAZS98ifUw4gExze
         JOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768437; x=1748373237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I2ItjY+ppg/pynow7rBGAmh3XSiTvHkJttkVqK8jN38=;
        b=VNu4ena2/lage+giITWBpENaJ46ASxhBn3xhOd2zyxWvDb83xOHiHgak1B3IkhaIMn
         1CWk00ljehWgKAjjpv5hiDQDM8lsVo+4fM0lpjvKch4u/VLoA3mUXNypzl390jNASJce
         X7ybwruIIL3NH80VJRpiywBIPuuBRrlZ7ob+bIJ1ZX8a7FSTexr8PkgSi7QsRzNz9j9S
         r/XkfQuITqOzB4HABgeghxSWzbh3gkN7rEoHCYwa4TCyaYd5kUDqH1DXCk/GEuSXa4Gy
         C2fwCv4lp02PtEO3ui+HUj11R+BdTJEtax7S5BR2IV1wYQ86wzS2IeuKqypc7jC9afV2
         t4tg==
X-Forwarded-Encrypted: i=1; AJvYcCU+B1Vh0pp6n4XqFLyc8pjfBmU7YlCnLc8qk5tEBfP/II7duVqiXyww/I12Kt6AarB15M9aActB3nI5hVfb@vger.kernel.org
X-Gm-Message-State: AOJu0YxBraW/hpEKKX6xtLGMr8wTsbc0nEBX0/Qh4EeusNx5egSlurbE
	m3SsqVcESD5wYuWJk2f8qxhQdB4gZcHKsaGMdI1lVSgrvi/HydY6bazJSB0PYJrVoro=
X-Gm-Gg: ASbGncucwKfVVYpSC6PX9hHDslO4Aw1odew3wOGLNLUlSYKfyHQtzodbvc+rRj1fglH
	Qm3DLhsK72kwdaBIVqGc8umXFFE9eUS/87JdnwZsPQUTlq9Yy9oQyKv2qWsVuaiUNrRm/WnGG5T
	1bQ1PWyw3/+SefaC/PQ0Rj/9BbjCfL1AGWdjAjQgxtSv8QHVtHhtiYGwh6IYncFWe/kzrj49AD6
	hyU583v4KTyfJ5fEKGvqPHUP0c7CQRsCrtweFnV8IfGxsWQi2f8p/+MFRRoVqi4dZuu7mMqCoGt
	MnFdQl3EXvHink5LTUjPFu0RK0B8vO1Ld4UE+IpQVARFueGxcNqvRigkIk2fiXGhHIhGSMpvddo
	NmcG5jE1eR1NL9CtdtXhIF/XQhJ8=
X-Google-Smtp-Source: AGHT+IGcrcIy9jaEUMKlVB1MmWkeb0LtHs9wFmRKy8FWnDAUbDIjQBgUB938Lg+/2PJo87PETkuX7g==
X-Received: by 2002:a05:600c:c0d2:20b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-442fda2e7d3mr96042025e9.27.1747768436961;
        Tue, 20 May 2025 12:13:56 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f0554fsm40830215e9.9.2025.05.20.12.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 12:13:56 -0700 (PDT)
Message-ID: <f658468d-1780-4995-b9df-96dc0203e045@linaro.org>
Date: Tue, 20 May 2025 20:13:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: qcom: camss: Add support for MSM8939
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-2-a12cd6006af9@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250520-camss-8x39-vbif-v1-2-a12cd6006af9@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 19:39, Vincent Knecht via B4 Relay wrote:
> +static const struct camss_subdev_resources csiphy_res_8x39[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = {},

Regulators should be declared with the PHY not the CSID.

---
bod

