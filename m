Return-Path: <linux-arm-msm+bounces-34730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 610D49A20B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 13:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E41F31F2415F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FAE1DBB13;
	Thu, 17 Oct 2024 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fK9Ry1Nd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ABC1DB546
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729163528; cv=none; b=qb7IegBgGRsI7ivAX55Hl48+NonOOulxkN9NntKFutuR/jC54i3hJRUQ0rcatQRI2wXzm7kLpW9fhn7/v9U+fA7fzxc8yaNUFsC6fHNY7OLi49oq4q4wjKu8g+l17E39Zc0tHoYULxItjFfPV5koEoZyt3jcyH2SnzVuuwFfiW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729163528; c=relaxed/simple;
	bh=naS6qP0vKwEe1o6U7dAcb3z4jX5hBsDEpVWMdzrVJ+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1+LNH0PPCpId2/Hcw+F3kBstGknlAFPSwmlT72poxlzdZVii7Q2CDPe+cIOhWhJan6YvDeXLSaFt/vW2+XIC8061g9ZAirJ2IHjsiJeej3zoRdDVIETxiKnLdAB8dDwawzU3JwIdCGcx5uV9VPByTIMtOUOGS/+gjs0gIrEhd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fK9Ry1Nd; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso725146e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 04:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729163525; x=1729768325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I01kJoMcb3paKBSp+LkjL4WJ/SXZW2fawtH+MKsukNw=;
        b=fK9Ry1NdvN4vLKib8icBrqXdETUJT4rjil9rPv+IFPeBKpLVeOlZ6f06VxnOh2B3Yk
         j6WRzSEfemn+ZphkvL9gdkPV4aer399s3YA6CicvgTNB9rUFZUPjpJT26mcNuJr8pmM1
         Jqv4FmfxGrbN1AxnfyKTmfz1cim1pYV5c1xd1qHpo9KqJZTdOFTFil4L8Fdcy1Y7Loxe
         QKSxXoC934KsVpkvgt3i1dWgyOkrUt2Vps31jMfwlr7N3GKRbWMhJoMlPtX1tf+2bd5C
         K3M0o/u241nROvuJlRVo59wvW3UXLam8XjzskLg96RxwVM831zqZrgUGekKCS5b83zvQ
         oueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729163525; x=1729768325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I01kJoMcb3paKBSp+LkjL4WJ/SXZW2fawtH+MKsukNw=;
        b=FTKsaTd/AIS2Tmh/DkcWJWrKqMD/LEon1qLrkyfiDHskuiYXrZfiTtjQL4J4XlTKzt
         b2U08dHRSt21jfh6HAaMTgm8u7/dMrGAYM6U29nQyGcH03JbC45axALjrtoCIMqqBy+/
         jpj8djF44l4KD0mG1hATagj8400VpTffUEx5w0Oe+YBbtyn3rSU9LrUYBeHv2pzC+ASC
         3ybwjDHA5xjcsjlyZq34rw2LY15vidMVpcnCB86ee3RoYxZ6MgjJnK72ShQoBpdwfF2y
         8lhw9wm9Xn2/O20BbaD1I/gwltK82SyYcXT5as5ZU4+fiA65cm9KjOXguSFjcMrLpBxB
         ZsfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcyBPjjZDjlkgpMTh4RcSsl2w+tZKWtRiIYWMn9wy9JXf1J9rNxGaTWRa/ZeXgTn0GmvFWO3gAkIiImZPj@vger.kernel.org
X-Gm-Message-State: AOJu0YyKRoZ+mWg8nXPV/nPb/chyhjC8u+reyyH/I3LgFp2Ofq3PM/q0
	yOLcE/MH/siqtnBZ1FWM06/8YIYp4s3RfFrTSmDHtcCtdI8Mq2k06c6VGz21OLc=
X-Google-Smtp-Source: AGHT+IFiNFENRIQD9pOtFdyQhPcQV/5ezbByMZVYiVFSktA1gZgDzgrr0EeV3eQLQpEHVuZ2WzE1iw==
X-Received: by 2002:ac2:4c4c:0:b0:539:8e77:9129 with SMTP id 2adb3069b0e04-539da583e0fmr12041614e87.44.1729163524933;
        Thu, 17 Oct 2024 04:12:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffb1eb3sm746710e87.81.2024.10.17.04.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 04:12:03 -0700 (PDT)
Date: Thu, 17 Oct 2024 14:12:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com, 
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com, quic_parass@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add PCIe nodes
Message-ID: <qevhitaa47fd77jrrs4viv6mctkhedoz5jy33ruqvv62qrb44y@owzfxnxrapvf>
References: <20240209075716.GA12035@thinkpad>
 <CAA8EJppfzc_dM9c9mHPVWheVxi-1gJxCmaWPvreELijEQDDSyA@mail.gmail.com>
 <20241001101622.ys36slymgjbaz26q@thinkpad>
 <8459161B-87B8-481F-AE71-3D5156B1CA56@linaro.org>
 <20241001141948.g74rn6777ywvtcmx@thinkpad>
 <CFF89D4D-8131-47C2-95B8-A0E130A16E46@linaro.org>
 <9c24ba5d-431a-c45e-ce1c-3541eac7d017@quicinc.com>
 <20241012124334.4gsspgtuud4uudop@thinkpad>
 <7yzjgqitjvfwricftcpelktwjbgwkjuibwkpodjd6x4gwkjkw3@wkeqp6lqwfqv>
 <bbc900f7-eb8f-2664-2144-50a9a6ad8453@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbc900f7-eb8f-2664-2144-50a9a6ad8453@quicinc.com>

On Wed, Oct 16, 2024 at 10:43:19AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 10/14/2024 4:55 AM, Dmitry Baryshkov wrote:
> > On Sat, Oct 12, 2024 at 06:13:34PM +0530, Manivannan Sadhasivam wrote:
> > > On Fri, Oct 11, 2024 at 05:24:29PM +0530, Krishna Chaitanya Chundru wrote:
> > > 
> > > [...]
> > > 
> > > > > > The logic here is that the fixed endpoints in the switch will get an unique SID
> > > > > > and the devices getting attached to slots will share the same SID of the bus
> > > > > > (this is the usual case with all Qcom SoCs).
> > > > > > 
> > > > > > But I guess we would need 'iommu-map-mask' as well. Hope this addresses your
> > > > > > concern.
> > > > > 
> > > > > Yes, thank you!
> > > > > 
> > > > Hi dimitry & mani,
> > > > 
> > > > This particular board variant doesn't expose any open slots to connect
> > > > a different endpoints like another switch(which might have BDF unknown
> > > > to us) so static table should be fine for this board variant.
> > > > 
> > > > I tries to add iommu-map-mask property, the issue with that property is
> > > > that the driver is applying the mask to the bdf before searching for the
> > > > entry in the table. If I use a mask value which satisfies all the
> > > > entries in the table ( mask as 0x718) and if a new bdf is enumerated
> > > > lets say 0x600 due to mask 0x718 its value is again 0x600 only.
> > > > 
> > > > Can we skip iommu-map-mask property and use only static table for this
> > > > board as we know this board doesn't expose any open slots.
> > > > 
> > > 
> > > Hmm, I was not aware that it doesn't have open slots. Fine with me then.
> > 
> > It doesn't feature open slots, but it has two PCIe connections on HS2 /
> > HS3. Users might attach external PCIe devices.
> > 
> > Krishna, could you please clarify, how those two connections are routed?
> > 
> For this qps615 board to one of the downstream port (pcie to usb) usb
> hub is connected and to the other downstream port NVMe will be
> connected.

The board has two PCIe links routed to the HS2 and HS3 connectors. Are
they routed to the PCIe switch?

Yes, they are not standard slots, but still the board is expandable and
it is possible to connect external PCIe devices. As such it is not
possible to have static SID mapping.

-- 
With best wishes
Dmitry

