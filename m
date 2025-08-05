Return-Path: <linux-arm-msm+bounces-67773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE963B1B1FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 12:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AC1F164B5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 10:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5E3156237;
	Tue,  5 Aug 2025 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1/VhBDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58922580F1
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754389682; cv=none; b=arXFnNkCqSVo35OroRAHEBHbyoSUMdeA+KsXWTOvcF3vuv+sk+rkf2xjwWRGMS5JWDE5NjwaEIjvDKcBSv3v4zj6svEHLu7B21+nM13bllznzpTUEAfQbnpLKF5A8MZjkZ5EK4muSCDQAD6+0xpk/rGgXZm/R9G6xf2JIeLOrjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754389682; c=relaxed/simple;
	bh=qdYBwGiQPyTlzeMzpPG4YNqV6VehzXxiooDuDvvIuGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGtBnwJg/eRRFqkVCwj6fn93G7X/QZv6m5/Wwo5cESGHXfYY+fhZRSwcb5TjXkYKenMm1I+Devr0BfK/wjfOKjlRR5lI8EHwSt+eTIp0XfOOSEioP/ALCJmTKKbprlHdanG4oAJ/QE3UBnJX5T5BPf7enlEOFGmWhV41VhBeNLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1/VhBDW; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-615622ed70fso8242183a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754389679; x=1754994479; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CuKxFEasqrRga1svukmOdXqoUcSU7DlhJE2c0KdevIw=;
        b=V1/VhBDWXVcvvpdEhU6zNhqwN8UWZP/vH6g4dzuMNVT1rZQhNZFFcMdo7ciHPuCrgd
         1WAU3sesj1TQv7ioByjyeNmvMqeWW5MJqFdshXjNIWlEHFn1yWHPFyxH/CH27dGTVVhl
         UZl8J4t3BEnjZgnTA7diCoarbj1Lj03UFnrQ4DtNV4vP5qMT1BvPQL3TMqhMqH5XkAvA
         Wz0G5NP2yPQ7v7BgJbRLS8qgq9NAv0TsteUiXAchvpa0Or3RdFnIrFTY2B5u9Y3RWDR/
         kzuLTEeXuwzq6UZQCNCiVxvmx7tXu9u6Xcm70PM2VhLPVqTscGWA28tOzo/WkKXXDOEY
         py8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754389679; x=1754994479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuKxFEasqrRga1svukmOdXqoUcSU7DlhJE2c0KdevIw=;
        b=dkXZgoUwAvU1FZZOL8D2FaiWAll004ZHV6EfkNN4cZTWEOIYUv3CYrVSQTjKnz9X+D
         H8Dc3NnmsgRbu63QP8J1JePH4JWym+R+mU9Y5moZ4zJGqpLbRQdZ4nwf9Lm6ffCfUKfm
         b/5FPDaJYyYzReFPLaiL6cH2ofvhDgCk839ZS4uJ1huoDZOZg6upP2alu60OWTLe6NsB
         waI/l5puWN+5Bl1Ixjli0icvrKUqz+V+HQLUh2kEc9jUuQvsJPhVPISn+4mQNvLsvfmM
         dyJRMovAVwEzoKFk7a44OAs2tgqeY8GfL0Mv9XCfwV5/LBS0vQV4ZW+1MCyHglD1TCDr
         QSEg==
X-Forwarded-Encrypted: i=1; AJvYcCW4daqKSYlT9Fqt0DHrfdFsKcrNGwhe2JVVN2y8VLDC4xvoda9jHRNew8XNFcp3qkbu0kW6HgMswn9WTSGZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxgU4Oddl7jesRSTk6Y+Npx4Zrrs7B9VGp5foTZFCIHGKlFF/kb
	gxZzbScy0PlrigGj5njcSl3g/hsQu5KIETejzWpMTzWSCyaVjUjS3y4W6hCjPBepXkE/WIh9JPc
	vHTATszQOnSBKWDrLO3TqoTPfQWmTkbIfkIx+Xt7JWUrW3ZLxAEsu2ZU=
X-Gm-Gg: ASbGncun03BUWAzB/vD9DYxyq529eDJD+tCMy2ReMioL9AaUiqynV5OwmvykJRKUeBV
	JXhxCwah8tyzH1zMzlPMdkh9o0UMIHph0JvIfV7QDi/iWYaK21tlLkQ8COaYJziNna2hclcycCr
	6DWzmCS5thRXI1dVyrWJi+GvsrXUeGo6FTr/oVk/5rQcy9tLfb42prC9c9C8zWiF6jDOUsj0KYu
	tyMGIT/k+pJ0oZ8
X-Google-Smtp-Source: AGHT+IFU5LPvkb/N/Tw+uEtqevCLgU2MttiUFFLbm7KabFbJpklF9fl5AWplCqLxTcMRubhBHLG45fl0R75pQjr5Qc8=
X-Received: by 2002:a17:907:9689:b0:ae3:163a:f69a with SMTP id
 a640c23a62f3a-af9401b0360mr1300344066b.33.1754389679184; Tue, 05 Aug 2025
 03:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com> <20250725100806.1157-5-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250725100806.1157-5-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 5 Aug 2025 11:27:46 +0100
X-Gm-Features: Ac12FXyGWj4GgjsQixe5QNRaeCqpVKLMP7WtlbnmlyKxm20j9zCO0LZQIksxx1s
Message-ID: <CAJ9a7VgOTfDHG+nrEUQ5+fxrcCd+ZaWWnxt_F8kavbHP38QCVw@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] coresight: tmc: add create/delete functions for etr_buf_node
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Create and insert or remove the etr_buf_node to/from the etr_buf_list.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 65 +++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tmc.h   |  2 +
>  2 files changed, 67 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..e8ecb3e087ab 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1909,6 +1909,71 @@ const struct coresight_ops tmc_etr_cs_ops = {
>         .panic_ops      = &tmc_etr_sync_ops,
>  };
>
> +/**
> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
> + * @drvdata:   driver data of the TMC device.
> + *
> + * Remove the allocated node from the list and free the extra buffer.
> + */
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
> +{
> +       struct etr_buf_node *nd, *next;
> +
> +       list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
> +               if (nd->sysfs_buf == drvdata->sysfs_buf) {
> +                       list_del(&nd->node);
> +                       kfree(nd);
> +               } else {
> +                       /* Free allocated buffers which are not utilized by ETR */
> +                       list_del(&nd->node);
> +                       tmc_free_etr_buf(nd->sysfs_buf);
> +                       nd->sysfs_buf = NULL;
> +                       kfree(nd);
> +               }
> +       }
> +}
> +EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
> +
> +/**
> + * tmc_create_etr_buf_node - create a node to store the alloc_buf and
> + * insert the node to the etr_buf_list. Create a new buffer if the
> + * alloc_buf is NULL.
> + * @drvdata:   driver data of the TMC device.
> + * @alloc_buf: the buffer that is inserted to the list.
> + *
> + * Return 0 upon success and return the error number if fail.
> + */
> +int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf)

This list handle function pair look a little asymmetric. Is it not
possible to change this to tmc_create_etr_buf_list(struct tmc_drvdata
*drvdata, int num_nodes)
so that one function creates all the nodes, and another destroys them.

In the logic that decides between using multi buffer or single buffer
you can then use  a construct such as:

if (single_buffer)
      drvdata->sysfs_buf = <alloc sysfs buffer>
else {
     tmc_create_etr_buf_list(drvdata, 2);
     <switch in avail buffer to drvdata->sysfs_buf
}

> +{
> +       struct etr_buf_node *sysfs_buf_node;
> +       struct etr_buf *sysfs_buf;
> +
> +       if (!alloc_buf) {
> +               sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
> +               if (IS_ERR(sysfs_buf))
> +                       return PTR_ERR(sysfs_buf);
> +       } else
> +               sysfs_buf = alloc_buf;
> +
> +       sysfs_buf_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
> +       if (IS_ERR(sysfs_buf_node)) {
> +               if (!alloc_buf)
> +                       tmc_free_etr_buf(sysfs_buf);
> +               return PTR_ERR(sysfs_buf_node);
> +       }
> +
> +       sysfs_buf_node->sysfs_buf = sysfs_buf;
> +       sysfs_buf_node->reading = false;
> +       if (!alloc_buf)
> +               sysfs_buf_node->is_free = true;
> +       else
> +               sysfs_buf_node->is_free = false;
> +       list_add(&sysfs_buf_node->node, &drvdata->etr_buf_list);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_node);
> +
>  int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>  {
>         int ret = 0;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 52ee5f8efe8c..3cb8ba9f88f5 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -461,5 +461,7 @@ void tmc_etr_remove_catu_ops(void);
>  struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>                                    enum cs_mode mode, void *data);
>  extern const struct attribute_group coresight_etr_group;
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
> +int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf);
>
>  #endif
> --
> 2.34.1
>

Regards

Mike
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

