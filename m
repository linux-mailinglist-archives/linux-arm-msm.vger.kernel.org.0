Return-Path: <linux-arm-msm+bounces-14765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7AD885F62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 18:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36AE11F22DE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 17:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA33763EC;
	Thu, 21 Mar 2024 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwyjuyp+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DF9175A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 17:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711041241; cv=none; b=WOVJCiuLtU9gLRU0gGya2WryGLz0sP4tLB1bD34SmIIUPKxqn0Dp9KD7lCUlEfPCUt/CmMavbEF7e2teWvGxPe9urUcYF1bZIQX4mjsKs1Mi4gKR658qDDinc/NvXQzRC2OIDHOTtkiq89ljXoZ+GvlUB9dU5C0DycRy+wHdIsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711041241; c=relaxed/simple;
	bh=Gy9dSISYC3+iioEVBCt5B4Eh35ZBRiWCProDJ1p0Lbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxMjrciIS/w0ekVPjlgK+/zs87b3DAOXXLyMebM2rBVyI5CrBDi2f5fDgu64z7ZzCIlMZb7JcH0/9Uyq20Y3apQ6BtzMRKY2/oJmKaHeM+T5PZLZ6WMeNuTwpw40k/qiHXsApJxPzjQ4C1k1DsHFkWUQSpRgjvAqgsT2+Y7wwUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iwyjuyp+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-414612cfd82so8595925e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 10:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711041237; x=1711646037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WjLTQlvuPOBaz+D+LjUilodmD16xs/15SSgaRqgavvw=;
        b=iwyjuyp+hhAo4htDuUkMsPGWE/+o39uZTbnjWObUfd0FlsI9fYoeIG+jem5DUe/qS6
         ftI5Rrtr428hrAB2Dq1TKofkWRDYJ2I5/702rpwWm83eE95SHmlYVpc4XWgdQaXxgtb6
         nZI0g/lxPR08n5qugI/y+MbL7HJ/Un7BzI9DQB/PLGR0Y2t71h5WbAuglosQQz9E2Wsh
         lelkTiX2ryva85eObm3U7K1oWZ/7WO6V4jxDIZJqPHibSXrjeYgXhG7Prbp9d6JZm5A5
         0INKfKrntr6NC3dJL9PjlZIQ6vlr15TgsQGq11RFSfsHxec4qiWos9MAANt6UNNZLcwU
         WORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711041237; x=1711646037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjLTQlvuPOBaz+D+LjUilodmD16xs/15SSgaRqgavvw=;
        b=KRTUvXjD/adAo8NQECuVxBlkbdBfqRNnQGwi64tz1VWFq50oVr84ZnLWweG9g4yIAa
         moUFyffHikozpDhiYsKJ5qOLyjhzGCV8FvGD/pSptsdWVMuImf14Wf8CGJ+FSy1z+Vgc
         54jJZvLt7XK7fwEk3u2i1EEv43BZJL2mwiklwXCZ6bLpQ/KsDLEpVghZ3RpAgbquXK+p
         QGNtjRqyzZfB1L2UvaX7xclDDQ4u+EfxrW12ce5vxchSPyRxtEktE2d4hEOtqI4fDrl7
         NrmS9+SLHdb4JM+EzMScYX1BKN7q8gkLDLVVaFs6W3Qd3cWrQBykYOMCxIiL54wvw6Mq
         Wziw==
X-Forwarded-Encrypted: i=1; AJvYcCUxev9Dv0sosaoy3rOSTN3DpZXaTdsQcboLKimt0NZ2YDpAfurzT2kBycCZD8rSgMxdsK0iX6gm0YFmU1zr8Kny/uH9tUVwRC9WjuIx4w==
X-Gm-Message-State: AOJu0Yxr7LK/kfmS1TpekHpu1jSSKf0mt05smq6p7MRuPxH3dBycXPfL
	dUoVy6RinLulHKGM3qlMAMgjJ9wecpFpxJOjjIvYhu5u8Vqsw6V7qm5e0CVEGQk=
X-Google-Smtp-Source: AGHT+IFOV+vBJ3LYFE2xnOuvgPXYkdUnxlYzK1C2rDlHvcszqkpE8OzJg48OnEGPHHmSbsRP45KCIg==
X-Received: by 2002:a05:600c:3c8c:b0:414:6211:14a0 with SMTP id bg12-20020a05600c3c8c00b00414621114a0mr7243975wmb.2.1711041237531;
        Thu, 21 Mar 2024 10:13:57 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id v9-20020a05600c470900b0041409db0349sm333276wmo.48.2024.03.21.10.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 10:13:57 -0700 (PDT)
Message-ID: <f17307c3-9996-4189-b326-91b0ebf2e56d@linaro.org>
Date: Thu, 21 Mar 2024 18:13:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] thermal: qcom: lmh: Check for SCM availability at
 probe
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thara Gopinath
 <thara.gopinath@gmail.com>, Amit Kucheria <amitk@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable@vger.kernel.org
References: <20240308-topic-rb1_lmh-v2-0-bac3914b0fe3@linaro.org>
 <20240308-topic-rb1_lmh-v2-2-bac3914b0fe3@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240308-topic-rb1_lmh-v2-2-bac3914b0fe3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/03/2024 14:15, Konrad Dybcio wrote:
> Up until now, the necessary scm availability check has not been
> performed, leading to possible null pointer dereferences (which did
> happen for me on RB1).
> 
> Fix that.
> 
> Fixes: 53bca371cdf7 ("thermal/drivers/qcom: Add support for LMh driver")
> Cc: <stable@vger.kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


