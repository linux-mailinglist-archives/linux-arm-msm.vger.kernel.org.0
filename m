Return-Path: <linux-arm-msm+bounces-81599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A23C575DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 13:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B605B3B7E79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 12:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D427A34DB6D;
	Thu, 13 Nov 2025 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lcuaqM7F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9494D33892C
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763036394; cv=none; b=FO/n0D+1IZIIvAolGLL0J4OS+VmiQrnUwsMa2xIgGVEKFKKQG/Rg6w1fuGGs7g5m1w2pRRgJk4dlzuwkJS2AG+9pP0An+ooD4ZVqsg7DzwsIZUCy++MKnxZlwL43o5ITKeKB9OLD2TGTK4+zP+QLOTiEpnwa2v8ix89QKfjKoGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763036394; c=relaxed/simple;
	bh=hFrCmasW3dJTdQBRMZd6hGI1h3snbWI80Lfv91M7y5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9C15oVx1P4QY1cf1DON30tQ2nRtGe3bkygIV501yMDvz9AbH4vWfRWzBYeygzuNAlLjDBNT8w2VBW8jPn9DVYdLujtCFV/+6eAcIYhk4ylEckWGeUcdTxPapnBugk/0GKgI/iyRS46BFNV+pks0O1RQJyLTyudqw0wEH0QEpAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lcuaqM7F; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775638d819so4323115e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 04:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763036391; x=1763641191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=duoUSRGaQi6NsgJv/pi2xphHVVy8YVSx2yc+RI8LbNM=;
        b=lcuaqM7FJqIR2jCcmr+onbMPfm33h254BG2NZIL48yjHPaG7uVxl9tGItTF4sC0lV7
         KKpknjevQNwMKL+dmuJM8MNTT2EWsa00yQirXEgwUvMoUyao54q5a4nRCn63dLIzQUwv
         zQeLJVezreN6Xe5cJo2tPt6RG04DrBOmIYgSTuj2DCx7AGjUJQq9FI0ZWmTWDOt02r5s
         yx791dnAi+YIkast4kjoAjFQp3M3vk9OGUNchTLN5RSNnj0SX3Up0L2lR9qbj4FWg7W0
         vWtkS/0Q0xnNVAStOeDBdyX/JEBfYm0UbDLirSpW59TcuXXAUELVHAvjR5bW3yxnJto+
         /3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763036391; x=1763641191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duoUSRGaQi6NsgJv/pi2xphHVVy8YVSx2yc+RI8LbNM=;
        b=aqFk/7F4luSY6QikkHpwS9mcXR9wG6xJhnon6JU1bIrGJSE/zB7dtjbBSNa0DiugDc
         pKdoiAbRwmwtBbK9JxgTU5v2978HRykzb8W7sgmN5m5CNeRqOuUT1G4XB2au8w38mu4l
         kJ+6iTGdXg6OpYW0/GQIM3VzQMVfPy7OAmuqA9NeZ714GKywrBNHCNeb1CsgiIjpYeME
         MCz8cSQSwjXIV9PCysbqFv9KdPXJier6eZelMhEpbQNat6QJWBChgCiH5daqbaakBM8o
         16BFy4cV7GjTS2L/ILYicUPqyAwfjWuayKqErBKo0IiW4kW6CXE9gL/Y0ncOxc1cr1XI
         0Y0w==
X-Forwarded-Encrypted: i=1; AJvYcCXqcbRcoAH7T29g7JJwBs3uBN2MkO6+1JV+YPaudFEz4NLJeQwvTHhsEalofSCTTfZ22/QDREYNBEQ+h/nQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs8ZAMu4orrsPiU1qDcZ3xi3nojSpqTkzkCsDWmObqqC7gzZ13
	oEDv8TVGljt6mWcIA1EBoimznHZlpSzGPxOu3H7hf57IMpVW4fh/iDm3tjobR2u1wVk=
X-Gm-Gg: ASbGnctKd9bphtG6M32bBqsdfYGLKmRWl9x6RYko2jXPSzThmDLKVa68p+G/nIoGp/J
	PZbh0uBp9N4Yc3ISboZ72BJuM3s5nntCmGgb/NM2hVYTFHTZLzbN1qzWW2zS0rq57WClBWrFOzZ
	n6yZBzSND0/ADh5JInZI8VEnpBTRgaKgzSTp9QeNSe+0AtmCfGZPcxn2VIxua17EWQP0n8oE7P7
	+oatxPmtdLG0SnOC2e0RBwej4mNwa4ruFAbyuFT6d9B7kaBXIq3O2hjSd8aCaX/vrQKpSPtH2FI
	rSXyxFxcSjg39FL2gCDhNTLObczlqUfnBtRK8hvS1ANKo9eEfCrZTOMG69iPW3tsCIw2XyyFDuQ
	xlQQ/dSXhqdBUbeLgdTl6iLn4Al1s+gg+xftmdK2QbuGv6jmI+ZTSXM/HqVWyDN2arMyw5A9iRW
	BsD87BGdGVWSWf
X-Google-Smtp-Source: AGHT+IH8T4ZyL5HYmAGvNL/oZLRRXU8OO4RxTJEHDGnN0oDjnzobpXuL2pV25qu0GlPmyxzXDorawg==
X-Received: by 2002:a05:600c:19c7:b0:477:7bca:8b3c with SMTP id 5b1f17b1804b1-477870c5352mr61064035e9.19.1763036390818;
        Thu, 13 Nov 2025 04:19:50 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff23:4430:e68d:9e37:1627:2b9b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f19664sm3679227f8f.36.2025.11.13.04.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:19:50 -0800 (PST)
Date: Thu, 13 Nov 2025 13:19:48 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 12/14] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Message-ID: <aRXM5OfxYTt2a8yj@linaro.org>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-12-df4910b7c20a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113-kvm-rproc-v7-v7-12-df4910b7c20a@oss.qualcomm.com>

On Thu, Nov 13, 2025 at 04:06:02PM +0530, Mukesh Ojha wrote:
> Qualcomm remote processor may rely on static and dynamic resources for
> it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> or older QHEE hypervisor, all the resources whether it is static or
> dynamic, is managed by the hypervisor. Dynamic resources if it is
> present for a remote processor will always be coming from secure world
> via SMC call while static resources may be present in remote processor
> firmware binary or it may be coming from SMC call along with dynamic
> resources.
> 
> Remoteproc already has method like rproc_elf_load_rsc_table() to check
> firmware binary has resources or not and if it is not having then we
> pass NULL and zero as input resource table and its size argument
> respectively to qcom_scm_pas_get_rsc_table() and while it has resource
> present then it should pass the present resources to Trustzone(TZ) so that
> it could authenticate the present resources and append dynamic resource
> to return in output_rt argument along with authenticated resources.
> 
> Extend parse_fw callback to include SMC call to get resources from
> Trustzone and to leverage resource table parsing and mapping and
> unmapping code from the remoteproc framework.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 60 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 9feee2cb1883..4d00837db58d 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> [...]
> @@ -413,6 +414,61 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
>  	return pas->mem_region + offset;
>  }
>  
> +static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
> +{
> +	size_t output_rt_size = MAX_RSCTABLE_SIZE;
> +	struct qcom_pas *pas = rproc->priv;
> +	struct resource_table *table = NULL;
> +	void *output_rt;
> +	size_t table_sz;
> +	int ret;
> +
> +	ret = qcom_register_dump_segments(rproc, fw);
> +	if (ret) {
> +		dev_err(pas->dev, "Error in registering dump segments\n");
> +		return ret;
> +	}
> +
> +	if (!rproc->has_iommu)
> +		return ret;

Just do "return 0;" please, you know already that it is 0.

> +
> +	ret = rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret)
> +		dev_info(&rproc->dev, "Error in loading resource table from firmware\n");

This is odd, you log an "error" as dev_info(), so is it an error or not?
If it is expected that firmware images may not have the resource table
in the ELF, you should probably just silently ignore this error (or use
dev_dbg()).

Thanks,
Stephan

