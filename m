Return-Path: <linux-arm-msm+bounces-45451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7581A154F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C133B7A3E18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB7E19F48D;
	Fri, 17 Jan 2025 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LccEAxp3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF14019F464
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132762; cv=none; b=tNivkv0s3LM8jiQaYdryR/i8c9Yu549Lyhk808gpr/VTbhA9aqzQbhfCc05UWWqca/AuR+IaaYNtUCvXTI+VWkjHSZlVGjl9IfiybPR1P/icFh5fqAmhctmT/sf3tR0TLdDqG2Vc6O/R3mboSKlBk1lG29cq2rnfgS1M1r5nDZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132762; c=relaxed/simple;
	bh=vfXbcAEkUkGVDoAgTrHzBgAX9ptwqKG3+IUO2reZg+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjQ261UsDrpg3OjxhYwCTmtx5GD7IjrDrZK/IY4zFmf0w+aczeLNi+tCoaHOLbrHcnZLnfK1XK7V/ggBZJOPXqsO6CzIJX2Xw6JYzcB0XRhDJCzVUf8kQYTwCsWcxwm/sh3rQzJIgwj3cHtpqC8yJI1WjLOUKXM2cTvVPmXCvEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LccEAxp3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216395e151bso33901235ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737132760; x=1737737560; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XYRmv+ik4I99HG5kSGaFlKGAPIZBRFxcHku4TW6p5J0=;
        b=LccEAxp3u0HqacEfexuKW55GnDbhxQ4mvGtAXirXOg27/Hvhud1zI+kxmYx7JjQ2qT
         l+WkWnqKnqZomGqJejk4+dUBHHXvRxgkYGCIiiEEr4iWo+Mq6/+xRVzkVin2kGAaaJbI
         Boe9CfgQTvK4FUjHzfTTZnJLnfR+FCgSE9QyliCjkywzSnM2wVouIPy0/xB8Gtezno0N
         hyRLBmaZR8HSsiki5Jk+h6UBMTThrKtBrnjpDD/mnQd1XALmsLeQUpUGiehjqaD0siYY
         ush7Gx+2NXwXOTJWB3NTsDybnZLSU3V+tCncVGredgPI5LwtbKaBHMZX/9aBSTr2vvhE
         YiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737132760; x=1737737560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYRmv+ik4I99HG5kSGaFlKGAPIZBRFxcHku4TW6p5J0=;
        b=GJNH9hXTELqscQgX8zYekrqrMVRqKq9DyjiU7v7T0M9+c496qEwDdSY0VmK6ymgoW2
         AvTcD7+UtEXovk6BTvF2W9Nu77++KbJMwBdtMW/+SNJSrPW1pdYOfFQfcIy2EJM4Er3m
         WrxmlPHAT/1sjqJB6D3ySxi/pYvvGq5ROwfQz1glgUoyz8Sgxxzb3r+r03Tpb7gyWHvd
         sPux9wwphKI6jlV9K6Nw11NAXf53GSoFjbzbEw5HHdEfWyyPxKMQRWVzKXvyZ5Anctga
         M7rGGhAASUJnrVS4GmVUitKLnYK0YaIKuczWwu91M2Tm1D801Ll27YK7dpD5lkhLEn+d
         y5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWn/m/9BISXONBe+PicaxN5celeXtw8+9ywPM+K+3qJrgtBKp44LIzi7kqqU91HECkXIao4nf+6vtwW7RzX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh7p8dXbd3MPRqFoh3eOB17oYE9qfMEwJlj4c9w5Y2o6rKt/8d
	BdHMz2lK5nf3vSavhUhAdAx00PwhPkCUegCMog5WHZpt7zG8+b54H+593rGsxA==
X-Gm-Gg: ASbGncumHQvNlom14vLhyM2MJnE6lhMX8CBlMQGBcFJpiR+qj/ZIRS9lGMCPMBPBEd4
	b3b0W9bLmJx1agd1m5RDMnRq4G18IkwQLB4FvvVWnQqw/VsguaCBz3e0sDj/8V+ZXAKs2UtdzC0
	fpBbTmDJvPFoCIhGAEjBkh9Q73j+a4IWbnjhPdbtrq7YUi5z6NlGlDBeqcVo9HaviE+LdZwC8tg
	aUajs54Cp5RQUZ2RcO/jdTI/u3ckDKTfDgFpO+RRIt69RGkDT+Lfa106RdYc2FYbvmG
X-Google-Smtp-Source: AGHT+IHuuqObPKcCAKAqYBISa1hIQabkLSxHQtBS8bGWogkXy1+XPYKrJ3EaruDEnzvcOowr2m4G7Q==
X-Received: by 2002:a17:90b:38ca:b0:2f1:2e10:8160 with SMTP id 98e67ed59e1d1-2f782d02707mr5077036a91.11.1737132760153;
        Fri, 17 Jan 2025 08:52:40 -0800 (PST)
Received: from thinkpad ([117.193.215.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb9b9csm18231565ad.94.2025.01.17.08.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:52:39 -0800 (PST)
Date: Fri, 17 Jan 2025 22:22:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
	andersson@kernel.org, bvanassche@acm.org, ebiggers@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V10] scsi: ufs: qcom: Enable UFS Shared ICE Feature
Message-ID: <20250117165157.euq56jnbizhgfjtf@thinkpad>
References: <20250109070352.8801-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250109070352.8801-1-quic_rdwivedi@quicinc.com>

On Thu, Jan 09, 2025 at 12:33:52PM +0530, Ram Kumar Dwivedi wrote:

[...]

>  static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
> @@ -439,6 +465,7 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
>  		err = ufs_qcom_check_hibern8(hba);
>  		ufs_qcom_enable_hw_clk_gating(hba);
>  		ufs_qcom_ice_enable(host);
> +		ufs_qcom_config_ice_allocator(host);

This should be moved before ufs_qcom_ice_enable(), no?

>  		break;
>  	default:
>  		dev_err(hba->dev, "%s: invalid status %d\n", __func__, status);
> @@ -932,6 +959,14 @@ static void ufs_qcom_set_host_params(struct ufs_hba *hba)
>  	host_params->hs_tx_gear = host_params->hs_rx_gear = ufs_qcom_get_hs_gear(hba);
>  }
>  
> +static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +
> +	if (host->hw_ver.major >= 0x5)
> +		host->caps |= UFS_QCOM_CAP_ICE_CONFIG;
> +}
> +
>  static void ufs_qcom_set_caps(struct ufs_hba *hba)
>  {
>  	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
> @@ -940,6 +975,8 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
>  	hba->caps |= UFSHCD_CAP_WB_EN;
>  	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
>  	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
> +
> +	ufs_qcom_set_host_caps(hba);
>  }
>  
>  /**
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index b9de170983c9..2975a9e545fa 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -76,6 +76,12 @@ enum {
>  	UFS_MEM_CQIS_VS		= 0x8,
>  };
>  
> +/* QCOM UFS host controller Shared ICE registers */
> +enum {
> +	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
> +	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
> +};
> +

No, I asked for this change:

```
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index b9de170983c9..9d1c9da51688 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -50,6 +50,9 @@ enum {
         */
        UFS_AH8_CFG                             = 0xFC,
 
+       REG_UFS_MEM_ICE_CONFIG                  = 0x260C,
+       REG_UFS_MEM_ICE_NUM_CORE                = 0x2664,
+
        REG_UFS_CFG3                            = 0x271C,
 
        REG_UFS_DEBUG_SPARE_CFG                 = 0x284C,
```

>  #define UFS_CNTLR_2_x_x_VEN_REGS_OFFSET(x)	(0x000 + x)
>  #define UFS_CNTLR_3_x_x_VEN_REGS_OFFSET(x)	(0x400 + x)
>  
> @@ -110,6 +116,9 @@ enum {
>  /* bit definition for UFS_UFS_TEST_BUS_CTRL_n */
>  #define TEST_BUS_SUB_SEL_MASK	GENMASK(4, 0)  /* All XXX_SEL fields are 5 bits wide */
>  
> +/* bit definition for UFS Shared ICE config */

'bit definition for REG_UFS_MEM_ICE_CONFIG register'

- Mani

-- 
மணிவண்ணன் சதாசிவம்

