Return-Path: <linux-arm-msm+bounces-106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D427E4941
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 20:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C256B1C209B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 19:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7A736AF4;
	Tue,  7 Nov 2023 19:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MgREWolN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7412036AF0
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 19:36:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87DE10C1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 11:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699385785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f2GkHL9Asj7cZ9gDAWnYJZ3/Dq1fD/MZuGhccXlmPBI=;
	b=MgREWolNd1OUGwr4kUNuSSAb+3Cf4DB7DMJ6pfT8lNvGQRTQDXvOZSPCmyD+TA+kvoWMC+
	mJ0b7TkM2NU1Ut0nQ9hGr0YB9rLGnoBe9b75MZPfEQRUunLEH9wuzs01O/WRXgJcSjBXJ3
	D5QDXqEVlYuyFD9rbih1RVQyOf84Jxw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-QHeSWx-xMbeWKOnOHVU1zQ-1; Tue, 07 Nov 2023 14:36:24 -0500
X-MC-Unique: QHeSWx-xMbeWKOnOHVU1zQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-66d412e2450so70869166d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 11:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699385784; x=1699990584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2GkHL9Asj7cZ9gDAWnYJZ3/Dq1fD/MZuGhccXlmPBI=;
        b=ZTYX0brNXleaeyBGNPxlCdXWI2VOp+L+yVAApGUVVRXPitqhISVnXifqyt4s9aZTEk
         oR+7uoZe8xtI8+KVvUWzCqtaJWpdfAhqE1ZHwwINRtQo25V8ACYHUG3/gdF0En9tmnPi
         pyM1lzpSutXG3GcVjTUdzvzSNCFIhBv2q1WmH3gdng+JKjNWJ/z2m3uKWDHqHX6/Zdz+
         jNODaWiMrrhg4K1PUtIYF6cMqU6msWK8HZhQX7hste4D6WWM1hQETc3/HH7ZItqmgxCI
         6/nk5WLlhoKq/gNPcb06/KKu/I0eN89pZb7eNpYhPeMTWAPg2gaD11/ks/FRYYHWYlxQ
         bqBQ==
X-Gm-Message-State: AOJu0YxH4e6weVPwZ7Toh4mxpcxI0utmw2GWUreKk/R/OJkZkjdHqWq2
	w+8+QVx2culy9XeT6T3aSraC4u1qmjpMbQxV1Ns+FVzjHiamLA6OnENSukZ7yG88fhyTN+Kx4pq
	SOky5DoLDwdXhMXzVC9g5NSwApA==
X-Received: by 2002:ad4:5ecf:0:b0:675:6a83:8084 with SMTP id jm15-20020ad45ecf000000b006756a838084mr17136099qvb.14.1699385783795;
        Tue, 07 Nov 2023 11:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCasVvUsu1Pm+2+uqpGskpzIAz52YVkupGLyfFo54ljOeoSzf1eiTLLEVSdNTLByNhDpkAJg==
X-Received: by 2002:ad4:5ecf:0:b0:675:6a83:8084 with SMTP id jm15-20020ad45ecf000000b006756a838084mr17136067qvb.14.1699385783454;
        Tue, 07 Nov 2023 11:36:23 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id k16-20020ad44210000000b0067169e210b3sm206076qvp.70.2023.11.07.11.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 11:36:23 -0800 (PST)
Date: Tue, 7 Nov 2023 13:36:20 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Can Guo <cang@qti.qualcomm.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org, 
	stanley.chu@mediatek.com, adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com, 
	junwoo80.lee@samsung.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	Alim Akhtar <alim.akhtar@samsung.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Brian Masney <bmasney@redhat.com>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>, 
	"open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] scsi: ufs: host: Rename structure ufs_dev_params
 to ufs_host_params
Message-ID: <fcovysoo6vxvqdrypfbnfyclrmifibio46rne5zhiqnmqhzd7k@5ltemasdhfxp>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
 <1699332374-9324-2-git-send-email-cang@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1699332374-9324-2-git-send-email-cang@qti.qualcomm.com>

On Mon, Nov 06, 2023 at 08:46:07PM -0800, Can Guo wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> Structure ufs_dev_params is actually used in UFS host vendor drivers to
> declare host specific power mode parameters, like ufs_<vendor>_params or
> host_cap, which makes the code not very straightforward to read. Rename the
> structure ufs_dev_params to ufs_host_params and unify the declarations in
> all vendor drivers to host_params.
> 
> In addition, rename the two functions ufshcd_init_dev_pwr_param() and

nit: s/ufshcd_init_dev_pwr_param/ufshcd_init_pwr_dev_param/

> ufshcd_get_dev_pwr_param() which work based on the ufs_host_params to

nit: s/ufshcd_get_dev_pwr_param/ufshcd_get_pwr_dev_param/

> ufshcd_init_host_param() and ufshcd_negotiate_pwr_param() respectively to
> avoid confusions.
> 
> This change does not change any functionalities or logic.
> 
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-exynos.c    |  7 +++---
>  drivers/ufs/host/ufs-hisi.c      | 11 ++++-----
>  drivers/ufs/host/ufs-mediatek.c  | 12 ++++------
>  drivers/ufs/host/ufs-qcom.c      | 12 ++++------
>  drivers/ufs/host/ufshcd-pltfrm.c | 49 ++++++++++++++++++++--------------------
>  drivers/ufs/host/ufshcd-pltfrm.h | 10 ++++----
>  6 files changed, 47 insertions(+), 54 deletions(-)
> 

<snip>

> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
> index da2558e..6e65b61 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -285,17 +285,17 @@ static int ufshcd_parse_operating_points(struct ufs_hba *hba)
>  }
>  
>  /**
> - * ufshcd_get_pwr_dev_param - get finally agreed attributes for
> + * ufshcd_negotiate_pwr_param - get finally agreed attributes for
>   *                            power mode change
> - * @pltfrm_param: pointer to platform parameters
> + * @host_param: pointer to platform parameters
>   * @dev_max: pointer to device attributes
>   * @agreed_pwr: returned agreed attributes
>   *
>   * Return: 0 on success, non-zero value on failure.
>   */
> -int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *pltfrm_param,
> -			     const struct ufs_pa_layer_attr *dev_max,
> -			     struct ufs_pa_layer_attr *agreed_pwr)
> +int ufshcd_negotiate_pwr_param(const struct ufs_host_params *host_param,
> +			       const struct ufs_pa_layer_attr *dev_max,
> +			       struct ufs_pa_layer_attr *agreed_pwr)
>  {
>  	int min_pltfrm_gear;

If you're going to change pltfrm -> host, maybe do so for
min_pltfrm_gear too? I think this all reads nicer with the functions
changed as is, but the consistency would be nice in my opinion.

Outside of those nits, I think this reads nicer now as well.

Acked-by: Andrew Halaney <ahalaney@redhat.com>


