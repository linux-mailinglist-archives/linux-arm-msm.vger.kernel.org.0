Return-Path: <linux-arm-msm+bounces-26262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D2B931F8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 06:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 121651F21DAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 04:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B015A15ACA;
	Tue, 16 Jul 2024 04:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3hPXilY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CA311C92
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 04:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721102748; cv=none; b=qiXKE0vJVDFqh/FliDCel5WYWi+ZqPYJU9fvkgy94JIUE2ywVTKy3NKEpP5+d42/AYGrD6CiSusDT7FOqksdsQqVwL04AwOAs2MtnQDAgOc2/SyOqu5pAQt3DIo7sZmcsI1hk5O2kikoRlGZ4FR6JWJU+7apAmhLZ2K9R7bJ0lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721102748; c=relaxed/simple;
	bh=VS6EfNK47CI9CCIESYrotd9kMA1ov2RmVpon6OM+jKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mtu5F6WwyyTJeYvthm84K0H1xlk6gj/LwWde0P4m+/OvxmSlkqwykd3WNRX8lmAZPzbgnOLfE2PaghP/0NTDVDxCn3YrD2/O1SiyO2uOt3rineMkonY+0tKy78xhNbpU8dBoHdGGx6imBh+wpPNC5HLPnOL+qpLOcc5dSlkzYnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E3hPXilY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fb05b0be01so35069955ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 21:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721102746; x=1721707546; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rA6xNk3KrlizNp5+s2A1cTpaTQXoSxtZU7FnGPFRjJg=;
        b=E3hPXilYXZrfCIqkDBNR94Z5WxTCIItYno6cCzFzpsfoA/hGN8U/05eZenZlSmv1ci
         m6RHhlrNV9c1awnxOFAnDqpJagNnIRH4dKjOv6QTS9h8d36oSM0LH385iZrE8vws2kIR
         7dNKlml5eX3YZgjo3cbNYNqSW/IOxqCWrn+0QCd6PmylTQY3zF1bby+DbgYXhomU1Uct
         nH1JV6hq/4Rki2N3U1KclW3gVgLVdM8rf6wSK/jU4DoUb6a7FmvrdWxCwKw3IacfPd8E
         RTe+jxDiSU06+8sLpOIxEmwNI3zfPILYGqPO0gGgqokgjpPiGXIQ75BFF2nIDueDaAnq
         QMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721102746; x=1721707546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rA6xNk3KrlizNp5+s2A1cTpaTQXoSxtZU7FnGPFRjJg=;
        b=o03Yvxo8LOk2VZcezF6f8uVHR75qINnZm6i56r8OqZWPhwSlmAtqJkK4ML0tEDLX0o
         svFLF0F27iZCc0LItVxpYuX8W9KizNRrEl/enNSQpwWhs9ELWRGwEgWOoZgGq/ly+NNu
         QV1N43IzKw1/8i8JX9uP5hM36ZeTlns0eWV41QJCL1VZQ/OZvG5gXKgh6Xwtk2t46SF7
         5PsT1azR2k3tQrfSFnNCk5IU9US2qG/Zi8O8wW0xMkgw8M0+iladJ/6GVBxofBP5wl6F
         y13/ZbKRYV4MkZbVxVYcJt3b9Hn2cePGWI+dK+sN4MUbKiZiG2N2qgnmbjBdCamyqRX4
         YUmw==
X-Forwarded-Encrypted: i=1; AJvYcCVsaYjDPOQwuRtQI3KpikhrpjNwVSQhmCLScOCVSwfkMSfTCBLqUm7eintL2h7O/BgqukVvtx1bjXulbQs65/RFFihgTRezwvxfUvBhbg==
X-Gm-Message-State: AOJu0YxvAHF2xt+6rWManhl3WIMrKSr0QH//72BqVs9noh2FM3qHizCo
	Cgj6WVT3NEGwkLh9exVFdKULN2zt6flgCAjWVmhCUXlFWseuaCwS/jzZIq+nBA==
X-Google-Smtp-Source: AGHT+IEEp12N7H9rdwF7a6ALoUF5nLk0VlGH0DjnjAF23n1gqZqPTmDQQlr65ikW50Oczrb310hp7A==
X-Received: by 2002:a17:902:f54f:b0:1fb:29e1:7635 with SMTP id d9443c01a7336-1fc3d9144cdmr7484105ad.13.1721102746522;
        Mon, 15 Jul 2024 21:05:46 -0700 (PDT)
Received: from thinkpad ([220.158.156.207])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc38a81sm48592855ad.220.2024.07.15.21.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 21:05:46 -0700 (PDT)
Date: Tue, 16 Jul 2024 09:35:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 04/14] dt-bindings: PCI: pci-ep: Document
 'linux,pci-domain' property
Message-ID: <20240716040540.GB3446@thinkpad>
References: <20240715-pci-qcom-hotplug-v1-0-5f3765cc873a@linaro.org>
 <20240715-pci-qcom-hotplug-v1-4-5f3765cc873a@linaro.org>
 <0690964e-fe50-428b-aa84-be298cd6dfa0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0690964e-fe50-428b-aa84-be298cd6dfa0@linaro.org>

On Mon, Jul 15, 2024 at 09:59:12PM +0200, Konrad Dybcio wrote:
> On 15.07.2024 7:33 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > 'linux,pci-domain' property provides the PCI domain number for the PCI
> > endpoint controllers in a SoC. If this property is not present, then an
> > unstable (across boots) unique number will be assigned.
> > 
> > Devicetrees can specify the domain number based on the actual hardware
> > instance of the PCI endpoint controllers in the SoC.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> Hm, perhaps pci-controller-common.yaml could make sense here?
> 

For RC, this property is defined in 'pci-host-bridge.yaml' which is hosted in
dtschema repo. And the description of this property varies between host and
endpoint, so we cannot use a common one. TBH, endpoint doesn't really need
_this_ property as there is no PCIe domain here. But I used this one since it
already exist and does the job pretty well.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

