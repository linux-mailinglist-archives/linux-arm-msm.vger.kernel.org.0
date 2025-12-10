Return-Path: <linux-arm-msm+bounces-84940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32865CB40E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 22:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20601305D996
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 21:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27D1326D77;
	Wed, 10 Dec 2025 21:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FH0LPmbJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2492E305048
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765401999; cv=none; b=GnXBdlFTaEFPpvDHuwNQ6nH2uqW6X4w+0yZswUqYm4/M1OApmVJ3caE2fIWK+z7DiKUOLiiHb2xRC6AwCDi5/6/MHGDgyXf3x7+dTH+KGbokE/AcbxRJ2ZJmWTjgKi3mmfeQqxMkariHqzM8vt32ijYM+8YxYmcn/hSXcb8nRqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765401999; c=relaxed/simple;
	bh=p3TIbq0R04u/FpENpp+SgAGS/YPFFARo8ydHHOWFLVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkxGdmx0miDu/ObONanIfL2XsGuuG27Z+csIzGqv2cCHKDVm+BSSKOVazPNTWGSyOwMq9xuiH+l6GmiRGOW2S6Ae8do/AM97/wsuUyzMcgr8hpUEF66lLmmzkO+tZFImZccJhNApt7Ao3fx+vxQi7IzC0p7GoiX2BJt0rRFMLl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FH0LPmbJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2953ad5517dso3379075ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 13:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765401997; x=1766006797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnAZV48Qb8Z1eRTAl/r3BNX0BH8DNBEAh/DYRdoY1zA=;
        b=FH0LPmbJWq/2TghmzPXQWhUeE5XXcIARIm/ijhteKGB+Cb9+brpWkso4RmmAkhuf6s
         Jrzvr09N8Ramo3Ia9NmqY9psj2tdviXPA3dStZFs1vyqK0i+MfktSQHrzyEIV2JJtfEn
         idP0ALV2ikJlfU4svAZixylmFlPfqHLUAEWGLLd28xp64XKqGS8QeoVKTi3ETGgRVYR4
         6NtQendyfOblOHHz/rJ/lI9kNkTzkOIWluxcBal7JeAJq3bfTc1acLamAlBsjaS08sHi
         wiR/NOR/Tj5tztDW99vgUFnAeiqfYGGJdxH1/JxQ/4S1FQnVUYd2l3TMb1/2TjSLNRiF
         1KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765401997; x=1766006797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnAZV48Qb8Z1eRTAl/r3BNX0BH8DNBEAh/DYRdoY1zA=;
        b=fWHDNs3N+R5Ym50bXY3qRSZ1v0i8pwxSD1VFz4KpCO7veeeJj3d3yNmBK9NC7TYOQn
         znQ0YlJ5W61IcnoUXqT05K/z+ZxICNK0EHqA1XLAN7wLnvvAdO8kHZtqxLTg/NAcCLRl
         ln3LuD92Mcv/SyCndKNOiErbXT1J8mBwksGwzfT+cSl0SJ5Duo9x3RoG6jxwE3NRHSM6
         HOHFy4i+fgzFj7zhrKzK/6eWXj/S1b/CR1K1vbLui0MtOy1Bzu7s7QdTH8LwfPx6zYtb
         ok3OaxMh9SFXkoRtdpXZl9tm1MwrILs0qTJgN30aW4xvI8a45nB6TN5TDxbSAUaKBsOK
         OeYg==
X-Forwarded-Encrypted: i=1; AJvYcCXlyBKSYY65bJK4JaPUZl7jpqxTvQfYuE+Fki0cVxjaMfx8K2XfLtRrilcW0fLcvGRXeCnnWLUWxXilzY71@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/5j2rGwzaCXCItFj/NhcGvf5dXlCoVOs/bIix0oq15+FxIm0N
	GyArpwPOlbsUdLAHeRcCtDBSg8rloJ2YxCZyWRSB/YL/UF9wCYpllTPlnYOVag8yKio=
X-Gm-Gg: AY/fxX4i9LkpG3/3jWu/NXfCTNQI8R4Q7yS8jRDwHurd481n4+GHNZ1yG4V6mAOpPYa
	tij0OyJgjCmesLA4nkcTKkmsvsSgCQ3lDqww2+nWaM+6xSdA4KwB0nyygtP6AIKRcxLmxRK9h47
	ory4e9BlmuoBFTlG/nH9ER5li05ekvwiLrmNRqeZtCSFiKMh8bUQtFkbtsAhUY4wzBx5KELl0t3
	vb/KFmxaD7iNZNgSRlPt2+5uEutsba1nvSAuVEID0A+fPJPECK9+MqptAS+Q0iVT1NefEL/5F2q
	N3+aQ6A09b68QEe+t6KuNm4KUgtj+LStEIsMtcSiN/H7Fwq7uls3+2dFszgWpIT8NwPK6OaQoBR
	EqpYxs5escwQkZmMmK+4Do6XpOFY74ASSr0SL41S3VYWX/uxw8fr91VIyy8kAvzGjKAYwRy93x0
	o6q3zQw9qzSvnmgkIZyJmfwg4v2Dn3DHILqa82wusR2en6l+PQvunmoaGGL9k=
X-Google-Smtp-Source: AGHT+IEzNSdU/YLLXpbFyGQxKDrGLYDcehreWFcYn2Qp+Tm1TZgR9cIY5gNkUR7m6V5ePuEYYhm8UQ==
X-Received: by 2002:a17:903:3c65:b0:295:59ef:df96 with SMTP id d9443c01a7336-29ec22ca939mr38293055ad.13.1765401997270;
        Wed, 10 Dec 2025 13:26:37 -0800 (PST)
Received: from [10.237.118.45] (M106185144161.v4.enabler.ne.jp. [106.185.144.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea040376sm2629855ad.72.2025.12.10.13.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 13:26:36 -0800 (PST)
Message-ID: <bc7784b8-b63f-4739-ba22-2fd7e2c23928@linaro.org>
Date: Wed, 10 Dec 2025 21:26:26 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] media: iris: Move vpu register defines to common
 header file
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-4-8d11d840358a@oss.qualcomm.com>
 <4pxuzfdcwr56gtt4rjgodvtmf6cgprpb3czyrqjktx6qk5kryb@njj7xwtnnjpi>
 <4411f6ee-478f-487e-8f95-bf0959363e97@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4411f6ee-478f-487e-8f95-bf0959363e97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2025 15:47, Vikash Garodia wrote:
> 
> On 12/10/2025 8:33 PM, Dmitry Baryshkov wrote:
>> On Wed, Dec 10, 2025 at 06:06:02PM +0530, Vikash Garodia wrote:
>>> Some of vpu4 register defines are common with vpu3x. Move those into the
>>> common register defines header. This is done to reuse the defines for
>>> vpu4 in subsequent patch which enables the power sequence for vpu4.
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>
>> You have missed my CdB / SoB tags here.
> 
> Sure thing.
> 
> Bryan,
> 
> let me know if you can add while raising the PR, or else i can send a 
> new revision.
> 
> Regards,
> Vikash
> 

Its fine b4 trailers --update will pull this.

---
bod

