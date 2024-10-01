Return-Path: <linux-arm-msm+bounces-32862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FF198B917
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 944E2B23646
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 10:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E208A1A0AE0;
	Tue,  1 Oct 2024 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v56ybqSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEF719F430
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727777791; cv=none; b=eNbJH2PuevnuxbtVYVZKIiy0Bpw/dDqtSa4YY8ViaMPrllceI2rKDSX1IzzYMfmPs1vcPwd7KounXkEv6pgeLHR59/QRu4oGXXwbvFrm75OPwt3oWcMJVJ0ztOyS9pFG7az8TNhYDRtPHPMh/HwuCIXozRvYyUqnUWkjxVVQqy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727777791; c=relaxed/simple;
	bh=SLtTu3IL6LDgby4y+6PpF+5CxE4Cp3ifpTj6cEABEYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QG2v7AIO4UWLW8WcRjBHqni7mWA+hrXbjtlks2OV9pm2gB3STEceYh7MihCeAiGuUe5iYBGiH7iJl1s4C/wD3ZMVchJbfofT0BwQ2aEaEEugscxCaFiru+uBOZQGkr3L8Y1kUrBAvg6ytenlZUEbDCwxV/APoCs8mGGfZZS7S+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v56ybqSL; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso3937847a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 03:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727777789; x=1728382589; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7xJfFb9OXfKCKyEf8rku/AUF7m8DFvn5lEQLXOiYm1s=;
        b=v56ybqSLpQL1RMBM3c2QOataNzX/HsLQBY8FeNTnLtSxywxO9mwcfTbCMeVV54qeea
         cbMBD7Mfa5+YGow+M/3ImltyoPdLbUQA6LwF8Mus6noU1rlHasI1sGsnnzYh5ALX6/y+
         k85DQiZ7CC+eZgdMYiX27h+0PNjLba0QzEd+Cfar81EZp5h1PPxKWuFLyjgoHpTLEOhi
         I7vY0kgaEgRRLnrRTZZ3xCtUYS1Ba787ZXdKlY6WZq7xjt3WPqGCQ71nqMEWU98KXb9i
         3xtNozkEZy4K6jILKvK8RvFczdx8NjOruUkqzLcyQB9WUMkkfKtR0If18pOwlchD2wtr
         AszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727777789; x=1728382589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7xJfFb9OXfKCKyEf8rku/AUF7m8DFvn5lEQLXOiYm1s=;
        b=e2y9G4ujOcb3lB/f9rMxgn1zQXzicrNKD65+59h4a/BTySqr28bUBiCfs7bIH/WDQP
         lzKcr54vip8YrSZxXzhF5bVXEtCaz+bzzu8YujAUp2Ehctu9p//FJK1SgEzKW/Fybjra
         7LDHWPmXoLrfl/hjkNNSFPvaNgjZv8rKCSfggcG6mkZKnKmC45/aX4M7kMWFE/nw8E4n
         EBgykX0yF4mjdPjrPEy/e+AfSL/+ykJh2lpjZq0cKuO9icM21I6neBdYkqmkznPQ1AhN
         9QPj5a8+se4Z9nA892dpH4FzZ+RK53YSGOReGdwK4AwNLP4hxBOhC3r61qsQCoFzEF9x
         SlCg==
X-Forwarded-Encrypted: i=1; AJvYcCU2yfjp/LQpjYogM5+0YPHKcTwRAbtppysska9q2/VpwUo/XBQMreDTz5kZGolK/g9yTUYjWnOR0+rIawFy@vger.kernel.org
X-Gm-Message-State: AOJu0YyQYVKEtcX1VaUzLn2Q7po9ooEYeJauMNbkwgxBMvxch7MHi39v
	ShkF/+rjLJOCa9CCw1yQv3F9Ku37ZV8sVzS1rvh7e6JmuTT99mD342nuebk5Og==
X-Google-Smtp-Source: AGHT+IG906Y5WrfPvkSFRlwSRimFFyhVffR8lxQBd4ADp4oyVjxHKJ6izFGXe7OZDAtkNUW7jX74EA==
X-Received: by 2002:a05:6a21:164e:b0:1bd:2214:e92f with SMTP id adf61e73a8af0-1d4fa6a173emr20544864637.14.1727777789459;
        Tue, 01 Oct 2024 03:16:29 -0700 (PDT)
Received: from thinkpad ([36.255.17.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2b2f73sm7965180a12.25.2024.10.01.03.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 03:16:29 -0700 (PDT)
Date: Tue, 1 Oct 2024 15:46:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
	quic_parass@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add PCIe nodes
Message-ID: <20241001101622.ys36slymgjbaz26q@thinkpad>
References: <20240207-enable_pcie-v1-1-b684afa6371c@quicinc.com>
 <CAA8EJpqjm_2aE+7BtMkFUdet11q7v_jyHbUEpiDHSBSnzhndYA@mail.gmail.com>
 <dec2976e-6e1e-6121-e175-210377ff6925@quicinc.com>
 <CAA8EJprsm5Tw=vFpmfEKL8fxS-S+aW+YR0byfyL=v78k75TGEw@mail.gmail.com>
 <3ad77846-b4a8-80ee-e9e1-d5cbf4add6d8@quicinc.com>
 <CAA8EJprRF0tVFZK9c=MT8bSRcBdRvcugBaeEzpX5-wfRyNgc3Q@mail.gmail.com>
 <c8be2bbf-a51c-a38f-6e6f-a88801f953d5@quicinc.com>
 <20240209075716.GA12035@thinkpad>
 <CAA8EJppfzc_dM9c9mHPVWheVxi-1gJxCmaWPvreELijEQDDSyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJppfzc_dM9c9mHPVWheVxi-1gJxCmaWPvreELijEQDDSyA@mail.gmail.com>

On Fri, Feb 09, 2024 at 12:56:18PM +0200, Dmitry Baryshkov wrote:
> On Fri, 9 Feb 2024 at 09:57, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Fri, Feb 09, 2024 at 12:58:15PM +0530, Krishna Chaitanya Chundru wrote:
> > >
> > >
> > > On 2/8/2024 8:49 PM, Dmitry Baryshkov wrote:
> > > > On Thu, 8 Feb 2024 at 16:58, Krishna Chaitanya Chundru
> > > > <quic_krichai@quicinc.com> wrote:
> > > > > On 2/8/2024 12:21 PM, Dmitry Baryshkov wrote:
> > > > > > On Thu, 8 Feb 2024 at 08:14, Krishna Chaitanya Chundru
> > > > > > <quic_krichai@quicinc.com> wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On 2/7/2024 5:17 PM, Dmitry Baryshkov wrote:
> > > > > > > > On Wed, 7 Feb 2024 at 12:42, Krishna chaitanya chundru
> > > > > > > > <quic_krichai@quicinc.com> wrote:
> > > > > > > > >
> > > > > > > > > Enable PCIe1 controller and its corresponding PHY nodes on
> > > > > > > > > qcs6490-rb3g2 platform.
> > > > > > > > >
> > > > > > > > > PCIe switch is connected to PCIe1, PCIe switch has multiple endpoints
> > > > > > > > > connected. For each endpoint a unique BDF will be assigned and should
> > > > > > > > > assign unique smmu id. So for each BDF add smmu id.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > > > > > > > > ---
> > > > > > > > >     arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 42 ++++++++++++++++++++++++++++
> > > > > > > > >     1 file changed, 42 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > > > > > > > index 8bb7d13d85f6..0082a3399453 100644
> > > > > > > > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > > > > > > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > > > > > > > @@ -413,6 +413,32 @@ vreg_bob_3p296: bob {
> > > > > > > > >            };
> > > > > > > > >     };
> > > > > > > > >
> > > > > > > > > +&pcie1 {
> > > > > > > > > +       perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > > > > > > > > +
> > > > > > > > > +       pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
> > > > > > > > > +       pinctrl-names = "default";
> > > > > > > > > +
> > > > > > > > > +       iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
> > > > > > > > > +                   <0x100 &apps_smmu 0x1c81 0x1>,
> > > > > > > > > +                   <0x208 &apps_smmu 0x1c84 0x1>,
> > > > > > > > > +                   <0x210 &apps_smmu 0x1c85 0x1>,
> > > > > > > > > +                   <0x218 &apps_smmu 0x1c86 0x1>,
> > > > > > > > > +                   <0x300 &apps_smmu 0x1c87 0x1>,
> > > > > > > > > +                   <0x400 &apps_smmu 0x1c88 0x1>,
> > > > > > > > > +                   <0x500 &apps_smmu 0x1c89 0x1>,
> > > > > > > > > +                   <0x501 &apps_smmu 0x1c90 0x1>;
> > > > > > > >
> > > > > > > > Is the iommu-map really board specific?
> > > > > > > >
> > > > > > > The iommu-map for PCIe varies if PCIe switch is connected.
> > > > > > > For this platform a PCIe switch is connected and for that reason
> > > > > > > we need to define additional smmu ID's for each BDF.
> > > > > > >
> > > > > > > For that reason we defined here as these ID's are applicable only
> > > > > > > for this board.
> > > > > >
> > > > > > So, these IDs are the same for all boards, just being unused on
> > > > > > devices which have no bridges / switches connected to this PCIe host.
> > > > > > If this is correct, please move them to sc7280.dtsi.
> > > > > >
> > > > > Yes ID's will be same for all boards. we can move them sc7280.dtsi
> > > > > but the BDF to smmu mapping will be specific to this board only.
> > > > > if there is some other PCIe switch with different configuration is
> > > > > connected to different board of same variant in future again these
> > > > > mapping needs to updated.
> > > >
> > > > Could you possibly clarify this? Are they assigned one at a time
> > > > manually? Or is it somehow handled by the board's TZ code, which
> > > > assigns them sequentially to the known endpoints? And is it done via
> > > > probing the link or via some static configuration?
> > >
> > > There is no assignment of SID's in TZ for PCIe.
> > > PCIe controller has BDF to SID mapping table which we need to
> > > program with the iommu map table.
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-qcom.c?h=v6.8-rc3#n997
> > >
> > > Based upon switch the BDF to SID table will change for example I had two
> > > switches with one switch has 2 PCIe ports and other has 3 ports one
> > > embedded port which supports multiple functions.
> > >
> > > For the first switch the BDF's are
> > >       - 0x000(root complex),
> > >       - 0x100(USP),
> > >       - 0x208(DSP 0),
> > >       - 0x210(DSP 1),
> > >       - 0x300(endpoint connected to DSP 0),
> > >       - 0x400( endpoint connected to DSP 1).
> > >
> > > For 2nd switch the BDF's are
> > >       - 0x000(root complex),
> > >       - 0x100(USP),
> > >       - 0x208(embeeded DSP 0),
> > >       - 0x210(DSP 1),
> > >       - 0x218 (DSP 2),
> > >       - 0x300(embedded endpoint function 0),
> > >       - 0x301 (embedded endpoint function 1)
> > >       - 0x400( endpoint connected to DSP 1)
> > >       - 0x500(endpoint connected to DSP2).
> > >
> > > For these two switches we need different BDF to SID table so for that
> > > reason we are keeping iommu map here as this is specific to this board.
> > >
> >
> > I don't understand why the SID table has to change between PCIe devices. The SID
> > mapping should be part of the SoC dtsi, where a single SID would be defined for
> > the devices under a bus. And all the devices under the bus have to use the same
> > SID.
> 
> This sounds like a sane default, indeed. Nevertheless, I see a point
> in having per-device-SID assignment. This increases isolation and can
> potentially prevent security issues. However in such case SID
> assignment should be handled in some automagic way. In other words,
> there must be no need to duplicate the topology of the PCIe bus in the
> iommu-maps property.
> 

Agree with you on this. This is what I suggested some time back to have the
logic in the SMMU/PCIe drivers to assign SIDs dynamically. Unfortunately, it is
not a trivial work and it requires a broader discussion with the community.

Also starting with SMMUv3, there are practically no limitations in SIDs and
each device should get a unique SID by default.

So I got convinced that we can have these static mappings in the DT *atm* for
non SMMUv3 based hardwares and at the same time let the discussion happen with
the community. But this static mapping solution is just an interim one and won't
scale if more devices are added to the topology.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

