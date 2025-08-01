Return-Path: <linux-arm-msm+bounces-67415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4602AB186CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 19:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01CB6AA215E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE9728C845;
	Fri,  1 Aug 2025 17:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cOBkt2Mc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731CC2877C3
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 17:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754069930; cv=none; b=HukNFCBjTmmysgJnXHWh7yHHwEDROgF9I92gWZ7K+0GCdyDz1rMQzAVnB8HYnAa2hyHTmk5IvBRpk9AUf0oVlX/EC7Dih7LBAyysbcCziJmlXwpVw0lATwbQ3vFbTq3kvdSqkL2TkgejteHkoUA3pIQUeBsVTeOKQEwU59xXjZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754069930; c=relaxed/simple;
	bh=aQYBObWgzoPj+il0GZKSY+WiA7phu3h4hRG7IyoJstM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F57b1frvI8V2OpRjjGP5T+uRl2FYAQRY5W2uCOzm4szzswm65QLj030ba38uMYnPnh9Yc8gG54diMmipI9j41/xRHnGoKUi451yU9Y5rt8BkkrUxPFnH6q6amyojGnpzXIIyrUYlpB7tJ7BWJ5aOu5TWrRUwan2nVlYs/+pxusA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cOBkt2Mc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-456108bf94bso7103195e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 10:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754069927; x=1754674727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bR778IDq2awUud7Ws1UQmVLj5RKdygQyf3jIFUrFC9w=;
        b=cOBkt2McV/03IDW9+r4hKBtcHGpg7/f9aR+Td/bQ15YmXGLK2X0B7wWJMRWx+gcXSy
         hUIu1olZvX/KgamkBdk2Ld1r1Js5yJnpvUeiC5FymPy9BE4KtBegaMOZqQcv//6EApQQ
         V/SirSArym273C/r09UcuK2XSUGS14+dq2OI22ZEb2iD4w/l7bDA96w/Aq7sHcmoy+rG
         dM/c5TBwaAA1Xg5dOnylHlxveDUJiiGG1v6k5LUKfz8P8RyRr9iN7L/ENWHWTztwwOTY
         GMqC86Bg8ZWUYjDy8F25xJSXmdTdFUypQzjZ0Rcho5bzaiRnoQ1C0dKV9mLbxZ8czXhS
         MPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754069927; x=1754674727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bR778IDq2awUud7Ws1UQmVLj5RKdygQyf3jIFUrFC9w=;
        b=ptGHtNZe4a7HROzKG6VyhI8uJ25uwkC9xHxCCdkg3kWLO3rc33mcC9ZR6t8U2PeYlr
         Q3+bimKYbRDMzTrSRsiRG62HHQ4IiqdO/iAAO/Lba+xtOnNcX4Pld/wUj0eGtC81B0OZ
         QSfwVEb8c1rVvqXQkX8lbxttJPfcgOfl/wRNvOwwcTwxgQ03XZc7y+Xwm9CXZu9M8oXq
         uK86emLjRHhh5B+X/hIXvEHdCCmQw83eBsfejZqG02sW/lApDG9UQIU0vZO9GXzCRVDb
         k5NUU1cZAdUZiYq2TkbjCbqnjEE3zWNyP8AfbnkLMm0mNsF0aGq5Dck62nk49ZPvLhvJ
         nlVA==
X-Gm-Message-State: AOJu0Yw55MP8Pv3Caf3s1pula2MhTzJ3bpIBjXiV2TlKvO3C7Gs0VZFd
	cRaeWdsKU+hUguxzoeJRY8x8CB3o/Y+5GQboemzW8nICsec+hH1nZmmD4bkHSCaXeqk=
X-Gm-Gg: ASbGncv9gBEzdFEFKHDrmTR4fMUdX+cOFbkW+HiVUL3P6CJdi0l10qaKhXcEkcj+WJk
	u87iNvbmY7cgz3q4D5pU5/5Fx6oa9ecg9T/lVKgODB6FxkciQOe/pN6wPwqONsR9sDb4Bw6Eqq9
	mYeEA+5CF2KUsppZJxbygO+wUEsxZiCJ+IrJBiWSx/PWuAPg+OLwsMldDBKqt4/Q5D0iBh5T4ni
	IbLnZjddoxYkQKTYIC9mut7hiKTdZX5hnWJxGd6EzhIaKrtITip6D1kQH82zW3CdotwTA2/2mJO
	UXnixd4XUPq8El45L0WtXH5EsJNs2a8dirEvpjRTgh2yAAtSCUA+C1nGLFaoJqzKh+Vj6qC0L9I
	lEBaOODztWdWZStqZTTfguseiv0hbIEfEHGFaoct257MTbRvb2ZmTH/E8lse7HA==
X-Google-Smtp-Source: AGHT+IFSgI7ynQO05ITDIMMGNQuV0NhyoU+S80DP5VZti0Les4bHUCSN7kHUohJoYSqboUd/PkGLIQ==
X-Received: by 2002:a05:600c:1554:b0:458:7005:2ac3 with SMTP id 5b1f17b1804b1-458b6b34cb7mr1416375e9.21.1754069926804;
        Fri, 01 Aug 2025 10:38:46 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4589edfcdf4sm72965545e9.11.2025.08.01.10.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 10:38:46 -0700 (PDT)
Message-ID: <9e4db85c-83bf-463e-9c6d-bc31e5889574@linaro.org>
Date: Fri, 1 Aug 2025 19:38:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thermal: qcom: lmh: enable COMPILE_TEST testing
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Jackie Liu <liuyun01@kylinos.cn>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250728-lmh-scm-v2-0-33bc58388ca5@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250728-lmh-scm-v2-0-33bc58388ca5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/07/2025 14:18, Dmitry Baryshkov wrote:
> Rework Kconfig dependencies and make LMH driver subject to the
> COMPILE_TEST testing.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

