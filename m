Return-Path: <linux-arm-msm+bounces-19970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E948C82D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 10:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55E481C20D9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 08:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A58F179AF;
	Fri, 17 May 2024 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S5JvALA+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16FF23758
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2024 08:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715936304; cv=none; b=u7f0NcBhHJD0iODxW0XMbSWPYEWRdZSmTR1dr/sfnHzcGyFuSX/1DtCRS1KJTFfTC3QZ1GbTuDo3aHg7urkBeze604JB5Q/wl4beUnOTCPIDjnDFjVdv0xx5hkqHK3K6xDPwmYHOp7eXiRucgbeWM6UzFO9fUOBJpjPVY+XLrTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715936304; c=relaxed/simple;
	bh=fh/EhHYv7kPstMXk8bNVt+vHBJv+tYraANwKXrpuKLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Axb/s2j/05Wr88ZmwpJgRB0Nv0fVegBhcj9GgKpT50ElcQ+2Cb12RSqGBtzvl7bHJGkMqQbVa1v2KgrDQPEsmsM8C8M+57nY7A8Du7AyDj6OiJFzvpXAe0aUuJ+WnKd0rU/IO+a2pngTrxxzSj1rVPQ7nTzuIHY6ZNO2z3K21X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S5JvALA+; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52388d9ca98so738618e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2024 01:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715936301; x=1716541101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXEIiwHqeogB7g3eJChPlM4JmbteA+j2Ygd7KOJ9e/w=;
        b=S5JvALA+XsizQSD+TZyYEIBf3CNIFZuinBO7TYWOlKfYtokAK2zH2d6Ds4TevMVcVd
         YVeOKMyxFT4CooMl44Z4tpPliKUpSRdxjJgwW3+YFeQu45fihGxQTidxFNlgFXtEUF6j
         2YhKT08x9cr/xnSr0pqFGhnNMb3TBB0IUclSM9e8XYSSRSjZqrkyy33XCwiGkh1hcaO1
         w2RVFWIs7W+CEcxJlxxs3ieBEDngnOZObdD8f9/lXbF7KJa9a0Gp0k4nCResfakWdw5U
         8YlgDbW0cROeUOQQE2GrBeIxdR1zYXAZbXvSRzqEnmEjRz5meseZf2KnyU2UhmKnbPpN
         v7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715936301; x=1716541101;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXEIiwHqeogB7g3eJChPlM4JmbteA+j2Ygd7KOJ9e/w=;
        b=Rdw1jETWkFiDN0/TIxC7roD9657juHL/VdcA9HRF99Y4wY9dPtDxsGCvRluV0PhLOb
         iEexgOYM03hFewe3Dbf/tHNi1Vez0XNwv/7aye1wQ3kLz1um1ba1e3GQul9FmOeDatZb
         xrxYY9bdtuv4xHHDKbLjcgDZsYXh1D9PzDahX1e5COU+ptmMwLNq9++hEpznm2t8Ya5a
         EnVRjq9QAOhF2vi2BP94+ccDusmL+2tWH16b0yb3HibAEhJncgH+LV0VeqawGBat3lgG
         lK4ZmCxKtqHCZZU6XixlypZqu+ttUd6RkSSxFNEgExrbCZE/Wzii3iXEQM3oyQN7Mtc6
         Hl6A==
X-Forwarded-Encrypted: i=1; AJvYcCVorpfXeVhaSTCrttcB6+eZ91PGWv9n9Lo8yi36dsWKjEiTp2xsBpX5tFAqSE0Zq9E6z4q3raXZDVOKNrh3B7rbL1bTOAWekMbYwalvzw==
X-Gm-Message-State: AOJu0Yx+x7Qg0cWGWYb1ooDAniXJ5RSgzcgFSa6GENfzpiV4c0KvjOwI
	NxWuQ0ANcfQV597YgDYBELXuBEJR7iTmVqgVxd/upsCWUCiEmjVX96aJ2jIWod0=
X-Google-Smtp-Source: AGHT+IHkfIzP+hj8dP0Dt3WefFPm0Nq5vUF7+ysNW0I2MuifC2v/wA6VP1/jj8rSAmxAM+Ky7YAGHg==
X-Received: by 2002:a05:6512:542:b0:51d:9e17:29f0 with SMTP id 2adb3069b0e04-5220fd7c89emr16576217e87.24.1715936301003;
        Fri, 17 May 2024 01:58:21 -0700 (PDT)
Received: from [10.91.1.133] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a69148b97sm637788566b.114.2024.05.17.01.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 01:58:20 -0700 (PDT)
Message-ID: <edfb049a-b56e-424f-bca7-556dffa6c87d@linaro.org>
Date: Fri, 17 May 2024 10:58:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] hwspinlock: Introduce refcount
Content-Language: en-US
To: Chris Lew <quic_clew@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Richard Maina <quic_rmaina@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-1-47a90a859238@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240516-hwspinlock-bust-v1-1-47a90a859238@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/05/2024 00:58, Chris Lew wrote:
> +	unsigned int refcnt;

Why int and not refcount_t ?

Have you an argument for or against use of one over another ?

---
bod

