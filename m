Return-Path: <linux-arm-msm+bounces-4777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B688134D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 16:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 860531C20C0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 15:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B070A41776;
	Thu, 14 Dec 2023 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWC9kpaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A63115
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 07:33:57 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a1d93da3eb7so957509466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 07:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702568036; x=1703172836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rcNFHsvsaISwcnJ44Tj/kSFoKPbKk6xV4s4VLMajfFs=;
        b=qWC9kpazK5N7TSfBDoB003CGguNo09f+g/ssJy3Tla7YhjJXVdtAnCfbMjIoYW/Ugc
         pzc+gqXvZbFfHXGcZQWkWkXjHMx3OvlHgiHWOrmYxrY9fUkfpDL4vQ74j12ZBTXEr4TI
         wKJ73segD/79cJuJupYuTpUwCyJbDAd8Fmn5YmHK6Jb+R5a9luXVQx4lqO5jz8t+Md1s
         i5ucvNWYST+WQFovbvdtXm2/T2VN95gYK8xlzsyvZuvg5LOHE+b7wRB4EF0he2FlIwqQ
         1it8PqWuPMJh/FNoean/qJD4cXEPTlnOLd4Dwd+ygiOtfBCZgSGfiQ9qQlhBmDwRzDc8
         fjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702568036; x=1703172836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcNFHsvsaISwcnJ44Tj/kSFoKPbKk6xV4s4VLMajfFs=;
        b=azPWvuOhOxPJlgfsvVP7mR2RlbZXK+tbOZoLpEjCKUnD4GUr6gOcrIPhui4NtY7rmJ
         CCmNjoNb2rQcYOJSFQr+X4ny66n9Y12tTicMkd6e0Bn6rRVfNueXVFhUGawLeYUjmBzO
         LFYCmgT5xoF68iq4An1qMWyGQNgVfqTNaX3zhuQmF5E1lRONjdqveYVYZmXeZKR9iKQt
         /lwS3D1d1zjnxpBICk2ZueVTORRCy9NYtQnwh95UFz34YsTdnuf2yEyCIML0vnKnhebF
         iza0jLU0Y2ODIGGOlO1qN0dSGlzxNi18NIwanZhZWuaJfeDPJLoXaIGsMfJL7Om4ym/k
         vF8g==
X-Gm-Message-State: AOJu0Yw9tB26S68CnWFqLrp0MVQEB2SnUHcWx9HxsG5cRkg62mPH/YPw
	0D42qnhS6Gln3uE2Ql8P4f+JIQ==
X-Google-Smtp-Source: AGHT+IHpCzuG3dSo9YnxxO1fHrPwtpgEirEfzFvfJfdjbeZ42lGaFJZmYbQg9L5a+MCECUIKSy7vjQ==
X-Received: by 2002:a17:906:690:b0:a19:a1ba:8ceb with SMTP id u16-20020a170906069000b00a19a1ba8cebmr4191517ejb.137.1702568036071;
        Thu, 14 Dec 2023 07:33:56 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id fb4-20020a1709073a0400b00a1c76114fcesm9526650ejc.218.2023.12.14.07.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:33:55 -0800 (PST)
Date: Thu, 14 Dec 2023 17:33:54 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100: Add all missing nodes
Message-ID: <ZXsgYl2h+MnTIz7D@linaro.org>
References: <20231212-x1e80100-dts-missing-nodes-v1-0-1472efec2b08@linaro.org>
 <20231212-x1e80100-dts-missing-nodes-v1-1-1472efec2b08@linaro.org>
 <9c8e887b-429c-4226-9851-5f1cbb93524a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c8e887b-429c-4226-9851-5f1cbb93524a@linaro.org>

On 23-12-12 17:21:19, Konrad Dybcio wrote:
> 
> 
> On 12/12/23 11:24, Abel Vesa wrote:
> > Add all missing nodes which describe entire X1E80100 platform.
> "all" doesn't really mean all :|
> 

Well, all the nodes where we have support working (for now).

But I'll re-word it to say "add some missing nodes".

> couple of patch-wide observations below
> 
> [...]
> 
> > +		gpucc: clock-controller@3d90000 {
> > +			compatible = "qcom,x1e80100-gpucc";
> > +			reg = <0 0x3d90000 0 0xa000>;
> Please make sure the address part is padded to 8 hex digits

Will do.

> [...]
> 
> > +		usb_1_ss2_hsphy: phy@fde000 {
> > +			compatible = "qcom,x1e80100-snps-eusb2-phy",
> > +				     "qcom,sm8550-snps-eusb2-phy";
> > +			reg = <0x0 0x0fde000 0x0 0x154>;
> and please choose 0x0 vs 0 and stick to one (which seems to
> be 0 in this file)

I'll use 0x0 in all reg as I think this is more consistent.

> 
> [...]
> 
> > +		pcie6a: pci@1bf8000 {
> > +			device_type = "pci";
> > +			compatible = "qcom,pcie-x1e80100";
> > +			reg = <0x0 0x01bf8000 0x0 0x3000>,
> > +			      <0x0 0x70000000 0x0 0xf1d>,
> > +			      <0x0 0x70000f20 0x0 0xa8>,
> > +			      <0x0 0x70001000 0x0 0x1000>,
> > +			      <0x0 0x70100000 0x0 0x100000>;
> > +			reg-names = "parf", "dbi", "elbi", "atu", "config";
> one per line, please

Will do.

> 
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> > +				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0x3d00000>;
> > +			bus-range = <0x00 0xff>;
> > +
> > +			dma-coherent;
> > +
> > +			linux,pci-domain = <7>;
> > +			num-lanes = <2>;
> > +
> > +			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "msi";
> > +
> > +			#interrupt-cells = <1>;
> > +			interrupt-map-mask = <0 0 0 0x7>;
> > +			interrupt-map = <0 0 0 1 &intc 0 0 0 843 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> > +					<0 0 0 2 &intc 0 0 0 844 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> > +					<0 0 0 3 &intc 0 0 0 845 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> > +					<0 0 0 4 &intc 0 0 0 772 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
> you can drop these comments

Will do.

> [...]
> 
> > +				clocks = <&gcc GCC_DISP_AHB_CLK>,
> > +					 <&gcc GCC_DISP_HF_AXI_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > +				clock-names = "bus",
> > +					      "nrt_bus",
> > +					      "iface",
> > +					      "lut",
> > +					      "core",
> > +					      "vsync";
> you probably should list the ROT clock here too

Will look into it.

> [...]
> 
> > +		cpucp_mbox: mailbox@18830000 {
> > +			compatible = "qcom,x1e80100-cpucp-mbox", "qcom,cpucp-mbox";
> This is not upstream

It's a new driver, so bindings patches will come with it.

> 
> > +			reg = <0 0x18830000 0 0x300>, <0 0x17430000 0 0x4C08>;
> lowercase hex

Will do.

> 
> Konrad

