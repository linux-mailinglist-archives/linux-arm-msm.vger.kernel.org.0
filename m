Return-Path: <linux-arm-msm+bounces-25526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124E92AB29
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 23:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 357861C21A02
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 21:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC01214900C;
	Mon,  8 Jul 2024 21:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vx5BiBr8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C118312E75
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 21:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720474033; cv=none; b=CdlLZ0nvp9qX/Z0bGDfpNN3zD//wE3s3y5yPKAkzR+y0nXUZDAmT2bYq9emElttuWwhsHuiQInH+byaa3YLPqgIHGeYY7HrutOGTaNJnnjBb78WqpJ2fLw9XxyOmh1EXNyAadH+StqXnhsEZaKEcrqPvVS6lUBDwxU/S47pHxZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720474033; c=relaxed/simple;
	bh=PLWUc1ivG5xlipp/sj+y+0DvHWElwbQ+HOwmJazkZY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4q5xDCDidJInhBGIdfKmEGTUj+WfuzjVOj0xEsDeocP5eHqs9J4ev9I4KcPainOuLExdgKghqgXAf6gJnBJn8oqndZgmjylGZTiqGgpF+xBXhhrhZHskfzdVray8F/jA7gF7vejrsN7UsV5Ox+ZOjKmlYxgw4XZjrtEE0TAB/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vx5BiBr8; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52e9b9fb3dcso5287304e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 14:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720474030; x=1721078830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Hnrx80vz9MsE0J2iryhuQ3skRCgcNpUt0TaSNEcw+o=;
        b=vx5BiBr8pdUatM6bwGLa7sDyEUdA81Hq68eIpBdKgypobZ95mP+RdRt41eIIJxHGIn
         ks0k1re+J4dWNNcA0UToLbaC5JQc5Oo2sfPvIHfkZJu8R09tSqCeuJHpSiASyOoRjwO9
         bQ8ETGXxTlNAdyR1ax+0r98okzDczavkD8hxaFzg8eZL0OcArjSmJKPeQfmzHIkb7tk/
         TtMzVGRap5btIyjaBwxgFAbmzaZtIHuTiYLVV70dwfpoe9yQcOsU+WLpJzbWcLHXe651
         pVNlCMmQstb9fT35tiqoirY4/4gEGDqXNjmjDdYnCZJeMNemOGH17+wTmlUxejGYD6nQ
         SWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720474030; x=1721078830;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Hnrx80vz9MsE0J2iryhuQ3skRCgcNpUt0TaSNEcw+o=;
        b=Ip2zRjyxMfiLP29qXazn7wZjgZ65ROLeqB0wbg5lzpeftTu9420HxKuCDAIoOhHcWB
         Whh5C1t3Gc8/4PZl7jBrNVwP+bnD2VIpJUPB2yAfABZdfC4F1KYKdGI0hjPGOSe7waVy
         P5INuwBrIP7Z5ucd2IGsXBrbiUJeV6onoZ253a/lJqckZyA1W91Q5yaUxzdfzluPsE+s
         Ktr5LEabNvWnG01IXM4O9slWfZkEAF5mgtjU5XHbtNnxDih1uaBJUBRxNyvVRNeyw2MV
         yBn+0TXtgfE+7Yc+ZES2HqEcnBe9ncXpTFCH7FLra+D5wkZ2g1bROReGj2DOmPFyDMY+
         nIuA==
X-Forwarded-Encrypted: i=1; AJvYcCUwdWQVi3GqfHf8GwPqJmGGcj5Olcvq8TxP9qVJpyvqwxkKBUVC1isSX+twtPN9CqZ3smxkXlUcJUbDeONfTmBmTEzGZHw/4BTuyY0a8A==
X-Gm-Message-State: AOJu0YwhYGVHqKMuhde8i65F31q1wI/hMn1tSFkwlovPMLwUZ0DHm4jJ
	Lva/lxcNUdabug2D/FK+Dj+w1orbCSVkVfiOC+kj4HQGynbj9UkTXvzzER4trFc=
X-Google-Smtp-Source: AGHT+IGoTRUMiSdbRXAWAVkLZNFoG+1mw8OQw9YkrWqy50RZKRlXiFFFG0hQ1gcgSHAwQKUMcu0KTw==
X-Received: by 2002:a2e:3608:0:b0:2ee:6b86:b098 with SMTP id 38308e7fff4ca-2eeb30b8446mr5707101fa.8.1720474029721;
        Mon, 08 Jul 2024 14:27:09 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc4e80c6sm261750a12.46.2024.07.08.14.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 14:27:09 -0700 (PDT)
Message-ID: <c7da3acb-4456-496d-9876-b05abcc0e010@linaro.org>
Date: Mon, 8 Jul 2024 23:27:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson <andersson@kernel.org>
References: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
 <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
 <2d21db63-4371-45b4-ab24-9a725c29e09a@freebox.fr>
 <CAA8EJpqz1SiUdTMpx5hmnax_rBqtpVAtOZsaL8UfHnZ5vZZFHQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAA8EJpqz1SiUdTMpx5hmnax_rBqtpVAtOZsaL8UfHnZ5vZZFHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8.07.2024 2:49 PM, Dmitry Baryshkov wrote:
> On Mon, 8 Jul 2024 at 14:07, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>>
>> On 05/07/2024 16:34, Dmitry Baryshkov wrote:

[...]

>>> I'm not going to check the math, but it looks pretty close to what we
>>> have for msm8996.
>>
>> What is the consequence of this?
> 
> That I won't check the math :-D

Dmitry is trying to say that you should check whether the calculations
are the same or almost the same as in the 8996 driver, and if so, try
to commonize the code between the two

Konrad

