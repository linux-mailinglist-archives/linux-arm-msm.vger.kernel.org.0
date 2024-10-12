Return-Path: <linux-arm-msm+bounces-34181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F18CF99B0CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 06:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 068F71C2172C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 04:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA0712CDB6;
	Sat, 12 Oct 2024 04:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ho6vrZLB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D34D126C0D
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Oct 2024 04:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728707032; cv=none; b=Zm/mg+V+WnIcNd3kLYbWEQ2zi+bDRco2TE1+OzG4R251ND7g++utlsZ+yzCJvQ/kxT4D/fFS/azzSpMT1eSPT4Qe75tEdwgBEAB0NE31dKa/tdFJXF5rdh21JETVRYFx5VD9mSCgkxQ9CPCCMbDD5iyrRdJLdyQoC8zqg3BK8Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728707032; c=relaxed/simple;
	bh=DClWqVSw4Q5SvJ0ClE/kssmfoucsaa5UCa1zSe/frdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDWJGmYS6SYiBoVBbNtnlu8+5AB0Yi8V3m9gy3gzyVz+1s6TjJjHiEGU6cczED8yZL+3dvvqgAV6x+z8V023eiHmXmBcapGC09QwOEddy0vqU44rkhLyw1J6gUSaqwd4sPKeKHM4XAXYNZJGR7Ib3A/4BpeDOAvV+6nb+U1wVEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ho6vrZLB; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e49ef3b2bso605859b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 21:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728707030; x=1729311830; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puYHk9n2Vwdgm2oCgJfF1Sai1mpX68QX9Cn76m96df4=;
        b=ho6vrZLBps8SLdqhTaWv5OPApVnXQnmbkL5I0Ue5+vrQmsWABhwRLRLyaX0MhcrwgA
         zBmTU/AcJKLaKElLEmFFN8UuZnFetH3mT3OgfIJrOLd6YnFYM0EqsYtKM791ZYAdAt5+
         61vuatsxfo78gAPwgbm6ljoJ/+8SyIu8zrF6o6UDqXQdxDt+W501S3vJTiRzguaJxZ1k
         GdXl9LPECeTenaYzD8fz8bzeiwJBPUP8pajrA6Pdlj3cG58+C1uvr4ddhiF3BQZd+Me2
         iBThYcB2GgXClNmIx3UVfTapSjjox1VsVugo8RKDS8Khez5ZpdHf12bOobIt4roMIbYZ
         m+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728707030; x=1729311830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puYHk9n2Vwdgm2oCgJfF1Sai1mpX68QX9Cn76m96df4=;
        b=ggu1SqmnADDI63nG/WqxpTBM1gGRI6lJqaaubP7iM9wZBJIdmsJjB+75f4aLH6mOIU
         b6BLVrYldBe77ywwJ+h37pE3y6LCWq925K7Rua5kXxrxH/1zc7O+ekjPMemwKf6+bvMP
         tylGJOTcWKVwMpiOL8J/Z2Le3EJ6CJANlhy0TgtBwCQh8Rqw1PFgLOmEKYwxgTdNenR8
         A14F9zmH0Sh0mHrBcRElFcIOL+PbtnhM3bQZ3N6Hv5AxztXFekT/oO1R7zu/M6bmGecT
         DDeeTnnHb9GpLf2OOV+BM8MofbWe9Zk1d6C+Qp2QmBzf4DIuMHXZW2ZY7OJ+f0/m3nDY
         tezA==
X-Forwarded-Encrypted: i=1; AJvYcCVDnB4Ekvgzqo08Tr88Aw1MQBiyXW7W646yJgT1UCPtWup/9V2AxWQsT1cUDUL2hqDnlSrhHsWIFjnIqrYK@vger.kernel.org
X-Gm-Message-State: AOJu0YwdLTiUB5snXydOHSj80g7yDBVDk783UntGh9q3f8WUzrzs6zZe
	lDVzuA+b3ozs5Cra313Wi8tUq8nAlPkN7rxauWpnP16InK9e2WtOplMZj7J1fg==
X-Google-Smtp-Source: AGHT+IHxOL7Syd/cGt2BqV95e4Kdw1tNZz3+9j9/FIOE1zxN0smZKiOoLQJ5RmgWDoO3/JTFDgCGEA==
X-Received: by 2002:a05:6a21:3998:b0:1d7:1277:8d12 with SMTP id adf61e73a8af0-1d8bcf5c061mr6324102637.29.1728707030426;
        Fri, 11 Oct 2024 21:23:50 -0700 (PDT)
Received: from thinkpad ([220.158.156.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e3ba69fdasm1926423b3a.205.2024.10.11.21.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 21:23:50 -0700 (PDT)
Date: Sat, 12 Oct 2024 09:53:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	abel.vesa@linaro.org, quic_msarkar@quicinc.com,
	quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org,
	kw@linux.com, lpieralisi@kernel.org, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 6/8] PCI: qcom: Fix the ops for SC8280X family SoC
Message-ID: <20241012041734.y6nwumij27dkbcra@thinkpad>
References: <20241011104142.1181773-1-quic_qianyu@quicinc.com>
 <20241011104142.1181773-7-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241011104142.1181773-7-quic_qianyu@quicinc.com>

On Fri, Oct 11, 2024 at 03:41:40AM -0700, Qiang Yu wrote:
> On SC8280X family SoC, PCIe controllers are connected to SMMUv3, hence
> they don't need the config_sid() callback in ops_1_9_0 struct. Fix it by
> introducing a new ops struct, namely ops_1_21_0, so that BDF2SID mapping

'...namely ops_1_21_0 which is same as ops_1_9_0 without config_sid() callback'

> won't be configured during init.
> 
> Fixes: d1997c987814 ("PCI: qcom: Disable ASPM L0s for sc8280xp, sa8540p and sa8295p")
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 88a98be930e3..468bd4242e61 100644
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
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

