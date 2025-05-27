Return-Path: <linux-arm-msm+bounces-59566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E52CAC5107
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 16:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00027189D8F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 14:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190962741DA;
	Tue, 27 May 2025 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gRKkMsG/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8F77E0E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356659; cv=none; b=INw+JnOf4e4YiJq1sjIUUS9mCl6TNy/UkKpXbefkpIjTwIwISr8SJ9DubLEC3ksIgDgCmX2vyEwO6VA06vvby2dOiWzPIhGlzneYsr7mPHIY6tO98n5r71aHQqmhL2kCg1aM/l9QTIUtx6YLiLvGVUIRasPkPBaI2Rl3uB1pmmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356659; c=relaxed/simple;
	bh=jvS1PbADz+Us91X2hWOLlEMb1Nws+URp8Zsi3PzRt1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNKXTqVc4paggqjWXrwLNZDbgsX4qTARwyJ+tnTkQ6oFLs6D5KCsL6UQYz/MFKEIzLauhR6yK2Fwl9//dDBRrQEdksIqnDWhq24q4Y9rOfcm/1aENpdR/I5kj7IMnqMWPO72OfwYFpfFA3sHb7nuxEO2eiRb7zN4RTqLLrsRcX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gRKkMsG/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a3758b122cso2201213f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748356655; x=1748961455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VvXJBVqr2AtSIqf+uhP51ScRsxX090wAOja9HSyfRT0=;
        b=gRKkMsG/Ra7r8iIVSImB/43nZCSi4IdNNNaz26J3LNRgSZdKASRzklJ1drk1TMUfTu
         Y6Z0d+EyWKnDg20KBE52VJ83oonjQoh0VJ1gC8AwC061O0TGuPd2zPp/HUqtLoAtL0MG
         aidoWwPfwBe701ZwrwK4qGuBQDxvp8FN4PNp1mrw0Q2PLCnI8+YLDH7FmChEqIhJ/0Z6
         6Wf7ICdu73nW2f1mxjaK/ptIUvUoS+9/eY4ODi02xwv0S8pI1/yzMhL/1aewf6ZoZcNN
         37Eq1kXM83ZGryZNcxKbYlEbQPFuoauoDfGLt8r53SZiSrJGwYEaPLbfP738jIbCEmvR
         6SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748356655; x=1748961455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvXJBVqr2AtSIqf+uhP51ScRsxX090wAOja9HSyfRT0=;
        b=BAJc0DIWleTeqz1IGtTYj0qn/EbI1H47CmnNJBIAZgYONoMnSi3839GSQWgmZtIoyg
         TI3PZmrHKXtSPwosDD4FBHYyx5f2usT/qFoeTfN1GUvncTc5jSJin87O0IPaiBRFvgEa
         O64Vr8Zm4Nw6RQxpmfKiNCBPvlxRIpSgKnKHZNgfWsI9+nEQt4r6pm0wZYbAObHQOIlI
         Js3G2o7Ohg5Zy7JSomFUP4hvCaolZdZA4VGYFBq0LOHXX7HxGWsSrS3Kk0FLIfzSN0BZ
         ilrby24yo+1NvgopXnnvIU0MmGUEH2XKEzgHLeeEf26VuFu8OKL/alVnpJVRYh5TVom1
         42Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVXevpa15GKybR1nRev1JoF9qOqP0Yqx+F7xHElfzczF/aqLJ4gbYtE0s3Jgjh/wrVH5OhaqxGbAd5bE1YS@vger.kernel.org
X-Gm-Message-State: AOJu0YxMAW0g0lVaVib5Is0eOOgRAw7ZZSll/dEm7Anbr1szpFh2MvMl
	TV0Gydl+bjGh26FJoHQBU9PmpjSg8q0DWai3x9r59tAdzOagJ9QjK0Nlrr7KQG1sdsQ=
X-Gm-Gg: ASbGncuFrxNTdDUAI6oHLXcDv7LDuNqQu9t5WXeAwxr2ShaDEAXlvS00yRAtx1Q6FEd
	EvfZkeh5pANpkt4E2pozTlnXS/L7oKtA0dxsr27K/x6Pxcba1Xulukw5b3gq1wIXDSNqdZwIA8W
	yFh20aEiEF42Gvof0Ijp/MJyTf+NAQhHwz5RZ9bvu8S+6eTvmZ7Cnlj933N8xiaJtZ/Eve+zzj0
	WeJnjE3lGXkiFNnkrWTxgW0f+H5fq5d5w4GL8kj/WMMgoVFITLDwLhW7mdsVLZOmTxRJoZ3H0aA
	PVJqK/R4LDlbKne3u/cvZ56r1YDprgpNFHNEc64vSsTshnwRj5buopKF8US+eLOC8fZCDIPCTKz
	2tpi5sxINlzl9CN1u
X-Google-Smtp-Source: AGHT+IHkWKsTTmphkcqPjmLfxusLGxXp8SFULw1PQIe5/AO75A5L3yTYl8KjtZzqIfX32dcuOV75+g==
X-Received: by 2002:a05:6000:430a:b0:3a4:d1d0:6f97 with SMTP id ffacd0b85a97d-3a4d1d071acmr9279310f8f.36.1748356655614;
        Tue, 27 May 2025 07:37:35 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4dc1172ecsm5285610f8f.48.2025.05.27.07.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 07:37:35 -0700 (PDT)
Message-ID: <5c326be6-816f-4417-a715-86fea92aadb3@linaro.org>
Date: Tue, 27 May 2025 15:37:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Power pipeline only when streaming
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Richard Acayan <mailingradian@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250526232837.686822-3-mailingradian@gmail.com>
 <CAFEp6-2mhuLptwA4JYJm2cvftZxufoJGB0y94LAd5ZWGP1e-RA@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFEp6-2mhuLptwA4JYJm2cvftZxufoJGB0y94LAd5ZWGP1e-RA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/05/2025 09:03, Loic Poulain wrote:
> On Tue, May 27, 2025 at 1:28 AM Richard Acayan<mailingradian@gmail.com> wrote:
>> The libcamera plugin for Pipewire may keep an open file descriptor to
>> the video device, even while streaming. This simplifies its operation,
>> as it only needs to keep track of a number instead of a file path. When
>> the video device is open but not streaming, the pipeline can be powered
>> off. Move the pipeline power management to the prepare_streaming and
>> unprepare_streaming functions.
> It seems to affect more than just this specific driver then? According
> to the documentation in v4l2-mc.h, v4l2_pipeline_pm_get() is intended
> to be called during video node open. If we're changing that behavior,
> we should also update the function's documentation accordingly so the
> change can be properly discussed and understood by a broader audience.

True but then the patch that added that comment also contains

@@ -999,7 +996,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, 
unsigned int count)
                 dev_err(cap->rkisp1->dev, "power up failed %d\n", ret);
                 goto err_destroy_dummy;
         }
-       ret = v4l2_pipeline_pm_use(entity, 1);
+       ret = v4l2_pipeline_pm_get(entity);

Seems to me like a perfectly valid use-case to have a persistent handle 
but only want to power-up the pipeline when you have work to-do.

---
bod

