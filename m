Return-Path: <linux-arm-msm+bounces-16139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22572895B37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 19:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D17A52847BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 17:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD6015AABF;
	Tue,  2 Apr 2024 17:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hm7Ap90H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547EB15AAA7
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 17:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712080599; cv=none; b=SQIPH+HR0ZQkuPmVwXsvaAncNH5zb0h7VCfrRs51lWJ4ru0h9a77HBOuud242PTfCM6fqZ+cpayN+VxUCAp9GVywHzEhQGI264xCZgRCwMYi+4X8cXd10mvrKqzKEWyPlFZryYvAaAfiMZol+bFkQcOH4JjgAFi1roXVlat5oIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712080599; c=relaxed/simple;
	bh=0Y6h6f3cPtEsQDZknsO+IagBdcnjM+3VtzRY1FTs2/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArDw3CCnjwKYdysFv596jYbZgQWr/neo7UJppJZIBkDfJGN+7vboINhLh4SA+1D+8mEMydPg6UEJYgVByuflgONoJ5nMw/+T5QBzWLWmqMqAgfqxHm0SopuKbGN1lhMW1fisuIDE8aIiwIpnr+25VwYUeza8MfakuElLJXLvS3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hm7Ap90H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712080597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LgMPjza/41g8vlyeiXDj0QiyYeEN86lA9UA/Jcby8CQ=;
	b=hm7Ap90H7GsFfhV33bgg0V533p/vpZhe4HDv+567kyTrpVf9uD/WixEG70PNwn+DiKnt1Z
	qz7H5CQlAXi9FgQ7NhobR+VaZZedSxllBkDRA7E4FhkoYpJxkGQ+LleSCpoZBV2bW09hQv
	lgTCz8yuCrbJxYo18ve6MxE3vwaq64Q=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-2NB_RypdM2aNB1W-MBsPrw-1; Tue, 02 Apr 2024 13:56:35 -0400
X-MC-Unique: 2NB_RypdM2aNB1W-MBsPrw-1
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-7db36de2f09so766296241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 10:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712080595; x=1712685395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgMPjza/41g8vlyeiXDj0QiyYeEN86lA9UA/Jcby8CQ=;
        b=A/Y6pcYZ9MchhLiyZK7JbWIwMA+V9uM7yonUXrCB4IU8KV2TgBNJ5UPOs79yoKmci/
         qlCIh70jobTNTk54XXemQ4mhXFNNjUXf0PR+PzkXF4jiAY8AV+yTNOWnU0bS0bZ3nGFE
         JbcRIMb8DAkaNCi7olpCSc6ZV0PWdjM5ernqZBVq1GK2aXjMkEBD6vckxqLky6kwx3fE
         3xgrtLf3NobnQawnmdaJ70minXW9WKNBOHR9sMGFivXgGhlYNea7nWgvn9Hr/7FV3gaW
         PycFn4mzKBO9aafVKN8Y+JhCLWlF8wDwku4Awc/mnvHgMZ+4SHm/yRTMg4oN3gS6XkNl
         +tfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEtkOSOKiDb/tcqBK0PVVAdvn4hSRVXy29t+gNPDGyCnWgrAtsR9DV+YtKH8OakEjZMw+vFLvgo8MJaKLuVEixwcuFt5p6CZUKhdgMpw==
X-Gm-Message-State: AOJu0YwE/vkd9HI/afCuvanpc1Kp15yTdCL5RWoJ6atHe7qBTHqphgbR
	GpdTrW27LKvVliI4nDZ1xr2J98PPl7DkPqdYyzGN2LwLHqGircpQq6kIgx5+9g2sSPUU5W8ewf+
	yi0D2ZgPErqAfPhxvMqX1gUID36t3Sy6o3RNqvBl1iry1UUmKsL1Am7GpbyCLoJQ=
X-Received: by 2002:a05:6102:f99:b0:478:7dd0:7488 with SMTP id e25-20020a0561020f9900b004787dd07488mr727574vsv.4.1712080595038;
        Tue, 02 Apr 2024 10:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+lfB7uf7k84U2D44uUXyWufZapIjUE6tvJzLJYPJoE/4FXuwNIDcI9vGzqEr0VES/yLDjqg==
X-Received: by 2002:a05:6102:f99:b0:478:7dd0:7488 with SMTP id e25-20020a0561020f9900b004787dd07488mr727549vsv.4.1712080594706;
        Tue, 02 Apr 2024 10:56:34 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id gw4-20020a0562140f0400b00698fd28cad3sm3465470qvb.80.2024.04.02.10.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 10:56:34 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:56:32 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: pmic_glink: don't traverse clients list
 without a lock
Message-ID: <bnxrstkmjmmbhzrqncfwwnxa5vpx3ioysykqr3sbiirlatneu4@vlewrjturppo>
References: <20240402-pmic-glink-fix-clients-v1-0-885440b81c65@linaro.org>
 <20240402-pmic-glink-fix-clients-v1-1-885440b81c65@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402-pmic-glink-fix-clients-v1-1-885440b81c65@linaro.org>

On Tue, Apr 02, 2024 at 08:07:06PM +0300, Dmitry Baryshkov wrote:
> Take the client_lock before traversing the clients list at the
> pmic_glink_state_notify_clients() function. This is required to keep the
> list traversal safe from concurrent modification.
> 
> Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/soc/qcom/pmic_glink.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index f913e9bd57ed..c999358771b3 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -168,8 +168,10 @@ static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
>  	}

Does pmic_glink_rpmsg_callback() deserve similar locking when traversing
the clients list?

>  
>  	if (new_state != pg->client_state) {
> +		mutex_lock(&pg->client_lock);
>  		list_for_each_entry(client, &pg->clients, node)
>  			client->pdr_notify(client->priv, new_state);
> +		mutex_unlock(&pg->client_lock);
>  		pg->client_state = new_state;
>  	}
>  }
> 
> -- 
> 2.39.2
> 
> 


