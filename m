Return-Path: <linux-arm-msm+bounces-51223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5573CA5EB5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 06:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D9F51898441
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 05:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000CA1F9F73;
	Thu, 13 Mar 2025 05:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dcvXTkZK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4409F80604
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 05:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741845426; cv=none; b=NvDMfo8EP316PDh6bhOnglU4kqD9eMQK2rbqT+HhmsyTSpVePtm4GaBNw9bYFZc4S1CoWtFKaZMnd4VDMewpGG9mcfhxOzg6aXD+scHZt4qO5s1wt1uy3t/KKy3Ps/FVMI1k5Q/XwQgqZL4zva2jbsntlhwaFMr7S1nJDHmoJyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741845426; c=relaxed/simple;
	bh=F4KVeeG/vfL6d+LN7wLEC48P+h1mm/VpKDoXwyHPxJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjoUKtrmAKbC6aLMCSlk4O3u3QTcchaUVALFgelB6CFgs/tFFJC0y/UnTTvwKdbKtXs6aE2JHeCrK0TNQBTkklmWUgAUIJVVPublsscRncV2Oov9UNZx+ewT4q46f1kA5+xIzXNuqG5tx2CSjeeUubDiTwC9ws9tRu6Kp2BTPzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dcvXTkZK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22398e09e39so10503425ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 22:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741845424; x=1742450224; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VHoBJbaXxWZBoHH4orsV607HNQCFDV6U6o2TbMEjzlk=;
        b=dcvXTkZK9v5l9ypIejk+MBRh1iZznuNKEgidR/wPk7J35xXlSy8ecmAJUT3HDZ4nak
         MAmaWBrPlcthMyexK7r7v5kz3C5IH4sOXON0k20mzItTWuYMF6Q1V64mHtwkvmIDBItL
         IjwWVIoc67shieH4iDrwXEn8qh6nL94S/5gvHe3LOsTR7qQbDUj0LyLG3rkxGMIhRdON
         KG6bJMVnt87wVrmTwtEvqCdIfqnRoF4GV1u3g3EGl43slydGfAV2KKFjCNdHZIP/WB//
         oEwDlPNiJ2qfwE8oD7mrpUNsUqE9qo3LOhxSA8qgiziGcg5bDgAAvp4kUzmAp5OPp4+n
         dgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741845424; x=1742450224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHoBJbaXxWZBoHH4orsV607HNQCFDV6U6o2TbMEjzlk=;
        b=jCXJ0brHK4c6lcFrmWlWSgrLc8T1X++zwewH0jg7AQ4117oQJnMJ1k/TDTWg7FxdjI
         cTURQTv94U01ACxjSQ4AsUH4k+RnOtQyple2Q24STuzZxOcpW3sLTPzDFhHyJeB7XIwR
         ZVrl4R16LBL9LXOD1zS6Y17BvzjNd2vbtxtVuNg9ZYd4pbN3Rgbuaowqh0cn+SmkofRk
         aMSUao9o9KUN9DxalPj4hiQ+ARj99ABK8FTJ9EG3Cp/CrcylPt1fmHzQFiQUbnbTbQ3o
         yl+E7kpiVW3q8U987XdMxOEMQE4wKW73j/ae4/BHJaFxgl/saCK/4c8tSCmkhAPfdzCJ
         TqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtSULGfnPnd4TlCsPg8kVFOUnNWCRnFOpY/BoqIWxPIOMuS4lPnRO6q9N1YBJcq31HEdVKLbQ6UyUaFooY@vger.kernel.org
X-Gm-Message-State: AOJu0YwBk04lZT90HnXeqa/1kClcnYOhCxxVJghIcuy9/SwpyNd84i/z
	ave66vkyBRPL4xS40G0dBjAOBrOnKeguFmbQfuiU4k69T31oSJ1SOOb+MzGgwQ==
X-Gm-Gg: ASbGncvpDwgkgAoWENVxdMJDR+y4zExumqUU/jlYKX/ZKOi9JVHoIgDdrJVBrTrrTPR
	ZPd6m9ldj+M/2ewp2WO+yYyHAWB01JK2b7GlRPMC7vheFBCSn8lWO6vNk93GUsp2IALLGcDGeSP
	IJYljcZ4dLU5ND19w/DXGsZKp+xWCU5QC54g7S1vk1meHHtyCxcxmWhpAjttKuBh4KUeorBD4dr
	SbHskOjwaQokmwRSX255gNZses5rP0p90+ANkrepB+O7dasQRntorresxwbRErClIpk2ofAiK5/
	e0kvcP6IQwnW70k2uTIF/cyxZ1vFcuplgMhpwO7RolYL1YYrC4psbg==
X-Google-Smtp-Source: AGHT+IHiW5BfoY5YHVExATQIPB58ttIl6IxR42gqC9h8+1Se6XOAkH59TkpxwTZSBoe4vBqiS4Z8Ug==
X-Received: by 2002:a17:902:d48f:b0:224:2715:bf44 with SMTP id d9443c01a7336-22428a96909mr390296795ad.19.1741845424487;
        Wed, 12 Mar 2025 22:57:04 -0700 (PDT)
Received: from thinkpad ([120.60.60.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4a4bsm5340475ad.216.2025.03.12.22.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 22:57:04 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:26:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	chaitanya chundru <quic_krichai@quicinc.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>, quic_vbadigan@quicnic.com,
	jorge.ramirez@oss.qualcomm.com, cros-qcom-dts-watchers@chromium.org,
	linux-pci@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, amitk@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v4 01/10] dt-bindings: PCI: Add binding for Toshiba
 TC956x PCIe switch
Message-ID: <20250313055657.ddrzqo2edx46az7b@thinkpad>
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-1-e08633a7bdf8@oss.qualcomm.com>
 <174048982895.1892984.13694169241426640158.robh@kernel.org>
 <f718ae90-237c-634a-111d-05f2f0240db9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f718ae90-237c-634a-111d-05f2f0240db9@oss.qualcomm.com>

On Fri, Feb 28, 2025 at 04:26:23AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 2/25/2025 6:53 PM, Rob Herring (Arm) wrote:
> > 
> > On Tue, 25 Feb 2025 15:03:58 +0530, Krishna Chaitanya Chundru wrote:
> > > From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > > 
> > > Add a device tree binding for the Toshiba TC956x PCIe switch, which
> > > provides an Ethernet MAC integrated to the 3rd downstream port and two
> > > downstream PCIe ports.
> > > 
> > > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > > Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> > > ---
> > >   .../devicetree/bindings/pci/toshiba,tc956x.yaml    | 178 +++++++++++++++++++++
> > >   1 file changed, 178 insertions(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Warning: Duplicate compatible "pciclass,0604" found in schemas matching "$id":
> > 	http://devicetree.org/schemas/pci/toshiba,tc956x.yaml#
> > 	http://devicetree.org/schemas/pci/pci-pci-bridge.yaml#
> Hi Rob,
> 
> As we want to refernce pci-pci-bridge.yaml which is expecting compatible
> as "pciclass,0604", we modified the compatible as "pci1179,0623",
> "pciclass,0604". Now adding pciclass0604 is giving this warning. can you
> suggest correct way to represent this.
> 

I think the PCI-PCI bridge compatible should be part of the actual bridge nodes
inside the switch. I still stand by my view that the bridge compatible doesn't
make sense for the top level switch node as this switch is a sort of MFD.

So you should do:

	pcie@0,0 {
		compatible = "pci1179,0623";
		reg = <0x10000 0x0 0x0 0x0 0x0>;
		...

		pcie@1,0 {
			compatible = "pciclass,0604";
			reg = <0x20800 0x0 0x0 0x0 0x0>;
			...
		};
	};


- Mani

-- 
மணிவண்ணன் சதாசிவம்

