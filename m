Return-Path: <linux-arm-msm+bounces-47758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B091BA3263D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 13:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F0A9188C6E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 12:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1BA20C499;
	Wed, 12 Feb 2025 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbynotFb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9470020B7F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739364575; cv=none; b=DpJ970feZDM4ziWeVNdAXprzm/N2blL9MViS0Ji+CM6J1NxArgfVpu6fv7ah7yN780vJaNCZrTVCZAumJukp7qWvmEm0Yd66fuata4z4u3itsNIqudhrbp9D/6AsBuaer2WV0kYqA8uMNelcaP9TA7Hf8YjIjvF40Ry4vBwvW5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739364575; c=relaxed/simple;
	bh=ccZ3wHwDph8Tvn3up3Fk6WgFSGXex/Hllcw79JUd5dY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4vnMe+QZnaOh1U29k1SUXlzpwWhmqkdHkND/eAFzih2b8p9ItuSSU2bVscJOCuz1UVXrWQypEo9SyHB4ItSXPKqVc3ZzYNWkDLOAHh1nr/V31pqaPAvgGYVNqyX14Aw81zdhrTS09hXXwtN8qRqy/0l+9y4R91SH8+CwNd8mKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbynotFb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CBbBNX010515
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kuUQBdSITaMKfTHHScNQdiAZY5xZBj/1CJ4MXpafH+Q=; b=WbynotFb6reioGKh
	1xF0YKHkh88XUhv0GA+CsFqKEXlV7m7+eXtxY3WBviWpih8tpkx0us8IvLZt1a7B
	sJXFbGq45dvracfDF/UTmUbbRaa2WMqOomly7rIS6Vm5rTSBGZF/ZjshQrIOtCsY
	WGRbDxoMPEWXQPFn9KnhlbB7zQB8SXIe2Bk8V10P2iPivtFlRamGKRMe6mo5Otte
	B25qsR50tWsdoWHCciuSOD5psTx8M4ScOcj17fcYP9LNcvNJOAK969nDC+X8oCjq
	WLcZv3uwTpnB/Xz2+P9QGuEfttIh/+U8jagSM7vEH+sGtvlLLHWOH3xWbKbcBSFQ
	r7bt4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5fv0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:49:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4719ed0f8easo4437121cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 04:49:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739364571; x=1739969371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuUQBdSITaMKfTHHScNQdiAZY5xZBj/1CJ4MXpafH+Q=;
        b=SX0biIAJfVvwlpyL+Y9kG4UZaJUftgFTVd/wsx1Cc5V3/CAYSvhiXRVCVyIsSjXvOM
         xDUDTMSNaT0dZh32wBnLZB5c6wKoPGEEmuuHlIU+pLs20gQlbYQk9q9chv5CziAjo+wS
         GVAlVzfhDsuBlxxo4NQ5qp9p0m8FXS1b7KOCpT7TIbkr8LidbmN0yYW1aLPAZo7ItN/g
         JciPfBHCeH6M2QWKXZrOhEloam+mopmUZuOSHCgsKpfEpni+C5uakemng2b/yqaS1zjd
         JK7a5R518DZoK7OR96J0IvMiGeKa7mRrubdcsURjCJwVvnm3L6eW59Z+ljDjd174y4D+
         hZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCX6OdqWlBFOEHCY5FWP/ZA/albe9pmXC3QqZkvG6Pl70Z+5PR/ICWABSL7U9xslEOQKDwR7NZNKJ3TA2AXF@vger.kernel.org
X-Gm-Message-State: AOJu0YzUJ4U/BweIypr2wei+EOLn7hOi1Is1rwVCxwd0qiW9mbApunLR
	tWkIRvHUABCRcqi9t12lhx0SA5ehN3y5LnIZ3SFZTc1ivCPpiVoaPJpmbF8DXkI9ylRblBMl+a5
	Wc6oMOYjDw9Gz7gY6T8NGJBjsR+Zmf1Sa61r51/eTscK/tObZfhZDTg3uKRYhD7YF
X-Gm-Gg: ASbGncsyYZsaI2w7se1+DMaEiJWrK6S0f/XMoGtHfg7XrH5Hy2V0pyO6GO+TFrjv/3q
	jNABvdSuscbpegJfpXhnDmGUG4dS9FTGDiexVGUmD2UR4LkNvHNYV4WTNTHhpn294TD7JcIMEix
	kPx5aYgnsfEEeBGhEzTyUf4DbF5rvuNPT2fGcjXg39AccHVho8dZgEgogTKH95EkVzdXY8x+/XY
	Y4GByNyIXCdBQGjREd1X9gEJL4rWtwENi/FAN56BT30l4h4nrLjU/wz0j5E0xzBiC/kdus6RsTy
	OQgv5xyssS/zzIntuZ0ocrgxeYBqo4QUEr0g2kpFpaS/ND28XWhgeBFXygU=
X-Received: by 2002:a05:622a:1ba1:b0:471:a14c:6847 with SMTP id d75a77b69052e-471afe44807mr14893201cf.5.1739364571543;
        Wed, 12 Feb 2025 04:49:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXlvtCUv6kxGIVgm1ssWpPWbt6HtmfKifwsKGxI6ycuvSwhztswaJLUf+JCsS2rMyb9J3CYw==
X-Received: by 2002:a05:622a:1ba1:b0:471:a14c:6847 with SMTP id d75a77b69052e-471afe44807mr14893081cf.5.1739364571150;
        Wed, 12 Feb 2025 04:49:31 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7736439bbsm1249652366b.162.2025.02.12.04.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 04:49:30 -0800 (PST)
Message-ID: <9cdeb748-4f60-4050-9d7f-e4ff75ef1834@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 13:49:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add PMI8998 VBUS Regulator Support v2
To: "James A. MacInnes" <james.a.macinnes@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, quic_wcheng@quicinc.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org
References: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rpIVYxXeBQ2jR-_zxyA21I-_9cKZ4yTY
X-Proofpoint-GUID: rpIVYxXeBQ2jR-_zxyA21I-_9cKZ4yTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=932 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120099

On 12.02.2025 2:07 AM, James A. MacInnes wrote:
> Greetings,
> 
> Thank you all for your feedback. I have integrated your recommendations
> into this revised patch series (v2); please disregard the previous thread.
> 
> Summary of Changes:
> - Patch 1/3: Updates the Device Tree Schema bindings to include
>   "qcom,pmi8998-vbus-reg" for PMI8998 support.
> - Patch 2/3: Extends the Qualcomm USB VBUS regulator driver to support
>   PMI8998, dynamically configuring the regulator based on the PMIC type.
> - Patch 3/3: Adds the VBUS regulator node to pmi8998.dtsi, enabling
>   USB Type-C VBUS support.
> 
> Motivation:
> To enable VBUS operation on the SDM845 platform PMI8998 PMIC.
> 
> Kernel Version & Testing:
> - These patches were developed and tested on Linux 6.13.
> - Attempting to run Linux 6.14-rc2 on our Lantronix SOM resulted in a
>   hard crash, making it unsuitable for validation.

Please try reverting 57a7138d0627309d469719f1845d2778c251f358

Konrad

