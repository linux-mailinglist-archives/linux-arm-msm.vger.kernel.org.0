Return-Path: <linux-arm-msm+bounces-48035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA55A35F1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 14:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C82C3AE3C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 13:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B29264A65;
	Fri, 14 Feb 2025 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e2IAxK2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BE6263F29
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739539376; cv=none; b=X4FHxlyamdvlMQjDu8Uu+rLJqQr+P8mEJKiXC8atVfln6+ftFPEtQ0orHd31agY7Yl1lIu6lJBZiO05m0kios/rSVMed4ORp/EhveeSlZmpaOEcwHnXPSNkJS76oA6WG404t1Ll8a+slrdAT6wvEdwh+uKCli/7VMfhHqVmXsGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739539376; c=relaxed/simple;
	bh=pWZjOIvAdjT6JfA3vcCeZG20HLsqwLE8w4nVMAYXnl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KG2juOee6SRT8DXEcMbavlKERdfizLbSc8Ic2CintFeQ67r06mLLTekpqnL0fAPizOy5eA/4SNkbOucWJQC8MvpM5pJmGRQ8zG0uKAWOCU9MEhGy45HO9CePjZnZzQ2utOsZDE05b5m5SBp7zJVtINLwe3Vhc/OjIMA0OoJQDrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e2IAxK2y; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220c2a87378so28873825ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 05:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739539374; x=1740144174; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S9I+jjcPbUp0BbQYQVtg0pUppikDLXkHzO0OowWPexo=;
        b=e2IAxK2yaF2CN1op+zXJgA4yg6c9ldAN9Vo6Ufy0jSptzmscRlNXkO9+MHFZyckEdF
         0IXMWEs0VsdWpyWAk1F3F0WPJcrrQ/mqdKP92EppCRkarZ7yKd7VtptgGWcG02fSMcY6
         /MhZJlNTJMamRc5wA6uLLdJ5PNkIZnzFOvj67SMbzHa5lOmnyxp/ipxXq8TrLUh8h8wf
         VDi1tTSSZQ0eNAyHNpQDtQule5GN5/Ki/rB39J1n/yFNn87VTZIuPCzE+bwTyP5G0Dbs
         6buLXVpXfBdIxx7KaIWLtV/SBioDRAxlBoBCcGu63dL0YkaGbzOlFxkY1itlW5WwkK43
         NpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739539374; x=1740144174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9I+jjcPbUp0BbQYQVtg0pUppikDLXkHzO0OowWPexo=;
        b=BUkqtKJbOehC8ebzNunbsSnMxDgPiRlNz3J1PJWwwL0d0AYAaKJgF945KlvFHbCbYr
         hs2S+7VJZzLKCMjHwxAtboGIDQ3BEdVvZdHrEulvWp1OgaYXIiSNgmHJRSgNLnlI7HWq
         kdxWwsr7NJUp3F8FYso0CVrf9mWQGszdCXd+kZ0hfKz4eOOz7+8rvZuiwIlldfqB3H5s
         fYfiBc/c10UF42osFMHxlNF26Xl6DOSjba0H8ABrM6Q0yj5jiJ1+okWouzDfbwn9jJ4T
         CT5ZW8xlH66nYz3y7gF1oMsZvyDTI/8n4WTjyIxrUIY54nzxcvqy4/X7XM8ug/P1yPgP
         C6Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVy5PuwKxYCRYQqY7+2ORbt0Yv9MbW+7gPdGdO7jJ7qw9pV1yPOyvren7DIHtzD8eDP5QKzyf9jQXytOp+7@vger.kernel.org
X-Gm-Message-State: AOJu0YyGNm+EBIcgUTnMGAWY6w+ghEtwKKNK/SOtt8d1s2vhJbR+CEJI
	3pFmPedEd8gzZkbSMod/JrDk33pYest2oaZCGWx6L6LX8RBJv2+QevAv98lW7Q==
X-Gm-Gg: ASbGncv9WM8wnxi+RCPOUOXUcbMjfDnesd323VqUf+p8q9iMj/w+M5cFWBF6I9uUGCm
	AbUWJBL3a4bacYXvyL9fhFpaz5+uxh9s01c4M1L/okvF0KkamrYLc2JQX1iiYwaF/MX7JktpBiG
	7uxLn5TVDiQegUFqFFI2o35LARcRzNWobJJpSyjowMRtYfoJr2KrIbKNf+eZI8TxU0oZUZkPZ+x
	dtTaHIzwonl8J7n995XBpZM26w14IIUtvorSzb1VGlPBtrJJa3XXqn97JY+sx6DelxmykgQ4FpI
	lq6bPRYY6PvkTjM2t+JmjRm2arhuNPY=
X-Google-Smtp-Source: AGHT+IFjWeTr8NsPM9DoEj6yyWP+W7LUbBHpeCWXKCgYoJEQixcGBYlU/CED0PUuiTC1uWtJJjfaNQ==
X-Received: by 2002:a17:902:d543:b0:216:501e:e314 with SMTP id d9443c01a7336-220bbafa000mr181903825ad.20.1739539374586;
        Fri, 14 Feb 2025 05:22:54 -0800 (PST)
Received: from thinkpad ([2409:40f4:304f:ad8a:250c:8408:d2ac:10db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556d7bbsm28739255ad.182.2025.02.14.05.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 05:22:54 -0800 (PST)
Date: Fri, 14 Feb 2025 18:52:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	quic_mrana@quicinc.com, quic_vbadigan@quicinc.com
Subject: Re: [PATCH v6 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
Message-ID: <20250214132246.o5oimrm5ojrcbf4z@thinkpad>
References: <20250210-preset_v6-v6-0-cbd837d0028d@oss.qualcomm.com>
 <20250210-preset_v6-v6-1-cbd837d0028d@oss.qualcomm.com>
 <20250214084427.5ciy5ks6oypr3dvg@thinkpad>
 <be824a70-380e-84d0-8ada-f849b9453ac0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be824a70-380e-84d0-8ada-f849b9453ac0@quicinc.com>

On Fri, Feb 14, 2025 at 02:18:48PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 2/14/2025 2:14 PM, Manivannan Sadhasivam wrote:
> > On Mon, Feb 10, 2025 at 01:00:00PM +0530, Krishna Chaitanya Chundru wrote:
> > > Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
> > > rates used in lane equalization procedure.
> > > 
> > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > ---
> > > This patch depends on the this dt binding pull request which got recently
> > > merged: https://github.com/devicetree-org/dt-schema/pull/146
> > > ---
> > > ---
> > >   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 13 +++++++++++++
> > >   1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > index 4936fa5b98ff..1b815d4eed5c 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > @@ -3209,6 +3209,11 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > >   			phys = <&pcie3_phy>;
> > >   			phy-names = "pciephy";
> > > +			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>,
> > > +					  /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
> > 
> > Why 2 16bit arrays?
> > 
> Just to keep line length below 100, if I use single line it is crossing
> 100 lines.
> 

You *should* keep it as a single array even if it crosses 100 column width.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

