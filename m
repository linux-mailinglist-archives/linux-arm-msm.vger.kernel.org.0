Return-Path: <linux-arm-msm+bounces-46878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4662A2765E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 16:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DC907A278C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 15:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC3D2144D5;
	Tue,  4 Feb 2025 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mFhOkdnC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328B2144DE
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684050; cv=none; b=uJ/EvXeFjhuShIq7RNhGIanY45wCMDAsQOWOSA38nxRhne+h/xvwC/pjd8n8dcHnDR1UUyw+TWYoBex9GCH31UVqCvtv1AfRzf4HD/b+u1T8uu3Xi47bXBusXbHTRBdaNrmwn7ZMQl6gfOun6LIkqwpzoN3MRmLjp5TmDdjtwS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684050; c=relaxed/simple;
	bh=oSEZzHfaKPwLFssOfp+qRDHcONqvIX5R7VrfWB2De1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYBmnAzB1uemDFYFOJW5AvK3rhlrxbw1suZOWkeW8mVRpqbdTaZG1pjOPaHx5URCSu2gfVXdAFvknf66O+yDJepLKrunx9nWvh2PVjxtTK3yvBJ3i6XB5OPw6QkWDlXcCl9DzbIzeeMIIBRouJ3+vVEDbAoy+stYlGodHPq3yO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mFhOkdnC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so8556215e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738684046; x=1739288846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w7UCbvi2PPQx3TM0v1pZVF25QMSWIykhxRAhE4s51Kk=;
        b=mFhOkdnC61847kEi2WjhEAlwTeznNcA8ABRtEKwB2GA6keR+GljvURayj822Md0m4H
         r2bKpfFieMD7THOdeUPaYoP5h4/0yi+kbLoIGqoWYzrv5Fi+wtwu3cXwGFskZu6gbOzE
         gYJTY2BlqixjDFiyvO8/OhgpguEZnN5CzwJmpEcI1z8S7BTNgikBJhD7IfFivUtLoLze
         K1VMrtREMiqM+fDl4P4gdC1sDmDbpJj5e9oGC2zYx/bI8Xh8h74FwDAMZmtIaiHBT4+t
         xVbw+EGi98H4X45oHkjhB3SOrw8DcBDn8WHMC1MQrqF+j4CgYz70j5wnEsOSZug4fraB
         mmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738684046; x=1739288846;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7UCbvi2PPQx3TM0v1pZVF25QMSWIykhxRAhE4s51Kk=;
        b=lrGUnECigs6hUwuTvzg7OyZfMo/NRszgBgFvZO/AAEv2eBLvozjlUdWGYBj3X7TAme
         jTUr/7ifvX4iP1FpP+9hhyxphB/ejQhzFFSQmABPQ3Z0Rys24pmMJy8eJAFzwJvA0XFm
         Ig4m1QFlhxlVKoURnfG1l67puGc31tpzRN+MyXrWZNFKttngmTplJPC8NX7w+3uidNEk
         i+20ib7LzIOs8dmqJtB5PXv76X8DoXmWBR8on+eGaY6d+YVaSXo/s06Hc/Su1vs+8rsk
         PWqXwSmODL9YnhWpmH0sITiwHxZl3jkBjvlIq8DNvW9AgFwkGKVDQfbC9dGVPrlUeiSg
         fNjg==
X-Forwarded-Encrypted: i=1; AJvYcCU+zIlQQaEFnFSXDoYbilYHcNVG/HJQ7dnqasut9kbDmPZWy0I4v0z8CBBE26j+rFYywtDtkuONeK/ez0ld@vger.kernel.org
X-Gm-Message-State: AOJu0YwcDdRYucAolHXX9bo8hKDhD+qjQKk7bZwiikHLrMPNVmsdg+0L
	w+Z0t/e7xVYitvoqOJ1hWAs2uXUat1b0shr20JG9voYgUx6apSN9dP1HOctrcIY=
X-Gm-Gg: ASbGncsyAPYSQSEeHYvT1ChXMaKw0iE+oFWbw2T9M/P7wX4A2nZPm9wr0GtD+PZWTZ3
	BlbE2bjhMXIJfTzVE6rA46RHsBUZb1wjP9O7nD0wd/moifyntbnWdQIPVoOIhgFhNqC+QdgExGt
	J3/PngGoG9GB/9Uyj+VijUFvcXu6JRI6tbjQGNkotXMyVVxezJR7MoZ9RtTWk3QTPwe3xV/zL04
	U7vaWRyNfKHxB88PUrSZEbMhmG0XSy1UoSP8kcQmbp3mZdtX6aCcKQc17D7PZj8RrVemHTa08ux
	oNZba/bVXTzwntPHFL5oeGqC4zZPnQo4V2c=
X-Google-Smtp-Source: AGHT+IHk8t2kGkewf9miDARDQEDhBHmDwc96pGOFGgRiJyAeCiaoi7Ir/rPT4MfBpFGIq6J/A1Wu3g==
X-Received: by 2002:a05:600c:a41:b0:434:ff85:dd77 with SMTP id 5b1f17b1804b1-43905ac4d93mr13292555e9.3.1738684046304;
        Tue, 04 Feb 2025 07:47:26 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ece21sm15905008f8f.20.2025.02.04.07.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 07:47:25 -0800 (PST)
Message-ID: <25b58de7-b3ff-4d85-9db3-1b1eb0012d44@linaro.org>
Date: Tue, 4 Feb 2025 16:47:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>
 <c5wtnqiucrfplq4655wk4iiwlxm42pdwozsqohffu54lifpbme@pnrqzul2cx2f>
 <1fdf132f-085d-4420-88c0-bdbe87ac2c74@linaro.org>
 <iygq2utzftqrvekz2mm2nnjriwvbtnpskbb4th3wg2jczfikw3@5m7cttkxwenq>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <iygq2utzftqrvekz2mm2nnjriwvbtnpskbb4th3wg2jczfikw3@5m7cttkxwenq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2025 15:27, Dmitry Baryshkov wrote:
>>>>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>>>> -	void __iomem *base = phy->base;
>>>>  	u32 data = 0x0;	/* internal PLL */
>>>>  
>>>>  	DBG("DSI PLL%d", pll_7nm->phy->id);
>>>> @@ -635,7 +634,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>>>>  	}
>>>>  
>>>>  	/* set PLL src */
>>>> -	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
>>>
>>> The mask is not defined, still.
>>
>> Why would it be? That's old/existing code. Commit is doing only one
>> thing - fixing something. Not introducing some masks or defines and
>> changing hard-coded values into defines.
> 
> GENMASK(3, 2) needs to be defined in the XML file. It was not there
> beforehand, you have just introduced it.

You are right.

Best regards,
Krzysztof

