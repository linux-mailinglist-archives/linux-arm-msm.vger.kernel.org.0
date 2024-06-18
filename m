Return-Path: <linux-arm-msm+bounces-22995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4AC90CA12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA50328D935
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D639719DFBD;
	Tue, 18 Jun 2024 11:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p15VSk12"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547E9158D8C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718709039; cv=none; b=k+2WtmwIk/R1i4/ydF8+myZaMLazFQUn+M3MyZJYjm9Mb0IDk82ONhq4Qf0+RpMT6MXsv1ZR/nMpBj8UEykJVuqz7NHyRuV+GPzJV51NZ28tPbVfzS8RsNGjB+F4XR0cfmRqtoGX4zqYrY2/uFGQHUWqYA0in51lHMFOdNSI1HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718709039; c=relaxed/simple;
	bh=QovKZmLzlBkSjshSMJzZuED3bDOaMvfHW45fNRxScUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GTe/TPge7Q/HDPF5fjGNo2vKf4pi3hH3mIEl+e98EcPQR7LHtluMjvCC41FTFyck33/k94LPSe0EIWGJA0t3CwyzpP+SuLZ+R/NUyp3pg2TEeHXgMKLpp9jmArAPCABCN2liGCp11otACo/deepuy3jScYN0eHI3xTFBp/CWqQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p15VSk12; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52c8342af5eso5580334e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718709035; x=1719313835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CamK4h0tVkXA5tm1M1BFkFYkjXyPGLjdWaiQdzsO90=;
        b=p15VSk12ygPt7WFXlYjeb74m9VINP1JaosdBc9x6qJKZuLmw2up1Zp7yN8J/DiX9Ek
         0XWBqUjqyU6xMI8YxTRbkL81MGNGWWWnKVOJUAi/RyzPQLoRkHFkSG6SoouTceIs9k15
         gFXXeGaBTI37xs2sXEJXZfH8VTXfftohVAWKBuZ0SPGr8I4BMgI1LazcDl+4m4zKxEGL
         y27V1ue6MkgnlBbIBTWGKEZSWTp/O5E041GRmlh7Ek31Oxyue5XmT3kNV4S9wMaHtF9P
         Yf0aduZcwsLl1Pi8wHLDN0YQig6u8pC4qoIVfQeafbPQJ1fUS38HrG8FKPXthTZf9cq6
         N0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709035; x=1719313835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CamK4h0tVkXA5tm1M1BFkFYkjXyPGLjdWaiQdzsO90=;
        b=SMu3drsdTK26PdaZckzc3eBcuQxLD5pQHR/fQed8iR3OuWqWbldzmcal7hby46n2px
         K8VBsAzFgnP6pkQB108vEisAkCs5UuRyCEMPaUw2hCn7OHVfCx2M5WkP0XpJ5HPw8q/+
         I22oR3cro7NVE2L/e2ZSRzzBv92l/zj0jEiVhYkXIMJ2eB9QWFaOBOL1MGoghv8Okl6o
         8L10VIl0QDo4aU9/V8hOm6ISAevBUYhjyMrz5cvG6Zuxxu2ZJPiqQXiJZBhvplCjOn4o
         N+QEn6RNJJhxK5bCLdWxI3RBmJVH814PCVqnr7N8gWrcLsxB5M3BtbSeuQ93z4Kd81Vg
         KuKA==
X-Gm-Message-State: AOJu0Yxn3D1ZXMnWIV0/X/0tfolITa8AYIbAsdMudUrnlNHLI0x4bkNM
	qMI7IaW6vRPFldwFSNLKM6xMrXdIXBTISY+FOw/8fi3L/+qRpIIY0kxZIZI8Fl0=
X-Google-Smtp-Source: AGHT+IGXPsTBfIq7KgoZ+FjqKnXfQE7o5TjJhqwbSz0mtaVsqH0uGjATHX6jD/wxyZ6VImIIA0MtLg==
X-Received: by 2002:ac2:43ae:0:b0:52c:8a16:b085 with SMTP id 2adb3069b0e04-52ca6e65542mr7104199e87.19.1718709035526;
        Tue, 18 Jun 2024 04:10:35 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282569esm1480851e87.41.2024.06.18.04.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 04:10:35 -0700 (PDT)
Message-ID: <9d9cb645-b3dc-4081-859f-d2be981a696f@linaro.org>
Date: Tue, 18 Jun 2024 13:10:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/msm/adreno: Split catalog into separate files
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-3-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-3-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 00:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split each gen's gpu table into it's own file.  Only code-motion, no
> functional change.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

