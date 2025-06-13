Return-Path: <linux-arm-msm+bounces-61253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2105FAD921B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 17:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D778F188B071
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 15:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23441FCFF0;
	Fri, 13 Jun 2025 15:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVSUBYiu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E001F4C8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830098; cv=none; b=bbEMewJ9xdnWYB+s3cXwsNM6t0Kmk+hGl3KSEpUis/R7V1dKtOkKWp/CCfeBm1BXPMxgCMmHCnUDOs7Ud6Ue+LyNZVI3D9eU0v5AI/pJFVuCHzcOSkuSqXObXytOAYwjBPQMxq5zH2r0JwrjhexUUjTXC0PzuUcMkHAjdVOeHEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830098; c=relaxed/simple;
	bh=LlVD9KrH3xGpv6ug3UfE4cxBBYTg4D6iYOLrCNyIWDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VYV8tyCuVcX2tuXMS3E0GGIYsD9OY7zLAyqlOWPDOuggEDgtvECzNXWZNwcS6vVu5ZYMpXmnSTE5b8rxtpoVJYu/eeDJ6TxijooF8FjSRezTtQZVd4xoQ7kn4DQERxI7krtQe4cwEKWRmwlUoCObGNj28fyikgcI/2bd5gQhC4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVSUBYiu; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5532bb8687dso136366e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 08:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749830095; x=1750434895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N970D+3TWVdFNN6dsaEAVQw86o2ZV5k5a3iFxFajZPo=;
        b=eVSUBYiuTcL8NsJLoJj1FudgvlFkrGBdSE2WpkkrdxotFq5GGISArKJLUaDfaZBhul
         F+Vl2OygSTaAst93eMp+y3wyJ6lsBtGvH8o+wYzh1NRe/a5pq5RU2azfNZJyw4KVDPMt
         r1iM5i2nSxFlZ/PnG2BKVFqu4LCZVCRBoSS5LF6CWnvoCE4Dl76eWAuCbxWEm6Rese3b
         CD/+0iq3r4OruaMJKv+7LOydOWnExnMmJD5jUmbVRM6QtT6lP9l5iWjbECgc2tC3s8Yz
         ML6qqTzdbacs+GtaEKuG1uCmKTAHDWG1ys75js8WKSJo9bnDOq8b69QAl8QUeQXicyVM
         RkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830095; x=1750434895;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N970D+3TWVdFNN6dsaEAVQw86o2ZV5k5a3iFxFajZPo=;
        b=KKG4s81vZqqhbFGi8xcdiVeW9SxaJFHqEBuyaqOfX7oxUYpnmj5WwdgmhMUf8xcag9
         8xsXLL7Gz3JMUjzV5lh9MmyJP89z7B12x/Nflk0MsRuYal+IUOGSJMZGwRiAo//lpQuW
         bgZ69quZePdza9VmUAJIPS/JfOPn2B5+9sihQHC10zDhA9Wh0O4rXF6sn2yQLa5K3k37
         446hSsNdOyVWWNBwjWtzYXXjLUSXE7jj8HVs0Fv9ZEh+XqT3rJXub3o/kXjlnquQn7or
         WK0/+mhEggj5v5k4IrzD2hVxs65xjSxVE+zRcxSHablXKxVceAg9dgtc/L10PiLrNZdN
         N1vA==
X-Forwarded-Encrypted: i=1; AJvYcCWxiTt7UnnqQByPQwkHSiyrDAWAai2fUw7daELBDcQZH3YdKP1JYXjj8fVz5eN0ZWgB9K+3eokYJ3aK1i6T@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0aA+bjuwcxXqhUI89wf6Cx7CPVuPiFxpsoWXFvVRUiDgAEDgY
	RoBfw2lSmmpeAVwsNNJitha+Ee+/shwNVQVOtSc/Z/nG30BwY0OkNd8SZ7s6BQe7Trs=
X-Gm-Gg: ASbGncvnwqGhbfX9HUk8w09Fo3idzbljM6OgaATA5hTq12X6wcbh7Gs2EqyeIVsIFB6
	zVvmriYrTbzpqdkiqngsd5+opWIqHrgu/bdLx7CowbF3iKHVqhJ8CKgJLntMEGZkiGvDI2T8de5
	sRNyWziqX5pWy11OtVDbon95XhfO+IymtUqSWZ8ntc5NM29g1T4owbZky3OxFyY3/7DdoCc1FY5
	NXZtHtYceI3B6iNIeFezboMbzPvVA69ulJdD0M/4a7J5u3OAotIp90B39MLeswDz+8r2jv9UpJL
	hj93XGgwuLNT4okr3YHc2N6T1dDOGst+i96vn1y3v48EWhsy1qSm53FdN8CboTeJZH5S/Edwq6J
	Dn1ayPD4+cc+Cam4xRivFHXrXEvmSrtSecK4nXgmg
X-Google-Smtp-Source: AGHT+IGgSAzTvcHYxv6mwQqkfGzUItooKxtagJreytvxb+kfOanDqHK73QctYtSBcRHOnp032MnZ8Q==
X-Received: by 2002:a05:6512:108d:b0:553:35e6:af10 with SMTP id 2adb3069b0e04-553af95cb08mr320535e87.7.1749830094777;
        Fri, 13 Jun 2025 08:54:54 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1aadd4sm485930e87.105.2025.06.13.08.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:54:54 -0700 (PDT)
Message-ID: <a89091f8-756b-49c2-b608-670119af1b50@linaro.org>
Date: Fri, 13 Jun 2025 18:54:53 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Power pipeline only when streaming
Content-Language: ru-RU
To: Richard Acayan <mailingradian@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250526232837.686822-3-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250526232837.686822-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/25 02:28, Richard Acayan wrote:
> The libcamera plugin for Pipewire may keep an open file descriptor to
> the video device, even while streaming. This simplifies its operation,
> as it only needs to keep track of a number instead of a file path. When
> the video device is open but not streaming, the pipeline can be powered
> off. Move the pipeline power management to the prepare_streaming and
> unprepare_streaming functions.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

