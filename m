Return-Path: <linux-arm-msm+bounces-50410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743E5A50CA9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 21:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD9263A5142
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 20:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BFA255230;
	Wed,  5 Mar 2025 20:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5yW/C3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9AF16426
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 20:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741207166; cv=none; b=h3M1Ix1iKpUgBtsqJmHmFVCrBf6wWBC/YRTaWGJOWk+E51qgZdF6J4svC1Nv1wOrdttKfSF09GCI42UhthKFjt0lfDsvbIn2VBX4QpQEngXF8hRUgKtfnCCxl3BDqC5ALg4nq5VDD/SZ3Smdc5+utwgr1RXtRCoco56KJx7NdTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741207166; c=relaxed/simple;
	bh=OOdcGVb9J/2+PQH2L2EJo4drk+rT60VmQIudXxz2zS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTU9RuKeZJPJZ2Aw52/N9Jf2j1mVcpp2Uu0vuhdK/KKautjf3VUNLvq0uj9vR3JNiL3UCAGvbD5lVNsJVFsm2Na+uyFkXJKfouI0jgDjkfvAna5Wdjla49XmPJYTq3Pp/7apFPOgtKT9tHIA0rKCLs43G26mLdvu8y46TJRCsyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5yW/C3g; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so74657691fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 12:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741207162; x=1741811962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nfcoSxpPFiFuUn8/1PBHFRFeN5zz8LwDXafFbEhPVL4=;
        b=V5yW/C3gtv77+9LuT6pw5yMMjUnHpzsMQyEObUuDzGhbRiGniega86NL+WpapVNide
         peWR+q1NIZluJ80DP/FXDqsdKjHSNM2cP1OMkMGHvpod0Fx1kEzp07osK0xKSsHIaBMZ
         Hbg9KB6/dLauJQdg+o7PvSxLHRcfjJjyB1iihUWOaPxgYEyYxp0W8Zvech94KiAvcA2F
         QeMbppTuEJ+waVg1dS4R7oDzroV+kyipB9ycviEEv1Fh36cEHIr717NhzWp4Vpg+cMii
         hVvOtPGIFOGJM8sYUKTXdDxYWxz6EHHmKmxzOpcqXYua7XLQs2Y8Sw3RkNyye2FVadVh
         7zAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741207162; x=1741811962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfcoSxpPFiFuUn8/1PBHFRFeN5zz8LwDXafFbEhPVL4=;
        b=aQ0f8rYwO4Sy2WeaSps0rpl9b/zbttYnKpO0zvTeeAQospzpjIlzMHXXNFmLkcBY+m
         fcRdU9ALQf0xq3hV9MSJVeoOANT9IXhy/US/ip4vCVw6gtRL926eoSF4hqt6ezEiEHHn
         KwGDjGOIEgG2AXYQ2uFflyLdoMycsFqs9fWAm3o+8v6Dbs08rHW+vvsvFPaTesdPEkZK
         q0zyXNQoIrdO9E7wUhBoE6aVDXKLcmy2P6lIVMHt297vtAsGPOFL5LSPSaf6eTQn35e9
         4yxjshvux3GBBLkF5A11HiHuH7zmNjRynG78WObAGXq6ZSJ/MCwnkvnzZwUNItosb5iD
         bOaA==
X-Gm-Message-State: AOJu0YzVObKejD00AIRseKo1n/vN+hRGNROh1W1sZhVuJXnCBkBvlGbK
	qcmuQoEaOJzLpRQqkozqlAgz584L8KaUPU/HFkb7WhmrdI43EiO+nTS1iUMVx4A=
X-Gm-Gg: ASbGncvXBdGvb6O1TAE0JiwijuRGKuTqFf8LZcwh40jbu7ZGNv78r9o8msYxgrllMh+
	aNa1Mwai+IvHUPqQl/Eci0HrNDVmyiC0qgD+ROUlD+Lbv2kYcFxhK8vTaDA4Mx7jC8oERjO3UXf
	3bV6VHmC2QOxyn5lpKU/iYyDfr0YaxB5FG6lovupeUe8MZmQqmZo0VzmLIzubn24MCb0c5cCjxh
	KN6Vqe29srCchjclFbWN7lhFbEXbS/2lY/CImmrdAHJnHmincjpkDyNT8rr0qhJ1Itg+jCzgAFo
	+G99B0H7RN/MizZWizJivD3a1LaigCJH+MZfi0ZUfehLJCxbwDpHDl61nxrUnMyPUaLWMxpbpbS
	IOFMJoaIXn/WDrcM7gDKYXdMA
X-Google-Smtp-Source: AGHT+IEbTbwWMOL7YUjwBALdMqyrxkNiXMKt6dO7bGnM96j30pIhXzA/HZiAODGdLHzT7qmpsh6SMw==
X-Received: by 2002:a2e:b1cf:0:b0:302:48fd:6922 with SMTP id 38308e7fff4ca-30bd7b324c0mr16257451fa.37.1741207162209;
        Wed, 05 Mar 2025 12:39:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc2ad651bsm9041781fa.20.2025.03.05.12.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 12:39:21 -0800 (PST)
Date: Wed, 5 Mar 2025 22:39:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, andersson@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	kishon@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, kw@linux.com, 
	lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, p.zabel@pengutronix.de, 
	quic_nsekar@quicinc.com, robh@kernel.org, robimarko@gmail.com, vkoul@kernel.org, 
	quic_srichara@quicinc.com
Subject: Re: [PATCH v3 2/6] phy: qualcomm: qcom-uniphy-pcie 28LP add support
 for IPQ5018
Message-ID: <oeu6wkfhx2masvendoweoufzit6dcwwer5bakzvg75dz3uc4bj@bwuj4slnb24e>
References: <20250305134239.2236590-1-george.moussalem@outlook.com>
 <DS7PR19MB8883A6C7E8FA6810089453149DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB8883A6C7E8FA6810089453149DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>

On Wed, Mar 05, 2025 at 05:41:27PM +0400, George Moussalem wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>

Something is wrong here. There can't be two authors for the patch.

LGTM otherwise

> 
> The Qualcomm UNIPHY PCIe PHY 28LP is found on both IPQ5332 and IPQ5018.
> Adding the PHY init sequence, pipe clock rate, and compatible for IPQ5018.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c  | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 

-- 
With best wishes
Dmitry

