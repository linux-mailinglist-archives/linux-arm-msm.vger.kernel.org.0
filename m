Return-Path: <linux-arm-msm+bounces-40122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 045A69E2638
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 17:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C921216F073
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 16:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA391F890E;
	Tue,  3 Dec 2024 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AsHK7qQn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22B1F76CA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 16:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733241917; cv=none; b=be0B7qewiNILOZ4/9UfILE1hB1Z2alyh0MOl+1osC/4Bh+X3yxg6CJ4xUiGz5ZBnjAdlVqtov3Ioo93RE2XHfXUgsqexQ/4RCHszCmD/4u6qjFDhVJ8l+FAbhccyBmMeTuZUM/kjLo5A29WfDJruG/TL6ehfoLSmfEve0VW9NrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733241917; c=relaxed/simple;
	bh=RO/Jb2M7y1tZFvigE1wfDszAl2TeNoGpjZONNpYNo5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gx4cA9E1gTiOeCwUnuJqXk1Goo1pk4Me5tTiGU0GlKQWKZJMhDUs5txp95RSWDqSFGsjYdkviR/AuP11OpbACdA8IxRT+aqhOll+wDTI0sWOdiiH3Q3ipNa3GFjkSYNjuIYjpdbmVYh6h4rwZeYcJOMPPJNhfv3ibUkuANFXHxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AsHK7qQn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a742481aso46892065e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 08:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733241913; x=1733846713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RbkegQEjWqxbEPHewAWlZuLvIFMHjFQ/a1uprEJuQrc=;
        b=AsHK7qQnglG4FakmPhVui0oCTfGjRiGXxhak7oUzaPK77chmr09ETOzoBYVJrg3/fr
         adA1B8p1FfehNbAN+k9UrZ47C6rtR2s+X6OI4rY/w2gxi9ycFgKHHQ0dCxLVpZZ67gQ8
         JQr0cxvqjwNosIErjmaLnoBBJ8EldsV8St8TV2MRdPEY1PDfJ8291O5tzxVH/MNnsoBI
         ObLDWcYrShR4g8L7gbgOYZnttouFiqMFnUjLyj0R9EpCRC34kt1XuAariKNRr82KiGVA
         aMrXHMCwEYqefQeW+5EOYrfqVUsQUixrTZoFYHUu2h41ObFzUCE6JYrwmGXnm7WgMWWk
         OTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733241913; x=1733846713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbkegQEjWqxbEPHewAWlZuLvIFMHjFQ/a1uprEJuQrc=;
        b=WUFMnCZRRe9R59mM8f5N3koLPWW+GpLfW6nOiZvPzIyzq8DW+XCItr+9cPCP7EMdKv
         7yGvvxy1KNiiwUi2/xljdapvhaptcqSoLdQln03HCWOAa/U0BYmB57XuWIRnt8tnizWP
         kfWLgptsPpjusAmxP9k7irAurQCbdvAZ9uL/AabFtKvgUP4carLg1r6yHQ4Grx63bHSG
         GY4lYIOyDHPJLYGZENtspCfkkuruoact/Xbb2Ymun9SRd3j7tNWLJ6MaieMAG0CEHRkw
         1fiXUkVlQxF7RP1m+On2lAKxW+IFXbbugV3bb/zr+AuB9aFXzjJrTfmSoRoeDFCdaH+C
         Gaew==
X-Forwarded-Encrypted: i=1; AJvYcCVmiELtIuMcdXpxn57FShG9ZuevBJL4juf2ktzC4+zJg5/9VJE0TBs68nxOJr/lcu6t5qaHvdDOTwtSk/vV@vger.kernel.org
X-Gm-Message-State: AOJu0YxwOFXPULWLW3lsaZa0ZbKT8eZY2t/cjCXMqQvpszdXRv5SHta/
	1ZBmN0HiL91Synk0fIq/od903Yec6DckfdzB/JghuGpQ5AF4lDHNQ2ds6Ug9mCM=
X-Gm-Gg: ASbGncu/emMHlMkpcV5pAz38n+SLXnIBfVawAzuuMN0F9+tCmnFdEl0upsqIHyaERNd
	CMUBx9Y+uhFTOGEaiXN7X9TnopHVJPfPq4RyUWve/sUHwJZbN0PZC1zjroOwEnuGzf9RBV0fNTs
	ZR62nesEd1OG9HUKomrczd0fDJiVRXAypBkMrPRCFu/Q43UT/ldfw+QtCjFob0AHS8ilEKMljOD
	6EbqeOaB3qW2PT1fzGtNrv5lsJnPxNAxwNfCaUSdgfF50dNtEp275Dt0kigyg==
X-Google-Smtp-Source: AGHT+IFBeGxc9ewKOyLt6K1s6+sAqOV/yQmsHZjqJ5HZW1/QpKIblYPp2E3dP2IzrA43ijCRwjHlqQ==
X-Received: by 2002:a05:600c:4708:b0:434:a555:d0d with SMTP id 5b1f17b1804b1-434d0a15333mr27229125e9.29.1733241913233;
        Tue, 03 Dec 2024 08:05:13 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:41ad:5703:2486:8f59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa74f05asm224377395e9.1.2024.12.03.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 08:05:12 -0800 (PST)
Date: Tue, 3 Dec 2024 17:05:06 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint readery
Message-ID: <Z08sMkbLF0b1DZTp@linaro.org>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <Z07r3Upr50vLluyn@linaro.org>
 <41106fd7-5348-4d21-9ae7-8466f5634b4c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41106fd7-5348-4d21-9ae7-8466f5634b4c@oss.qualcomm.com>

On Tue, Dec 03, 2024 at 09:07:22PM +0530, Krishna Kurapati wrote:
> On 12/3/2024 5:00 PM, Stephan Gerhold wrote:
> > On Tue, Dec 03, 2024 at 11:20:48AM +0100, Johan Hovold wrote:
> > > [ +CC: Krishna, Thinh and the USB list ]
> > > 
> > > On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
> > > > The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
> > > > multiport controller on eUSB6. All other ports (including USB super-speed
> > > > pins) are unused.
> > > > 
> > > > Set it up in the device tree together with the NXP PTN3222 repeater.
> > > > 
> > > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
> > > >   1 file changed, 48 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > > index 39f9d9cdc10d..44942931c18f 100644
> > > > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > > @@ -735,6 +735,26 @@ keyboard@3a {
> > > > [...]
> > > > @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
> > > >   &usb_1_ss2_qmpphy_out {
> > > >   	remote-endpoint = <&pmic_glink_ss2_ss_in>;
> > > >   };
> > > > +
> > > > +&usb_mp {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&usb_mp_dwc3 {
> > > > +	/* Limit to USB 2.0 and single port */
> > > > +	maximum-speed = "high-speed";
> > > > +	phys = <&usb_mp_hsphy1>;
> > > > +	phy-names = "usb2-1";
> > > > +};
> > > 
> > > The dwc3 driver determines (and acts on) the number of ports based on
> > > the port interrupts in DT and controller capabilities.
> > > 
> > > I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
> > > that would still be there in the SoC (possibly initialised by the boot
> > > firmware).
> > > 
> > > I had a local patch to enable the multiport controller (for the suspend
> > > work) and I realise that you'd currently need to specify a repeater also
> > > for the HS PHY which does not have one, but that should be possible to
> > > fix somehow.
> > > 
> > 
> > I think there are two separate questions here:
> > 
> >   1. Should we (or do we even need to) enable unused PHYs?
> >   2. Do we need to power off unused PHYs left enabled by the firmware?
> > 
> > For (1), I'm not not sure if there is a technical reason that requires
> > us to. And given that PHYs typically consume quite a bit of power, I'm
> > not sure if we should. Perhaps it's not worth spending effort on this
> > minor optimization now, but then the device tree would ideally still
> > tell us which PHYs are actually used (for future optimizations).
> > 
> > For (2), yes, we probably need to. But my impression so far is that this
> > might be a larger problem that we need to handle on the SoC level. I
> > have seen some firmware versions that blindly power up all USB
> > controllers, even completely unused ones. Ideally we would power down
> > unused components during startup and then leave them off.
> > 
> 
> This question might be a dumb one, if so please ignore it.
> 
> But if we skip adding unused phys in DTS node, the core driver wouldn't have
> access to all phys and we wouldn't be able to get references to unused ones
> (un-mentioned ones in DTS). So how can we power them off from core driver if
> we don't have reference to them ?
> 

The question is not dumb at all, it's a very valid one. :-)

Perhaps it's easier if we keep them all listed on the USB controllers
and have something else to mark them as unused. The downside of that
option is that we might not be able to have a complete description of
the PHY with all resources. For example on the CRD there is no eUSB
repeater we could model for the first USB port (usb2-0), but it's needed
to enable the qcom,x1e80100-snps-eusb2-phy.

Thanks,
Stephan

