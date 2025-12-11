Return-Path: <linux-arm-msm+bounces-85067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70989CB6324
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 15:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7CB2305D986
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99C5236A8B;
	Thu, 11 Dec 2025 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FYGFMJ5i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E893148BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 14:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765463112; cv=none; b=OHIk3fpoUH9l3dZ4v+uqPTsQmbKqXv6KXILGkbDRl+pAmXC+MwzTdijHUUuZk6+jt1rocLdrmjZkxsln1DDSXs7ShH+inouuGhXogNsGeTdEBQ8rM6ksySdKqzra+PjWL+eeyLmklzg/ruZJwPUhdnGtR5Z8ZkOCjb1EYU8UgBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765463112; c=relaxed/simple;
	bh=JfNvq6okLmAVJxXk0CdmJsFS7cXDJb/i1MZ0ORrxZZM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZlSJ2hu8wVibuITYghV52ZYfi4q+/+nL+c82gYspDaAHC6RbeU5RaGzjRN4irzoLchKmsEaqbhsyzl86sTa3BDW2ad/WO7rj69DOnzLkkg14WK6QaHBepsImsXkHQlGXuVCqZHTcI8M5HdPOzIk1uE22+Py4l96NxYoERret6A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FYGFMJ5i; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42e2e671521so96656f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765463109; x=1766067909; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypzGs37g1ijizc80SSvmoAUEXXtetijEMnbM5bEMyAY=;
        b=FYGFMJ5iS4E08rzM4e0pqC2kLkDbb50XgMau0RaPUjhN6BdBNlLWX42c0n3M85g554
         SC8Qnpt/iqENWR6g1YD8pm5SvgDuMhYbcptWRxeAzPIJnX60Db4Neg/ZVraHlUvbFDPO
         liOcXnbnTRp8rIF7G+LBHEG9PWTLfcdusN2h4ns1mBM4zmDV0FxFGiIxB6hUQSO3XIA+
         OaOy6T+cgZvr3EuoejW3ileIjwcefCOAhzP/9WwNXrIX+M75+YAv3P+cH0NGyaNGNabB
         pSwivu7fm2d1WGMt/FoMEAiVZU6S8Q1H2TUfZKV08fTN9B5Gg2s6Mcyrr+Tz0K8ji5Pg
         2QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765463109; x=1766067909;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ypzGs37g1ijizc80SSvmoAUEXXtetijEMnbM5bEMyAY=;
        b=jore4PWYH4quTBYi9DsJpnE3NVsqZP8b2HXUqphlrKjjwMZlcXRf1Ta0h17N78t4pp
         L4WO0AzhNBo4smgm80Dyb/kozTjio2xK49FWi5QqpUGYIb6my29cCNfrQ6tKPn30hdDh
         LQAeeWXVCUMUhsyI4a21vmmyt6vHZAqotkJ3IwK8nRZQJD+L9ZlZTvk6Hxy2c3P5SCna
         f+/elaQGhGuhVBl7gYaD4UOxWGBjGOZeXPFDRgkq4PmYS2xO4/g0Ue8ovAw9RXZj5Ohe
         4csgsg69i08dSAk1XkYKqETQLBkuYxlEhWzAJB644JBj3RcxlMz3z+V4NBhWEtPX+W6m
         Y5Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVD/1pclQsI4N8h+nAE8U82hD+NDdqHPF16QC9pFnCxv6/k+zJEP6DIPPU3pvoyvbUcWMCjR4peu+XxRs7v@vger.kernel.org
X-Gm-Message-State: AOJu0YxOYaM2uoMp1bNYYc/b/3/M4h3vTxD1GdMCNEfWe1zfyHsQ9jSi
	pSFXWeWNgbagkBpz4XjFE7PkuXLTJxh8wR5RCWRrOAlq4WTQJKJ/SbduJaKKNNXlsR0=
X-Gm-Gg: AY/fxX5KOWSF67RAuVaef0LPqMLZjSG8tRQkhIauVcDtUbbq49BInCNpQYYOdIeMABv
	HS8JqnlMYVZGxHVvyZ2CkZ9Z/YXBvSP2xpv1RYVwPw3DtSduBxhl5fZJujJOqBk6FrTq05PD13N
	4wgjKPs75BfQsjLi3xkbKk3bRk1z8CxAnvscGpg58A+hmBOXLMWFBV/Vh+36T4sDlIs+gAgcOsH
	Au9R3DTmz/7g7p3rpxOnB9Wq0EeGcdso9rzN9sq/pVJ6KQ9oU2Kx5UsXzsasWG0UJ79pqZcISys
	i1rsjbvlC/k9B+R7hmDRrmvvI7D2BVgFZiuRAjtgR5V4aexwBTnKMZMnaL8TGimfXWqWTcP4lRU
	ullOrwnc7C7miv536h2QHggRIIcekR8Zm7valSNOt4lYJNX5hbtuwsPkn1OEhIYSu3wPJ+lfEIE
	G0qxL6BWe/r0pk/qsh
X-Google-Smtp-Source: AGHT+IFqWEN8sqh579V/27ddTYiJenJl8LmZUFBNlJ5nqwZi4FWTc0j4oMC+Tm+I3rDoAG2WVaNLlw==
X-Received: by 2002:a05:6000:26cf:b0:42f:9e75:85f7 with SMTP id ffacd0b85a97d-42fa39db068mr6789670f8f.28.1765463109070;
        Thu, 11 Dec 2025 06:25:09 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:c186:ec41:4ac0:f434])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a6fd62sm6467992f8f.10.2025.12.11.06.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 06:25:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 14:25:08 +0000
Message-Id: <DEVGFVA8N0N9.13ZJADVNM9PHO@linaro.org>
Cc: <cristian.marussi@arm.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sudeep Holla" <sudeep.holla@arm.com>, "Vivek Aknurwar"
 <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
 <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
 <DEVEXHI9CEFA.19RL3BXTV8E38@linaro.org>
 <20251211-masterful-caterpillar-of-love-bc2d4c@sudeepholla>
 <DEVFS1MAP8J6.2263USIPE4Y74@linaro.org>
 <20251211-wandering-magnificent-yak-5fb19e@sudeepholla>
In-Reply-To: <20251211-wandering-magnificent-yak-5fb19e@sudeepholla>

On Thu Dec 11, 2025 at 2:07 PM GMT, Sudeep Holla wrote:

[..]

>> > Ah good point on confusing commit message. I just assumed it is limita=
tion
>> > of the implementation. I can update the log when applying. It is not s=
pec
>> > or protocol limitation for sure.
>> >
>> > How about this ?
>> >
>> >   | firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
>> >   |
>> >   | Some platforms expose more than 32 operating performance points (O=
PPs)
>> >   | per performance domain via the SCMI performance protocol, but the
>> >   | driver currently limits the number of OPPs it can handle to 32 via
>> >   | MAX_OPPS.
>> >   |
>> >   | Bump MAX_OPPS to 64 so that these platforms can register all their
>> >   | performance levels. This is an internal limit in the driver only a=
nd
>> >   | does not affect the SCMI protocol ABI.
>> >   |
>> >   | 64 is chosen as the next power of two above the existing limit.
>>=20
>> Yeah, that sounds better :)
>>=20
> Thanks!
>
>> I also thought that this was a driver limitation, not the protocol/spec =
one
>> as stated in the original patch.
>>=20
>> I don't mind updating the commit message like this (but I am not the aut=
hor
>> of the original patch).
>>=20
> Vivek, are you happy with the above edited commit message ?

FWIW, with updated commit message feel free to use:

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>

Best regards,
Alexey

