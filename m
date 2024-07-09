Return-Path: <linux-arm-msm+bounces-25544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62D92AF57
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 07:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE53C28228D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 05:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6935312F375;
	Tue,  9 Jul 2024 05:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NiZY5C6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5076259C
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 05:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720502106; cv=none; b=A4St1GdjQJ9xtaMe39+CKmoDNAPjQ0aeQDJ6zUdxtv5I9HgoFb/qyLmRoF1AYOJ0K3LGPPQND6sD9iE39xfqVjA3sCyQ7s5JUp3KdkfLvob/HR8VkhU8ZqdgaLHLdcNUuT3qRCtNp7fQmlZeaq9rlqM2QSiqRZJqjxO+icMHOYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720502106; c=relaxed/simple;
	bh=t7jsp+2AhCj4302LaXnCltCJorzxGApkgadG8T3SGZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFERtkb8kzcd5rNUUcPuUEMZrMimnTa3XkZG4bvoDi25EcJjbfOrBbgOHVTpnP+Jkk2AUIUBafk/rZMNR/TzaJe3mOMA38133liYGYhRftleia5IRXEd9Hzd9avAIPDnr8mNFk5t7WrmVaqYQXL7ZeauvZg6lgfGL+3Z5Hb3YFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NiZY5C6O; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c967e21888so3211632a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 22:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720502104; x=1721106904; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sOxAsVn43J6UpGnYmdp9+zQbgWtHk77XaVfxeI89xW0=;
        b=NiZY5C6OQMuNb6zxCZb5x+IUbLlJdeKErjVXzpvJTpQ/Kfh76XiQZrvdWGEE82BQXh
         Bw10gJFSU78rGF5Wtpku0BPNlHBYje6RS2WuOphrZOm1ZYbs853jvDKS+xjDEMO7rhwI
         BC+Qg+rm92zwu4ZRMv9xa7RM6GFuNylSHphPqCMK3y5PnMR20YjO0iGhdgC2TF8Gzji9
         Oix9A0vGmVS5YJ8W8wxaKswsO1m9ThCnepfl+0E4+adAVeC3klT1b26fvrGWlmEovbfm
         s4tJR8kmrV/Wvu2ne3cx2WXbX0wkKp1bjXoL8vd9cC0lo50hYiL/UdNf/iasRBW0Iylp
         MAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720502104; x=1721106904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOxAsVn43J6UpGnYmdp9+zQbgWtHk77XaVfxeI89xW0=;
        b=JcQ5ABGjfER+BBwBY4OTh0NFfZKo3gGbRmxllKI2xdPaB6qqpae0D8dgMcxWYwbz9d
         uppUddW+3gdfYMk1CijvEiGUyVWh7mJHG2RjTGmODvcgBnG+9PlX8tKx3Ss4AUKK2Ax3
         VXNeFGQXdjCpajYOQE0P+gpY8dTiBHqiaGin0Nx4MWRMlgJ+4kZcskUmeWlztxJ/0P4u
         Hjz4yN0a02Ra+cKVMdRCnwf5xSYxirKN0fa056TQL6OC01CUsUiurhlH+Q63PZsSTlf0
         IjVMZA15JquYJ5zpIiqpE/s5X/scsNSsqIqdCzrRhstUJf9t8ZC842H75LZPOQ1cRVFb
         nzfA==
X-Forwarded-Encrypted: i=1; AJvYcCV9AmN3ZPbANNyc7+VPHV+nP8GTojKO+GYe3C3MrDtnIxwelUIe68Gktpe8K1YClA1NyqSkIWuI0OUqkxcDd8IBzPqg1z5axdqbGv7dAw==
X-Gm-Message-State: AOJu0YwnVY/y1Nvs/BUkDeXAbK07ZyXdQmEFkpushPAnkOZJ7XkUJaxo
	trP0fDJp/yEpBpATfqDlNA8ozw7a7iOYv8zWnIgNdh9gOk8JCCUW1N9Rq93Gdw==
X-Google-Smtp-Source: AGHT+IFMPt2WcyXDbYXxbpB1uFGYlWS51hUTnzsaIrD7vrfdxxoFcZTdu7U1ZXRjpWQLeduAHLq8ig==
X-Received: by 2002:a17:90b:1049:b0:2c9:649c:5e10 with SMTP id 98e67ed59e1d1-2ca35bca181mr1425092a91.10.1720502104337;
        Mon, 08 Jul 2024 22:15:04 -0700 (PDT)
Received: from thinkpad ([117.193.209.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca352c5bd2sm912487a91.40.2024.07.08.22.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 22:15:04 -0700 (PDT)
Date: Tue, 9 Jul 2024 10:44:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] PCI: qcom: Prevent potential error pointer
 dereference
Message-ID: <20240709051455.GH3820@thinkpad>
References: <20240708180539.1447307-1-dan.carpenter@linaro.org>
 <20240708180539.1447307-3-dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708180539.1447307-3-dan.carpenter@linaro.org>

On Mon, Jul 08, 2024 at 01:05:37PM -0500, Dan Carpenter wrote:
> Only call dev_pm_opp_put() if dev_pm_opp_find_freq_exact() succeeds.
> Otherwise it leads to an error pointer dereference.
> 
> Fixes: 78b5f6f8855e ("PCI: qcom: Add OPP support to scale performance")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 1d36311f9adb..e06c4ad3a72a 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1443,8 +1443,8 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
>  			if (ret)
>  				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
>  					freq_kbps * width, ret);
> +			dev_pm_opp_put(opp);
>  		}
> -		dev_pm_opp_put(opp);
>  	}
>  }
>  
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

