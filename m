Return-Path: <linux-arm-msm+bounces-27105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5DC93D9C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 22:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06596285DA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 20:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028A2149018;
	Fri, 26 Jul 2024 20:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="advkXPBD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDBE146A8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 20:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722025874; cv=none; b=L1pcmOwz7Kehjyn2tZ/yaY7lowtwJxmxaZ0yl1zLolFjETVY6efOxb+2WUoQBhuQWVwXYJBdY8vflMRX7ve9d73JIweGOjU4TUKTFokgmpczlZojpamEg812Oxp7Rp84aEaDZ9tiT+tTRlihDizgJXUHtAxwMtGrtoA04nmIUCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722025874; c=relaxed/simple;
	bh=YNqfB4JN0cyuaOlR8gcaNiIJmuLDMcvQ6VgnnrubLwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E3VIHrzmJ+ow4E++3ATG+ll2JAJdJjgm+lT+ShjLUCI1fNeNnCPUVuztGG8G0VAFMBAJGF7X6ln/xBDRUY57OlPbdV+/YWxketWIH+KtXIWttfauLsK35ImUxmthb84LWNmPp7hsF9DtaiQUa86w8qhR+UoLxhXqysn63Wk4vtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=advkXPBD; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ef23d04541so20556431fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2024 13:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722025871; x=1722630671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Zt2ODlLE04BgAxJc/6BvoAiLfGrGxxqjsHDD+m0CXA=;
        b=advkXPBDG8enLekJvYkCpBFGrWwKyRTIf7OFzlR7FITNhrVnEzEUEMwOXfSFx9i5s0
         taML/QQwpaIsyfmTlqBQv58i10uTOuth/GztbP9AOc01cMdVWYsoMI2QsGcZk//g/bQW
         DHnxH+KKiLXBD9aSJCFFie9nRfINA/ZDSCU2ZcsVu+dnxf3QXS6zCOmWU9ZMT/DaEfVH
         xa4ZFjdJSkTeXWrK4+xmacL+DsZh7f2f2XZnr8vofYcdY511IBkiIX7dwF049oeELvHw
         MmTUQccdYmBt21Xk/QBwsqHeXbOakwPFBThfOTj7FxtYLUdIWOfUMKCvYts8yoOc2iDE
         0Dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722025871; x=1722630671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Zt2ODlLE04BgAxJc/6BvoAiLfGrGxxqjsHDD+m0CXA=;
        b=uu1er8hoaI30FpK5gUiZs6+V2ttVPO2tz+tKsBCpH+06kBnBNpZULDoX2yFq8SO891
         exd4YrDnTdddbTwI1miRgibcxB0cYv27x4h6m7G+/+dUuJ0VuLvelbE6xyiMDDDdFjpz
         MbrGozAW6u/k4UtHsSd5xcU1uKuYQMaGhIbkcSA3NmHGr3QW0Dy3g2gnI0l6Ah67OsYq
         qgTlYkx31H8x1j05WuOVsxpYj8pz0xRtqpCPSdmjxUS12vyfjh/uZznneA+XrU3/oxZZ
         whU4dZV8zdjxZW/ycF4MMT/5qziIM3jIGc9H1ZmNN1qWKcCO2h1CFeo+unyBDvNtPitT
         Hmig==
X-Forwarded-Encrypted: i=1; AJvYcCWleYhUxNF8MjNnXHiArCtbx48RiAoVgYMiCtfSjE+pp9/umcUfQEw2deSApym+Zfyq0SbS1zG5eK1jCVCpyLeS+OWQqe3509t6sX/reg==
X-Gm-Message-State: AOJu0YzamkXU11cmFtD4saQPPZjbrJNHw/hFU22GjSY0/igSe6kzE6HV
	uZLLpB6dJpY25zb7aczPa7mg3XwIbQ6OWxS0QUtZWgPixO3agd/Oj6w8rhAH8B8=
X-Google-Smtp-Source: AGHT+IGzAE+43DRMEiarplxQZPQegnGNyyQ3zfbArMcAkizj5FCUjoQvWUv32KBI/e3AFMWdCP3Vkg==
X-Received: by 2002:a2e:9949:0:b0:2ee:7a3e:4721 with SMTP id 38308e7fff4ca-2f12ee422admr4603671fa.39.1722025871040;
        Fri, 26 Jul 2024 13:31:11 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f938d9besm129568515e9.24.2024.07.26.13.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 13:31:10 -0700 (PDT)
Message-ID: <8d31cbfb-f223-4539-b61a-a30a12dfd99c@linaro.org>
Date: Fri, 26 Jul 2024 21:31:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: Remove always-on GDSC
 hard-coding
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: dmitry.baryshkov@linaro.org, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org>
 <f0d4b7a3-2b61-3d42-a430-34b30eeaa644@quicinc.com>
 <86068581-0ce7-47b5-b1c6-fda4f7d1037f@linaro.org>
 <02679111-1a35-b931-fecd-01c952553652@quicinc.com>
 <ce14800d-7411-47c5-ad46-6baa6fb678f4@linaro.org>
 <dd588276-8f1c-4389-7b3a-88f483b7072e@quicinc.com>
 <610efa39-e476-45ae-bd2b-3a0b8ea485dc@linaro.org>
 <6055cb14-de80-97bc-be23-7af8ffc89fcc@quicinc.com>
 <a0ac4c3b-3c46-4c89-9947-d91ba06309f4@linaro.org>
 <fe44268d-76bb-bdbd-e54e-39a38e4e5a49@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fe44268d-76bb-bdbd-e54e-39a38e4e5a49@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/07/2024 08:01, Satya Priya Kakitapalli (Temp) wrote:
> 
> On 7/23/2024 2:59 PM, Bryan O'Donoghue wrote:
>> On 22/07/2024 09:57, Satya Priya Kakitapalli (Temp) wrote:
>>>> I have no idea. Why does it matter ?
>>>>
>>>
>>> This clock expected to be kept always ON, as per design, or else the 
>>> GDSC transition form ON to OFF (vice versa) wont work.
>>
>> Yes, parking to XO per this patch works for me. So I guess its already 
>> on and is left in that state by the park.
>>
>>> Want to know the clock status after bootup, to understand if the 
>>> clock got turned off during the late init. May I know exactly what 
>>> you have tested? Did you test the camera usecases as well?
>>
>> Of course.
>>
>> The camera works on x13s with this patch. That's what I mean by tested.
>>
> 
> It might be working in your case, but it is not the HW design 
> recommended way to do. The same should not be propagated to other 
> target's camcc drivers, as I already observed it is not working on SM8150.

I don't think the argument here really stands up.

We've established that the GDSC clock and PDs will remain on when the 
clock gets parked right ?

Am I missing something obvious here ?

---
bod


