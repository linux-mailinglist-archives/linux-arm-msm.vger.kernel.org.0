Return-Path: <linux-arm-msm+bounces-89571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE4FD3A039
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E45AC30069B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 07:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDD93376B0;
	Mon, 19 Jan 2026 07:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cpRtWDbv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeTnsd7z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A38B33710C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768808609; cv=none; b=rirUtMHN9QDURizb0tURoiEs8LL/1+SHQ4aPLQyaxkDpgAE7CNM4Z01FkCyKpIbj+NfjU9FW7w+yC8FSXh+7nttU0FEzIF9qVEKOVEj6zPJfKEa/9PZuYq3yjY5qxr9w1EsvSFhTcNRZaMQkzsLHuOrUIa5gLthkIc2REnnnnq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768808609; c=relaxed/simple;
	bh=/swWTUUaewJol5eLVQZeUEHeoi895l1wUo5YFe6FDUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmPIUMp8IHl7ispr0t7WvswjzPE6l4ZEvV8Vw5pZ8BD78nUP1x9ZB+d6foyG9OZ1slR/RJPUQgpynjLE3edfyk5eaAYQ0xepQhzqJhhY4z8fT8v8WtjzlHi6+zJjxpB5nyDXwbtr/+QUluVR0LlEZCK+Wy9krSMsW18lC6jHFyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cpRtWDbv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeTnsd7z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J1dPFl4133987
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sqs/F/2/YOQrc9DJeKhuSakRiBHn7pAQ8sQntrUq4a8=; b=cpRtWDbvofJaBwHp
	aYflmSX3GJifj1zmlqVCtBttzW7ihBsAbZGz4VTDTZQAaNXpC7T7BvKsygg6u4z1
	fIqKM2EBphdgdAXx5Ut1f5yZIMeq2nsobJ2t39zxC0IoncJDFwccO9YgvBLdrWcV
	ZbnA4ydw59TtDSf3YaXi2+eB7tpBVZnAOuG8cybl43nIEsey0/1iblVjnGjJ2L/i
	0mGPXI/5fafGpZBwqlx1K+VbJJOhc0lh0b7eYzRD7IJW4lv5Auhj8B4UPI5o0ZHy
	0Uga9F7erPH+9pgRLz2hSv1fwdsD2ZetzAV/leF+jLUEcsTCS/bcO5L2Jlgj/kxL
	j+ZOSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4yruu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:43:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5311864d9so874275985a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 23:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768808606; x=1769413406; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sqs/F/2/YOQrc9DJeKhuSakRiBHn7pAQ8sQntrUq4a8=;
        b=HeTnsd7zpU/fpnO921v9dTfpp4N2mblVQD7BGVdU7GrvPGFCyiyne2auPektA0hX6Z
         ZcnoZ5N2m5eIFLAiZnNri8w8v/2ERvydQifgpsMXaHMCNMwRu7NuMOQXka3pJC99SzQc
         YtS5jvuqyzB3NfT5hUdCteVNToTAfcS6aA/8GdcHeFyA1WcJq12xaEmpsGGKdT2xU1pA
         PkGStK5RHeybcy1u9+sgmD64ilSgB/BQ1kCsfqOOmxf2Ko1K0q9uCFLwkCM8A+FYpI3w
         QY6ML5Bh+alA/+nIZDUgx3+CkT4NAXCGnKSH8Zn0ymC6wYym4IPKO3cWcj7vD1oX4kOW
         WRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808606; x=1769413406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sqs/F/2/YOQrc9DJeKhuSakRiBHn7pAQ8sQntrUq4a8=;
        b=opb5pSirC5Wq+OZVMZDMk+ueOHdgH1ef8QaXSrOOFojjPayBijY6RmarFPpOqiZY4c
         YwKd9WqK7F9WufxmHGSVfCGqTr9yQ+is1WFP5n0F+g/w/pusYQ9bVQVJsn90SqdnOVdK
         W6hB3uL0jIqFTLjpERq97uu1US8qTEMn+BmpfnezogCQo1EeI+6BDp38YdEMnwrFzPil
         n8CB5PVZ5/6Bbm2lne10nHIv2BnA63pLIAJg9blfg2hLqJQjOFCricwrK13QJ9kMadoD
         AXKHzfZEZyp8pwtJFed1W81bQ7Llz2PSpjPUih+WM2IlxNIZNj345WD0UvNpnZ6WQk8m
         h+ow==
X-Forwarded-Encrypted: i=1; AJvYcCU8VdkFC1GXpoIHKME192sEkH41MRj8ut/DE3v3b8EYMCmIksMC6RTBy/RsvxUTUr/tFOPdo8VZaRsTNaCr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4H4EEMb3bTTIUFhUmMeyzwepi4foiELGF2sVnP1oGPzYKeifA
	c8zRBs7gyprcK/0+Z1WBZc6NTs924qadCkNpExsJm7GYAVGZcwiU0+cD2HRUleT4hw65Ib6J9H3
	rIi3qY19icS1R/aGpG7MyqEcBc9z5UiywxKMPZ7WGqNu1ZFNBgQG4WP0CbIhM6OaKU85h
X-Gm-Gg: AY/fxX5WU6eYD5tfUjByx1Nve/AVScY1Qjxw3M1eWh9MpY0Gk3dvKcWqeEZ+Q06bOTq
	9CXyvspynQQPT9vvmgmEO+OiK4WhDlh1rPdmztfpgGFU/pW4RpJ9BteJLbSa2A/xhtgncemF129
	+UPme/lMQBLBggnB48wlvEe+q8WzPCEQMrjy9aldpNcHwOZk6/KOiEYHe1yiX+Q7rU7+0WRRrcY
	ToysCwy912iOug8sTFVQLiSkB5i2vvH3wPsLI8wlLhUNuk8wLV4qaxD9HcR+NUotNaeWTRmTeT1
	335vtlrBho/lchFoe239ETo71d9AMkOsYqVGzaxmbqNiZ681VHjGjcMnn54DlrY+ON1ywIGq+7s
	UlVWdDeZ0xB+n5aRFO8AiuSrRUSlKpePUjO5+G5yybvgzddtabIAlo3yETmpn8t2zzVDzS5u5Ux
	muGAfpZv23o39UbacFifPCCco=
X-Received: by 2002:a05:620a:294a:b0:8b2:598d:6e89 with SMTP id af79cd13be357-8c6a6770654mr1586313085a.45.1768808605680;
        Sun, 18 Jan 2026 23:43:25 -0800 (PST)
X-Received: by 2002:a05:620a:294a:b0:8b2:598d:6e89 with SMTP id af79cd13be357-8c6a6770654mr1586310685a.45.1768808605214;
        Sun, 18 Jan 2026 23:43:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33ef74sm3097431e87.17.2026.01.18.23.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:43:24 -0800 (PST)
Date: Mon, 19 Jan 2026 09:43:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <yphbxji7vyeglpejpgoia56ch5xco4u5lripjavz2cufe757sx@4rphsnh2sq7c>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com>
 <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
 <CAHz4bYvVfQke_aUx_mVO2QkCc5yr_1Cn35N6hPi1if=X7iM3+g@mail.gmail.com>
 <ftqb2uxp6yk73djyo3psehhqq5wamimtissgfehhziwbkprl4c@phftum3m3sdy>
 <CAHz4bYtYMZQSdw4XKSB06fT2MzZHu=AgdXGrZ73XVXi1sMwyyw@mail.gmail.com>
 <zkvwy56jkya6eogwqlmbhoo64zlzatxsdtkhy4hqfudoqtfbkg@fwiy46l3c337>
 <CAHz4bYuE6LS=+3272x2qat7EyjgVuODC7Otz_f4zP78ZQ=BWDA@mail.gmail.com>
 <53dojwu2xfshqaii3dzmglhjsne75jyf5r6ycerbr32w4v3rlf@umkbjczudotn>
 <f2a9a7f5-f406-439e-8d86-94e98b2e18e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2a9a7f5-f406-439e-8d86-94e98b2e18e9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696de09e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-rT3G0NTX_r5oteG3ekA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2MiBTYWx0ZWRfX1AAFSU2YUs4c
 msQswCtdTzbFLRgJY4MOq0XnsEPwVUpNcQCpCkg0VGeuZDn/GzfREgRfjyOZZh48mepvvHnWsdl
 ySx6IMrX4YW96aJMkeKkW+vJJaQeU/fcrnqwIDYypriDIV5kmfRm2D/0wqqvJ04MfIMz/3IM534
 kb484iMmcfj8R/TL6ltjLPjhfcKu+z2oK+RE6ELa5b9AguCY9Re4QKOIqgnD6N8FM78hG9f0yDd
 IVp8+r/IZHQ157IklXSmhykPtEEaeU4105YsZrTctUQn9Z1YRzBktq9x6858MaZYxd5K16Hndm3
 /2IdnEx5N+3eOUywD6Q1dLtfeH4+vCMWBokxhqiKt3WASKsF1OIMGPZRIHGD1Um8lLRCDkC1E5C
 LiF0Ezl2DLXJYqyoYCpjAAIz5vwdNPlVj17MiAUpvjRgJmdqYsVMvhd4V2TaoKhg5ckXHiPv0Br
 ZyUuoz9FvqYwLLl0Jbw==
X-Proofpoint-ORIG-GUID: EGwBEYTQ_qB_uWQDJ3y2B14yex3QYl0j
X-Proofpoint-GUID: EGwBEYTQ_qB_uWQDJ3y2B14yex3QYl0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190062

On Mon, Jan 19, 2026 at 01:06:28PM +0530, Krishna Kurapati wrote:
> 
> 
> On 1/19/2026 12:01 PM, Dmitry Baryshkov wrote:
> > On Mon, Jan 19, 2026 at 09:42:03AM +0530, Swati Agarwal wrote:
> > > On Wed, Jan 14, 2026 at 11:39 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > 
> > > > On Wed, Jan 14, 2026 at 11:10:26AM +0530, Swati Agarwal wrote:
> > > > > On Tue, Jan 13, 2026 at 4:59 PM Dmitry Baryshkov
> > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > 
> > > > > > On Tue, Jan 13, 2026 at 01:32:41PM +0530, Swati Agarwal wrote:
> > > > > > > On Sat, Dec 20, 2025 at 9:47 PM Dmitry Baryshkov
> > > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > > 
> > > > > > > > On Sat, Dec 20, 2025 at 12:05:37PM +0530, Swati Agarwal wrote:
> > > > > > > > > Enable secondary USB controller in host mode on lemans EVK Platform.
> > > > > > > > > 
> > > > > > > > > For secondary USB Typec port, there is a genesys USB HUB GL3590 having 4
> > > > > > > > > ports sitting in between SOC and HD3SS3220 Type-C port controller and SS
> > > > > > > > > lines run from the SoC through the hub to the Port controller. Mark the
> > > > > > > > > second USB controller as host only capable.
> > > > > > > > > 
> > > > > > > > > Add HD3SS3220 Type-C port controller along with Type-c connector for
> > > > > > > > > controlling vbus supply.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > > > > > > > ---
> 
> [...]
> 
> > > > > > > > > +&usb_1 {
> > > > > > > > > +     dr_mode = "host";
> > > > > > > > > +
> > > > > > > > > +     #address-cells = <1>;
> > > > > > > > > +     #size-cells = <0>;
> > > > > > > > > +
> > > > > > > > > +     status = "okay";
> > > > > > > > > +
> > > > > > > > > +     usb_hub_2_x: hub@1 {
> > > > > > > > > +             compatible = "usb5e3,610";
> > > > > > > > > +             reg = <1>;
> > > > > > > > > +             peer-hub = <&usb_hub_3_x>;
> > > > > > > > > +             #address-cells = <1>;
> > > > > > > > > +             #size-cells = <0>;
> > > > > > > > > +
> > > > > > > > > +             ports {
> > > > > > > > > +                     #address-cells = <1>;
> > > > > > > > > +                     #size-cells = <0>;
> > > > > > > > > +
> > > > > > > > > +                     port@1 {
> > > > > > > > > +                             reg = <1>;
> > > > > > > > > +
> > > > > > > > > +                             usb_hub_2_1: endpoint {
> > > > > > > > > +                                     remote-endpoint = <&usb1_hs_in>;
> > > > > > > > > +                             };
> > > > > > > > 
> > > > > > > > Are all other ports disconnected? If so, why do we need a hub?
> > > > > > > Hi Dmitry,
> > > > > > > I didn't understand your query, can you give more context to it?
> > > > > > 
> > > > > > You have described one port of the hub. How are other ports routed? Are
> > > > > > they connected to outer ports? To some other devices? Unconnected?
> > > > > Hi Dmitry,
> > > > > I would like to put it this way, USB HUB has 4 ports but only one port
> > > > > of the hub is used between SOC and Type-C controller.
> > > > > Remaining 3 ports are used by other devices.
> > > > 
> > > > Which devices?
> > > Hi Dmitry,
> > > 
> > > For Lemans EVK standalone corekit board, there are 4 ports as follows:-
> > > 
> > > 1) p1 is connected to type c port controller.
> > > 2) p4 is used for the m.2 E key (NFA765 Bluetooth) on corekit. This
> > > isn't used on a standard core kit, only if we optionally replace the
> > > wifi card with the NFA765 which uses USB for BT. standard kits all use
> > > UART for BT.
> > 
> > Nice. Hopefully Mani patches will be landed soon and we can describe
> > this one properly.
> > 
> > > 
> > > Remaining 2 ports will become functional when the interface plus
> > > mezzanine is stacked on top of corekit.
> > > 
> > > 3) p2 is connected to another hub which is present on the mezz through
> > > which 4 type-A ports are connected.
> > > 4) p3 is used for the m.2 B key for a 5G card when the mezz is connected.
> > 
> > Please add a comment for these two, e.g. routed to the connector ABCDEF.
> > 
> 
> Hi Dmitry,
> 
>  Thanks for the review. Can we send v4 with the following changes:
> 
>  Add 4 ports each to hs and ss hub nodes and link the first port to Type-C
> connector and add comments for the other 3 ports. When M.2 E conncetor comes
> up, we can link the second port to it in a different patch.

Sounds perfect, thank you!

> 
>  Let me know if the above is reasonable.
> 
> Regards,
> Krishna,

-- 
With best wishes
Dmitry

