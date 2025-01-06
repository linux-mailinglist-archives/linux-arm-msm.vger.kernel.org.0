Return-Path: <linux-arm-msm+bounces-43950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9BEA01CCE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 01:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31FEA1882BAD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 00:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D187B2111;
	Mon,  6 Jan 2025 00:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XAvn1XiM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F37801
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 00:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736121978; cv=none; b=b6QNW9vGBi5XbfcOGrQpJKDeVw81zCUopzwDMH0DnWBpkJv4tOiWIt6Y+XVnf7CDotxPgWZ7ipcCZ3Z+Foli81m+Tl5wqaC30vw6vqGLgHYyOFPDNux4HyDkCLhYSQOi3efUK2ntX9kzjCkzg79z50rBKKHMUg18WjoqLNQcKak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736121978; c=relaxed/simple;
	bh=oA6J0g5TF/QPJwoe/r7VTCId1g0D4HuEHJU+6/4mICA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hK6JDqLp7/emcLFJ64BIzSrryLJ083YkdtU9f6B/L1FI1vRlL+YZTIk1ilhMosJfZG8QjymzivU4QIr9nHcVOvEWPsmXjo8HdYHWPnaZOsraaGtXPTKgxMdHqBcUvgmvwVROEzJ5sgZPERw+3S5OUyY4fG64jM4FtflfwSdX6fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XAvn1XiM; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so8534237f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 16:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736121975; x=1736726775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhwNhcGJukSSNRtJy+BQbZn/P7zCXQmPoIWo8g+FW7g=;
        b=XAvn1XiMS9hXscgzhMIH4YJKSL6zpQaBU5AF5Lez7osMnSb9QppzI0XtnhCNU8XXK5
         EvKiSrvqLnypByfVLJO+QQaKLEbVaHiHNLkHjrGVY57Id9OTJeHVX9M1KZDIOw3mK51D
         Zmt+H2gxUwpaJULZsA4kNf98gc6efPgTbVx3y6pWQsZ5K8mOXCOrLjZj87OI9airnnQ5
         txcb3m/EoJ7DUakm69MqoeX74errk9wm9TXiwBZrsVaN4XpCcIwD8OJlWnNtjNisiVOM
         ahfmGJi4HzOCfEy1qL28gyTeUi3DTRktmNoqO7drDYHN3YwaQxKGRzm6S42BMYXRiHx2
         SZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736121975; x=1736726775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhwNhcGJukSSNRtJy+BQbZn/P7zCXQmPoIWo8g+FW7g=;
        b=u7dy/Qn+1HkJtWeM1plQGcZ7qMoM+c4hZ/+kMoT84EppoiI3DkMeSjMdHVAEP/4k4Q
         gUn3oBQsLJdUzzD4WVr8f08qVaTIwLgyXpYTfqQizXt2oQO6CZxues0RU1vBfU8UsHmA
         7eTAW4OBt0GGtsK9KM4oDig43i3xTs7S4+zLt2dGlKkBsxeoc2JT24cNe26l+fxFsAtv
         Yr4M88n7BZR0s3ogWaJ85XLHWnooj5Dg0Qyu4fBLZD+mV2IdF5cRkbbkSOZI5NzpLm1V
         +KxCy3DJDJQmMRb1mLG9cnrIps9AYnsiPlZQsPoZY/UB3bPmMkaoum6uY2t7OSY8Mssw
         13YA==
X-Forwarded-Encrypted: i=1; AJvYcCU8m4oWy0QsP7ksxDkAJtqbvnNNn4v7QplTDdPgt/5WL7yzjHHydkIhZUN8i5VqABUGF5GP155zWm56GwaI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7IfsBSf1Q/yFyAN8nwWLZvXvmWPiw+xFv8OyL8Jbo2VH+xVqs
	iA0KpxJ/Rbx4aHG92d0HkGpU43qbbp40vdmelKjvzBXSmQTxxQkTPysyA6yLYJ0=
X-Gm-Gg: ASbGncvWqxK4GJdk3BI7gPaFeCRKa7QHfeEiVb0dkyFAOVcepFkQzT5kOtnKNVVf6nW
	SeKv1j9KTvL+Jcm67MEnhGCJM726xH4eb7+VSAB8k2omZmedo9zE1/R8xcrQfNgvS9YD40vVScR
	gdxC3PMzvobWN+KpPt0F6K8plXWgo9USH+RJZ/9yOzc1NTFYme5zektmnAFv4ODyi3+4EuYBRp7
	JH/xvLXD6vVZ9Jp3aWZ8/MctVQXpWPpB7DuTrFg/6VyyQmKkj4b4RRF6uDvDEO+wYzHtg==
X-Google-Smtp-Source: AGHT+IHtD0cPqmxdavlPwilipaLcchXkzdRzmlDpwxXuPTk+EK6FZYxYiqrnx+VfEI1fkKR9R0goAQ==
X-Received: by 2002:a5d:5d09:0:b0:385:fa30:4f87 with SMTP id ffacd0b85a97d-38a2276a0a1mr54181265f8f.0.1736121975480;
        Sun, 05 Jan 2025 16:06:15 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45955003f8f.38.2025.01.05.16.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 16:06:15 -0800 (PST)
Message-ID: <2b0528f5-f9fa-4cfd-abda-a0e95ba4a2f1@linaro.org>
Date: Mon, 6 Jan 2025 00:06:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: fix OOB access issue while reading
 sequence changed events
To: Vedang Nagar <quic_vnagar@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
 <20250104-venus-security-fixes-v1-2-9d0dd4594cb4@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250104-venus-security-fixes-v1-2-9d0dd4594cb4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2025 05:41, Vedang Nagar wrote:
> num_properties_changed is being read from the message queue but is
> not validated. Value can be corrupted from the firmware leading to
> OOB read access issues. Add fix to read the size of the packets as
> well and crosscheck before reading from the packet.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Please see Vikash's series on this.

https://lore.kernel.org/linux-arm-msm/20241128-venus_oob_2-v2-2-483ae0a464b8@quicinc.com/

it seems to have exactly the same patch title ?

Is this patch supposed to be a follow-up to that patch ?

https://lore.kernel.org/linux-arm-msm/20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com/

Expecting to see a V3 of the above. If the intention is to supersede 
that patch or some of those patches you should make clear here.

On the switch statement I'd have two comments.

#1 is everything really a " -= sizeof(u32)" ?
#2 if so then this ought to be factored out into a function
    => functional decomposition

---
bod

