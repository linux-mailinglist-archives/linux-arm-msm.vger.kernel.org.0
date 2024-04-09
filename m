Return-Path: <linux-arm-msm+bounces-16978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6342189E40E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 22:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9528F1C20D7C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 20:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3C115749A;
	Tue,  9 Apr 2024 20:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="roHEbCGk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB9F156F4E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 20:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712692935; cv=none; b=rCIF3m6ajASqMWHGaKG7pBIXxyjgQAq6DwmyKEnEyrTwCW5iIrERItJ0z9TRDm1+0hBvrRpWvAG0ngBM3dqCBoeuW9TFMHsqqtmXEctl+XHjKTfvS4e5slIiziN0VhYKODxiwekLZRRFaz2i5UvsYO3AkWKlYnLigUy8Og7rjvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712692935; c=relaxed/simple;
	bh=aGEvgP80CaJWM1/9QIy9emQ2jCXJLHNfSP/dEyEnRG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=akjRXpb/6Hui8KaCJX9tW75nADs+ZvjPCuWv1wUkN/ASNwQrOgfu8A7ACC/wTJ1lmdm0k153m+zu2Teozur0UVgmmjcQ2LLdLC6kjuJGyvimKwah0RtSp2AN3FmlB/HSWEmL8yi9NYMEXPwIbrvQpPsrBCCZ43bRyiao9qszi8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=roHEbCGk; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516f2e0edb7so3471594e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712692932; x=1713297732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DyzsINXpZY9PBgrwNfxD1JKuelU3Gg9cZtEW39Zyz38=;
        b=roHEbCGko3STfzPLCrHH7MshMVFEeX66plpomxq153pC0g0s4Efc+zliFwlxprqsjo
         Qbwf3saMwuSdzlvg2z0Yeg/sbmDbQ4v3bCFwyfyZw6eYmdcCwcrxADE+qbw2dm/vqxra
         SrsB4DihCoogCi0cr0h3oIvQLgFcYEczSQk0tqgsbDGFUzXxboK0uImM5VpFobOhp0no
         Qa0AsUSvuJPT284gqCllpeP0In42P8WlVfGzqh+QZVbv1m0VN9p/HeG/2I/P7mQ0hnQd
         u2ebpw4qXj/7WylJDClILvkIdsch/ryLL4YLqrpej9gd2okHyJrKJiLF2LgmF+gy+zED
         Exjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712692932; x=1713297732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DyzsINXpZY9PBgrwNfxD1JKuelU3Gg9cZtEW39Zyz38=;
        b=Td0ZG6DRwy+rdTrKrtplSy5HIFreQQyc1w263pA+Cz3BAaRQlUQf2mX+E9uJyFbVmO
         d/G4o7TXAEUFetw2sW1RSHc1Jon2w3ZYvGv+mHhgbYGhgXu3FOyMaRqgl1ZwAnhteFGE
         1uRgXIeGQcHeJddVgC1rKgIXnzwyAZlBEL7G09H7t3xsO7Utu6x3vETZmhRX0QI8hiku
         gQKuPpoN9BuxOCWdU4kyz53raQdG4DiOmHPhDXJ041e9pzJ9oG3Y+09cA3ehcJmSD/W5
         C4mAqoplPpFw+OJbfNoFVvYmJ4F9kQTIhZTeatIrTgey4QpTtg1aQhZxMKMUtBurG2mH
         zvJw==
X-Gm-Message-State: AOJu0YwhU1SuT6baTDbb5zo7lAx1YOlrnyUgaZizDLTpVgoRzq5WCZ7l
	y3pJ/DjqUM31MHJPbkNn9BvKMZslog8fGKSw6dXGWmBnv63c/3OX00eIyJ3cw2w=
X-Google-Smtp-Source: AGHT+IG/Ot54pxhovQ7R+edfRRAlDnSXlNLA2jU9yCUCUE0Qb9LHLbOWjmzbPz6C+2p7BpetLGyVYA==
X-Received: by 2002:ac2:484f:0:b0:515:8d1c:bf09 with SMTP id 15-20020ac2484f000000b005158d1cbf09mr272779lfy.16.1712692932112;
        Tue, 09 Apr 2024 13:02:12 -0700 (PDT)
Received: from ?IPV6:2a00:f41:901b:21ab:d73f:95c9:e2d4:7adb? ([2a00:f41:901b:21ab:d73f:95c9:e2d4:7adb])
        by smtp.gmail.com with ESMTPSA id i16-20020ac25230000000b00513d13ede82sm1627574lfl.147.2024.04.09.13.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 13:02:11 -0700 (PDT)
Message-ID: <a1aa0f4a-868c-4386-ba6a-9962f827bb2b@linaro.org>
Date: Tue, 9 Apr 2024 22:02:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as
 module
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/9/24 20:27, Dmitry Baryshkov wrote:
> Enable CONFIG_INTERCONNECT_QCOM_SM6115 as module to enable the
> interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

=y for console?

Konrad

