Return-Path: <linux-arm-msm+bounces-33874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAEB998854
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A161B28936
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 13:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1967C1C1757;
	Thu, 10 Oct 2024 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CFry+cLB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2774C1C9DD3
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568267; cv=none; b=c8SYYaqw0NR2cvIOzW+iv3ZiOnZlB/j/fx/FlV1BwbiUZR0dsCmnx2OX3GtPN9MrCfTorinpUwSU1RlNUO1VtX9kcnLFPeDDL3yVYI/HzG/T1NiEHx+xM487giavp+S+Wz/xjxwUQLX8z2lpInamm1WrKAvcqIQpboG3Ppmm+as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568267; c=relaxed/simple;
	bh=kC64z7GxA0jcH+ebK2cfoqjQcd3boIqK8A9Vfxm2t10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WM829E4BfsjP2PtAeGBSw/X/91CPbXt+ghUtJIgofIYai0CtOUvFl9GaCXXmOAQJK+rQ8ko57Kwr2ZS1y8eke2fZKhD+2vAnJ2Q0qRtSn8D7k1cPfjJB/lxnJaxuM2IAMv9JkgoGatSX0m2mrp8348ta3J2dKnLONRT8VnI6QZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CFry+cLB; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53988c54ec8so1220159e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728568263; x=1729173063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cMqw76UFr3KyOj7RnEC3aqiu0YdHjPevmACOjAMgttE=;
        b=CFry+cLBW8JFX42tNBJE3JkhTXRuwaKmhH/uz+IXr9WY3yojCpJWO0+zu27MOucocf
         qJYjugOJjHMo4hz42JCV5lyc9vpyT8E5Vjg5GOZno/kNAVTXaymUC0PRnVWnRXPnQGuC
         Xd6/ztzgHpYtmTG+FTQldcgu83fuesmTOZH6p5Nj3sAlBfnnd3DTyCXus/MV96EvmNOZ
         cL4RfQghWq0uc+4ayS8WXinXKqhMsm1UsmxAjKvOM9DR8JTClAVSayDhYs3xgWI5iHgw
         I29Kbf2bvCHAUzj4NVlpaOrzNieRtWXDsEkYCc1Jlwz/CWkgm7wIqKzvN7jIA3/GJm0y
         fpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728568263; x=1729173063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMqw76UFr3KyOj7RnEC3aqiu0YdHjPevmACOjAMgttE=;
        b=VBIrDXSu23SuQnQMl0855yDnKNiNBzu7LWPZ6MzUWWCPxaqrl7MPZspZY3FKBzsRUd
         oKirz0AvWWXr4hL+Ljc5fRoIvhnnPCdgybD7MJaXp7l1Lh8j3LMcxO18kFn2yopzzSz+
         2vcgNSrtSrjuwGT8nxp23n0ilj65jX3aJmn8hTCOKrHoYORFfQGlEmAHaJJQnAw0lOAZ
         TdLgEuJW7SI3zDFu+5sqYCILoF2gdeVQI1qFORpGCvnu8hX0vKCZB/5L8v7LDe0r64Pv
         /Wmmb3CCueIaiEfGe1fZRbUXgS4HL5QXil/Hb6WZIhDgzLaYCSHU3WjnAHc7PJ8KhVu9
         Q2dA==
X-Forwarded-Encrypted: i=1; AJvYcCVkSLtAdcUyNMkiBwu1Zq17nAPCYqCLuJV17KvEHs6eMnrzvQavYODV2COjrpPpSUqfHg4fFeyKV1hv5lxc@vger.kernel.org
X-Gm-Message-State: AOJu0YxD2RS+2mLTDmPgpMSVMfS5UTJtrUstS9GV53nqDYJSmmQt1GRS
	BJA3lReVaJ7ohqjA3IgP+WDBOJyZUxD8XUH6IyNq7TKNFc/qc5ZL1/rwNBv9MeI=
X-Google-Smtp-Source: AGHT+IEdFN6tHEPOV5BGfgasm+djxDl4woP34V2NNtQEEnSKQjbMo5AzUtpP2ZOqLjKUa8VMlGqcng==
X-Received: by 2002:a05:6512:2808:b0:536:54fd:275b with SMTP id 2adb3069b0e04-539c4967edemr4294135e87.54.1728568263124;
        Thu, 10 Oct 2024 06:51:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c863bsm258410e87.87.2024.10.10.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:51:01 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:50:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, abel.vesa@linaro.org, 
	quic_msarkar@quicinc.com, quic_devipriy@quicinc.com, kw@linux.com, lpieralisi@kernel.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 6/7] PCI: qcom: Fix the ops for X1E80100 and SC8280X
 family SoC
Message-ID: <otipwbhacorpdyjlhvf4g3tpg7ymtqmcuzjirewhkmwv3gbpka@2urxbhufrveb>
References: <20241009091540.1446-1-quic_qianyu@quicinc.com>
 <20241009091540.1446-7-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009091540.1446-7-quic_qianyu@quicinc.com>

On Wed, Oct 09, 2024 at 02:15:39AM GMT, Qiang Yu wrote:
> On X1E80100 and SC8280X family SoC, PCIe controllers are connected to
> SMMUv3, hence they don't need the config_sid() callback in ops_1_9_0
> struct. Fix it by introducing a new ops struct, namely ops_1_21_0, so
> that BDF2SID mapping won't be configured during init.

Fixes tag missing. Cc:stable if required.

> 
> In addition, since it is recommended to disable ASPM L0s on X1E80100 as
> same as SC8280X, hence X1E80100 can simply reuse cfg_sc8280xp as its
> config.

Separate commit, please with its own description and Fixes tag.

> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 88a98be930e3..c533e6024ba2 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1367,6 +1367,16 @@ static const struct qcom_pcie_ops ops_2_9_0 = {
>  	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
>  };
>  
> +/* Qcom IP rev.: 1.21.0 */
> +static const struct qcom_pcie_ops ops_1_21_0 = {
> +	.get_resources = qcom_pcie_get_resources_2_7_0,
> +	.init = qcom_pcie_init_2_7_0,
> +	.post_init = qcom_pcie_post_init_2_7_0,
> +	.host_post_init = qcom_pcie_host_post_init_2_7_0,
> +	.deinit = qcom_pcie_deinit_2_7_0,
> +	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
> +};
> +
>  static const struct qcom_pcie_cfg cfg_1_0_0 = {
>  	.ops = &ops_1_0_0,
>  };
> @@ -1405,7 +1415,7 @@ static const struct qcom_pcie_cfg cfg_2_9_0 = {
>  };
>  
>  static const struct qcom_pcie_cfg cfg_sc8280xp = {
> -	.ops = &ops_1_9_0,
> +	.ops = &ops_1_21_0,
>  	.no_l0s = true,
>  };
>  
> @@ -1837,7 +1847,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
> -	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
> +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
>  	{ }
>  };
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

