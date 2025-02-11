Return-Path: <linux-arm-msm+bounces-47546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B3A30853
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 11:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8CFA3A2167
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C561F3FE5;
	Tue, 11 Feb 2025 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbIZsUL0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E171F3FC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269155; cv=none; b=LXKgwy+htlJSDJSLfvF0a6d4tOLgTp+ZBWLvS3Khngfpz6mTQmlxB+FFBLzL7n8YFX0AjXYk9vLOApuVU2pk4SiNAc8OSoQ4IJ/ELYf2DXMChU471wYDKCmD5qmIkauvAG3mxLjJSdhpncq1NKKo9MmpzMKg1S5rrczcjwAdsFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269155; c=relaxed/simple;
	bh=mmYq0ka1rA31PoqSV1w1EnHuELlMe9cDQhIVsboEH4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5dITzbiz11+1d/9p11QyPKUWJNvAPpGGftcSQGBWhlID54qKokP7s1bk67NA5QHQnaYapOXQkOQRENQiPyT/Zf+fsBYb8QJWni4L9yL944VwzihDZtrpeGeskUJXnUXuqDxFTI43XFpuvCIfp2xmfXSoU8JRkUemo7kQApHn5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbIZsUL0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dd011ff8bso3023677f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 02:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739269152; x=1739873952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d1+7CYo2GEpNNd6dJTgksWpYBgWB3H8P41Hw271gq6M=;
        b=FbIZsUL0E8B1mxv3MhwM5VVhhb8aivonj/oWvHc7eWMXRS6cREBKaKwbLbsVBJ3rCN
         FN5D3/qGfyyyFBjiSkmObVbzwdaritTR8bpi16EVsMeXVIYvftwGO3XaOkBuGfREzlv6
         6f+pAyEkTxy4bY1H9BZUpxWeU3pXXvfdn8PMVbbPvG7gtV8rwLf5wZUjMLZZiIf3wjX6
         Zzd0ZVw+5Mjvrm9DsiZKiOVeCDma7WY+mxOPQsuJso2xqZF3qgmrM2uuebEMe6VOkDBF
         SlCM4vzxY7gUARIUqlMJli7b9jynxtuxy5kU4OBgB4PVLgwBqjlrNVVWFMgylzsvN/Nx
         KlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269152; x=1739873952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1+7CYo2GEpNNd6dJTgksWpYBgWB3H8P41Hw271gq6M=;
        b=PayEygJPGmj1rNRkf+V3DY9GSo9OGPR4nO6pAQiwCe2piKs1aOztszu3SyIcMj8f05
         q1vPLvFtPLtKg01NAMcw38MQUKXgvksODq9t0qAf2BNrolAw10yb/dmOlJq8X/q+5r9E
         WSq/5k2/BsatKFZG6mw9IN3jgJLjo98DZ0nmoeiC3vu0zXm403uluPBYVZUovrAEKcpH
         V0gGSQdd02ofJmVDhK6JrrNdg+2QfF4x1g3Lg4uOU5Fyxd/FMv5w10TKk85F3qbVcO9A
         P0ntQaOlAuIamgCy6txYVyuECueh4dD/Hq4Xzf5v98htn9B2jZFOEINqYcGodjuXmeK5
         RUsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhUE7OHxI6RBLY9gz/jr5gXkaqRosBupW7xxR/3ibs/CZgWYHKImrDHucknRjz1GpXSz3wlu9rUPsAZDiH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmij6ZbCg9FVbL3oAbFtOh4eoNoBgulB6WzpoOE/XQqF0wLpCq
	3Tn4v+aINu+9ZqUAxGE+P0G7bBu22t+CosOSEyLhQs8nm+zVO4bQz3P0hvsUDTQ=
X-Gm-Gg: ASbGncvXOYFpICmlfjlAP8sMZMMoasBPbcDrLaAZCJcGVBS6L0KuyxJ8Co1Wtiw1fFs
	m4TM0JPNmwXBaFAsexaF3kUHkGaUVg6A0Zmy485lV12oiufgD4+VZth40A2IlptxANxOGERwXpK
	NXFfI+rgWz0hCaAb497L/W0LwigcflYTuhYBMDspaDTgOQCXydiK7DzlFA0aj9m5uY7TLwE+Tj4
	8RxxlpuAxuInxgrBMn43pHdi09v2VZAa43em21nwW6KFj4U6h4gXj+30V+BLFxfRm0ASSHc8uLo
	BgVmR0MbeGCbJWdDCuQ4MKjeW11QgZYuDbquYnurfcIXu34vPlluOkE5fw==
X-Google-Smtp-Source: AGHT+IHh4hDVGqmsMf5rJQ27Gh0Zf6r2TAYfUuWPHNsKZyYXSF39sDKmhxO9TOc6pLn17KWtWMv46Q==
X-Received: by 2002:a5d:6d87:0:b0:38d:d69e:1326 with SMTP id ffacd0b85a97d-38dd69e1b18mr7568941f8f.9.1739269152351;
        Tue, 11 Feb 2025 02:19:12 -0800 (PST)
Received: from [192.168.0.156] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd3dcca71sm9090007f8f.76.2025.02.11.02.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:19:12 -0800 (PST)
Message-ID: <012b0381-a5d1-49bc-aa59-aae0d35aa034@linaro.org>
Date: Tue, 11 Feb 2025 10:19:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: qcom: camss: Add sa8775p camss TPG support
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2025 10:07, Wenmeng Liu wrote:
> SA8775P is a Qualcomm SoC. This series adds driver changes to
> bring up the TPG interfaces in SA8775P.
> 
> We have tested this on qcs9100-ride board with 'Test Pattern Generator'.
> Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY and sensor.
> 
> Tested with following commands:
> - media-ctl --reset
> - v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=0
> - media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=9
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
>    --capture=7
> 
> Used following tools for the sanity check of these changes.
> 
> - make -j32 W=1
> - ./scripts/checkpatch.pl
> 
> ---
> This patch series depends on patch series:
> https://lore.kernel.org/linux-media/20250210162843.609337-1-quic_vikramsa@quicinc.com/
> ---
> 
> ---
> Wenmeng Liu (3):
>        media: qcom: camss: Add support for TPG common
>        media: qcom: camss: Add link support for TPG common
>        media: qcom: camss: tpg: Add TPG support for SA8775P
> 
>   drivers/media/platform/qcom/camss/Makefile         |   2 +
>   drivers/media/platform/qcom/camss/camss-csid-690.c |  15 +
>   drivers/media/platform/qcom/camss/camss-csid.c     |  44 +-
>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 245 +++++++
>   drivers/media/platform/qcom/camss/camss-tpg.c      | 737 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-tpg.h      | 130 ++++
>   drivers/media/platform/qcom/camss/camss.c          | 113 ++++
>   drivers/media/platform/qcom/camss/camss.h          |   5 +
>   8 files changed, 1282 insertions(+), 9 deletions(-)
> ---
> base-commit: c1696380f08cf7cc68560a11f2e8c51cb24aa7ba
> change-id: 20250211-sa8775p_tpg-7de227a82eb4
> 
> Best regards,

Great to see this work.

I think the TPG should be another type of PHY.

---
bod

