Return-Path: <linux-arm-msm+bounces-69526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F03B29FEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2077418A0E88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528171A0711;
	Mon, 18 Aug 2025 11:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qj5+Ol+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E79617A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755514907; cv=none; b=OeIkfU7feVRFtrJ8Q0cdnkymDbj8jGUkK/lm2iVVjNp5v7P+/VNaApDiqPu+JQ+Saqzg/nS6uQqjUgKuW9SxTfOlllzp1Je1wy2gTjlyaOIGdxZP//hlbLaY2YKFhJQBDm3U5ip1QYuljUaTSLMQaSnHG3wDVAuQ3UHyID//QCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755514907; c=relaxed/simple;
	bh=9TYaT7DVhh4RqpRijSCAWXM0qbM6HEJ9pElNlwj1hzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iR746wVw3SRDGLosiuUCYreX6NO9AIqtaiH65Kxn+/0RtVsdjLA4llKIaIfuLobVB6TTXwhIdeL8ml2WEMR25fsLEpcXJlNI1Q8wD7Zetgbgr8LN6YPHE8mON8qXbKWS+6CdBN7EXblVNPiv1qxzFmbPrf1egQ8VUK1XTlI9/ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qj5+Ol+U; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso21237015e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755514904; x=1756119704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ntD9YtOAPnvdnrNXErbVg7euDwQgc63GGgL/mdtMZt8=;
        b=qj5+Ol+UOphHbjBEI+W6Ame+zM5ilKmkO+tR1eRCQcR17JdDFiRLG/EAalWvPkquKm
         ZrQ8Pvs3uNkKPfjCRn47FYIelUdVnoNVdkNZU6YQa35Ran90BKvnRXxMT/fYypXaat5w
         l7eezaXcEGUFOt6JcRABbVHX0LW3EFdbjxCj75LIF+OrE6GLA2fRlzfzsQfOhv/4csOt
         XeUe/ImDc+atJrzezK/723DBlAUB+EQOjNJLZcxXmxF2v16iT8jR7pSBM4vvpxh03Yj+
         J2oMQjWC6ztgtWAtl+Q7WbLFWi3D5LTlaxAw4snOcZcEeBMEa2XdnlhWX3E0TzmVh6tL
         2y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514904; x=1756119704;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ntD9YtOAPnvdnrNXErbVg7euDwQgc63GGgL/mdtMZt8=;
        b=NM+Uts23vkrHGUY+VLSvh5BuW6hHAa9McS3pZ/wNHYMDwKsJY225wrPDFa/PPRht5A
         g4QU5DxHpJoZsdm5s+KRU7kMVpNfFKm7ZXHS++c7V+aQf3n1eD4b6NicqBg9jnfpTyTf
         GHOGyZ5LnSzmCykWhGN2+5KOBpI/Mj1YiiuzcAd0EifEUeVhMIcNakkQd2Yv7fPhEmhT
         UqTx0Ih7UKj8yvy8e7XFj0N+qBh4A/sIiwrpsCaqq98OVE4oJcKyEaMOp4v69JK4kLXU
         2ZvuBxiQBgPpbk+OSZ6OM681GlAiKVfsGJ7LFMLI+lzhFi9/l14z9C9NVNZy1K/A1CNd
         Uvhw==
X-Forwarded-Encrypted: i=1; AJvYcCWCB7rhYTBiDA+uZsYxUXLNoDlOCiAzjVflmPoPMgWHbtq+6EWdNQyl3VX5XBWtUUZzbPq+bxfhJ1EO/c6E@vger.kernel.org
X-Gm-Message-State: AOJu0Yz19l+wJXIr6SLNJNqQyik3q07JRwBYfBg1mLOWj+n73J/cOCew
	7s9bnyFHY6IWh7vElyO5c7lCIE24jAbCT7EZCBbX4y8wDTSpdeBCf/s+JWc0zCQ72Ws=
X-Gm-Gg: ASbGnctfNGvCRqtGqw2JBVcRx++LRoPMaXhA6rVV+ElUnXB6hC/dqMoatbyhSYniXc2
	haD1Uc7VhY9GK8DufgvN+rgepV9eloBskIBWSd1QCRkFOfdG6fbeLTiAIRbLinO7mlms15eVWwp
	ybRF0LXlMDZx7z880ecdC6aT/71ahfAboN9imQPgy7FiGbzwmn93L0n8OTed/Iv6j2UXMKmVjSJ
	N8nTQzMGhEoy2kJrL2YuIMUjAaNY6kgchGyfpEG9WBR70/quJJWWxT3lv19sw9iBMoG2/rSdnbA
	aLlZF+L0+nC+EcXOfvAlqUfklIvrEUbP2qNKIyLh65kfNZHZyFQhLq9/kfIocgVbaVJfdI1dVzI
	Iaw4BbgeIg8WbQYIRF9nO0/T7tfwUrf3+o50oa/pZPNSvFpDLqpE69VV1IYhO2523FTg5f9XfoQ
	==
X-Google-Smtp-Source: AGHT+IH/1MJvqzbVWRStZFWheU1Jn9W/zKSEPXOg/a1tWJXWqxadFZwQAV4W2k4siiejGTbxIOR40g==
X-Received: by 2002:a05:600c:3b09:b0:459:dbb5:399d with SMTP id 5b1f17b1804b1-45a2183d324mr86473385e9.19.1755514903882;
        Mon, 18 Aug 2025 04:01:43 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1ce9758asm165995675e9.15.2025.08.18.04.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 04:01:43 -0700 (PDT)
Message-ID: <61f9767f-ee4e-4f93-b84e-59ccd422c98f@linaro.org>
Date: Mon, 18 Aug 2025 12:01:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix firmware reference leak and unmap memory
 after load
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2025 10:50, Stephan Gerhold wrote:
> +	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);

You're not using the latched pas_id declared @ the top of this function.

With that fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

