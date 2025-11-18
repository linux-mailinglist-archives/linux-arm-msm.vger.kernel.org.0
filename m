Return-Path: <linux-arm-msm+bounces-82380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4E2C6B1B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 19:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3C89F34713D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 18:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297F3328262;
	Tue, 18 Nov 2025 18:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lj259Shn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtNVOnmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA421A08A3
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 18:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763489315; cv=none; b=qX5sGzYVeICDhog37SCvffIwTFiIrk0mNkNg81k2NC/J3fWjYqNe2idB6WopAe1vr0t9sfgk12fwE3B5mG+Ib/BaU2HNW3A11+EDSnyFN75L/E/Fgz4fQJGAq5uZHlt+RLqycllv8QHgUBFik3H3b+jDMmMt/pr9N1LVpSzOwlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763489315; c=relaxed/simple;
	bh=JyiwRD5PXU2JTaLEBqBqRY2AF/v56wcsy/a20WnD3iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+Kn4R+cnl4PFreYV7uDqqUwydJ/6avlr2n8soa5czGRxM5z86uAD4uWeYVV3/SE4I+SbcxZBy7HcQMuwQs7RxLFE8Lao6pOpXmmuwcDguZzLjbXceQdjrVggC3P1qxsvrMMS3GSDlZaHam6ovP2Tm9j0+C9xk3jlCMm5zkbtm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lj259Shn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtNVOnmI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIG586n3412657
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 18:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIc8zOzG0s/exhiJHOzjLrkPn+My1alB6NYtozrxKNg=; b=Lj259Shn7cSockzn
	GRQsKJG7JZ5KEYM8G4HoAGrEBE/rBBrd0M7iqY75cz95XUoZ19AWgN87ItGXEu5O
	jGJhiIxo2jQJ/YuDWxj9fS5EuE5CyV4A4En+ak2rdDmjSEnOevjGMpm7uXB1lFhn
	OcFpizFiu2Nu5O06mjDp4U8ukb6u96ocoglJiJpl4jC+bnEJR4C4lR2POEQmGvf8
	eISNeuKZzLcXLZx1bcuwO0CaoDISy2qLLx8FS95dw/PeRyOD5CelqVm2ytDo4TOq
	dnuFBFDuPGwYqKt49QeSN2HwKyQ808ze0DIoLnbNQzRb/PAzAeV3VChZin2InFfg
	LZ3Wqw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv0v0e01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 18:08:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88236bcdfc4so162570446d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763489311; x=1764094111; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dIc8zOzG0s/exhiJHOzjLrkPn+My1alB6NYtozrxKNg=;
        b=KtNVOnmIUenc0Tx+9aoCLXI3PIuTkzvGuWCKp9cdH0F0mF2+wVodjuCIflcQrl+e0X
         4JzfLKFvJzsePf2ylL+X/Ggyj1aBkDCuIqbTfQQKN0fLtfWZPbd5ZFaRsMo7JonlwFWT
         C002C+oDELfAWPqZPmix+LHvApRgflrXZmXhNNNrsF8Dr1lkWy1bPmd2MC4pWfDia1AF
         21V3cOxVZ2KWFeWr+RoBQExPFmt7Oc6aT3l9D79PkBoOhTd6+vLcGGobNR/5iT8/QLXF
         CTYqdsG87hUeAGjKUk1NUmKOP0/tdoED0sazegcgP4ipeAVwlzk2REkh7KERDpaLDNZP
         APoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763489311; x=1764094111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIc8zOzG0s/exhiJHOzjLrkPn+My1alB6NYtozrxKNg=;
        b=LNrBSGTXn17PfrgryWeS9rgJrKTQqAtjCudIe1HqJGf4RfFyrOOntpaNf9EcsJHJCf
         rvtC9V2o0kMiu1E4swNGJQRLq2xGI1XATFm48JSfLw1fEtW6wnpu+upKC1GrprCNs8po
         qMEXHY/YWMG+XLhjEQoRy5M9JC/5ohRc3XG7koiwlhlusdV795Ml6uxpD2ipy7pk9Z64
         1NNgKecrzl7CmTHxkIAZJikA4Oycgpn6HNRao96LBvq9JmBFBkooub9b+xGcMPbT2Bti
         WWhfNaED7faMscKZEHgFvIDkqGhZBN3xSDZbfAqCyIfSeYO1h66fQ5R35jTHZNXpTAsG
         lTHw==
X-Forwarded-Encrypted: i=1; AJvYcCW5nICx/Cj9H7aFkX89B2gqLNqcWP6ahlL4JqMkFnu9TdolLK8lwYRRAJIP1bG4aPVrgB13AuPMyHyQ+jdk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdctvmmf4FHfhDBR5bBu2QxLqaZF88C1azv1cgYWFV3RfGZ9Ol
	lKc94XadTEGuiwDEp0JPUGnxCr59nY0ZnWL1xaa8OK43O0k03d4AFlHiECZLYCQHFfyYcj9fzza
	VBYiXyEQJJ12+hXrSKbX6tSIQzFwP4jKFeBy5fNspAG+7zYR44FTSG51hG579OGzJIBKR
X-Gm-Gg: ASbGncuEPK2XDymzj78ju3V/QsiLYD3756RrK3SNy0LQcpEOWUKB8ko7V8MlHTPq35Q
	NtLCem4bpGQJliaAm0TH3iyKhSz/p1fmqfVFI/8gAokH95lejKLyoeExcBgG5sdTAdiyP7NxbQo
	JMAXZTXpeivbNV3w3RVkY8yCHm6I/ypHkMHSWTWfM/3tuCbrr6sFQU5biNKbuu/AqJev/UqWWmA
	N7wmyuDyyhCVBv5sKAO/3V4XH9GgUim1gh3SHY+9VX862PIzEM7FtzIosds5OWiAJ0WxV981GgW
	LnhO5nDkzpxOECIwQXN3ZdpvOCqF4eSRV+6N4Sk+D+utB2x5mS2wxIb2tEI6HaCO+cqXgbgtmEa
	/vAaNPH3bQLAnT1T6LOI57NPGT0rsoC8ICTDzN2iTEEyvDc7kOfDv86/PHvuBYzJhV3tDWtNNUn
	jsgXpFqbDFT5LT5TLo2Vt2OmQ=
X-Received: by 2002:a05:622a:493:b0:4ee:168a:9ebe with SMTP id d75a77b69052e-4ee168aa0bbmr161495061cf.45.1763489309777;
        Tue, 18 Nov 2025 10:08:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEq0z6syR3TwYsiIIv64UoZ0ESiGvYw9oY00pbh8SjV1wuGk6ThpJs6qViY/voGF/hA1LTsFA==
X-Received: by 2002:a05:622a:493:b0:4ee:168a:9ebe with SMTP id d75a77b69052e-4ee168aa0bbmr161493881cf.45.1763489308820;
        Tue, 18 Nov 2025 10:08:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b30c4sm4124761e87.31.2025.11.18.10.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 10:08:27 -0800 (PST)
Date: Tue, 18 Nov 2025 20:08:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Roger Shimizu <rosh@debian.org>
Cc: Jens Reidel <adrian@mainlining.org>,
        Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
Message-ID: <2iv3hsxcwlgfnpq75h4tfnbilurs5jelslig6gzknpb6lsupvk@xfxdofqw7b3v>
References: <20251115-rubikpi-next-20251114-v1-0-fc630dc5bb5d@thundersoft.com>
 <20251115-rubikpi-next-20251114-v1-1-fc630dc5bb5d@thundersoft.com>
 <b2d4d91f-c726-4f5a-994a-086edc9caff2@mainlining.org>
 <CAEQ9gE=ztgQ+pGJVxKgk5dVWDSSfOG7r=s1cDa_x0_Zsf2eyYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEQ9gE=ztgQ+pGJVxKgk5dVWDSSfOG7r=s1cDa_x0_Zsf2eyYA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NSBTYWx0ZWRfX3buRauphYC2i
 BH8buMw7JClpIB/mZdahEXH3TetInMrf6CeOnOpdQRulS/W1dDRRMtIhhBNtP0hZNXICyqdaoxk
 d6NegHnpOm8ccstiI2CEjgJrnUK3sKzIBmF/RtJAzcTTSrk4tLcBFfKJP+RYuGjTIVS0cLj9/RN
 XosbUmyggBQ4doUogv/MN57Hs+7xAbGGR3Na/82jhxliQixMBDR+QwqStCR0m00LzTWG0lO12Ee
 BYTVgRq4Gr6/N7Y+iJroCt5X5v61yX3xrbhLHSRyn18+oxk8s5gA/cdY4BaZAhBgZZliPO13CSQ
 cwUGtKTnZdOBG+XtOybNzTKpIPCrTXX/sUyAhgo0OItBT4rM/fi9CA2Bbny4u46WUZeO72S4wqF
 jKlefJWpDi2etHhxcG4303z4z1m9gQ==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=691cb61f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fxJcL_dCAAAA:8 a=OuZLqq7tAAAA:8 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8
 a=JFP3Wp4Tb7VmlQpwFN0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=j5gyrzqu0rbr1vhfHjzO:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: 7xFRMBzQSFr-2JYfbUefURjM76KRVE72
X-Proofpoint-GUID: 7xFRMBzQSFr-2JYfbUefURjM76KRVE72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180145

On Sun, Nov 16, 2025 at 11:36:13PM -0800, Roger Shimizu wrote:
> Thanks Jens, and Dmitry for the review!
> 
> On Sat, Nov 15, 2025 at 9:25 AM Jens Reidel <adrian@mainlining.org> wrote:
> >
> > Hi,
> >
> > On 11/14/25 5:34 PM, Hongyang Zhao wrote:
> > > Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> > > QCS6490 SoC.
> > >
> > > Works:
> > > - Bluetooth (AP6256)
> > > - Wi-Fi (AP6256)
> > > - Ethernet (AX88179B connected to UPD720201)
> > > - FAN
> > > - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> > > - M.2 M-Key 2280 PCIe 3.0
> > > - RTC
> > > - USB Type-C
> > > - USB Type-A 2.0 port
> > > - 40PIN: I2C x1, UART x1
> > >
> > > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > > Reviewed-by: Roger Shimizu <rosh@debian.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> > >   .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1415 ++++++++++++++++++++
> > >   2 files changed, 1416 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > index 6f34d5ed331c..2433b15754fe 100644
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -138,6 +138,7 @@ qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2
> > >
> > >   dtb-$(CONFIG_ARCH_QCOM)     += qcs6490-rb3gen2-industrial-mezzanine.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)     += qcs6490-rb3gen2-vision-mezzanine.dtb
> > > +dtb-$(CONFIG_ARCH_QCOM)      += qcs6490-thundercomm-rubikpi3.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)     += qcs8300-ride.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)     += qcs8550-aim300-aiot.dtb
> > >   dtb-$(CONFIG_ARCH_QCOM)     += qcs9100-ride.dtb
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > > new file mode 100644
> > > index 000000000000..4c9016992de3
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > > @@ -0,0 +1,1415 @@
> >
> > [snip]
> >
> > > +
> > > +&pcie0 {
> > > +     perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
> > > +     wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
> > > +
> > > +     pinctrl-0 = <&pcie0_clkreq_n>,
> > > +                 <&pcie0_reset_n>,
> > > +                 <&pcie0_wake_n>;
> > > +     pinctrl-names = "default";
> > > +
> > > +     status = "okay";
> > > +};
> > > +
> > > +&pcie0_phy {
> > > +     vdda-phy-supply = <&vreg_l10c_0p88>;
> > > +     vdda-pll-supply = <&vreg_l6b_1p2>;
> > > +
> > > +     status = "okay";
> > > +};
> > > +
> > > +&pcie1 {
> > > +     /* Using traditional address mapping */
> > > +     reg = <0 0x01c08000 0 0x3000>,
> > > +           <0 0x40000000 0 0xf1d>,
> > > +           <0 0x40000f20 0 0xa8>,
> > > +           <0 0x40001000 0 0x1000>,
> > > +           <0 0x40100000 0 0x100000>;
> > > +
> > > +     ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> > > +              <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
> >
> > Thanks for attempting to fix the PCIe issues. With your patch series
> > applied on top of linux-next, I'm still seeing PCIe issues:
> >
> > [    0.380693] Internal error: synchronous external abort:
> > 0000000096000010 [#1]  SMP
> > [    0.406491] Modules linked in:
> > [    0.406495] CPU: 5 UID: 0 PID: 106 Comm: kworker/u32:6 Tainted: G   M
> >                 6.18.0-rc5-next-20251113 #13 NONE
> > [    0.406499] Tainted: [M]=MACHINE_CHECK
> > [    0.406500] Hardware name: thundercomm Thundercomm RUBIK Pi
> > 3/Thundercomm RUBIK Pi 3, BIOS 2025.10-rc4 10/01/2025
> > [    0.406502] Workqueue: async async_run_entry_fn
> > [    0.406508] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS
> > BTYPE=--)
> > [    0.428362] pc : __pi_memset_generic+0x16c/0x188
> > [    0.428366] lr : dma_direct_alloc+0x19c/0x3d0
> > [    0.428370] sp : ffff8000810e3920
> > [    0.428371] x29: ffff8000810e3920 x28: ffff000080d0f810 x27:
> > ffffba4c6196ec48
> > [    0.428373] x26: ffff000080d0f810 x25: ffffba4c607b31cc x24:
> > 0000000000000000
> > [    0.428375] x23: ffff000080d0f810 x22: ffff000000c00000 x21:
> > ffff000082858948
> > [    0.428376] x20: 0000000000001000 x19: fffffdffc0030000 x18:
> > 000000000000000a
> > [    0.428378] x17: ffff0000823dae00 x16: 0000000000000000 x15:
> > 0000000000000000
> > [    0.428380] x14: 00000000ffffffff x13: 0000000000000068 x12:
> > 0000000000000100
> > [    0.449344] x11: 0000000000000000 x10: ffff0001fef99500 x9 :
> > 0000000000000000
> > [    0.449345] x8 : ffff000000c00000 x7 : 0000000000000000 x6 :
> > 000000000000003f
> > [    0.449347] x5 : 0000000000000040 x4 : 0000000000000000 x3 :
> > 0000000000000004
> > [    0.449349] x2 : 0000000000000fc0 x1 : 0000000000000000 x0 :
> > ffff000000c00000
> > [    0.449350] Call trace:
> > [    0.449351]  __pi_memset_generic+0x16c/0x188 (P)
> > [    0.449354]  dma_alloc_attrs+0x94/0x210
> > [    0.449357]  dmam_alloc_attrs+0x74/0xc0
> > [    0.469967]  dw_pcie_msi_host_init+0x100/0x300
> > [    0.469971]  dw_pcie_host_init+0x5e4/0x6d8
> > [    0.491913]  qcom_pcie_probe+0x5a8/0x838
> > [    0.491916]  platform_probe+0x64/0xc0
> > [    0.491919]  really_probe+0xc8/0x3f0
> > [    0.491921]  __driver_probe_device+0x88/0x170
> > [    0.491922]  driver_probe_device+0x48/0x130
> > [    0.491923]  __device_attach_driver+0xc4/0x190
> > [    0.491925]  bus_for_each_drv+0x90/0x100
> > [    0.491928]  __device_attach_async_helper+0xb8/0x120
> > [    0.491929]  async_run_entry_fn+0x3c/0x1e0
> > [    0.491931]  process_one_work+0x150/0x3a0
> > [    0.491934]  worker_thread+0x288/0x480
> > [    0.491936]  kthread+0x118/0x1e0
> > [    0.491938]  ret_from_fork+0x10/0x20
> > [    0.513092] Code: 91010108 54ffff4a 8b040108 cb050042 (d50b7428)
> > [    0.513094] ---[ end trace 0000000000000000 ]---
> >
> > I can only get the device to boot by disabling both pcie0 and pcie1.
> 
> I think there're some regressions in "next-20251114".
> After some time to "git bisect", I found after running 2 revert
> commands below, it can boot for both RUBIK Pi 3 and RB3 Gen2.
> 
> $ git revert b15ce3c0882c9cd2fbe4f87047874ad087b583ff -m 1
> $ git revert 03e928442d469f7d8dafc549638730647202d9ce
> 
> > > +
> > > +
> > > +     perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > > +     wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> > > +
> > > +     pinctrl-0 = <&pcie1_clkreq_n>,
> > > +                 <&pcie1_reset_n>,
> > > +                 <&pcie1_wake_n>;
> > > +     pinctrl-names = "default";
> > > +
> > > +     status = "okay";
> > > +};
> > > +
> > > +&pcie1_phy {
> > > +     vdda-phy-supply = <&vreg_l10c_0p88>;
> > > +     vdda-pll-supply = <&vreg_l6b_1p2>;
> > > +
> > > +     status = "okay";
> > > +};
> > > +
> >
> > [snip]
> >
> > > +
> > > +&remoteproc_adsp {
> > > +     firmware-name = "qcom/qcs6490/adsp.mbn";
> > > +
> > > +     status = "okay";
> > > +};
> >
> > I'm fairly sure that this is the wrong ADSP firmware. With the firmware
> > in linux-firmware, I'm seeing charger pd crashes and the ADSP constantly
> > restarting. Using the Radxa Dragon Q6A ADSP firmware which disables the
> > charging feature in the firmware works way better and does not result in
> > crashes.
> 
> I run the Ubuntu 24.04 base system:
> * https://ubuntu.com/download/qualcomm-iot#rubikpi3
> 
> Currently it boots well with adsp fw from RB3 Gen2 (from deb pkg:
> firmware-qcom-hlosfw) without crash.
> But I heard from next release, adsp will be customized, so Hongyang
> will make another patch to upstream the adsp for RUBIK Pi 3.

Then it would be nice to include the new path for ADSP firmware from the
day 0 (you can do this even before it is sent to linux-firmware).


> 
> Cheers,
> Roger
> 
> > > +
> > > +&remoteproc_cdsp {
> > > +     firmware-name = "qcom/qcs6490/cdsp.mbn";
> > > +
> > > +     status = "okay";
> > > +};
> > > +
> >
> > [snip]
> >
> > Thanks,
> > Jens

-- 
With best wishes
Dmitry

