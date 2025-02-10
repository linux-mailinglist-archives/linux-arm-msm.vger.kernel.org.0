Return-Path: <linux-arm-msm+bounces-47369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE27CA2E5C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 08:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D82F7A126F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 07:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB6C1B0F21;
	Mon, 10 Feb 2025 07:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iSQjYFTE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFA01AC892
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173923; cv=none; b=oUlPZvvKBYh8yQqvkFSqiqJg1f67G/tXrHABJL9euu4QGXW4B2xyjB97koLIghKNBK4OCCbObF2IjW50iDpMSdC6Exor+Y1gEBaLyj4tJXx259KGEnOrOeoD+4YgNlaIYw8nLBnZdIgSfBFnbk5ScX2P5jyXaYkF7em8uFMmH3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173923; c=relaxed/simple;
	bh=SbiBsePgUUDw8ub83Bn9h4Z6Q+/Z2UG671GLzYjIXHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWUdjJfiPsd18+GQ7ESxWme3UDLMEt52jbT7cT25IqtfMw+Ac0b93HpMgtB8kt9yxY1B7R3i+l621oUWwUY65N5G3hvdb4/wh5l9n2WksB5Sq0LR1w2CGY/+pccf3Tm/vqXdpZl9NnG2/Qhpr8X+nz14htmWloMveSrxtDwStCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iSQjYFTE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21c2f1b610dso99578995ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 23:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739173921; x=1739778721; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jRRm29wGMApxPz8FgRvy/J5UYrL30LQ9avtohjE2Q3o=;
        b=iSQjYFTEgU3v8EvCcFO3B+QjnAAKJ1ZbmdtTVyoKGUzI7wXHD2OkIa36cAIaBumphT
         jt4ogZKCR05t3a3mKZr0FWRfw9QC/IYdutS1NuSMKGgI6tJaOrFPDbE3IpNvsZdk+9cB
         vREc+c1aCclli/Oxd1zZJN45E4f6G4HbKm6tMnqbVFVmvlOHkKFQvBthhhErTcX0iJFh
         KOfRscX8Vxze3TcHl+C7CZYB4iKb/nOmTjvUnGJxxHy3iO+7iRCCKsn4HhBU0lRROw7R
         bz3cXP1hcoS/aAYrhnHDhyK+vNR81R2dLeJ3r6++94FD5fxm8d1iMIW9ch1tFvcVasKi
         dBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173921; x=1739778721;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jRRm29wGMApxPz8FgRvy/J5UYrL30LQ9avtohjE2Q3o=;
        b=NmmWbW3DzglVVJA/tx5/G6bgr4Xh56cRHniEkVJEivzY1AzNt39ZRuY7g/TUeSl+Jo
         2XNlBqNJoVq0/Q+s0VKuQ0IKiE2PUtby0fzfw/VxTobiKyiklU0yV57BK59eDqgtFwq0
         kvLuRPX49mYf6BcTKmbTNXSiDb1cVP/X6+UVTYBdndF0q2gELECqJr76zb7NCcEGjeC4
         jWAw884F0pL0c6IkA/IdAZlF63ueMa2QgWqopOgip0bI2B2hWjci+c0tcxcpHZOEE94n
         csa8VQwgYHFJV/m7eMhPpp2CLYAYGaGUl8ONDc3tEH3AO8sUn57EljpGKl/2QTc/uvmn
         5WtA==
X-Forwarded-Encrypted: i=1; AJvYcCVMUK1ZAeRqw3rtTu/r9NULgfbGX52+c0oP1nNZ4DDSmPPua2Owhf46v6bFBR+jA2NnN7W/c7bEE5nbi1Xi@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkOmP8PhV32IR15diU1oH2LG8lO6zbufSkmLgciksZBeGyqMN
	7bf/Adr9kZff/2ci3qf1i63/kahF0bcMsxSB0wFl8ZDxRdAhmyMk1kOK35y6+RXFiShTiBqCxgk
	=
X-Gm-Gg: ASbGncuH3gJlEz82PfA5t8+hyd1OMNIK/JEPVUhjheahDjbwaYV5bl6X4a1AzOenqET
	nz0AQ8+oZkOjnnf00PwitHBEDEs/Rf7STGfqbhZee7Og+bmbXvfCd6MRJRrCfEK6aMe8uZnX9+8
	NuXexHywDmO/lJixprN7RTqLKb6LI6zwK3jLYef/nzBxx1J/ysaWdxYF6drbvwr4/51S7d8HYv2
	Kn0SSG2i5+awk6qBykrI4UiArYofP34eU7a/cjkB8LyStiSU2ca0b9Dpw9WiTbnXsMqksnUsI55
	Dl47d26sjyr/qnV7/QWOffidYpgA
X-Google-Smtp-Source: AGHT+IFiBhqV22C5q8pOwc0SqHNUPt/CKAPUfMB5p7rCsPdXXm7wz9qVBmWTaac8lz1b+Tnnpgp3rQ==
X-Received: by 2002:a17:902:f806:b0:21f:dc3:8901 with SMTP id d9443c01a7336-21f4e7985c6mr166681905ad.34.1739173921291;
        Sun, 09 Feb 2025 23:52:01 -0800 (PST)
Received: from thinkpad ([220.158.156.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650e6cbsm72256895ad.40.2025.02.09.23.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 23:52:00 -0800 (PST)
Date: Mon, 10 Feb 2025 13:21:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, andersson@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: PCI: Add binding for qps615
Message-ID: <20250210075155.ka3fy3xiptyy3w6i@thinkpad>
References: <20241112-qps615_pwr-v3-0-29a1e98aa2b0@quicinc.com>
 <20241112-qps615_pwr-v3-1-29a1e98aa2b0@quicinc.com>
 <20241115161848.GA2961450-robh@kernel.org>
 <74eaef67-18f2-c2a1-1b9c-ac97cefecc54@quicinc.com>
 <83337e51-6554-6543-059d-c71a50601b09@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83337e51-6554-6543-059d-c71a50601b09@quicinc.com>

On Wed, Dec 04, 2024 at 02:19:56PM +0530, Krishna Chaitanya Chundru wrote:

[...]

> > > > +                pcie@3,0 {
> > > > +                    reg = <0x21800 0x0 0x0 0x0 0x0>;
> > > > +                    #address-cells = <3>;
> > > > +                    #size-cells = <2>;
> > > > +                    device_type = "pci";
> > > > +                    ranges;
> > > > +                    bus-range = <0x05 0xff>;
> > > > +
> > > > +                    qcom,tx-amplitude-millivolt = <10>;
> > > > +                    pcie@0,0 {
> > > > +                        reg = <0x50000 0x0 0x0 0x0 0x0>;
> > > > +                        #address-cells = <3>;
> > > > +                        #size-cells = <2>;
> > > > +                        device_type = "pci";
> > > 
> > > There's a 2nd PCI-PCI bridge?
> > This the embedded ethernet port which is as part of DSP3.
> > 
> Hi Rob,
> 
> Can you please check my response on your queries, if you need
> any extra information, we can provide to sort this out.
> 

I believe Rob was pointing the 'device_type' property which is not needed for
PCI device nodes but only for nodes implementing PCI bus (like host bridge, PCI
bridge).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

