Return-Path: <linux-arm-msm+bounces-35431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB96C9AB0C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 16:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28B11B22A0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 14:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403D21A08B2;
	Tue, 22 Oct 2024 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gfd2uqTc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17411A08AF;
	Tue, 22 Oct 2024 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729607090; cv=none; b=eqZ8h1p5W22/B76Xl9/I/Eos7DsKKEYlsiMINjHD8ISRuF3R228BGXx1vEYlm4LnUIQ27oOPxp32/imDl7ZnQpOV8kzons3X2btJitBTaBUWwpySOCSIq8CC/zBxSVmb4d6ppsYmY4Nx9cn92SNZlyonrJwNWl/ZSBC9pX/XQf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729607090; c=relaxed/simple;
	bh=bH8AScHKkC5OhCJcRvjzRxT4CTA/QwfI8QAZFJvDjg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gH4ITA7DgLOeRDA9lf5p7w+2oKzqvsK96bft/mpSS/CN4P203j0WU0XaKUEvuiOZ19IzU7uekJpBek1NAYE9EVYusNM2uc1uh1wP9Zlp76tKwKtMpuPi05rZ76X8Si5agHGi9M0+e0Q3eUoGQLsEGuD5FGvN/xv9A4NzirOGtbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gfd2uqTc; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7180bd5b79dso1786768a34.2;
        Tue, 22 Oct 2024 07:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729607088; x=1730211888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kyq6T+RQjWDXfC+J6A046VuE0Fc2qX2pfO+GzSgAMSA=;
        b=Gfd2uqTcj8MiIHFOeo8464wGOVJgHUA/rN5a6JbCCucUMIwaUUOVyKEvwgvkbECU6H
         vr8nvc/jrYO1MDSAY9ug+kn3/OVLI+EMNJx14LL/zhOJe0Ce3/kj06qx4EcNXrXOW6Uf
         VIImw5DZMCEYdNMQ+5N3r6OIE/uRrU+IF6gC+aKyK9FIWw3cDfHeWcfuTmryO3AaE34i
         ZFD0maMWk1JxsJZF5mfKvK5uc+C/X1aHIzek9KKwrwt5jTJ3RdT7ci5hGbShIk01xLeA
         pjm36Y/8bSeHF7oqa5wgiQ5gPCRURdu2p69iebflPOw9drbN6ExV/7vc80PVRaXOb030
         J5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729607088; x=1730211888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kyq6T+RQjWDXfC+J6A046VuE0Fc2qX2pfO+GzSgAMSA=;
        b=YFCvt5Ub4zKR7MSLpxY9+kKCZxfQ8st2N1wSMGX7D1z/WaPrab8HAv3ANXE2SbxLlv
         kW/bzZM42G9YfV/fB8QDCuxjL78rP9sGUFz0B78dXmD+5Dbf4OVhVAKdowrs0bFL/cDk
         DGX1NfvVOoO5EjHG9rkqzLhyt9V3ce+SOxEw1T6HB+Fy7c65zE5MDx0z8MPXdj7VY0+1
         hdbUt7TPKLpYQSWPJgAXiHKqg52iuvFwZJe+eJ92g2ltaTsomGI0DnqbRUtNIHzoizPD
         eaFsPpdErKE22qS8vd+4O+EWzGvwBnCj3I9azvidHprWa68sUvAi+ZTkbE6M4wM9YSGM
         3+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVk7vPlL8HsR8i4Bsk2QsL0QFqcLeXOrLJZSdkIiyxorybCaJzPHDkLJbwZJ8Y+6/WTrpWrPc7bBwpGCvpR@vger.kernel.org, AJvYcCXzvZG6WTpetrL5X9yVHI7mAZbd5Zpio3U2EP9tQKqx4Lhgq+PCxzdpWZ1tN0wNMNI9W2YcYY5FQdtTn1iw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw28IyBH+upRO8cnxq+EoBb5lRPNHyZe4u4m6axqdtd1nlo1ky7
	Xqxqn0WWr9ecNbSnE+mahI0Buf3Gee6yQYqIZnHh8SGfo6MH27mU
X-Google-Smtp-Source: AGHT+IHRmIJV3qzYhapOYn5RJwqs6YcNmoU5GgzrL8pNigS0UQp95SaFaHGfvapeu75B0p936Eo3Mw==
X-Received: by 2002:a05:6830:3c09:b0:710:f926:709c with SMTP id 46e09a7af769-7181a89f3e6mr17055888a34.25.1729607087733;
        Tue, 22 Oct 2024 07:24:47 -0700 (PDT)
Received: from [192.168.1.22] (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7182ec02842sm1249190a34.73.2024.10.22.07.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 07:24:47 -0700 (PDT)
Message-ID: <07b83d38-defd-446e-ab25-e4007566e293@gmail.com>
Date: Tue, 22 Oct 2024 09:24:46 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 03/10] net: qrtr: support identical node ids
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
 Andy Gross <agross@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241018181842.1368394-1-denkenz@gmail.com>
 <20241018181842.1368394-4-denkenz@gmail.com>
 <20241019091817.GR1697@kernel.org>
Content-Language: en-US
From: Denis Kenzior <denkenz@gmail.com>
In-Reply-To: <20241019091817.GR1697@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Simon,

> 
> On systems with 32-bit longs, such as ARM, this will overflow.

Indeed.  I mentioned this in the cover letter.

Regards,
-Denis

