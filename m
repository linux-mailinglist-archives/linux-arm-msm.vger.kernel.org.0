Return-Path: <linux-arm-msm+bounces-69066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1BAB25601
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 23:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 734463BF5AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 21:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673182D641A;
	Wed, 13 Aug 2025 21:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bII1u7aT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9829021638A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 21:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755122144; cv=none; b=Dql8ts7jjvlN7mwCtUlWc9DL/QbUoVnxRvxGuedanrCVCJ8T0wBv4qhPkksePXnEKkqa9WTj86SCS4VKBOw+xKqTqHMNJSpuKfg6+d3AZld13YS6acKWmHp/VSHpke/0YzLdmTewndxmLvtAhmYK71zMUA3M+F84IEMdXEu3KeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755122144; c=relaxed/simple;
	bh=/92sLgVIXJ/37jnko37eHBxZTjkYG5hjktUyq6kVHPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFQLU4sdbH+aPYP3i+gOAzL5CsA6NnBRK1Qt2NvsTIiTh+rNqI/2wJsI6pb3dqrnbzhhNVZx+hhQwSiqJXLXGebA56tNk629yatJQCFiUSp+iqENqMj9WpPwJD/LOcRwXxkDl/doqBEmuEYqMjuuJJBAr1CF1ymRQXYvITf4MDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bII1u7aT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1abf5466so2219175e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 14:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755122141; x=1755726941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/92sLgVIXJ/37jnko37eHBxZTjkYG5hjktUyq6kVHPM=;
        b=bII1u7aT2pTxcFMdZOhFQXgOWykgLzkv2yi28DESlN23iMdwNVDkBBwMi9biiRosJk
         q2xvmFBmZl2NDKJadCcOQDieKsXZoXWVI8cWHY/6dfIQ+v2vvuh8+uB6Bcq+5/1mOOuU
         CZSblAdOivqV3vJhjsW4PyPC7L/uGEQOAk3751LqcXYmqBuDrHRaMS3+SMbT/rFhgzns
         hz0E90180TK/0qdQ0bALKaYGjdonDZHy9MGsk6llQuHXW2fMYb+Lw/zXbuHXjhSwFCE2
         fkM2GMaYiHResIKu8iV6jGdbNL7wDVd1DvQ2ictCDLqFM0ozcC7Wmf26SmlrilGCGDg7
         zjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755122141; x=1755726941;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/92sLgVIXJ/37jnko37eHBxZTjkYG5hjktUyq6kVHPM=;
        b=Xb06BD7SdI+VYq2JB+scTJ3ecB9oILKKUxz/ZOU4M+xqqo94IIpT6XQSAqQzRIPaiy
         aw7VRPvBcrKh8SBY7gKwoEEUaVBBXuRlo6ZxP5ztjgnPkvIfdQUCp6j+qA1YJPHWFm05
         NhXidoejnH1FgH9KmIJsaKUu68PQOaZ9Hihx2kzBSurSO9QO/yk8pqCgmQyUl1e2n6v0
         i8TDP9ZJ8P4ShA8k4bDnX1ZTrE+OruchNYxRXo/BbaBIlNvuy6aVFPLrunCkRjeGytru
         7kogRC+EY4DRNHeZFo0Ms+7asCsXxbww6pLblLgRAbp3hoEUW8GEnzdhUD94Q9Al3620
         FA/w==
X-Forwarded-Encrypted: i=1; AJvYcCUWiTJmwq2h2YTMXHy4n50ShZBSyBlnVQXrhvHv8cDJ1LV/JxpnkhFzeLCogYxISJyLZKq0y8HSoM2Kleue@vger.kernel.org
X-Gm-Message-State: AOJu0YyLNCMkpaM8e7lBrHTO68LkLl3gForbGtSnxeN+QEdcb69t5cAi
	D6yE8pSbN9HI+1Rh9pPS6sJJ2A6iY/0mL9poeHV2WE3o+04ApIJsjXNLXP0o2Uzc4tc=
X-Gm-Gg: ASbGncvhDUE6o3zhpEhIBazHzw++bfQSAt3P9ADwqShX6948x3WwsF9fXT+gjsGy9K6
	s6XTXLdT1uhCUzViBhYgw4w5hd5Yi3QQir4rWA+86rCaZ1gR4G53RkCjC6dGP2xrW7u0qdtKL63
	Cn8htvocx5xWN3xQSZdwQJEjpi9WrDlevcMh6YRrjYJbdiWqPrc/8FPoI2Ce5Y8A/chv1Ob+ZfQ
	OSmsZHGkSgIP7BlNXX15tT1mR8WRc/NWZFg/LqgJA7Q5aHweTjmoaIqTZZ0kFS5gc9gOgIkADCU
	EorR/JXUSfCWUelpYC1g+xTkbMEUrG+muPxD4SE18l1V3CNvht8EIN6mNKmSMTuqrrE5j3Urqkf
	hAF7RGelVbnoKsrUOeGqo+hrAkyxbwYb05H23wc/2s8o0SbkepcucxU3DxAjRMuNT
X-Google-Smtp-Source: AGHT+IFU2fJlqPaZk2tNh5JZyckG4stm58L/0bzHkpCtPgZ487c0DjhTgrCu3hLQ1dHm8Hr3LQbJbg==
X-Received: by 2002:a05:600c:b95:b0:456:1157:59ac with SMTP id 5b1f17b1804b1-45a1b79dc1emr2066465e9.7.1755122140883;
        Wed, 13 Aug 2025 14:55:40 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac093sm51390976f8f.9.2025.08.13.14.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:55:40 -0700 (PDT)
Message-ID: <aebbc0f0-ca65-4c3b-9a32-86996a132507@linaro.org>
Date: Wed, 13 Aug 2025 22:55:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/24] media: iris: Allow substate transition to load
 resources during output streaming
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-5-c725ff673078@quicinc.com>
 <24714b00-cc15-4c9b-b0d4-8c76d702fcc2@nxsw.ie>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <24714b00-cc15-4c9b-b0d4-8c76d702fcc2@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 22:51, Bryan O'Donoghue wrote:
>> Fixes: 547f7b8c5090 ("media: iris: add check to allow sub states transitions")
> If a restriction has been removed, has that restriction been marked as a
> Fixes: ?

Yes it has, never mind my proton mail filters are misdirecting patches...

---
bod

