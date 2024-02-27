Return-Path: <linux-arm-msm+bounces-12753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F52869D36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 18:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E61EB2793C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 17:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2102D4E1CB;
	Tue, 27 Feb 2024 17:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OV1FbHlu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FE74C63D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 17:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709053732; cv=none; b=qQ59s0VNLrWg5iNNh3AtWltbe8+9Al9BOSdKI6ZqbjW7SNlXxLQXG4c0WUb9Y1rbaxscNxlcGi+YPfpS18xlSinyxGX/9+EsCsDb/eO5CwLoK37YW381FAuwFZtY1CUyudxmXIL5ijaiYqdv5RnFMIiGZx7YBokhGeIfQqdDQCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709053732; c=relaxed/simple;
	bh=LyIC2a8YCi8H35J3OmUP2FanwA/jMrbgvLb5jpkEIFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z48XCZvJpmrBOP8dwajzNQfpMwpIznw/WJ700PZDxxXQq3QGSMJyx7RaCR8EcCPLDF0CJN5XDQly5X9Szo69tyvlDG4WAaj9Z64i/g/ZeRyiN5agcY3BN5kgCJ7FrAN7c7BWvps4XM2MlegiBfZ39eUP4URHg2p0FK5OHIFCxd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OV1FbHlu; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dc75972f25so38259855ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 09:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709053729; x=1709658529; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lmc3sjc8em17oChCJSQpaOzbhd1qpZMy7Z0nwlTPyEc=;
        b=OV1FbHluXUQPzO7NWQ4faDtrR1AkKEeiRAfRi/Yoqt1b9ql8Ne85nQy1UPWVbl91lv
         AdZpy+i78t4JRIivHJDth32osYdT9Nv+OJ7DCro5zZFlHp0+9cj7raWYuD5wgfgW4w6B
         0e5ONboExYxPEjlR//w5nvSveC7Nn1DlZBcu73j35kPznjlDSAu5ezY9HNxOp+P29rNZ
         Nw4Xm5SJTlxNtawSsP6ZJqqlclKODCgezbhSLwy/CEnSZxJO7H9yTNSFc9MsT9u0aOKB
         ONoyzPGs8Ab+kTrRnrbwdGLc3kT6/tVW4HnEcnKyN9I6le7xE6uGOAhxTdWi1xdDEChi
         bSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709053729; x=1709658529;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmc3sjc8em17oChCJSQpaOzbhd1qpZMy7Z0nwlTPyEc=;
        b=r4EC01+i6Ax5Do1PR0dtaTpXLDlzBiuchBSRlRlGTmTKJP50zviDxbOjjy/RLVsmWE
         76Ek4vC9ghdvv8H4yPtYV6V1pdyI0FJho6WLrr4M3cvUMfBL0s6w0f0Wcv/IqSA5+VEj
         vHtlpvQ3Rq3qfPUgNABzIqGA6eweukPwbUm/SIpAnJiGBBbHRwMJpQzfsbxj3nIbzhqw
         KBBeRvsdHvsSt4fQSg6HYoWO4/LE9n44oiqI7SJPTrTAPZiQpnHg+JRNEUWV0tudUeWd
         RLd42pkKxl/0JhV4CPvXhi0yJKcqH4N7m6BZrpg1ovfdDAAmflEyh9VaeQ6XXZO87Bwj
         iqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlVyGirqUwj1oZ+XZxvX7CH08eFSyCP6pk1pFNlygPZaAN8/5O4+xGmkGiFyZVCdXAO5/ZiNmG8Ig3K3WlX4RZ/tHg1Jr7HanGGreOYg==
X-Gm-Message-State: AOJu0Yx4N6hgkt3etY6AoaPVuhVGtAho//HETTDkL+5A1pgVgnbjlaBi
	dmQd6nVR4KDhe05xx2l3QGRgg2SSluBCZSRIBjyCZZmkaPT3bXgMVXIwes4BGg==
X-Google-Smtp-Source: AGHT+IHfCTuVOr5Vdon+2BmyjsKL8DKicx4h9TEm+qIcTGywS1ZZGmFjLcn17HKfB8h/qvkApA/qPA==
X-Received: by 2002:a17:902:6b49:b0:1d9:8832:f800 with SMTP id g9-20020a1709026b4900b001d98832f800mr9202931plt.8.1709053729485;
        Tue, 27 Feb 2024 09:08:49 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id d1-20020a170902c18100b001c407fac227sm1765279pld.41.2024.02.27.09.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 09:08:48 -0800 (PST)
Date: Tue, 27 Feb 2024 22:38:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Lukas Wunner <lukas@wunner.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	quic_krichai@quicinc.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] PCI: Add D3 support for PCI bridges in DT based
 platforms
Message-ID: <20240227170840.GR2587@thinkpad>
References: <20240227073057.GF2587@thinkpad>
 <20240227162535.GA239073@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227162535.GA239073@bhelgaas>

On Tue, Feb 27, 2024 at 10:25:35AM -0600, Bjorn Helgaas wrote:

[...]

> > Ok, I got the issue. TBH, I added the device tree property based on
> > the existing quirks for the ACPI devices. But none of the DT based
> > platforms I'm aware of (even the legacy Qcom MSM8996 chipset
> > released in early 2016) doesn't have any issue with D3hot. But I'm
> > just nervous to assume it is the case for all the DT based platforms
> > in the wild.
> > 
> > But to proceed further, what is your preference? Should we ammend
> > the DT property to make it explicit that the propery only focuses on
> > the D3hot capability of the bridge and it works as per the spec
> > (PMCSR) or bite the bullet and enable D3hot for all the non-ACPI
> > platforms?
> > 
> > We can add quirks for the bridges later on if we happen to receive
> > any bug report.
> 
> I would assume all devices support D3hot via PMCSR per spec.  We can
> add quirks if we discover something that doesn't.
> 

When you say "all devices", are you referring to bridges in DT platforms or the
bridges across all platforms?

- Mani

> If we add annotations that "this device works correctly", we're
> digging a hole for ourselves because it's impossible to remove those
> annotations and they complicate all future maintenance.
> 
> Bjorn

-- 
மணிவண்ணன் சதாசிவம்

