Return-Path: <linux-arm-msm+bounces-29636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF49960B96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 15:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 704241C228F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 13:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67381BC9EA;
	Tue, 27 Aug 2024 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLm/3AN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAEF19CCE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724764591; cv=none; b=uFnU+o7sAaR+Hx3SY8zdRUHhLZsf6qgtbHlNFZh/Cth1ZKsN02KV/tfhv/Zgp/o1WqYVS+FHYGZeZLMcufUBzYy3+DpYKDBbc0zacVVUMFyR6IJx2ltMq6GZof68aYfTgXNqMW+gBnb7NCL6jrk2w7MTv7Q/JqmZoEItd0xnkGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724764591; c=relaxed/simple;
	bh=zSDs4BUV3METdXmko0hl60ogxseD+zNrseh74ORAvDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cT07uQtOvWh2fmWmCnLvBQq2tlkf8jmqyroRZAhYEmxjastXSUD26ntkNjCLYUGz3ssQ1kA9POH+AShdGNVUChDueKclVPDt+9+aWzaw7aRtVBYGp8bx8GvcoFxiA/GxScHkgbfQbP9H9qWjHoBlyoOdoq8J93B0Nkc5QD3i7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLm/3AN6; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5bec4e00978so5250449a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724764588; x=1725369388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GrhMuYl4d9v0h/UP5/GJa9EJkPhfXO+uMjBnq3JFZdI=;
        b=eLm/3AN69Jm7eIp6BT7VIJGvq9JewO7/2i5AtUByUlCzR4/dlanauEgn5vgc1xCBhS
         GNs5E2bOWHE2Ys4XvahjpbdFEb1uQapcqiWYcnDHeFaRI/NuSB3XbBN4kj/OTBmrIYiy
         Ffomrz5FypB2WDKR378dYXD+/r8+FQhRHVWWqa+dWm47IAqQD4JK4/Eq3VOke+2xPFyE
         zUhyiILR+IKt51PClTjTYsktm5faNHgO/pMRpNH02b74M/OesGnI4DVmB/nLM2vVk0Bn
         gnZRWKVwnbFChNi1CY5bMTHkYJ2WXJinpNF/MAEeiRH/WviB8Mf83xqefhJYZ8HXRkkI
         o/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724764588; x=1725369388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GrhMuYl4d9v0h/UP5/GJa9EJkPhfXO+uMjBnq3JFZdI=;
        b=mMqSUpKN49DmQ5FZENW99IgEZ8TDaQFuC9WqMtqP8aHf8bvaANuTM3pGaHeReGCXRQ
         lYz1pQKymdkLhAvrgjnJy05mbF0545+wqGCPI8knoFFWkpot4MKu0vvAwAd+FKClrBc8
         q5Jc9bX0MLGBSFVX/4KUH+WdgcVY89tllHrA119YPhNsVrGh6Z69g3LF3ufYVHo/8xlC
         GX5lcTxfvpimUV26lRhS4a8uywREhEb2MF2dnfvSrUyQikGAwgsYtMWN5fk4wSyWFcBl
         W/fktOKqcWAcGXnb+pgwpaU43U+a7FI30m0pJ23F1k+trPwuJFR3/bJdJoZjfxigviGE
         GR1w==
X-Gm-Message-State: AOJu0YyxSrVqdqdAs/MbltHsNFdygy7qnrx0Qchli3iFPrdxpPGRM1l6
	HWlZwC/J+NcEEHC2uarwDxBb7Vyg1xzEzIQWL1jx3suBklqg8zX2nK6qYXeURP8=
X-Google-Smtp-Source: AGHT+IFnrrYt1pcEShR0jArLWyB07KU328muSxhdaWUNjW24ILMrZgVMlT+ASlmP8Ql2d4/j2jfvkg==
X-Received: by 2002:a05:6402:42c7:b0:5b8:5851:66cd with SMTP id 4fb4d7f45d1cf-5c089159d17mr8851171a12.2.1724764588304;
        Tue, 27 Aug 2024 06:16:28 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb1c2b8fsm1004146a12.1.2024.08.27.06.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 06:16:27 -0700 (PDT)
Message-ID: <63844f8e-4564-4528-b81c-27e973fb36c8@linaro.org>
Date: Tue, 27 Aug 2024 14:16:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2024 15:41, Depeng Shao wrote:
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
> +	 * Notify the event of trigger RUP.
> +	 */
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
> +					enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
> +	 * Notify the event of trigger RUP clear.
> +	 */
> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}

I think I tend to agree with Vlad here, that this is a needless layer of 
wrappering.

I'm not sure that's exactly what you guys where talking about but, I 
rebased my x1e80100 stuff on top of your stuff

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-08-15-x1e80100-camss-debufsoff-cleanup?ref_type=heads

and anyway the above wrapper didn't make alot of sense to me.

---
bod

