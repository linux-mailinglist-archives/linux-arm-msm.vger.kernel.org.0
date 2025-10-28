Return-Path: <linux-arm-msm+bounces-79255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85233C161C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 18:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6CB9C4ED7A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F5834B1A2;
	Tue, 28 Oct 2025 17:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rW1MW/YY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C88285C9D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672021; cv=none; b=dBSWjRNI2XepTm/hg5UfId9vJYq4KuE1sXknvtS3xFqxN+pDm7hlXp+kHUGysBZa1yRIz7uQbEw9sfTzVwJ8ox1U3aW2AEzoGR5Qb8rZ+XEnLrDgVph0Pm+9uDs7D6jfnRz9ne9R95jfFx40RNlvAOfHepxJA/+J7yMTf6HCP3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672021; c=relaxed/simple;
	bh=ne+oS5H6z7JHWav73oVglAywE3vtySrxSDIgfblNIW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFZ1I1EI0umGOIWfSMKsnALSBOk5co4M06vZXlUnN1Q8ZRPbDeZzAn8iSA+SnzEzipvwj9M9CYhyTrsljvpUQ4xmg94+3o7ZMklInDxI3UvGJDzEJlGjgDEP6Txv0MWR7gA0wQthv62Mx6FQwRcWJnBkTH3jndv8vH0gBhDySNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rW1MW/YY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4270a3464caso3139345f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761672016; x=1762276816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uFNR+yqQDNKQ0KUWuXjjm3zqWjAn6Hk7JWkoBuP7tog=;
        b=rW1MW/YYiUVs7KqNWW5S/wzwzAjVgMFN72mwu1dgDqGdZjwXhMNiqXeP/EmrrhJHvx
         ln1GVWiGYgqr0QGP/M0sS/cSneBYSd+Gu23MEM5bPZmG+YSiZvv4SU84un9Q9fE5pICB
         QCp5d3CZ6C6wdRdm8tOhQBjjD0raXvWio7Crl9gyRzuYVMoPaXeHskjP25K0SJ/jQwI6
         R38AQwmt59slAd3ge7LO1B023I0INudwQGHxSgMtMOv+qlazbsvM1s+VMRSiATZTf5eP
         Xix123DVpvLOdf/3y2pB8Zpf1Yds11RgsTxu3ta5HbKR0ZvX2z/gAfl3ECrcSKO1iZan
         7hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761672016; x=1762276816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFNR+yqQDNKQ0KUWuXjjm3zqWjAn6Hk7JWkoBuP7tog=;
        b=dr5zdkw2jcWCs6dE1Mpm58Hp8WLTF91mAws7hDA/h6gA4huz260Js8S8dInqa/MBDz
         I8TDxIG+J5Db9AcuiQe66SjmZoqrm2F5K2jZs/+cWdz5TmtpT3LrYKrCdlsgjLnKsKAT
         HPtDD2tYeTSYHo+1FYVtH8Hz+AgZPuhQDbRwnMc/VifiWZbJLLZaJhfcqBFSdBVddbWI
         TnIHhsnmL8g0RPR2OJbkHH17oMfeiqJApo9CTz8qtoWZ+5NYEqrp4c6lIxV8TelXiRqM
         uIFbUVTthKXPVyTvi2O5T+nTrjYuqKEkuz3WpAHu9zeyvcfzoTuKgoHzMEi/k4PXBqmI
         z+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5eKBbcq8avWtArm3OExhV7mtdRnLHxbMsAll9gA3fLVYS8JdW/lMuPlJLD7upzZ64A4/Qgd0YzlnRg4S5@vger.kernel.org
X-Gm-Message-State: AOJu0YxJR4GV/szUjxjlJ0qMkzPeL5tp2ecq2wQ2LJ8CVPd2uN6aU2ax
	bz4fakLfqAOncizcqX+M1zrw4Z4kPXb/qfyK1CS5tv8qDYg6vomLe4DeUFJI8+U2I7A=
X-Gm-Gg: ASbGncsfEDQrOr2GcWwWQpvN4fbE+zqkAae1wqq2jjbXNzsCmIqPFwVOAK/GFS/kuZ6
	2EVokjlPC8IhEu31tsGATur/ujcCejhKCt99UQDpZCn5p7vgjO5Hm88iM9IAjHzygiodZqagmNs
	DplOba++bCRU8KQQIzChb1o0k/ExjhDrZJyx7R6hlsyZRwwaHjJ/etBI68mBs+iSO4reGzM2vO6
	hwf0WvgKZ5KCSk0c3l2A49IfGLAnDyA4RpWH7U1pgVT4rvtyYq0lg0Ohz6paRnUVA9X9o3Q+icc
	ElPCJn+/B9Kkx32nZiO1fSIkR/GlWO82ZwaM4QGBRyvXZoiriyXiI79EDetmE6ETPHVSbL9lsuv
	4q/gcX4nBn2WP1kXSORqN47hnd5nDWXe+ntnyHkJhmKN+yk0MDm9IHNT1pV7nZKzwaRT9Oycr
X-Google-Smtp-Source: AGHT+IHcdJ1fq9ADGcrcW4ZZKZhaA9eWlkrpV7+uDO6SDMKBeox7ZwKnGdmhFMB9LLUGwuioqWc7tw==
X-Received: by 2002:a05:6000:2c05:b0:428:4354:aa36 with SMTP id ffacd0b85a97d-429a7e919f2mr3775348f8f.58.1761672015770;
        Tue, 28 Oct 2025 10:20:15 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db99asm21844711f8f.32.2025.10.28.10.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:20:14 -0700 (PDT)
Date: Tue, 28 Oct 2025 19:20:13 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: pmic_glink: Add charger PDR service
 path and service name to client data
Message-ID: <5uyhz4uv7ccsj7cevimqrsoywne6f5ax5j2t4uosz6a7due4ac@3x4ouutt5nwy>
References: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
 <20251027212250.3847537-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027212250.3847537-3-anjelique.melendez@oss.qualcomm.com>

On 25-10-27 14:22:50, Anjelique Melendez wrote:
> Currently, the charger PD service path and service name are hard coded
> however these paths are not guaranteed to be the same between PMICs. For
> example, on Kaanapali and Glymur, Charger FW runs on SOCCP(another subsystem)
> which does not have any specific charger PDs defined.
> 
> Define charger PDR service path and service name as client data so that
> each PMIC generation can properly define these paths.
> 
> While at it, add the qcom,kaanapali-pmic-glink and
> qcom,glymur-pmic-glink compatible strings.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 66 ++++++++++++++++++++++-------------
>  1 file changed, 42 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index c0a4be5df926..aa5ba9a0285e 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -23,13 +23,19 @@ enum {
>  	PMIC_GLINK_CLIENT_UCSI,
>  };
>  
> +struct pmic_glink_data {
> +	unsigned long	client_mask;
> +	char		*charger_pdr_service_name;
> +	char		*charger_pdr_service_path;
> +};
> +
>  struct pmic_glink {
>  	struct device *dev;
>  	struct pdr_handle *pdr;
>  
>  	struct rpmsg_endpoint *ept;
>  
> -	unsigned long client_mask;
> +	const struct pmic_glink_data *data;
>  
>  	struct auxiliary_device altmode_aux;
>  	struct auxiliary_device ps_aux;
> @@ -285,7 +291,6 @@ static struct rpmsg_driver pmic_glink_rpmsg_driver = {
>  
>  static int pmic_glink_probe(struct platform_device *pdev)
>  {
> -	const unsigned long *match_data;
>  	struct pdr_service *service;
>  	struct pmic_glink *pg;
>  	int ret;
> @@ -302,12 +307,10 @@ static int pmic_glink_probe(struct platform_device *pdev)
>  	spin_lock_init(&pg->client_lock);
>  	mutex_init(&pg->state_lock);
>  
> -	match_data = (unsigned long *)of_device_get_match_data(&pdev->dev);
> -	if (!match_data)
> +	pg->data = of_device_get_match_data(&pdev->dev);
> +	if (!pg->data)
>  		return -EINVAL;
>  
> -	pg->client_mask = *match_data;
> -
>  	pg->pdr = pdr_handle_alloc(pmic_glink_pdr_callback, pg);
>  	if (IS_ERR(pg->pdr)) {
>  		ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->pdr),
> @@ -315,27 +318,30 @@ static int pmic_glink_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
> +	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
>  		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi");
>  		if (ret)
>  			goto out_release_pdr_handle;
>  	}
> -	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
> +	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
>  		ret = pmic_glink_add_aux_device(pg, &pg->altmode_aux, "altmode");
>  		if (ret)
>  			goto out_release_ucsi_aux;
>  	}
> -	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT)) {
> +	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_BATT)) {
>  		ret = pmic_glink_add_aux_device(pg, &pg->ps_aux, "power-supply");
>  		if (ret)
>  			goto out_release_altmode_aux;
>  	}
>  
> -	service = pdr_add_lookup(pg->pdr, "tms/servreg", "msm/adsp/charger_pd");
> -	if (IS_ERR(service)) {
> -		ret = dev_err_probe(&pdev->dev, PTR_ERR(service),
> -				    "failed adding pdr lookup for charger_pd\n");
> -		goto out_release_aux_devices;
> +	if (pg->data->charger_pdr_service_name && pg->data->charger_pdr_service_path) {
> +		service = pdr_add_lookup(pg->pdr, pg->data->charger_pdr_service_name,
> +					 pg->data->charger_pdr_service_path);
> +		if (IS_ERR(service)) {
> +			ret = dev_err_probe(&pdev->dev, PTR_ERR(service),
> +					    "failed adding pdr lookup for charger_pd\n");
> +			goto out_release_aux_devices;
> +		}
>  	}

But this does nothing on Kaanapali and Glymur. Am I wrong?

Yes, you do not have a charger PD on Glymur, but you do have an ssr,
for which you do need to register a notifier instead.

You need to be doing something like this:
https://gitlab.com/Linaro/arm64-laptops/linux/-/commit/2cd84e303d263d8fd5de3730714a16c29cc6788b

