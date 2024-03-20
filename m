Return-Path: <linux-arm-msm+bounces-14670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9FF88153A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 17:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8A14284430
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 16:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2845554F83;
	Wed, 20 Mar 2024 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nqFEIgIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADEE53E13
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710950932; cv=none; b=M3Ugz6ZqOJnzt6bxL9HmEwJTNAg6rc9fUz7lV43GEmDUvliJnOS/4R+7BrS+j5XLS4U5on899lwrUosmJP5Q0BXxiAadqN7hiFqU/qvIEVRr+y0R3hMdECnsp7Gt5kDF33CUXgJT6rDdvPp6s+ruXHFEbWW+Fcdgbgd0tUmYVoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710950932; c=relaxed/simple;
	bh=5mgRIKvZE18i+NU8GUVCCwd9pcBsnNt96OUwKEZvEcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BPx5pcv9B7NxCmgz9OX2VA9feBYrVAZUpni3fg9L9uf19gh8zGP0gHpTEI6oYqntoG8RbI2KgFWul9ZMYeU0hkZY1TnWUU56P5z/0EP08tkfYCnxKQAZRSQ4R5+rBhYrH5FBALDYb66SvUdT046IKZmT5tFeV5jYrWTZoNDGvJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nqFEIgIh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513da1c1f26so23860e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710950927; x=1711555727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STdKZ1YTCOGuMZ4k+N27m1pIFIyChgbyuE8sqsxHhp0=;
        b=nqFEIgIhG56J8QSzWhR5Bboyga5u6OXLg7WV9dzZcJbo06rmlCxjpGsCORgAU17Tty
         yBYHkJmxpbWebpCRyXFGaUZoCrQg/xAhwzMhfS2eXRviZWK4j9w4zUJQf2Uoo/ZoBBGl
         ipFh9bGBiy1GBRXJj9HzgDBv/RA3SSuzQCQZ5uad1Mb896oukLkUeKcic+hCfb5YxSR9
         RhUnMIAmc1SYmD/WofH2rvfcrxqZq62zbFSz3vTP4dpW8d8X/Nj454VTHiHadkql8QuS
         0EWZ3rtk3pdskJ2a+N9dgJEAnyGtx/9DfSV3pAkH5t7EFPZToJ/7Qz6G6RuiBFrCJm0a
         cHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710950927; x=1711555727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STdKZ1YTCOGuMZ4k+N27m1pIFIyChgbyuE8sqsxHhp0=;
        b=MYAo8j4M6Ygq2gm3LPZcf/155ZNqMg26+L0p/DQz+E2MDXOU8zDZdv+7SI7Hagvp6e
         TQEEb9exgRh/WRY4kO/Fnv1hX1GN5iCPtP4DMlNkxNaS9Kz1GD/cpGVwIvCyKfAKgbP8
         WJbpqLqd//ATuOUsdHGWwCooa6T7z8zzKr4cl1Hqi62mdKY5XGsriTdTbyWHTB3P8EtA
         WMiO19MWn7SckkACQSzw/4wIyfpIdlDZ0E6LBOPEPYbwkRcDWk0LqIGaGLvTC5PMNME6
         bkRG8vW1aLhweNCD5YIk5ZrpUS+jrT5j+aBIJTDTapns3cosqyUQbte8w7tTutUBALfM
         V9kg==
X-Forwarded-Encrypted: i=1; AJvYcCWlEmxel4m5i65IHY74sOZ8I/ox9Fl+nD8FyVlI47/WrTduGDot97Erw4/j2hnfhxkJAUZuqjNLSlOaPKM/0q36iVbkO+06glwOpEP6Rg==
X-Gm-Message-State: AOJu0YzsdI+bXf1Q470whiTdL6dGjbj2WYVjLCJQVvOmYdJDBBIgOujP
	ZdPuFLMDHXWB2fSijCjkZ7xXE1u91qlHMT0nMuNn6eOoCvv17s0SNFHwTZ/jh4ziPjrgGBWn9p8
	y
X-Google-Smtp-Source: AGHT+IGvoLccX5vlTEu8f2RKp23Iekbq6/tDhDQls/lFwY6VUTEOInWbp4R8IY6fxygIl2uhGt5qqQ==
X-Received: by 2002:a05:6512:4844:b0:513:c8b8:aad2 with SMTP id ep4-20020a056512484400b00513c8b8aad2mr12403529lfb.57.1710950926117;
        Wed, 20 Mar 2024 09:08:46 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id d10-20020adfe88a000000b0033b6e26f0f9sm14924639wrm.42.2024.03.20.09.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 09:08:45 -0700 (PDT)
Message-ID: <21d2139f-8547-466a-9be1-fbeae1194869@linaro.org>
Date: Wed, 20 Mar 2024 16:08:44 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] media: qcom: camss: Add subdev notify support
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, mchehab@kernel.org, quic_yon@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240320141136.26827-1-quic_depengs@quicinc.com>
 <20240320141136.26827-3-quic_depengs@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240320141136.26827-3-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2024 14:11, Depeng Shao wrote:
> From: Yongsheng Li <quic_yon@quicinc.com>
> 
> The buf done irq and register update register are moved
> to CSID in SM8550, so but the write master configuration
> in VFE, in case adapt existing code logic. So add buf
> done and register related subdev event, and use the notify
> interface in the v4l2_device structure to communicate
> between CSID and VFE driver.


Shouldn't it be possible to just have a function to write internally ?

You know the indexes of the CSID -> VFE connection.

The subdev notify is I think not the right fit for this purpose within 
our driver.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index fddccb69da13..4a9e5a2d1f92 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -147,6 +147,13 @@ struct csid_hw_ops {
>   	 * @csid: CSID device
>   	 */
>   	void (*subdev_init)(struct csid_device *csid);
> +
> +	/*
> +	 * event - receive event from parent v4l2 device
> +	 * @csid: CSID device
> +	 */
> +	void (*event)(struct csid_device *csid,
> +			unsigned int evt_type, void *arg);
>   };
>   
>   struct csid_device {
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index c9b7fe82b1f0..ffe1b95eea98 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -61,6 +61,8 @@ struct csiphy_hw_ops {
>   	void (*lanes_disable)(struct csiphy_device *csiphy,
>   			      struct csiphy_config *cfg);
>   	irqreturn_t (*isr)(int irq, void *dev);
> +	void (*event)(struct csiphy_device *csiphy,
> +			unsigned int evt_type, void *arg);
>   };
>   
>   struct csiphy_device {
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 0572c9b08e11..9919fe0ff101 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -115,6 +115,8 @@ struct vfe_hw_ops {
>   	int (*vfe_halt)(struct vfe_device *vfe);
>   	void (*violation_read)(struct vfe_device *vfe);
>   	void (*vfe_wm_stop)(struct vfe_device *vfe, u8 wm);
> +	void (*event)(struct vfe_device *vfe,
> +			unsigned int evt_type, void *arg);
>   };
>   
>   struct vfe_isr_ops {
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1923615f0eea..b57cd25bf6c7 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1904,6 +1904,55 @@ static void camss_genpd_cleanup(struct camss *camss)
>   	dev_pm_domain_detach(camss->genpd, true);
>   }
>   
> +static void camss_v4l2_subdev_notify(struct v4l2_subdev *sd,
> +			unsigned int cmd, void *arg)
> +{
> +	struct v4l2_device *v4l2_dev = sd->v4l2_dev;
> +	struct camss *camss = to_camss(v4l2_dev);
> +	struct vfe_device *vfe;
> +	struct vfe_line *vfe_line;
> +	struct csid_device *csid;
> +	int evt_data = *(int *)arg;
> +
> +	if (camss->res->version != CAMSS_8550)
> +		return;
> +
> +	switch (cmd) {
> +	case NOTIFY_BUF_DONE:
> +		csid = v4l2_get_subdevdata(sd);
> +		vfe = &(camss->vfe[csid->id]);
> +		if (vfe->ops->event)
> +			vfe->ops->event(vfe,
> +				NOTIFY_BUF_DONE, (void *)&evt_data);
> +		break;
> +
> +	case NOTIFY_RUP:
> +		vfe_line = v4l2_get_subdevdata(sd);
> +		vfe = to_vfe(vfe_line);
> +		csid = &(camss->csid[vfe->id]);
> +
> +		if (csid->ops->event)
> +			csid->ops->event(csid,
> +				NOTIFY_RUP, (void *)&evt_data);
> +		break;
> +
> +	case NOTIFY_RUP_CLEAR:
> +		vfe_line = v4l2_get_subdevdata(sd);
> +		vfe = to_vfe(vfe_line);
> +		csid = &(camss->csid[vfe->id]);
> +
> +		if (csid->ops->event)
> +			csid->ops->event(csid,
> +				NOTIFY_RUP_CLEAR, (void *)&evt_data);
> +
> +		break;
> +
> +	default:
> +		dev_err(camss->dev, "Not supported evt type\n");
> +		break;
> +	}
> +}

I'm really not sure I see a good reason for this.

Why can't we just define calls between vfe and csid similar to

drivers/media/platform/qcom/camss/camss-csid.c:		ret = vfe_get(vfe);

---
bod

