Return-Path: <linux-arm-msm+bounces-44077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D2A037A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 07:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56FC83A46FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 06:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8651547F2;
	Tue,  7 Jan 2025 06:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v0nLD6E9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095F318641
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 06:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736230090; cv=none; b=LO09k6Bp9kiLzuGHBQbkTRTylfKo5SlHWfwhi/ZuHxU7AcYZYkl2Cr62zlWeLGeMka0RQojmGLgPOm91zh//JqFTSmoMrfGQsyvnHx/Im5R0/89/WtXDks8gphFhGc08pRQnkS6AA9WqhDnXpvE5JeTio8U1OBTvlTHqSBAMNts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736230090; c=relaxed/simple;
	bh=EcKG9WvP9wPLcTZFeI2nMuij8AwUO2jMJrorcqKETh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ftWzwgd2MePf0lciwBpN+URqAzDKcLQ3RG4yMaJ2/u6OIhaSP6OFlYZpqc2zoQ/b3urv7WRHSUsYgD9hEW+a49NvDzVODtyH3YcLfBwh3h9utvM5idYDA4UiBt5WJm5v+/b9QwA5YNw8Dd57nQkofSDgHzAw01hY2/C1D1nhKgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v0nLD6E9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43616c12d72so24026885e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 22:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736230087; x=1736834887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yb0B47kPggnzrOfjZ59CM6EgcdP+n2GDl92NqEA4xvY=;
        b=v0nLD6E9gexfz/h0eIxM4R78HplqoCNi3IydmCTocXWsoRepNxCuUoE7Ud6xSq2GuX
         khG6rSTBEdu5VcHtpD7pNlSDnbRcc/PG51Bs7VCc8SW+lVY2hRBWCwj8jZPYQsjxcvGq
         Ch9uLGHOtCe6F5Ug0+1KdPw+T396ASrKO8/G3r1+Y1UKqoobZFFxMrmKijjLZKVhIL0p
         1HcgnO1n3NvgxZm+RFHjJsMkMjeUq7FzFtdEmP8MPCHu62jbcSEsjdH6hHB+ici8Oltd
         LsDFzrpIPsiJXAAwoCYJJ6BOGWK4c+30W0jsxqu28t0AQD1Q3tuZFhqU6ME9iKhdh5BE
         wdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736230087; x=1736834887;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yb0B47kPggnzrOfjZ59CM6EgcdP+n2GDl92NqEA4xvY=;
        b=olBmpvbVixAoKtU+A0dDMvoWzeCjDagjLoDSAeV/nYFNUVlwRJrm3jgoBIdRyf6pgK
         68vh3juOy1vxSP0NYFhAxi4mNY3BHDBXgd+X51XaLAgmRLzEkOXQLCAa6padFxaOhzk+
         yKr/FQO2BMd1sNSDOGXfBdTpncbUFPbDxcMuoeOSEPIiDeFR93OY/JyjXmZ59NwFQ+8M
         wLSo+UvyxvCWiMZc7EBmhdXGbvrAiLxx5HDnD+CU/7GtwrNHbSKQh7QSahJvPwIfKa4l
         OS1JBslEmVkOCLVKCfOh2Ad1PyxtHYJON8xCS9bCv6BURRK+EqGD3+QpidV+9C+Fh2z9
         tGzg==
X-Gm-Message-State: AOJu0YyVhTBwURuQzod78pUQglCS9vTgTG1u+43ZBs2nWEHUb0y6TSHV
	cm91fK0mqqXr8Jn0YTuea/SZQ4rohzFFVfVXo5W9EToCOxW3tKwc6BX0eiElgUQ=
X-Gm-Gg: ASbGncv5OT/g1eK93t3W14orMrW0e4n+A75ZYV74MG2EOSpubS2Yr19lz9Hr2qgrN9r
	DC4uCdilL14DkHLhnoR5rhTcFA7RFSb7bOHeSQuXPz5HkZ6ZpFZNYOtcu8tgpsf+g8ukY8ZnK0k
	LSnsFfkhLljg+CIgHLs3auPFpAk7taN3Xf0Yx+z0KqeXT6T31qORZ86xg4CHIox8YJaAmCaaB09
	3ABVe5Rsvzn7lV9l4EK4iEsii8Z5STxAJ3hqmVeUKhcxT/g53cCk9+VGfBI7JiEgP1aOMphEBcn
X-Google-Smtp-Source: AGHT+IHflGZ6wpbNOLFCb7xKGfIKtq49c/6aFYql6+evnAZ8chYTm0kIjQZZbtMFKgE47/vzLpzFaA==
X-Received: by 2002:a05:600c:5103:b0:431:4983:e8fe with SMTP id 5b1f17b1804b1-43668b93cb8mr211738975e9.9.1736230087411;
        Mon, 06 Jan 2025 22:08:07 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612008casm589326135e9.14.2025.01.06.22.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 22:08:05 -0800 (PST)
Message-ID: <18f3b5c9-1729-448d-9257-5cb82e675542@linaro.org>
Date: Tue, 7 Jan 2025 07:08:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dsi: Simplify with dev_err_probe()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <20250106-drm-msm-cleanups-v1-2-271ff1c00795@linaro.org>
 <5edcfc62-ee70-48c2-a24a-642a39f83767@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5edcfc62-ee70-48c2-a24a-642a39f83767@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/01/2025 03:56, Abhinav Kumar wrote:
> 
> 
> On 1/6/2025 12:49 AM, Krzysztof Kozlowski wrote:
>> dsi_clk_init() and msm_dsi_host_init() are called only from platform
> 
> dsi_get_config() as well? OR you didnt want to explicitly mention that 
> since its called from msm_dsi_host_init().
> 

As well, but I forgot to mention it.

Best regards,
Krzysztof

