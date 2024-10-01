Return-Path: <linux-arm-msm+bounces-32896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9DB98C136
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 17:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41FAC28599E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 15:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0376F1C5782;
	Tue,  1 Oct 2024 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hj//nvyr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB62C1C6F51
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727795309; cv=none; b=POSzAz0f9hrUlTwbtkWY9gau/YLlQiQ5Zqtl0veEM0rLFA9d8x8dVAu8XZw8V6on5nw2vM/8qT7NvT0VA414JV7A6QPPl/bA6zA7K4hUejU1gCei+5HbqslmilGbemvUgCwd6D0T/dEWmBUYRrdk1D4t6hS9CYBQcDEfOtSTt0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727795309; c=relaxed/simple;
	bh=hLVPT5QH2w8aqwv4hbzPqWtCw+OVzoiV6A3MkiezLAo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=RM7xU3ThQYU4C+AAQlZmPhJrucXyieUN/WyesSgBVDbObvGlr9jfvAMkGYmjhYLR+Wiml0bRvb0wObYyQYiKlw3CqqtBica9OupHGhR/TN01xAsd5p3gsdkrUi68HZ69jKRH4GUkTMvT+HkmfESAJeG1PxuZJVnggtML8I1Q6+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hj//nvyr; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso1051678466b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727795306; x=1728400106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+HFBIFAHPWeADzPyyjFCnfZeSNABfX68tOfLHeTVYdQ=;
        b=hj//nvyr/sUp02l/HwQyYJhb93BUOt0VBPPvR72lQrcglfKEloMk53swj5zM/veP1r
         2AQYX7oVSfHVeWqME0QgU1qXkiVOrZFEJ9KAWhbuEZBuL3nbuT5CvU8WgJmLYZCpgK3N
         GvvdneVDnbUNzV9WgjZaB48vYrcaOUbpvn+u/gUSYmu/Qalijr15V83XqCsf2tFD+zTO
         e87wrBzEXB1xrpXUiTL9Vl+u/ERIKmiK7fHvkdV+C7x98FxHijmYBmEBxZ9pABHgwT8E
         400LllcPHosICufB0cEjvj7RtaV2x/X600AnTSVpBrON5gDD9/x1ZILx+ic5hce/tOSe
         nViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795306; x=1728400106;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HFBIFAHPWeADzPyyjFCnfZeSNABfX68tOfLHeTVYdQ=;
        b=VjACkMwihM1ijeR3SNbG+l6rj+T08CZDZPM7bJ15dz0VZ/WisGMWltDEr9XIyI2r1F
         gcJEO7pCZbRNybniaa4kOJ5wvUrp/253xKLEM5pncTgeVU+d5XBmCqYyvDBO2H6U7Yz9
         xsHKPpyCPLsrXPH7ZpSAS/bQZTH5EUL/X92o9KmdVJ5AIr+s4YiB4SS5iNfpIJcNUhWz
         2ozel/g93Lv+K50BGU64nlHpwhsjCjRKnj7tBFoCiUBhqdwfWBj6LH2m7BeOW/auzyBY
         1StuBTMnSpITDMceFp+ceD0aqeqNr/hDqn7mu/Tn/nLNL9luOKesren6tnmUiE4+paPX
         NbeA==
X-Forwarded-Encrypted: i=1; AJvYcCVFpo3SlMvhwLH+ZdK6X0VKhO2ADy6+ch00QdmdUj7lt0V2rxXhmXFMUzomKawvXZCHcmiGWBorSldyTL1i@vger.kernel.org
X-Gm-Message-State: AOJu0YwgM4OzkZL9dfg/a9T33hEgtt9DGCveo2uCdyqVkGankHOK6hRJ
	DHwbrvtSpbyph8ToUOgf0tsRGTno0Yd0cvDYEFpN6LTz2ukEnv89eDbKO5+pfPY=
X-Google-Smtp-Source: AGHT+IF0nfq6Su2Wb1UxQmT9CiFUoqToCVHj3y5LzPTsSuMeePzCAt1PJVN7jghswxKLG6/uLz84tg==
X-Received: by 2002:a17:906:478b:b0:a8d:65f4:c7c6 with SMTP id a640c23a62f3a-a967c0853ddmr407697366b.24.1727795306172;
        Tue, 01 Oct 2024 08:08:26 -0700 (PDT)
Received: from [127.0.0.1] ([188.119.23.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947af3sm730357266b.134.2024.10.01.08.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 08:08:25 -0700 (PDT)
Date: Tue, 01 Oct 2024 18:08:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
 quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
 quic_parass@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add PCIe nodes
User-Agent: K-9 Mail for Android
In-Reply-To: <20241001141948.g74rn6777ywvtcmx@thinkpad>
References: <CAA8EJpqjm_2aE+7BtMkFUdet11q7v_jyHbUEpiDHSBSnzhndYA@mail.gmail.com> <dec2976e-6e1e-6121-e175-210377ff6925@quicinc.com> <CAA8EJprsm5Tw=vFpmfEKL8fxS-S+aW+YR0byfyL=v78k75TGEw@mail.gmail.com> <3ad77846-b4a8-80ee-e9e1-d5cbf4add6d8@quicinc.com> <CAA8EJprRF0tVFZK9c=MT8bSRcBdRvcugBaeEzpX5-wfRyNgc3Q@mail.gmail.com> <c8be2bbf-a51c-a38f-6e6f-a88801f953d5@quicinc.com> <20240209075716.GA12035@thinkpad> <CAA8EJppfzc_dM9c9mHPVWheVxi-1gJxCmaWPvreELijEQDDSyA@mail.gmail.com> <20241001101622.ys36slymgjbaz26q@thinkpad> <8459161B-87B8-481F-AE71-3D5156B1CA56@linaro.org> <20241001141948.g74rn6777ywvtcmx@thinkpad>
Message-ID: <CFF89D4D-8131-47C2-95B8-A0E130A16E46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 1, 2024 5:19:48 PM GMT+03:00, Manivannan Sadhasivam <manivannan=
=2Esadhasivam@linaro=2Eorg> wrote:
>On Tue, Oct 01, 2024 at 03:30:14PM +0300, Dmitry Baryshkov wrote:
>> On October 1, 2024 1:16:22 PM GMT+03:00, Manivannan Sadhasivam <manivan=
nan=2Esadhasivam@linaro=2Eorg> wrote:
>> >On Fri, Feb 09, 2024 at 12:56:18PM +0200, Dmitry Baryshkov wrote:
>> >> On Fri, 9 Feb 2024 at 09:57, Manivannan Sadhasivam
>> >> <manivannan=2Esadhasivam@linaro=2Eorg> wrote:
>> >> >
>> >> > On Fri, Feb 09, 2024 at 12:58:15PM +0530, Krishna Chaitanya Chundr=
u wrote:
>> >> > >
>> >> > >
>> >> > > On 2/8/2024 8:49 PM, Dmitry Baryshkov wrote:
>> >> > > > On Thu, 8 Feb 2024 at 16:58, Krishna Chaitanya Chundru
>> >> > > > <quic_krichai@quicinc=2Ecom> wrote:
>> >> > > > > On 2/8/2024 12:21 PM, Dmitry Baryshkov wrote:
>> >> > > > > > On Thu, 8 Feb 2024 at 08:14, Krishna Chaitanya Chundru
>> >> > > > > > <quic_krichai@quicinc=2Ecom> wrote:
>> >> > > > > > >
>> >> > > > > > >
>> >> > > > > > >
>> >> > > > > > > On 2/7/2024 5:17 PM, Dmitry Baryshkov wrote:
>> >> > > > > > > > On Wed, 7 Feb 2024 at 12:42, Krishna chaitanya chundru
>> >> > > > > > > > <quic_krichai@quicinc=2Ecom> wrote:
>> >> > > > > > > > >
>> >> > > > > > > > > Enable PCIe1 controller and its corresponding PHY no=
des on
>> >> > > > > > > > > qcs6490-rb3g2 platform=2E
>> >> > > > > > > > >
>> >> > > > > > > > > PCIe switch is connected to PCIe1, PCIe switch has m=
ultiple endpoints
>> >> > > > > > > > > connected=2E For each endpoint a unique BDF will be =
assigned and should
>> >> > > > > > > > > assign unique smmu id=2E So for each BDF add smmu id=
=2E
>> >> > > > > > > > >
>> >> > > > > > > > > Signed-off-by: Krishna chaitanya chundru <quic_krich=
ai@quicinc=2Ecom>
>> >> > > > > > > > > ---
>> >> > > > > > > > >     arch/arm64/boot/dts/qcom/qcs6490-rb3gen2=2Edts |=
 42 ++++++++++++++++++++++++++++
>> >> > > > > > > > >     1 file changed, 42 insertions(+)
>> >> > > > > > > > >
>> >> > > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen=
2=2Edts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2=2Edts
>> >> > > > > > > > > index 8bb7d13d85f6=2E=2E0082a3399453 100644
>> >> > > > > > > > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2=2Edts
>> >> > > > > > > > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2=2Edts
>> >> > > > > > > > > @@ -413,6 +413,32 @@ vreg_bob_3p296: bob {
>> >> > > > > > > > >            };
>> >> > > > > > > > >     };
>> >> > > > > > > > >
>> >> > > > > > > > > +&pcie1 {
>> >> > > > > > > > > +       perst-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
>> >> > > > > > > > > +
>> >> > > > > > > > > +       pinctrl-0 =3D <&pcie1_reset_n>, <&pcie1_wake=
_n>;
>> >> > > > > > > > > +       pinctrl-names =3D "default";
>> >> > > > > > > > > +
>> >> > > > > > > > > +       iommu-map =3D <0x0 &apps_smmu 0x1c80 0x1>,
>> >> > > > > > > > > +                   <0x100 &apps_smmu 0x1c81 0x1>,
>> >> > > > > > > > > +                   <0x208 &apps_smmu 0x1c84 0x1>,
>> >> > > > > > > > > +                   <0x210 &apps_smmu 0x1c85 0x1>,
>> >> > > > > > > > > +                   <0x218 &apps_smmu 0x1c86 0x1>,
>> >> > > > > > > > > +                   <0x300 &apps_smmu 0x1c87 0x1>,
>> >> > > > > > > > > +                   <0x400 &apps_smmu 0x1c88 0x1>,
>> >> > > > > > > > > +                   <0x500 &apps_smmu 0x1c89 0x1>,
>> >> > > > > > > > > +                   <0x501 &apps_smmu 0x1c90 0x1>;
>> >> > > > > > > >
>> >> > > > > > > > Is the iommu-map really board specific?
>> >> > > > > > > >
>> >> > > > > > > The iommu-map for PCIe varies if PCIe switch is connecte=
d=2E
>> >> > > > > > > For this platform a PCIe switch is connected and for tha=
t reason
>> >> > > > > > > we need to define additional smmu ID's for each BDF=2E
>> >> > > > > > >
>> >> > > > > > > For that reason we defined here as these ID's are applic=
able only
>> >> > > > > > > for this board=2E
>> >> > > > > >
>> >> > > > > > So, these IDs are the same for all boards, just being unus=
ed on
>> >> > > > > > devices which have no bridges / switches connected to this=
 PCIe host=2E
>> >> > > > > > If this is correct, please move them to sc7280=2Edtsi=2E
>> >> > > > > >
>> >> > > > > Yes ID's will be same for all boards=2E we can move them sc7=
280=2Edtsi
>> >> > > > > but the BDF to smmu mapping will be specific to this board o=
nly=2E
>> >> > > > > if there is some other PCIe switch with different configurat=
ion is
>> >> > > > > connected to different board of same variant in future again=
 these
>> >> > > > > mapping needs to updated=2E
>> >> > > >
>> >> > > > Could you possibly clarify this? Are they assigned one at a ti=
me
>> >> > > > manually? Or is it somehow handled by the board's TZ code, whi=
ch
>> >> > > > assigns them sequentially to the known endpoints? And is it do=
ne via
>> >> > > > probing the link or via some static configuration?
>> >> > >
>> >> > > There is no assignment of SID's in TZ for PCIe=2E
>> >> > > PCIe controller has BDF to SID mapping table which we need to
>> >> > > program with the iommu map table=2E
>> >> > >
>> >> > > https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/lin=
ux=2Egit/tree/drivers/pci/controller/dwc/pcie-qcom=2Ec?h=3Dv6=2E8-rc3#n997
>> >> > >
>> >> > > Based upon switch the BDF to SID table will change for example I=
 had two
>> >> > > switches with one switch has 2 PCIe ports and other has 3 ports =
one
>> >> > > embedded port which supports multiple functions=2E
>> >> > >
>> >> > > For the first switch the BDF's are
>> >> > >       - 0x000(root complex),
>> >> > >       - 0x100(USP),
>> >> > >       - 0x208(DSP 0),
>> >> > >       - 0x210(DSP 1),
>> >> > >       - 0x300(endpoint connected to DSP 0),
>> >> > >       - 0x400( endpoint connected to DSP 1)=2E
>> >> > >
>> >> > > For 2nd switch the BDF's are
>> >> > >       - 0x000(root complex),
>> >> > >       - 0x100(USP),
>> >> > >       - 0x208(embeeded DSP 0),
>> >> > >       - 0x210(DSP 1),
>> >> > >       - 0x218 (DSP 2),
>> >> > >       - 0x300(embedded endpoint function 0),
>> >> > >       - 0x301 (embedded endpoint function 1)
>> >> > >       - 0x400( endpoint connected to DSP 1)
>> >> > >       - 0x500(endpoint connected to DSP2)=2E
>> >> > >
>> >> > > For these two switches we need different BDF to SID table so for=
 that
>> >> > > reason we are keeping iommu map here as this is specific to this=
 board=2E
>> >> > >
>> >> >
>> >> > I don't understand why the SID table has to change between PCIe de=
vices=2E The SID
>> >> > mapping should be part of the SoC dtsi, where a single SID would b=
e defined for
>> >> > the devices under a bus=2E And all the devices under the bus have =
to use the same
>> >> > SID=2E
>> >>=20
>> >> This sounds like a sane default, indeed=2E Nevertheless, I see a poi=
nt
>> >> in having per-device-SID assignment=2E This increases isolation and =
can
>> >> potentially prevent security issues=2E However in such case SID
>> >> assignment should be handled in some automagic way=2E In other words=
,
>> >> there must be no need to duplicate the topology of the PCIe bus in t=
he
>> >> iommu-maps property=2E
>> >>=20
>> >
>> >Agree with you on this=2E This is what I suggested some time back to h=
ave the
>> >logic in the SMMU/PCIe drivers to assign SIDs dynamically=2E Unfortuna=
tely, it is
>> >not a trivial work and it requires a broader discussion with the commu=
nity=2E
>> >
>> >Also starting with SMMUv3, there are practically no limitations in SID=
s and
>> >each device should get a unique SID by default=2E
>> >
>> >So I got convinced that we can have these static mappings in the DT *a=
tm* for
>> >non SMMUv3 based hardwares and at the same time let the discussion hap=
pen with
>> >the community=2E But this static mapping solution is just an interim o=
ne and won't
>> >scale if more devices are added to the topology=2E
>>=20
>> My main question to this approach is if it can support additional devic=
es plugged into the switch=2E If there is no way to plug addon cards, then =
it is fine as a temporary measure=2E
>>=20
>
>The logic here is that the fixed endpoints in the switch will get an uniq=
ue SID
>and the devices getting attached to slots will share the same SID of the =
bus
>(this is the usual case with all Qcom SoCs)=2E
>
>But I guess we would need 'iommu-map-mask' as well=2E Hope this addresses=
 your
>concern=2E

Yes, thank you!


>
>- Mani
>


--=20
With best wishes
Dmitry

