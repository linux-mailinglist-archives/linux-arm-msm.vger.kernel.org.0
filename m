Return-Path: <linux-arm-msm+bounces-32442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 383C89854CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 09:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 695AE1C2111E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 07:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290C0158851;
	Wed, 25 Sep 2024 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bbqV20Nu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EDE158557
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251145; cv=none; b=DEw2jqmiv7v70iOW5sudaUpT8oBTUkzgZPaUarAcYPywgAfLdYv2WR5s2nn+Oi5lj/gc2FPg+ZxJMq9y+Hp3dMsfTgO4VAkSBSXNKK4L8yTgyP0osQRv/N+NswTU02EOko7leabKNFXllBJvNfjMksLrtkiAV3F9Zu3MpHp0FPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251145; c=relaxed/simple;
	bh=Hc+LCHMm4RDQ9GTVn7gf8E/cTxLuUSUoH4rgKkOqOT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/6wIGwujUeo/fhjUi4Xw8k9VqilZfkL5IBsTid5pEVa3HV9vnyWIuFO6HeD5zSGIlg2oGk391I65TtTMxCUdHhxu2Xj/gbFQNAVW7Y6AEiSTK8L9wFWBqENDHr8EeXNgvihVFZFCphCg+xz6OHteQOfOJwAhYQ4tPadtC48NJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bbqV20Nu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cb60aff1eso63865035e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 00:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727251141; x=1727855941; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bapYHrGCRxq+5Z8fPQWisdRvflJnfm7FCmo91yCvTzg=;
        b=bbqV20Nu4WOcVFoCgpRpACsANHDTTYiD4uCkkknliQaNFvKMuajE+2rrUs7qGaa7Le
         LPCn/VPkRXg2ywwEsby6gWnq27hXh8I+8FLFIJ29X3bgc9vmOd2+lX9VZM3cRDv4avhp
         IO5e50GbLxAO3ZCIsmTGO/zQFDn1x7LbQjBDeAIMpD0Vxm7Wr7OJ09WMybfxeOsrg8nZ
         zQ5iHUpcRGTV7Z2ouCtV6A7ynVnoBYh35ftbOAXy44EbhWDzP4LL4356iRWLq+ARX9jI
         fQaDvwr6HvR2r/kyWADPVr8fS8fWO7OLH2Yk7PBqoBvkmLQUFu/MowTWXID+rLu4K6/r
         GBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251141; x=1727855941;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bapYHrGCRxq+5Z8fPQWisdRvflJnfm7FCmo91yCvTzg=;
        b=FimhBRTs7iWcZhpAq0TqkJS7PYteKwa/iN0XmV/8DK6cFzC8gbp46kgzxZFQzHVits
         SA2xeTT44fDj57MkU0rZJCBb4GC6cYZxczSd+Ti62DDC97hBufrmfQN0DCeUAOKlJdeX
         DoyQh7/CZ8xpinuIumCip9Rg/SsxV6nOdqNBb0+J42pyyt3IfeRvb6vl/jkdH2UecSf+
         nFnKqsAjUfCAk4jSGy2uMa3w46/vlo1vM7tpUcZZWGPvqVn1228OZp1hwFgI73QWq3ng
         LkxOkPZMmpPPi2Op0SZYdpOyMZ06NDg8yfwtlY3VhTTI86anTf5CULnrsw3y9+fZTkGa
         e8gw==
X-Forwarded-Encrypted: i=1; AJvYcCUh9i6vE6CUo09VNZ23qP9zH6etTXa2KH/3igqSN+VXEzfN1eM6R2AkX2bmts+DbrWNGt5rwLeq7N7q//M2@vger.kernel.org
X-Gm-Message-State: AOJu0YzR7rwE7QcWz8MWVh4q2LYaJAuCQmujlek4TnfkiqtIMI1Yq2H3
	5BN/J5AT9IiI27ADynHyN6wxFME7CFYbE+7SPCVCIlHrZLr4b2lVO98YV9JdXg==
X-Google-Smtp-Source: AGHT+IG3djtkgvDwFjL5SMyfW3qLoXY0CLRwpTQ//e0lJY1MODc0J/w7hgvsNBnFokru+vE1owYtFw==
X-Received: by 2002:adf:f886:0:b0:371:8cc3:3995 with SMTP id ffacd0b85a97d-37cc24847f5mr1254992f8f.34.1727251141533;
        Wed, 25 Sep 2024 00:59:01 -0700 (PDT)
Received: from thinkpad ([80.66.138.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc31f77esm3313206f8f.108.2024.09.25.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:59:01 -0700 (PDT)
Date: Wed, 25 Sep 2024 09:58:59 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, vkoul@kernel.org, kishon@kernel.org,
	robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, abel.vesa@linaro.org, quic_msarkar@quicinc.com,
	quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org,
	kw@linux.com, lpieralisi@kernel.org, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: x1e80100: Add support for PCIe3
 on x1e80100
Message-ID: <20240925075859.4vbb4faaworc6eyz@thinkpad>
References: <20240924101444.3933828-1-quic_qianyu@quicinc.com>
 <20240924101444.3933828-7-quic_qianyu@quicinc.com>
 <ZvLQFSjwR-TvHbm_@hovoldconsulting.com>
 <ee32742d-9daf-4bff-948b-cf2e705bc73f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee32742d-9daf-4bff-948b-cf2e705bc73f@quicinc.com>

On Wed, Sep 25, 2024 at 02:37:41PM +0800, Qiang Yu wrote:
> 
> On 9/24/2024 10:43 PM, Johan Hovold wrote:
> > On Tue, Sep 24, 2024 at 03:14:44AM -0700, Qiang Yu wrote:
> > > Describe PCIe3 controller and PHY. Also add required system resources like
> > > regulators, clocks, interrupts and registers configuration for PCIe3.
> > > @@ -2907,6 +2907,208 @@ mmss_noc: interconnect@1780000 {
> > >   			#interconnect-cells = <2>;
> > >   		};
> > > +		pcie3: pcie@1bd0000 {
> > > +			device_type = "pci";
> > > +			compatible = "qcom,pcie-x1e80100";
> > > +			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 836 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 671 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "msi0",
> > > +					  "msi1",
> > > +					  "msi2",
> > > +					  "msi3",
> > > +					  "msi4",
> > > +					  "msi5",
> > > +					  "msi6",
> > > +					  "msi7",
> > > +					  "global";
> > This ninth "global" interrupt is not described by the bindings, which
> > would also need to be updated. What is it used for?
> 
> As of now, the global interrupts is mainly used to get link up event so
> that the device driver can enumerate the PCIe endpoint devices without
> user intervention. You can refer to
> https://lore.kernel.org/linux-pci/20240828-pci-qcom-hotplug-v4-11-263a385fbbcb@linaro.org.
> 
> I see this global interrupts has been documented in qcom,pcie-sm8450.yaml.
> Do I need to move it to qcom,pcie-common.yaml?
> 

No, you need to describe it in qcom,pcie-x1e80100.yaml.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

