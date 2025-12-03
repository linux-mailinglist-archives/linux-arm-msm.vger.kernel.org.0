Return-Path: <linux-arm-msm+bounces-84237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA48C9F489
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 15:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5F19F34871A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 14:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46C62FB963;
	Wed,  3 Dec 2025 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCG6Mu1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF722F3C35
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764772032; cv=none; b=l4HhZrdisqR4Toy8Y80THhNTRKQtF40OwAyFVFb7FgD1I0NbLkfK/mi+tYB18X1bmlAAEvhz45brZN0dZ3LnFqnKgQKdS89YM0SFGNaK62MQshaxoCVeDzkN2nvrt2v92wpBcHUq7mzp5A8NEfGSpb7qjy8XkDV0zqPMp+kKSZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764772032; c=relaxed/simple;
	bh=VfsI+OoResaz3tI9AL8kS4ShzuhL5tmXxgVPVzB7lZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENJErEuBSkbIdotJq/9wWbngZqD2eAKEOF5FIFfnbS2jab4ImF6d2RHBp25xy/CfTcpSyfmNJZlYElBHDetKpkOxk9c8CUjRU4j/LzclVvV6seaiTf6h2yapYlRtCErrW/o7ma0Dhxc+Ak3cQdqByMqPYdV5Xdl3oMBMrbu7PLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCG6Mu1l; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b22b1d3e7fso634908185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 06:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764772030; x=1765376830; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AOWnkIRJZlMYfvBdntLM8OIUOPXbDKElPfu2JoYWbfk=;
        b=hCG6Mu1l5jucqjW5z/HGYOlDkZ3gRWLK1RI467zzc3w2068PPcjxIF7hJJpMDmR6vy
         cJowm4MRXpMcQ6XGIQ7tr9dlzMHu1qcvuO2ppVA/9vA94V2iHxrdKSC25o4MD3Uwjlr+
         /9EN0/5pYA5plMWTsmNYa11YBTMa84NdmdvRvxVvbO8KCk6EMqKSMbBOY+epbclOE3mz
         fJsvO5AovpOFARvRwsQCG1Arrc0VxzvgL92HYceApSH1EgPLiFwOcxsBIYo2nz6fYtUc
         2pPe+IRQwf/qP/BpbhCEeg6X2oJR7Amt32qsWA9ACpZAm3w05mn7jerR6rMqDNI3kDjM
         h1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764772030; x=1765376830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOWnkIRJZlMYfvBdntLM8OIUOPXbDKElPfu2JoYWbfk=;
        b=PpYr0pAWXSU3cy6buSkc0vp+PCoTijAwJfl17d6qkKE//sAAV1tmFHCOzeVe6XAxAZ
         unwLHdIYF3TgmkrZ9wtEVfUe4x9Z3+w7JxJ47sjUdjN3CTGoeH8X91ZzIcNdcf8EcdJA
         lSyjdX8WrokAn0FSECFRD9Zg7Thu1Uoy26+4UKZlOaT/ilwlC1LY9Z3Vhs4jaR0n1fbQ
         DFfddxbpf5XcvierqPKw4UddFxhaHfxgRBcpTeH+uWKnO2TmKNmNp9fTmIneqIhvSYtJ
         2FGXOa3YmtqoKHJRbhagW2yyN9v/Uoqjjzr+57KgDN4+YnQCq89J0/Kbz+0Z7LGJR/bO
         3Myw==
X-Forwarded-Encrypted: i=1; AJvYcCUUEOaDCrYolehNyhmpV+xWVkOw3V7KH+jcV5xLywqWher8NetbQ76PxTJmhQm0EUH7vr+GQ5qKxk77hS2d@vger.kernel.org
X-Gm-Message-State: AOJu0YwwDp5aHf8aCnZCGXsl1ibh8Ry0TO5AbiaNtoCXWu9gubGF8kVF
	orfJGXFQHt/L7r1gEmVDQeoSXfHD0/bVRBHvZ6i+9xfY1aFl40FfktJQ+XwswaqhtIn69kfzFeq
	A3aW0RYt0VKZMsRo5MVXWUlJFoSkD6GqzzwSgAUTvbA==
X-Gm-Gg: ASbGncu+bwAHxjvzjUjhWG8/QIci7nQyPDogLHGhr6RKPm885HuGaLvfENAWt0DOI35
	/VvfNcCZCejdy+A4RPYL930zVl3UWfuqhR+RjYqe2xgtHJpIA5Se6rgvAS7I6vfpgFUd/iotcus
	qZ46QAHm4D2kIgWf8b8JW2tp7Ny9luLIrWS/eKk1PGbr2v/4eINR+7GN/WFNeLFQwNQ8vdLoNyM
	3q+xei6cVsj0W3bR2AFpeHSDu8i+CiBrPGk1UMnRSLRueawP+sNG7jITNq9MYFIIElcO2l+0crv
	50RzEjLuWAk9SMa64Q76fqoIPjWUtdS7Kq7Isr0=
X-Google-Smtp-Source: AGHT+IFNGJk4s9lPW6fY+k5+AVtO9FAylsbP6PpdkIIKavRVY5uJxDEvlJAXv4kVASM3j7tYT1/H9qLCpTrzGdArpA0=
X-Received: by 2002:a05:620a:448e:b0:8b2:eb66:c64 with SMTP id
 af79cd13be357-8b5e5646192mr333305285a.29.1764772029729; Wed, 03 Dec 2025
 06:27:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-4-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-4-1db9e621441a@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 3 Dec 2025 14:26:58 +0000
X-Gm-Features: AWmQ_bnOyt0zjYPZlE9hvMXqjUVxenScrOKMJzaNlCT6V8A1ZVtEm0eyoMNIGlk
Message-ID: <CAJ9a7Vg93PZzgxao6NjmGW2rJrZnnMj6+Lz3tdJ2P5AP-JS7ow@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] coresight: tmc: add create/clean functions for etr_buf_list
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sept 2025 at 03:02, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Create and insert or remove the etr_buf_node to/from the etr_buf_list.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 94 +++++++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tmc.h     |  2 +
>  2 files changed, 96 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..ed15991b3217 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1909,6 +1909,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
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
> +                       if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED) {
> +                               drvdata->sysfs_buf = NULL;
> +                               tmc_free_etr_buf(nd->sysfs_buf);
> +                               nd->sysfs_buf = NULL;
> +                       }
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
> + * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
> + * @drvdata:   driver data of the TMC device.
> + * @num_nodes: number of nodes want to create with the list.
> + *
> + * Return 0 upon success and return the error number if fail.
> + */
> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
> +{
> +       struct etr_buf_node *new_node;
> +       struct etr_buf *sysfs_buf;
> +       int i = 0, ret = 0;
> +
> +       /* We dont need a list if there is only one node */
> +       if (num_nodes < 2)
> +               return -EINVAL;
> +
> +       /* We expect that sysfs_buf in drvdata has already been allocated. */
> +       if (drvdata->sysfs_buf) {
> +               /* Directly insert the allocated sysfs_buf into the list first */
> +               new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
> +               if (IS_ERR(new_node))
> +                       return PTR_ERR(new_node);
> +
> +               new_node->sysfs_buf = drvdata->sysfs_buf;
> +               new_node->is_free = false;
> +               list_add(&new_node->node, &drvdata->etr_buf_list);
> +               i++;
> +       }
> +
> +       while (i < num_nodes) {
> +               new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
> +               if (IS_ERR(new_node)) {
> +                       ret = PTR_ERR(new_node);
> +                       break;
> +               }
> +
> +               sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
> +               if (IS_ERR(sysfs_buf)) {
> +                       kfree(new_node);
> +                       ret = PTR_ERR(new_node);
> +                       break;
> +               }
> +
> +               /* We dont have a available sysfs_buf in drvdata, setup one */
> +               if (!drvdata->sysfs_buf) {
> +                       drvdata->sysfs_buf = sysfs_buf;
> +                       new_node->is_free = false;
> +               } else
> +                       new_node->is_free = true;
> +
> +               new_node->sysfs_buf = sysfs_buf;
> +               list_add(&new_node->node, &drvdata->etr_buf_list);
> +               i++;
> +       }
> +
> +       /* Clean the list if there is an error */
> +       if (ret)
> +               tmc_clean_etr_buf_list(drvdata);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
> +
>  int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>  {
>         int ret = 0;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 292e25d82b62..ca0cba860d5f 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -459,5 +459,7 @@ void tmc_etr_remove_catu_ops(void);
>  struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>                                    enum cs_mode mode, void *data);
>  extern const struct attribute_group coresight_etr_group;
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
>
>  #endif
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

