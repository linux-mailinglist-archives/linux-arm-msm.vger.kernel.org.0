Return-Path: <linux-arm-msm+bounces-60312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6D3ACEFF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 15:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F13C57A35FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 13:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3CB22578C;
	Thu,  5 Jun 2025 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hE37ZiDG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22530221F00
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 13:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128789; cv=none; b=jqj4Sk1aZUTCEztXrt/VgtW1BGNM/hiW+B4fHnXxfZTXd224UH6uoeAw5FcZclqzGzXHtSPxtzN3BuC+cblq5tO4D1JhiyuufYuMfLgSeVAaVREMSbKEyC04VdVWikx1MUS1p/JH3aQKI1BjzZwYJthuvKrBBa+7sZjJ9EzV9UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128789; c=relaxed/simple;
	bh=zS8ecJYvpJitQ3UMbVXIWGqUkE6qbecokkfr7msuPkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fseTn0V1PjVzlePoBbmMkoiLziVeKIh6m0werAolU0ca2w+ncPROVQ21cIsaFc+zFwCx9JP5bUvtPpi4/+J14C6V7cYUhVrXc+tbtkJegpvzIWvsQRa2i8Ae498cx7y3Dcb/Og6m7Zbuy5oqbuXSnJ4g7BVPMvGZ2Se1qinIgAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hE37ZiDG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a36efcadb8so819306f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 06:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128786; x=1749733586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ALKVA2fW4irMbGXjAfGWZNtggykUGJCgahiUtNxuSd8=;
        b=hE37ZiDGu7jX1TYfxpGeiiSGeyzR99Jeoii3ivurbeE99fHaO2Y8MtfLhAOunRy0yx
         8zhitREKYvNICRpKf5pBIXnSKK/uMZv8A86Fug9mOZr75VM+FMqwfnTTlIzg+sv+Y0DY
         l2iLsqKB6Ks/IpgoBpYHuAlC69QZ4sstmmeev89FMW9EXtNNqLR/b6js1POkgY8PqBL5
         mFHXIlrHZTVmbPrOaF7aFKFRDCkGdav8diIUirYvUMSNBjD8gQYF4nZeNbNU//gtjHHy
         6XLZabXNJgO1HWCLmX1laGZZoQEZZp0ZYSJg95TsAOzjlzIj8DVidL/ePleu3M1iDJ1i
         pL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128786; x=1749733586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALKVA2fW4irMbGXjAfGWZNtggykUGJCgahiUtNxuSd8=;
        b=vJtI7aN08G92Vd6oydO+nCoSkzNlqyCg9gB3IeR/OgqCbYomVvhII8R+yY6qUCG0Uz
         /zUbXzQH9s4y8a0mQjgMFk5k6Blz8A2cCJL5Xa8pvs167yEX6DookTMYYaFnIZGmV+IG
         7qoaFih0fR+flXhwdO0i2nXYZGBmHWv0sISYV80pQo6VTO7uzIhOsf3H277dztX1m9WP
         fNS/eoo8n7d9XZB6jViR/PkPwfb2P7kviQXxkcC9O6rzQSNXNwnP/dYBMWQbl8jC5g+u
         YS9UE9QHl2TPtmfnuVUe4x76mfhFrc79zeH5DJDPY/gFexcH11nHLRr1e46spmHOTdxJ
         vwpw==
X-Forwarded-Encrypted: i=1; AJvYcCWnw5mWaeJiMyKAwJS0mMUVbCc/XioqlV5E4FbNFU42B7lAoiQWwXpNOrD5nVqB+S8A05oqAMWSZvBThSR8@vger.kernel.org
X-Gm-Message-State: AOJu0YzsoLpUzH0OcH08bNpUBsTsDoB65a65qp5vArQH+8naueaQD4vE
	PHWkGlXwIoVNLhynjKUpCqFbVA1++936JubG05iooarSbwid8nnr4QhG8R/5IOzN8mcq+7Rszh1
	piKJdwe0=
X-Gm-Gg: ASbGncsxrsXh1CKEN4S0iLNFR40RsNldwYt+nL2uadJ4VbfITxHnMs9QwZkrzDxnNLP
	LfIBU+gJv+QG89TBNLJCw728gUsqK7QYEOUz2Q30RQKu3FQ19lfvpf70X+HNSdQIxDdxD+ytuPV
	qn12MsufqTsn6lfxV5axHjNiymQpYXo+p8SVI2HwvCkr1Uqyd1RX/xR3e/hqw6X1qRm10zN4GEf
	YCkVit8wt2S59EZTfm0PtfRWp22yeo+GgQXKNf2DG79mCl8orI5dIfrUm0dQxACBmsFD3I8hbGw
	0GOVMAwLIdmA/z6Nszdcflr+yY1mns/gvskkIuh8a7qqv5KaVR0//YKaFcj7q+Rzf4nnzQ==
X-Google-Smtp-Source: AGHT+IFlFSrl3XSTZnrLX3liutqht/hIRQLoBNZPN0qE0WMgTCPvfiUO9lKb3LhAK0eALpw01RUcqg==
X-Received: by 2002:a05:6000:1a87:b0:3a4:f7f3:2840 with SMTP id ffacd0b85a97d-3a51d8f60c3mr6177072f8f.1.1749128786358;
        Thu, 05 Jun 2025 06:06:26 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f99248a7sm23764615e9.36.2025.06.05.06.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:06:25 -0700 (PDT)
Message-ID: <99d180ad-7e64-41fc-b470-62300a064bbf@linaro.org>
Date: Thu, 5 Jun 2025 16:06:22 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dmaengine: qcom_hidma: fix memory leak on probe
 failure
To: Qasim Ijaz <qasdev00@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250601224231.24317-1-qasdev00@gmail.com>
 <20250601224231.24317-2-qasdev00@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250601224231.24317-2-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/2/25 01:42, Qasim Ijaz wrote:
> hidma_ll_init() is invoked to create and initialise a struct hidma_lldev
> object during hidma probe. During this a FIFO buffer is allocated, but
> if some failure occurs after (like hidma_ll_setup failure) we should
> clean up the FIFO.
> 
> Fixes: d1615ca2e085 ("dmaengine: qcom_hidma: implement lower level hardware interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

