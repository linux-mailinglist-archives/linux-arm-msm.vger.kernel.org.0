Return-Path: <linux-arm-msm+bounces-59855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE233AC8A04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 10:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C2669E7D82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 08:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA03021B9CE;
	Fri, 30 May 2025 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aYM3JQng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FF92192FD
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594135; cv=none; b=i05ggyAjspUKs4CwmRBKD0vG8T3+ciqib9RC+lO1bTwN+v2XVTcixQGoNjNlHjeRA1aeMcym0Fchsq+cvMO4lnAgAQhuRxNAB05ERsGZja4qxbYRLG1K+c0EvUT3RTuPWUr4qqDYSK5LgmXC6296xnWbnE+zJ/Jg0kW7pTR8mSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594135; c=relaxed/simple;
	bh=h33LQrSnZ+i8qVEFwmpF+DBn7mv4bG9TT0CnxcqbDcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmwFhbB/s+GJ7Z2ykeSc6qOtNzJpX6piV5w08R7i3Ilkq8DBZXydCAsDQJZR75d994Z9ZZeOMd6BfH52kfwUxhRr+QOPYcB2x+nHNfM/XCpcKupdEAt+68qOzCFBk6EUz3M9GEg4X8N4jd6hryaJL5lyYrtwSpwTilJi+9QFetc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aYM3JQng; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf257158fso13176635e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748594131; x=1749198931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YLQbWS2tM1c5F0xZTSwzJwZIihpwvcGvimBEFrvn6y4=;
        b=aYM3JQng0blGw3SmaQI5JmljMBday+4uJAlvvlTqIlSYT851VrQDqpofaGRYsEmrTk
         92HsXvbpqk5Q/t+TvX1rT5lNNxLwnPPmFIp/BHhDqf1Oi44ZGVaJUXTrTpI/FitO+Qmy
         K1PYALKE1wwn6Gk8bxvCOPxDUEp/fsM2AIOd0rPzbpvvGIetIHA0WMIK/DmLkNTZQCkg
         YyPg30fFCD4ZPA+eSDK2BV0ZopWlDhwohe4FhV7av+AZMq391q2U5+y6b/oqoYqA9Et3
         H/42pOp05GjQ4e9CUixM4tIGuRObzCAuXxnPj7qAQHrLnUTzdnEEUoy2j3qSnXsYMDmG
         7YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748594131; x=1749198931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YLQbWS2tM1c5F0xZTSwzJwZIihpwvcGvimBEFrvn6y4=;
        b=tzHQZlb/DBlEI5FbqHChcfX+GbWwAwh7aaeP+3ahQQKVh1kN16lh3XLGI8E3VOEF3k
         d11yukyOP2CzTKm2XrqIO1IFVUuYiJqaNRyrlvgJ8LmIojtjpp2omvGhyzSmfGFSx/zp
         +/x9Qcj2Jt/Hp/3hHpPLIVz49OYDnL3qsOEpAMKUT4CcywnGJpAk7X3tDj4pGTUbLexQ
         vEk1jOzFMUt4ECFz1V5n69aQw+IxvZVSGK+9prVwWBSL9vgVhvuz5sdtiL3YCjKtMOjH
         4YWi8cRRToq+aHcQql7TfuTNKD5/uOz5JpfkQw9b8raPZeNfSwtnB2VJF0iW/T0WLwzl
         xFYg==
X-Forwarded-Encrypted: i=1; AJvYcCWiPZb5XPUyl4V5LDRpgRtgXN+fWGp+7ykGpBVKG6Mf/+vob4lDO6xuktazaoyZaAOC/6p0SWwulZUcWHuu@vger.kernel.org
X-Gm-Message-State: AOJu0YzANs2DGoJGxJyH1lblo9pBBtDC2WOEyhimw7Sqx3nDXN4MTSlY
	Z5Y6lDYrd++MgSiXlGzkJTemt+pdGy9523YaZqaTX1uLoy5HoAZ/37B69cOkVffzwgU=
X-Gm-Gg: ASbGncv8kruBXgyRDZsOvBUOyi4OfUpYCGEOWSGkG3JerKSy2oIbe6FiWAyvw3iCs9X
	1eFtW+P6X2PbvBsnkYolghhLnwqIWeyqwScnrGUOKc5aZmUp5a4vQL5hg0WtEc79nL+oiYc5DWN
	heqRZ9VeWfERuuoz1IQlXpA9QDHPRE9u+H3SYGPRllsOihqZ0qU8SmsHk0c66n4Blg7ae8n0Gnu
	APwPSTJptRj/rkVTKXf3SFWI8R3Mq7tKZBKf5SObO1VyXs3Vt+YK0eACi2smFmBgmhU72mf//ch
	JvZr4oEqPCqcGlMN1fNE/uCZ+x33I1Att7Jgk8fKdRVsPT9fsyUbIsDHisvdDmXAs5qsM9NwECp
	rgJFHGhGsZrIyLYu0
X-Google-Smtp-Source: AGHT+IHehfnKYCHEwgQg2UA1/7tKSJAulXBmZ2VniP+tL7uxdRKGux7eY9b2KcvJXyj56PkW8C6bfA==
X-Received: by 2002:a05:600c:45d0:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-450d882b456mr9757105e9.5.1748594130712;
        Fri, 30 May 2025 01:35:30 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb80e9sm11450035e9.27.2025.05.30.01.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:35:30 -0700 (PDT)
Message-ID: <e8f3386b-de5b-447f-af7d-5f521662ba31@linaro.org>
Date: Fri, 30 May 2025 09:35:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] usb: typec: ucsi_glink: Add UCSI quirk for
 X1E80100 platform
To: fenglin.wu@oss.qualcomm.com, Sebastian Reichel <sre@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 David Collins <david.collins@oss.qualcomm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <grJaz_699sNeLfZ0Kp0u8e13em1Y1VWTlH3dSqSpQE_mHdD7iVKUwHkrvjZ74i3nDzn9c5_Hwg-8IAW40N1iPA==@protonmail.internalid>
 <20250530-qcom_battmgr_update-v2-7-9e377193a656@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250530-qcom_battmgr_update-v2-7-9e377193a656@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/05/2025 08:35, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Currently, the Qualcomm X1E80100 is treated as a fallback of SM8550
> in pmic-glink support. However, the battmgr driver, which uses the
> same pmic-glink compatible strings, has implemented charge control
> functionality differently between SM8550 and X1E80100. As a result,
> X1E80100 is no longer a fallback of SM8550 in pmic-glink support.
> 
> Therefore, add match data for X1E80100 separately in ucsi_glink driver
> but keep the UCSI quirk the same as SM8550.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Small suggestion for your commit log.

Call out _which_ commit makes that change.

---
bod

