Return-Path: <linux-arm-msm+bounces-89090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AE7D22068
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 02:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92DD13017863
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 01:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13230223702;
	Thu, 15 Jan 2026 01:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvSE8xBW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQDOM8KU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F064F7260A
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768440494; cv=none; b=PTEqbii9pXuElnDW8VhpjnDORPPZRu3YobAi01PdQLqioHfpKulnS227iZpyPGh2ezvwC5Agoa+NRkIP/hChZnpAJGVRvxZa28ENdXlZOa3/JeiuRYTfTDjku+ZA38iatMtMagpK99Aae9yzUD4ln9Zu42nJl4Ttd7x//1Zep7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768440494; c=relaxed/simple;
	bh=dmxjC6qlcqgndCP/W0JARXpty94tqr1V6XgBTKPx9d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTOorhtDcQh9jxXbswoYXz8k7rOzEeRhm1IYby1CzaVRQUqoTAHvmDtrpLI1heAeexhO4UgpwYS5foEPLh6xHK39I01xDqmYPBrfEULRUvVmCa/kAF27/9h5Biv10oVR1LurWP5wdwG3QQvrBZ7EQpK7fOOtyBEUHaX9ZxIAA6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvSE8xBW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQDOM8KU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EMh89j3821379
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DrWaDhU0InJcA00y4PTYOHbm
	RnzReH2ikq6bd2yjO1g=; b=OvSE8xBWEVJUOcbM7jzdlSvZmHp9DJYcY5ncoL0A
	q4wNSAvChxKPqluOMkDgnWm+lvVKXSPi6HWL8KT4UC7Fqfz/psV/LYaLu9OGeQqB
	IhHJ+JHng0PUQxm/38FCuT3EX896b7HCkyvbDzJPPMeX7oKwJrUYjkbLOfTuKSCb
	HRbeyT+1vp/cqN17nL0k7aS4sYy3Mskt8oTvmnNHWvcc+bx+/NyOkKLGvFS5k4d1
	NHWO0N2ZRIeHOHE/RUyu68G+y/mOlEplR1qWlfIrHfb9e31ooTb22yjlJJzD+Uh3
	cXozjdIkpdC27e5fmzotxK4eXP50mKRYdB6fxiJ1TYBheg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp7b6u7wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:28:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52fd4cca2so104045685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 17:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768440490; x=1769045290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DrWaDhU0InJcA00y4PTYOHbmRnzReH2ikq6bd2yjO1g=;
        b=BQDOM8KUoeTdjOMr7s/Qa6536WdTlodhx0G18gfEUFdVOh6FLUWzvxhJZtJBz4o3I7
         O+HZ5ScjJ/SfcTnGlENUqPt+4SzFu5R0OqexU5pFgbeq8HBkPPJzuyh8xAtGaTVtvAPu
         sQ3CpI2nnukI4Pxr/AyoSRV83TGY/fHW686Pz+rVzceBRZ2tuefp4QcumK8RI2U06aZn
         ClR9Y/jTQeRTtkl4rQ8G415L5tglz5yNRfMz3nEtblcXrxTtT66fQqV/ASWi5YjGuhcS
         BlAD2AHfWqds3yXjUzn2dDuBZO63CeLTX91Slge/V/edMD/rXt9Yb1XloWTzO957B592
         dvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768440490; x=1769045290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrWaDhU0InJcA00y4PTYOHbmRnzReH2ikq6bd2yjO1g=;
        b=Zq8kjsmQtL2zDevoWPj/16VSpPHRZZtpoJXmGN/NTKAvEtrIE6k8sa35VPgzPiXimu
         raNICpserr3OwgQtSSA3riM7MnyN7zkx3TvzrJ+/h1dvSBMT++Z0Haqncrkj4zmKQE/z
         8p/LrQp1KxPm5VUvmG0vV7+Sn6nYq2uyN7LxUnzy+qXDj9KOgFzj4TvNsqIFSJxD983n
         VRnPCjR1KJHGPhzXzJEAzS6iR0vpfw2JWC28r8Lvk8mO2VtVf2YQ0NIF3BcKmtE6fSFn
         talOiMjhib7AZqL7aSqlmMo55rjQQD4/BkhV9HnOG6zf5NQpOJX9y62JGQAiREJ9LK6U
         GSww==
X-Forwarded-Encrypted: i=1; AJvYcCUIoMddrh1lRQ8j7GXUSHri2y/PAVY23CEs5Bo75LNx7smalwEuA/JHhRGAB0f2MeS7TqYnNBbnIRgSEfzk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb56TKuEZshTueI3uK4AkDVnB6f1m5qJbc8UgyfC4iiHagJaf+
	M5OxV7g3a20OaGXRp2TaIAAyCk4dvD2Cwszu7wvtxxRtF7DeiU7KitUGRbn0rS4O0/YcyKxnv+8
	g0XkbHd68E60WF341uXNHydi+fvuci4J+2lrRIN+1bFPsnSNajefYyK2bUzvta8AN/jkZ
X-Gm-Gg: AY/fxX653d66An1ZJihBoIfszXdb4c7QdUmjQ9e+JAodj+ki3MvPrIMq6izjzYT/bkz
	1AMJfGFzUzRXmO5VOs+dKcFsjraKyjs4USZyoUlMO67c9LdBarJQhnEhhS0jxk2d9HpTTjZN9WV
	Du4ZlvMkgyVz7kRvH9Qmz5cPhbYmCOtwcD76l8y6mJw1VIh9+/boQpZsiC4nBWY54yRY+oyXrxy
	WpkcBbTsoxPVNw8aDsvZM6mVKmO3U9E+8P4KiYKiB5iBN9CTJyKiHyUmQCODjZwjQOilFKsE4ab
	2p7NnTCGZ9qPiCf0hSNdjxaEm6Wx10o7ahwDzTcERasNnbqq9uAVIzs3Z8Mwzs+EMfvKgAMBe0P
	6QmqtlNjbO8Y2E6z4sGw8ssbMmASlFNou2GxsjFbfyizJuo6jDc10U7xYpzl7CfDACrnKwT+RZ/
	idBQtoXnMGOhqlytrVVvi/NT8=
X-Received: by 2002:a05:620a:1a83:b0:891:bcdf:83dc with SMTP id af79cd13be357-8c52fb43699mr694796385a.34.1768440490181;
        Wed, 14 Jan 2026 17:28:10 -0800 (PST)
X-Received: by 2002:a05:620a:1a83:b0:891:bcdf:83dc with SMTP id af79cd13be357-8c52fb43699mr694794285a.34.1768440489703;
        Wed, 14 Jan 2026 17:28:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba1049c79sm1189710e87.91.2026.01.14.17.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 17:28:08 -0800 (PST)
Date: Thu, 15 Jan 2026 03:28:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] arm64: dts: qcom: qcs6490-rb3gen2: power on onboard
 uPD720201 controller
Message-ID: <mrby2lcn6y2igm4qljzv47vbc4xxuxyqc2kyrzvxjtxbwapf64@ulmbbxi7kudg>
References: <20260109-rb3gen2-upd720201-v1-1-50d9b22dbc2a@oss.qualcomm.com>
 <1fcb607d-f3dc-4dcb-b640-452eae750952@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fcb607d-f3dc-4dcb-b640-452eae750952@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ICM7EJvDxZEa-3-eAKw2XSReRx6SaTSl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAwNCBTYWx0ZWRfXy3SrIuMQ0FKR
 hnAn9Id2eyXonBPdjCBfwzGC7miBd5a9stUsl+dpQOIk2c2Gsn04NdGxDblfg9qqpVYBMcLUwgm
 IO2A8G5BMUsGseg0ITRmdMi1A+JqOhnEnx4AEqFBRGcC8VhbXGXSbGhbNAyIxsh9f0I4hkD2RiN
 ii2AoqVD6Cg3IQ8PcfsMsbOiRfkMCeIUARIjsRVmx/xcXlB+0tfI3IGxJiemGneuXIyrzB/NLgV
 akiluvyT6utcVjlO4jikmJclVBcAO6xz00OByZ+rS1QWxmdTzNo6hanUId6gEuYuxJ7NPfpmysu
 jwDoq4k+ZpMunUFZKgppA5OcyEycG/m+XcifAqxqAROMPfDmhSeWtPqTLT1nJL3rRUFmlho/dz8
 pvDsKY7/5XuhkNzhNVBHr1UvU8DLA5URMUATBIqnHWUZtWgD1xSvvzjOZ9WlPnbw6qFsZ7w1n9J
 qRaXdJyl2OsnSB0d4Ag==
X-Authority-Analysis: v=2.4 cv=W+w1lBWk c=1 sm=1 tr=0 ts=696842aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8HRmNHPmt-sJrXeETnoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ICM7EJvDxZEa-3-eAKw2XSReRx6SaTSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_07,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150004

On Tue, Jan 13, 2026 at 04:00:02PM +0100, Konrad Dybcio wrote:
> On 1/9/26 4:30 PM, Dmitry Baryshkov wrote:
> > One of ports of the TC9563 bridge is connected to the PCIe Renesas host
> > controller. Specify the voltage regulator, powering on the USB host
> > controller.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Note, with these changes I can't get the onboard hub / ASIX controller
> > to work. Most likely those need to be powered on separately, but my
> > quick attempts to do it failed up to now.
> > ---
> 
> I assume it's connected to the switch?
> 
> Does it show up on the bus? What if if you rescan the bus manually?

I probably wasn't clear enough. The Renesas PCIe xHCI (placed on the
interposer) works with this patch, but I can not the USB hub and the
ASIX net controller (both a part of the main board) to show up on the
USB bus.

-- 
With best wishes
Dmitry

