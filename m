Return-Path: <linux-arm-msm+bounces-86043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A868ACD343D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 18:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31B84300DA7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1508E30DED1;
	Sat, 20 Dec 2025 17:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRXw6uzL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h57BNvza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0AF2EB5AF
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 17:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766250850; cv=none; b=MX8uAQmZWzo9unLEolQjDWmKGLItMs5Js/iHZH5SmN8UP4RnA2RSTVYa65pjekiK5FSn1Vo3WT4c9Wovl+I1npdGKiG7uS9/abexJqi5XS14Uy60TX8wu4z5Zwzjr7uAGqrpLoSF1QXF7R7z/sHrgEdgfpUpY+13RRjwtCYa97o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766250850; c=relaxed/simple;
	bh=2HP7cyfnaW6jIR1poNT4mAzbIUboZJHSQiyaw6iKHJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHjHjDY7feG/Z6RCldGOGQpa9sGCzg3Y8tBDoQVU7oxTeH+nZfJMr2jJhr9eslBIJqbkkhdqutHKQ/C5MvurQjho39mb+S6ExXt8jEBPQsAtRyYzPuSs3rTOWHV7eRQHC7R8K7WiFj5eB7hshoxAKC0OFnB3Ll9UN1Cv+jl+X5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRXw6uzL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h57BNvza; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBOpl04135892
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 17:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WSzOEHcq0zxLmpCA6MvjFUl2
	Z97V94MIOLL7JeO36gg=; b=BRXw6uzLGEFpJ1n16EyLxMmtypKebxecMYdDA/od
	iJ0Nf97F3oAzToCiFrURAqFYoETSvsy3ZWiTPFx4tB7jaMUIjy+B0bal/D8gC1pf
	BLliDBv9Y7oZ3krL7lugF90tdhEwnJ5lV8fBiWXCqdqAO7z3ZepiefzgfeiHCLS5
	yGivBHUtntg9Hxw9qyDI6pYepAe8vbOYkF5ShCJLv5+4prwwodgYGzoK4wmTRIGL
	wpTdYHcZjMynLBEzwME6xrhXxTLokhVYm/3KvFQIdfVJISjlS6D3ldW219iEsvMU
	Gxv9aSVJLPtvdp1omT/hScLhJwvuFU/B1BN4rf/lB22Dtw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfh0rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 17:14:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88883a2cabbso92124366d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 09:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766250846; x=1766855646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WSzOEHcq0zxLmpCA6MvjFUl2Z97V94MIOLL7JeO36gg=;
        b=h57BNvzancjQcVN64gdFGFAQeKRO3kcU5714CRs0AuT3mIKFPvk5Vx9hkocr0MoMpU
         3LSMbF9tUj3daVUeDou0UeqrEQqDABD2fgAOcb2XgJ+XrHEeEQ1NOLkqNB0Yj5uAtuwp
         jzLhOr8oHX2A/3plqytNH2StIGf9ijIIa1PJfqwdvqXBVeu84iS5ROSvv2ZBPHYhWdrQ
         qU1sfhcYLPnhKS/1iW5hNB8Hj6I2Insja9hPI32pbcmey69MncrdNLctdbsa10g4g0M2
         INWEEXnElqt1bVVGjI14f5yGr2zVzUNlvKWZBob+jvZJQ9PndeIYtaEmWwCmyLnua4G4
         I6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766250846; x=1766855646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSzOEHcq0zxLmpCA6MvjFUl2Z97V94MIOLL7JeO36gg=;
        b=wnsNsVfOrHB6K/fadjGOiTQ2kGRf5j/1trUkjpTHoa6TR1dg/sbNnsWI/gvFiQSHgL
         h3gNCVGnASTWUBD/IxHO8xfHRPpV5amzF2EnJUT5UMYDY7UJrBgN9Ohof+D/oWDql8Ah
         A2NzXxgFOAwLEAegiVgwi5Knh+yTDW60foeP+fhhVO46S8J71jTrkth2T2P8sMNtgGxM
         LdthDT2DuTcNSJss4qSlmGc5c3ZHsVLpA1f1eSm5wOKQdnLvFJibp4MXDSPstk5peftd
         eotAA0NmvNugDyRZmAzGBUpH0TgtM+nzCwHVbYZxztKvKkm7/gmDM2I+Yl1aa5ew5BKD
         oVFw==
X-Forwarded-Encrypted: i=1; AJvYcCVMXaj1wP/z4r6DwPI4FHS9ZskMsfPeQKPv7xCVLTwmk0X5ypeqHRSdn1HpAg1vu6HBbfHgk1CSYtj33NdC@vger.kernel.org
X-Gm-Message-State: AOJu0YyZKxPQkDIRuGgT8A7bMMogTKZsh96uh3NagKHSBmvRvwqDMf2u
	psGFbvfHiQ6TQM30fDRyFSYG663ht+KX62/Gxwp1EaLUMuzltZpwyxzRtBEoDbO89BfuU2rZN0+
	767OqKb3LSfwwJbAqJlsKu+YK3YpzgcJhV9eaT7VT1b2Wvu7Xnx6W9s7wFKS8BZ4Jiz8U4OMtSR
	cu
X-Gm-Gg: AY/fxX459ZakhiPdDpBRLEZnuSAtaKx81vzmeEelOVLyuVhvl71Zwx8YQV1epblJJUn
	/KdDKHAK1mBflCWddZQP0tH8VFI3/0muK8T+EvmzO6On2k/Wx2nwsehkb2pjgoNVrQoP6hOovw8
	JTO9qbxAd9zsO3oSpPchYEFpw9F+Y+elslCJ4nTaNUZip+3RQ+z6DpZ8D+rlbg+P1NEszMCfk+T
	fxhNtbqtAPIYZNtlv8IQUZ/7XcS+MoGPstm9RL+dC0vLuy/NnZ+1TRRYdZKkJIXcphyORU6etBe
	BZT5twEQatYEgOxtH2v1LA1u5ijWGiXgY3SLZtc99IoXUn4qNCn1WS8D19DAzJ+2HtNf88vpCt8
	jLMHrVowrxHTRWLu2g/5cqZ4XkRk+UCG4HvdUhFEvOwRI2JLYovibt6sYtq4fhWIiwErzf5ELga
	ril3G7dr5Zj3HsVhZ37jeSB1Q=
X-Received: by 2002:a05:6214:5191:b0:882:4555:f164 with SMTP id 6a1803df08f44-88d876066d5mr98959466d6.40.1766250846075;
        Sat, 20 Dec 2025 09:14:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8qZrv9VxLeGT2ry7p5S5eSnV2ALEFgspQzmYK4flM4NAF7DHnxDEWWiIAMWKPU4yOK5/ChA==
X-Received: by 2002:a05:6214:5191:b0:882:4555:f164 with SMTP id 6a1803df08f44-88d876066d5mr98959136d6.40.1766250845538;
        Sat, 20 Dec 2025 09:14:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186280b1sm1610706e87.89.2025.12.20.09.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 09:14:04 -0800 (PST)
Date: Sat, 20 Dec 2025 19:14:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com
Subject: Re: [PATCH v3 2/4] arm64: defconfig: Enable Glymur configs for boot
 to shell
Message-ID: <gqmwj35n56yc6cd3sebyyrxakb3d7qw5pb45amhmefzj2253nv@plnbjof5zfws>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-2-32271f1f685d@oss.qualcomm.com>
 <ee084ec9-31a4-492f-97c7-009dbfd77613@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee084ec9-31a4-492f-97c7-009dbfd77613@kernel.org>
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=6946d95f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6FEy_uRmnU_CNISU7XMA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 4MDHVmnSYQcwt5BLGELG5TDdNiDUFdmZ
X-Proofpoint-GUID: 4MDHVmnSYQcwt5BLGELG5TDdNiDUFdmZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0OSBTYWx0ZWRfXwIXiXN6WvD4O
 uj2P4aeUmMfYHVMbqzMKUF0OtF9ZZqKB3f2mHoPUsc5CivQWRAqD5zqOxMQLcWLv5IRuswhZ56r
 xWXrdYcLX2vGnbaEmgHecHoJJYVCZiODRwEABPKR7yXmx64UPcP6MMcarO5B006B0at3SQP7Go0
 ux/QojN8HVak4x4VKqKTPYItxsjhcF1XJUNr57n5/gKpAi3C2pvyh1cbDXOgPTVOBkLlDS27Ql5
 AMacBtoh3xnjSUcDUrqvU5T4P+4bh7312Nl3s5MBeAJk6JmdoFyYtLZmSjANMjNEUw9L2ve4W+R
 LmEvACY4zCD0QMWzII225jkHejKAM/acmfJloPqqxun3vYqtzR4WTU5HVfneiklUvfeTU+A9uTv
 s4w8C87y1dBPV5UN7zG+zSdZe2hBPX9raQWPI3eMAZLy2JwFdAjOa0otAYGbnsNBz5OJB1r+kfW
 cYu/Vyw4aH5rtCDnbLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200149

On Fri, Dec 19, 2025 at 03:57:57PM +0100, Krzysztof Kozlowski wrote:
> On 19/12/2025 15:46, Pankaj Patil wrote:
> > The serial engine must be properly setup before kernel reaches
> > "init",so UART driver and its dependencies needs to be built in.
> 
> Missing spaces before ,

I hope, you mean after comma, not before.

> 
> > Enable its dependency clocks,interconnect and pinctrl as built-in
> > to boot Glymur CRD board to UART console with rootfs on nvme storage.
> 
> Nvidia Glymur CRD? Standard comment - you look at kernel and defconfig
> as it only Qualcomm ever existed...

-- 
With best wishes
Dmitry

