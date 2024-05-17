Return-Path: <linux-arm-msm+bounces-19971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3331A8C8300
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 11:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDD691F21CE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 09:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171CD25778;
	Fri, 17 May 2024 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="fCQKzEXp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828A723770
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2024 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715936926; cv=none; b=a0XpRN5eJVkQbHAzXWb9Io3UbCAsSX5JKEuYTvhKqo3WcF//3m3g74rTPqq27awAIcacgzoXkp2YVZzO67TgEax1Zd8gygncNDOi2t0S4f5DMc8V4AOSz6ehuUWVNLbSg23YSKuhA6/p0Qi4UoPIwdmwxKomvjWGtlt8Btl2PsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715936926; c=relaxed/simple;
	bh=TEHtCpgbdlqVzF1zXyzG1Szb517FKtFzCdajAHVAtmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJu+yIduO4L70oIXYJ092GCyiepq2wmRJIw6qwDQ6TOTGgJsbh2IqLWyjM/ClHosKfp0ipTxCAfjyvGoq/TAsBsis49tpdulRBrEEolxzrs7TMwkr/1Tlh5FVHhuqM/+xqxW8rbbUr3aamW7vZ+4D+Ff4Mh3Yv1SuzD00joR4c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=fCQKzEXp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-571ba432477so5013775a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2024 02:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1715936922; x=1716541722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xwh3lnhUhd7oHBvNUUgJZI2n83eK0ml7NC11m5y4KDs=;
        b=fCQKzEXpavPM+TuuR2ydaqtoyHospQaCnY360d1397CsR/nVbCTa1Qy0Q6YgjGqt/L
         tkD71mYnNkf4JPg+za0s+krI91AaiQcmsYTm4eo+hR1+6FJ+qk/r5PdHGmxxoOu+1SCX
         F9V6iL22RWAp6X/30O+cd43S0eAmvVGbO5AUngW1ROKKRaBdzP0CjmFdyCyKzmBiHMny
         XTxVCY32sQO2rL7jTXyskzCSalfN9RyM42mpoT51TCTfzB3+een6ul3CRmKuVeFabpZG
         jAaJH9a6IS9HafT9TBmAZe1RcPATh6djiTWWBCIZnVzt7R7M4BGByqqfEZGdWKs9ZCyh
         SsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715936922; x=1716541722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xwh3lnhUhd7oHBvNUUgJZI2n83eK0ml7NC11m5y4KDs=;
        b=K+SflpIn7D7YkHFFL2pfafcsAuGqN6dYBKXuMEOD1Cd8qZNv4OH/fV8paChC1MyDiO
         gpzzkfzzFhXWbHZKzGO495zAic4ZZZdqiNajQOtW+5gA2l5zd7/AfBBjx86dWrCYprA+
         QHGLzcMxmv44AwYjPQgmIhNwUpBL6y0RwFE+GfsoC+teJENE3rwu0JooBFalfQlaxbyU
         MZU8hiyv8oZ5/tBNbDoKz7RZWXXlYDtle1rTazdq+77vpUi0gS5CTwK3c0Y/7uOFDY8x
         6+g/2gh2LHZWJpihp3fNAy95jsUqToHh2Ilrk3h+hzTVcj9f31Losm9ZQFtMUKNOkHPv
         3Nsg==
X-Forwarded-Encrypted: i=1; AJvYcCWF9z2ycaLkewQI8e04OU2DVodgy5ZYFW9F0mP3Be4Hn87jnOcclc+uVOThtCoeutSjvoFaxb84kLPrYLYHwgl2vJn8XC1rD/Gu631ujw==
X-Gm-Message-State: AOJu0Yw6neSnrNacVtdulqR1VDBEbGAjXyb83GWiizxxp8wrxNsjVk5u
	05aSQ7SGpcok+3S+kMxpYUUA3TPINZLpxIrv5RJoo+/d2DNkVXh70b1mo6lrbZc=
X-Google-Smtp-Source: AGHT+IEgG+ysyN5p95zBEB/teN7eTbSrbUtVmUotuv5u7b9gbXK+Nvx5y+aX5ItM1vbciitmK35z4g==
X-Received: by 2002:a17:906:4886:b0:a59:a83b:d435 with SMTP id a640c23a62f3a-a5a2d55aa50mr1373772366b.18.1715936921554;
        Fri, 17 May 2024 02:08:41 -0700 (PDT)
Received: from [10.91.1.133] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17886sm1097162266b.210.2024.05.17.02.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 02:08:40 -0700 (PDT)
Message-ID: <40730e9f-ae2b-4b56-89bd-f839876271fe@nexus-software.ie>
Date: Fri, 17 May 2024 11:08:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on
 stop
Content-Language: en-US
To: Chris Lew <quic_clew@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Richard Maina <quic_rmaina@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-6-47a90a859238@quicinc.com>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240516-hwspinlock-bust-v1-6-47a90a859238@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/05/2024 00:58, Chris Lew wrote:
> From: Richard Maina <quic_rmaina@quicinc.com>
> 
> When remoteproc goes down unexpectedly this results in a state where any
> acquired hwspinlocks will remain locked possibly resulting in deadlock.
> In order to ensure all locks are freed we include a call to
> hwspin_lock_bust() during remoteproc shutdown.
> 
> For qcom_q6v5_pas remoteprocs, each remoteproc has an assigned id that
> is used to take the hwspinlock. Remoteproc should use this id to try and
> bust the lock on remoteproc stop.
> 
> This edge case only occurs with q6v5_pas watchdog crashes. The error
> fatal case has handling to clear the hwspinlock before the error fatal
> interrupt is triggered.
> 
> Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> ---

> +	if (adsp->hwlock) {
> +		ret = hwspin_lock_bust(adsp->hwlock, adsp->hwlock_id);
> +		if (ret)
> +			dev_info(adsp->dev, "failed to bust hwspinlock\n");

qcom_hwspinlock_bust() already prints an error on failure, you're 
printing a second error here.

Choose at most one.

---
bod

