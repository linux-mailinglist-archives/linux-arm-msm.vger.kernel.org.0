Return-Path: <linux-arm-msm+bounces-60506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC95FAD0C0C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 11:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 360C27A7D70
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 09:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4B320013A;
	Sat,  7 Jun 2025 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gnFYN7Da"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5B51C84B2
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749287792; cv=none; b=RBSnpxZRNlqgqXmfT6O3a4WDzTaoGg3nrlWW57IzeN3nFYCsk/CMVV+BEjPVNs98t0QdEZhndYWrCw4Bpeti1n9Pyde2A3tfPmoIq2tNOhHhIlnvAidJf71Tya+kac34CqFs+ug4D/1lSRtdRybGqcOAn/xaANNWbeGySApz3CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749287792; c=relaxed/simple;
	bh=6uCKdNG+RvUmHq81VMYy036iNoiJt2ExQMxgWhfmRfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4CpsT6xrbZHmNII4oNiOzPvzXueojD977fLxZprGTbDDPUG/eqbQfIHgm54/DZIZLOQ9ORz01Rz6uvbe18zIU7dQv5Snq11ruGWjOscq2IkG8nvucWUka8Lrw+H4cpdjhPU011FlNv05DHrkBCfd9ZdW/rhjfFtmpAx8rua4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gnFYN7Da; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso26114505e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 02:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749287790; x=1749892590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CjJ/5vs6vF4wRvE8/xfIzB8JpoATxp7vm4h1CJMyhgo=;
        b=gnFYN7DaQDWFkGHLy2cy+KJBAaXixEfrHq/KPm2qjspKJjxaL9tQ2N5NeBgQgRA+3U
         I7VEWxhHelo7T7u9yXu1SJd+A0lm+iP+cI9SPc8Fj5ZcJ+gdNEhkusZlpFNvPC7KyZ2M
         XufMB9wBlVc+FAEdaLbxlOos+jWKggig2CBfoRFbIi2Y2YS+hsU5ikjmGW/gFxsWhWC7
         6eeZ4nBXUD/DwyB0BRWmC8M0kUTDtAaSHaLGHJkCbGLmi96A5lzZUBciYU4YiL1FbmJt
         LpVdBoFFURQo1RfFdq3q5AjOE7/ef/djBN/V4ww1M0i0BpJmRuXCbg+L3vV0zQkEeBZX
         cV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749287790; x=1749892590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CjJ/5vs6vF4wRvE8/xfIzB8JpoATxp7vm4h1CJMyhgo=;
        b=XBwtdssa6oJfvS4kVkDr50Yjb3NEGeKTuFUQ3wa02PaObKqPwtRBZvb2MSCS1eG0iH
         LVRwDxrQyxFH1bgey1XSPz0f6KWDZ89nZGQk6z+pJmogRyXUpowQeLxYP80XwiBfb1xV
         LRi1F4nsZu3gi7A+WNk2gqygkxxKGXlW+1Xn8rZW4XsGWFdpUKxAJ4oilehsVQc69E6M
         RlSHwGJVmvrEu3i3GdBVvs/58a90ravTzFaBZfapk7kXD9K7VG8fImcs9AxEYk/4aj9i
         qeicImQUaWZoy1bfvHGXejc34AWtsOczCYJq12iq7en8mic9/R9eFheglq/Q+8hKyfT8
         4l3A==
X-Forwarded-Encrypted: i=1; AJvYcCXkU9jrpANmFNu6owe+RvoQiWx3xWDLDOCsLPRceUjy4SMoK3CGRtfjUJ7UYzgODUrcYdIjlsvZmNHyBP10@vger.kernel.org
X-Gm-Message-State: AOJu0YxC03Vr64GAzoHTNRCW2zP8qRQ6C2qhmIqhZFh5P//a5+TVMroi
	5GwxXvlk187jDqQBnFmzMTj5oQS2IpB5jxrWT95mPm8hMzYf+o0SI7zNaphHdRteS9w=
X-Gm-Gg: ASbGncskImlxNkGwMT9hpIR8VtncAwG6CEso/+4WoaTeLdFjB7vf1vdgdIyjUMpdHhD
	PzpVwijo+nG7wjXKzf3PIJZAqWIT5vCtkxTWLmO8oGqtxRyXoaAtcZ2v8rpaJSCQueZWMOmL0wU
	0gQX6hrzoi4oVobhtP85IYGhhnyHL1DcnAwvESQ1VRcsV1W4rZSQMVsdQT2nFnRJy15eftJQnbD
	SIqWUKsKrLNmE0+RTnI6kHwwlJjXb0+gtZsIGWsZ9O040h7EaO2R71wb57aaANm77rZdmMm8x3L
	BLjNbwu1vmp896MmcGeOt8eKoAi0vpkr6E2ou4rT1ql7s58EMJuGZK9M7Bo1fK8Je94jPnxYQOG
	rC+tMFp/qiXmd5wzC
X-Google-Smtp-Source: AGHT+IEkUbJBSS2d4IS6QBShUgwU+ysgYvzacuZq/Zvm/z+BFpGTBKsmlusvq3rqz7YKM16GiF1BFg==
X-Received: by 2002:a05:600c:a101:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-453081a33efmr596565e9.30.1749287789633;
        Sat, 07 Jun 2025 02:16:29 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375b5e1sm51785485e9.37.2025.06.07.02.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 02:16:28 -0700 (PDT)
Message-ID: <e0405dea-bad2-408c-a65d-f9a3456dd92e@linaro.org>
Date: Sat, 7 Jun 2025 10:16:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Renjiang Han <quic_renjiang@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
 <996c9a39-5520-4b43-adfa-06ce29223ba0@quicinc.com>
 <713b87cb-0003-4ee3-a599-9cd41629bb42@kernel.org>
 <7aa36a0f-6741-40c2-93f4-036823d245fd@quicinc.com>
 <247002c0-ee68-4d0d-857a-768bf68bce75@kernel.org>
 <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
 <fa6a7983-27bf-40db-9843-0891bdadf523@linaro.org>
 <a258433f-f1da-4be7-a0af-645571aab871@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a258433f-f1da-4be7-a0af-645571aab871@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2025 03:13, Dmitry Baryshkov wrote:
>>
>> As we've established the fallback isn't a fallback because it falls 
>> back to wrong data, so lets fix that.
> 
> Why isn't it a fallback? With the driver changes in place, the fallback 
> is totally correct.

Its not a fallback _as_is_

I'm fine either way

- Apply 1/3 and then re-submit 2/3 3/3

or

- Enumerate a QCS615 table
- Apply 1/3 here

---
bod

