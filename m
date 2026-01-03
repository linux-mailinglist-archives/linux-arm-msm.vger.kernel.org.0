Return-Path: <linux-arm-msm+bounces-87300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D62BCF0021
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 14:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F6D530081B8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 13:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DCD23EA87;
	Sat,  3 Jan 2026 13:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCQjIuqc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OxrSFIzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7442A238166
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767446745; cv=none; b=iJxuZ5Fe6WFNwxjBP3wkxvaGujix7ELlJT9hSTlE62ZPt3T+VqerZuK9EsVCYNBwBXEKprcyuNn7gBNoJBfy0Uqb/18kiq3m9t7vtjFr9OaaftBH6FiT8oKdR49zPYud0lyySjqznqFr1fX4CYkA9JYYdt9MC1UYJewJ1J5xRbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767446745; c=relaxed/simple;
	bh=LQmqP+PBzrDKq4m+H169wGv0x65KZxIcSYNeQW8UIJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XudoFS/mqcw+/qkMpAlEX3xGkvsHIfdRbG73ToYPa9M6HH6Yrg2TDpWP8YuSI7lUewFQ3EYG6DfU6ccAYvfB2q1JmmlndnVpdYt4WKziCUnKavcWWRdKaIcGLzGmfWtPuGpvQuDOoomArP57CVPmcAbE7YgVstZYaELtTIYxbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCQjIuqc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OxrSFIzZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6039ubYb1032403
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Jan 2026 13:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1jHSeujvPi+ypll6UerzG/c5
	KTRwW7mhZxetg25hqAg=; b=kCQjIuqcuv8I1lEIaZB51dL8FPSebj8XZ1I3fhS4
	yz++sl3u7rGqbzz8DQGWa2L8/JaEQeSyxE6utN1U4FSoXIny34+M+wCd/KjpM09R
	wZDQYIuEFcFDFDy5SBaR4LdC1X/gkK90lQZTQr7D2KxcjJ6DWq8BsjO0hGRvi0aV
	udvFMxyndqUHVT7z+cy8EWVZ0ULRYuecn9Z/xAT/eWeSZutMLJwSTnomyaVzu3G6
	ec4J3Ag/E8RNpIdiyGjQv1IKqpDHG/jiZaI4FvSnOa+s0NyCAr3LRiT25AR9RL5M
	xcuoSYgwBWNi6lJ4xQ0w3euOg8pwBHEJQb1TmrJA37Nofg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9h8h4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 13:25:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8905883e793so23643016d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 05:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767446742; x=1768051542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1jHSeujvPi+ypll6UerzG/c5KTRwW7mhZxetg25hqAg=;
        b=OxrSFIzZhpIXv3C4s+7Gd60m6rQzmP7rAmgWSXyC3RyfV8otsajdoeM33uQZE1BIKh
         ofL3n8DQpIWqwQVZVmDSP58lkMHAa+SMJ0fijqemS8hJKIgpQ6g7hOvycQRhz1LFyA3R
         bq647ouTCv+spcVJ32EiZbg8PNUGxvk9LjTivzYxiCSyzDveDQeS+0TFO2VLDyh1rPak
         nJgc8iNllen9KqSF1hQnlcSZoHpGqwidSi0XM/k5WU+vQOUe6faeNz1J1NiKirMuWmjn
         Mh3mv0n6fPlMVHbKr007nmcmImrs6Z8KrhltvhSM2Kk/ib5vSRVomgTWNzRCjdoiMGCr
         zLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767446742; x=1768051542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jHSeujvPi+ypll6UerzG/c5KTRwW7mhZxetg25hqAg=;
        b=HnXH4nRqlJ2GHOhUIdOGJHtLnuvmFuTvbiNNDQkYB/nazx6KWF336eq6v48DMG07mg
         XlhN2RrgsIUIWF36aM2eVaZQkrF+gcpFou7j4EDwX8b/dSzaN5HpADDLFUjXUmo2F3KA
         Cctv3WtR02HbEBWM9WFSdSCWa1/WHmxHie26uVage0HL7PnnzzQgaULKbpAGxbm2DYGV
         JvMVJLqyiLip19gM3Lb640GsD30Q90hjZPUtHOZ657Qo4v8wtWG8LXUqzBtoI+tAElqM
         9j93G7VtsNUXVySs6jbE1y6c3a7QktP7fgEfFwNw1xECzTbusbJxd3d2p3DKbz+tkHCy
         67tA==
X-Forwarded-Encrypted: i=1; AJvYcCUvkuaaPrAtBXniuu8gnDISzABN3Gs66sqHzfuhQ7ChKQvqqADuTSNr0nviIeibcccZHFCZFanLEoMMXFpV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9akda9fDTMry/viceH6ijmX3JXQDZWJiE3+7k2QKPlWKcCg0b
	gOFRIEjl68HWjL0yynEa7eRp7aJ4JrtmCSLT4cIYnvpEQqq0cXq+H8P658dCgZA1Mj8Le6Ayk5Z
	DXvRFcn2VRYN35z2es4A+8Ec8FDV224U+2fBF+fDSYedKEC3F3S3zLHyx4MaXuww4hXM2
X-Gm-Gg: AY/fxX5OnCcOlCSWSbwZYJF+L7ZWAlwWwVTgSSOsVLvdgv8QxMrDwqxFtjUuprONo1s
	d5BM4ScyVVZk8O+ehMU/bxyjbCFuDtXUxOABxjexoZipXDGlNKvCLS91eB17d15XCi3h8MaicsW
	OBhn4IgDHzQH99DpWNRYuSCR6lSRRNsNGerzShLHkWKp2arEVE1Aq+rmNy7F4TTW/RXAgpvcfjV
	aHGrYXqXaIMM2vW/mvXw1KpqwXIogVkP9G8qEmM8nh9u8hBrWbTpIUysMV3iMF3Tghc353/3ecj
	5TgjKuJ73/NzvLdwK44fsglhyreNsffHOvYavGplXCgtZ7ZgdAOQcuwiX8uGgMRwpvNayeIObqx
	QUy1oZCzgSnHLJj1lr11beLMJT1+vdjWjG4GNKfUkbDh0E0dCLY6G4thGBJgHvi1xA/7Ko/etsn
	WZOW4jurLBPIppHprFsTVQqAs=
X-Received: by 2002:a05:6214:1c89:b0:88a:589b:5da3 with SMTP id 6a1803df08f44-88d8127909dmr755750636d6.6.1767446742303;
        Sat, 03 Jan 2026 05:25:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhz+L5nAtmGQdA2DM/plD5ZudSYlbXTyyMsXWNWZlsUzf0QoDne7Y9vEhC5GecJA2xOAPk9g==
X-Received: by 2002:a05:6214:1c89:b0:88a:589b:5da3 with SMTP id 6a1803df08f44-88d8127909dmr755750426d6.6.1767446741830;
        Sat, 03 Jan 2026 05:25:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ff5sm12867635e87.6.2026.01.03.05.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 05:25:41 -0800 (PST)
Date: Sat, 3 Jan 2026 15:25:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16:
 force usb2-only mode on usb_1_ss2_dwc3
Message-ID: <n5xf2mcmvgvriod6pmycza277rdhwg53pinveuovc3bl3mivpx@wyfb7jabwun7>
References: <20260103-tb16-hdmi-v2-0-92b0930fa82e@oldschoolsolutions.biz>
 <20260103-tb16-hdmi-v2-1-92b0930fa82e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103-tb16-hdmi-v2-1-92b0930fa82e@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDEyMiBTYWx0ZWRfX80ecrB+kV8ph
 63iLTQLNFcN0pE7xaPCWfaByzvvQrtfuKn1tQBeCYgttiH+GDhr4RhNUdpchYpr0FeGR5OMhcqE
 N7irw0vJBCDJeLWduWUVzQISXP+PTWtiqXGRSz2DRrHKsTkrsF4uxJAk0/ZlJqQThMPf3MhfZHW
 tPMCgKLKPFMLmFqwkshvXOBsXZe9PVw2ROzDPvtkddNXHEOgCF17quTN2Y6vr1QGnrakWQBlTTU
 QuLuRR1LgOaexSib6HhAihYUKbqmJqqq6yY5kvr7kBXHhHmg8DCIraODER3EhJWXKtq4AELg0Gj
 6fXhS0IYuXSFP0ONFA7w0bamk9hqmJutMkhUIlCc+fYFa6civzca850IxGNtQDE+yrAoaqYlyLr
 Lt+LswImdM0TRywrwV5nMabdQ0+Th5VMXxOJR+WEyODdC/zQsNFJ0eMA28kTQ5zSAe5QbSLwjYh
 b0rcDWSpnyd5MCj52Jg==
X-Proofpoint-GUID: q7huwn0rZzl1BgP8BQ4gyZ6cWt6tsF4x
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695918d7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=iXntGJ6FaHpRiyf2QXIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: q7huwn0rZzl1BgP8BQ4gyZ6cWt6tsF4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030122

On Sat, Jan 03, 2026 at 10:00:23AM +0100, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The usb_1_ss2 complex has 2 phys, usb_1_ss2_hsphy and usb_1_ss2_qmpphy. On this
> laptop, they are used for different peripherals: The hsphy for the fingerprint
> reader, the qmpphy to drive a hdmi bridge. The normal logical wiring for the dwc3
> controller is to both phys. Delete the port@1 to the qmpphy.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

