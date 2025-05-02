Return-Path: <linux-arm-msm+bounces-56519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B13CAA7495
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 172FA1B64FE6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EBA2561C7;
	Fri,  2 May 2025 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YD0FCrbz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD63255F5B
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195099; cv=none; b=OOAtC4DBmEkrzEXhDd8cIngC9El5Uh5k93Z2HT/HNp4UXrAumOKmI07PuEqX8WLU5hcYB6sa1Yu2ZFxy1QzwLVcniSMrf80KEkWjoFUWjv68GnIQEBl8bpWbLsLcupyxwMBRsFsbgeLgEfRuSKRxEU0Rs1n967/8+zqB9BQkS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195099; c=relaxed/simple;
	bh=yIxrVkU4SFQ66DwToqGuNlKqd5dY6/8jM/wyRARXfyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2RgJ7BxAh0zbA8rV5U7+L4IeqmRlz+eUU3D2lCbradnCKsV0f7VP0MPp7hyzInU2U1c7r1X624ROon7h1ESheuJfhHMZZRNck2WIk6MIbhECIDAqV52nBlGwL8tDGgbEqBQK1V4HA6pWk7kvIc5qp6prqJ/7g8CexziOZrlTSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YD0FCrbz; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ace333d5f7bso369587266b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 07:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746195096; x=1746799896; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yIxrVkU4SFQ66DwToqGuNlKqd5dY6/8jM/wyRARXfyA=;
        b=YD0FCrbzKXq2+J2x4Rcme2ozK3eFo4u0VIcHUYKLCvz4iNR79O8ClYduTKwRNcyqaw
         bXfiWU/HISaRQTGl3+5YiTH8Bn+C/UA3AfmXKSAZhQGqC3w2yI7tWHr8Erm2y68sfehE
         spUNbVK2CCXox3mX3/cjje+6fCpKZ+OFr57nh02U9astSB86upmsB9tQ6Ah7WVJ0gnuB
         Zk+UoNj2VfPGePA18Gq9mklX40U3NKRmbWrYI93hWENAlxFN1uFh89syUJA295cyrN36
         Gi7qUZfun+1RCkxTjX0potqKDlk1mwNhLmrdS5btewlFex6spsP2zqpBafPZ2RIKURBm
         HmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746195096; x=1746799896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIxrVkU4SFQ66DwToqGuNlKqd5dY6/8jM/wyRARXfyA=;
        b=Vn2A9Q9B/xo1oI0TrzEYxuEtoZyGJpQ8hRn3x+noYJBDCgYDuKzEgq9WU1w8wh9kwW
         qSLFz5PjSfTjT5741lvr7SmdN0G52lb2ZNC+4JhiHbALafdxUnr7dtAyK+cjtKnL5URA
         VBC3U9+22M6KVUkcmKCXqcLXcs7IxqLdPg9eC6AdYUKITtfqfAd1hc/XIfgKGpUZvF3x
         B2k9/zjZbJE3fYELukaMOMWMszY0m09Z75zONsZY8OwfxjiS1gI3Dbe89ya9Y/Rkiroe
         phvV14P4EKWDnrl0gNd+IBuueX1bv+liOq6xgttt6zwPQlONmiwsUSg6hpn7ouHoSD1k
         hHeg==
X-Forwarded-Encrypted: i=1; AJvYcCV2P/3gIOssHPrpWXYvhItij4RRMPhr9jJfq6jZe08ndiSyJKlAobu8/0cQcsm69/P2p+uCQFVHDMSKC99g@vger.kernel.org
X-Gm-Message-State: AOJu0YwbetWKiH0lF8ek6kiJtP22J+1rpFRZaa25vk4OgH+zjAQBI235
	4XNRz3ZvcwWF/1vFet1ZL3mB9fIYdlK/0kPdcN2vR9WP+s+MmvbrMhUipjpo3QWUrN+WgmqO5t1
	dYBLjLRo8hXEXITs65NTCeRVYAlaFSmIJbCeq+g==
X-Gm-Gg: ASbGncvo1kRaVxpLtvSTT545K+a3z1jT3GQ7ipdBZzyzIIRWWVCq67ZHPhWkBhbE/Wj
	QIq5V1T3rKpLEsNU4WoEPXD0iIca4wgviLn+ZNKywjzbu6rO1SFySH4IHVCQV+6Q1b0zmTR8rnQ
	EDCyfLVOnblj3RGFKfXbWJFGDo5AOzAStQ
X-Google-Smtp-Source: AGHT+IEs1bTD91IQNhCNs2cmGXwwVdvucdgeJR3evc2FFZN3RtZBiPjhHMCBSyUR5aj84pE2Qt2l2g6KYv7IB3kEAbQ=
X-Received: by 2002:a17:907:74a:b0:acf:15d:2387 with SMTP id
 a640c23a62f3a-ad17ada7132mr329262566b.19.1746195095856; Fri, 02 May 2025
 07:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502031018.1292-1-quic_ptalari@quicinc.com>
 <20250502031018.1292-2-quic_ptalari@quicinc.com> <20250502053758.utawzhq6famwenc2@vireshk-i7>
 <8ba02745-378b-4264-883a-b99764701d0b@quicinc.com> <20250502081402.yjagnnjrfva7u4cb@vireshk-i7>
 <e1b2029b-2461-4cfc-a6b3-acdf5e01c289@quicinc.com>
In-Reply-To: <e1b2029b-2461-4cfc-a6b3-acdf5e01c289@quicinc.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 2 May 2025 19:41:24 +0530
X-Gm-Features: ATxdqUFgSe5sdPhV4tcbtGto6wWWIR8JrD77D7tcOXpnzioIpQJVJvx6MOBRrS4
Message-ID: <CAKohpondRqdfqC3CFSJibL2om8_Bbds8k5Dfu8fcZDksNxQUwg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] opp: add new helper API dev_pm_opp_set_level()
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, psodagud@quicinc.com, 
	djaggi@quicinc.com, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	quic_arandive@quicinc.com, quic_mnaresh@quicinc.com, 
	quic_shazhuss@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 May 2025 at 19:32, Praveen Talari <quic_ptalari@quicinc.com> wrote:
> now i can push V4 right and will not face errors on my series w.r.t this
> API.

Not fully sure what you meant, but you can send a V4 of the series,
without the first patch. Please mention it as an dependency in the
cover letter and that it is applied in the OPP tree's linux-next branch.

The one who applies your series needs to apply the series over the commit
in my branch to avoid breakage (if your series is going in 6.16-rc1).

--
Viresh

