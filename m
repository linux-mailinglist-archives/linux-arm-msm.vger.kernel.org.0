Return-Path: <linux-arm-msm+bounces-27834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FEF94692A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Aug 2024 12:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58567281ED9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Aug 2024 10:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2AD14D2B5;
	Sat,  3 Aug 2024 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNgHJoy6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A44136338
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Aug 2024 10:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722682596; cv=none; b=C0aFkRhFzS6NjzxXj/oJl+la7Hp0si5aic7dULx5owHyGA2ucwxeB0F2Yuuesopd/5AS/NmMcdFRecHt79+ble/OHFYlYB4Ev1P3Jea+4MaW+Tgb98EHrT0P4sOxlgu+ogQaOceImYb6aR3qFe46LB/K8R1YPLxMN+AGEG0E/GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722682596; c=relaxed/simple;
	bh=nrlMGEJJ5aX7Laixz+akGVxF9dc5gZmdW21guCogego=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbcCE17Sw8UC7lvKMJN3JDKA6Lgh82sALCj27Hrd7ExC7D3Of0rS0XHKu8apaw+Nz6Yoe21UrT3OXg/2bhtAL2eVB0qJ73f46TFZn9ZEaM/pU09Jx/dKmNDKSf5dp9GTYu/rWL6WGrFCletCOB6I1FqLp9HADTUaa79RE2Jl73s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNgHJoy6; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f149845d81so57322891fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Aug 2024 03:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722682591; x=1723287391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zFGbyAjW1w4M58XToT7ALIJYYq+pGIzP6blALOgt5Z8=;
        b=WNgHJoy6wuO1AJTWMDnCQK9q6Q8GRGSVVvsHLm9LQ0AjKsu7TChm9SUpMaxw0yV38W
         j3XcSFeTkkf+hqwslfEUtOOEvPzcRTK/YxZO/aaLDcbZeZFumICCGD/4EOPiPAe4ksWN
         stHfh3mNeUxbinuUZP/iyEbybf3BjmaBGRKF0l8rjowLMHSfWbxgF19RXdBKuMEldKKh
         O8e0EIRyNLMW8aPeZT7xlEPLsAn1M2rCuGPyNEFXDpAL4zwj+aqnaKSO5XnRnNHCJDbg
         qT04aNOkY5int3ikUX1qUKyfd6ZNXT0Kxh7M+/5OffELy61p0xgCo1Nlp/zGCYz+lcCw
         eDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722682591; x=1723287391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFGbyAjW1w4M58XToT7ALIJYYq+pGIzP6blALOgt5Z8=;
        b=gfhYy5os6oAv9QDi6jr3qoW1MzTMCPrJXWfdGEuKB2vHgXkRUwdkox69JVdkWu9pjQ
         WBrVdbzi+m2NQae0ksCavGro+UiK4Qays/6HA0MIYhmqRay8N4xw5sm7QqzPu9K4zRQS
         lNf5oFRNWLmfVOvzkazif7iJDMI6+5D8tzb/Mb6/RZNV/YfMXi1qMJu9IPpvPu/S++Ib
         5g3Xz7pAaGe0ulREv1UMDP30c5Lk1ATtLAp6gocvV9psTjgs2u9TflHGkX/Ux9oPJDdr
         VzdDu6oftcEx4IfL2OSyiGPAjh02FP+7DTeX37FvHca/xT2t/lmyf8twAVyDHL3kWAlP
         K9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXxTc56aVKtGowN3On1SstZ0lO3w7YDih2onDPzWQGF3Yw9Wz5sSRYAiGfI9NbNVSVSqV2NM4j1UjxrVuhiacRQl8xnDMB7cU2wQ3hsKw==
X-Gm-Message-State: AOJu0YwXQi5N2ZlkFax1ZH/yhXn5FMrVnvUWSOozo6aqUpAfUEeuv2yp
	zYpQEpZfbSX2lEBNgHJ+ck7fhlhxEfbuYbwxRVWSn3RZMhDTGP2ycA047ZkDSC8=
X-Google-Smtp-Source: AGHT+IFUpvR3dJegdmCJT+3dknqNCY1TNW1KZ+ftMMd3zQaeZFPhnGpFyU8NvmSL2agXSyUxbjW5Bg==
X-Received: by 2002:a2e:850f:0:b0:2f1:56a6:6057 with SMTP id 38308e7fff4ca-2f15aa84e01mr41188741fa.7.1722682590608;
        Sat, 03 Aug 2024 03:56:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f15e18649dsm4066051fa.5.2024.08.03.03.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 03:56:30 -0700 (PDT)
Date: Sat, 3 Aug 2024 13:56:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	cros-qcom-dts-watchers@chromium.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	andersson@kernel.org, quic_vbadigan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/8] PCI: Enable Power and configure the QPS615 PCIe
 switch
Message-ID: <hq4ptnfy4bxc3javkjuos7tbncrjw2qa3znokx3ocu75ei5fhu@bgwryygnbcq2>
References: <20240803-qps615-v2-0-9560b7c71369@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240803-qps615-v2-0-9560b7c71369@quicinc.com>

On Sat, Aug 03, 2024 at 08:52:46AM GMT, Krishna chaitanya chundru wrote:
> QPS615 is the PCIe switch which has one upstream and three downstream
> ports. One of the downstream ports is used as endpoint device of Ethernet
> MAC. Other two downstream ports are supposed to connect to external
> device. One Host can connect to QPS615 by upstream port.
> 
> QPS615 switch power is controlled by the GPIO's. After powering on
> the switch will immediately participate in the link training. if the
> host is also ready by that time PCIe link will established. 
> 
> The QPS615 needs to configured certain parameters like de-emphasis,
> disable unused port etc before link is established.
> 
> The device tree properties are parsed per node under pci-pci bridge in the
> devicetree. Each node has unique bdf value in the reg property, driver
> uses this bdf to differentiate ports, as there are certain i2c writes to
> select particulat port.
>  
> As the controller starts link training before the probe of pwrctl driver,
> the PCIe link may come up before configuring the switch itself.
> To avoid this introduce two functions in pci_ops to start_link() &
> stop_link() which will disable the link training if the PCIe link is
> not up yet.
> 
> Now PCI pwrctl device is the child of the pci-pcie bridge, if we want
> to enable the suspend resume for pwrctl device there may be issues
> since pci bridge will try to access some registers in the config which
> may cause timeouts or Un clocked access as the power can be removed in
> the suspend of pwrctl driver.
> 
> To solve this make PCIe controller as parent to the pci pwr ctrl driver
> and create devlink between host bridge and pci pwrctl driver so that
> pci pwrctl driver will go suspend only after all the PCIe devices went
> to suspend.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
> Changes in V1:
> - Fix the code as per the comments given.

This is not a proper changelog entry. It doesn't allow reviewers to
understand what actually happened. Could you please list your actual
changes in a reply and also include them in a changelog if there is a
need for v3.

> - Removed D3cold D0 sequence in suspend resume for now as it needs
>   seperate discussion.
> - change to dt approach for configuring the switch instead of request_firmware() approach
> - Link to v1: https://lore.kernel.org/linux-pci/20240626-qps615-v1-4-2ade7bd91e02@quicinc.com/T/
> ---
> 

-- 
With best wishes
Dmitry

