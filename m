Return-Path: <linux-arm-msm+bounces-32891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBE98BFCE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 16:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D1CBB2303A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3401C1733;
	Tue,  1 Oct 2024 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rgUws4PE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9611C68B3
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792399; cv=none; b=u1SeiSFBKACg4M/Up3zgRwDSRnsn6FENB8CjyyaII8uoUWJEjqzQeSXzEGP29R0M66PfiBCANPpZL6UivJws0sbRemxwepBRW2+bpBFwyt3vPcx5F++1UsUlm3drxiG7j0T9m+f0LBlKa4vH+bTFbDb+FQrrybvUercmo1i2j3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792399; c=relaxed/simple;
	bh=0j0otd4ZuE9J8az8jJhKFC8t4rN6fcBXQCAZ4L7L93U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlES7rxMofdcBvNiVu57L1NhqneJOJh8NY9J127ud8t1ycPAIh9eonAHx9WkxTP978lb9hF25oOHLIqlTiCqLRMJJKyY3YiubFyTMNnByyvD5Elr4KTfmvNipzc47It04XOid9IR9ZWKdc39TNLcPIBfBYvS3WoCjJXSYvq16wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rgUws4PE; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7193010d386so4821607b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 07:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727792396; x=1728397196; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P1YHhaz6+QmTIrweJ6E1y4T2za0kncePjIVBaI8Z1F4=;
        b=rgUws4PEo6ylwdo7hIHjWSbXxMFd6Ashwy9oyggOztLr+a6CVo9f9NMQy+Tu6CY3Xc
         aCHGIQXtbid8qMqrvH+xawlrROUNCIEMX/GAeUdIuKGV+XZ0tcFp9vgpaoNkGeBiQw6G
         XNA+UbCvUZBn3oJoSzK6JaaA5Gt4RO/TttAU0IDOamITZkR8k+jbLaA2owq7GRozzeWD
         Kf3aMwLqzfiwTWSBRUSPsL89w0k+Y5dV/vzLicUlCVkVXvcNR/e/bSxM5FO+O2+fH2ko
         Cdwm/bzMeHNnZcCNHsXqChGGv+u1cJZo8j6jGxl7eZReSo2qySMWGn2l8tnM0y7daEUS
         2kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792396; x=1728397196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1YHhaz6+QmTIrweJ6E1y4T2za0kncePjIVBaI8Z1F4=;
        b=fRjfoTImj1NUNR1USbwa6sYE98rwPlfW9CRkm+VCVtBqyASAD1MCfNmKzQHBGKD6NO
         qoeXqY6jq5D934T1uk/U/crBJdy3rfJVhqFnk0rikGNKphKNbG8fzEf/zNwL6ow4rcUM
         NwVrL/uLQeelK3AYoJvIRxEUfQmgALkNouc/nfSTwAxIuQXAmTyEgFzQa8bUgXLW8Lz3
         MXg59DAnrm44VGCJpLDtgKTkGnQyVxIkq4ZO3CysnIOrXwPOfX8CeVlkbUYdYZbCiHCK
         8l8rx2Y+puZPEFAhH0JoE+f3leBcZbaOLZmVhsfxifS+JE5x7hgGH/fkyBOqokMEqE6S
         46ug==
X-Forwarded-Encrypted: i=1; AJvYcCVV88ZlyEwdp01E71XvF2otdtk+e8qlwCUMoEQDJcvC4MjrRnFnOWQ9iAjBflscVesvU2P+S/3B5jiSae9d@vger.kernel.org
X-Gm-Message-State: AOJu0YyBxeHnCbU02CmxT35c/QqS1B3RCX60I7foRIe/paQeeWWTB7EI
	1NwsV+e9SZK01LM2KQJ60qhg7oXl6HdTkrN0mG+72Mq/CgvLvE+Iv5PYhrOz7Q==
X-Google-Smtp-Source: AGHT+IF3u72kyuSo6/UZmzXCFlC9e0m2jfJu4wtHlIIS9YROhqcpLf3oHlYo+VGLv0WQyOvpi5acgw==
X-Received: by 2002:a05:6a21:390:b0:1d3:292a:2f7c with SMTP id adf61e73a8af0-1d4fa7ab370mr24192484637.49.1727792396474;
        Tue, 01 Oct 2024 07:19:56 -0700 (PDT)
Received: from thinkpad ([36.255.17.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264bc3f7sm8100789b3a.77.2024.10.01.07.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:19:56 -0700 (PDT)
Date: Tue, 1 Oct 2024 19:49:48 +0530
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
Message-ID: <20241001141948.g74rn6777ywvtcmx@thinkpad>
References: <CAA8EJpqjm_2aE+7BtMkFUdet11q7v_jyHbUEpiDHSBSnzhndYA@mail.gmail.com>
 <dec2976e-6e1e-6121-e175-210377ff6925@quicinc.com>
 <CAA8EJprsm5Tw=vFpmfEKL8fxS-S+aW+YR0byfyL=v78k75TGEw@mail.gmail.com>
 <3ad77846-b4a8-80ee-e9e1-d5cbf4add6d8@quicinc.com>
 <CAA8EJprRF0tVFZK9c=MT8bSRcBdRvcugBaeEzpX5-wfRyNgc3Q@mail.gmail.com>
 <c8be2bbf-a51c-a38f-6e6f-a88801f953d5@quicinc.com>
 <20240209075716.GA12035@thinkpad>
 <CAA8EJppfzc_dM9c9mHPVWheVxi-1gJxCmaWPvreELijEQDDSyA@mail.gmail.com>
 <20241001101622.ys36slymgjbaz26q@thinkpad>
 <8459161B-87B8-481F-AE71-3D5156B1CA56@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8459161B-87B8-481F-AE71-3D5156B1CA56@linaro.org>

On Tue, Oct 01, 2024 at 03:30:14PM +0300, Dmitry Baryshkov wrote:
> On October 1, 2024 1:16:22 PM GMT+03:00, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> >On Fri, Feb 09, 2024 at 12:56:18PM +0200, Dmitry Baryshkov wrote:
> >> On Fri, 9 Feb 2024 at 09:57, Manivannan Sadhasivam
> >> <manivannan.sadhasivam@linaro.org> wrote:
> >> >
> >> > On Fri, Feb 09, 2024 at 12:58:15PM +0530, Krishna Chaitanya Chundru wrote:
> >> > >
> >> > >
> >> > > On 2/8/2024 8:49 PM, Dmitry Baryshkov wrote:
> >> > > > On Thu, 8 Feb 2024 at 16:58, Krishna Chaitanya Chundru
> >> > > > <quic_krichai@quicinc.com> wrote:
> >> > > > > On 2/8/2024 12:21 PM, Dmitry Baryshkov wrote:
> >> > > > > > On Thu, 8 Feb 2024 at 08:14, Krishna Chaitanya Chundru
> >> > > > > > <quic_krichai@quicinc.com> wrote:
> >> > > > > > >
> >> > > > > > >
> >> > > > > > >
> >> > > > > > > On 2/7/2024 5:17 PM, Dmitry Baryshkov wrote:
> >> > > > > > > > On Wed, 7 Feb 2024 at 12:42, Krishna chaitanya chundru
> >> > > > > > > > <quic_krichai@quicinc.com> wrote:
> >> > > > > > > > >
> >> > > > > > > > > Enable PCIe1 controller and its corresponding PHY nodes on
> >> > > > > > > > > qcs6490-rb3g2 platform.
> >> > > > > > > > >
> >> > > > > > > > > PCIe switch is connected to PCIe1, PCIe switch has multiple endpoints
> >> > > > > > > > > connected. For each endpoint a unique BDF will be assigned and should
> >> > > > > > > > > assign unique smmu id. So for each BDF add smmu id.
> >> > > > > > > > >
> >> > > > > > > > > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> >> > > > > > > > > ---
> >> > > > > > > > >     arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 42 ++++++++++++++++++++++++++++
> >> > > > > > > > >     1 file changed, 42 insertions(+)
> >> > > > > > > > >
> >> > > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >> > > > > > > > > index 8bb7d13d85f6..0082a3399453 100644
> >> > > > > > > > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >> > > > > > > > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >> > > > > > > > > @@ -413,6 +413,32 @@ vreg_bob_3p296: bob {
> >> > > > > > > > >            };
> >> > > > > > > > >     };
> >> > > > > > > > >
> >> > > > > > > > > +&pcie1 {
> >> > > > > > > > > +       perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> >> > > > > > > > > +
> >> > > > > > > > > +       pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
> >> > > > > > > > > +       pinctrl-names = "default";
> >> > > > > > > > > +
> >> > > > > > > > > +       iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
> >> > > > > > > > > +                   <0x100 &apps_smmu 0x1c81 0x1>,
> >> > > > > > > > > +                   <0x208 &apps_smmu 0x1c84 0x1>,
> >> > > > > > > > > +                   <0x210 &apps_smmu 0x1c85 0x1>,
> >> > > > > > > > > +                   <0x218 &apps_smmu 0x1c86 0x1>,
> >> > > > > > > > > +                   <0x300 &apps_smmu 0x1c87 0x1>,
> >> > > > > > > > > +                   <0x400 &apps_smmu 0x1c88 0x1>,
> >> > > > > > > > > +                   <0x500 &apps_smmu 0x1c89 0x1>,
> >> > > > > > > > > +                   <0x501 &apps_smmu 0x1c90 0x1>;
> >> > > > > > > >
> >> > > > > > > > Is the iommu-map really board specific?
> >> > > > > > > >
> >> > > > > > > The iommu-map for PCIe varies if PCIe switch is connected.
> >> > > > > > > For this platform a PCIe switch is connected and for that reason
> >> > > > > > > we need to define additional smmu ID's for each BDF.
> >> > > > > > >
> >> > > > > > > For that reason we defined here as these ID's are applicable only
> >> > > > > > > for this board.
> >> > > > > >
> >> > > > > > So, these IDs are the same for all boards, just being unused on
> >> > > > > > devices which have no bridges / switches connected to this PCIe host.
> >> > > > > > If this is correct, please move them to sc7280.dtsi.
> >> > > > > >
> >> > > > > Yes ID's will be same for all boards. we can move them sc7280.dtsi
> >> > > > > but the BDF to smmu mapping will be specific to this board only.
> >> > > > > if there is some other PCIe switch with different configuration is
> >> > > > > connected to different board of same variant in future again these
> >> > > > > mapping needs to updated.
> >> > > >
> >> > > > Could you possibly clarify this? Are they assigned one at a time
> >> > > > manually? Or is it somehow handled by the board's TZ code, which
> >> > > > assigns them sequentially to the known endpoints? And is it done via
> >> > > > probing the link or via some static configuration?
> >> > >
> >> > > There is no assignment of SID's in TZ for PCIe.
> >> > > PCIe controller has BDF to SID mapping table which we need to
> >> > > program with the iommu map table.
> >> > >
> >> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-qcom.c?h=v6.8-rc3#n997
> >> > >
> >> > > Based upon switch the BDF to SID table will change for example I had two
> >> > > switches with one switch has 2 PCIe ports and other has 3 ports one
> >> > > embedded port which supports multiple functions.
> >> > >
> >> > > For the first switch the BDF's are
> >> > >       - 0x000(root complex),
> >> > >       - 0x100(USP),
> >> > >       - 0x208(DSP 0),
> >> > >       - 0x210(DSP 1),
> >> > >       - 0x300(endpoint connected to DSP 0),
> >> > >       - 0x400( endpoint connected to DSP 1).
> >> > >
> >> > > For 2nd switch the BDF's are
> >> > >       - 0x000(root complex),
> >> > >       - 0x100(USP),
> >> > >       - 0x208(embeeded DSP 0),
> >> > >       - 0x210(DSP 1),
> >> > >       - 0x218 (DSP 2),
> >> > >       - 0x300(embedded endpoint function 0),
> >> > >       - 0x301 (embedded endpoint function 1)
> >> > >       - 0x400( endpoint connected to DSP 1)
> >> > >       - 0x500(endpoint connected to DSP2).
> >> > >
> >> > > For these two switches we need different BDF to SID table so for that
> >> > > reason we are keeping iommu map here as this is specific to this board.
> >> > >
> >> >
> >> > I don't understand why the SID table has to change between PCIe devices. The SID
> >> > mapping should be part of the SoC dtsi, where a single SID would be defined for
> >> > the devices under a bus. And all the devices under the bus have to use the same
> >> > SID.
> >> 
> >> This sounds like a sane default, indeed. Nevertheless, I see a point
> >> in having per-device-SID assignment. This increases isolation and can
> >> potentially prevent security issues. However in such case SID
> >> assignment should be handled in some automagic way. In other words,
> >> there must be no need to duplicate the topology of the PCIe bus in the
> >> iommu-maps property.
> >> 
> >
> >Agree with you on this. This is what I suggested some time back to have the
> >logic in the SMMU/PCIe drivers to assign SIDs dynamically. Unfortunately, it is
> >not a trivial work and it requires a broader discussion with the community.
> >
> >Also starting with SMMUv3, there are practically no limitations in SIDs and
> >each device should get a unique SID by default.
> >
> >So I got convinced that we can have these static mappings in the DT *atm* for
> >non SMMUv3 based hardwares and at the same time let the discussion happen with
> >the community. But this static mapping solution is just an interim one and won't
> >scale if more devices are added to the topology.
> 
> My main question to this approach is if it can support additional devices plugged into the switch. If there is no way to plug addon cards, then it is fine as a temporary measure.
> 

The logic here is that the fixed endpoints in the switch will get an unique SID
and the devices getting attached to slots will share the same SID of the bus
(this is the usual case with all Qcom SoCs).

But I guess we would need 'iommu-map-mask' as well. Hope this addresses your
concern.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

