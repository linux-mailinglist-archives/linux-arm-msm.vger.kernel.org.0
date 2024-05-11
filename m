Return-Path: <linux-arm-msm+bounces-19730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A5B8C2FE5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 08:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA09AB21407
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 06:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67024C66;
	Sat, 11 May 2024 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6QWFToX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19168A41
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715409578; cv=none; b=oJj9Y80kMee+SyPsljNfFcu2uAa8e7kdTZ8ljhjqWlQTkqLJXoyEfPodF0Ss68kk7rwfCh4+RvTHG7A851DlSkZWEFAT9jPvJTl1amnrT3WVZIieEqMgHzUovTBWlLD6v9jGGN438SmC95SvSsBIr4nySud3O9NOGcJg/k7X22Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715409578; c=relaxed/simple;
	bh=ohIU0BNbyMtZNdVZlUNr4IqV8gPhaMqQ1agVuP69fhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDXACV6rsT+Uf1ZTACfcaXyew2H3b9m+qQv01yWWkmahKf62H/jhVdVybJcuSGwro7vBQJAT6eZOOI51HucvVovNKPkIzkOVNVildhRrbnW31RRD3C3MBxugaOtCJebX+dMDkMERmbuESiIIrA7UxWSWBbT97g1oClJNP5OquIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6QWFToX; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so1593462a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 23:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715409575; x=1716014375; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ZGOyYQlPMjCo7NoBFPkuXTj+4higrK3cJrWnMzKiEg=;
        b=g6QWFToXQok+V3jhWb2TA3WU/cfN+txc45PKhItOMk96vdRAEaANIWx+gFttgrZYl+
         FaI0gNYJJUlNVBsU0WD281elonouHMH79bVjcJIcikEn7fIQq+1qOAg7Oyvqny8ZxMB5
         UcM/tzNUBRzotnXfpSVPX9quL1B3mOqbutzAuG5Wrt+3AXVoayqJf6ylehJpcRzJu5fd
         qJVZl66V3RmCFsyB3I0stWXqVJg3DXjGQyIy5APlEfcU179nQ2E5nYyP5RHRbvbKn+dW
         EbWLXROGUq5dwKFMtKiMiVJu7m3KL6nm00/lA8Yx6c6eyL9A+Xp7pBdaZWNtUd8iCsmH
         QoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715409575; x=1716014375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZGOyYQlPMjCo7NoBFPkuXTj+4higrK3cJrWnMzKiEg=;
        b=jknfH3QkiF7YukPO2GPNnPDDkKrGx5eGfH722ax9vIx2bzOce9t2Lmy458A4YE/vCK
         u++cHAeNyBVmwKGznJx1txUeI5wFQIA850xBRdTYGEqUOBq5Ez84l1PFLN5+zF8HL6C/
         VdL8n2lXoKEhrXp0CWTHhSL/LQeubolGP2yrKcNcrv4ph3cmbDl9flxEM4FxIyrCj8Lz
         bc2YR7I8QOpUyoM7jFSeDi37z9O8WGFPq8ixn6NOMxD5PH51IZvZj0K6WZVYf7Ww8x+n
         R4E3p1+vgv0q0M19D5Re3tlm+3bJL7IZnsJinuKPPDqSr9+SEcbmyzR2b7nm5XyPLxvR
         HXeA==
X-Forwarded-Encrypted: i=1; AJvYcCXgW8u78cv0fxrCj4tcwI+l3hYuCBbB2w4BeY2bnQyVv+C3VoP7NHXIMDsrE+P7bAyQ25DwlHEuskrGri1e+zQ9q45jZQBiFvjhUUkQoA==
X-Gm-Message-State: AOJu0YyUO8uEsNtTl4LHV8i6FdWU/0VS94nozuJAubwShMJgI5g9p63w
	Tvf9MPreMacuGjrJgBD2XdFndc9oymXpc+0SXKfDVtgmFjGMSgwlsQPeGakjSQ==
X-Google-Smtp-Source: AGHT+IFcPHdwaLWt2eocdN1RJhFnTd98pYEBepeLkuj7kAaEyXPW4pVze6C7JF/k2OT36e+fxjw+tA==
X-Received: by 2002:a05:6a20:dc95:b0:1a7:60d8:a6dd with SMTP id adf61e73a8af0-1afde1df3b4mr5538644637.53.1715409575282;
        Fri, 10 May 2024 23:39:35 -0700 (PDT)
Received: from thinkpad ([220.158.156.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b671056629sm4242175a91.7.2024.05.10.23.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 23:39:34 -0700 (PDT)
Date: Sat, 11 May 2024 12:09:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 RESEND 5/8] PCI: qcom: Add support for IPQ9574
Message-ID: <20240511063929.GB6672@thinkpad>
References: <20240501042847.1545145-1-mr.nuke.me@gmail.com>
 <20240501042847.1545145-6-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240501042847.1545145-6-mr.nuke.me@gmail.com>

On Tue, Apr 30, 2024 at 11:28:44PM -0500, Alexandru Gagniuc wrote:
> IPQ9574 has four PCIe controllers: two single-lane Gen3, and two
> dual-lane Gen3. The controllers are identical from a software

You mean to say, 'identical to IPQ8074 Gen3 platform' since you are reusing the
2_9_0 cfg?

> perspective, with the differences appearing in the PHYs.
> 
> Add a compatible for the PCIe on IPQ9574.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

But the change looks good to me.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index ea81ff68d433..e61888e6c63d 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1551,6 +1551,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-ipq8064-v2", .data = &cfg_2_1_0 },
>  	{ .compatible = "qcom,pcie-ipq8074", .data = &cfg_2_3_3 },
>  	{ .compatible = "qcom,pcie-ipq8074-gen3", .data = &cfg_2_9_0 },
> +	{ .compatible = "qcom,pcie-ipq9574", .data = &cfg_2_9_0 },
>  	{ .compatible = "qcom,pcie-msm8996", .data = &cfg_2_3_2 },
>  	{ .compatible = "qcom,pcie-qcs404", .data = &cfg_2_4_0 },
>  	{ .compatible = "qcom,pcie-sa8540p", .data = &cfg_sc8280xp },
> -- 
> 2.40.1
> 

-- 
மணிவண்ணன் சதாசிவம்

