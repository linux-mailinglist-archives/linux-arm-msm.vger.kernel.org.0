Return-Path: <linux-arm-msm+bounces-47899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDCCA34030
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 14:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB3083A98AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 13:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A0423A9A7;
	Thu, 13 Feb 2025 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OpUD3bTQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3638623A980
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739452833; cv=none; b=rmBA9ez8Kwa3ynWC4+rLSXMvJoROZIBkFDZh9gXxUIABinhW4/e2DMGenuTgeC2IB3+ldapx6ENObi7hlEEI+ga08HlKaexmbw0NSeyXMGrvq8yyl8tmiWF8BpXKU6Y/kgweiUDGdFJWuBR2KafyQPx5gp1TxlplNIjGJEeTmLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739452833; c=relaxed/simple;
	bh=5mMVKySb8+gpzJOBAymm9Q7LjgPAm74RfF5CFTTcYUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwF9VSKgdhCkq/BAeiJQJ2ZqKpWrqC7KRUmpEbZqiIEDd4bdtU/fSfCNEyCOf9UPOz7CU6okywu4ab72F7bHSHGzL/zFUZ1QrEDb2lonPqt0Ra8TxwQNt8Awzyi2eEx9u6guRM2NEghtgS3DB1t14FptpmTXT9/7zq2PG3TOZFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OpUD3bTQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso6074485e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 05:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739452828; x=1740057628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CwLioipVK8naZwbwKxpHl8Exj/kHTAEgP/Hsr4XIrU4=;
        b=OpUD3bTQ3kRN85fqZamyvZOWeCkLAa9MZ/vGRhLsBViPwCcqFwS5ywWBYQzTMZ5XMP
         OJIWYcvaBJLNn00jyI1AbTHjxT7gDaL4sui+bZWlTMgp3lkkvaRbHWKbrsaUzr8Op6Gu
         uoQO/0y9Mk6vz3ClY2nevXd+WRv7alXVSRE9uFLPptS16fZIHIkiNmZsBJwBOd86DeDM
         gp5oUeXLX90eGLjgrtbyYfT4v3npmYXSxderwI2cbhzoj1SYZEeAW2zkSOlIwKuESkC9
         U6s8qE+gi4ay+v7WsG+EXcG3naZ2lb/4qlW03mDcOcqWz8VqvM7VAF7z7o6k2qVvVDMI
         gp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739452828; x=1740057628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwLioipVK8naZwbwKxpHl8Exj/kHTAEgP/Hsr4XIrU4=;
        b=FfpRSfJgP6INZCmTacSh1wE6Iu4/6PdrwiBQ0A8JqVvCraU7VKYsBKDjfeKO0LWsM7
         mwjSv1fAk0QK/04UNgfKyig+bo/2QoPO1IvD2+NMrvuWT1Oewl5nL3+41qiA58QTcCN6
         qhUwgI4k90J1QuOfTQEcmIhBjV09lum5kqx1G631drCXbxsNn58LwFeMdZi9z7ZuCrpz
         WP6dpVAx5UJTuj39dqJAEtJqQCH/Kve8/uI7Y9TEghLy6cNUqcMRmpxzMsxmHCxQPcpD
         fiD6RI/3nwpgk26LddQXqH3c8jqh4BFduBCBBHTpHfMgjW3/DW7MV+dAVd1RQzdtDMyl
         1Ylg==
X-Forwarded-Encrypted: i=1; AJvYcCXRU2ndfQZDDYAyzR30fQ+l6uJsI4xO7RE2ZdqErmBZrTTslCPOstqIEXMsCsJb9ecXSAgYZVwQIRKU3zyX@vger.kernel.org
X-Gm-Message-State: AOJu0YytD2vHr3RE0KAh78q5LwrUE2vg9BJXtJ8TEsSnVzqlyeTCwj7k
	a6ywD/uH8PHRIseDuTRD1bzIOQZuubDfilL39lMxUlk6M0EcyHCPAmGhwGA/jKs=
X-Gm-Gg: ASbGnctcLtsjNImWFJZ4RIjrot5/C/nkgTGbIVoyfkFsrYfPLcVIw+hDhcrhVnO52up
	4tM76fmEJiLP+/+gQ+wjaI+ObnTLzX9RFR7ErWRHi4aLm577zeKs8wbxjkr+7ISybdhBASA9Ynq
	4ujWQJl8Oy9wcf45I/f615e7hLI9N9BSn/pds3SitXNnZinDLGHVx2QMtxtGYwoS92gqydDLsd8
	cniVVOxvO8994RvjtWmkcXE2hXcjUPOGrU9PNY8LLwP7VAvkzmtuEQBLm3ONA0xMDawE1m7OYbz
	CvtwwjTwJbR8sTRxKGYSaBUjB7k=
X-Google-Smtp-Source: AGHT+IHa0iJhUdI7Oeca63Utadvd2nIPWbwBwu9HdjYNmDjYhPAnw2Ag6cr+5vfrRyb7rW16Cvn+DQ==
X-Received: by 2002:a05:6000:2aa:b0:38b:da31:3e3e with SMTP id ffacd0b85a97d-38dea28ccf8mr7582277f8f.28.1739452828283;
        Thu, 13 Feb 2025 05:20:28 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:5695:683f:dbf5:a2f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddbb2sm1858848f8f.40.2025.02.13.05.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:20:27 -0800 (PST)
Date: Thu, 13 Feb 2025 14:20:23 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add crypto engine
Message-ID: <Z63xl4_Lii0zBIYo@linaro.org>
References: <20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org>
 <Z63xEdcvCRHchHWu@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z63xEdcvCRHchHWu@linaro.org>

On Thu, Feb 13, 2025 at 02:18:09PM +0100, Stephan Gerhold wrote:
> On Thu, Feb 13, 2025 at 02:44:02PM +0200, Abel Vesa wrote:
> > On X Elite, there is a crypto engine IP block similar to ones found on
> > SM8x50 platforms.
> > 
> > Describe the crypto engine and its BAM.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 9d38436763432892ceef95daf0335d4cf446357c..5a2c5dd1dc2950b918af23c0939a112cbe47398b 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -3708,6 +3708,36 @@ pcie4_phy: phy@1c0e000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		cryptobam: dma-controller@1dc4000 {
> > +			compatible = "qcom,bam-v1.7.0";
> 
> Hm, I would expect this is at least "qcom,bam-v1.7.4", "qcom,bam-v1.7.0"
> given that this is a pretty recent SoC. I don't think this makes any
> functional difference though, and we don't seem to have it on other
> recent SoCs...
> 
> > +			reg = <0 0x01dc4000 0 0x28000>;
> > +
> > +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			#dma-cells = <1>;
> > +
> > +			iommus = <&apps_smmu 0x480 0>,
> > +				 <&apps_smmu 0x481 0>;
> 
> Should be same as <&apps_smmu 0x480 0x1> (0x1 is applied as mask to the
> SID, and 0x481 & ~0x1 = 0x480).
> 
> > +
> > +			qcom,ee = <0>;
> > +			qcom,controlled-remotely;
> 
> Please add "num-channels" and "qcom,num-ees". Otherwise you risk causing
> crashes if the interconnect listed below isn't up (anymore) when the
> driver probes the device. See:
> https://lore.kernel.org/linux-arm-msm/20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org/T/

Sorry, I meant:
https://lore.kernel.org/linux-arm-msm/20250212-bam-dma-fixes-v1-0-f560889e65d8@linaro.org/T/

Oops.
Stephan

