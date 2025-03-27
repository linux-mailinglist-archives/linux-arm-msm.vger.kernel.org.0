Return-Path: <linux-arm-msm+bounces-52678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD0FA73A5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 18:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 237B93B7155
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 17:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178F820FAA3;
	Thu, 27 Mar 2025 17:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UlOy3VtR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0FC1DFF8
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743096504; cv=none; b=U2mQHpKAghTr16QKRG4dW02BHejXXjd2bFYW+mkZMzGmNQ4YCgYzw1Xpk4BdbEYwc+bH5Y3iegjo8aB/M/qEQQHNL7rj+va7W5T60mQAEjAqVv1V3w8zgQhEl1D+jf0vQ4QNBK6JdxJ3LMDFpgUl58Kn/RQw0/SpHRuHHL/hUQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743096504; c=relaxed/simple;
	bh=Qu9BXW/WwRM5yK5XxhdUNBkjNGAO4qF8Uc7STA72aI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntZ/m1uitLNciprmr+OIF3kIovjWXvooQmoxTzPOWBqYOorkjieuP4z9BLXJVVR6DTgCFrSAsVaBtegKTDiamT2i/eKyxhGYhfsLXiBJUUKQ+6TB+Oa8EzBvx19ZrJK0HZkxSfHpKYl0nXOyNCdjHQaR0K9iQ38El0mNiQC0qTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UlOy3VtR; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso1510326a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 10:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743096502; x=1743701302; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QHz+SaPSWGp6wDaJlC8xVhuyDfBVETPMBB/j6NeLduE=;
        b=UlOy3VtRdiJBYBJLZfrqQIq+QLBvKwwUyappCBIhqq0SCzawfKZOPMLuHRZ/tTKEdW
         G452LwrWyLe9/QQM9tyFXoSh1JRAeIuwF8PKiaLmP1pJj5bi3jh1Fa+XKnS8gqlFKWEN
         Bu+n5KtTehKfrj1ShpgvOzB4mWrzGcexUNphZ09how6igLeXnJp6ZvR/eUCeJcH84xUu
         HPT0FMHxe9rT7SpHYXZFCoyYF80UNrusu9aWJN7m5xC8ZG5xkj2KTIaTI4dynZNhULk8
         LRwXgH+cfLupw0+TIZ+UcwDY9jgbnrmpySX+2y0+7fYggUN0FfhGRVfmoc5qrvNOcipW
         RAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743096502; x=1743701302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHz+SaPSWGp6wDaJlC8xVhuyDfBVETPMBB/j6NeLduE=;
        b=IrfVfvyNLanKXlAuk8N7i0Wi7/rqJuQMaxBsKjhn20T4h+L7g3JSRqHvJv6U0kp3Oz
         yxNnPglPYmBNp9M53WK8LCZ63HheygaN3LByZZSFa0iuZPReMtdrGgyD+xAZ+s1XlNBf
         9cHKfzj/JMk7tBomshsCntdiUs822SJJKcUbpf9gnS78OQfRLjx3m6eFWBvj+XGM65KX
         ozjNoO7YMqMX9orbo7J3B+QYbjtQ86zvxBPvGk2vMAbfCTXhrCZF1AVckaNkdPCc29Tl
         O3uqpkui1gzrVTVzeWYb3ThL6Mp2gMNc4SYEENLVhrVIxAvlov8wHIpThCxZl3/W2ic4
         jdfA==
X-Forwarded-Encrypted: i=1; AJvYcCU/ZHCIru4X5+EXNakMwSKnV7uTeMx7p+KDhJzdP2Jqz+14Bd7wMwZFL5UIDqPiIUl9XEK8+kEP9aIAlJSW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5SPeDhksjYQEicA8rytxGYiTdi6sD5d20y8tE5+9aUAMfBo5y
	nmYNNZfxobvoUuA308K5KK+BGm+2RXS3INlRYwisGUFvYCtysmLm5YxTNNmXWg==
X-Gm-Gg: ASbGncuQXEvxwP0CNXuCTxPAzqqhMsU2hMHcJPQEc6V38o7UxKetPF1/ei5pC1U79cW
	gcWTYZj53SSQd5a9nEitEOdwhzEh3aLWGHX/FV/F/m1SuleEECHRNz9X64q6/SuL0X6FJLIajJH
	0VKv1q9T0364LWQTFyBvdR+NAxeO7Zh15+vg+nZNuApAQIepHziH3/h9eAqXp/rCX9m+MT7ljSi
	r0qb0NEoWQRCBQXDYn+ZAPVWuUIZA0OXXLYjo7yg8q/Vu5tVAAIJBNQDjnf/9/ilhRGDXphp+fQ
	Fk7PmSkfBZwyKSGqudZDdiGX24KFK1VqBE88pS2yGSbK9XPA58zYAck=
X-Google-Smtp-Source: AGHT+IGqtCOWQs3SNQd1ccGYnNeLv3HOIj7c/1mVjG4p0xNEN7WwDgh3wSqvsol2pDFN1HxLXEZyGA==
X-Received: by 2002:a17:90b:520a:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-303a7d6629emr8930210a91.12.1743096501527;
        Thu, 27 Mar 2025 10:28:21 -0700 (PDT)
Received: from thinkpad ([120.60.71.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d3e132sm172524a91.4.2025.03.27.10.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 10:28:21 -0700 (PDT)
Date: Thu, 27 Mar 2025 22:58:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Praveenkumar I <quic_ipkumar@quicinc.com>
Cc: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	20250317100029.881286-2-quic_varada@quicinc.com, Sricharan R <quic_srichara@quicinc.com>
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: ipq5018: Add PCIe related nodes
Message-ID: <vgohpbmbhghooeb6byur2wx535sa7tdmtsu5orgzr26hnaw2yg@aibeo3gqiztn>
References: <20250321-ipq5018-pcie-v6-0-b7d659a76205@outlook.com>
 <20250321-ipq5018-pcie-v6-5-b7d659a76205@outlook.com>
 <a4n3w62bg6x2iux4z7enu3po56hr5pcavjfmvtzdcwv2w4ptrr@ssvfdrltfg5y>
 <6fa2bd30-762b-4a3a-b94f-8798c027764a@quicinc.com>
 <ycv74l5nop5mptj6uobuacffnwho2gvznh4dhxagupt5gh6x4k@vgik7ouydy6f>
 <988510be-ee5f-49c9-a5a4-074c51245f95@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <988510be-ee5f-49c9-a5a4-074c51245f95@quicinc.com>

On Wed, Mar 26, 2025 at 01:11:35PM +0530, Praveenkumar I wrote:
> 
> 
> On 3/25/2025 10:23 PM, Manivannan Sadhasivam wrote:
> > On Mon, Mar 24, 2025 at 04:48:34PM +0530, Praveenkumar I wrote:
> > > 
> > > On 3/24/2025 1:26 PM, Manivannan Sadhasivam wrote:
> > > > On Fri, Mar 21, 2025 at 04:14:43PM +0400, George Moussalem via B4 Relay wrote:
> > > > > From: Nitheesh Sekar<quic_nsekar@quicinc.com>
> > > > > 
> > > > > Add phy and controller nodes for a 2-lane Gen2 and
> > > > Controller is Gen 3 capable but you are limiting it to Gen 2.
> > > > 
> > > > > a 1-lane Gen2 PCIe bus. IPQ5018 has 8 MSI SPI interrupts and
> > > > > one global interrupt.
> > > > > 
> > > > > Signed-off-by: Nitheesh Sekar<quic_nsekar@quicinc.com>
> > > > > Signed-off-by: Sricharan R<quic_srichara@quicinc.com>
> > > > > Signed-off-by: George Moussalem<george.moussalem@outlook.com>
> > > > One comment below. With that addressed,
> > > > 
> > > > Reviewed-by: Manivannan Sadhasivam<manivannan.sadhasivam@linaro.org>
> > > > 
> > > > > ---
> > > > >    arch/arm64/boot/dts/qcom/ipq5018.dtsi | 234 +++++++++++++++++++++++++++++++++-
> > > > >    1 file changed, 232 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> > > > > index 8914f2ef0bc4..d08034b57e80 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> > > > > @@ -147,6 +147,40 @@ usbphy0: phy@5b000 {
> > > > >    			status = "disabled";
> > > > >    		};
> > > > > +		pcie1_phy: phy@7e000{
> > > > > +			compatible = "qcom,ipq5018-uniphy-pcie-phy";
> > > > > +			reg = <0x0007e000 0x800>;
> > > > > +
> > > > > +			clocks = <&gcc GCC_PCIE1_PIPE_CLK>;
> > > > > +
> > > > > +			resets = <&gcc GCC_PCIE1_PHY_BCR>,
> > > > > +				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
> > > > > +
> > > > > +			#clock-cells = <0>;
> > > > > +			#phy-cells = <0>;
> > > > > +
> > > > > +			num-lanes = <1>;
> > > > > +
> > > > > +			status = "disabled";
> > > > > +		};
> > > > > +
> > > > > +		pcie0_phy: phy@86000{
> > > > > +			compatible = "qcom,ipq5018-uniphy-pcie-phy";
> > > > > +			reg = <0x00086000 0x800>;
> > > > > +
> > > > > +			clocks = <&gcc GCC_PCIE0_PIPE_CLK>;
> > > > > +
> > > > > +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
> > > > > +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
> > > > > +
> > > > > +			#clock-cells = <0>;
> > > > > +			#phy-cells = <0>;
> > > > > +
> > > > > +			num-lanes = <2>;
> > > > > +
> > > > > +			status = "disabled";
> > > > > +		};
> > > > > +
> > > > >    		tlmm: pinctrl@1000000 {
> > > > >    			compatible = "qcom,ipq5018-tlmm";
> > > > >    			reg = <0x01000000 0x300000>;
> > > > > @@ -170,8 +204,8 @@ gcc: clock-controller@1800000 {
> > > > >    			reg = <0x01800000 0x80000>;
> > > > >    			clocks = <&xo_board_clk>,
> > > > >    				 <&sleep_clk>,
> > > > > -				 <0>,
> > > > > -				 <0>,
> > > > > +				 <&pcie0_phy>,
> > > > > +				 <&pcie1_phy>,
> > > > >    				 <0>,
> > > > >    				 <0>,
> > > > >    				 <0>,
> > > > > @@ -387,6 +421,202 @@ frame@b128000 {
> > > > >    				status = "disabled";
> > > > >    			};
> > > > >    		};
> > > > > +
> > > > > +		pcie1: pcie@80000000 {
> > > > > +			compatible = "qcom,pcie-ipq5018";
> > > > > +			reg = <0x80000000 0xf1d>,
> > > > > +			      <0x80000f20 0xa8>,
> > > > > +			      <0x80001000 0x1000>,
> > > > > +			      <0x00078000 0x3000>,
> > > > > +			      <0x80100000 0x1000>,
> > > > > +			      <0x0007b000 0x1000>;
> > > > > +			reg-names = "dbi",
> > > > > +				    "elbi",
> > > > > +				    "atu",
> > > > > +				    "parf",
> > > > > +				    "config",
> > > > > +				    "mhi";
> > > > > +			device_type = "pci";
> > > > > +			linux,pci-domain = <0>;
> > > > > +			bus-range = <0x00 0xff>;
> > > > > +			num-lanes = <1>;
> > > > > +			max-link-speed = <2>;
> > > > This still needs some justification. If Qcom folks didn't reply, atleast move
> > > > this to board dts with a comment saying that the link is not coming up with
> > > > Gen3.
> > > > 
> > > > - Mani
> > > The IPQ5018 PCIe controller can support Gen3, but the PCIe phy is limited
> > > Gen2 and does not supported Gen3.
> > Hmm, so if a Gen 3 capable device is connected, the link will not work at Gen 2?
> > It seems so from the error that George shared previously.
> No, that is not the case. The link will work with a Gen3 capable device at
> Gen2 speed. The failure log shared by George indicates a PHY failure, which
> is due to IPQ5018 PHY's hardware limitation.

It doesn't matter. If a Gen 3 device is not going to work with the controller +
phy combo, then it is a host hardware limitation. But I'm OK with adding a
comment and limiting the controller link speed.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

