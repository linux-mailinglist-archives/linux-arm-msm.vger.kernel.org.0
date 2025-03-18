Return-Path: <linux-arm-msm+bounces-51682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C140A66BEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1748C3A66E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0EF1F4C8D;
	Tue, 18 Mar 2025 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MGMtVzjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1DF1F4164
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742283326; cv=none; b=HZjevjzWdVYKEL1+mvmKa840zNGIDOn/JVRrOqaUCLqXajj39Ftdj9ChEsPimoHuade1UGbwvQTfCE3ndQSfMKOBvuWQsQacCRosF4xfuGaUerHkqUTW9Kg8UWcuBoNXMkS6SuaXz7Czi81rMZ8TlddiRxGHAuglfikScqhU+9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742283326; c=relaxed/simple;
	bh=bT2WkAI4t1LM3JXg9m1Nj3B6KFZFFVc1xKtjtfEM7vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+uKf3XmA4WE+JgBYQXnfR7NJVaWF8ofSOa8Cz2Fokgd8JvEHn2L+8yFf/oneZ05UpyPGAVgTRzYCOjYLTjO57iye0hrC+g4AQSTvbL0H18/KD/fSBja5QOHMWMElmA9G5m4GAX9rwvGgvS+2pbtOLN1WApVoOVzV0lfr/1kxqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MGMtVzjB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-226185948ffso34155285ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 00:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742283324; x=1742888124; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ti9mkkr8qvTbrEt9TTTW4ivjULJ5uCNkrYEb+oujtBo=;
        b=MGMtVzjBGvcgbTTagJpUCUqw0MQAxwa1eZ35tPIi2qRQ2dIr14Baz3PqJp2w8ZYhdW
         y4wNss2Z299JDVJPxcAPnDw1tjaWReMBE/PYh83etDMf5Ll1TTGdnVD2QTnuzpe81x6O
         tV5xe983f1Imxvw/Q5lvcDNgW0aFvrMtkt85nKNbXqLewbTPWZrxWQ/vjUMn8Q3SckAZ
         UQTx3wv3jr/7FdXPNoxvWb6ou6jcs1vgwT085R7dCC2BzttqxeN0hTKSQUE0CgzS8g8w
         7mvz/Udow/pakNIkPEJBf9YCekFf1lqbZ+LHRTCPB1dZMHjCyZZD4HTpQpFg1obXhUjP
         A00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742283324; x=1742888124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ti9mkkr8qvTbrEt9TTTW4ivjULJ5uCNkrYEb+oujtBo=;
        b=dFY7frNrpDq9vnKHW73rcXhOmMmtvNTETvD98EvGV6DHd1k8ep9ccJS6gg1evSP6Bk
         uZrAgN1Xgtp9f4KZz9s7G4Ghl5OnEy1T2YBmDon2V+Qzzojo7Zv3vF9M27Ui+WLk8LfU
         +u+FkO1daFSlZSiDq9Q9vqeX/HR1pKJwdA5Y7hjBdZ2FTulopD9VUbb8zwyUgwu0zEtf
         lpuJ9LoZy9BorpIygGcfEO+hpeVZGkGkrixXi12d/ByohUy5GRdykna2T24YK5Q7PYet
         9FO6D90tmrvKEoJsU8MA9dfXNCUDphr70L+IwJIXEfbz4drCYtaAOTjeF4ZYWYFzP4ZM
         a9QA==
X-Forwarded-Encrypted: i=1; AJvYcCVYArpdBUsv3f+rOPmL43O8sP+j6x01waU7WL1m4aKuKUPSCC8aMdY8OoB46c9nj5gmpLE7ukHN6GLpYXZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxX+PEhnAreh0KuY9ZmfEG2R7T/htdqj/TRDXE/BJEKiDzB6OJT
	Wyc14uNunAKbS6Li2/haieqKodyDxo/K+wioAotyJxC5PKOLXMaqKd0UqEBIoQ==
X-Gm-Gg: ASbGnctPS74aDhQ7TYQW3bhJhSZQRsxeGVY5rxPG2TiBAfgFuvjWiL/X1FaLk2cKrMi
	ZspQ0vsHaMIlRLJqGpmbxve4ZenqDPZnCN6ed9kClqopRYWlWiiD8ePgHtuCB8x00Six8XYBT2x
	KRHFQsWDhyU9x7v0KChbBnxkNWS3MLVXVq1N6cmChIQPk/JooNOSb5S7Xb+OrVnSv5LYaMgCENL
	cZj1TaDUO2E6mGn2wczA+bQvNu9hG2MaxgMVhQAPEjdyU/AchyWYgwkqR7vdIMxelXl0gZL1LJO
	eXddS6ZQHONXIC/MjXXVKuopXisyQfp25oMS/3xqEhWvGnfYgKHVMtfF
X-Google-Smtp-Source: AGHT+IHmw89wtVmgBhfVxX9PTZBqglKeGhES/xurGrbMglniid1oBlbFanI6j4PT2q5RJtFbNqS0gg==
X-Received: by 2002:a17:902:ce81:b0:223:3ef1:a30a with SMTP id d9443c01a7336-2262c611213mr25670245ad.45.1742283324004;
        Tue, 18 Mar 2025 00:35:24 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd3d5bsm87724655ad.217.2025.03.18.00.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:35:23 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:05:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	broonie@kernel.org, bbrezillon@kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 4/4] spi: spi-qpic-snand: set nandc_offset for ipq9574
Message-ID: <20250318073519.pgise5vnlu2aha5u@thinkpad>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-5-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310120906.1577292-5-quic_mdalam@quicinc.com>

On Mon, Mar 10, 2025 at 05:39:06PM +0530, Md Sadre Alam wrote:
> The BAM block expects NAND register addresses to be computed based on
> the NAND register offset from QPIC base. This value is 0x30000 for
> ipq9574. Update the 'nandc_offset' value in the qcom_nandc_props
> appropriately.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> Change in [v3]
> 
> * Added nand_offset for proper address calculation
>   for newer Socs
> 
> Change in [v2]
> 
> * This patch was not part of v2
> 
> Change in [v1]
> 
> * This patch was not part of v1
> 
>  drivers/spi/spi-qpic-snand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
> index 8c413a6a5152..85a742e21cf9 100644
> --- a/drivers/spi/spi-qpic-snand.c
> +++ b/drivers/spi/spi-qpic-snand.c
> @@ -1604,6 +1604,7 @@ static void qcom_spi_remove(struct platform_device *pdev)
>  static const struct qcom_nandc_props ipq9574_snandc_props = {
>  	.dev_cmd_reg_start = 0x7000,
>  	.supports_bam = true,
> +	.nandc_offset = 0x30000,
>  };
>  
>  static const struct of_device_id qcom_snandc_of_match[] = {
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

