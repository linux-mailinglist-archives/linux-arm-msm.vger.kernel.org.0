Return-Path: <linux-arm-msm+bounces-72796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADC9B4FEAA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0FB8360930
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A8B2DF703;
	Tue,  9 Sep 2025 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VIX29CZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CE12773DF
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426635; cv=none; b=MPINiqUvzz9fyVUnRfWwXZDxgRji9stQOrgp/oRKepbdDzfekLT8EjNJu3dxvCasNxUgjOQlZgXGJzj/vsoCwbiYab8xiCiJL8d1mfqmAzgkHzuKZVsncAvoKtq2+ydSxj+87jiq2Md8lcNz9fKcVUYQ1+rQ27L6hirmQBcAKRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426635; c=relaxed/simple;
	bh=J1iHTeiWgzsI9TOKXMSPaiARrb+BL0MsqyKSqGCw3KE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lO0uDx7bbRjXZoN6kkhdYGwe7gs0oGrpm4bcHAFm+m+cTO+S+euj1VWSPJUr99VWTRrk108E7z0+VLW6l1PtYU8TM0LReLocYqw/+5n5mGlxzWYriMZ0BJrd9gFSMEI1VQ82yOTskH2CEwTQL33ZG/iOiKIIMZJFPg0wIzy9FaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VIX29CZO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45de60d39b7so15741195e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757426632; x=1758031432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7czbVid6QRsjlwt+fbJOY83TMvm3D218edlo4P0mSo4=;
        b=VIX29CZOHX6QxDwCK4rR3x2VG+wKMskd+pE/0xRq4AsQcPZvM0ceskwVJhaen90Tj/
         xrFxolmgya2ZSY8l2ogSMjPJLw0zQIHUWXoAUS87MHq679mknScJoWPphOZEt9s3TfXh
         MGsFeS4dF7g7NBISoYPKABGARcZ2JXjHlV2d1+iUjbCpW/Oamg4hclQqxvpJePztdgBi
         Ho45LwOy9erQuSxJiGwZuchEJ8BcTwLG7NLshNZ2vSb7W/Vl2LHkVgSu1C5+UrdtTGR/
         BQJqQ+mFGS2Il+z045A/lVK3iU9QZQpuuEIcdNqsE75H4PqJUfE5OFx6wrwkHuixxr0M
         EyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426632; x=1758031432;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7czbVid6QRsjlwt+fbJOY83TMvm3D218edlo4P0mSo4=;
        b=RLYPWUsZ49l2K3+6kpXJbVyb6isTcZh9DIqcWM/m0WHBWI4FDM1rxTLDHQyirGZS0s
         3SI6K6XIiioQ1fXH0WkrtVcX1BQe/ORE12KZgouVeIxZYjVgcLBv8S0Kt3ow2EpN0peh
         eJLmTMsxy6mpZFTc5aojvrDGBCIuOBku3U0rwGYC75g/xjMmPmMpRn3w5olMXxyonwp4
         j5XdRicuY4jQ/4G79L1Iln8OcNH1m5aO27St8bTGbLns8FrUIhPpUEZC+Lbic5wjL7iO
         9YVgqarTYAMpmFjZHJVmBtoscmsAqgGwqbq5vFdJxR0vYy6mJhY6Yma3YSYbNh8hb/WR
         tklQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy6wVhDfsM4SUD4QOdqkYNOvzh4w0K3ouKOWL45OKG2ETw9gm9X1sTJed55iii60911EeHCuLVjIelCd9F@vger.kernel.org
X-Gm-Message-State: AOJu0YzzbuG59H8S/k1SfJgm2H9OF/mKExSt98CZyOfJjh0B3XzG09y7
	9Ojw15nFLoS4dXxv7pAzIOZ3ham+cR9cMBKasAcCi/GvUzXOStyvLK/2v/OM1ldAJRY=
X-Gm-Gg: ASbGncvHnkfo18BfXkY98b5J2J9xhP+oAVSw/vJuD8/BwrKqXxZ20G2i/fPKwSdeZAN
	ePIc0ErsYTNcYNen7Rbm3Ds1SOCHnfAhvQND+JP392y25ZVDBudg1lXGdVOtZb3y1I0bwnENoOD
	TeC9T6cuqmJXYbpqBGwZxxcM9DLZpQHnPYjY6Qrl5Jevhb1djJYIRbtVGzoj+d9dy3afKW60IA7
	i6FR/eXt5QTQllevU0pPkLZWpFH9dwIiYGPI7QNRzpG4ddxXWSWRwMJkPIqdIK089HsTnHISqqF
	tJKiJQNCZd4Zgt2TprWJujxNfjpGuLtRQ7yM0FJjWkTBC40oTXK9L/q71AYP6Ua6ySDYHRhXesL
	JgimC4wQFQSTGR0vFCDFH4atEuSvKH/Bk4JvEWMhYAMDtwcpVmtkj+vsCjVxOgM5PNQet3LLLuy
	assxOqblYDDqr8GGgpOww=
X-Google-Smtp-Source: AGHT+IFzn0c/ZENYPqzsIDea2ndHdK4KGIQ+jsE0Z5szl/BL4biM07CIyHZ1+ufaLZRPjZ/hkQF40A==
X-Received: by 2002:a05:600c:4711:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-45dddecd454mr96743385e9.21.1757426630421;
        Tue, 09 Sep 2025 07:03:50 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9ab7c7dbsm309084955e9.11.2025.09.09.07.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 07:03:49 -0700 (PDT)
Message-ID: <ad5a58a6-2545-4429-9388-e8ad84319570@linaro.org>
Date: Tue, 9 Sep 2025 15:03:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
 <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
 <aKiaKwkpdKHSH9YS@linaro.org>
 <20250822164030.6gubbs24raeg6kbx@hu-mojha-hyd.qualcomm.com>
 <aKooCFoV3ZYwOMRx@linaro.org>
 <20250825111956.5x4dn3uguo4xmtss@hu-mojha-hyd.qualcomm.com>
 <aL6Sg9dExKfepRKM@linaro.org>
 <20250909121956.rjbysoylwybgsago@hu-mojha-hyd.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250909121956.rjbysoylwybgsago@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2025 13:19, Mukesh Ojha wrote:
>> Have you continued working on this to unblock adding the IOMMU needed
>> for the IRIS firmware?
> We are discussing on this internally and if this can be taken along with
> non-pixel case or not, will come back on this.
> 
> If it takes too much, will drop video support for now in next version.

For preference I'd rather get something that can be applied to -next so 
that we can enable PIL loading on current kernels instead of waiting an 
indeterminate time for an iommu non-pixel resolution.

i.e. we are better of with stuff that works now instead of gating 
ourselves forever on a fix that may be months or years off.

---
bod
the optimist

