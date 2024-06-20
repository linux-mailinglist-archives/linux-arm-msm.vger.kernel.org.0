Return-Path: <linux-arm-msm+bounces-23465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA1911554
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 00:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 997D61C2260E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CE184D14;
	Thu, 20 Jun 2024 22:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vurjd+Ie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984627D417
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 22:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718920936; cv=none; b=o3fT4b25ZV1u4gjG+hVyZYBX6nsz91rEGBw3M/WV+VtZKovQdbcJb7JB9hA9FRLKUBbeLGCFxbP/gS6BYs+UJ6/7IICBEc7rKV1xRnakCGxbZ4faq9omWr9y3YGkV0FNrAwxBujwhhHdPW/nun5GcH07HLrxt6npBX3kO8lhd9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718920936; c=relaxed/simple;
	bh=cVyiizOMpbxPQwsjbb6rA1f7tDSv/WNh3+4LyrUGEPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGKxs2bSfDfE5lnLqxey4xoN3eegTd5X55WyK+9bsXLqkMeye2uSunAczx4WV/pAkH7h7MCVu/j36HmyyWxct6OEzXk7T97GAyBQwf7ZTTEHEecrovcBKEXAb4kg0eIG/7qhlOlecmJn3ye5t9+YhIOBIUcz7LZtwLaXgYqhgWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vurjd+Ie; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c89d6b4adso1318352e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 15:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718920933; x=1719525733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6x5JCj3/cyNXFKJV+WGiz/xYC6JqEgOZmnqVyLRPaAE=;
        b=Vurjd+IejdZcBWL1hbFKz/gbYUzpMGFixKx9DCvgH5W4QouPZVhaiP/8d7Tk+aepZx
         XqJxDywzZ72MdjdtKUzf+5Q/wHm9h6A/BZjQHzDGHMNl5Z4ghSsvZ9xIiiDog8hEmxjk
         ONW4l0yxwzHIlISK/MgKAxiLVfdY8cU81ym9RPgcHsxtvC1a66aHl3kn6hFXqDGfCcue
         Bv11krrpVuxstBhZQdz7P0lTCLhgXlyDoXyHEBLIpVpXd+ecDAdbEZL5yCu8cWlKMtTu
         y+LX/eTN/zmRjH6JsjNip5hz7Zh54nKxhqDNnyUfntM6tHOklRdaRtLOc/D1wGvhQ9cF
         LPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718920933; x=1719525733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6x5JCj3/cyNXFKJV+WGiz/xYC6JqEgOZmnqVyLRPaAE=;
        b=E7E/x6Dfzkcjshe/lgsQxtNpLTK5nxuW9bhSrypD2/o8TmyAg1qosHwBsGQzlnwb4b
         2KZWT3FjHci8JnFnDfFt7pNasbJYhG52LFFSEyKi3ywRHI8NfKMwBstmJzp/dkr3V3JI
         6IPXSkxqNJLNJhAnLqvK4DIX9ERjuf8abpBgvRIDSuHENvfOXRxPPfPkSKCu/9YkIz0Y
         Cg75q9tHe0AheVndSFxWGvsX9c4CqC+Jbcvd4gUAAToKDxdfCEOjmHCbXlDN9QMneFzG
         DW9lck4/WnpT337+63BdRWtepD55X1FVLGelIho2QOCmWv0INAwmnPIvLK9Zy7d+3yR/
         h4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqhKmbbF6Bl0ruMsMqZ0HQieup4PfOjDK/4F5r19nIwJS2bwY+s1asTr55OIjObtKkqT6OZ1csAULtfCGt81p/CxxUWe5XrmyM8MSkVg==
X-Gm-Message-State: AOJu0YwqXXQSzbrSQdn5OYh/ZXFIs8VKC8TP7DJByLpV9cHBvvE9dhYJ
	ewzDTVrV9K2hLsozNpF4avlv4jq+4MvA1/GkAw9/2DKCUn5aZsJ0YemRmVhMnI0=
X-Google-Smtp-Source: AGHT+IFQmq8YG3yD7xXewOG2w2nkOzpMucoN+8L5aSkle3PekvPaef/va0KGBf0ODMADUcswyxVPDA==
X-Received: by 2002:ac2:5f87:0:b0:52c:d639:dd4b with SMTP id 2adb3069b0e04-52cd639ddedmr40338e87.23.1718920932622;
        Thu, 20 Jun 2024 15:02:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd64496eesm6739e87.253.2024.06.20.15.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 15:02:12 -0700 (PDT)
Date: Fri, 21 Jun 2024 01:02:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chukun Pan <amadeus@jmu.edu.cn>, 
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 1/2] clk: qcom: gcc-ipq6018: update sdcc max clock
 frequency
Message-ID: <gps5nwdwhf2mnjfvae7gnnahtiu53tkqkoqsip75xfrabls7b6@zhmhihx7vhxo>
References: <20240620150122.1406631-1-amadeus@jmu.edu.cn>
 <20240620150122.1406631-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620150122.1406631-2-amadeus@jmu.edu.cn>

On Thu, Jun 20, 2024 at 11:01:21PM GMT, Chukun Pan wrote:
> The mmc controller of the IPQ6018 does not support HS400 mode.
> So adjust the maximum clock frequency of sdcc to 200 MHz (HS200).
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Fixes?

> ---
>  drivers/clk/qcom/gcc-ipq6018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> index 7e69de34c310..6c764e3e2665 100644
> --- a/drivers/clk/qcom/gcc-ipq6018.c
> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> @@ -1617,7 +1617,7 @@ static const struct freq_tbl ftbl_sdcc_apps_clk_src[] = {
>  	F(96000000, P_GPLL2, 12, 0, 0),
>  	F(177777778, P_GPLL0, 4.5, 0, 0),
>  	F(192000000, P_GPLL2, 6, 0, 0),
> -	F(384000000, P_GPLL2, 3, 0, 0),
> +	F(200000000, P_GPLL0, 4, 0, 0),
>  	{ }
>  };
>  
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

