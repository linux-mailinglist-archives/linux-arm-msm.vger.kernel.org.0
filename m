Return-Path: <linux-arm-msm+bounces-44007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B28E5A0270D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B22416351F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 13:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0921DA631;
	Mon,  6 Jan 2025 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bax+vtnb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABD21487F4
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736171301; cv=none; b=I++cdegi57kjeFm7cn52dyOSmo15JNyCLicTxlXQ5Tm9ONzI/++diHBQ3nnDDolXiIZLW8y24GQJYBvMgvR5m+ggxnVU+6sHkIkRxjBN+c2qxH4AuVOH4USRoVh67n7ENcbiBigsSK8rSZoUfEM1FPUGjJAk2tL1qD0aku28b9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736171301; c=relaxed/simple;
	bh=oEzBzkm5zhFocTIP5mCTw6jiJphJwfUoVnx1yBXuQXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urj1Gz+w/mujYJ7xs6u8LMy1NrO+EQ6i5cfzrgIW5mpi0QqFoL2enS/kSUcMwie7rSFM4e87ieKx2Glv0boQnWgXAfm+Ewc7vj6SrU4/IzwluWmM2+PPHMTJXonW0X2aQL2EFp2t2y1q8RqAG1ASStRTmkcwu9grGkFWtzUsDvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bax+vtnb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so22972705e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 05:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736171298; x=1736776098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lVoIv9uJgulHknZBzyMzt1MlYwAlZneVytRZEWgC69M=;
        b=bax+vtnb51fxJgi9MbQUr68B/1mNxfEC8PZcKGtjW9t0mHBcJ+qXdIrYq4Xm+lATvg
         nCqKZfNaCpbt8Ekx6rEULTWwKf3y+OD6QmpmSapwEu8+9N9xjVURfzDbx5WFM1dtW6sM
         xTMo8d2ZF3oviSnQrTCNXkpRSmYPl1v3ljgDHj1bCj+32a8S1WRjNJz7KPdX+fx+MQCx
         kVTM7tFPL+JKnCZdHJ3Q/RiQcY6CHBJW9h2gbVdtDXUTmknrUsfgWQqTp/Sa+H6QOiIi
         01z0uLjnsQSmcVT/vj5cKjutCQ12XuOiSW9omFDzq8EV6in5U94wQK8hSBiyqmWSTn1G
         sj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736171298; x=1736776098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVoIv9uJgulHknZBzyMzt1MlYwAlZneVytRZEWgC69M=;
        b=pn0GRa/CnC8Nrc8rVzFbmoY6A3ji5Jalsm+OxGw4Qr/REqWoKd20T/n5l+hQDtvgqq
         JbQYKCIgWnwGuslI3Zyy2i1yuff+sc/2k/QaSBD154CfvbiWleATn/+T6V8J8Vpc1Axy
         8NLzmrNR9tFlF6C7wrjEef4LwIY8xQoFOXHh4c+0vZvpfA8cDufR6vMrK3cq8DjpfF6D
         DiQV7RyOqhXH+c6Vg+MVJrBGB1brI2aQaE6bZjRrcw3Kp0fL1li7X65QERg5gDUsTVoE
         KQb1sO6DpyD0+2jyPYaGkM2lpP2axXcIn4Nd3y89+YTAjMuCNGgfMGZzUwPQrAuWRO/u
         CFGw==
X-Gm-Message-State: AOJu0YzCluH7PHGJII4x/+4mRSnb8Ym3b7iSA2B+91UoTtokQjSFL6nu
	LH2ZGiUroQ6YNbsao4w+NmOQOs0EQJIEzwknkXT5mqaMr/nIEi+QqXe7uNFhu5s=
X-Gm-Gg: ASbGncsI/FlFUggAD2/4kJNiP+DlnKLIqZQaXyetia6q1516fEpomJEQuVk3CoS4O3J
	pxa9L5JiljZZLJGY2uI8JihvqXmMLrBUEOM+9kvVngI7IQ3/zW2d9/+AfPVjnGuDPSKUrzgGZfv
	SJ21AFQBaj087kbLGOI63NJTIf3Yt2uzn78RIbtGlHWF9rjWD4E9VTtvAk1YvCcVeI6ZfkbKzNK
	WRQ9Z0uUswe5r6rvzx0PUFhKFBOBTlCTO3tPqGKuOJVZJYdWO8/xY+pY8tAzKJR9QWMIX1R/HWY
X-Google-Smtp-Source: AGHT+IG7hAEYat3gPEaE/ildT3vstQ/kEewJl1HuOcaMTZh31jxeqAKyZ98nglE+Ld3sAZwU0bgrGA==
X-Received: by 2002:a05:600c:1c2a:b0:42c:bfd6:9d2f with SMTP id 5b1f17b1804b1-436685483aamr206641275e9.1.1736171297739;
        Mon, 06 Jan 2025 05:48:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm596638065e9.12.2025.01.06.05.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:48:17 -0800 (PST)
Message-ID: <09b52f25-12ce-4864-94b8-947ef134b09b@linaro.org>
Date: Mon, 6 Jan 2025 14:48:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] clk: qcom: sm8750: Add sm8750-dispcc clock
 controller
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/01/2025 14:44, Krzysztof Kozlowski wrote:
> Add Display clock controller for SM8750.
> 
> Changes in v2:
> - Implement feedback from Stephen - see individual patches changelog.
> - Few cleanups found during testing/review - see individual patches changelog.
> - Use clk_rcg2_shared_ops, where applicable.
> - Link to v1: https://lore.kernel.org/r/20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org
> 
> Dependency:
> 1. Taycan PLL and rest of clocks: "clks: qcom: Introduce clks for
>    SM8750"
>    https://lore.kernel.org/r/20241112002807.2804021-4-quic_molvera@quicinc.com
Stale link. Newer dependency is here:
https://lore.kernel.org/all/20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com/

Best regards,
Krzysztof

