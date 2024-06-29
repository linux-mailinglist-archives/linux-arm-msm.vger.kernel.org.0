Return-Path: <linux-arm-msm+bounces-24714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D527C91CC98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 13:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0810D1C21348
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 11:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6267407D;
	Sat, 29 Jun 2024 11:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQvilf/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFAB7316F
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 11:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719662018; cv=none; b=ktOn2NWLo6iDfuC1Q9KU+NbSVk3ss/FSN17gfvZrJ3JeVTwYppVOsmxXjzg0kVUOYCqT2FS3XTUiPIWSlJP0flqFPzuOUll0gdkWaO95Prm0+XPTQflwgtELfBKGlEnW+4GfPTv1qQYMjDgKF65A16Ti3tRgaPj7e636Nw0ze9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719662018; c=relaxed/simple;
	bh=UbW5VL7aSa1hgKnV9lDs4v940Pz0n7ElVXgY/D4jBAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uxjGAbMsX02g+28RGv7OfW/Uzf0E43Jt5eKGeRbj5/Z94ZkZV0ZD/OJx4m0l3z+53MymW/aisEw+CceczN9/D3UL5bUYh7Agguams8jv9BUt9YP/ic8wmQX6k4zv8ZfzWx+Lx36cVkCa52U8kURlRLQDcdz7koqkkqyDtaTxOXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FQvilf/n; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso2260791e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719662015; x=1720266815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ATHMh5/H1vZRHirTenpuAs/sN2H2934t5NqxWY6ds4=;
        b=FQvilf/ndhqn7bnF3Sc+iOzAXgP04tV/fUdxQPG6CwK0ZR4FIZm4pNKEv/H0v/jKoN
         /RcWy1OJ5Eq9A7he2UyiKnM8bzFVtN0dFOR9enooqyUzD2NESxqtBg3NKkl+aNC9lePv
         /D7YNSeW2jfvR+XVfDSZBrn8mzmTcJJ2LM2kRlKWP5j5z12r0uiQoke2KSKvqmKI2bKE
         Ks2BfKVub9f1reUwtl+4ZzL7JXgykl3YuP5UKCQKWEZoewEKDOPWcKUKZ7Qzkx4CTDd3
         sfEMskOiKzuRPfV+J0EffSNiiwhp4XOnyBP+TeqgD3DZ7yLG+tqUYiVKnfZYizQ9s51t
         Z7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719662015; x=1720266815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ATHMh5/H1vZRHirTenpuAs/sN2H2934t5NqxWY6ds4=;
        b=oDvtBvV+3ko0qQTKufp+89Y/tNhpyLkrjjjN8bNSTR+OeDx+71UnOX8FC2tDx0Pq0B
         GaLjvc/KxkwM345+M2IkRwU2jviz515S57MYqNZpejunbfu/riDnCJ4iRvngeBezEfg3
         ih4gSo+I9W3gCZlbSUsH2N4rOoDYXuic17Lp1eFQ1kQAD2dy/fFNxCz+LLQQ0XSd2Gtx
         TXH/zAjf+kL70rysU2yMelJPs4Oq24+NAmg7Yiqa1FWCroVLpDOxy3T+nQjw/2mGY+2g
         9so5tfk8meqJqwPbciZN1/gDCBSwfKV7X+TdxpQV0/6YAsdTV4AVJKEMBp+rD645WQDJ
         Dijw==
X-Gm-Message-State: AOJu0YwetqfhS2UxlWbLubE6Jw/MzG3u2tZgAV3LmZZv+/Fw+aV68Pny
	10zL36Dkh4XJXoppDajPaKPlhMv02Pc3ZuTKWYQkLvt1YoGlQpeqKyOxoRm3kJo=
X-Google-Smtp-Source: AGHT+IHKoL94pLcsMI7QP+3lZDqkLV7sHYZhKQLx78VMLc+Pq1ZBED67zoxq06OAHmRWOXzc9VSZag==
X-Received: by 2002:a05:6512:39ca:b0:52c:cd0b:f0a9 with SMTP id 2adb3069b0e04-52e8274ffc9mr670858e87.58.1719662014897;
        Sat, 29 Jun 2024 04:53:34 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fc412sm4751177f8f.70.2024.06.29.04.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 04:53:34 -0700 (PDT)
Message-ID: <da278419-f8dd-4f8a-a8e9-06ffbbe3fbe7@linaro.org>
Date: Sat, 29 Jun 2024 12:53:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Suresh Vankadara <quic_svankada@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
 <20240629-camss_first_post_linux_next-v1-2-bc798edabc3a@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240629-camss_first_post_linux_next-v1-2-bc798edabc3a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/06/2024 19:32, Vikram Sharma wrote:
> +			reg = <0x0 0x0acaf000 0x0 0x5200>,
> +			      <0x0 0x0acb6000 0x0 0x5200>,
> +			      <0x0 0x0acbd000 0x0 0x5200>,
> +			      <0x0 0x0acc4000 0x0 0x5000>,
> +			      <0x0 0x0accb000 0x0 0x5000>,
> +			      <0x0 0x0ace0000 0x0 0x2000>,
> +			      <0x0 0x0ace2000 0x0 0x2000>,
> +			      <0x0 0x0ace4000 0x0 0x2000>,
> +			      <0x0 0x0ace6000 0x0 0x2000>,
> +			      <0x0 0x0ace8000 0x0 0x2000>;
> +
> +			reg-names = "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite0",
> +				    "vfe_lite1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "csiphy4";

Per my comment in the last patch for this series.

In V2 we should see csid and csid_lite registers defined in the dts and 
yaml, with the offset enabling code being dropped as a result.

---
bod

