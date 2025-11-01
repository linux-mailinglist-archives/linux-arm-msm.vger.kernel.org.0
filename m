Return-Path: <linux-arm-msm+bounces-79983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E49DC279C4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 09:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DF7A1898D02
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 08:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F2E299AAC;
	Sat,  1 Nov 2025 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaCLWGbT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YC8tWLR8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F0422FDEA
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761986283; cv=none; b=FsYc+B9Q6BbU1pC+ScF2rSCgY1u4GLqKGJ5igN9bAQ3WH4Ft/T5PVSQ8fVa1VvObMk8fflrpUDrSuP/o4gqinrHPlmmuux0HGLJi76mSwCrlZaoQKvtWn8gfFZ4hDpQx4GbUyg1v0JXgZ8dRdIYm+Qu0/OjnWAd8XCEYFgNlPA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761986283; c=relaxed/simple;
	bh=B2ghIyKqLMxX5AF0l0MFINOElgK5IAeXD8FLLU2AmF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BN3NGMFHGuH5uKN73b0u53ajjUZjdcJYqLRPNeKnUx7e6tlKXNTMczcWBp52GJSksRd3be2Wla0jEkZQRYjbvH16NxJWo8dxyUPjoBFEfr/0gVGZXrle6yiPzJZpHOMxwJyltQtQgeeAd+W1vTqcpF4PotwiZnkTR9pra7fTS+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaCLWGbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YC8tWLR8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A14lgUL602005
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 08:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sXo4fy8fst8E1gXK9bLCWQFr
	IX+3pJ0ycCO+bUySUYU=; b=iaCLWGbTYuPAHMxgjmFfKQ6L722z/GmU3t8HblEg
	mW4IL6GL2x4jyT5Z3yxL9VAJ4/9aQCxTPGb96QnUs6hxjt8NWIwXVS4BVQ4vLsBN
	k9P1a6RDL5fou+Lh7FU2dkT5KhafkoJyAHR+Ul+kGFK6VkxbWQuF0TwcwNKRqGqi
	GL1km1W0NPar22eXHoaL5a23mOTuOwAB42HJDgEeE9THjl+fGXAqMrlAlgHErow9
	p4S/igN97iEnZEZVQJOTlC4nW/HwJjxZCJCG4wwfiB4hu0ieptq9icLQ0aXbLj5p
	o4TvWmb57/dv3uK9VM3VWjxXTOJi9j6v676M6GyFmg+BIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bg9g8yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 08:38:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8a3d0fb09so39485371cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 01:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761986280; x=1762591080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sXo4fy8fst8E1gXK9bLCWQFrIX+3pJ0ycCO+bUySUYU=;
        b=YC8tWLR8P3hLsynYbeKt1oXdaSeR3g8XhDCp2dfZnCtRljR2uCQMCNEOHp0AiMlRlN
         TehoG4mwfooujPxBtelbAy23jthX0rPf6QLyRyStdjwXMCpJ1gQf1cUAvNaa8VHKbV9d
         Tz7+IOMJWOZifX9x+MjeVW7s+zqrJtmmr/dRkimBecU4ESk+gSAYmU7iYhqGNf3a7VH5
         HxHuez761LqnmiDvQnJ4xkODDzhIJxgWSu3R/rH6sb4j23JFNHEepbvTa7XJLQwWA9co
         Hsm/VLS8f3Fg48K4a3zvWTZPkqJY+x1rLd4mGPmL9Ya0SsgeAmao4UNP3HHkPxJ7mZiE
         ToYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761986280; x=1762591080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXo4fy8fst8E1gXK9bLCWQFrIX+3pJ0ycCO+bUySUYU=;
        b=ou+Pvk83mpaGUsVPgL8vnenK3P6h/ICV38eZWCTv5to1AitILe4IXmvkUxapRQArJF
         UVkU8XyJhxkNQVHIlQpFLkcz/ZKTS+UZMRprACwkdr6xcQNRsB5AOhpnHSgSTqsEUOWW
         mP+ffIUiUp42pdYNQt1m4Wot2j6K2RL04RrHXyywjfm3PD5Ts+rYRStjc0mLO4O7jKoF
         5SPDrxkqhxML8HnSu9ZsydPkyQ9hraPy4oet/C1W+sjBQugu2MzsWO6HL3XU1XySiKrK
         eSwxxeosB2b+KBtNc28wR4ZkHi7yejJpBM002ZunYPqDfeK1y05q/W8gAjm2DI8xs4S0
         u1RA==
X-Forwarded-Encrypted: i=1; AJvYcCXIxf0n4tcEFQ2QEhKmoIT1eC93+FdKC417n3CJHDsVrOTh+fN5J64EZenOo+pC47XSejLmJeL5Dp6y/l1n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7M3WIl0mDx1yBxRSJvSKWcI1i23V180muEkANZGKWgo4gQwZ1
	NkEXwkjIU2nt2ka0aEPKN9WhU/bf+VMWQlzjgIAe0R1TRFciff0yZCdHtZ0nQsTHfwFUpTsTDgV
	xu3q1r5yi35YmAYNy3kHRFy7qQ9sGxPMim1F5sDrIexM1apMAMmLzKGiSvxW2+Lhew96cMA7pVG
	2V
X-Gm-Gg: ASbGncvrKn3P3YDzqOTk320gVFwb3JEYPMC9JlmE3x2RkRF/h+k3qc++LlTzOylOs+2
	JEzNDf01D7SjyeAMagrwHpsY0RJ7I5JWmRGdCcitrK0ZnNZJszWqZQyLj6UC6P6x8mVJTNnOOs5
	CuVC7qIU0Pe2ecnQn2GvEDHMbjnrE1BKuIwTRx32T9xBLHXnZhbZH4jNU5+ZmZa+Zdj/YLJttxL
	Phm2LNqRG5XLc1MuUe0raUvj5m0rVOKzrYJoUxL7798W5sdlpESTDtdJRu8n8ZNtKazd4dbe6lz
	Y53uHw/ILFTJTNAbzYZ0HF9EOp+93UsN0UZKbMYAFMf+fTLrbs4zM0sYwZntfyfP8QvUnp73JMs
	8YZO5Axgwex8aaBmdyHHPtA6WUrtt2xy0SAGgY2YdibMzbH6Bdo6a7+9Rn4DBZeoR3Nf28hoiXR
	trWkijXD1bxb+v
X-Received: by 2002:ac8:59cd:0:b0:4e8:83b8:9e7f with SMTP id d75a77b69052e-4ed30d84c58mr70806401cf.14.1761986279911;
        Sat, 01 Nov 2025 01:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqHsaPCt32BY31UVJhvuVNgCUMk9C9HBiejqmAWus615PTMI2JOkdfEsIXxtDBrlNjmnU45g==
X-Received: by 2002:ac8:59cd:0:b0:4e8:83b8:9e7f with SMTP id d75a77b69052e-4ed30d84c58mr70806271cf.14.1761986279461;
        Sat, 01 Nov 2025 01:37:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5941f38d03esm1060060e87.20.2025.11.01.01.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 01:37:58 -0700 (PDT)
Date: Sat, 1 Nov 2025 10:37:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: andersson@kernel.org, casey.connolly@linaro.org,
        christopher.obbard@linaro.org, linux-arm-msm@vger.kernel.org,
        loic.minier@oss.qualcomm.com, rosh@debian.org
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
Message-ID: <wq6q2xem77ul3hxxptmybpeexj7vpbdujtlizzzpankdwu5564@ug7bpbromyms>
References: <4krvjztwy56ycnbrynz2ok4hs2vwehdg4ta7rdueccgn3hgvqp@sgxqw4pvoq3j>
 <20251031092727.656939-1-hongyang.zhao@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031092727.656939-1-hongyang.zhao@thundersoft.com>
X-Proofpoint-ORIG-GUID: 1IheJrN_K8JzWNcgXE1XFTMSSqHdEK90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDA3MiBTYWx0ZWRfX469rTEAQ54bH
 nkS0LSu3MczmOScGU8VBAf7KxWccdezsF2VaOSqrUt2VZma4ZDAUxUUZifxEEvzBWvt7Jobzy2S
 lxVlyfDdoyjxdoJMx35nz9bjB9DsjCg8twmv/1Q0Fjp15lj+1ThhD+PJu1vLaaga2C+Ot/Fju8m
 MWHpNUkXsQrofXJ/zUfyHqpqwxhCThHsgHp91KyKuV3rIwPvcoK3euDGUZKICFM2FDXC0QdQbDb
 i1REnQx9t/rHHirvD/qpgtaHBhFHfzzCXEyLGIkXuUWqFFe2Grm9T3oipEHvQ5D8iqnhuHZuR4a
 +0qkJEhIDlOk0pblvdQ+pGyu/24OebisPY++YEvu/TKrS9ZwskL0R98JJq8JOZUlY/uAdd9wpMl
 NB1+zDGkmTfoZP4UD2FQ1j+xkXw+cA==
X-Proofpoint-GUID: 1IheJrN_K8JzWNcgXE1XFTMSSqHdEK90
X-Authority-Analysis: v=2.4 cv=TaKbdBQh c=1 sm=1 tr=0 ts=6905c6e9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=G5XV9haUvk0ty_mN_5oA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=j5gyrzqu0rbr1vhfHjzO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-01_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010072

On Fri, Oct 31, 2025 at 05:27:27PM +0800, Hongyang Zhao wrote:
> > On Sat, Oct 25, 2025 at 08:27:22PM +0800, Hongyang Zhao wrote:
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
> > > Cc: Casey Connolly <casey.connolly@linaro.org>
> > > Cc: Christopher Obbard <christopher.obbard@linaro.org>
> > > Cc: Loic Minier <loic.minier@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile             |    1 +
> > >  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1390 +++++++++++++++++
> > >  2 files changed, 1391 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > > 
> > > +	vreg_lt9611_3p3: vreg_lt9611_3p3 {
> > 
> > regulator-foo-bar-baz, please. This way VPH PWR doesn't stand out.
> 
> Understood, I will check the entire device tree and change:
> vreg_lt9611_3v3: regulator-lt9611-3v3
> vreg_m2_1v8: regulator-m2-1v8
> vreg_sdio_wifi_1v8: regulator-wifi-1v8
> ...
> 
> > > +
> > > +	vph_pwr: vph-pwr-regulator {
> > 
> > Otherwise you currently stuffed it in the middle of other regulators,
> > although it doesn't belong here.
> 
> Understood, I will move vph-pwr-regulator after usb1-sbu-mux.

I hope, you are talking about regulator-vph-pwr now.

> > > +
> > > +	led@1 {
> > > +		reg = <1>;
> > > +		color = <LED_COLOR_ID_GREEN>;
> > > +		function = LED_FUNCTION_INDICATOR;
> > > +		function-enumerator = <3>;
> > > +		linux,default-trigger = "none";
> > > +		default-state = "off";
> > > +		panic-indicator;
> > > +		label = "red";
> > 
> > So, is it "red" or LED_COLOR_ID_GREEN?
> 
> This should be changed to:
> color = <LED_COLOR_ID_RED>;

So, what is the actual LED colour? Also, is it a single multi-colour LED
or several separate LEDs?

> 
> > 
> > > +	};
> > > +
> > > +	led@2 {
> > > +		reg = <2>;
> > > +		color = <LED_COLOR_ID_GREEN>;
> > > +		function = LED_FUNCTION_INDICATOR;
> > > +		function-enumerator = <2>;
> > > +		linux,default-trigger = "none";
> > > +		default-state = "off";
> > > +		label = "green";
> > > +	};
> > > +
> > > +	led@3 {
> > > +		reg = <3>;
> > > +		color = <LED_COLOR_ID_GREEN>;
> > > +		function = LED_FUNCTION_INDICATOR;
> > > +		function-enumerator = <1>;
> > > +		linux,default-trigger = "none";
> > > +		default-state = "off";
> > > +		label = "blue";
> > 
> > Likewise, why is this blue?
> 
> This should be changed to:
> color = <LED_COLOR_ID_BLUE>;
> 
> > 
> > > +	};
> > > +};
> > > +
-- 
With best wishes
Dmitry

