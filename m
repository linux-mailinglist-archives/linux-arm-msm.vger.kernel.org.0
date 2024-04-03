Return-Path: <linux-arm-msm+bounces-16317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE3C8973DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 17:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48A9C28F315
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 15:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27B514A4C0;
	Wed,  3 Apr 2024 15:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YqNfB7P0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F809149E14
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712157476; cv=none; b=cWb4k21qsNTmD6srWVROUVjxFqgIZ9NsvKFuMLSoi9SLNGqgm+UGLlMXbsqbrM2DZG94iTP9x0vIm5Ne/Q7juV6zFOi5vkLYAKBPZv0wJDsnUifPFB1vRr5TvIbeip4UL2LuHlHIgDwrNRhlRi8oB0PRb0z4UHP7N50vmCVhIRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712157476; c=relaxed/simple;
	bh=63M5+iENCP6o3+OtSya6mLfBZXgHKXiowr8g+FUgFKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2XYhJfY1JmyjFtN2xRuknKdRjSpoTCCVyQCXjK91z+//OQ/8fHjRlIAt1KNeILNBn60iSRmRflUnIRlnLw0coiiXRZcmZ40KJoF9Q/8sgaKGbfLiLhFH64w7FrRV1xQ8oL4T3gdH3Tuc/Sz9KBpgyqG0x2Txp3DwT1BM1pZ57A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YqNfB7P0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712157474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AC0NMQx8eq5E1d+G3VcUzmMMCOpidmHhVgTwE7vP0Is=;
	b=YqNfB7P0XGf0aOEy/5XqBVUTx28/UiswD9ghH/WhcdI/k428BxfdqZBsK2tCLy6mv7QyMZ
	ALPB7a8mDjTSVLg9+UvcX1eKjTtWeqjEwfgXFpO8ZEbFWvGqtSJY0qk70Bzb1OawHbzGKz
	2PaxRYGcFCpRrBgOsk/zuikEIwoYnYY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-8CJfsMiLNqCC1UEFvQLoWg-1; Wed, 03 Apr 2024 11:17:50 -0400
X-MC-Unique: 8CJfsMiLNqCC1UEFvQLoWg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-432f160f5d9so30847071cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 08:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712157470; x=1712762270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC0NMQx8eq5E1d+G3VcUzmMMCOpidmHhVgTwE7vP0Is=;
        b=Wr7ywpKsNAlkiueqCy9a5tpYri7qGnk0Pa0lN7HAsg8kqfIzzSYgjTpFftWS8adF65
         2N7mY6FMptKy42AMWVc053FD6Cg8Lm1A1j3U1b2s2R1MAhs/J33mTPtm75ei1fnt1VD+
         xixA1MsMa97ZhwlhbRkKc1iaRhe6xPxqCOhvy4OPUsHubHC1nf4u4T5SMjgSQp8TRhpy
         tD4GyZqxSySWf+JVR5CfkJ6OSbYFbkT210Z6DQJCjqq3zbieFxQTMJIGA2RM3cbiA2JZ
         IXK1xgfGGvwxvm0gSOy66fh1cYLpO9gQGvKoNKAak0Lr0qfE6Ardz23MLKrv5YWFHgks
         jhoA==
X-Forwarded-Encrypted: i=1; AJvYcCU5RJA4juJd0Y8dpCUYNyYCo46G+ImEGQsPhtSkmzwlhJR4sw9i4KGgV1JQABs+Lbbe2YZfbJwahV+wlLFsYh5t4oMA4sS5NEy8Wr18Nw==
X-Gm-Message-State: AOJu0Ywt1beDvTw17wbnbWEpQznGc4IG2i8xD9XwygnMP1v+JQh+RF+Y
	tQyp4zVFypCg5I5Q+Ytt8DALl0m2surJnFQxpa3vmGEDm5WRG6gWAvaJCgTqFT5JT2ZNSyXy7/z
	qcjflfxcMts8CyGRNRYlWG6I53VZBhXcpphuXHtBqYbjPJwsyXR1vxONccSfRSkM=
X-Received: by 2002:ac8:5d49:0:b0:430:d175:5a80 with SMTP id g9-20020ac85d49000000b00430d1755a80mr3590041qtx.14.1712157469952;
        Wed, 03 Apr 2024 08:17:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi851ZLhBiO96hLqacoDLGsW6KbgoLdmI/JpdNzUViwbLr6IkVm2P+PHQQDQajvuPPYWlLow==
X-Received: by 2002:ac8:5d49:0:b0:430:d175:5a80 with SMTP id g9-20020ac85d49000000b00430d1755a80mr3590001qtx.14.1712157469395;
        Wed, 03 Apr 2024 08:17:49 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id ea3-20020a05622a5b0300b004315aa3d5d7sm6686783qtb.0.2024.04.03.08.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 08:17:49 -0700 (PDT)
Date: Wed, 3 Apr 2024 10:17:47 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] soc: qcom: pmic_glink: don't traverse clients
 list without a lock
Message-ID: <cnpl3m4r76wbpqgjb7vw3i6wldavpvrprd7nxrbor3s4v5kuky@wixormy7sdmx>
References: <20240403-pmic-glink-fix-clients-v2-0-aed4e02baacc@linaro.org>
 <20240403-pmic-glink-fix-clients-v2-1-aed4e02baacc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403-pmic-glink-fix-clients-v2-1-aed4e02baacc@linaro.org>

On Wed, Apr 03, 2024 at 06:10:57AM +0300, Dmitry Baryshkov wrote:
> Take the client_lock before traversing the clients list at the
> pmic_glink_state_notify_clients() function. This is required to keep the
> list traversal safe from concurrent modification.
> 
> Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/soc/qcom/pmic_glink.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index f913e9bd57ed..2b2cdf479654 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -115,10 +115,12 @@ static int pmic_glink_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  
>  	hdr = data;
>  
> +	mutex_lock(&pg->client_lock);
>  	list_for_each_entry(client, &pg->clients, node) {
>  		if (client->id == le32_to_cpu(hdr->owner))
>  			client->cb(data, len, client->priv);
>  	}
> +	mutex_unlock(&pg->client_lock);
>  
>  	return 0;
>  }
> @@ -168,8 +170,10 @@ static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
>  	}
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


