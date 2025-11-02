Return-Path: <linux-arm-msm+bounces-80047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA32FC29832
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 23:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2EE2188B3E9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 22:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F243B1F0995;
	Sun,  2 Nov 2025 22:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fa4ALggh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARChvAcL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B92157A5A
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 22:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762121612; cv=none; b=A/W+qf1M39BxyjiIU7DigS3ct1KKONEP0hvwBIkoSbVvN4QHnpdTodXwBXW1CstS02TR44oz2Nltr6Mwo2R6i/WYTr7TZCRU/sbnCHFbFVgKxYn8FYSNQzqGLBffmIjqL4b4UnTv8aQNI2kkvIcbnTTeDf1XWXFHpyD639GU0vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762121612; c=relaxed/simple;
	bh=9GaFg2FlZNCHl8bjaUttlc/uM8HIOrFoao04RKsXgO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbIKkcqx8uqy42V6gJbfZVK1I9wPA30lO7WVNn89yjEVdVYlwivboP+lUIVFLrtKoivGSTndStVrE0vjCJwjMHLvHmeLlVW8kAR2Wmm0BD5s0OUz0kozFOXBB+4REIjx74eMJDTKTdO/0JhgsJLFG6x/WsFifv3UM/xcRYrHqcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fa4ALggh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARChvAcL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2GfbVX690431
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Nov 2025 22:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eaiC0cN6kteLvNkdOblG49O3
	LyeqTFUrsuhfQK8kyOg=; b=Fa4ALgghAKsdGRDr/eQpJRAgMSxvF52ZGQZqZaMR
	iN5vGZzggykU28EqZQNkWAGEJO7XAISdk5ujlyrh9OMqrWKgyyOZRi7tzKK3BAJ0
	cbICttzTGmcd0hHgnCsMmtoS0hPh1amOBSmH4bJ+gUvPriHJOEy7TlvAlNL425kn
	/kNKnyf/ycltkm2bc2W967tMuxUQ0eSWfqtZvl2FgCi95a3rPbANxakRlYItdBGc
	WnEgeOHnDNGA729ft5nGDKMbs8uz4KHRmyvDUI3SV5p8ln6qXSGVbBZFpIXpEzqG
	zjiypyTdTrAEzKQhjYHUUclZOoz9Yuq5hcyBfs04Ln1VyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a59hhjr81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 22:13:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8a5b03118f4so1316099885a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 14:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762121609; x=1762726409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eaiC0cN6kteLvNkdOblG49O3LyeqTFUrsuhfQK8kyOg=;
        b=ARChvAcLz2K9wmsqVHuI5mWEhTPWhDrV0EeAeQM0+/rXK9lsnKPkgNMjqLkmv/m3H2
         3oz3SX1kStqAjNursnzDR86yyu1Aha0SpS17KaDs+lyxDOA1tee6WlhkUhbmu5sK9Bjb
         Vy/mevS25UFB0dNbgDUkHZtrZKJm5puSYhiMOTrBMf8OryDs/yF6imJ6L18pQWjg7t8B
         MRQ3nzvAkehjb+Ej/15YYlznnxMVYzlVxJZqoF8qlLIPi9D5FiRSJbXKUHWzJjqnzX4W
         mnOpcwCs3DtcXUCO/LpizzuC6+2rNKmADzzaZgp3Kz4uwuBzMrda2Jl0EgD2Wi51fDRt
         P9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762121609; x=1762726409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaiC0cN6kteLvNkdOblG49O3LyeqTFUrsuhfQK8kyOg=;
        b=lSUb+BjAbUsOIPWYMLnH6V6pSCPJYv/EMiJL0EnSZTHx8kDKjJVnJ0hojQl7b5mnN8
         /h8y16aymP1w//c6+A/YkQ/4ktDdBnn6xFhtlbx529qfmbR3bMaWyJePwjnkWHyghYoL
         xr05QLsyYfKuqy6gfz+2ns4XGN0h8poNCv13VIsQnqSZBwd1chRmWMAOVxX6o34Nq9cR
         2eMnZuOByFgInp+Y6AO3Z6nFnxSpiTm4llTeqhIciPR8PQXVS0Gg/2OWGbtc0j78Fit/
         2tJNb2ao0p23ib8LvM+4cdNqWiD6Pk4m1F3ofe75pBKkzdy16Ik6TT1PrkSANFv3WRJx
         5P8g==
X-Forwarded-Encrypted: i=1; AJvYcCV1RYSa+dalJbG+EeC7sHaHPnWZK7w+UHLA407A5fwIX7KzSdHTRumVImPOQQ0e6z6LmxzzDDBUranRHHlg@vger.kernel.org
X-Gm-Message-State: AOJu0YwiOjInoFYVoxLWjCsOZ5+qo+pvJAqLRwNGCcBeFAgrc3MQPZOK
	edc6V0+9z+I2F5weHvXT0qrgSuCwEHiGa9OezjJvOQbhqS0bD1n+HNaeELgkpco+Jgp8/9Wyuph
	LxHCvmlqtZjQ51aUD/dKBEawGQmw7jTq0OeMA6OE7rwF45hGZGDw/VtmhzQ6nRcvb74bS
X-Gm-Gg: ASbGnctYdmy1143qM+5S7anRIp63e83AFOQkMilqbpOUeZMcNhlHhAQu7SYhPwFt8g3
	A+5Ul5dS1mnIObx3Hax+TpMTvbUSPYqdi+8ser0XseFRrlpQ0mpyA61qZvaMjOy62Ip47wWbQNt
	6EjpuFS2KzTjf2LCHfOJj79sOnWA+CQZqM5AoFHLxlWdg4d4tkD1yiMcDBtq7p/hUK04RP/3BKx
	3mz46nIS8ODxOChNVqnKi7YnP9TGKLgujerw6khAKbkadhUjNn0Fcb0lf+YQUvhpALGT96iRbmk
	NAhqGAvvwhTxjNZ6LNaKdHUqCrJdprBrv3xyQPuZeXrjZLwcfS9GIgZ3m1pXnjb/uL2ZYaymP/E
	hBRbq5e2nUZT6cV3XgkZATzM4Z9yPytHYOc4HR3IZH3/XI7ppw1JQhgBoZzaGUBTuoLur8xX/DD
	EoVRmJBANBEFzb
X-Received: by 2002:a05:620a:4482:b0:8a3:2850:5771 with SMTP id af79cd13be357-8ab7cc34d0amr1358213685a.34.1762121609142;
        Sun, 02 Nov 2025 14:13:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQluJkYiq8XAAa9dCuzhF07+Z66lkULczH6X3sCpeZVC9lZgtgzFzOfLM4JQZcwWOhDghVNA==
X-Received: by 2002:a05:620a:4482:b0:8a3:2850:5771 with SMTP id af79cd13be357-8ab7cc34d0amr1358210385a.34.1762121608595;
        Sun, 02 Nov 2025 14:13:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1bf909a0sm18807221fa.1.2025.11.02.14.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 14:13:27 -0800 (PST)
Date: Mon, 3 Nov 2025 00:13:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: andersson@kernel.org, casey.connolly@linaro.org,
        christopher.obbard@linaro.org, linux-arm-msm@vger.kernel.org,
        loic.minier@oss.qualcomm.com, rosh@debian.org
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
Message-ID: <sokypdm557dik57ayif4kpgd3vk5xgvzpoaarf73barl7w3w3o@ed7oxnbhq2gb>
References: <wq6q2xem77ul3hxxptmybpeexj7vpbdujtlizzzpankdwu5564@ug7bpbromyms>
 <20251102030900.107190-1-hongyang.zhao@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102030900.107190-1-hongyang.zhao@thundersoft.com>
X-Authority-Analysis: v=2.4 cv=V6lwEOni c=1 sm=1 tr=0 ts=6907d789 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=uxXYkmxfAAAA:8 a=Wdb1h0LgAAAA:8 a=xNf9USuDAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=4U6nloTcrdyxzaaDqzEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=-ntWnliNHk6zkOntsdg3:22 a=j5gyrzqu0rbr1vhfHjzO:22
 a=cvBusfyB2V15izCimMoJ:22 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-Proofpoint-GUID: -mMK1032920wH1h8MEok08OehEBaM9jw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDIwNSBTYWx0ZWRfX87lRxd904WQw
 WmESbPZUpsadhrpwL93FRQDrnas1lELzK0xZX+iY6JgCMQCYCmFw8gKagbxs1smMmMkRtPvs1Tv
 3L2W+rcpkUsBRs0ThPATnX4jOcuK6hAtSXfXIsRui53zgaToCkLc6Xx0MAvkdKEPkJMPFQsXJN4
 A933oT0+aAAzikT+I4bxj4g6RuVMix49XTswCJeU0fwkPDuGBnzu3Rfth3h/DNKHr7bcCO8QQVA
 sf0PsbTyiiJMGraLM3s+Pb0OsBrUVc8yExAzObvyvKyGzSpavfvKf+0H5H3Iysjhc48SjJq4MuY
 msox+45IZuvirkgjLE6oy5o+X6RCOzD866+esyZ7UNGasxcqNZr3EQs8x9Ct7Y70w5ZfFFiJn/k
 iJFuLqpwRilYW1wn0UmOYKuzR11FMA==
X-Proofpoint-ORIG-GUID: -mMK1032920wH1h8MEok08OehEBaM9jw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020205

On Sun, Nov 02, 2025 at 11:09:00AM +0800, Hongyang Zhao wrote:
> > On Fri, Oct 31, 2025 at 05:27:27PM +0800, Hongyang Zhao wrote:
> > > > On Sat, Oct 25, 2025 at 08:27:22PM +0800, Hongyang Zhao wrote:
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
> > > > > Cc: Casey Connolly <casey.connolly@linaro.org>
> > > > > Cc: Christopher Obbard <christopher.obbard@linaro.org>
> > > > > Cc: Loic Minier <loic.minier@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/Makefile             |    1 +
> > > > >  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1390 +++++++++++++++++
> > > > >  2 files changed, 1391 insertions(+)
> > > > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > > > > 
> > > > > +	vreg_lt9611_3p3: vreg_lt9611_3p3 {
> > > > 
> > > > regulator-foo-bar-baz, please. This way VPH PWR doesn't stand out.
> > > 
> > > Understood, I will check the entire device tree and change:
> > > vreg_lt9611_3v3: regulator-lt9611-3v3
> > > vreg_m2_1v8: regulator-m2-1v8
> > > vreg_sdio_wifi_1v8: regulator-wifi-1v8
> > > ...
> > > 
> > > > > +
> > > > > +	vph_pwr: vph-pwr-regulator {
> > > > 
> > > > Otherwise you currently stuffed it in the middle of other regulators,
> > > > although it doesn't belong here.
> > > 
> > > Understood, I will move vph-pwr-regulator after usb1-sbu-mux.
> > 
> > I hope, you are talking about regulator-vph-pwr now.
> 
> Got it,
> I will change it to regulator-vph-pwr and put it before all regulators:
> 
> reserved-memory { ... }
> vph_pwr: regulator-vph-pwr { ... }
> vreg_lt9611_3v3: regulator-lt9611-3v3 { ... }

Why?? What is the sort order?

> [...]
> 
> > 
> > > > > +
> > > > > +	led@1 {
> > > > > +		reg = <1>;
> > > > > +		color = <LED_COLOR_ID_GREEN>;
> > > > > +		function = LED_FUNCTION_INDICATOR;
> > > > > +		function-enumerator = <3>;
> > > > > +		linux,default-trigger = "none";
> > > > > +		default-state = "off";
> > > > > +		panic-indicator;
> > > > > +		label = "red";
> > > > 
> > > > So, is it "red" or LED_COLOR_ID_GREEN?
> > > 
> > > This should be changed to:
> > > color = <LED_COLOR_ID_RED>;
> > 
> > So, what is the actual LED colour? Also, is it a single multi-colour LED
> > or several separate LEDs?
> 
> The actual color is the same as the label attribute.
> 
> It's actually an LED package that combines three LEDs side-by-side.
> Our hardware colleagues thought it was three separate LEDs.
> I've uploaded a photo of the LEDs to Github:
> https://hongyang-rp.github.io

Then please use the the multicolour or rgb led to describe it.

> 
> > 
> > > 
> > > > 
> > > > > +	};
> > > > > +
> > > > > +	led@2 {
> > > > > +		reg = <2>;
> > > > > +		color = <LED_COLOR_ID_GREEN>;
> > > > > +		function = LED_FUNCTION_INDICATOR;
> > > > > +		function-enumerator = <2>;
> > > > > +		linux,default-trigger = "none";
> > > > > +		default-state = "off";
> > > > > +		label = "green";
> > > > > +	};
> > > > > +
> > > > > +	led@3 {
> > > > > +		reg = <3>;
> > > > > +		color = <LED_COLOR_ID_GREEN>;
> > > > > +		function = LED_FUNCTION_INDICATOR;
> > > > > +		function-enumerator = <1>;
> > > > > +		linux,default-trigger = "none";
> > > > > +		default-state = "off";
> > > > > +		label = "blue";
> > > > 
> > > > Likewise, why is this blue?
> > > 
> > > This should be changed to:
> > > color = <LED_COLOR_ID_BLUE>;
> > > 
> > > > 
> > > > > +	};
> > > > > +};
> > > > > +
> 
> ---
> Thank you for the review!
> Hongyang

-- 
With best wishes
Dmitry

