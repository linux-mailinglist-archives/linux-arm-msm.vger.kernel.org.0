Return-Path: <linux-arm-msm+bounces-26020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5BD92F860
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 11:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9344A1F21028
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 09:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E71E17BB6;
	Fri, 12 Jul 2024 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yzbiX2SD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843E2142629
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720777916; cv=none; b=GK3gIHtspXlOXQPZ/Gx34mkPpsbVMkgLe4D27f9KxKtt7zr0x1ui9nMAXGcGNynMOCoeb3heY5AO3BFqnS9N4vL9b+Tfi+6hQyUEPDLja8yW1oIr3etp8m4rq3t/+O7JQF4Ng/vUzlRfocum1kxccyV2NzXf/AqyILXSySqfqQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720777916; c=relaxed/simple;
	bh=SC+TuyPNMRtOq4AxrVGHb15gUZN6Nm5Et0LQjEWYa94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4z7C+uhL0Bc0xDreMViw9CaAofK/hJSKmPaTCmLh4we8O1YAOU9jK47EW7vizLrlupH4256TLBiu/oXIrLPfQa7ICSt/wGvfcoQi6Dw6Y4W5PSN9QJBlKPUN8uLeA89T/xDlBpQxMrGo7lwwwnvY/Umhx1n2LyzUNRUo3F41D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yzbiX2SD; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-58f9874aeb4so2416226a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 02:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720777913; x=1721382713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N1tjS6YMJlUOsz8nCx6JnOaz0fTKHxP1Aid+ErSztLE=;
        b=yzbiX2SDzxT5wXOS/yRi3b0TF1vpp79EmcXtm3yms32rp3p2fCJA2tmCLtDrAlij8e
         M9uXeJPMag+wjrzOsCu3xYKgYM//j2qMgrEDhBkdeaMKmbTcBsVQtDu/LvWjYE1esxSk
         VRoqgIeI/HSxw9a8lQ64pjOPRCuXL8VKw/36s92y5jp5l3s9t4qd+pZvhkiUezOrWv/F
         kRjE0FqV608O/w2bRb6q0qZNtWqyL+7SHsRdMU0DWTQ3LH0PLn//AALTnKAwveFH7NIR
         fmQ953SXEk/TFc2+PUAmpaZnpJ29ysS4oPFA2BFBH3JHxkW4QImvnWS0m9+RfGIhE62O
         QNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720777913; x=1721382713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1tjS6YMJlUOsz8nCx6JnOaz0fTKHxP1Aid+ErSztLE=;
        b=cmVaqlgLVQJYUMWdeZ39GxmdEv+6QsoISeR+Ry6U4V/3OCvndHq33Rt6V9I1McQpNs
         WY4Dlio0J7saDujnnmc2CaK9Ql9jvxIFg0xiqkcfSdNQZbIrVUlAOvpb58/vQsaYrtxE
         YAV9io24tAjNNehOWA28KXcEREob3Orrs99I7Dluw5idoMQRxceoaIt2OxeJcB2f5bKr
         bgVt/ubk69CzNx52tVn3fkY2QCGEK5815uNnuPOR2o0cC6ho3aaq7wKo0v8l4XpjvJQn
         EcztvFNKkvYVXQi37IHMTA1FcCW4A5rfpn8yENMkcm74LA+ImyNjSMWpRkHitLj0gEIw
         C6rw==
X-Forwarded-Encrypted: i=1; AJvYcCUMGLr/4CAl3/0emvvxyrvVa2EdBhZIxr0g+Cn9vHXg0dczYllmwE3IEaPdc9O+bnbkHoV8LDDDTsmmiweNIVIVvn5vqLnB71Ve80TmJA==
X-Gm-Message-State: AOJu0YzDn0Ai23khZagyZTaeT2Aw4EhjPe8Hj3E60iPxdbP9K0CKEUKM
	ZdOuOe9YDG0R8N2n4dJGHMeJcjwkctimJJOHbJqdB7Y0KlsU6Q9BwTtFJIVZ9ycz39uvctjztYm
	m
X-Google-Smtp-Source: AGHT+IFA9XmaUvi1bhmsqdbkB1U0DhUmANNu5GdHUGH1Sx3c6bPH9amZuemJKhaQSyoKVeIPmS4o2A==
X-Received: by 2002:a17:907:9619:b0:a72:5bb9:b140 with SMTP id a640c23a62f3a-a780b884a31mr923374066b.54.1720777912526;
        Fri, 12 Jul 2024 02:51:52 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a7ff282sm329968866b.130.2024.07.12.02.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 02:51:52 -0700 (PDT)
Message-ID: <a6ae5f72-76e2-4c80-8039-b3bb07ce3a3d@linaro.org>
Date: Fri, 12 Jul 2024 11:51:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/clocksource/qcom: Add missing iounmap() on
 errors in msm_dt_timer_init() function.
To: Ankit Agrawal <agrawal.ag.ankit@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240712082747.GA182658@bnew-VirtualBox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240712082747.GA182658@bnew-VirtualBox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 10:27 AM, Ankit Agrawal wrote:
> Add the missing iounmap() when clock frequency fails to get read by the
> of_property_read_u32() call, or if the call to msm_timer_init() fails.
> 
> Signed-off-by: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
> ---

For your future submissions: run:

/scripts/checkpatch.pl -g $(git describe --abbrev=0)..

to run some static checks, such as "title is rather long"


..but I don't mind!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

