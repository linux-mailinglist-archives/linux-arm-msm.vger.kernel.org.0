Return-Path: <linux-arm-msm+bounces-52944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A5FA776A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 10:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 036EA188A3C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 08:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563ED1A83E4;
	Tue,  1 Apr 2025 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hl70XH19"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7068A1EB197
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 08:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496836; cv=none; b=nU0CdkGCGqkFhwv+/vNBCtso+HncN8/4sGnTaMc9AR+UvU8VwSfCV7zQwgprOOdzAWEe3MB3DLOjrBrILjezXB8AGGQ88OGI3ZxwJSjfZ9Ma9mKu7/T19t6snvFOV2wafRBJWSe+2s1OIahdOIlvCuP27wXAZOa9uDtAA964hNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496836; c=relaxed/simple;
	bh=XN7QInH4oZtUqk5DB14x/7ud6otDLi5WJCgAWF/KC5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6zzqSCmUdExBTj/F4WgOG9y/Wg83qMI+2nVGwpATcf4WcSrX4zutt8+b8llzDH705WYbHk7/T0R0CHHZcGxzJQdxwbmv1ZolSGgBwljIdeo3UCVOpW2lSuv9r8QnH370OP00/fub9WEYBNwIFfEKBCroNcFQexb1ulRp/p9Ruc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hl70XH19; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso796396f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 01:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743496833; x=1744101633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QAK5bGqbHLPZStc3akH3qUwD0OFzOTA3rRJ3Mg3wBUA=;
        b=Hl70XH195giJugC0j9Qx0xVCTs/0bA5+lCaAiQXlOB3rW7MBuGl8ZCeZl4D5saOXUA
         ORekelsa61ABae4ohSM3cu248lAsZvzSExb6UXs3ltS0WJSOxWtMMhxUQIxMeVVbfmJQ
         67VCBh3iYb6EhgBj9YdxYyyzUGDDVVTmPqAKl8cdyxdBzmPrZ1ZnhhpJ4WHxSexg5FrQ
         jzdxNviHzRx14eXd1CxD91WYGuoq+/IElVG9y89uPoSvB5/cH0fULiHfRCrNBmtuxjnn
         /syoHW6tBLWFdyOhD1/oYbkT3UvBjPTdLt/RSdH2LdBPZwlmB96XtZLtdNflXFhttzNC
         onRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496833; x=1744101633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAK5bGqbHLPZStc3akH3qUwD0OFzOTA3rRJ3Mg3wBUA=;
        b=sr91WRmMcYVwcjXR6njx9C5CcAZbb5f549s4Y5cb4rw/rp/3K6Mai5DQd4WqofXo0q
         X4wXufggtlcGIeIQ/uDyJopIv80HL+ar5ruQgec5rA4dtJUqgRzPe7WJSkxQLv6HPads
         +us7pXACT++FyKWhzLFiqAS4XXiG/I7KWe/IsC1uNCG1aXx4aSF2AvzzthpIplJlNHNy
         BCz9sX5HNoJPS3AWb4MM2ZBykuL7nG642Y9sgadODyPY027nmSD7suVbdhwt2en/Y2lY
         vNPd4Y7iEA7onmT2vSyu3azJjVXRMfwdRb7vpTBd366mTXvDw3YYLC5sR+5eyOsd5Dy+
         i+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuu9VTzrKtMhK28nMY4VDhFkTnHEfRuSE0qH5JigMZQEF9U8kp77QVhqMa0O/huiaV01mRYil/BlWtMMiU@vger.kernel.org
X-Gm-Message-State: AOJu0YzBIFfWyWgZnj01bEblH9tbIV9RWZAn5WqnV+l+ctX4xfDklyMN
	UjHcrByyQ6ZFr3x1ebwSlwz6WNAVjd1OCTsXc5DY1tK3Pou75MUrFylxarAWEf+bfaDhERul0Pf
	C1IM=
X-Gm-Gg: ASbGncvC4n0OHoXF+eCYh0q0p9Q4VRaSCaHAbuqSoaxMVJx0O9qv1TPPOyaf3P5JggB
	cYCQjml/Wde0I0bLxNMGNspdgwiDtV7/psuQxuLLpTF/gVMY9345B9RvFes9KN3z4fqku/KwTPC
	FHRaDg1zNONQTHTyId6dKCBmqEDCaxVFyLhu7HRWgWBLiWUzUKafEChpc5rXxIx0hou2JnWLxzB
	bLm1+865jjBr7OlSZ+RCAJLlf4PvPva6FVVk0Ud8Czm1CbmSKnsToFlbVVpTMsPFrLNul3v2UJO
	S/Q5puKiSBIA1geQe7cJOnQXhjRPrp9+hc9CjPeOAOkT70jtJ5RgqJ6YLWU986JIZNoQOTP89m/
	VGxvw5sH6mJ/N0UQepYcT
X-Google-Smtp-Source: AGHT+IGsGLZEWhtkiVdbEty9JUgRguBjdThHJUgiYsWeC0RRt/L2+R/RFctKxKdLxoC212I4HzJVSg==
X-Received: by 2002:a05:6000:4188:b0:39c:12ce:105c with SMTP id ffacd0b85a97d-39c12ce10f0mr5887061f8f.6.1743496832719;
        Tue, 01 Apr 2025 01:40:32 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588dbsm13291530f8f.2.2025.04.01.01.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:40:32 -0700 (PDT)
Message-ID: <2d2e64cf-2bc9-403d-98ed-c9150d1973c4@linaro.org>
Date: Tue, 1 Apr 2025 09:40:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: csiphy-3ph: Make non-Gen2 PHY work
 again
To: Yassine Oudjana <y.oudjana@protonmail.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250401083329.314863-1-y.oudjana@protonmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250401083329.314863-1-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 09:33, Yassine Oudjana wrote:
> Commit fbce0ca24c3a ("media: qcom: camss: csiphy-3ph: Move CSIPHY variables
> to data field inside csiphy struct") moved a version check that was
> previously guarded by a check for Gen2 to csiphy_init without moving the
> Gen2 check along with it. Since it was guarded by the Gen2 check, it was
> only handling versions that were Gen2 and returned -ENODEV for others since
> they shouldn't pass the Gen2 check to begin with.
> 
> Check if the CSIPHY is Gen2 before running this version check and assigning
> Gen2 lane regs array.
> 
> Fixes: fbce0ca24c3a ("media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data field inside csiphy struct")
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index a6cc957b986e..17762aee6dba 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -700,6 +700,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   	csiphy->regs = regs;
>   	regs->offset = 0x800;
>   
> +	if (!csiphy_is_gen2(csiphy->camss->res->version))
> +		return 0;
> +
>   	switch (csiphy->camss->res->version) {
>   	case CAMSS_845:
>   		regs->lane_regs = &lane_regs_sdm845[0];

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

