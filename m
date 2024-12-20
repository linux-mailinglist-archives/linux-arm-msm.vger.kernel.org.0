Return-Path: <linux-arm-msm+bounces-42933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C69F8D64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 08:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B50B160CED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5111A01BD;
	Fri, 20 Dec 2024 07:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U0avEq3N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97489194A60
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734680574; cv=none; b=U1uA2P/U9cgE8Exlg0i9IdDmGiF1ZE8f3J95/I2xQtrq08agc/2fW8BsY+JrwH30kbeaNVV7k1N7l/Sh8V5zMtyXX/xTuqwjzkblNNj8ixYhovhp2DDmibH86Myjym0p7GnknqzzGSgPMsSFDNuwkFvM/9QtaFsA2oHffdDT8LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734680574; c=relaxed/simple;
	bh=fH/nWwluA34PdynhqfNw2egyiUIPOmjFp0MCLZqB740=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGOQC/RYEKkFWe7ImVdUf+wtlI0KlLFSLxkIr0wf3pN1T8qHT/GdFZq9um1s13oRvMgCJ64yZnpQdZpG7Uot0sWKN5lLVOm13+5T8B42O+Ok9Dzftzs4VPgs3ks52W26tpE8sug6GJM06ym/aequMj4bq/qhjXGz8FZikZQa3P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U0avEq3N; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-540254357c8so1494391e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 23:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734680569; x=1735285369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MMf0ktzYAxvbWhoZv2EKwNd/4v1glW65xIb5pyiK7eo=;
        b=U0avEq3NeSOFRdW7KvMRaR2U5VAKU8FB2Xa+YgBxxl+ISnU2RDIlESj4mVXHdpjpCZ
         obIuG7uiw2jvI9y9TagO+Mbc3DHGvS1dLJb253OgvzuTKJ57tv2jf+M0gYuovXecBmUG
         JrtX6BXdCEp6uerzednyHFbrEl8lu+CEoWSKkYi8NXknjWPWBSzf0ESGMc7DjzJ+tZQu
         H97pBF5Q0pGntXz8bDSfwOr9r2M+OX8ilujxWNVjhTikvVK2YiUBwuOW981u3K0OBm+f
         IL235iOZb4AatB/fgMz19KimYtiVsi7w3MO/xy+vlK2Z3xaTczRrVzdFg9zjA+EjdPWw
         v1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734680569; x=1735285369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMf0ktzYAxvbWhoZv2EKwNd/4v1glW65xIb5pyiK7eo=;
        b=nW5GgvozKYbeseCTCdU453GMJcDkSiF+RaXAiJZNL44lLfoYPYmRiOr2GlL2eAwvIw
         tZEePpDTkVHwHKTRlgUAqZemhRI995+kHc5OyetIDVVGP64YX8dM5Jd1yJ66f1m1ZR0G
         24xHah5kMzzhUw3edKgaizieCnBeFI0ASI+MeOT7RR11zm0CnXiDGncXl4xP/NzXQBzl
         9T8j+o6AL+y7HCXgjW9OtbWUTV/tX/idqZs6WRWWy8g2xW2QRessEl7MvDZYNAtZMe6w
         cCNS0qQVDYDDXcLyWPL2SOVEiS6dQCAeISE8KX5v32TFv6sMsifTWvHWgvjHstiSrKWY
         w2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVAkI1ykh6qZ/emtm6PAvXr5DmuBfSgB7Sq72uH1VRvwp36yUUBjoJpQcepB79hegNv2q9mDyLg9ei+1SLc@vger.kernel.org
X-Gm-Message-State: AOJu0YzmrhcFRNiXFXhIoDKg+CGMic3zgwd+zA3pCFYbPjlcGaaCkOeT
	aWa/I6d6n9Xepd9NgM+ftx9kL9/Ui0Seq7fQ/+0X4zfkAsTB25m8+xrinenuO/s=
X-Gm-Gg: ASbGncvFRGC2VfZZQL8wWLWpXfiz+Z2swwD7avoEQRWnRa+bMuKnjxfcfJdVYhx7YZx
	TuYir050QpR+VeNlJ2Oo84UnGWj25sU37JLod3WZA5/7aqtHQ5XAG2XlJOma45IaVU7o8k97b+B
	f2NVw5KDp/a7eedcj3Tc2IaX3cvivJAxLP9XTrC9r3YIzX4JbwXYHc4jvSeiKDtKdSKHHtoLSmj
	vF+YVeVqKdLDOcvCgoZ3/HD6XMY3gq/+5/eFbOlMe5QGOmzPoFZrEE6sdBrjzKpL6eoE8UBkz09
	XIq2qmw1uniVg2JrpPgKiFlH2rM3mYRdezHP
X-Google-Smtp-Source: AGHT+IEr2m5nVAnM2oVA+XlqIyj+MGkgyIXH0Mvf++9V/yDvxNczxdMg0p3NVrqpyxhiC1HTBPjDLQ==
X-Received: by 2002:a05:6512:1055:b0:540:2223:9b20 with SMTP id 2adb3069b0e04-54229597f42mr515113e87.53.1734680568766;
        Thu, 19 Dec 2024 23:42:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b096d3csm4541681fa.122.2024.12.19.23.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 23:42:47 -0800 (PST)
Date: Fri, 20 Dec 2024 09:42:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: ANANDU KRISHNAN E <quic_anane@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 1/2] misc: fastrpc: Deregister device nodes properly
 in error scenarios
Message-ID: <gq4wy7omvudevcmkb4ksfimul4ftfpmd622kxxlbvodao7gxoo@7nzx44jocn4s>
References: <20241220061854.24428-1-quic_anane@quicinc.com>
 <20241220061854.24428-2-quic_anane@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220061854.24428-2-quic_anane@quicinc.com>

On Fri, Dec 20, 2024 at 11:48:53AM +0530, ANANDU KRISHNAN E wrote:
> During fastrpc_rpmsg_probe, if secure device node registration
> succeeds but non-secure device node registration fails, the secure
> device node deregister is not called during error cleanup. Add proper
> exit paths to ensure proper cleanup in case of error.
> 
> Signed-off-by: ANANDU KRISHNAN E <quic_anane@quicinc.com>

Please fix your name in your Git setup. The patch misses Fixes: tag and
also cc:stable.

> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 48d08eeb2d20..ff144f0aa337 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2344,7 +2344,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  
>  		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>  		if (err)
> -			goto fdev_error;
> +			goto populate_error;
>  		break;
>  	default:
>  		err = -EINVAL;
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

