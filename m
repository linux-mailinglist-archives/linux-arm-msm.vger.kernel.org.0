Return-Path: <linux-arm-msm+bounces-76278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD61ABC2D95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 00:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA2C19A2D07
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 22:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4D62080C8;
	Tue,  7 Oct 2025 22:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AOgCjwk1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC6A2745E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 22:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759875526; cv=none; b=STQBii6L7m5BFMPQGlmgdK7KvswkuAv2eguy6xfMKKy2kIYPhSP2fyNHr3nVjLWx1Utp9uEbVEfBdx+PNWsHXf8FwVdjVhaKFhlG9dE2G9nDz/RDQ/i79IAv8HXGZKzCu/HhWMif/Gt6IAVHXWUCnYyqy4jvDS3LRv/jfdeUHr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759875526; c=relaxed/simple;
	bh=SLeO1TAtQctqo/G87wy7jwdKIvRsiaxvWzhX3gTyZJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ph6v+avXIQFdkNdpz54aH2Bd8PZPB4ixKZla0Xb1AaqmMUsznL0nO3uK7PxwOnCN/H3odcWnycfSIRLHw+N1XNrXsLmE6pgq9VMlvNebngQ/EmKJ/lSHkJuES9UII9FcQrT+Y23Ymh+Sx4WlbKsuXj8ZxPp+5030GrQqXs/B+dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AOgCjwk1; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso16424081a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759875523; x=1760480323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VAcCbc5co6ODCK3tRg4Uk4cXA0LeozhVGq2IQBEDYW4=;
        b=AOgCjwk1xvUVCIv1nPzHS/Ut3NKjeD+ZBKcimKJLKZIBdygKF++7JeSzY7NNy9hlKj
         g4dUU7XDKX4yzjNSXo0Bbxth9gYEoiv+yBcAe1XT9TX2DCMRLaeucSpn/mosqe+nY5eI
         ye068vPgK24YT5dma3ugF79pmwVWeKjoyiwP2Otu76wAEeE72Yyn9DG87H6fC+NrDWvC
         aClSl+5NPIgesJmXf9fXPb92uYdBpXOYwW2f6Ht75YibTDIDsClAbYu4s/yoBMaRNlmC
         tfeFIFMfWYos9kp/eCxnxs2inrHqOqKHxlISweHTO8OnIrBdAXtgzh2ei5k+xPCXAtbb
         p+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875523; x=1760480323;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAcCbc5co6ODCK3tRg4Uk4cXA0LeozhVGq2IQBEDYW4=;
        b=MkKjtZiaKfpiwx90nbU3PNEVWfB0BjiqWFlGub9zUk6LlQpGOZYPATlLuxh48ryvBt
         4LklGlnU6y+aH8Li2lOp1YWyw1awdc7ABqtOY51GyXGyIJqeWIrvCY6Ja3f9asfgp71H
         oSRmCxl0qisGTCxRS9aDBXxkaFzYUqwrXiSJJHt/AJ8D+iAcJ81BKl41R3u9B8w6iyjU
         8K0jSC3uCAURveG3x5Z+70UD/35V0+p5QtTB1sjw2ITQKZowiLfIOjAyr5L9uIqBEhW6
         JoiDrtXl4iHmLO/VybQh1f0wfyIuMIlkEiQH6y+OzTYHImKgIM+ZCQ0rNrdnMZETlHST
         5wDw==
X-Gm-Message-State: AOJu0YyYRjzAE+ODoXDSgG/U0D1WBw9IoiUiPxXs2cNKFEbz3Oi8aAOD
	/Lz3tX+JJ9iQwqlWzOwpkSfTOrDDlX0ZyDAEfIEDyH9IFgfomYVNgh3UX8R9UJ8HyAY=
X-Gm-Gg: ASbGncuA4nL1BN1bWUcZ180L7Wq4qUVcmfLYG4fULljcnDZPrqHT1UWSvdyWdNPTppV
	ktDk6pjyKfPJ1JrDW+Y020nKj5le8JMG42pS9Q0pUrL2Tnro68V8HKRA97YvB/NHUl1RFVhHWsk
	fIuWQKinfw/XgrG36GvoBj9wBSxHnhy95C8Z9EuIYXJMCLPwzm1h5I+KpVofCz14zN1NUuKq94q
	UIorI9mNndVDocjPJnnOj6HkKhHtKzqJaKpp3TOg9lvyxq9siH215IyNlApeosGH3ei43Ab53S3
	hWTMr+U30jHvDdzxCenIs8WxZ2s4l0siIan7mp7RZeiLMdmcfF8R1LmjLN+wUujFay5wQlRkcMI
	uU6y7BYuIYJ9eIDkcvMePfx/anT/3lcw0St/QGYKTegQULw6aDJColkhcPd5c5AGGjIc3+NLjU0
	spXifooFDU3fTYo5WW
X-Google-Smtp-Source: AGHT+IEvIeKotHh8V1wlYmnxmLNZTITrD3r2Kxy/kM21gnuWLz55WYRXo8kvcljBu8rz9ZiL6J7tWw==
X-Received: by 2002:a05:6402:358c:b0:634:cd66:9cdd with SMTP id 4fb4d7f45d1cf-639d5b804b1mr1088942a12.10.1759875522953;
        Tue, 07 Oct 2025 15:18:42 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637880ffdf7sm13435183a12.28.2025.10.07.15.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 15:18:42 -0700 (PDT)
Message-ID: <4e1eb99b-05d6-4ab9-9e0f-b2a2b01012ed@linaro.org>
Date: Tue, 7 Oct 2025 23:18:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: qcom: iris: crashes on SM8250 / RB5 board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
References: <rs3olaoudntfrnsgpg4nivtnyrdfqsvb3flnr6mcejih3me6zd@udzutvmmkj45>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <rs3olaoudntfrnsgpg4nivtnyrdfqsvb3flnr6mcejih3me6zd@udzutvmmkj45>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2025 20:34, Dmitry Baryshkov wrote:
> Hello,
> 
> I've tried running fluster testsuite against the Iris driver on the
> Qualcomm Robotics RB5 (QRB5165 / SM8250) and I noticed several
> instabilities:
> 
> The following VP9 tests cause the board to reset badly:
> 
>              vp90-2-05-resize.ivf
>              vp90-2-18-resize.ivf
>              vp90-2-21-resize_inter_640x360_5_1-2.webm
>              vp90-2-21-resize_inter_640x360_5_3-4.webm
>              vp90-2-21-resize_inter_640x360_7_1-2.webm
>              vp90-2-21-resize_inter_640x360_7_3-4.webm
> 
> Testing H.265 with JCT-VC-HEVC_V1 passes with -j 1, but quickly resets
> the board with 8 paralell jobs (the fluster's default on that device).
> 
> Neither H.265 nor VP9 testsuites crash if I use Venus driver.
> 

Sounds like we are failing to vote for something. My own smoketest for 
this was h264 encode/decode and fluster.

Out of curiosity, what happens at higher resolutions say 1080p ?

---
bod

