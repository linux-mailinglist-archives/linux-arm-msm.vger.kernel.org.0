Return-Path: <linux-arm-msm+bounces-82473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E747C6DF78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F0E134E9DAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E8F34B412;
	Wed, 19 Nov 2025 10:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxGpRgFx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NweBRIUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B73934B1A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 10:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763547536; cv=none; b=kxhPJD0WiEdnG7y6ky44Lc81giTFGiYsORFmCLiVEqhcMeCERDzuTTkdJaivAT9/d7t71pgF2gNsjBTlX5K4QLm2jPb0XInEww8RwPQQ4EMnXeyFNKD3vylbjtHtMOCD+prvtlHTO1uI1qYgDQpDGapzt8DhWuO3ecPjGzcGTko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763547536; c=relaxed/simple;
	bh=VhSgzdNV7WCVeSkGShfpA5LWoIWfu8cfprJk9EwhC14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Klj1oHhi9Lngt6kh3gHVxiLZidITkQxrxvQYe/pz8JTyiyZY+laIypEtAnL22Ia3tCRMfuQILed4T3alaNE8eYtjYscLkq8XZ4uQWqe5mgfX8UbAReFmqjoQC5tpc84LmeKftW4N95RJ/TLyY3p1DzDEagkJ3zrtePpv2iEhAfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NxGpRgFx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NweBRIUq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ61atB827029
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 10:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssPxuKUwaS+R2jesyVGcw1YPKJtCnMaxKCTiW0rh3Rg=; b=NxGpRgFxLQzlTH8i
	6vPe5ZIGRG89Xwr1DKrvsdJ//1AZMVOTn8+NYr7d7n7SNf8XSsnKWPDj+BRac2jc
	kjNUP3VDdgHwt4lKh7HvNN5IVhBBjMeg8bLlw5ATKP/+mpJBpoGHJjCj7Aay6NoC
	iiUcCVUrGhudioqF+fsenSq+JoNLmQU0jNXLxiwpn1HHXhNzypoA9u9E6aYp1Xaa
	NBS/1yddP1VZDe6hj+XRJP3dqdT9zzp1b05TYLrD7mkkZDV2aSYHNwkF1dvJNpZK
	PBDQniT+xP9RyElb4oxzMiUFrlwcppkHhJRBZ6ZEWYPiA7SdlO7nLedlRmaAmn/j
	sU8YPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah88w8se5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 10:18:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee21a0d326so68967491cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 02:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763547532; x=1764152332; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ssPxuKUwaS+R2jesyVGcw1YPKJtCnMaxKCTiW0rh3Rg=;
        b=NweBRIUqHkfgu2swX+hS9nZLlm0NhVQddglna6vXRsNQAqjGTltOQnHBeJTmtKofYg
         zBbck38zSCucb3gtXMTpkHB+8NC69Xqp3QlR6OWwc6TpwSV+Q+APij2TFqCuazLQPOgQ
         CDx780m1qQkNOgZj+UKc4FK9Z+FR11vxOQGR121VhmVxjSXToE1NGGcFVqXR5I3QeiSe
         mAgT1qaJvcmSlzK+bO9GkNfYq9qq7k7KVv7ZAShSUgPG03OXyQEPj4bvAtzvnW+fwriq
         LzZ1s133ZDe1EOs9gW+PwIM4Rw4Rfpv6HpCozRZBLPMuKVLcj/EF8YhZed2c6gFedKq4
         Sc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763547532; x=1764152332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssPxuKUwaS+R2jesyVGcw1YPKJtCnMaxKCTiW0rh3Rg=;
        b=fjJdcSVy5vcdq4oTxQDo8VW/MKdmZ6bWSq/YfV5e/DeJ0XBD6KH8NQ+kkbcMMmieIr
         CJRmw7jDXn0/Pi/yNI9vXzExiALx1cmiJJi8+9s33IaR0mORNxpX+2RMT1ZWXAfgSLVM
         lY6HPP63L/a5ikSF8AuxLXXOma5TkdUw/cAFz+bDRxPj7cMIv3bEvs9/hl1z0ynjw05h
         XmZAGvo8TIzt5J9XiogJWvcCLiE638WG9CNkP2CrUqXjxMvb5DGGT1E7HMUne7OhJztI
         ccm3W1+sg8tsoCKAkxHm2jEkPRKkXrfTzJdEnr79rjMbC3y2la8dIc4JvkovxcRSNW9u
         owdA==
X-Forwarded-Encrypted: i=1; AJvYcCXFbt/lOKARP5ENwhpXCKkAPadjpdW+o2SZLRFaY6VbUgsd0Uk6paNghY+1jaaudJ7XHtThQu3QEGVvK5dI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9EEjV1ETkAFZ0EmVl03Zwg0p1RuBnscLOhXgDHLq/6OViQFI3
	yOPHPUqkrTPtlah8KOvfyw89oDl2Vae1XiHwXW6ioJWFOR+vTEE9JZWXAE4/SI0KeRV59z26gth
	wWBR7ob+h/rntUYycaEHQHEMCrV+SOX3bJj4h/EgL5HtGbVsFwlWRQNLtgkty7u4Ae3AG
X-Gm-Gg: ASbGnct9CIzckgYb2v3jeXgq56jRINgVyOpqsynFFlCkJw3ShonHGifGREK233kbrDl
	w3b7o6F2o3Y21zo54hsTYDOr6Dxi4OSz7sQCqTK3fTX2slmQsywvyNJxzvwyCJnU1I43rbqRbzf
	EZuL/75sBilJRwYIT3QmdPyJKc7T3vv6xPz/N0brr6OwcHwQI91K3KDjZ6q+QDUzFJbfiqpAhGs
	h7Y1+DUF2yRlSyAz4Labh6sOogRriKCgk8r0bf/9++9gPZ7EubKMoVXdOU93JOW36Lvp2yDRRWk
	4KoyoRDmQKS32wk7FeCz6A0kaQT09DgzigvtZjxoEUGLURIdrrxKxgh3DG+JaInvwzT3tARFDy1
	/noV8QOuE3vpLBvGZv0s02UzLyTJI03dNuL7SY56OeHT3JPdG3kd45eClBTm9rxgNgpMpW3R38R
	UsoHvSy4AwXfJsYDRfnWt/Qew=
X-Received: by 2002:a05:622a:10b:b0:4ee:2a31:6795 with SMTP id d75a77b69052e-4ee3ff9e675mr23458981cf.12.1763547532190;
        Wed, 19 Nov 2025 02:18:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQdYvV0O0R/qmDm//Oihi86tuhpDQvc67oR9A46zg/KZ6zs0e7RuIOanNWy5hUbGHENc/CAA==
X-Received: by 2002:a05:622a:10b:b0:4ee:2a31:6795 with SMTP id d75a77b69052e-4ee3ff9e675mr23458801cf.12.1763547531684;
        Wed, 19 Nov 2025 02:18:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405688sm4642579e87.77.2025.11.19.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 02:18:51 -0800 (PST)
Date: Wed, 19 Nov 2025 12:18:49 +0200
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
Message-ID: <pz4rcdghpg5y5qkhxyzqp5ccqy6k2hwldv3lbgcbg3z2np3az7@pk2y7scfs7qv>
References: <20251115-rubikpi-next-20251114-v1-0-fc630dc5bb5d@thundersoft.com>
 <20251115-rubikpi-next-20251114-v1-1-fc630dc5bb5d@thundersoft.com>
 <b2d4d91f-c726-4f5a-994a-086edc9caff2@mainlining.org>
 <CAEQ9gE=ztgQ+pGJVxKgk5dVWDSSfOG7r=s1cDa_x0_Zsf2eyYA@mail.gmail.com>
 <2iv3hsxcwlgfnpq75h4tfnbilurs5jelslig6gzknpb6lsupvk@xfxdofqw7b3v>
 <CAEQ9gEkke-tON2-oR9qSHgDH63gtDKu0S71XtMw=uwqRxSHkGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEQ9gEkke-tON2-oR9qSHgDH63gtDKu0S71XtMw=uwqRxSHkGA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA4MSBTYWx0ZWRfX1sUcNhsuqZfj
 oxVXo/V1bbS/FtZckMiI0NzYn7lPum05EmifEy/UclHmfbgBviR7wbh9/W8351WiwaP6IWe/4dU
 3orhztVjt+kA8hkd5shxfchXwm/8Sl/1BA0n/rG5HFuQOJYol7gLj3L4wjv4KzaGmQ/pRYqAvJo
 TykiztTu5K0JWF6JD9AflXErwXdyX/2OyfV7r+VBPW6MpcTYCly3bcegt9lA1aUEzGRr7taItMp
 nnmIpVsepcZ8ZUwu3IlCbRGe3WP6WYMYSty8GYED5/qAwJqM8kMRiqa6hy+3iTS5hgLQnLIW9iO
 K7lY1hHeY9jm+Dj88tCeWYLyG0dGOluG30A8vMCqchm/ktjmsy1AF96ogifJ9MPzlgmCGyPRFWf
 +xuqE59migd5e6OFHIZHEqYoG1uXmw==
X-Authority-Analysis: v=2.4 cv=YKqSCBGx c=1 sm=1 tr=0 ts=691d998d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fxJcL_dCAAAA:8 a=danhDmx_AAAA:8 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=Q_wpofNm8LuXx5RWPLEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-ORIG-GUID: _ZF-oLY_jCOxUqHqT8pb2_HHFNziNYhq
X-Proofpoint-GUID: _ZF-oLY_jCOxUqHqT8pb2_HHFNziNYhq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190081

On Wed, Nov 19, 2025 at 01:56:54AM -0800, Roger Shimizu wrote:
> Dear Dmitry,
> 
> Glad that you're checking for the changes for RUBIK Pi 3!
> 
> On Tue, Nov 18, 2025 at 10:08 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sun, Nov 16, 2025 at 11:36:13PM -0800, Roger Shimizu wrote:
> > > Thanks Jens, and Dmitry for the review!
> > >
> > > On Sat, Nov 15, 2025 at 9:25 AM Jens Reidel <adrian@mainlining.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On 11/14/25 5:34 PM, Hongyang Zhao wrote:
> > > > > Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> > > > > QCS6490 SoC.
> > > > >
> > > > > Works:
> > > > > - Bluetooth (AP6256)
> > > > > - Wi-Fi (AP6256)
> > > > > - Ethernet (AX88179B connected to UPD720201)
> > > > > - FAN
> > > > > - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> > > > > - M.2 M-Key 2280 PCIe 3.0
> > > > > - RTC
> > > > > - USB Type-C
> > > > > - USB Type-A 2.0 port
> > > > > - 40PIN: I2C x1, UART x1
> > > > >
> > > > > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > > > > Reviewed-by: Roger Shimizu <rosh@debian.org>
> > > > > ---
> > > > >   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> > > > >   .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1415 ++++++++++++++++++++
> > > > >   2 files changed, 1416 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > > > index 6f34d5ed331c..2433b15754fe 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > > @@ -138,6 +138,7 @@ qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2
> > > > >
> > > > >   dtb-$(CONFIG_ARCH_QCOM)     += qcs6490-rb3gen2-industrial-mezzanine.dtb
> > > > >   dtb-$(CONFIG_ARCH_QCOM)     += qcs6490-rb3gen2-vision-mezzanine.dtb
> > > > > +dtb-$(CONFIG_ARCH_QCOM)      += qcs6490-thundercomm-rubikpi3.dtb
> > > > >   dtb-$(CONFIG_ARCH_QCOM)     += qcs8300-ride.dtb
> > > > >   dtb-$(CONFIG_ARCH_QCOM)     += qcs8550-aim300-aiot.dtb
> > > > >   dtb-$(CONFIG_ARCH_QCOM)     += qcs9100-ride.dtb
> > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > > > > new file mode 100644
> > > > > index 000000000000..4c9016992de3
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > > > > @@ -0,0 +1,1415 @@
> > > >
> > > > [snip]
> > > >
> > > > > +
> > > > > +&pcie0 {
> > > > > +     perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
> > > > > +     wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
> > > > > +
> > > > > +     pinctrl-0 = <&pcie0_clkreq_n>,
> > > > > +                 <&pcie0_reset_n>,
> > > > > +                 <&pcie0_wake_n>;
> > > > > +     pinctrl-names = "default";
> > > > > +
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > > > +&pcie0_phy {
> > > > > +     vdda-phy-supply = <&vreg_l10c_0p88>;
> > > > > +     vdda-pll-supply = <&vreg_l6b_1p2>;
> > > > > +
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > > > +&pcie1 {
> > > > > +     /* Using traditional address mapping */
> > > > > +     reg = <0 0x01c08000 0 0x3000>,
> > > > > +           <0 0x40000000 0 0xf1d>,
> > > > > +           <0 0x40000f20 0 0xa8>,
> > > > > +           <0 0x40001000 0 0x1000>,
> > > > > +           <0 0x40100000 0 0x100000>;
> > > > > +
> > > > > +     ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> > > > > +              <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
> > > >
> > > > Thanks for attempting to fix the PCIe issues. With your patch series
> > > > applied on top of linux-next, I'm still seeing PCIe issues:
> > > >
> > > > [    0.380693] Internal error: synchronous external abort:
> > > > 0000000096000010 [#1]  SMP
> > > > [    0.406491] Modules linked in:
> > > > [    0.406495] CPU: 5 UID: 0 PID: 106 Comm: kworker/u32:6 Tainted: G   M
> > > >                 6.18.0-rc5-next-20251113 #13 NONE
> > > > [    0.406499] Tainted: [M]=MACHINE_CHECK
> > > > [    0.406500] Hardware name: thundercomm Thundercomm RUBIK Pi
> > > > 3/Thundercomm RUBIK Pi 3, BIOS 2025.10-rc4 10/01/2025
> > > > [    0.406502] Workqueue: async async_run_entry_fn
> > > > [    0.406508] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS
> > > > BTYPE=--)
> > > > [    0.428362] pc : __pi_memset_generic+0x16c/0x188
> > > > [    0.428366] lr : dma_direct_alloc+0x19c/0x3d0
> > > > [    0.428370] sp : ffff8000810e3920
> > > > [    0.428371] x29: ffff8000810e3920 x28: ffff000080d0f810 x27:
> > > > ffffba4c6196ec48
> > > > [    0.428373] x26: ffff000080d0f810 x25: ffffba4c607b31cc x24:
> > > > 0000000000000000
> > > > [    0.428375] x23: ffff000080d0f810 x22: ffff000000c00000 x21:
> > > > ffff000082858948
> > > > [    0.428376] x20: 0000000000001000 x19: fffffdffc0030000 x18:
> > > > 000000000000000a
> > > > [    0.428378] x17: ffff0000823dae00 x16: 0000000000000000 x15:
> > > > 0000000000000000
> > > > [    0.428380] x14: 00000000ffffffff x13: 0000000000000068 x12:
> > > > 0000000000000100
> > > > [    0.449344] x11: 0000000000000000 x10: ffff0001fef99500 x9 :
> > > > 0000000000000000
> > > > [    0.449345] x8 : ffff000000c00000 x7 : 0000000000000000 x6 :
> > > > 000000000000003f
> > > > [    0.449347] x5 : 0000000000000040 x4 : 0000000000000000 x3 :
> > > > 0000000000000004
> > > > [    0.449349] x2 : 0000000000000fc0 x1 : 0000000000000000 x0 :
> > > > ffff000000c00000
> > > > [    0.449350] Call trace:
> > > > [    0.449351]  __pi_memset_generic+0x16c/0x188 (P)
> > > > [    0.449354]  dma_alloc_attrs+0x94/0x210
> > > > [    0.449357]  dmam_alloc_attrs+0x74/0xc0
> > > > [    0.469967]  dw_pcie_msi_host_init+0x100/0x300
> > > > [    0.469971]  dw_pcie_host_init+0x5e4/0x6d8
> > > > [    0.491913]  qcom_pcie_probe+0x5a8/0x838
> > > > [    0.491916]  platform_probe+0x64/0xc0
> > > > [    0.491919]  really_probe+0xc8/0x3f0
> > > > [    0.491921]  __driver_probe_device+0x88/0x170
> > > > [    0.491922]  driver_probe_device+0x48/0x130
> > > > [    0.491923]  __device_attach_driver+0xc4/0x190
> > > > [    0.491925]  bus_for_each_drv+0x90/0x100
> > > > [    0.491928]  __device_attach_async_helper+0xb8/0x120
> > > > [    0.491929]  async_run_entry_fn+0x3c/0x1e0
> > > > [    0.491931]  process_one_work+0x150/0x3a0
> > > > [    0.491934]  worker_thread+0x288/0x480
> > > > [    0.491936]  kthread+0x118/0x1e0
> > > > [    0.491938]  ret_from_fork+0x10/0x20
> > > > [    0.513092] Code: 91010108 54ffff4a 8b040108 cb050042 (d50b7428)
> > > > [    0.513094] ---[ end trace 0000000000000000 ]---
> > > >
> > > > I can only get the device to boot by disabling both pcie0 and pcie1.
> > >
> > > I think there're some regressions in "next-20251114".
> > > After some time to "git bisect", I found after running 2 revert
> > > commands below, it can boot for both RUBIK Pi 3 and RB3 Gen2.
> > >
> > > $ git revert b15ce3c0882c9cd2fbe4f87047874ad087b583ff -m 1
> > > $ git revert 03e928442d469f7d8dafc549638730647202d9ce
> > >
> > > > > +
> > > > > +
> > > > > +     perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > > > > +     wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> > > > > +
> > > > > +     pinctrl-0 = <&pcie1_clkreq_n>,
> > > > > +                 <&pcie1_reset_n>,
> > > > > +                 <&pcie1_wake_n>;
> > > > > +     pinctrl-names = "default";
> > > > > +
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > > > +&pcie1_phy {
> > > > > +     vdda-phy-supply = <&vreg_l10c_0p88>;
> > > > > +     vdda-pll-supply = <&vreg_l6b_1p2>;
> > > > > +
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > >
> > > > [snip]
> > > >
> > > > > +
> > > > > +&remoteproc_adsp {
> > > > > +     firmware-name = "qcom/qcs6490/adsp.mbn";
> > > > > +
> > > > > +     status = "okay";
> > > > > +};
> > > >
> > > > I'm fairly sure that this is the wrong ADSP firmware. With the firmware
> > > > in linux-firmware, I'm seeing charger pd crashes and the ADSP constantly
> > > > restarting. Using the Radxa Dragon Q6A ADSP firmware which disables the
> > > > charging feature in the firmware works way better and does not result in
> > > > crashes.
> > >
> > > I run the Ubuntu 24.04 base system:
> > > * https://ubuntu.com/download/qualcomm-iot#rubikpi3
> > >
> > > Currently it boots well with adsp fw from RB3 Gen2 (from deb pkg:
> > > firmware-qcom-hlosfw) without crash.
> > > But I heard from next release, adsp will be customized, so Hongyang
> > > will make another patch to upstream the adsp for RUBIK Pi 3.
> >
> > Then it would be nice to include the new path for ADSP firmware from the
> > day 0 (you can do this even before it is sent to linux-firmware).
> 
> Thanks for letting me know we can post it here, before sending to
> linux-firmware!
> 
> Currently we're using the same adsp blob as QLI1.4 for RB3 Gen2.

I hope you mean the adsp from linux-firmware here.

> It's packaged in ubuntu:
> * https://launchpad.net/~ubuntu-qcom-iot/+archive/ubuntu/qcom-ppa/+packages
> * Package: firmware-qcm6490-msl
> * Version: 1.0.r00083.0+dsp103-0ubuntu1

It's some non-standard Ubuntu package, so it doesn't exist from my PoV.
I might be very extreme, but from my point of view, it's either in
linux-firmware (and available for everybody) or it's some downstream
proprietary non-available firmware, not packaged here-or-there.

> I heard from Hongyang that from QLI1.5, RUBIK Pi 3 will have a
> slightly different adsp than RB3 Gen2.
> Hongyang will make it public after full testing.

Great. Please land it to linux-firmware, I'd be happy to ack it there.

-- 
With best wishes
Dmitry

