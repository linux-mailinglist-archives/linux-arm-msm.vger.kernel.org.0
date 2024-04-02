Return-Path: <linux-arm-msm+bounces-16140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C703F895B50
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 20:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19387B299E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 18:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B2515AD80;
	Tue,  2 Apr 2024 18:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e8Lpyd1W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6D215AAC7
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712080802; cv=none; b=aCdMSgOl1bS5HumfGam4xCIszclui/cD86h9NixxtxOi/1vr0TnHmhLtpKe0PtynakG3BY+POpHkKw1i5c6QN4IKpFkhyLMC9ZDHdvIsbtTbDpwKNakEZiAD1lWD0314KB5UuEMtx9erFsnjEtNCMcquPRNmGPz5ZOr7Lr/rgPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712080802; c=relaxed/simple;
	bh=XuH/Mn3d9quSPPFx4KukBbASBGyIymuiYnObzB8IZLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LX2kRs1MPnemPIwPyb2Y49ZWDhhF9FHX+QrENESj0Wq5k5ATQX8+/ClVYhsPeQfNMEtLIJA46s8oLICv0YVpmCZkjjSXYFH6qWvNTJNFBw4XazXonSTC3BAdkt0nNThY1+fqww+FMe/hSiI1FF1saJM+TNdIYqgxzw79nQm3j98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e8Lpyd1W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712080799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BgcE9nccHXFxfGc///KBrqv9RnPqQu1MeIv0SuevzR8=;
	b=e8Lpyd1WN462njYI1LKeTsvAcrhc9UFLAV/8yo3o4QsteiZVB2K12OxCsl8xnjhBem5F8Y
	p/Z4QslgkI4fQVtvsn+8KAtslRX48NGMpxA7+pclGpgaM073TF+SVQJQubBHVV2qXbw4bi
	y/ERwAzXwFsxqGhWCZ+56pnFA2hIUMY=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-uUVkpkD2PfiKhFrLOkC9pQ-1; Tue, 02 Apr 2024 13:59:56 -0400
X-MC-Unique: uUVkpkD2PfiKhFrLOkC9pQ-1
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-4d459468a9fso2709781e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 10:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712080796; x=1712685596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgcE9nccHXFxfGc///KBrqv9RnPqQu1MeIv0SuevzR8=;
        b=H4MCbPxcdZdv8cdN7oOA2ktr19Mg3enqhL5Nf5NOxNsMVetHSucxXJ59KJ9K3qTwes
         71c+oHYPo1bm/qa74mZ/nmJzH0ezR3F7hbLko0o5nr51XnRoKn+YHfBmr0YD/+x+SXxW
         sr/8//KxhNG+pw+rRY1V09IjcMXUxUydH47xCzkpdvNSWo3qqqVietDJEvH8bLpNNyCH
         /Oq6gVey+h8yKj8DLJ2M9ib3E//K/NZNvY2DYvNVeWrkCdqRQ6li/Pp6+drlZYVBjBOO
         A+85kCe/GSPgdmGv+AbGpeTs/D+609bOW//DRzxqtUncR1jtwJEkAaj7k7FYxQigza8z
         JoiA==
X-Forwarded-Encrypted: i=1; AJvYcCX47IeZvuR07raYbM1Sq0QdF2BtCtGCn7lEll/7j6bbONENlABnTPz1gW5xqU0JSSCnLlrJIyjg5yVS53d7D/49pVhFBW7AfUX8Fe4klw==
X-Gm-Message-State: AOJu0Ywe5I27QvX2NFSAX9Vcpp8x64OJH+lETiCDL9mI/5p91e+uiSrL
	dYTVzFk0QtoWE5ChM2YVKoRAwAWTPQh4C5ehdfxKsLt++YvsU51rtHpludJQctJSevzkj4/crgm
	O6xAbkPUnjsaIVGq9cw+72DI68KM2HkRvgG8idhsyeykHjjkKPNCUbk9Ns326v6M=
X-Received: by 2002:a05:6122:2809:b0:4d4:be1:8196 with SMTP id en9-20020a056122280900b004d40be18196mr505303vkb.11.1712080795873;
        Tue, 02 Apr 2024 10:59:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeb+2S+Ps4Yp69Gg7jKl2j0TZKgn8/ehqbQLCWCnfgI3PqE8IK+fDwOGE9mlwKHVkZMcNUoQ==
X-Received: by 2002:a05:6122:2809:b0:4d4:be1:8196 with SMTP id en9-20020a056122280900b004d40be18196mr505284vkb.11.1712080795484;
        Tue, 02 Apr 2024 10:59:55 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id iu12-20020ad45ccc000000b006986e15fbc8sm5606379qvb.141.2024.04.02.10.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 10:59:55 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:59:53 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: pmic_glink: notify clients about the
 current state
Message-ID: <2bj6m72cnuuscp4me6zwygehyf6fo7b72q5f5pkp7d4c4uwdmu@6arpnxh6wsw2>
References: <20240402-pmic-glink-fix-clients-v1-0-885440b81c65@linaro.org>
 <20240402-pmic-glink-fix-clients-v1-2-885440b81c65@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402-pmic-glink-fix-clients-v1-2-885440b81c65@linaro.org>

On Tue, Apr 02, 2024 at 08:07:07PM +0300, Dmitry Baryshkov wrote:
> In case the client is registered after the pmic-glink recived a response
> from the Protection Domain mapper, it is going to miss the notification
> about the state. Notify clients about the current state upon
> registration.
> 
> Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")

This looks and sounds reasonable to me.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/soc/qcom/pmic_glink.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index c999358771b3..089cdfb1c9d1 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -83,9 +83,14 @@ struct pmic_glink_client *devm_pmic_glink_register_client(struct device *dev,
>  	client->pdr_notify = pdr;
>  	client->priv = priv;
>  
> +	mutex_lock(&pg->state_lock);
>  	mutex_lock(&pg->client_lock);
> +
>  	list_add(&client->node, &pg->clients);
> +	client->pdr_notify(client->priv, pg->client_state);
> +
>  	mutex_unlock(&pg->client_lock);
> +	mutex_unlock(&pg->state_lock);
>  
>  	devres_add(dev, client);
>  
> 
> -- 
> 2.39.2
> 
> 


