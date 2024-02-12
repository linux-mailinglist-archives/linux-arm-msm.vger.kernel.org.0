Return-Path: <linux-arm-msm+bounces-10645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0A851534
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 14:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFCE51F21937
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 13:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5E73A8FE;
	Mon, 12 Feb 2024 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bZ0qYLvi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24A13A8F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707744001; cv=none; b=dk0+uzeg7yFKu6z4fYjeuQ12JjV3P3XHJyYYniZheSeVrsC5K4mTWNyn9e+0Zx7V/Q4pT2krBLBlRvm18v5WODIwDlE2FFfbNJ5T2zMKkUkh/3CFFci7/8pvOmgobn+gXnJmG+eG6m7o0gva095TsUxQEcr5NXah9LRXrQM3IIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707744001; c=relaxed/simple;
	bh=MiDZ9q4E4B0uRmbXb/ZjZr/uFijMH3jgqXxs5YhkZbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+tG3s8kqtIJAdbo2VcBpyKjphwJ42ePTTddw4qZ/FSrjINSq/faqWi0br511WeJ0jOktr2SNF7g0pcad8fX+Uxgb00U5JY7SntJeuijBz5Q3G8t9mppvLtuc1mC/JeQcHw+9momsxfiBiNXkh5VRnvwfaAKquh6KlhKsRNg0SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bZ0qYLvi; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso2843264276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 05:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707743999; x=1708348799; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G3Ap4U+w+TMZMJlT3gtIEPowqPUkZyKtzXWA3sqYoeA=;
        b=bZ0qYLvil+MOKd1hF4Cnq00KA+PBnKLjibplTbpluRIxDhEoeoBivTQMY+PsvW43o4
         I1dQZwML2Xvkstv98wHQ4fO8sreMS3qJM+YPiE/vw4Np4pcfcvUfFakpn3XsEp2foDOj
         QwlG1jmrpU6XdhSmSRDLeu8BReGZjwlj/oR5ojudj7OwzZ03rgV6CoO5YD7CS5ngnCbI
         SNRfIWGh2EgZ/AZLkivYvNV6YBIP2kI9d+OM7TnSzy/NQfGvCeLaQMp0gFQXlWMeF3Vm
         ZxIiTLhSKk7z+nqmuxj9TaxaFU50uFGC4nPS7IHQNMguobuDPomxEElZDk5X4NanJIyw
         913g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743999; x=1708348799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3Ap4U+w+TMZMJlT3gtIEPowqPUkZyKtzXWA3sqYoeA=;
        b=llzydUxAd/CZKi/OCjeverUSEg1YXMR3mQLm1rrU970htxQdrD5zubirxN+k6B98EV
         niF/2DASTnT6xKgHY/63sejEDAaenGfGJAdI7/kMoydG+i25I7hk0Ou9yQYCMjz+SO02
         ezd/Laj2y1+lBbFCxTUBd7dx1FMxXIdcVncNimo0ifOHxL4fav6ox/+P2GNtk0bOE9UZ
         duURMkmSqBXzTRc1WOCjuNwNlJxbszdy2yZqAYCRHwIMPr1BBYlHX0g3RzpQNbTi6pyp
         2F+fPxEHxp0nz/mgKkpkjGv3mgHpzrsWvMtt0mj/mImLxNgo30/1QWRFvF3vrXJ0Iage
         Owog==
X-Forwarded-Encrypted: i=1; AJvYcCXnwdSL6xQNo8IrIqnhBsTPl7vacTCZ5Zjkj2dQ5xNHyL4adFGB2KdF7qho90JzX/5NAPm9YkTTvoasMggnYHjg/kXneWBZtRhGwvSTPQ==
X-Gm-Message-State: AOJu0YyTQXJmqwBQ93Fz30zU9JAuIZjgkBiEDOBMpL9TpTJmHOQFLvd0
	y8DSKNhc/JJSGhQEGMK9qagvxURtHneVflYBrMahYagUeYz5Uqq/cULZh9FOvFWN/kwoZfzrF7Z
	vkwWZ2+LXgMjPYat7RHFimR/LllQG+UI9QG+79w==
X-Google-Smtp-Source: AGHT+IGqUIFO5vVPLAS4fp5yQ7MhqKZGG2SnCArwCgMR3tqqtlHsLSayAuhno80bIasDuonbKvwDKJ2Tqwo4xgzrov8=
X-Received: by 2002:a25:b212:0:b0:dc7:46ab:9f5e with SMTP id
 i18-20020a25b212000000b00dc746ab9f5emr5777858ybj.29.1707743998897; Mon, 12
 Feb 2024 05:19:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212125239.7764-1-quic_vdadhani@quicinc.com>
In-Reply-To: <20240212125239.7764-1-quic_vdadhani@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 12 Feb 2024 15:19:48 +0200
Message-ID: <CAA8EJpriONTWmdvhtuR+a3=PFs6ScO-EffCWqbt+3y9zBmwOcA@mail.gmail.com>
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Correct I2C TRE sequence
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, andi.shyti@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vkoul@kernel.org, quic_bjorande@quicinc.com, 
	manivannan.sadhasivam@linaro.org, bryan.odonoghue@linaro.org, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Feb 2024 at 14:52, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>
> For i2c read operation in GSI mode, we are getting timeout
> due to malformed TRE basically incorrect TRE sequence
> in gpi(drivers/dma/qcom/gpi.c) driver.
>
> I2C driver has geni_i2c_gpi(I2C_WRITE) function which generates GO TRE and
> geni_i2c_gpi(I2C_READ)generates DMA TRE. Hence to generate GO TRE before
> DMA TRE, we should move geni_i2c_gpi(I2C_WRITE) before
> geni_i2c_gpi(I2C_READ) inside the I2C GSI mode transfer function
> i.e. geni_i2c_gpi_xfer().
>
> TRE stands for Transfer Ring Element - which is basically an element with
> size of 4 words. It contains all information like slave address,
> clk divider, dma address value data size etc).
>
> Mainly we have 3 TREs(Config, GO and DMA tre).
> - CONFIG TRE : consists of internal register configuration which is
>                required before start of the transfer.
> - DMA TRE :    contains DDR/Memory address, called as DMA descriptor.
> - GO TRE :     contains Transfer directions, slave ID, Delay flags, Length
>                of the transfer.
>
> I2c driver calls GPI driver API to config each TRE depending on the
> protocol.
>
> For read operation tre sequence will be as below which is not aligned
> to hardware programming guide.
>
> - CONFIG tre
> - DMA tre
> - GO tre
>
> As per Qualcomm's internal Hardware Programming Guide, we should configure
> TREs in below sequence for any RX only transfer.
>
> - CONFIG tre
> - GO tre
> - DMA tre
>
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165-rb5
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>

Thank you,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry

