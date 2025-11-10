Return-Path: <linux-arm-msm+bounces-80993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBE7C4651B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CDC13AED4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B66A309DC0;
	Mon, 10 Nov 2025 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6AIftcw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B79C285C8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774808; cv=none; b=LLM6oTzR0HDNWN65MI+SFcEjjOKzLLmfyDJ+zon5Wwda3gI/NyUEj1xFbXxk34AHgmdQhA3UN7XBS3z/vzBUFgkTlp1WximyhwJpfxh4IuQafYYE5KgRpROljmZi+cL2wLPLi8+EYSgeUhmKhS5eGjbBfGnPupvVdcsluDA0m/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774808; c=relaxed/simple;
	bh=54NkSaWzKBnhmYKVhYAafCeDsl+Vi7l2IbYdsfjy6rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1iRrAEmwQGxN0CHbUyQv/Pe2JTEvRqzNQsJI+udPS4SSp0mfq9p2t/pw95LC3DSWDyLyVzPeh1QwdFVaviNAmxGt/gXC52io4B1B3r3TbUHWjV+1nioLzSedT45xQsbzXJRDX+2MfqtMXYL4/R5G1Gp6YpVUTE5eVfa6YdXMNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6AIftcw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so343461f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762774804; x=1763379604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8LJLkQlhnVDYB5WFdSOlgPUhT3qQ6T/PIi1MnL8a34=;
        b=v6AIftcwQ1ywkxLSX+uPqASz8T39pooRv69YFV1yTl5CvajDJ0hgWiE/hXWtrPTy22
         dwgpp3dRIxV/g4dJALmCl8V+AK92J+Vx0o9IMbrqwfnHycHPFFi3/SmwA2twiZX0pKSH
         mZKQjuMWQSn/KBCGFiKjr6gZhIiTuWmEWd0hl/MLyUdELWmNU+txhYzbFu7ju7PDJp6Q
         tmrrSxvC7/3Jc0Zr3NVCg0dXMouJj5e8lV+nGoaG4Rw4+w/4BloJB+VeqtXPWbkXHMdu
         V1T5h2I4cAXtV49mz0NZ7EHZK2ndRDwxK+kln0/sn9YKmOfN9Ra2feWsDg6l/ruxEuhw
         ANQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774804; x=1763379604;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8LJLkQlhnVDYB5WFdSOlgPUhT3qQ6T/PIi1MnL8a34=;
        b=XJrCmYkkou/oBhjpmBRVdN5bcDk3hRd1gdB2pS40HpoVbgzWE1nEbIVBr7gnax00eF
         4pEf5ec04/aC48dc5dyxIXOwUdw7vyPt0NBZU8NBkFArDjCBG7KCJV32YCVANIeaKeF4
         ayMmcbqz4RSENalk2Zu+bog5xnM31PMC9ypx50CvFj8aZdfs/1+wtZcKMGCZPJoTxBA9
         nXsqtYiD0pCZu3WEXaFsi1YyxPVEEIh6JeMajXueQYR4ObHzdQ2yrK2HFn1mTC3T2pEV
         MbHl0s2xMMqSgr75OepZgImJs6GQUQc+WgW4i2O+XSt8wfIyrGPTjsIueAkk/zQxuO/b
         GuwA==
X-Forwarded-Encrypted: i=1; AJvYcCU4RB1s7rsXuv2XHkHxakFNle77jaVjersTC6hCDdxjFpkmM3Q50Bb5lKMvRm5+J59YgPjh26+lAIKbEzzB@vger.kernel.org
X-Gm-Message-State: AOJu0YxsD+QXGJUTtwxw8LY72J7g8ddFiNKcxKGjp9cl7S1kdpyOgFrY
	60n8uWxyoxE0Mygk/nZmZ9lvLgpGGUz7NNdn/deoL1f5ZYTiXuALMs9b3rTlQbKANck=
X-Gm-Gg: ASbGncs78nJwtaXfGa75H1h4Y3XHyPxTbQGecXUqKvAp5JVPktrYNnP6ibwWHXVJaCj
	VZvWmhw0CS+zDSMpnBeaKRdVi6hMhrnOWjVniJUPxpJTuFn48BF4iH6+PhpzTspJvkG58sCnqy+
	5cA0JEk93DvCK+IRlOkLqfqJEJ06eyQAxNYGW1WuywODOHuZZZml5mz1yvzvRZ8XTDBDne/vIEq
	8gg+ymGiNTDFMhsmAFLvQXw/JjYwcUSHp1XwDTgt3pWSkXs2yPWHdsJq4TQkDzg6cX48XM0Tl/x
	c8NZsa9StMLKEoswpNfRBgzJK9A1/9kAvTFzvGPSRbzZduE5Rif349HJuS1XmB2L0bagl7RUyoq
	U6Ig9rHIwtlLYPDneSdxUF+D/yqdtHYUhP8vY+tObTxQM/+cTcRtzyzb11yMq4ZyZrkQ5saOqVZ
	OBJAGPRr0BwOHIoL29iTX+aXped4m6MtaoJBk2ljn6RFkgccjJEofYnreblsuWlQk=
X-Google-Smtp-Source: AGHT+IHc0y0L/IlFkDJCuI/XoUBdec6Dc+v/BCPlZFQShA4ijfqtxDc6+cizrEb5ne5sPA0PgA8OEQ==
X-Received: by 2002:a05:6000:657:b0:42b:3907:a38b with SMTP id ffacd0b85a97d-42b3907a591mr3013836f8f.44.1762774803631;
        Mon, 10 Nov 2025 03:40:03 -0800 (PST)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm22562080f8f.46.2025.11.10.03.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:40:03 -0800 (PST)
Message-ID: <f48bf868-29df-43bb-b1f5-d27f8ffb9d8e@linaro.org>
Date: Mon, 10 Nov 2025 11:40:02 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/8] media: qcom: camss: csiphy-3ph: Use sdm845 C-PHY
 configuration sequence
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-6-165f7e79b0e1@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251109-qcom-cphy-v1-6-165f7e79b0e1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2025 09:39, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the 3-phase (3PH) lane configuration introduced earlier when
> C-PHY mode is requested on the SDM845 platform. This ensures the proper
> initialization sequence is used for C-PHY operation.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index c2adbde6b4e0d..03f5c4676e89a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1103,8 +1103,14 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   
>   	switch (csiphy->camss->res->version) {
>   	case CAMSS_845:
> -		regs->lane_regs = &lane_regs_sdm845[0];
> -		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> +		if (c->cphy) {
> +			regs->lane_regs = &lane_regs_sdm845_3ph[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845_3ph);
> +
> +		} else {
> +			regs->lane_regs = &lane_regs_sdm845[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
> +		}
>   		break;
>   	case CAMSS_2290:
>   		regs->lane_regs = &lane_regs_qcm2290[0];
> 

Assuming the bool becomes an int derived from the define instead...

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

