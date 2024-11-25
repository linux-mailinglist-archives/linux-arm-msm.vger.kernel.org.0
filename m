Return-Path: <linux-arm-msm+bounces-39006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A47B9D79AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 02:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FC6028204A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 01:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5293710F9;
	Mon, 25 Nov 2024 01:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fvqk/7DM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C1ABE5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 01:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732496871; cv=none; b=k05nfrcfjK2rtD6kYrS/uHAJsj9IEC8P1MB4Ynplmtw8eQHzxSG3QGRc+fLk6vMTVLxmCmMolCgYeuIWshZ/4jPpy37uF2TNclQu6/a0tJbM/V8KBcZ5txpw2ISYfi5UQYzKWMJKm8xYCRZMsrl5My7r1YbabhIO6u+36misx+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732496871; c=relaxed/simple;
	bh=Zyft1p8BKzVPHJKKM8dRsZ8hHf5nnaQuyeZe7XSgq/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUjobAHziqJnDmrVldxrJWUVLbot6epgOaKrHMniu+qmaLngF0hCV3YWwQZpo6qm112Fo8pFBm3gNfnM5C7DENI5U290khP7N8a5K0LiZ9SsLnKHymkD4mSDJelVUONp+fB3GPgCPgITUoBRdN55NGWYWc9+QI8bh9N9h6PNApI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fvqk/7DM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3823cf963f1so2418577f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Nov 2024 17:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732496868; x=1733101668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zyft1p8BKzVPHJKKM8dRsZ8hHf5nnaQuyeZe7XSgq/g=;
        b=Fvqk/7DMQqim1X1CrIHSs3BZ+mdI3VV8GYux6wSflK00D/zXDUoSR5+V6z8NQKueLC
         vGXVrOlIuXZiXVecjTEE7r1KSk9TnSznwrLOYa4A0F5DSyiD/CHzMlFyebEmSLnh2LKb
         evl2dwb7rIp8I3ad8cVVG67bWHeav2OTBFNfU3wWvIkcapyQfip3kWHytbmFkNIxQzh1
         2U1qVGUtKWMDjSTMQdj0CLf/dtAuKOl5o+UqbmJpKR55vX1s2tn11a++pONSdzvBJRmX
         J8KGV7z/GIAR27TzDK+wh/obmmUY03Xm/hPshHdtkObqOvJa3dn/+2bav6yvhGwiTdE8
         Zf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732496868; x=1733101668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zyft1p8BKzVPHJKKM8dRsZ8hHf5nnaQuyeZe7XSgq/g=;
        b=pEjIF81dPrt683x3IlJT6Sb9RHr0idKdcQtWBXn/BF/+D+jhkYpXettQgHkxdysaAJ
         vXG+q+KLbmSXRlP1ilDloe5O87jIB9T+1vxl6Tu+ei4MiXHfCYwxdjBlkPcxJ167ODHf
         h0sRsLzpgxTyarH4IN6LCvbe93FfAdsNEccl8Gxs4S3qDTy4lNKBgqq5iRHxlsAVovFx
         S3IF5bMNf3Qss7YbWmcSriR+mR4pO3A6MXhY+QWrYQHvG1JrP/SE0xK9XqBmcKD6Jadm
         TdCVvEbyv0CjfC+riRJYcUP/C5ilT6UFj9AwfYPAmEGh8LSgRTmHvPr/9M5+txcmrEuc
         XGaA==
X-Gm-Message-State: AOJu0Yy7nfH5i2vulHOWAmFuqFWhpgBBfpCGNTCjc3GZjO1I2kjnpxHE
	cx7n+rz78Rzx8foD1mJrVSGSIC++p3zqmtzW/+LSx6kBOMZBsRu5eN420DUffAc=
X-Gm-Gg: ASbGnctbRWPfa87yUjnB3FzP/VQv1bZ5TvnR+LZzJJBNlemUvBTVowvVJ+/6hwIrljX
	FnN1NqrGcWYNB4y8a6oXZlRvr8RejSFdqxm2LYizrd8BL/SxU+cu5zFQ7YvZP6Fv/jSWXxv6g9n
	uVOYdn7zGUQL2mp87mR33HAg9J9sgwFZImEontvQNAEB3D/BAbkU4I7QdfKkgLYc2T14qdZd/Zk
	pmj/opIOGTe04a3dnTiAug6X30B2a3vacgFJDjC6EfXJ5dS14T4qgBv2g0rKiQ=
X-Google-Smtp-Source: AGHT+IHhoeFb+Wf/gYrX78mfl6z1x1kaYwgpE8ZNovkFpwSxzWiADNjuxgKT0GRkBF+vDAWZZizWWQ==
X-Received: by 2002:a05:6000:797:b0:382:5066:326f with SMTP id ffacd0b85a97d-38260b5b0bcmr8716564f8f.17.1732496867967;
        Sun, 24 Nov 2024 17:07:47 -0800 (PST)
Received: from [192.168.0.30] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd04ec7sm8938616f8f.110.2024.11.24.17.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Nov 2024 17:07:46 -0800 (PST)
Message-ID: <b1ff464f-9243-4e91-8dde-b31fac61e08c@linaro.org>
Date: Mon, 25 Nov 2024 01:07:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: common: Add support for power-domain
 attachment
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-0-a5e7554d7e45@linaro.org>
 <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-2-a5e7554d7e45@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-2-a5e7554d7e45@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2024 01:00, Bryan O'Donoghue wrote:
> per which

for each

