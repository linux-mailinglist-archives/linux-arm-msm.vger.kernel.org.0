Return-Path: <linux-arm-msm+bounces-40552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275059E5B19
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03B10161E91
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72AC21C9E2;
	Thu,  5 Dec 2024 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w3lwyvht"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F532F29
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733415319; cv=none; b=DgDeZickbhAts5O1cdDWR6XYWpl1JOoEtqlrJN/tGH46gTbcs1aXw6XfI6SfelucVjBsf8kH1lmsGGMxW/r955XK9/tbZcXgzb40nkLlzXksp2b2duaN7kbHzjZQHK/fR0M1DZXGVNRrNrOFIMAEsdwjuYM34MCNxyCgDBOoR9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733415319; c=relaxed/simple;
	bh=+3gG4uJcVlIlPvsLI7IW3b/75AREOrmUQVixXgnblsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvF1CoKUKVUxgpoMdSRm4hpQyb0FaXlJjkbSTsgGc7J09lL93BQ5FgXfpVOXFyAQwWzckSy6hZYH0nRLJPmTikryG4R+11yFKIyQ95Qo3J1+/HqMaY0Et8ak39sDshmuF7bjXHp3sQDgZQ62+6p0y+2V2Y81z4qEQpU4QEqFch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w3lwyvht; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a099ba95so11653185e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733415317; x=1734020117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+4sz3zUp9yAyBKceZM/QXuubslWEL7HdKcdLFSmW0E=;
        b=w3lwyvhtO1pjEyuF7+RCa07bfIDjKpD0CrUI38Hlab/rZnqp6e5LTBu6WY74hOwJ5+
         ep0fp7rarwiDxyod8Q/c1K73vijnVZ9EJSVPdfWD9xtxBObEOy8l16MFeddgsmwkLgz8
         BEtkm2I4hfsO3/7XSAs2Ki5C9EzkxfyACz1zsTrbk/GscfOhjItB5MQ2EnI70/LphnXL
         83xxN+3YbRVT0Vqdq0dtvHcI16vcdseBn07pm0xXXMh+iLj/5JivyRmIEeOQkdzIqlYT
         mwYDe5gojD18uTHE8E7pxoO+mDCh9Pu6ZwT8ArWkD5KW0iYdXZ0uMwl2ddDIosXtb7+G
         nSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733415317; x=1734020117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+4sz3zUp9yAyBKceZM/QXuubslWEL7HdKcdLFSmW0E=;
        b=m3Ez4N7UGk8XO0gXfxxgXKs7nt3L8dHx3beVr1LRsIysWLb0cHIf5PwJXSzXM/drh0
         zPmsWbwjajlCrXwoouqOdVaVE1ipK8Qmwy+2vrAsZHvHglHRP9/E9H9jo9m2ECFOgXly
         9Q5bd0tvkQe9M4cAhLySGC/ZhHk4mobkqWf38vnevvhtXd/QM9tZ8Pb3rR3C0TNPUhtp
         GwonazdiU8ya8nlF1mo2H18EzeO3ROAo7F/EvLQ1In/EkHsgOKR3HbQLS6DXg6wIfpJF
         FdkQUfAcSUvAihMJEjB0n+uDdd9tjRzHEXaP1J36Yw4youkcC4kwDWslYwDd1rZNdd+t
         dx+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbmlnjT24XEjuXwAHw6j3pj6cj6TIiodCRKXYSfEDz/ExwOvfReFlvbnDUsvNPsewD9FV/uG7EUlvTLaS1@vger.kernel.org
X-Gm-Message-State: AOJu0YwhQyN6+Ni5O+IWVct+DIfR1flIlmHh5BPlEgRhandhw/WCVf9t
	SIH5DUH10rPdjmUyWZrGd/Eg7p3o8xbYEuwM6PrPCSlKhFPri7wff9pUWDAwSsM=
X-Gm-Gg: ASbGncs4tfseqq1DXFgM3ulpghgOHeC3OfzwhpOHiJT4G3Pfm44ZGv2okaYlR4epwuo
	SIZVW4zo0atn3eATTakyTCtRnvAJcUAqqHozTdEbQfOl0SIInzlMRTtLLO4V9RcJcssrcnsv+/2
	YtJBrOiFErvC5kvXEgaOvWMk1FlHRnc335EElFHf5s8zHel6D7g2C6023sCTIBoxnSXAiB04rob
	81O/JJV7A6hs24bqfrxkPpp9MU8V1yPMFfLVdK5h3mqMuhc0Bxn2eZkPuZfQ8U=
X-Google-Smtp-Source: AGHT+IGn7Hvj07Cs0jWrqjLNAu3oDpw3AlP4WiWdrNwS4OjjHvXSuA/a+BBjhbpaScxT9yE28vtaZg==
X-Received: by 2002:a05:600c:3550:b0:42c:b1ee:4b04 with SMTP id 5b1f17b1804b1-434d0a0ece4mr77886305e9.28.1733415316729;
        Thu, 05 Dec 2024 08:15:16 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d26a3sm28879855e9.1.2024.12.05.08.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:15:16 -0800 (PST)
Message-ID: <85166c63-1e8f-4f80-abb7-5426383b4641@linaro.org>
Date: Thu, 5 Dec 2024 16:15:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] media: qcom: camss: csiphy-3ph: Add Gen2 v2.1.2
 two-phase MIPI CSI-2 DPHY support
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-15-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241205155538.250743-15-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2024 15:55, Depeng Shao wrote:
> +	{0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},

Please uppercase your hex.

---
bod

