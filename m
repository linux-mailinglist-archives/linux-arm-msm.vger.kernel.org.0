Return-Path: <linux-arm-msm+bounces-50644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D2A56E99
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 18:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D62213B755E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 17:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485FA23E35F;
	Fri,  7 Mar 2025 17:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sq7UrRkB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6DB23F26B
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741367045; cv=none; b=SjsRwGDMZgVE4GYHtCKsXf05dn/4D1FKrcjC+Sa+6F8I12XLTiWCIDmpEehOQYi5B2pdmrAwzBPBHTSixaeAuAvLQ1m7eMl3JwOn8MbAHco81xsF46wNN+eDNCSlHrOicfQNFrcNK2onUaHWbb1gNiy2yWBna4L2gxp0GB9yAvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741367045; c=relaxed/simple;
	bh=xIk78eM7xp6OoVG9TVOMJfTHgwK83vjOapawq/HRb+A=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LAXXXj9WqB9BybZ73itzTjnaNYSPNTeWJxQZOcOW0MDONz+6srloY8ls2qqPborAJ76j1YCVNW0AdEFGxjX67kd0+v0f7musEUM6mivu9i9Imv2h5RuvqnvRpXCdCN+4f6P3xK+Wb64vM41GDqMvxWmniQe8U+XTdhBuAPuados=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sq7UrRkB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab771575040so602776466b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Mar 2025 09:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741367042; x=1741971842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHN+uSouj0jmGUbo4WMlUEXMpe1K7sqb2jQWSJPop/Y=;
        b=Sq7UrRkBK8A3MN5G9Ta/4IdCflsq+KLlXzWgrkWC+lnFRPOm1hIR3FRjXVZcxlHIjg
         bcRxZu1CszYB8QwT7RuVppHIHo+7h2Wlp9cBkgIzfW0oEw9bcELFRF7gviP8GOuyFhyy
         01Es4ZwDxThiRLttRoaoJ2AK5iPC8186nCBGlUc7+7XUzOZTwWfSTuw+XKeOf5Us98Al
         /kopQUrVc/X1kNlmsbxpECb7oyaw4BYgkrJO9quwswlFE7N+wH+ntbmalaSXe+QTy7KE
         4XYy/FZi6ewC7x6kEArd8bHHs3ocAGCFXQGHexZYViIiiEHOPXg4lkrpQhcBVKaohZuT
         k/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741367042; x=1741971842;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHN+uSouj0jmGUbo4WMlUEXMpe1K7sqb2jQWSJPop/Y=;
        b=nHQuNiOZ2B/KdWeM+i1OPGbbyDGMBil5/nkSdOLyxjMGcU6KFUw7RAc4eCFPwKtWbP
         AvrOinJYjH4gWJDdy5rU7b73GFciWbq11LzMjgbNjTqaJjNOzazo5cu3sDoVpigtTQcB
         +/Vou5XqnCDIYZczljVKnthdvtKRUmb6wYqLq9nNrbHHEKxEHUXf1DYUoMf+VxDErk3t
         GNLWBg7u04i1pcCdX1CbnYsqvnI/f38mfBE0wWjc5AL+uGcBXWeHh8k3+mvTOzm9q6WB
         hc8/VNMAbwpX2BkCbjgQRYitWsX3psjhepVWwc+WuJCGmDDvcSp2wSQnCMcbtCBZwXOL
         ejOg==
X-Gm-Message-State: AOJu0YyF8RJtLKiiOnnlAWzfB2xpI4FsOhVCFRyFyEO5vUJx9KLL47xl
	IopyG4x53X/FH9gWna5KhmnjJIe4WyzHl1TuVz42gsO18teFwVz/0L5Y9bF7OLk=
X-Gm-Gg: ASbGncsB4z7lQ+c3RJLeepvkBvlDUZJtAfl9F4yXBj5zfB+9O2Zd9pWTRzxoxlcz9KS
	8jwBfI0Ps/lYezvKNaMe0E0obFDWEm2rfTkQ8LBeYmIAtvr7YJl0CcEIpHVHbf0OppmhA8XFKqH
	OlSbMRN4qV30O0O9Ue0Gw6EWFYRv3PoOvHbnXwT2hhKx+453+icFSCHLQ7IvtVkdQy3+XdyrJJM
	+S1CDqlsnnoma/1+3zd5iAJ7gfNJEbzDS6Uf6f9cfcGGlULd73hbKMm9bIhRoxDE+FwRvgkPTqO
	1nxA1FFevR7cAfU4bo27/KyO/Aitykpq168xAEVLao5BRseSiWWRVFpzVvAjA4s=
X-Google-Smtp-Source: AGHT+IEQmy+3snTFo6XUAi3Z68EdUMwf32SGMsvWTVT6oBhepCzGFS3Q+CYPLOO5ESXOew0JzcFftg==
X-Received: by 2002:a17:907:6b88:b0:ac2:9a4:700b with SMTP id a640c23a62f3a-ac26cac6df1mr27808766b.16.1741367041604;
        Fri, 07 Mar 2025 09:04:01 -0800 (PST)
Received: from [192.168.68.113] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394825adsm308028366b.56.2025.03.07.09.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 09:04:00 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org, 
 amitk@kernel.org, thara.gopinath@gmail.com, dmitry.baryshkov@linaro.org, 
 robh@kernel.org, krzk+dt@kernel.org, quic_srichara@quicinc.com, 
 George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <DS7PR19MB88836DC6965515E12D70BB2C9DCC2@DS7PR19MB8883.namprd19.prod.outlook.com>
References: <20250228051521.138214-1-george.moussalem@outlook.com>
 <DS7PR19MB88836DC6965515E12D70BB2C9DCC2@DS7PR19MB8883.namprd19.prod.outlook.com>
Subject: Re: (subset) [PATCH v9 0/6] Add support for IPQ5018 tsens
Message-Id: <174136704062.10922.6561617829094107048.b4-ty@linaro.org>
Date: Fri, 07 Mar 2025 17:04:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Fri, 28 Feb 2025 09:11:33 +0400, George Moussalem wrote:
> IPQ5018 has tsens V1.0 IP with 5 sensors, of which 4 are in use,
> and 1 interrupt. There is no RPM present in the soc to do tsens early
> enable. Adding support for the same here.
> 
> Last patch series sent by Qualcomm dates back to Sep 22, 2023.
> Since I'm working on OpenWrt support for IPQ5018 based boards (routers)
> and Sricharan Ramabadhran <quic_srichara@quicinc.com> in below email
> confirmed this SoC is still active, I'm continuing the efforts to send
> patches upstream for Linux kernel support.
> https://lore.kernel.org/all/63dc4054-b1e2-4e7a-94e7-643beb26a6f3@quicinc.com/
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: nvmem: Add compatible for IPQ5018
      commit: eb7eeabf64d2b2ea3ae562e85f09fb2593a6da2f

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


