Return-Path: <linux-arm-msm+bounces-65272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DC0B078E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5054E16AAE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC73126739E;
	Wed, 16 Jul 2025 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9mAF7cF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B2262FC5
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752678021; cv=none; b=ctTPOuBM2VNksDuaj4EKwQQsxYuvTrWYXpJdhT47eIRZCqtmLjoeA7wg5tHouHRQGFQt1jPTzNOosp+xYMzlSwrVqligLxy618XvfK+R319rJyPvrAAVmT/+RSNh/c7sxvFnWG1QT/ZiPCK7M5hzPUjnSHeg52M/zplgohyakxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752678021; c=relaxed/simple;
	bh=BwHmnv73EJxa8pAkw/DD9qciTC2+e5Jm3oOKDe6id+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXMicvgj2ecOUYUCYpmG8iaDpHQMSNLKsdsKv+tBRVMOQDryod6GGyKHsiOfARPXFkaly1RK+E5P6cWxqfyiT7vxggleO6+EUDIaa4ce9Mwdqy7FrfEwu+/mdhsJ+OedqXkrJomCkWve5y4QJwyOJPR7n+PhhmakmIiDsTLqpgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9mAF7cF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G8pEwc024198
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CAkscxFZ6HPZNFfbizbkemU9
	/nA8/uTZ5nzyZGm4eYY=; b=E9mAF7cFp0O/oPxA23hAjZCE4ukdBn9E1ECZekk6
	J0+L2cXbTsuT3r7zPG4NJB/hvxzGebmbWlvVQ4kotzxbVOo6ISVGkINW0f+aGhuC
	wHGJ7Td3R1MyznuYDavStZnjviMYjrfuahkaIIe8xMRNRpMU4fopzsNnQewUPJDD
	VMJAYftLkowOIlY3mm8BlLvQpjOXVY5P5rh7mg2Fsq8LHLQuY/zno7/5JVxHGXf3
	/o5Jel+vQcJHu/k41qnnrmyjGRGO4Km/a22LsJK9xbGeTSGuJUlS4FEECh7ewyk6
	lTLl8th7wzxEUx+Bbt/KdksQykh1UWpjrlpwv8WZgqBBxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7h4ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:00:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7dabc82916cso1194000185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678018; x=1753282818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAkscxFZ6HPZNFfbizbkemU9/nA8/uTZ5nzyZGm4eYY=;
        b=e9ftpz8tZkutuQx6NdVm2lPpWmfTwybrryrAhncoZJI8FxicVzG2FHLBrQe3+mGcu3
         30Xuf1q1MOdnMjStF1xK8FC8TTktssNFjwXwT8DNvpaUDytZdREuKX4MOUkNXMvzW1hC
         IwA059EJi3sR8/smrzbjGdamZQuh+BFxufjmen9rIJCkBkwS3M53uYaoN+A65KXNJ+A5
         f2PlLPCxWL7w4hK6PKr3zBvMextin9YBZghXOE44eq5NkrJ3HLMwLEdi4LdEANW9WCHe
         3TAPDRkt4cd2vDlquiFFmG7/UU0GBip13zJUW9F1Y0v2kL3xGJUBqU8IBFWRtmyOcQKt
         vM+A==
X-Forwarded-Encrypted: i=1; AJvYcCW3NIXps5nyIDQGgw93nw450/gkEFndYMezIDnmpXDDJ0G3C7uSWtPZwN2CWZEg0/tqhUq+k+bSA8qa7oTV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Kw5Ja2RRVul/S8GJ9Ct1NsU4+IV9+3GJq43Csl6Fgo8oIGAH
	pAknK3CqfteKi6GWMO4alD2c2I4zTImXTmdcPOtu2Atnnv6oVdjcLtg8LX8HFr7XnHDsjtqAgnQ
	YWKiu+puCUAj1bAOKeCfUjHcF+l+6MqRsrwfU6FVzb0n09WoTCgm4nZJMLimtIsOK64mr
X-Gm-Gg: ASbGncs7EPoik2YWhtSWxozjTjlbMj0VnYDNjMq/J5awglmwwgil8u8hMOMBKoIlV69
	9iXSEnMRNevCbcpu3x8aqdfpTtfCFk3dsSwdZ4zS6HetHlSq5+KGJ2MoD8g9n2bM7rlK1LL2tNt
	ZqEKhKyEE8f96t6rjMR0RNnJr8JlFOw/79N7WYUD8vrniJT66wA+G1FSKHs2R50Q45bc8icYxxX
	JNfMfuO4rQnnTiDJygbGD+XQKW/BtjQaiTBNlQL80h0Ubj6dYH1rkAAyRFue7ej5vYNamcOwsmC
	E9Nwp3QNW5DOg3mV+UdN2Wz5HIyO5kXipi85fCzwuT9wL2ekco+CtTDEX1iasyQdkSLBz6PoK0x
	uHBxkLiD5rzEtk3ja8KpzBhB0d5u+OyWF7NGUMn+p65A61DlOp24q
X-Received: by 2002:a05:620a:31a0:b0:7df:dea8:6384 with SMTP id af79cd13be357-7e34362a36cmr473602185a.47.1752678015265;
        Wed, 16 Jul 2025 08:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXmj8FKGIbR1WpW/ts2gzvh16kMRBL5dGL7A/pS8FbIBPN1NfTScfYvF7qf91Ybpr0sAjHog==
X-Received: by 2002:a05:620a:31a0:b0:7df:dea8:6384 with SMTP id af79cd13be357-7e34362a36cmr473573485a.47.1752678013808;
        Wed, 16 Jul 2025 08:00:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b7927fsm2648229e87.224.2025.07.16.08.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:00:13 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:00:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arseniy Velikanov <me@adomerle.pw>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luka Panio <lukapanio@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 3/3] arm64: dts: sm8250-xiaomi-pipa: Update battery
 info
Message-ID: <tpv2xy2ycbzacyqlcztrvyd4kmiyocb7qbquit5rar2c7wun53@llrdpzhdyvnk>
References: <20250716141041.24507-1-me@adomerle.pw>
 <20250716141041.24507-3-me@adomerle.pw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716141041.24507-3-me@adomerle.pw>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzNSBTYWx0ZWRfXyByWHjwcDlQ3
 sV+MZJyYag9O8QUTLsrK1tztmbw15zYbV2TY65kS+Ifw8vyQ/4RdQOhyWArDbVnFFe2vQAYgsWc
 fP8kJOGIF53s65g8smklGfBcY0Df4bF/Li5PfadD3KviLCU3AZkFnE/GDXays5RdLLZ8G0b2MRp
 YkW6GDcvmfZtvzZ5pTpAQLYThLdQvPB8leMjb8ZQDHMUd2q4hMUzwC5i5VLwiVHeBilBH9oCqu9
 WNFX16mm7j/Nu1z8+RSKkCfKaGzmmrv59RpQwVuqROct7vv/kKY7ek2DQg8apC7BWFPtlhhNLLw
 Y2hkDHpnpyiSFjWAhnb7XivyJaM18V18CbylXeKoEov8oJTJoHvnMuig4szYfI4uSWpXHVXJz9/
 m24pGB9ipz0QAN01oUTAy3HIxSuADMYdJDnMBTsk6Bzda4Pcp84m4npUwnSWUAl6EHEEo2PN
X-Proofpoint-GUID: iNexVawvBR_cUGNDfj-hQ917pPmLLEfz
X-Proofpoint-ORIG-GUID: iNexVawvBR_cUGNDfj-hQ917pPmLLEfz
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=6877be82 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=9pW74NbYAAAA:8 a=EUspDBNiAAAA:8
 a=oujwet5aPAZ3wE0JuRMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=67o8LzlnqLyy2xoPAWJp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=817 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160135

On Wed, Jul 16, 2025 at 06:10:41PM +0400, Arseniy Velikanov wrote:
> Added max design microvolt. Merged battery info into one node,
> since pmic fuel-gauge uses mixed info about dual-cell battery.
> 
> Reviewed-by: Luka Panio <lukapanio@gmail.com>
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> ---
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

