Return-Path: <linux-arm-msm+bounces-54512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E6AA8B914
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41A85189786D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 12:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D88E211C;
	Wed, 16 Apr 2025 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbVhYiyh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848DB5680
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744806635; cv=none; b=nGAScr22Il9+0oYCTHvNvLWwei3PfpPsoLuQT/4t+d3OHSYPxyDTzzZrKqWyApd3c/Dnu6sZKm551WEbNFnoFV/dw6dh05vF5Mq1noptD+FYw+KoF4VZWCqQr+7iRmd0esfuuvU+xXdr8ogF/myuuNipX6ji1x8VaZBSWKVqhXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744806635; c=relaxed/simple;
	bh=7Gy1XVsPqVy3jE8rob90X3GhP46KcENk/TqZx1KA2ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8zBB8wgwk7MYT4SICp1SQLkamWtescLiYnJ2pNyqbo9eajN0ehGIciNxlqU1KlOIuZT/JNZ4hQB3i2zNrXA8rRiclJ0fRVCJjJqQUgQ2kMIYVZcuWou4kDVLPusrU/JFwA2gvdC7qV252NY9nQaPVZeRYGhY6A1pk/8isgIO6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbVhYiyh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso34502555e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 05:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744806631; x=1745411431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=thGiGMIGVkipYVBXzz8o4Lh3YcuPkNg0CxEG2aMR7f0=;
        b=rbVhYiyh5mrD6Iw0iz1g/9OiDFoXhg5jm5Z4399iuP6IMg5Tujq/Ce9g4xY3bIaVBb
         gcEZOCBrvx5FxxUI/Gh8lqzAIvHf9FItHZZ6TgpAT9D4/guzuJYiJ6LFMobgmYAA5CUT
         9c1wJoqWX6dJr4y1CQ41KC51lF79xhNAZz+vsi3DxDUzUWZVwpUdTbN1L/N/RyIbJvnS
         GmSm6F2uYxW27lpbyUASYi8UnsNvkEYi8v7i0OIqkjzHnLvkwJZWQe+tRXpjVFuc1cFG
         Xtnbyts4AgxYjGmqOFmPBxwuB4yedZbSROHFfcqQ3T49o8cr6KzbrbFvEuuuxoAiNH9D
         dFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744806631; x=1745411431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thGiGMIGVkipYVBXzz8o4Lh3YcuPkNg0CxEG2aMR7f0=;
        b=urR4M4KmHQMTW5xqnWX60mplrwyyX03Lv3/NG2seEvjErWn0YeCuv05E1LFLH6gUaO
         PjwASfza8BGkOHD7X+t09D3nJK+kEjVA48mv9iBlrGqYW9cvue9JiQGIopa6klAdDa2W
         efwf3r4bK6U+0fU+bzubuUKzW9EL1P2lKkmbrsmGwC1Hlw9GawNiHcZoCx0OZvgFQ/BY
         xymLmLGmgv9kTDSLWQdrMBku7BRd7mKxVlBQj5wDz5jI869FEV5sUKek6+o4m8d8QkUh
         AmcmybTVN0yJHjMr7EkVeBn9T4iPYNAdKe9YmIqboJvbi+JBUN2Q3zlZ/1KrhW5+bYRW
         YAGQ==
X-Gm-Message-State: AOJu0YwFW2vPYT+GpjB7OgCWKQHZiEfZDYhNc64UajFWol58F53CuZnB
	TMoMotV2mZmrEKlRZ6JP/qLARPHMUMGOro5FmHsDun7R6mBIwlFBL1rcLd3Co54=
X-Gm-Gg: ASbGnctdnyFEG/Gpf2sUwOGDOGqnbfhKhuPQPHTcm5rN7PvtdGQDF2tkwaXuH2HXduK
	jAjFvO9P7GNQzIZlOVIE8Od4G8lEucmDvW/qF+qZv0y4F9rqjAQBGyyCiAseyEsTXE6iRl2zHhV
	/NWfqqKQp3fZ/Q8c4FqR6gMpvVXsNszBdYugeXMHKxHja9Y+IevQ53JivkPqRDz0X29a63CscjP
	vdv1SvXl7JxMlFnayyFTLCoIUgh5vUpouB7NQIAPUorc91GiSURGPu4xMuve8X0soHKdxj/Xfo6
	28GVTQJeEZIr+pkAdj2RZ7G712Hv6/1lCdA2rST+QleyDouFp2dsYGunNRF4oiutMINDZB4NSze
	mCNvJZQ==
X-Google-Smtp-Source: AGHT+IFV0ZUT9ojBwHgcXFzd6sA+i/GEKN9pAQWxVGmSBZdhA5mXH0KdaL62ftj/T9v6Ry/7NbUk5Q==
X-Received: by 2002:a05:600c:350f:b0:43d:7588:66a5 with SMTP id 5b1f17b1804b1-4405d6cc4damr18163555e9.31.1744806630866;
        Wed, 16 Apr 2025 05:30:30 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c8188sm20161775e9.5.2025.04.16.05.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 05:30:30 -0700 (PDT)
Message-ID: <3483e6d2-23f7-40e8-a56d-d7419b808290@linaro.org>
Date: Wed, 16 Apr 2025 13:30:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
 rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <yD7X4MYItg2wLMb5iPs1JXadfzhFB7wSFqo_hFbs6K72VbLmTtoOrnwcLJrP4WBvndDUd2eklJl3R4GRWLbl6Q==@protonmail.internalid>
 <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 13:09, Loic Poulain wrote:
> Add support for TFE (Thin Front End) found in QCM2290.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Maybe I didn't receive but missing cover-letter for me.

In v2 could you please give an example of how you have tested in your 
cover letter, if not already done so.

---
bod

