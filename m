Return-Path: <linux-arm-msm+bounces-37150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B529BF41D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 18:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB3E51C23451
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 17:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E4B2076B5;
	Wed,  6 Nov 2024 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XKVa7f8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC3A2076AA
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Nov 2024 17:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730913210; cv=none; b=Hkzx1bs40SDyvtdaKoYmwhwawQDgyozjZ7bQZ9WQBs9OTGj2LvdtNxJzy3C8ygQcJpBXRCpAmhFp2eC0LDPftS+xJYpw6ijzi1RVOGsr4LwKX8likejphsItAsmEj0g73v/1WCqbC2+zmY6boqmVk8rXb9XIP7dse0qTSfIYinU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730913210; c=relaxed/simple;
	bh=HWA6WwXEa8NmER/NxLu39EO5D474iX8PomLkWuNDyaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtdMl4cdXGHdqYiMPSc0MaiugJ6uN2pS/uJW6A/n1Z1uAcr5EFiN/L0lhlfAasjieag2z5Jig4fcpfQjiY9qQz+gm0hhLr1g2P5j68avMoVfap5Y7CkKN7x47hmGM45lEvhEoqO0WxjM9ykwBZoGVk0Fhu/CpcJQnV5VZlI97Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XKVa7f8u; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43169902057so459295e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2024 09:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730913207; x=1731518007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nWxkLmSYZt8bb8qa+yKimaqE18BPc68KrcHf4c2nOUw=;
        b=XKVa7f8ugPljp0OCn6dig89AY7PCAj/q/7zOEOtjXInxGHS/zTR/LqhCpzDUyhAsbt
         4us4+75xABPeICJOr1k7lYHTN480e2f5UMz+MZrS71fK5JwYulDv8f9Y3UWsXqdcM1zB
         0ayCHrnwiUIlfaW+IFRGUoS5B/ewUIYLi98hONsMm7ABIIk0+eH2lii4cqDvH1GPtZxe
         Qigw6ti1hGVEgKZhuXqPvwiw5Al8wDis2lxj5/VVSLnzm1hqeE0X+x2Mt1InI1UlpupJ
         bDqVuTC6D6xXb+MQHxySzZdJQdbDvpPVtbEIEg3xAnUd7avHRBMfMC9JRH6z+vAeTCns
         z5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730913207; x=1731518007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWxkLmSYZt8bb8qa+yKimaqE18BPc68KrcHf4c2nOUw=;
        b=E2r1tkg7Z8L5UoRaZtzI9GF85VGcJ52Jrz+gOeJ9ugt74OvN1CkK4n95jb4Y1EPXyu
         Wj5GdUcwQxqYqqq5umGgqCrX91T6fX9iC3E+YhKHVQWw0HZaBKGGp0+BGXm7QIvkCBEw
         szV1rMsyoi5RyBgozZBVG3avkqpVTANogU4/xcpOtL0haJxuG7JAWwJsrIffYzHu7TTD
         HFLKz61ay2xBHcOtYTpTFxi39nFY6f6XLeAit5fm5RjPhDk9sKAwJE7y068zU7uckeFm
         R7UkW1teppzfqTdb6kTneXVMwOwsraw98bgjBB7eq4150iWkJ0YMHBKOEdKPJj7+zFkR
         rG5g==
X-Forwarded-Encrypted: i=1; AJvYcCUnw+wFg62NkmqmuHNOFyywBjsTs/m4VYc2o9gsu2TDdW00Pnr4LcGX0+JLz//PWz/Z3h2dvv1h9BBhamv4@vger.kernel.org
X-Gm-Message-State: AOJu0YzONhVkdfeIEVjX/NSoczuh9IUbLijV9kYT7sPBSfgNFt27QyoF
	yIHosrro/7x/Apk9bKRv1sIBruCQrdA5h50JnlYm1qOh2J4eCG9hnmwbN7Mv+IU=
X-Google-Smtp-Source: AGHT+IF94+4n9DkLA8ryG4ma5I1NS45gXV4wdJ033eQXkLHagSLJ09QodataxdxrklvqlMUrudmtOQ==
X-Received: by 2002:a05:600c:458f:b0:431:5ed4:7e7d with SMTP id 5b1f17b1804b1-4327a82f755mr243023525e9.18.1730913207006;
        Wed, 06 Nov 2024 09:13:27 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6eb5fesm30793125e9.41.2024.11.06.09.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 09:13:26 -0800 (PST)
Date: Wed, 6 Nov 2024 19:13:25 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogeurs@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 2/2] usb: typec: ucsi: glink: be more precise on
 orientation-aware ports
Message-ID: <ZyujtW8XvehO/6q4@linaro.org>
References: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
 <20241106-ucsi-glue-fixes-v1-2-d0183d78c522@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-ucsi-glue-fixes-v1-2-d0183d78c522@linaro.org>

On 24-11-06 17:45:55, Dmitry Baryshkov wrote:
> Instead of checking if any of the USB-C ports have orientation GPIO and
> thus is orientation-aware, check for the GPIO for the port being
> registered.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 2e12758000a7d2d62f6e0b273cb29eafa631122c..90948cd6d2972402465a2adaba3e1ed055cf0cfa 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -172,12 +172,12 @@ static int pmic_glink_ucsi_async_control(struct ucsi *__ucsi, u64 command)
>  static void pmic_glink_ucsi_update_connector(struct ucsi_connector *con)
>  {
>  	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
> -	int i;
>  
> -	for (i = 0; i < PMIC_GLINK_MAX_PORTS; i++) {
> -		if (ucsi->port_orientation[i])
> -			con->typec_cap.orientation_aware = true;
> -	}
> +	if (con->num > PMIC_GLINK_MAX_PORTS ||
> +	    !ucsi->port_orientation[con->num - 1])
> +		return;
> +
> +	con->typec_cap.orientation_aware = true;
>  }
>  
>  static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
> 
> -- 
> 2.39.5
> 

