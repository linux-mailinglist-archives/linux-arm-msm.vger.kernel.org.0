Return-Path: <linux-arm-msm+bounces-86537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5357DCDBD95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E58B430237B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF22C3271E1;
	Wed, 24 Dec 2025 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCRQI818";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jwTSVLzX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DE630AACB
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569480; cv=none; b=fUFlqYEEUYjxG++vMIeaE9I1z/xbkctmAUJSLU+uW/zyUqLjurdiVoSkgWVDN4RI0ev5BTOdIuU3PNpDLT0ny0Zpd32nx/D53cFxOkBcZB8q7ctr+6S+UJCS5hw2MJGj9vFA5CY4fQ3NXruLTI6ROvdIBsiAX98gC/NTEZ0POAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569480; c=relaxed/simple;
	bh=tlec59c7vzI12AdpQO5MvuW2XJ692+QIG1D25DoEfbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDb+1ZiPox5uxnbtKXTEx6PWb3tDM3h4JN3UDsCPN3Lhm3M0lMgtbJAJuRH1DdRvZqUFUI8a8Vb6tO1FsXA7D2vTOUJS/l5yaamBkTxdRq0olP0EpCVY1ZGrXQutY4lbx6TrY5yqAozdipIhkMDPyfSGTFtCboP1ywOSzTrNhI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCRQI818; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jwTSVLzX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wUDq3796871
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8bMJPL5URsN9kC02yIvSGN59PPsUlvnLYy8ovug86Y=; b=DCRQI818VJNfhxvy
	vcwkm144QAC59iKG/n+dX/NEbry4V3bERWVgC63J830y2+IxplKJu81zvnBHVDr+
	YYxhtg3kBdrboHCwaF+Y+tHK3Xt0I2PwdEh92WqpOYFYGxANzU3pp7MnexhOL9vB
	SeFLB5G2ArFIq0saOFNc9u62sZiisH0/kXKVrEHEcas05swDUkddohEtr2op6gHR
	Y9gYRKW04/BN6XURT2F+bDBQv9FdNKyU9ds4H0NdtAyOdSeGhhDW/K7/9J/tc5qo
	Mbn1zfc7sK5GIFF7U/jCnzwbFzxqQlbYEkvQuTyz8fxGqGUZhESpB3ziQe4ZvS6B
	buSDfQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r68taq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:44:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8887c0d3074so150896856d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766569476; x=1767174276; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j8bMJPL5URsN9kC02yIvSGN59PPsUlvnLYy8ovug86Y=;
        b=jwTSVLzXCtJalP3udR5mbXxnAjnorYa5Myv5f7+8Xdud/ohFVomOqmVIssbkANHNmV
         RC1pI9DTvhsLOjv8XjUU4q53i7mkVn2+i8YnJ1sMDaodqpa7AkxP8IL/0DwTsAG4tHAr
         opjxOXReumcVg0oe1525dHXIn0Cl8Zoih2Gmxsv3woflisSGSomKIukD0cyfIWDLNijc
         Isx2FiNcUk8oP2WZSdo00lVGCvtOLxv8Bz48zT8US8ptEaw2ZoKadG2duivaJXb43ElO
         mC74B/gSKzFAqGinl0g/tzsdq+aRtdf1aj36Ekli5omknfS8OBEoK/ZvIG+FkxQ3Har6
         kUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569476; x=1767174276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8bMJPL5URsN9kC02yIvSGN59PPsUlvnLYy8ovug86Y=;
        b=bVCyaSxruiC0BwU8/Dc0qJ8b3JzsED7aRvcWDE7RXV+kx46gxfMjoz6Owt0yHhpzFD
         Cth0gsc3veQqBqrCkCdzkOE7rzkVCK5zo4WMjDmh6CkM1vpO3Hrc3RKlmkrslidYUGx4
         6Rtxzo1piujwegYD7cIUSXPpW5OIszPwaZuuPeb/jUpkceYkkPsyvMODk2U1NBlLLPc+
         2wZXsXIpleilU3huyNBojuL1HIZz6hveLceP6NGAwhDzi5K/ZSxdfb2vzmg4MfW4CR+j
         WnobpFmLfzzed2AuK13SY2ObNLaeKUxg8zLdBAEGXEjpLOqVuA4jJoZPGVph241+FrC9
         J7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCU74vUhi1m4CJPSOaz0YzIPOLHDKjWsA8oueseJJY7ypoXWwzWOY++4OL7fu31F3iRGyjqjAlx9pxWjVN6j@vger.kernel.org
X-Gm-Message-State: AOJu0YyLDLog+vcfxe5ORlvj116T8Nyr9mzOpgAJ1PbEWL1FSjjudU3o
	t2xuZ+dAomjmnY3/I24NUkoTtiKgBp4Q24Vrbg/22WmHQxTmRteb40iIBxUzSSphT2wZsr0nGT1
	zq3a0OeGDzJME/8XzliyVBWWf/Zui0Hyql8gthZw1vKPmRPeUp2k77DVyzsB/tdL1iygr
X-Gm-Gg: AY/fxX7RUYJ6qdgBgHP5ng5qHJ0tgW2jgoXsle7W/Xmx4pSwgY+IhqGzXghp6QVfwha
	3z6T650yDjjBOydEQEQ01/AiF8+lzalYsT7d4HFjsN0OGZxUHJFu21TYcy5rACUlVT3Pfvljuuq
	7w9lDHYJ/Rr5d2fU/Mbp+1kQj/6+8+2ZFEnFEnEdqat49+jiPGUgHIx7fFFu39IvfDY1NxQO17j
	Srd2ykZ4O8pO76emsF7chM3x24aFtYRjGNOrfgqq9l7XHc3eQDrSDRj4EpKCtPc/aost6EA9X3G
	HnyWP/WJU231lIFrrV+RqATnMzVaXKONyxjqVpclWloNHxQZLOjaRo7OWW7+/6tJPD+nLNARRAX
	XIpWwpd1GNRvZS8EnvFGdFg==
X-Received: by 2002:a05:622a:1aaa:b0:4e8:aa11:5869 with SMTP id d75a77b69052e-4f4abdd77c5mr248981391cf.70.1766569476158;
        Wed, 24 Dec 2025 01:44:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkNB3ACPi/FO+hv3JoHsZTBX5MuwuJtcjQ11szAJg+HHnPlCeIsNXx5g1+5A2cYrPCZrtUkA==
X-Received: by 2002:a05:622a:1aaa:b0:4e8:aa11:5869 with SMTP id d75a77b69052e-4f4abdd77c5mr248981161cf.70.1766569475653;
        Wed, 24 Dec 2025 01:44:35 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab257asm33694829f8f.38.2025.12.24.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:44:35 -0800 (PST)
Date: Wed, 24 Dec 2025 11:44:33 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jerome.debretagne@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Dale Whinham <daleyo@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add support for X1-based
 Surface Pro 11
Message-ID: <qptvyecgevfbknaepnyplv2543wojt2cgj26kdsaaytnt6r3rk@kko2bjurdbyp>
References: <20251220-surface-sp11-for-next-v6-0-81f7451edb77@gmail.com>
 <20251220-surface-sp11-for-next-v6-4-81f7451edb77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251220-surface-sp11-for-next-v6-4-81f7451edb77@gmail.com>
X-Proofpoint-GUID: 29qmWm9t5hIyGHu_rKPOXS1vN2fsIOpu
X-Proofpoint-ORIG-GUID: 29qmWm9t5hIyGHu_rKPOXS1vN2fsIOpu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MiBTYWx0ZWRfXznR5kaDVHcxX
 QdHtalUEum27E5HaW8aMTNehxoM5WZXdnejPZ+h8z9nJhQ8TTywDHMQqCinmysWRArvQtc68Ypv
 gYjEj4Ux702Wcnhs9YJCL3aXf4zhC6JtMQCmo4Q8/KJmcvIT0A+VO17bRjrAqlUaHG5uwey9Asa
 njx9mEuRFDYOwZg5X2W4B+UntQx4PkKxPK2KUjLgzFhS4gjTVctP5Kr+bh1Rdx84qOgXvZ6h2jK
 93PVwdC8GWjtM2pslz97jcZt51PGjQF/lmsIo3dno29SbaBYUsUG6Xh2B0TZDxFzUELhqkj3eEq
 BVuKmtt/Lphr6IP7nc+MbaQJBiZ688aF2uIAA3gsqH2gTkIOJogPoHueRDDl29ol5Q1X8R6Jf8m
 3fiPM+rLhusPv1nZ0kYLleCidFbQ9rohUCnF0qsNuxyXFYsYiNy+EHCROd2cJzlLwUDLPnX7xLp
 GhY6GEANjpboT3T8mCQ==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694bb605 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=GlChVbD0Fj_pvowmbuwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240082

On 25-12-20 16:26:32, Jérôme de Bretagne via B4 Relay wrote:
> From: Dale Whinham <daleyo@gmail.com>
> 
> Add device trees for the Qualcomm X1E and X1P-based Microsoft Surface
> Pro 11 machines (codenamed 'Denali').
> 
> This device is very similar to the Surface Laptop 7 ('Romulus').
> 
> Use a similar strategy to x1-asus-zenbook-a14.dtsi so that we can create
> x1e and x1p-specific flavors of the device tree without too much code
> duplication.
> 
> Hardware support is similar to other X1 machines. The most notable
> missing features are:
> 
> - Touchscreen and pen
> - Cameras (and status LEDs)
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

