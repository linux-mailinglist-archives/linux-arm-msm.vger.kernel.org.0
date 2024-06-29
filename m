Return-Path: <linux-arm-msm+bounces-24729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFB391CD27
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 15:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B48C1C21118
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 13:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0217BB01;
	Sat, 29 Jun 2024 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BRwOZJI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449521879
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 13:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719667844; cv=none; b=I/0rllmc8XUTvY7Nz3K7VzXIEfJCHGVcJbz2E0EONfF647LsMC7FJghGDrMRTFrie8tLp4lGs09WoQzMFLLNnE8LzL8+7i6Gyeu9g0RshGsduMqVGe/6AmT50sJR43r5Mws6aD1dVs9ROJBrAgkKxutPttcHeX6Ppg2SLRvC+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719667844; c=relaxed/simple;
	bh=SOSRf2xGbABYyJkyrOzqdHzZoZvGbDKQu4Io0KKd4fY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=C/GUFy9sDrJzzX9A5QJDqo/ZD+HNdbYdI36uHopDKZPuCth5K84bJUPn8uG+lseMMHIuNdtq4rvHXbHpKWsOQIoXrR4BtPfproNCZvDod2cb6lRPsK3YQ9yLGE8GoI35cmtRgeQU+RyN8esRL5Z0KawjWLKDMiLi2bhzr82jZmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BRwOZJI0; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57cf8880f95so1854479a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719667841; x=1720272641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CEplqgc1EUkrDgRyxKM1jdjFJoZG/7QBpRIZ5p4DyMg=;
        b=BRwOZJI0Xnfwvf5YKZ2EILQPoWNVohSRmYbpOpooDMn2cBYr3xq8kvocTFbYrY1QOY
         3LqKWPGVraMt7vSwaCLGrmNqVAE0rFl3KKHu0iG8m+lBcJf8RJghaEU8XwcVpZSU1a/h
         I+4cnaLKs9eBF5pWGwD/QhvCWKRp9JbA+kLVXVRfOiNZAp8/815LxEd6dJfM6xatqzSz
         x1BFPUknWdIfFi5bpg64QzO1We6DDhbnwFKP69tuqzxlNRiXI5ASGMX1WsFXS1AxBLcS
         cDV0POA35OkBstjiF6tko4s5DFIjPRvH04x+SK9FMTl4HzsJofalg1yRdKbZCV0E6q4j
         gMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719667841; x=1720272641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEplqgc1EUkrDgRyxKM1jdjFJoZG/7QBpRIZ5p4DyMg=;
        b=Vrhq7pXCRGf1dw0uR25rSjHYhxWtBdG+B1kZM+6oR8ChHTbOoqLzeWJypZDNkNyCgE
         j+xOH7TFVpHtFU5PSAWC+w4HG7mnlfxswTpBGTu1ouI5DUaIj+1Vocov8tnOiZfLeAXg
         j5QWIEdcYrBJQ5tUGf61vnRHcacJooDo7N3U7UW41mDCYVpX0gpKvE4s9algviQASt7h
         l92bd2/GlYzA+mWNi3+NNZhcQYTZX2CCmdG78f2KAzBUo1/JDtaVTdjit1PMvmZIr8bm
         lfnhyMdWMU2XmRvifUQbT+50Fd9sQ+AdHTef7mpVpM5a+KtJq5FQeVpH19kG3ZML7d22
         d6zg==
X-Forwarded-Encrypted: i=1; AJvYcCWmh0g3833Qp4goxlV9oErErTiC2yWHgiwPm+k59zWUXSU2gR6rupm9/g3J5pVX1SK5YOoijuTln73QQoIlAR3Cat+LA5s4L8DqNAErHQ==
X-Gm-Message-State: AOJu0Yy51RBEMwhQrEnh1JBlnDtEuLrxhTWPhI4rjxXvhSGZLuKYuOm7
	vtpmmR7HUylMJv/yZTwmBl+zX0WEj4reYsNmv9phrYenZII+iHQWQeOkaIFLFeE=
X-Google-Smtp-Source: AGHT+IFjYFA5Bwi5YkXtp2KPgMk/XhRypC3d/N4WcAg/MPXc1RhesuL87S0Eo6vXB5XJD873lymEfw==
X-Received: by 2002:a05:6402:50cb:b0:57c:80bf:9267 with SMTP id 4fb4d7f45d1cf-5879ede2ab6mr801572a12.6.1719667840341;
        Sat, 29 Jun 2024 06:30:40 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614d504cesm2248129a12.71.2024.06.29.06.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:30:40 -0700 (PDT)
Message-ID: <8ffd8a3c-83e6-4753-8bdf-7daa3a3d8306@linaro.org>
Date: Sat, 29 Jun 2024 15:30:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 6/7] arm64: dts: qcom: ipq9574: Add support for nsscc
 node
To: Devi Priya <quic_devipriy@quicinc.com>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, p.zabel@pengutronix.de, richardcochran@gmail.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
 neil.armstrong@linaro.org, arnd@arndb.de, m.szyprowski@samsung.com,
 nfraprado@collabora.com, u-kumar1@ti.com, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-7-quic_devipriy@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240626143302.810632-7-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 4:33 PM, Devi Priya wrote:
> Add a node for the nss clock controller found on ipq9574 based devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---

Title: s/support for//

You're adding the node, not the support for it.

The nodes look good. Looking at the driver, the interconnect paths that will
be sync_state'd away due to no consumers don't seem to be super critical for
the system, so I'm assuming this doesn't crash

So, with the title fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

