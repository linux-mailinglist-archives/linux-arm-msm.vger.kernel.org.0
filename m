Return-Path: <linux-arm-msm+bounces-29179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B7D9596C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 10:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74DAF1C21789
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 08:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541121BAECB;
	Wed, 21 Aug 2024 08:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BI1/cM83"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FA519995E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 08:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724228115; cv=none; b=fFQ7346bwpAotVICkIxmf15EiMXyHc8e70M+jJQZhP536S+Ka368zO7V84MnckIS2HKrMisB6iPBI9saIpg7yPXL/wn4eLr9h+wZhl1I3cxbVd8Dy+g6QU5xNcXlEiXAmGbeAVtpsSwDvNLtCCtxW3cpDm/pTvFKc1xBswAET0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724228115; c=relaxed/simple;
	bh=XE0jZaV1bsQLFaKIGXsuasTneDpL4Wem+LHKumho12g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jyiSxWar7Wy0IDIROKhlOKfrqb6apBMSr50AtWYwJvNRStfGvB9VSDdBi+HtkvExxUeW5s0F1qMq5qoV9d20thouC0gLXfAw0WTTX0fCsoZ++eAk6ZodfmXZl+Z8kiNs+9No1PpVsv15fenSw0VAsCwqRN8u35p7QDHnJNpAC40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BI1/cM83; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f3fd60259dso39531fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Aug 2024 01:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724228111; x=1724832911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLQxZaDHXJrPQN9Tiz5uh2v94UZex1BBfH/Lta1m/ek=;
        b=BI1/cM83y3el+icqDJ3ixTrQeY3yxevpMIQg8KJFyhrEhRS2EZS8ww/TvwpA+UbfCn
         PvL0U2NisS2QhIuP4LeSBUNKfXsqgSnmHGLFcNKVVs93U5thiaXK7ivQqhqNCO1gS7bJ
         xJg7wRenSjEcWrzdKhLgUIVSFIk2GemVdnHeYOrkY7SnZD+SfdbkJP7yQyklvGDeK17l
         Lj8yWmy4EFmpN4I81rWTrcSzZpJLttlBoHp3kBhVjttH0hr4qZthXuZLYvyX3lTQb4uC
         ioo4EOWJPzuFYur0tBx/nIdZVnZZLveAmB+3mhSNLKqhifsk4XodocAGJ+/s97bNS+Xa
         v3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228111; x=1724832911;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLQxZaDHXJrPQN9Tiz5uh2v94UZex1BBfH/Lta1m/ek=;
        b=Y0Ap+2Pvm6TueMyxCEDw+DwrBvh4spk/lXqQRy4woGd1PaA7QD6gLA9b+1JDlvwHcM
         /yWQ/ApM6P6jvMun5MLbv8iiqUieIa3M7hO2FHzad7peC4G7Ta6cMZ0PV16JQE+Lo2C2
         UL5TUV2kqDqirf1QAQFZP+B3jRh+IR+hkduJubah3BFo9EMG3EllSLfL6qTn0cd+IJBZ
         ju47QOwUco26DPHaxiZBNU/muvlrWJZJ42DxOAxN90pV8QsO80ua4sQgKAJP/D0jJUK8
         2ojttdmM/a8jc8KuGI63nF0wpaui41ENhcm7G7kQ6iteDn5l8zZdy3AhOdALbHyhKV4K
         ZxAg==
X-Forwarded-Encrypted: i=1; AJvYcCU+11VRr1LQ+oMm/++JRzUTtdIh/0iVGu4uStI4S2/y371ZwxVaoQ58VkMU57tJQ+mnQQ6RYBrlx23QU+ZQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5UE7UwJ9AxZkjxHOXe/yr1roQYzo8peHYEfvL76caQzk9S1mS
	vY5Lcoe1i8QXOUMILp0f+9qF1vzsgBJMnc1vmgZsirtmn6pDttWIjF5KoqNLoho=
X-Google-Smtp-Source: AGHT+IHwGVModb5n3Ag7Lp6ROvPNQaj3qlVCWPrtnMJLfrMtrIhJSpR/hueQce6mez3z/hc9UVwrGQ==
X-Received: by 2002:a05:651c:212a:b0:2f0:1a95:7102 with SMTP id 38308e7fff4ca-2f3f894b8camr4547341fa.6.1724228111050;
        Wed, 21 Aug 2024 01:15:11 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f3b774969asm20014121fa.131.2024.08.21.01.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 01:15:10 -0700 (PDT)
Message-ID: <b4b9bdd6-75a3-4b37-987d-a4125babb783@linaro.org>
Date: Wed, 21 Aug 2024 11:15:09 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] media: qcom: camss: add support for SDM670 camss
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240819221051.31489-7-mailingradian@gmail.com>
 <20240819221051.31489-10-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240819221051.31489-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/24 01:10, Richard Acayan wrote:
> The camera subsystem for the SDM670 the same as on SDM845 except with
> 3 CSIPHY ports instead of 4. Add support for the SDM670 camera
> subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

