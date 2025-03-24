Return-Path: <linux-arm-msm+bounces-52274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D551A6D521
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41D6716768E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A67C2512FC;
	Mon, 24 Mar 2025 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7uVciqr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABF02512FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801599; cv=none; b=GVske0gJqAjr1cOEHkt1iex9pg+LcgrmP10SCxh+JGzkjf0HxRQ/yo9V8Z1mcIBdTOx02rPhHz6mnR5gePK1vRQtcZlYImsrb+6Sc4d/hZyBqmS4Pu88EvvkPuSpLyxO8d8O7RuxqqCwhcq+pmNDd+e4xHBCYlkP/hAl3ezmFHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801599; c=relaxed/simple;
	bh=jT54+7vbNtsjaag3PTO/tL+vnml0tPdd42vmeI3F9AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaY0QxC1A0UtkaX/9VimNIu0z/NaS6mDlYavzlq0Bldt3l8JJ6JQyjmXTGPD/CXCZ6hKjPo94G95c0kDm/tDJCNhjRTvzFuD0pTR1LwKPJyR2uTMJkujU9PLhCvBOAut9eJCGcQzRdEEp3s/PBzWBs2iB6QVOMKsdxlM7EUTedE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X7uVciqr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2254e0b4b79so60956135ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742801595; x=1743406395; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=blHdPfqvckcDqL+CzNJyNVyPgWhN37kCBIwjaKypN3g=;
        b=X7uVciqrJRnRXm6B4XXndCz7Modbtlm1X5z8JXHwab/EMQ45z07dVnKhzOVi6gZC7Q
         +V+qP3+VM2/9YSF6St+M6TJg6+jA6fRaEiS1ihRXPo2HHEuFhYzRo/sjlje2wtXrPxiE
         amcTnPJPEgeIrIWQuq/lb9fiylJsm5vcXkdVBJr+Eec5uaVPyHAjmUf7oPA43UdS/Fvf
         /Fkx0Pc3jzFVr3nJ3yVyChnBTezMbinKAbtMlX34WebgY66XrbnbmWZpx0wxZGal6dCn
         2wEsFY+AmTBXPoPyQqg3vk0Q38hYp0S1rTxKkweFGcUMO8Twp9F5DBm79YXRWLkOOZdD
         evvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742801595; x=1743406395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=blHdPfqvckcDqL+CzNJyNVyPgWhN37kCBIwjaKypN3g=;
        b=pjQJl11zXfhJPiDfirj05AxhIkqdXO9CN+H17w22p3XweY0HjisGtAmM1og7hEJO0/
         96QwJe2FI7vhnGxT78fZgqIpA91x+qyXbrY+lqj5oOR7fR/nIihWWviGZLHxMiW4gr9n
         rLHECcdlZYkJNiZ0A+LY1JtEcWC6CmLUYAI8m6PdJ3fHDDpRxs1dOtDEuStZt+/+DF69
         qqF0uZXktqoZLTE9ec3a9Ui8SARBRK+Ba1BeYWV6lXnS0eus1cvuR/CRXN4zzuaHIzyn
         g5AGhfBZX0n/Yl91dcaFLEOzbqtsqJ/ZjK+vdATmvPds45kXzbnu6DcIXHBrVpBCdoln
         6C/A==
X-Gm-Message-State: AOJu0YzbVr5JK6CBw5V6pAwof7Gj6myVzSaRO8o3u4EWtcaLj4fPv2mO
	uhv1ri+yiSAJUC64jW7IU4oiRFU/tVdyoBrJaA8D9QECWD85VvwoH0+m+ynNrQ==
X-Gm-Gg: ASbGncul/enHE2qAmM/SwpB0H6rcnhETA2yZvibdOISDByDCdrFTOTDO0/0MfwOPnEM
	0PxkR3MRfDv3pI+ZXUA27J24eI9yWibWS9UpvSUc2x5DBYUAD/nFWQxg1OPIGMSw6m90XaZtBR+
	jRkln0Pj7Y34NhJEGjADhb6Wfo2mjRQZPyb984k5OsYHC2ctuKlJguM+t2F7kPlz2wZr3bEYotD
	konq3vDOnQT7wrM9gutLgKL1aiESKkJZIia9je3OczLcY3tyHggZuWNicaqPLrcge4I4NQ3kiNi
	/+shkG3y/McvVlXYPsnCHtg4f49Tm93KHNJ0jMU2yIFIcB4tjKJbNeDAFzJxHMJRcx0=
X-Google-Smtp-Source: AGHT+IGdaxHUvNgtq8nt2eMj0NE21L4bvrlhTf8k4RnWCzYdr1Rh6FUOr8cwZ5bcmco+xvo3j8Ftiw==
X-Received: by 2002:a17:902:d549:b0:224:a96:e39 with SMTP id d9443c01a7336-22780c55343mr200013175ad.9.1742801595360;
        Mon, 24 Mar 2025 00:33:15 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811d9eb4sm63872155ad.164.2025.03.24.00.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:33:14 -0700 (PDT)
Date: Mon, 24 Mar 2025 13:03:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: quic_srichara@quicinc.com, quic_nsekar@quicinc.com, 
	George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, andersson@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dmitry.baryshkov@linaro.org, kishon@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	kw@linux.com, lpieralisi@kernel.org, p.zabel@pengutronix.de, robh@kernel.org, 
	robimarko@gmail.com, vkoul@kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: ipq5018: Add PCIe related nodes
Message-ID: <f3o6lv4jb2ze4cnoywjseh2fhoquqc6fkgtbqbz4jfh4u5kqyy@wuixplqzlhue>
References: <20250305134239.2236590-1-george.moussalem@outlook.com>
 <DS7PR19MB8883E4A90C8AFF66BCAE14F49DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>
 <20250318071756.uilfhwfzgr5gds3o@thinkpad>
 <DS7PR19MB88838C8F5959955CB4AE14959DDE2@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS7PR19MB88838C8F5959955CB4AE14959DDE2@DS7PR19MB8883.namprd19.prod.outlook.com>

On Tue, Mar 18, 2025 at 01:41:19PM +0400, George Moussalem wrote:
> 
> 
> On 3/18/25 11:17, Manivannan Sadhasivam wrote:
> > On Wed, Mar 05, 2025 at 05:41:30PM +0400, George Moussalem wrote:
> > > From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > > 
> > > From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> > > 
> > > Add phy and controller nodes for a 2-lane Gen2 and
> > > a 1-lane Gen2 PCIe bus. IPQ5018 has 8 MSI SPI interrupts and
> > > one global interrupt.
> > > 
> > > Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> > > Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> > > Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/ipq5018.dtsi | 232 +++++++++++++++++++++++++-
> > >   1 file changed, 230 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> > > index 8914f2ef0bc4..301a044bdf6d 100644
> > > --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> > > @@ -147,6 +147,234 @@ usbphy0: phy@5b000 {
> > >   			status = "disabled";
> > >   		};
> > > +		pcie1: pcie@78000 {
> > > +			compatible = "qcom,pcie-ipq5018";
> > > +			reg = <0x00078000 0x3000>,
> > > +			      <0x80000000 0xf1d>,
> > > +			      <0x80000f20 0xa8>,
> > > +			      <0x80001000 0x1000>,
> > > +			      <0x80100000 0x1000>;
> > > +			reg-names = "parf",
> > > +				    "dbi",
> > > +				    "elbi",
> > > +				    "atu",
> > > +				    "config";
> > > +			device_type = "pci";
> > > +			linux,pci-domain = <0>;
> > > +			bus-range = <0x00 0xff>;
> > > +			num-lanes = <1>;
> > > +			max-link-speed = <2>;
> > 
> > Why do you want to limit link speed?
> 
> This was originally sent my qcom. I've just tested with and without.
> Without limiting link speed, the phy doesn't come up:
> 
> [    0.112017] qcom-pcie a0000000.pcie: host bridge /soc@0/pcie@a0000000
> ranges:
> [    0.112116] qcom-pcie a0000000.pcie:       IO 0x00a0200000..0x00a02fffff
> -> 0x00a0200000
> [    0.112161] qcom-pcie a0000000.pcie:      MEM 0x00a0300000..0x00b02fffff
> -> 0x00a0300000
> [    0.238623] qcom-pcie a0000000.pcie: iATU: unroll T, 8 ob, 8 ib, align
> 4K, limit 1024G
> ...
> [    1.257290] qcom-pcie a0000000.pcie: Phy link never came up
> 

Wow. This should never happen unless the PHY sequences are messed up. If there
are stability issues with Gen 3, we should get runtime AER errors and the link
should atleast come up (based on experience with similar issues on other
platforms).

Sricharan/Nitheesh, may I know what is the issue here?

> > 
> > > +			#address-cells = <3>;
> > > +			#size-cells = <2>;
> > > +
> > > +			phys = <&pcie1_phy>;
> > > +			phy-names ="pciephy";
> > > +
> > > +			ranges = <0x81000000 0 0x80200000 0x80200000 0 0x00100000>,	/* I/O */
> > > +				 <0x82000000 0 0x80300000 0x80300000 0 0x10000000>;	/* MEM */
> > 
> > These ranges are wrong. Please check with other DT files.
> > 
> 
> Thanks, have corrected them as part of next version:
> 
> ranges = <0x01000000 0 0x80200000 0x80200000 0 0x00100000>,
> 	 <0x02000000 0 0x80300000 0x80300000 0 0x10000000>;
> 
> > Same comments to other instance as well.
> 
> and:
> 
> ranges = <0x01000000 0 0xa0200000 0xa0200000 0 0x00100000>,
> 	 <0x02000000 0 0xa0300000 0xa0300000 0 0x10000000>;
> 

LGTM.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

