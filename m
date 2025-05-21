Return-Path: <linux-arm-msm+bounces-58898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCE7ABF59A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A468A1BC4018
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 13:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F73026B2D2;
	Wed, 21 May 2025 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L58AkGGK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B729C2D613
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832960; cv=none; b=Ad3KQd5U1Avjwk2zWTpz2i/28d9zjlBwcvJ7YhZHKtf963lP72ecFiYFeUX1+TDdcH1t6DtW7DW7jv0IvKlitBWPDwThdiaw42xVpAMnIcJqjUL/rlT+g28ngoh0W5quApcAIiSlIUoiMkVw3cQzBPHix8eFR32SZr6roUIg/O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832960; c=relaxed/simple;
	bh=GRe48+T4QOjmzhOAZmrIjCqByP8egxo3tKGqpm7CZoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDTEnSxMm7O7QivmMZSm/NKB8R+YuRRIszk9I+7kFF2XOZO8SNPpnCFAzVUzTa03AvUy1v+kEkytyxx+QJnCaQmcyL92VMhlImvEnSde/sZbEiViKHlQJx9OQPn2E8+qXXTyc50Je3gQpsdCtzQksHhUENohgHz+EtnlP5TiTHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L58AkGGK; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso8424424b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 06:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747832957; x=1748437757; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1xxOxxblIZR/yGk+6+Lstv8BrYyIDhp3OhJhwb5LXrY=;
        b=L58AkGGKPTUBdkXmDujPBF0WpBbhhZ9ZHSZZFf3rjNWT5y5kiFU4mTVIVBPtkBEYaM
         MwqGhEzHQ2Zi4bHqOOSi33PaMpt8Urd1I5lc55gVDQ51Og/Cy82bKOkdmy92kTdh8cvE
         Wgr47q13DVKEpgavHrtIOY0exRXr9Rmwcldeb2vVdfdlyV245obOBp6lBDwnC5X2KurL
         DmGbqRrNGG5A8T2Ooze+G0WEXjw3bP199Pzs9aOvyHkBaV95uByxF+HDipJwXsWTSCuG
         WPMJ0P5nGqZKMqnmzGQSgCVmZeOjLIK7MGPxbH8czcUO2GxGCceRKBNTfSdio/GspjpF
         ItqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832957; x=1748437757;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xxOxxblIZR/yGk+6+Lstv8BrYyIDhp3OhJhwb5LXrY=;
        b=IBJ3wDDHPkrXmXsBJBvH771mSUDmRO5XBOEkA8kJuhZq6PD347rEQxsCGCavuUdDRq
         lLReY9p7v36HKVaw/3OM05oepAH4H5md6qny5T7WlHmhC8XzKGQEmasY+306m9csEPg6
         fRMf9LJQdTv9/m7RZ22akf8ki9elKnNwh/DzsHnUCPg6LD4m8EhdNxgnMv8Eer1B6Q6v
         IE5BtvjDo5PB5NC7Y9rOF5pBNqkuuTy9wLe+VadxRB/wNn0ERD10olwkqYX8jyZBiXRl
         hKTPpZlRJuiT/ZQ1XOHyLNiI4SG1W/A6kfE3lZ/t1OSs33XDceWcr3s1l7ADoLzDKie3
         9e6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWf33dARj1xDuGxltk2xAcsCQ6z67woNaG3C4mTzXUTVgLDfDfkJL45xq8CeScJyPyQcAiJD/NIeFlJ/z3H@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2KnkK00GlH09+as8BuTzqXxN4oF2ZkeeNEUuFdFShI+tzQvyO
	QkC5jok+9k4MSQvPxg6epf0FfvC0UBpKvXUwRlXo8LbnVAaYhn80xld4xFF078ZOzA==
X-Gm-Gg: ASbGnct8aZFvHEH4Vr3a3yoFmLps2rp05A4Qxgk8oGh47uhHQhivYJMErcbJv/2DVzG
	zRu+lBz2FenZGN1nzGd0StrlZLqRZDjbP4Uq8EwiP+uxOmXaYMk+t25y6G3HqCQ0R+6DVEbal7m
	aoIMPuywJl2/nPFaxMSyqOKd1jtsCsXlBAm1km7R52BMDLQ0SHMd/H0yhInNZJFiwTDpYwWrJap
	X7CPRysDmk4gpXktRsJtxhqU5l2gum+lkqV7duyJZFjCnunHUYg23YsIg0MRYpB5X/7mLUgQn+s
	tNa4gRz+TFWuha8h9BNNha7IUGaQc9m5kMooZZdP51pXbcCm9oERtsOEWsxK
X-Google-Smtp-Source: AGHT+IFpFHFGRg8NqLbFFAyW6EgtIFf1xfDNczo/VyiKqRIj7rrnxNgs7EuDSZwWQLJYrHrtfNhQGw==
X-Received: by 2002:a05:6a00:3e0b:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-742acd75e6amr31551655b3a.24.1747832956808;
        Wed, 21 May 2025 06:09:16 -0700 (PDT)
Received: from thinkpad ([120.60.52.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a213bsm9505394b3a.159.2025.05.21.06.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:09:16 -0700 (PDT)
Date: Wed, 21 May 2025 14:09:09 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, bvanassche@acm.org, 
	andersson@kernel.org, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com, quic_cang@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 02/11] phy: qcom-qmp-ufs: Rename qmp_ufs_enable and
 qmp_ufs_power_on
Message-ID: <drtwqawkyrtfxgw4gbegybzs2yt7sucvvmralppmjpptu7sdzu@5zu6gdzefz7e>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-3-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515162722.6933-3-quic_nitirawa@quicinc.com>

On Thu, May 15, 2025 at 09:57:13PM +0530, Nitin Rawat wrote:
> Rename qmp_ufs_enable to qmp_ufs_power_on and qmp_ufs_power_on to
> qmp_ufs_phy_calibrate to better reflect their functionality. Also
> update function calls and structure assignments accordingly.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index b33e2e2b5014..a67cf0a64f74 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1838,7 +1838,7 @@ static int qmp_ufs_init(struct phy *phy)
>  	return 0;
>  }
>  
> -static int qmp_ufs_power_on(struct phy *phy)
> +static int qmp_ufs_phy_calibrate(struct phy *phy)
>  {
>  	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> @@ -1899,7 +1899,7 @@ static int qmp_ufs_exit(struct phy *phy)
>  	return 0;
>  }
>  
> -static int qmp_ufs_enable(struct phy *phy)
> +static int qmp_ufs_power_on(struct phy *phy)
>  {
>  	int ret;
>  
> @@ -1907,7 +1907,7 @@ static int qmp_ufs_enable(struct phy *phy)
>  	if (ret)
>  		return ret;
>  
> -	ret = qmp_ufs_power_on(phy);
> +	ret = qmp_ufs_phy_calibrate(phy);
>  	if (ret)
>  		qmp_ufs_exit(phy);
>  
> @@ -1941,7 +1941,7 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
>  }
>  
>  static const struct phy_ops qcom_qmp_ufs_phy_ops = {
> -	.power_on	= qmp_ufs_enable,
> +	.power_on	= qmp_ufs_power_on,
>  	.power_off	= qmp_ufs_disable,
>  	.set_mode	= qmp_ufs_set_mode,
>  	.owner		= THIS_MODULE,
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

