Return-Path: <linux-arm-msm+bounces-21178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1168C8D5675
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 01:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C396C2841F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 23:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1F517C7DF;
	Thu, 30 May 2024 23:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8RAdDzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C0517B418
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 23:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717112811; cv=none; b=Pj32Eyelqp0rOqFgh8WRrealWQyFJmEQ9VNiwWKnrAiWshvTBbDJYpnNpzqYD1Sc6OXmTahdYdtLRnK1p42sdOfTA07eBDnZI6piFNSl9GChu9meg/q5If144VfjRDv0WYbCuN6sKbqNt6EwKy69SScBwU6wdwpAOklDvX1uH8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717112811; c=relaxed/simple;
	bh=OiDFUSZKxT6Rif882GoUplx7qTXswfn4VKAvqojFb1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7R7nzg+zx1vevYE7SwSPm9fMiEtkYr6fOrfxVD0hYUMw9y66i4tB+3lsgLPBw1KZPmkYRmS+k78CuLkAUB6/pZg5qcjMDwLrkDHBeXLPER2tW9DybT32gAZcDCbyK1a7eWFznAmgvJw+tPOKIBydjHiJdlISButKQkIvAxnask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8RAdDzQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52961b77655so1740852e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717112807; x=1717717607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TqYhTWdc3i8Fdgb0yK5b8TAAsu46Db3dQq9MJYvwFsU=;
        b=z8RAdDzQYjTKOW1yiOfpgLfPzkPuAY+6WcIL1UI4eR1zjE3GjlGMN8gEZCThb36aXl
         gwc9llnW8J/ebI3Ji8IwrgVP1HEeR46FIyrtuguF54x7U6k9Ejs+8Hv6KvNnX4qjC7Zn
         /SxWHEzUFuYppi+YGhCB+mPOFHPACSWqpPwZkgNNYY6pLDtneB0g54Le96JAbW5xzSLL
         lMiScW83EjA57lxATLbWNziuKT/t5TfVhAebILjqmcGoU6GvhW2zxa0f10XoYwKV7wcU
         waoETErsMUlrI4iUtVYKUieY0ZHU7RHxPB3lvnlcFFMMc0rB1IPxt2w8u92DeRJSj+3r
         82SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717112807; x=1717717607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqYhTWdc3i8Fdgb0yK5b8TAAsu46Db3dQq9MJYvwFsU=;
        b=DubSAIDleEpdXNaj8vzJG/Ehukz7ck7C5e2XSrU25r2nusrOLURLEKBpH99M8jd/ZJ
         Fxzhci5iGkNBvm0cBYCm4WqaQnQlq/EN5d0O7dLQ6NMv/H13y3zNh3NsVqUMrJ0MqRz5
         JUsJcKzHdB59t7CfI1GqvyvFOUuIc//ZLewFJ2iGMF8iNLXBdT2j0lhPwzZQlPn/8IHQ
         qI7dxRJMX9RfuUCXH+uNhdvYKenzSmQ5uOUdx9UWuGlv6NCLGhpKP7X7hrBOr5udSaii
         fPgDJwF5aSD0OELYdo2mZ5nCOTDyo5HunUzzWDgmUoO1DoS7xj2dw1VnLRvys4QA8izT
         zbZw==
X-Forwarded-Encrypted: i=1; AJvYcCUAjnWHxgbG05VLcPNZqXdqbH1Uss3r7Y8kqa3WDDMWQrQ1CIjoN/9hh51vm7T9lzAzJITzOr1r17A8ApqjNaS2BFkXYw5I38z4yiV2Nw==
X-Gm-Message-State: AOJu0YwEqCVW1XBRYxUt6HmQP83v8Kya3gdWUW6NUwWx+1b0UPj1p2tH
	3+TZ2ruwwOR2So6yq1geS+4TAJhjHfuzyOiJgEji3YzON6mbUh+hWj3vz/j9KO8=
X-Google-Smtp-Source: AGHT+IEG2iIZJLnA0cuElEgPD3AlHlvdKnp3M8PivTQOeWaa45z4wPM8eL5Ju+bWjaTJPQS6xJnDdg==
X-Received: by 2002:a19:a416:0:b0:52b:87e6:ec9 with SMTP id 2adb3069b0e04-52b8970bf3emr51110e87.53.1717112807437;
        Thu, 30 May 2024 16:46:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d894c3sm127070e87.249.2024.05.30.16.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 16:46:47 -0700 (PDT)
Date: Fri, 31 May 2024 02:46:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v3 7/9] misc: fastrpc: Restrict untrusted app to attach
 to privileged PD
Message-ID: <m6wt2nvxjdyll3wg2hlfyixwtcjag4nucsgriygytpisathlsw@ba4avjyceqo6>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-8-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530102032.27179-8-quic_ekangupt@quicinc.com>

On Thu, May 30, 2024 at 03:50:25PM +0530, Ekansh Gupta wrote:
> Untrusted application with access to only non-secure fastrpc device
> node can attach to root_pd or static PDs if it can make the respective
> init request. This can cause problems as the untrusted application
> can send bad requests to root_pd or static PDs. Add changes to reject
> attach to privileged PDs if the request is being made using non-secure
> fastrpc device node.
> 
> Fixes: 0871561055e6 ("misc: fastrpc: Add support for audiopd")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

