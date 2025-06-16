Return-Path: <linux-arm-msm+bounces-61448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A865ADB32D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D83A23AB17F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 14:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B51D1C5D7D;
	Mon, 16 Jun 2025 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eQ4/1G0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C431A4E9D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 14:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082997; cv=none; b=Wq+w4c3NodGEMu4fAPOd3zl86QTEdNL51t0aU0fhzssqtyZhRI2Af7/nZPuSfsxkDWFxmri7E0pyOy9z9Wy4LeCrL976Pl8S6csWVuCcb0NSu+pfaOawDYc0tKTuSkqGqsoOnAckSMiy/hzQztz45+Y1Z83uMYHp47vwdAmycrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082997; c=relaxed/simple;
	bh=bk/xyjGw0KBtVhvEHPMiHe27jiw8lhL8yD97jfdJW6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BPiI6vH9K0TbijiuJi42OgaXDXTOVewfqJvoTUuiesQUcsJMoFoEYlsb9BaAiPR/iPAQbYrRPODPYbvKkiFW8DXYPK/9xxjRz22YBnRwTfUN0P7Mk2D80PO3H+t84RlEPq9D7Av4ZZhUHRzCSaTNdWJkb+CbTPs4zVt9StNWaeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eQ4/1G0Q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so56808245e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 07:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750082994; x=1750687794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eG1tRllaLzLQ7yTmOFiDAfPfVrd6z8cvaWD0QjpeVfQ=;
        b=eQ4/1G0QGeD33EfKaqzK1zPqIUOc83BL6y/DXiVZJAM4/CjFvs+MEMhfHtWeSWOCmy
         O5P12EqQ6ZvtZMXK7LLM7wiUD0QgCz+aBp3YT5j6FCBGV6AvvMOwHReng2lLKDqPbBe7
         P/GZU5r8lh4tvXl+ATJsfF9u0mTELVp1ttGIe9sG1zHJr6hyVgIWjL6bu6geql3p0f6o
         gAAM9BLyhL99OPKPEL+3ChFOwMgFRC5cyzuGRZLJ+R/EsUzczrzXGVUUTL6HEpTisroF
         ejNGUnNEAF4lRRxiDTL1BY+TzMWxS2fWg0j6oYWsWX0176Ht0XNycxPQO0NOLru7spKI
         7AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082994; x=1750687794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eG1tRllaLzLQ7yTmOFiDAfPfVrd6z8cvaWD0QjpeVfQ=;
        b=MUreBb/QYwQOe8msUTqyrzshkXxrupdz4VzlSU7/nT3ZlyM2oGwW+Yhib9LA1CnjEd
         37MhiF2RymcrFfWDzkIDABjzUUz+de55J5typy6iGxqrx+/S1BfmcDP3KOkD4f8QS/Up
         HJtaxQt4+wHsBKQfeVVoG7tuSIUZg3pfD17KwBVeSCElHCi0OZte3/z7c3IS022LcRH0
         ofkgQuHH0qV+fMfzL56gHkeJVqquQwNKVpnAzQgfupqu5l2D7LVU6kEc7eYp4guQ6brO
         Y94V9B5+pNxmoSAYueqrPvIOFB0mBobn1kmmdBPtho1v9rnfJWIFbADuexkU9WU56p4/
         rS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKM9czSrQSTuYnJPsPLXTfSkJA+D6Bvnouoy0x/uAfs9dHCiYacsUvPE2Tc60lRpL+hIE6c//ilODwOOOL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2fpcBf8MleT4hqAoR/6bm/oF3wMnN3oUfvyRGLuKvDT/tt+ag
	EodBkQF7zE3EQ1X6RIn/PYnyLu+arqWIMZCMXNbgPTDUHGrIzhA4CS6pGLKE/fxZAoo=
X-Gm-Gg: ASbGncudJ99BU8TRv1eVj+YwGF97gcSTTBAbfYzkujauVM6iYIbROibTKIs0Sh+1wmT
	bCIhMmbr1TrE9c7ZzgkzAY/ZRBDgktOQcBLvT3M7XFPVGCKNaHGp8+mTQPlyNbhkq9rc/LReth9
	TNDDTzlxQbFCLESrqva8qVXx6W4aKWeCCpSpbi4zRcMw6LmNsQ3VTVKvJPkbpi4iBSxoMvwm170
	QKzNMQ1Oz8JEf+LAdjsgiYg17d+67qVZcd62bv6iKRYMFK68ANBAR8hyDLSsn3ra42z56Aa1mw2
	2Z6WpKuDOm8NRjrbzGYjW1rauVc26CXG18xXeIdrsZu2MaluH472f/4/BnMP+o5nK7FUYSrTddL
	fFxtVuHhMcXold530nM/+KkBpCRo=
X-Google-Smtp-Source: AGHT+IGDznAxXwPZeCKDNC5f9lF2U35yVP5doTOeyIgRBtLp4L+itiFGFFEjMkvl5sT9mvcZduwjhw==
X-Received: by 2002:a05:600c:1e02:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-4533cac919bmr79593775e9.32.1750082993741;
        Mon, 16 Jun 2025 07:09:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4b67bsm11033125f8f.83.2025.06.16.07.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:09:53 -0700 (PDT)
Message-ID: <21bc46d0-7e11-48d3-a09d-5e55e96ca122@linaro.org>
Date: Mon, 16 Jun 2025 15:09:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: vfe: Fix registration sequencing
 bug
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Depeng Shao <quic_depengs@quicinc.com>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
 <20250612-linux-next-25-05-30-daily-reviews-v1-2-88ba033a9a03@linaro.org>
 <c90a5fd3-f52e-4103-a979-7f155733bb59@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c90a5fd3-f52e-4103-a979-7f155733bb59@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 10:13, Vladimir Zapolskiy wrote:
> 
> Per se this concurrent execution shall not lead to the encountered bug,

What does that mean ? Please re-read the commit log, the analysis is all 
there.

> both an initialization of media entity pads by media_entity_pads_init()
> and a registration of a v4l2 devnode inside msm_video_register() are
> done under in a proper sequence, aren't they?

No, I clearly haven't explained this clearly enough in the commit log.

vfe0_rdi0 == /dev/video0 is complete. vfe0_rdi1 is not complete there is 
no /dev/video1 in user-space.

vfe_get() is called for an RDI in a VFE, camss_find_sensor_pad() assumes 
all RDIs are populated.

We can't use any VFE mutex to synchronise this because

lock(vfe->mutex);
lock(media->mutex);

and
lock(media->mutex);
lock(vfe->mutex);

happen.

So we can educate vfe_get() about the RDI it is operating on or we can 
flag that a VFE - all of it's subordinate RDIs are available.

I didn't much like teaching vfe_get() about which RDI index because the 
code looked ugly for 8916 you have to assume on one of the code paths 
that it always operates on RDI0, which is an invalid assumption.

The other way to fix this is:

+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2988,7 +2988,7 @@ struct media_pad *camss_find_sensor_pad(struct 
media_entity *entity)

         while (1) {
                 pad = &entity->pads[0];
-               if (!(pad->flags & MEDIA_PAD_FL_SINK))
+               if (!pad || !(pad->flags & MEDIA_PAD_FL_SINK))


But then you see that every other driver treats pad = &entity->pads[0] 
as always non-NULL.

---
bod

