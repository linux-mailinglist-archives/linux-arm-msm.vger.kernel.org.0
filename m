Return-Path: <linux-arm-msm+bounces-43939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2609A018FB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jan 2025 11:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 996883A2D99
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jan 2025 10:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F236B14A4FB;
	Sun,  5 Jan 2025 10:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aBRmIwQ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A82A14900B
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jan 2025 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736072183; cv=none; b=HPmhQDSGGRwuyoB7N75d+TykwHP63kYd9QQuFPu/hjNCVTklb2wyDL2mFQxoTBMoRXh1jHJ/5GN0SVpk1IdmlzFQrcP72XY3CRNFxicRokbEdVdeken3SvsJxftFxnrhBkrEnyd3tWP+m8K8qOas8lnMkO/fe3Dc6r/xFMn20G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736072183; c=relaxed/simple;
	bh=QX3GlHCiOeKhbnkNGa0YgvMYTOFxdII/ADUW993HeNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpwrjGT1qxNFNNee58ap0nIpLhnK60vdNOA5NFynGs4i56VLmM8peg03knT5gvdL2NXi9kO6B5yaCqgDrej//X/1o5L2IDq7pkloA0SXcmLM1g3OPvaYc/Dkajpk0M8jwBS0j9j3tEXObOq+KBsXxNBq+LTuL4Yj7lP0D/gUDVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aBRmIwQ4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21675fd60feso252346725ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 02:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736072181; x=1736676981; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zrE5Aplqu1OAUwGuNQrs3gcEgzpFuCPF0j018+KBT2Q=;
        b=aBRmIwQ4aLUY8cPBMFLx978dD88hEUlM2B7AhQM72T7OEB0XnH77dVw/baf/txE7DK
         tIQzyyCyH4UAhbgDFCBiJuuO+6LgWXFQ7301wJA/5LDql5BiO7SGzobol1q0v9gEOQjQ
         kVnDZxZAuB29nKeenRpqJe5DKg+nnnphdWwWjWGPh7QVNo+UT6Ms01bCfXFo903AXGf1
         gyVFJP8tZl2PfT9vrHpY2nVDIykSvYFzlb85h5LDUGlVi9744X18NRipXNWhp1MmSFb+
         9q3Xw0wgOy7KT/Xlf5ehbuThI6l8GLGW6WkSia0xtZUBv2owAy6W9Z1i2YBBR95fH+JP
         11HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736072181; x=1736676981;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrE5Aplqu1OAUwGuNQrs3gcEgzpFuCPF0j018+KBT2Q=;
        b=tNtpMmF5+1jOCtXvu00u0uTRRuWDF3z1uIuYSer2pgbgl/e5PlmLxM7Zm3I8hYdx5l
         1T4z+LEY8UHe6jezHRvdICffeOyZoL3avCmWxQLfAt6tQheO0+VjkeAvNs0hISfJBYZ9
         4O60kBa7vUWId/DbsKbR0kdTHBTY7CXEiI0wqEklAVkL2ppsWWKJFQjs/JsLxnoh5jgM
         zP3D9OTW/lFpOpCc/J/8HPLfemgkxSu5tSDO1btHEV5xFrgIWF3q4kvYVXkZkOCvuVuX
         jTlkrdvBfacXvvHiMnAaZZoOVjzeQZqhXLPEnD2Aqp7m6P8Gn3ha/nONain6FuU3ptFf
         wREw==
X-Forwarded-Encrypted: i=1; AJvYcCVU6wx1HzSlshXH1XxBWP6EnFFLEaTvKYu/jFYj4HdZnyoGYCuC6FDfFsWGGeUiy5lGxNPIaEKJzS/hrqbB@vger.kernel.org
X-Gm-Message-State: AOJu0YxpH+DYa0G0pXK7El1oI5qdSKCg/JX7VP16m347G+qnVQVDr9l0
	sCRh68n6dEkT+ty8X0ZkhD1xo+yJQHlMKXqZeX+RGOOyfXkiyG9/cBtiYitkIQ==
X-Gm-Gg: ASbGnct/2mc3a18ePjG+3UKXbzQOl6WlWNChksWKBjAc7Lww3KyXN+mX+3RHddJIth6
	BpHk4mt3nZnGMZO2wtvL2gWACZOo04qejMxq/gVYoIBql8pg3u/N6eF0ptuiHG8fiFVIsMDw2Bg
	kFPj5pONya1jj2NjUDNFSwtzRn7QQzwTYbikUdJGKS73fenOu9n24PjdKpG/NDdl5F91pBqkVvg
	4GugTqzJxhjviDsx9jHoMsm0nrflWel969O2IaqSAptpDTkVJirkClQv5iKWXvYjJ2SLA==
X-Google-Smtp-Source: AGHT+IH+M/FEAkpNMBwsDuc0tHC+2vhsJNCB0rHqv9S6uNwcV9QU3CRejLf5RORAk65H3gSk0WGJJw==
X-Received: by 2002:a05:6a20:6a20:b0:1e0:d99f:7ad3 with SMTP id adf61e73a8af0-1e5e084b3f5mr84746860637.44.1736072180793;
        Sun, 05 Jan 2025 02:16:20 -0800 (PST)
Received: from thinkpad ([117.193.213.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-91b56cb2e5dsm8762347a12.13.2025.01.05.02.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 02:16:20 -0800 (PST)
Date: Sun, 5 Jan 2025 15:46:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/21] arm64: dts: qcom: sm8250: Add PCIe bridge node
Message-ID: <20250105101612.t6c4pw5uxhb5rdde@thinkpad>
References: <20240321-pcie-qcom-bridge-dts-v2-1-1eb790c53e43@linaro.org>
 <20250103210531.GA3252@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250103210531.GA3252@bhelgaas>

Hi Bjorn,

On Fri, Jan 03, 2025 at 03:05:31PM -0600, Bjorn Helgaas wrote:
> On Thu, Mar 21, 2024 at 04:46:21PM +0530, Manivannan Sadhasivam wrote:
> > On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
> > for each controller instance. Hence, add a node to represent the bridge.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 39bd8f0eba1e..fe5485256b22 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -2203,6 +2203,16 @@ pcie0: pcie@1c00000 {
> >  			dma-coherent;
> >  
> >  			status = "disabled";
> > +
> > +			pcie@0 {
> > +				device_type = "pci";
> > +				reg = <0x0 0x0 0x0 0x0 0x0>;
> > +				bus-range = <0x01 0xff>;
> 
> Hi Mani, most or all of the patches in this series add this
> "bus-range" property.  IIUC, these are all Root Ports and hence the
> secondary/subordinate bus numbers should be programmable.
> 

Right. It is not a functional dependency.

> If that's the case, I don't think we need to include "bus-range" in DT
> for them, do we?
> 

We mostly include it to silence the below bindings check for the endpoint device
node:

Warning (pci_device_bus_num): /soc@0/pcie@1c00000/pcie@0/wifi@0: PCI bus number 1 out of range, expected (0 - 0)

DTC check is happy if the 'bus-range' property is absent in the bridge node. But
while validating the endpoint node (if defined), it currently relies on the
parent 'bus-range' property to verify the bus number provided in the endpoint
'reg' property.

I don't know else the check can verify the correctness of the endpoint bus
number. So deferring to Rob here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

