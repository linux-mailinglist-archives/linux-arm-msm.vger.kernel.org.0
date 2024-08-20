Return-Path: <linux-arm-msm+bounces-29110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BAD9585BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 13:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 953A31F27452
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F37C18DF9E;
	Tue, 20 Aug 2024 11:25:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A1B18CC1A;
	Tue, 20 Aug 2024 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724153111; cv=none; b=AP1ftCn3LZtjZWOPp2k48cJzQyiuJloL9TzoeWXeIKovVDiYKD3BocZnzjgYF3dIenw+/5K7NB+H2RMHHoSnlOpeX6R6z1VybFG84Yr998kAIdZiPnZ1bwHysH489tkZ/opmPlw6nunLHaiEmU8kQuNbdkFQK65BEpzBKnqh/mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724153111; c=relaxed/simple;
	bh=gjCYzcqyuRHXpIrLSf/3XlCVJMmVcwuGMwedyFnywfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1+P1hKRk9PsuNI+VTKkrOzzdhr36ChOQSCbrdTvfVdhoScE+uIxisB6J8KrdNd7Bdd5AvpB6d0cqQ1mIpIo8nuJN2qTncKxBhYCHBIh9+zO1sWVV5iY5oTzq3rRTZzkhk0lawLMf0Rhu+9q70rPRw55tHDzeq3fivHm0C/l0iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6bf75ed0e0eso27815236d6.1;
        Tue, 20 Aug 2024 04:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724153108; x=1724757908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsya9Zu/RasxujU7u7STxlhKAW9hbTP1IVYkuBBPCtE=;
        b=UmpfJR3mZvgPB2fuWpYgesCK/epKqPvlnoKmlYvl3e9lKg8uBl8mnMzOx8RWtyMqs9
         ablmwscCOppz+Cb+v+OhXrwjsdWTUvFLtkgIFSBtrAEPA5Lu8/DIYcITn8g+8QXQDJT2
         Xlxsf8/2jVc6KS+BSYOqWDvwL0qy/oNtzJZxbRaIMtwOCShXWcEMGC0CeF8VXtWiFRTp
         pKm7xJ0a26ie0hZz2cLk8TLtOMETOoFcUbdJIgHWvlmOhiGu/59FSohoiHO0UOr86lY1
         rYNPjJM17bi7R6jbqIdoFUtl5vK8WWccC66WGgoKNbrN5tZMufJBj2ZkEJ0pbfr0ozZS
         b0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUCeLcj9+vLlYQ/Zwmy5XkT6+dS/bZ8+3jHzTdvy5rjYA3tgAI6M9bGPPdl5COCyNv/H3LH9A4IzEL0FpN4sQ==@vger.kernel.org, AJvYcCUl4fGYl9XuakQJwmi1Mz7dLmlLOLh29LRT2dmx0MguWGyHHPxygT/Eg1lPoFpsgZYga/5NeUTOwwpB/rmW@vger.kernel.org, AJvYcCV2/x5F4J3lfwFxALPh4VKJHuECJUkfpxdF3lmgK73mXVeFfXEaU3OaS8zaugey1LFPhfE4p9Aprg7i@vger.kernel.org, AJvYcCVWqV9Emq4QeF3i84VZGNfpb9rxoC3dYHeAZ7M4sLJPSyULIdDOq7KWjmSIvbpnsj3a7lIiFyci7d4fLBagC6phMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+gKv1vbFd2wiIkF+y3ooYqguvrhhwxQluGxZWPS+Z9sAnEqtk
	/QPPoZsEm6uz7BQ0NUIwebZlxO6tiqA8lQ7qUdTutHWfxtpnFi5URFfhJBz/
X-Google-Smtp-Source: AGHT+IEzCEAgN24aSwEHhv9LZ4/HTaQFSwHcVZ3FCi2xK/t+E69+kjzqK5UsacVPhzvaC55O3ixglQ==
X-Received: by 2002:a05:6214:4a07:b0:6bf:745e:d48e with SMTP id 6a1803df08f44-6bf7ce67f9dmr184877126d6.51.1724153108513;
        Tue, 20 Aug 2024 04:25:08 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm51356136d6.40.2024.08.20.04.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 04:25:07 -0700 (PDT)
Date: Tue, 20 Aug 2024 13:25:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: andersson@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_viswanat@quicinc.com, quic_mmanikan@quicinc.com, 
	quic_varada@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH 2/2] remoteproc: qcom: add hexagon based WCSS secure PIL
 driver
Message-ID: <4y37wrg7gi3unpqw5ukgd6jrwuqmuofcabhmtwzlgfpgtiighw@74abrhmpzktv>
References: <20240820085517.435566-1-quic_gokulsri@quicinc.com>
 <20240820085517.435566-3-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820085517.435566-3-quic_gokulsri@quicinc.com>

On Tue, Aug 20, 2024 at 02:25:15PM +0530, Gokul Sriram Palanisamy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> 
> Add support to bring up hexagon based WCSS secure PIL remoteproc.
> IPQ5332, IPQ9574 supports secure PIL remoteproc.
> 
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> +static int wcss_sec_dump_segments(struct rproc *rproc,
> +				  const struct firmware *fw)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct reserved_mem *rmem = NULL;
> +	struct device_node *node;
> +	int num_segs, index = 0;
> +	int ret;
> +
> +	/* Parse through additional reserved memory regions for the rproc
> +	 * and add them to the coredump segments
> +	 */
> +	num_segs = of_count_phandle_with_args(dev->of_node,
> +					      "memory-region", NULL);
> +	while (index < num_segs) {
> +		node = of_parse_phandle(dev->of_node,
> +					"memory-region", index);
> +		if (!node)
> +			return -EINVAL;
> +
> +		rmem = of_reserved_mem_lookup(node);
> +		if (!rmem) {
> +			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
> +				index, num_segs);

Leaking refcnt.

> +			return -EINVAL;
> +		}
> +
> +		of_node_put(node);
> +
> +		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
> +			&rmem->base, &rmem->size);
> +		ret = rproc_coredump_add_custom_segment(rproc,
> +							rmem->base,
> +							rmem->size,
> +							wcss_sec_copy_segment,
> +							NULL);
> +		if (ret)
> +			return ret;
> +
> +		index++;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct rproc_ops wcss_sec_ops = {
> +	.start = wcss_sec_start,
> +	.stop = wcss_sec_stop,
> +	.da_to_va = wcss_sec_da_to_va,
> +	.load = wcss_sec_load,
> +	.get_boot_addr = rproc_elf_get_boot_addr,
> +	.panic = wcss_sec_panic,
> +	.parse_fw = wcss_sec_dump_segments,
> +};
> +
> +static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
> +{
> +	struct reserved_mem *rmem = NULL;
> +	struct device_node *node;
> +	struct device *dev = wcss->dev;
> +
> +	node = of_parse_phandle(dev->of_node, "memory-region", 0);
> +	if (node) {
> +		rmem = of_reserved_mem_lookup(node);
> +	} else {

No, that's over complicated.

Just if (!node) { error handling }.

> +		dev_err(dev, "can't find phandle memory-region\n");
> +		return -EINVAL;
> +	}
> +
> +	of_node_put(node);
> +
> +	if (!rmem) {
> +		dev_err(dev, "unable to acquire memory-region\n");
> +		return -EINVAL;
> +	}
> +
> +	wcss->mem_phys = rmem->base;
> +	wcss->mem_reloc = rmem->base;
> +	wcss->mem_size = rmem->size;
> +	wcss->mem_region = devm_ioremap_wc(dev, wcss->mem_phys, wcss->mem_size);
> +	if (!wcss->mem_region) {
> +		dev_err(dev, "unable to map memory region: %pa+%pa\n",
> +			&rmem->base, &rmem->size);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +

...

> +static int wcss_sec_ipq5332_init_clk(struct wcss_sec *wcss)
> +{
> +	int ret;
> +	struct device *dev = wcss->dev;
> +
> +	wcss->im_sleep = devm_clk_get(wcss->dev, "im_sleep");
> +	if (IS_ERR(wcss->im_sleep)) {
> +		ret = PTR_ERR(wcss->im_sleep);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get im_sleep clock");

Syntax is return dev_err_probe.

> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(wcss->im_sleep);
> +	if (ret) {
> +		dev_err(dev, "could not enable im_sleep clk\n");
> +		return ret;

Just use devm_clk_get_enabled.

> +	}
> +
> +	return 0;

Best regards,
Krzysztof


