Return-Path: <linux-arm-msm+bounces-32870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E38498BC2B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31AC41C22F3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307111C2444;
	Tue,  1 Oct 2024 12:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QsVXXg9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37AE1BFE01
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 12:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727786036; cv=none; b=mU+ICwnsh393L2oqQIwwsURp23CnewIiwZ6BACBT7/O6skH6TTzrZyFqVIJWT4JXvPRwpNBFKZYume5dmrUbdjQbbbJD+KyiMojKC/iNfZ7S+CAYro6LqzBbkFd3gQeekmwCsGzY3dvbGU1O8aAP7KsAJmM3hJNaD6GbdNBd+kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727786036; c=relaxed/simple;
	bh=wQu0h3FUqdxZZsAzwSeIbCEJPDzvO+JlgS3WqM3tPTM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=kzkhp15uKu1jKFUR8zti5ARAxJ9VVefQ+y50C3p97Rk/4rWyY5fV8YyRJW8u8soiuZ5qR7+uz5dYoGsdmleZyClQPYbgYYYfEoPx7zcU0T940S9xV3dipxU/T6Ya74whAPcZDpNpjwlZMu7Wj6wMlvzq0NTLkEelT0QA4kqM5mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QsVXXg9l; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so824588666b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 05:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727786031; x=1728390831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MpE+lu6BUmrLjseR7PUOUb/a2azBexwtke9MSotmQdA=;
        b=QsVXXg9lirCgJ9Y/P77M55kiB08blgsQh86jkTlitdGT7SiiAzRgz3+EYdP6lxXfUW
         VCFyTq2BlmfJNbNryLCh74q0VgJBmsHxhdgwPT0D8M6Tjqj5SPkS2a6ZIp5A6hNOoSNv
         dNTsIBRv9diAPSXfs12aYkD5InoBwgMrdOcfrWkPWBGAqIkvVF3yPnjOCytYuuaiOd8y
         vdcZzokfGk8lfo7Q0ZPVHFl948xaLPIWSlPFTPCeAaQL7XHM3ZHWqVM/MgchA4Pl5C/m
         jgfZP9wee6RX1utS3xhT7RC1Z7uhfDvpUoVhhf4vTDdDEMMzoOpoByR3wRJXjs3FkK73
         zpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786031; x=1728390831;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MpE+lu6BUmrLjseR7PUOUb/a2azBexwtke9MSotmQdA=;
        b=nza9eTq1Hfy6PR7zwZ6PPcS/3XYY6bocTLiLlO8tk3NrVa4hMJL5is3jEuwexCvpLi
         rDaVKKMe6kO068Adoz0k9NXwSU4/JJQCFfSPY9bRamHG35yZEfbO6+LkfncPdDN4LwPc
         eQE1jpFMB45jxF2YiaCwBmjEmgFM9K2N/UQzwotnR+cZ7feI+RDR9+4To4gG/P6Lbyda
         aMvdIb6kR/hGQT50/s1OjhSLIrpgS8DFKTmDG96zHgGIfB10cb9f33gRywOGvGFMa0TO
         UWBYjio5atM+zXpHBv+IY3ZBe0md9KVGr5GebOB+ku8cOx9EO8IKwXDHADEWaPoZu9XY
         wJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7xsJa5wPwsEaJ4KHQptVyjA0IgEk9WpAvP+ClAH94icmInAsVodwzHMqC7n7ZecNVCEOqp6m2ygRcXrKt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy58Pu7VYqT7M0ltqZmhgAnf3oG5U1oheLNOi21tQTouEY3Z9ex
	Tmys7ShMKt9RmWARSNlbEFQLKz95c+o0vC4q3W/Ew4MIk3fB6MPcJByHhRe3LCs=
X-Google-Smtp-Source: AGHT+IGCbxw5Zdd4qK3Y3gvuJUrejLlDDSDV+k6hKpu+u7SdSGS/MHcgEOzG3Ge+wVOaTUiQ4ANfrA==
X-Received: by 2002:a17:907:9604:b0:a8a:906d:b485 with SMTP id a640c23a62f3a-a93c490e060mr1989985566b.26.1727786031156;
        Tue, 01 Oct 2024 05:33:51 -0700 (PDT)
Received: from [127.0.0.1] ([37.155.0.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297bb82sm715646466b.178.2024.10.01.05.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 05:33:50 -0700 (PDT)
Date: Tue, 01 Oct 2024 15:30:14 +0300
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
In-Reply-To: <20241001101622.ys36slymgjbaz26q@thinkpad>
References: <20240207-enable_pcie-v1-1-b684afa6371c@quicinc.com> <CAA8EJpqjm_2aE+7BtMkFUdet11q7v_jyHbUEpiDHSBSnzhndYA@mail.gmail.com> <dec2976e-6e1e-6121-e175-210377ff6925@quicinc.com> <CAA8EJprsm5Tw=vFpmfEKL8fxS-S+aW+YR0byfyL=v78k75TGEw@mail.gmail.com> <3ad77846-b4a8-80ee-e9e1-d5cbf4add6d8@quicinc.com> <CAA8EJprRF0tVFZK9c=MT8bSRcBdRvcugBaeEzpX5-wfRyNgc3Q@mail.gmail.com> <c8be2bbf-a51c-a38f-6e6f-a88801f953d5@quicinc.com> <20240209075716.GA12035@thinkpad> <CAA8EJppfzc_dM9c9mHPVWheVxi-1gJxCmaWPvreELijEQDDSyA@mail.gmail.com> <20241001101622.ys36slymgjbaz26q@thinkpad>
Message-ID: <8459161B-87B8-481F-AE71-3D5156B1CA56@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 1, 2024 1:16:22 PM GMT+03:00, Manivannan Sadhasivam <manivannan=
=2Esadhasivam@linaro=2Eorg> wrote:
>On Fri, Feb 09, 2024 at 12:56:18PM +0200, Dmitry Baryshkov wrote:
>> On Fri, 9 Feb 2024 at 09:57, Manivannan Sadhasivam
>> <manivannan=2Esadhasivam@linaro=2Eorg> wrote:
>> >
>> > On Fri, Feb 09, 2024 at 12:58:15PM +0530, Krishna Chaitanya Chundru w=
rote:
>> > >
>> > >
>> > > On 2/8/2024 8:49 PM, Dmitry Baryshkov wrote:
>> > > > On Thu, 8 Feb 2024 at 16:58, Krishna Chaitanya Chundru
>> > > > <quic_krichai@quicinc=2Ecom> wrote:
>> > > > > On 2/8/2024 12:21 PM, Dmitry Baryshkov wrote:
>> > > > > > On Thu, 8 Feb 2024 at 08:14, Krishna Chaitanya Chundru
>> > > > > > <quic_krichai@quicinc=2Ecom> wrote:
>> > > > > > >
>> > > > > > >
>> > > > > > >
>> > > > > > > On 2/7/2024 5:17 PM, Dmitry Baryshkov wrote:
>> > > > > > > > On Wed, 7 Feb 2024 at 12:42, Krishna chaitanya chundru
>> > > > > > > > <quic_krichai@quicinc=2Ecom> wrote:
>> > > > > > > > >
>> > > > > > > > > Enable PCIe1 controller and its corresponding PHY nodes=
 on
>> > > > > > > > > qcs6490-rb3g2 platform=2E
>> > > > > > > > >
>> > > > > > > > > PCIe switch is connected to PCIe1, PCIe switch has mult=
iple endpoints
>> > > > > > > > > connected=2E For each endpoint a unique BDF will be ass=
igned and should
>> > > > > > > > > assign unique smmu id=2E So for each BDF add smmu id=2E
>> > > > > > > > >
>> > > > > > > > > Signed-off-by: Krishna chaitanya chundru <quic_krichai@=
quicinc=2Ecom>
>> > > > > > > > > ---
>> > > > > > > > >     arch/arm64/boot/dts/qcom/qcs6490-rb3gen2=2Edts | 42=
 ++++++++++++++++++++++++++++
>> > > > > > > > >     1 file changed, 42 insertions(+)
>> > > > > > > > >
>> > > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2=
=2Edts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2=2Edts
>> > > > > > > > > index 8bb7d13d85f6=2E=2E0082a3399453 100644
>> > > > > > > > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2=2Edts
>> > > > > > > > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2=2Edts
>> > > > > > > > > @@ -413,6 +413,32 @@ vreg_bob_3p296: bob {
>> > > > > > > > >            };
>> > > > > > > > >     };
>> > > > > > > > >
>> > > > > > > > > +&pcie1 {
>> > > > > > > > > +       perst-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
>> > > > > > > > > +
>> > > > > > > > > +       pinctrl-0 =3D <&pcie1_reset_n>, <&pcie1_wake_n>=
;
>> > > > > > > > > +       pinctrl-names =3D "default";
>> > > > > > > > > +
>> > > > > > > > > +       iommu-map =3D <0x0 &apps_smmu 0x1c80 0x1>,
>> > > > > > > > > +                   <0x100 &apps_smmu 0x1c81 0x1>,
>> > > > > > > > > +                   <0x208 &apps_smmu 0x1c84 0x1>,
>> > > > > > > > > +                   <0x210 &apps_smmu 0x1c85 0x1>,
>> > > > > > > > > +                   <0x218 &apps_smmu 0x1c86 0x1>,
>> > > > > > > > > +                   <0x300 &apps_smmu 0x1c87 0x1>,
>> > > > > > > > > +                   <0x400 &apps_smmu 0x1c88 0x1>,
>> > > > > > > > > +                   <0x500 &apps_smmu 0x1c89 0x1>,
>> > > > > > > > > +                   <0x501 &apps_smmu 0x1c90 0x1>;
>> > > > > > > >
>> > > > > > > > Is the iommu-map really board specific?
>> > > > > > > >
>> > > > > > > The iommu-map for PCIe varies if PCIe switch is connected=
=2E
>> > > > > > > For this platform a PCIe switch is connected and for that r=
eason
>> > > > > > > we need to define additional smmu ID's for each BDF=2E
>> > > > > > >
>> > > > > > > For that reason we defined here as these ID's are applicabl=
e only
>> > > > > > > for this board=2E
>> > > > > >
>> > > > > > So, these IDs are the same for all boards, just being unused =
on
>> > > > > > devices which have no bridges / switches connected to this PC=
Ie host=2E
>> > > > > > If this is correct, please move them to sc7280=2Edtsi=2E
>> > > > > >
>> > > > > Yes ID's will be same for all boards=2E we can move them sc7280=
=2Edtsi
>> > > > > but the BDF to smmu mapping will be specific to this board only=
=2E
>> > > > > if there is some other PCIe switch with different configuration=
 is
>> > > > > connected to different board of same variant in future again th=
ese
>> > > > > mapping needs to updated=2E
>> > > >
>> > > > Could you possibly clarify this? Are they assigned one at a time
>> > > > manually? Or is it somehow handled by the board's TZ code, which
>> > > > assigns them sequentially to the known endpoints? And is it done =
via
>> > > > probing the link or via some static configuration?
>> > >
>> > > There is no assignment of SID's in TZ for PCIe=2E
>> > > PCIe controller has BDF to SID mapping table which we need to
>> > > program with the iommu map table=2E
>> > >
>> > > https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=
=2Egit/tree/drivers/pci/controller/dwc/pcie-qcom=2Ec?h=3Dv6=2E8-rc3#n997
>> > >
>> > > Based upon switch the BDF to SID table will change for example I ha=
d two
>> > > switches with one switch has 2 PCIe ports and other has 3 ports one
>> > > embedded port which supports multiple functions=2E
>> > >
>> > > For the first switch the BDF's are
>> > >       - 0x000(root complex),
>> > >       - 0x100(USP),
>> > >       - 0x208(DSP 0),
>> > >       - 0x210(DSP 1),
>> > >       - 0x300(endpoint connected to DSP 0),
>> > >       - 0x400( endpoint connected to DSP 1)=2E
>> > >
>> > > For 2nd switch the BDF's are
>> > >       - 0x000(root complex),
>> > >       - 0x100(USP),
>> > >       - 0x208(embeeded DSP 0),
>> > >       - 0x210(DSP 1),
>> > >       - 0x218 (DSP 2),
>> > >       - 0x300(embedded endpoint function 0),
>> > >       - 0x301 (embedded endpoint function 1)
>> > >       - 0x400( endpoint connected to DSP 1)
>> > >       - 0x500(endpoint connected to DSP2)=2E
>> > >
>> > > For these two switches we need different BDF to SID table so for th=
at
>> > > reason we are keeping iommu map here as this is specific to this bo=
ard=2E
>> > >
>> >
>> > I don't understand why the SID table has to change between PCIe devic=
es=2E The SID
>> > mapping should be part of the SoC dtsi, where a single SID would be d=
efined for
>> > the devices under a bus=2E And all the devices under the bus have to =
use the same
>> > SID=2E
>>=20
>> This sounds like a sane default, indeed=2E Nevertheless, I see a point
>> in having per-device-SID assignment=2E This increases isolation and can
>> potentially prevent security issues=2E However in such case SID
>> assignment should be handled in some automagic way=2E In other words,
>> there must be no need to duplicate the topology of the PCIe bus in the
>> iommu-maps property=2E
>>=20
>
>Agree with you on this=2E This is what I suggested some time back to have=
 the
>logic in the SMMU/PCIe drivers to assign SIDs dynamically=2E Unfortunatel=
y, it is
>not a trivial work and it requires a broader discussion with the communit=
y=2E
>
>Also starting with SMMUv3, there are practically no limitations in SIDs a=
nd
>each device should get a unique SID by default=2E
>
>So I got convinced that we can have these static mappings in the DT *atm*=
 for
>non SMMUv3 based hardwares and at the same time let the discussion happen=
 with
>the community=2E But this static mapping solution is just an interim one =
and won't
>scale if more devices are added to the topology=2E

My main question to this approach is if it can support additional devices =
plugged into the switch=2E If there is no way to plug addon cards, then it =
is fine as a temporary measure=2E

>
>- Mani
>


--=20
With best wishes
Dmitry

