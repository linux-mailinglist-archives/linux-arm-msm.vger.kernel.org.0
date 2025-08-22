Return-Path: <linux-arm-msm+bounces-70383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F5AB31637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E3291CC3C39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8D72F49FF;
	Fri, 22 Aug 2025 11:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPqao8lk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04209284669
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755861683; cv=none; b=I+9FVHHEGEiU0fxk6GP3+ZkRG/GZ52omHEdXfDbQkccFvRaP/P1f9/Pj+wXyqZEGgzeZCf5ivCPzsX9xabrqLeXX0ODrysFmgf6vrsRXJUoz/jFlIoqaa/bUOIXsEPZl4dbAaYBrm5aK1UVtaOCGiKHCCeRC1K/muAqA8Jq8guk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755861683; c=relaxed/simple;
	bh=Ke5Bs1RSqo7dH0bQML7IfzQo5RoAdNMuGyO5ShXHmUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJQ1iJeh4ypEsT9Trguho25Azwj/buqE2XqZ9zPmQ4Vfo/bcTqB6F2i2vfKefeNJTTVBTjhj9TNkKBghZiM8vCALMU6dYL5Mp2Pe85CqRMilSzF0qhXnkmuDi++zuJluaXpDr4FdfXt4CoH2mCuKgkGcHYXoJjdMC3PhIHhzoYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPqao8lk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UW9x021853
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QOLeiRcyikkOXdelLFPCIu6K
	rPpr4gBP2+IVs5G5Gec=; b=KPqao8lkZItBexfa14dNxgB1nx8C0I7M8940NUOI
	xmTgTtKmyKHuInP/o4U00r4fSy6L+CNc8mXB8JqugryJDYw05opO2wyaFGtUd+i6
	I4pMwbe0wZGke//Q3YINvVxaRMGdo59WkTL4owOv2oI3xrSZIxgRO/hdVhtR/tZS
	IQojynUvjvBuE7vnxJJNAqskomWqSVoIeqgy4oUEXNpT+Vwr1eug1Xw+jKaZ6WL7
	x98qQkx6KSxOJ/F6NJuN5Sdbdv+ofa/OAtQI+LnwTxKib97cd9m03dser6ak2e8M
	InR/tlYGyqtg9PtxmP/gHccm3JiiDPEEV+yhSuL5lAOixw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a91r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:21:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ea01ed5d7cso211408885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 04:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755861680; x=1756466480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOLeiRcyikkOXdelLFPCIu6KrPpr4gBP2+IVs5G5Gec=;
        b=XlA0ZVsx96YWCC5CB8u1n9vaMijlOtcj+7jagz5xuvs64Eq//33Nvk31B3tbNhk933
         eiUsqAZiX7mt6EfNBOAhRH0Gaj/JYrMS2hnh1/15kk/JA2h9rkjZmzUU9vI/rZJSpiNh
         mzK7hNm/xxSQAuCDKAj3GY4NYeURXuAqNTFqq43bzdcFYQbQDP/difPVOxDF2hMJcOSK
         VasBV+OP0IjqRwqs/l6zCD6DsPZFmBr9PRCii6AWd5uvMBn7Uatv5O84+76Dal9wjv0H
         IjzVU+zn2JvjlC35iYUBVBFrXTuE0K3tCI6gMjK9vMnOf4wVALDrhZN1knogqddPYlnn
         rOEA==
X-Forwarded-Encrypted: i=1; AJvYcCU5dVkQN3LhNDQlg8CjETzfztUWN+C7wfDPoIEfprP9nBC4wV24mx8xYWn062Zj/OSDjpAVtO+nS7JLm/oI@vger.kernel.org
X-Gm-Message-State: AOJu0YyXdc6YJkYJbrkejdsBx3rJbPYJGzw4PIQMltyZ5E8tC4PNJ9py
	41FkB52erdvnOeWJLEW8h/X+pU2KdvBIGOr5GwuquVv0k3AwTOCBoXJPuAaw17/4S/KmkwHBxFF
	H27lmobu9HfjNW5ab9ekh4LhTHe+qtJFBruDJbpuX4uIz7cEAsn8Coxcoc4D2Ebtt1hQ+
X-Gm-Gg: ASbGncu3YXYbbt3uFXmWDavcoygS3HyfnWlIIkEaQR4cRb3z3RP9QM33Rspnf7vpFIz
	BsxQ/Wioip0hFAF8twuFgMLd1N+U39SgiRK8Z90uigiUNmvDm/pmTujgYYJQ3CU8KL15aOxU910
	DF8tAq9vw4Z/UEg9DRHKSImkE6WeBnTsUcaVxYLmLM62f9VajndO5zw8Rb6jwSbnBZ/3iFFtVbw
	/Jetk5nwl5IW01869yW33hffJdPSWf2bJfmGkdcudgmbRcxgaxxq46V6z8sDjy4RvFNHxwppSUK
	BMmyoa+4ESbqMFY9rpSeFNRsdOMJXo8HFgHTY2Csbi/55Qb5n8xWrKVDGKut6A8CdqT75fySrEP
	jjcVKqBxLgF0I8TZvljMC553KsriNA3TyNsMzlVMoze72qET2RdPv
X-Received: by 2002:ac8:7dc3:0:b0:4ab:5277:a5ab with SMTP id d75a77b69052e-4b2aaa3fa77mr27327251cf.6.1755861679714;
        Fri, 22 Aug 2025 04:21:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwEaOak01WwTjnUuienCHYk4SGhkFGQMG/CUgI7oUtTAemM/5tdVtKFnwof/wGNbh824CEIA==
X-Received: by 2002:ac8:7dc3:0:b0:4ab:5277:a5ab with SMTP id d75a77b69052e-4b2aaa3fa77mr27326951cf.6.1755861679234;
        Fri, 22 Aug 2025 04:21:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351806sm3431010e87.13.2025.08.22.04.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:21:18 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:21:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org
Subject: Re: [PATCH v2 3/8] ASoC: codecs: wcd-common: move WCD_SDW_CH to
 common
Message-ID: <4jklfoinsr7ldw5gn66kmfh4vwl7hqrhvnodakirsd5vx4uzqe@axhf5e7ei5g2>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822104927.2621866-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822104927.2621866-4-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a852b1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=g_yewJXOhfjxRz4zaJMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2gkwqVz_6VWLatWV6LIdUCofoswydo2d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX45yEEf++co+n
 MUy48XVhZwLlmWSKRCgsmd6mi3lvTr/W8KE1j7OtqOPI7A8oXXxNRfQhxo1JT+ELH4Mtxkr6wsw
 MLm5MEJe5UrADFupGBnGUmKGsH2YfpQIXcXpjSsxwqzh80hxmx/CgKObuamfMGa4Lj7Zgyysbvs
 53s4JtoTkjO7hWR3f7BwccxYLeFZOC7JGnmPUpP6v43PGsKef1z96pIFC2Idh+c49xdr9v8NLQp
 7sU+DdLGlIHxt8bbKtGox8M82icGBeRHAFxDOrbatLX8BnHvJY47Otbv6nA6RyCA8qBaz4wvbIr
 i1YE6r6R2Eniy3goCfSESGK4Xw8Z6pcC+VbS8IFEuZ0wcr4qkOPDf5tsOsi2Sd2GsbXb2WrG628
 YMuFKNsxgg+ulL5LL9RcVQ9ziQwEXA==
X-Proofpoint-GUID: 2gkwqVz_6VWLatWV6LIdUCofoswydo2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 11:49:22AM +0100, Srinivas Kandagatla wrote:
> sdw_ch_info and WCD_SDW_CH macro is duplicated across wcd937x, wcd938x,
> wcd939x soundwire codec drivers. Move this to wcd common driver to
> remove this code duplication.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd-common.h  | 11 +++++++++++
>  sound/soc/codecs/wcd937x-sdw.c |  4 ++--
>  sound/soc/codecs/wcd937x.h     | 16 ++--------------
>  sound/soc/codecs/wcd938x-sdw.c |  4 ++--
>  sound/soc/codecs/wcd938x.c     |  2 +-
>  sound/soc/codecs/wcd938x.h     | 13 +------------
>  sound/soc/codecs/wcd939x-sdw.c |  4 ++--
>  sound/soc/codecs/wcd939x.c     |  2 +-
>  sound/soc/codecs/wcd939x.h     | 13 +------------
>  9 files changed, 23 insertions(+), 46 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

