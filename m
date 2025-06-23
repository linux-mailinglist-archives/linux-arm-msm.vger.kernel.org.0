Return-Path: <linux-arm-msm+bounces-62082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AABB7AE458F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 15:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82C21188538D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9A525393A;
	Mon, 23 Jun 2025 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/XkvTZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6437E25291B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686865; cv=none; b=fEH3rIhHDWHDcHJVK5QWDvqjGCDwCHzSxNf1PGnsmsnpO+L6LqjGIkk3mywjZqOs1PcT+m+vDCps83ToFXhgY7/KEh91aifCHUKEIKgHVrM+nCvd0nVtVyJfwU2y1Bye8UP5QmAlMZhrknoAf0WrqpL1/IzadINgJJ6Mta64CnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686865; c=relaxed/simple;
	bh=5UaWLeWfA2H3BSBC8mo1Q1o/t/JITNtEQ6bSv7COgis=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpKnm7BKDKuWCAOEGxtjwJd9A52xIJu0YKQvqA+sFsAoqhA8zVyMl08ZqOl7n3c+8Fc+KMZAdM1+6hOFZ9stUqAKMjzUETmL/dfpIb4iVIzJ3zApzeZ5nw2xto4vEHJ1wNReYlVlC1XJyrJprids5WNHoJPnooiMPJLUGBApwU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/XkvTZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9HEWY025855
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rCjSuQgV2k3XZQnVF3MO5kvl
	tLvO2sISxvZYNm/MRjM=; b=j/XkvTZE+OGSvwP6sz7+kVIB//iRCIoX55EIfmRB
	AVZlY879uDe38R+NFHu0cYAWy5ru1/ta7YoroDhvcAkD+m0Y7XbaTyeCSQD/WZ14
	tsBS38BZUqNWImog+z0+4k7CYvX5gQVbXASWWwqJMdIOHzV0N3s5w0kOAme6uimS
	rLVyiGA+y2Sc/jfEv24qjx5iJ42i/kF+bUlzuzEtkUs2aBvTcYeS5nJ7yUc6jp5F
	L4DEkxEP1ZpI3giv9WVX3GTCmIZbqO9S8KsaC4iA/CVix8Bd5UkfrwA2gpW/hHCM
	oF9zinHBGHRgk1a2ScrVjV00/EsijDGnc/VOhI90yP0+Ug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmjf6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 13:54:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d22790afd2so559738885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 06:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686856; x=1751291656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCjSuQgV2k3XZQnVF3MO5kvltLvO2sISxvZYNm/MRjM=;
        b=f3Rath5NN6epVjNOmzMos8tlG7dswL/RWz3657nwEWuPl/S3ZGuP+GoWfK+b/yMGja
         7j56t+3+m4Lm7pmlCxIzZzZsW8vc8PVcno5LK908VMhKF925JT3ex1VpcGeeN7HZ9az+
         slGoaZf0fAxiBTe0tBTrkVv6Vg+ddtk7oCxA+EhqHtvRXRjy+3mlfZkJWvBMnV9zKqii
         QTBBhER9EYbPFjxAeLH63aMuNP8gMESK1kTXu/WIEW1AG+OR0yELrRUvXF6jt+uzGvZk
         tP3mZaMZ/Bhbjj9DMret5joQhliKGt4hNPf/Im+x6LR3cRSje8eroRSHO35NqHs6rffu
         9HtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/Gb3KsrU0jrBDvrr1C5mcuNrrHwUo+EFFozFRg1XrHPNwhnnLI9jVJoZ0CBawb6qcRTF7bCxiR9tbkDc6@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZNMZJmFK5CgwTyCDVvqrT3tclyVmSO97gNDB4unObuHj9QIG
	UwcNyI+k/d9vUsZ9M4id9AEndmH/fugRk5YDJpo2RTyi5A44qwGIQtdVSNg9RjdFHxok8C2Y3lO
	Kyqk+wtUzhU8/Q28esQiB6UrWBYKpSDPqQdY4YERvqRHyHUWkmDEneUUZ9S6ZEtyEi5MC
X-Gm-Gg: ASbGncuCMu8eXONEEXVypcpK3rHJZNzB/OMHQ1PITAS2gXe5U2kC71pc2Y3U1R2MFs7
	LbZr/K1VKVoo/s9ne7Q1JrTT8G+UFkxhcVMflL/YwkZ7fv1mrGq0/hSvYA8LV2EOM46d5JVAA/c
	R8jxpC5Ovujnjj1vABegsYtq5cvAgr1jzchJy4mzeREwAkz1Xp3wwY1WGeRVQ+WC7kqh8+NktD+
	M26f7Ccxtl4dDoQMeZ7tjMCBEkq0lV1kbB1qplb/IXfOo5k4lMOKQdxo0BVfiNLbbEPJka4/BXZ
	e32sYDfgwiN7uMPG5+ekLKmEIaZIgyoLGvl1u12+0DJDNVKbCOSEAnsvbg==
X-Received: by 2002:a05:620a:1920:b0:7d3:c5b7:2511 with SMTP id af79cd13be357-7d3f9920e96mr2207549785a.36.1750686855790;
        Mon, 23 Jun 2025 06:54:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9qQcWJAD/t7Ve7pZBwfhZjG7ipvKtwIHDAMc1m8aD0vO6qb0UcAOpl6wYycIHRg7QbyXceQ==
X-Received: by 2002:a05:620a:1920:b0:7d3:c5b7:2511 with SMTP id af79cd13be357-7d3f9920e96mr2207545785a.36.1750686855360;
        Mon, 23 Jun 2025 06:54:15 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1187cf0sm9480249f8f.71.2025.06.23.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:54:14 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 23 Jun 2025 15:54:13 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aFlchcdWjh4AvWNr@trex>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-5-jorge.ramirez@oss.qualcomm.com>
 <53aee5d3-ac5c-4f6b-aa01-9c2d5060b17e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53aee5d3-ac5c-4f6b-aa01-9c2d5060b17e@kernel.org>
X-Proofpoint-GUID: 2ZxHWUJpVt3iV8AQRUSB2OplQ7sGFICB
X-Proofpoint-ORIG-GUID: 2ZxHWUJpVt3iV8AQRUSB2OplQ7sGFICB
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=68595c89 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=JM561_q83E0Icr2UghcA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MiBTYWx0ZWRfX+8GK9ietNGCY
 KoUBU/Aiblwv9m8wEzsVnfmhSxMFv8Cz1pufJ+VZzVxAHRcWGF0xfSDXcY/P/3H/OCO5l1fKTjt
 n8CyRzrVOvKPpY6vk6o3cutyXYMX+RsTCEiUF63reEPdF9mI45RQR5ABnaef/fLQtxR0UCT7j7+
 AMmIYrHDanZh7Dzn1U/yFj2jNa1MZkVijtnxaGeeBX7SW8tA4qGRoNDDjRs78vWY8x6N7prte34
 Qb3lSZKQ8RrFUrt5WK6crr2Hgs+3ywsAQX+WQEqQr5ucFh/c7ekVmHDaS6vEF3zxTaUrdIgM5VP
 pZVxTxPsAozDZmU2L3mgl7eE1kC/IynaMBFMLoNMI7nfUniybqbJ341sQrQmEgZPoUkGohaowda
 KZ+/0WPYpnIWLeIMBMaN0GNWCoP1yay7MaSv1pTwR4gXMVvEiY10xqLiDqTz5DhMl8sl6r41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=753 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230082

On 23/06/25 13:51:51, Krzysztof Kozlowski wrote:
> On 23/06/2025 12:51, Jorge Ramirez-Ortiz wrote:
> > Add a qcm2290 compatible binding to the venus core.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Wrong order of tags here as well.

but of course, this was not an oversight - I followed what was done in
some other commits (but yeah, I should have remembered not to use past
commits as reference)

> There is a direct example in
> submitting patches, so it is confusing to see something different.
>

yep I remember now when this was pushed 6 years ago (you can find me in
the patch - I was part of some earlier discussion on co-developed. ok
will revisit this doc).

