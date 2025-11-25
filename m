Return-Path: <linux-arm-msm+bounces-83261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F79C8558D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 15:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA3513B2C9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FB132548E;
	Tue, 25 Nov 2025 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cfr7112z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5B322FE0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764080155; cv=none; b=W73FI8Lb2C65m1QD8k7OYHsFjenkZFJn7HMvewrI6BpK887dc+QmsAWvHLCrCUW+2LjKycVHnT6CKTpoaQ+pcbRPDkSJTq2LMWUHlWe8JCVeZRQYhV681b4T/IhOIhp69W0yxE/rUMsVUA8a5J/IukdeIlGpKe8yQd/t0WkAekM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764080155; c=relaxed/simple;
	bh=mFb5cLfcBOJUAcCe7EzWAbK41v2KAhfkFMw1cs0g+5E=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+qqPAmML+HczwNZmZJJDtC76fjHNvazO8TqfIboQXdaZLF9ZzmvXrKyiqXEfOS2+0qjUz+AkDYB+hjjci8vvSyr7CZ35JOnpqM3OHfZaJwcMEG/WDwp2ZTYQoEGymWGO3FONZGcK6p80N2d7n7y1ZontLlck/jhcXqH5n9mgac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cfr7112z; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59583505988so7516536e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764080152; x=1764684952; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lX++QWc3Le3AqWqnqp0eBw0RQAx4IHJZgNq/+fapis=;
        b=cfr7112z39tDacvMz0W+kaJ8OPBELxchEm+OO2lJtd+upjfw4IpPdmo1G2i7ioh9SF
         5DM5Nei4KW6PzW4nEUTQ3nbDYDGBt+j9kxlfUj+9TReOLM5ayxO+68TWzKnUV5NSTSBS
         DtrNa28Q1WC5vElao/0vuMf6s1YYvcUQnmq6GubVddk5PY/V11Rlw1+d4lflawT/0phm
         uz3KAR3CVvCX24iBQtY/qkDnTcLdT9I1HUNxSLqeGg6hZ5wH6nL2p3Jsr51mysjjJS5Y
         pr7ZRnwJXIsIxfCELDPZzyDJHxu21PJPj9dlUkYOJhP51grRF1BYnbJaeGBJye1AvnMW
         ogwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080152; x=1764684952;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lX++QWc3Le3AqWqnqp0eBw0RQAx4IHJZgNq/+fapis=;
        b=Hv9GJqZYFvr3Z3EepCZnsC3KDpwLETUx0R9zR+VOuZn3I5mWfrk+aZyHRaU0c19bgT
         30mQw+W1GujLRW3yOTshQma5IPMcKH7aPxNK5RmrIGWVG2SEB2LXnGQN0e7cr5cdNPFz
         HimLjVN0ijz0UNEthZPFgES5z/7XZ1Arrc7tEwl0hCteMUuiuWoDzIzNv8RaBgNf5PN+
         vdmpkNyIW+JFX/mpe3wThmwrRqzns+tQIjIMkpO3Gxn356fjzb8hN2wcOlk/vbtwee1M
         vk78pcW0sDAtZ0sn1YG+17lQBRFEkyJ17FNAIjyvNSGGaSB+JvarYThaPMAaRexdRDaI
         U+DA==
X-Gm-Message-State: AOJu0YxZoFrEZwZTfMPAcC83p57rFakVkKruP14sbPOO4sJsZ8W6Yasu
	MySvEJcxWei/sRTBST8WAG+sp4gy9v8+L67Qropdpd9/boNcPFY+dqy/gh3OBsldfTVXM5LQlx7
	5Mdb15L6Uom0uQfT9YhZwxMlKfrQVTowVO/tNCrTsHA==
X-Gm-Gg: ASbGncs06XsVu+CFRhkFM57DeobEW3cwP2DC1kzB1G5ZTsju3xpla172zHirOzCxfNf
	9MnZ3WI9rB7BvBJfg+d84cr1gOJi7jyXmz/tB2b1Ex3K9+bmr8ncrC8jxGa2g+aGBxVknMrEWfQ
	zmnzR1GDxaIpjvQooT9VRkry+SsKNKWSewZssYquqDg9kWBh7i8rsM+oFE9lZIA1FWMnQmEn6ej
	Zr9SMK27/wMZ8UenRkW1lbOrCsuBk59TsRPblEMeBib3RyqEshMWaGgmtEmzH8jzZt0ujgiPdMf
	rHHR+yTZmv+BplPGhsyRN2kb8xxwU3XyXtqCsA==
X-Google-Smtp-Source: AGHT+IGw0f+YcE/b9XOY4nzyRDLXQofKTsibyWbTH3ng33GClAIakTZfRBxIMB6uBbCki2tbS4Cge5r+UiRlJGAvq8s=
X-Received: by 2002:a05:6512:3c89:b0:594:34c7:cb6c with SMTP id
 2adb3069b0e04-5969ea1b9e4mr6470181e87.15.1764080151955; Tue, 25 Nov 2025
 06:15:51 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Nov 2025 06:15:50 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Nov 2025 06:15:50 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251123-multi_waitq_scm-v9-3-0080fc259d4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251123-multi_waitq_scm-v9-0-0080fc259d4d@oss.qualcomm.com> <20251123-multi_waitq_scm-v9-3-0080fc259d4d@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 06:15:50 -0800
X-Gm-Features: AWmQ_bkhKUiXVfQMMZaJrmrGItcxiRVME4IaWtMuxFWjPL8wqdvgjyDECEBuwXY
Message-ID: <CAMRc=MfB6c=Fpxuapq9JXpGnFnx2SxpKjVk5yQNXFdtNF7FYZQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] firmware: qcom_scm: Use TASK_IDLE state in wait_for_wq_completion()
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Nov 2025 15:19:32 +0100, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>
> When the kernel issues an SMC (Secure Monitor Call) and the firmware
> requests the kernel to wait, the waiting thread enters an
> uninterruptible (D) state. In case of an extended wait request by the
> firmware, any device suspend request, cannot proceed because of the
> thread stuck in D state. This blocks the device suspend.
>
> Replace wait_for_completion() with wait_for_completion_state(...,
> TASK_IDLE), so that the waiting thread, show up in TASK_IDLE state,
> instead of TASK_UNINTERRUPTIBLE (D state). This allows the thread to
> block until completion, without blocking the device suspend.
>
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 149c2ccec2a5ff77054178fa021fd0b721d9f8d7..dfe0410fa9f965b16f8b0a9d98f3046e80b8b97b 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2320,7 +2320,7 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
>  	if (IS_ERR(wq))
>  		return PTR_ERR(wq);
>
> -	wait_for_completion(wq);
> +	wait_for_completion_state(wq, TASK_IDLE);
>
>  	return 0;
>  }
>
> --
> 2.34.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

