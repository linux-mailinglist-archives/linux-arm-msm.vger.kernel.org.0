Return-Path: <linux-arm-msm+bounces-39574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4759DC2F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 12:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A6C7282169
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 11:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272C9189B83;
	Fri, 29 Nov 2024 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AjpHBu4u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552C31991D8
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732880397; cv=none; b=LwPNQOxKwnI1Ab1TQ1aI3VnziqRcKylbGCUHNq90gDneMfhiAyGh55MoFD0D3278+biBCXAek4Dd9kf4XNkRtZRsktq8Wfhlss4w93Q1fjRcmbtXcznnZdDCUowbw1Y3yUHjSDz7+jEDa/M1H3bIOQuR7OyL+qD5s0dacGBkBjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732880397; c=relaxed/simple;
	bh=cr38zkBaIT5J6Z54vSx7eJQHbefLFUPKhgXZ94YH81s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWxrrbfSBsTkPjYixObQJUnt2+wt1EZz1lBEdhO+tWALt0sHZNkaGeI4b4XTBJAHqh4e8KivN/91U5o+s1E17+B5pe6OyxKjZprmxsmxplW2VHTqH3MjsInWA3Ogv+yzSjg7IitVv2ODndriFhVt0QHLOI0Dom2TzKpnM6jQ/6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AjpHBu4u; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38248b810ffso1436795f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 03:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732880393; x=1733485193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fDfyMtdSo8AvHdVzO4O1MlF8b1Ss9UAULJbg4XvzTh8=;
        b=AjpHBu4u9rhAE00FlDaNAH/5Mwxo2iIQoDe5z5kUSGEazgJNZrYunsY7y0bKqqW0Sn
         NHSBMkkrX2oNYh37p+zjjKb0WA+g4e4tO5qvHKeXrzMgk9BjdkbTNYBB3UVTeUncS2EM
         N3PjaoNbb4rnU6vjoUTgaALfX1h1WBIR8v0IPCyP2UIKWm/95Vy92E19gvIGpLFi9Abb
         sDr5yk6tAnPKwsSwK/Oe3OeP2TU0TMYLLhdzictdYtbqXsC7SVPtwdoYuU29wTaoQ2JQ
         /zKP/zc+iSl2eI8Vt6arObBzJDUxYGQIXKBxdeG+f6lfeo93yeyDvgN9dJEE7lnuzQQI
         dMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732880393; x=1733485193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fDfyMtdSo8AvHdVzO4O1MlF8b1Ss9UAULJbg4XvzTh8=;
        b=hiOBJ3S8p0bxaUMXjvjFKEyPCmGT7Rjj44ByyS5wisuRHojoGWg0y2jX4S0urcOb7Y
         EZ0PMmgQ3qJJoSb97WUgxwVzEAMjzlpI+SptgoGoOQGwnxVkm6FZR1JtkKQpwJlHo8G0
         9wV4ZQUjy0qshi/syC4QUAlT+bz5KFqiD4seids56jXH8mhbk+IF8EvidTREnEhmr5Wz
         BTaDj8iZqt7eJrRZqXMWSgiUmeE6AN5Ae9k15UD2VoPOmI1QAFO9CdNXNR4NgXa4galw
         37PO5Q2FwjHqMSCPFKMOa3/OJCVzADYu1ZddV7H/jFXTWg/ZnIR5ieCCwKBFPXMS+Ytk
         1V1A==
X-Gm-Message-State: AOJu0YxbsjR+Fgj/mCJLi5oRV0rwjo12tFmbIzL9Y6PpIrfWpEx5Q24b
	75axTUhBpNFaPYclpkl+Zuei8vfmrPfA680E3B1+hkFEuGmyukxNePjRCWDOjxA=
X-Gm-Gg: ASbGncv/7q5ikJkGSHKHUzk/gZwvb5z5EoHGQ6fbg/+WzIcjhCaxB6Yifl1SlRwRsox
	6Fi6B5v6mXFnU9R7qiCDB2gopf3jm2C+6c2BJ9ynWr7gNup7HEkqK7rldhi48i+W5paAkrQvkQk
	K+Sy85nSN/GBwaqgDkHBJCDpTx7zx2gFxxu4yGqrimrhp6JzzJC8Ibgm/Dfw6tA4G1BHssi5o80
	vhQfgORI5h3Dya31FdzD/BitAk4eSdJ0KCtd/uaghvXaV0Gl94ya3T2LWlOShI=
X-Google-Smtp-Source: AGHT+IEyCt4PbCuXKWOIZUqCNhrD2aNU8Qj8+H6sBZhSb8I+snk1v4CY846kHV0DiDgBD5wLzt7EvA==
X-Received: by 2002:a05:6000:4013:b0:385:cb5f:d79b with SMTP id ffacd0b85a97d-385cb5fd7b4mr4566727f8f.18.1732880393665;
        Fri, 29 Nov 2024 03:39:53 -0800 (PST)
Received: from [192.168.0.31] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b9a9679bsm14842385e9.13.2024.11.29.03.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 03:39:53 -0800 (PST)
Message-ID: <7cf4ce25-742c-48ff-99e0-bbbaea370e89@linaro.org>
Date: Fri, 29 Nov 2024 11:39:52 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] clk: qcom: common: Add support for power-domain
 attachment
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org>
 <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-2-ca2826c46814@linaro.org>
 <9b9bf718-b5a5-4fef-810a-1206743495f6@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9b9bf718-b5a5-4fef-810a-1206743495f6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/11/2024 11:30, Vladimir Zapolskiy wrote:
>> +    ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
> 
> Please make a call to the function like this:
> 
>      ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);

Passing &pd_data will cause devm_pd_domain_attach_list() to cycle 
through the power-domains listed and do dev_pm_domain_attach_by_id(); 
instead of dv_pm_domain_attach_by_name();

That's what &pd_data is passed here. You want to have that simple 
attachment of the power-domain list.

---
bod

