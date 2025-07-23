Return-Path: <linux-arm-msm+bounces-66209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77531B0EDBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E8DC17531C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 08:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7346A2820A4;
	Wed, 23 Jul 2025 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvWMXOBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F1928153C
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753260930; cv=none; b=QUOI821NndZaa/irF/sVp64xJziUN7twYLvGvbdcuXahGfOWiltUFvHswrxKHYwWjtgLRG0wcOUS49Q5kJ1B0pLzNcmH84X8/atQ2mP2uEBt+LTZylVfRm4TBBqjmded/27AZE85St47n6oZrF7b+eBT1UXM8cCP4BOML2V06pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753260930; c=relaxed/simple;
	bh=J6LLkUZtxkhT0lF2A4tYYQe7AdJvj9M8D+fzDPn2MUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqc86hdVi9yIqyjBlaRty8UuC6NK5iqyd2xZNIAxn0UqbnOgOV70wh26QkDJE0QQ8xOWCCCPsqM0QVTP+8OPf0DOB4++sfRp8oWllnzG9XsDwOo4Qo4+SUlgfBQV4hOTVrlm9at8rqUyn4r4UQBCiOuPA0ccFWZjpQSVE9fGYDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvWMXOBr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMNwu8009270
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 08:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2/MKy99x4tsVjpzMWhXhf/+0
	XGUClqX2jBqY1KxJfYc=; b=YvWMXOBrULWXQldxeFHZpwXye1T0I51eS9uifweF
	oeyVAzfF9qVXP9zw50I90MEAs+zr3M/tTeRrtNrv8DXa4p2as6O8D4RTGRIlbMRE
	Jwx0GTmn5yNQQFIVMZ9cnly/rrWKRwiKrdtfECTm/wa8qpDNLkkgHod0CukG30Ge
	olCsoxwyJFoKA3Nokt49zilQ/0eWfW/g7D1yHve4fXhi0ThWBViig1HLWyqyM0ZP
	ByPTXAtindCiCtgxGcQ4FIIpei2W5harCuktfPzj1OxBTvT8uEPk/hwPnoMYAJ+u
	1jwY5j0wRBTPq4Av7rQbsAzxZbmusLkZubPC7UijSNpa2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na2vpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 08:55:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31cb5cc3edcso5675188a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 01:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753260927; x=1753865727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/MKy99x4tsVjpzMWhXhf/+0XGUClqX2jBqY1KxJfYc=;
        b=Hw98YhAbUXX71BbRBlv71dogJNyxfUdiX+zNEwUeERk4cwX/W3tq86QpzOP2P8k9i0
         l/yvSyQVQ7/3U82QNDir+NsCHVV3147dXiwO80xJLSBf4kOmdRAVqvJEGFFfO5tOu+V2
         D9oN9fiP+ntKGpYBFvMWK0FyJRI+vpxvD7kY2vZ8UblBlM2e4vzB9gpOQYGJmI0ELWyk
         SVGgxUc0WnTp2ZEaWV/Yhb4LWZvpFHESob/BxnMoa3miOwnu364vZzh0BijXFXsUi9G8
         18tI+nAqFvVdLi6JFK66B5SoW9lKBuZuGbxaM71BGejrvLAiJwmt2Q4+NnXwvdEBW+UX
         bvhg==
X-Forwarded-Encrypted: i=1; AJvYcCUsznJPt2kAvDfDj+MFPS7cSvxj7MZ3/xVir+PbFfrbxjHHAQGI3Hw+2U8CORxVvm0hpVCrXPKDH4Dvs8ad@vger.kernel.org
X-Gm-Message-State: AOJu0YxvOz5TW66aHKqudf7JPUg2hC6gSCwJnYCrixb8EUHs+KRLuxJh
	hDasUeaH5jdGsvC0DXYl+o1V54bT1JR3FGL/TEdCRYWGhAATMhhrytwRUyeJusdbNvcNfEkRCee
	7FSR+mPW/WLFRaI2qNfQ5xhaurqlg9OLYtarR23XZ6daoisBXDnTPG10dHXde6uHb77Fb
X-Gm-Gg: ASbGncuLQYpd120nZV/hEd4EFsOY08Ek+1mt8a25zlVxq0TFf97YrPi8wZhfp5xrNma
	sk0XM8jKXl348CgpkHJmUBmphEux7/qxckmFgdQE+E37UjAL98La2Emn+UVUyV+mfD9jqR/KU9D
	o2PqhJed7KSjVS13hZJDzNLDG3G3/nP8rTnpYloPM7kutpuzMSPMMkQl3++Eemu+wOFxmdbr9kU
	uDRD021F0oY8RNkI15/fhCw7SQAuCiC86UkzVtT7Ap615fQUHu1oc47+3yAyy57qp+t65WCRbSY
	CcL6v6CXfekXxgdw2aL/u8o3Y6r+KL41Yu7fFFOVgC9rOXO5N5K3cPuMx8F9F5n5HUriTbNZVOb
	VRbTdy2RyXdZ3xC6D9KU=
X-Received: by 2002:a17:90b:1e10:b0:312:da0d:3d85 with SMTP id 98e67ed59e1d1-31e506df8efmr3704018a91.6.1753260927304;
        Wed, 23 Jul 2025 01:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7aSTD2BEN2GPGipaFx5snYQw8DKNBiJv81IMCn4FkQGBP3nLk9dZg+gV939ivxjAN8wpgQw==
X-Received: by 2002:a17:90b:1e10:b0:312:da0d:3d85 with SMTP id 98e67ed59e1d1-31e506df8efmr3703988a91.6.1753260926904;
        Wed, 23 Jul 2025 01:55:26 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe8d550sm8456955a12.24.2025.07.23.01.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 01:55:26 -0700 (PDT)
Date: Wed, 23 Jul 2025 16:55:20 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs615-ride: remove redundant gpio
 header file
Message-ID: <aICjeK+gC1yxPb9I@yuanjiey.ap.qualcomm.com>
References: <20250723084351.4627-1-yuanjie.yang@oss.qualcomm.com>
 <e0c9e620-a331-43c8-9c62-f9769744a484@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0c9e620-a331-43c8-9c62-f9769744a484@kernel.org>
X-Proofpoint-GUID: RKnbDaCiSvdbUhHzMJd1QcwaUyJTPWUe
X-Proofpoint-ORIG-GUID: RKnbDaCiSvdbUhHzMJd1QcwaUyJTPWUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA3NCBTYWx0ZWRfX9YSFJB67vldS
 yiWtx0kUDeX6qN4/R60rjWBfcEGREJ06GDKUq1e3KJzTRmSzbwMAWRe6l4ixGXYJ3A7/qWQEkHm
 bWFiTkzMiYxypLcONJbHmR0HR68Y28RHMaZ20DLvoDWZIcsYzfNHZIA8LVQwky2USvZG9J2jQ3g
 Eeb3qTJ9jKPx3DyPW/pTVP87Wb/69/cyCjm7mGwjJBJag9PLJ/3JR9S2RLgCywWSCllVmNnEpWC
 J8x9fnGN0QCgaA+eZjfOvhiIuUpDmJumH+Lpf84aJmWcXukxR/ogN45N6i1bj0a4b8fQ/vaGPx6
 bd2gc/1bI8RgeRnxpVs7Ktq/UsDklh+PLscArRTx7XBunszrENfrUa7/Z1sRygWbNnx8u3fujkg
 2jztsHD55umNwd/ctKkcHtc3CaAsH3f5JWjFRRoKtXa7JYAHYT71IaQUQpjqMufEllJZgjdX
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=6880a380 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=HDA7t77kZpctsFZEpKoA:9
 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=984
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230074

On Wed, Jul 23, 2025 at 10:49:10AM +0200, Krzysztof Kozlowski wrote:
> On 23/07/2025 10:43, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Remove redundant gpio header file in QCS615 RIDE DTS.
> 
> I do not see it redundant at all. Just look at the file - it is used.
qcs615-ride.dts: file

line:
7:#include <dt-bindings/gpio/gpio.h>
8:#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
9:#include <dt-bindings/gpio/gpio.h>

I see line 7 and line 9 include the same <dt-bindings/gpio/gpio.h>,
I think we can remove one header file. 

> Otherwise provide arguments WHY you claim this is redundant.
> 
> Best regards,
> Krzysztof

Thanks,
Yuanjie



