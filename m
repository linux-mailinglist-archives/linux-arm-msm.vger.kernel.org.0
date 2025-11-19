Return-Path: <linux-arm-msm+bounces-82430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CCCC6D445
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC91C4F86AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 07:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4B532B993;
	Wed, 19 Nov 2025 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIKywK3r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAwSTPQT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A572EB843
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763538716; cv=none; b=k4Az3EU931BZNRQPib0CuloDLNPKw5cr0XL99cPR6UJOotG8kaBovbDNY3qDE8+PQy3B2qcwnHNtekba/lYMn4jplJSIEeRZyGHJ+i1ov6tSPKvxr5iqsTBpdRhNVgBR1i0IXrU8DYIIcdtkatEsatAwBQB2LyOO7b5kW3hCzrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763538716; c=relaxed/simple;
	bh=wWKQDuouWIsDixjwE0XyK+8nltKyTBInoJL1AP4cxoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTtdSYMWHuzMivSRZ5lVoUKFYcxD2TE3l6/bL/e/ieH3ViqPXyswDf1eKOd5RZOw7SJp9HZQYj69vOp5qaQKAMB/fgCOZWYcQ+bHlivCARC+Q79klj4ROqe93nQtJpMhm7ogelveF34RGBIyKyeXIKmKAjHevXY4kwvSCl5n3z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIKywK3r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAwSTPQT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ1u9UX3165027
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2XjfQmr7tdw+9KHryrOocOif
	T9IiBmdnXI4W6fT2KkY=; b=jIKywK3rD63Z/R3mA0eipkDq8Y4uKlglc3lPht1H
	2BpD3eU8ynw5031nkH/rv89XLuOZv0/x3WRJtXCQucc0ktQxt4IFTKlVuAf89XRy
	6Q4mbi5Y3m9n9uE23GhvXZoayxGHixUegHcTApXsLUw7XzODOAvi4oS7WREowacp
	GavbJ0fYnzcxaeEtX6Gmben0aLAbVrJBFtmCfKUD2w3hwf2W/UkWvVLbnZE1Wykq
	WBQrhmlzmWEHaiNOHeQfRwvnHf13UdY2a07V8d3BdRhPS0fK4vvS5+v5vEpoBdtt
	rcw+8DzMvk+A0s3BLVjWLqYLMIS/Z/9qHgX//nwelDZsfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agvqgt9xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:51:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e4b78e35so930752385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 23:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763538687; x=1764143487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2XjfQmr7tdw+9KHryrOocOifT9IiBmdnXI4W6fT2KkY=;
        b=QAwSTPQTLjaD7lQIO2DokUZe3BSuykMoakkIr13y8IqwElqFf0Bo8eCcVQZtypchmU
         8WUKWbN6MUM5wcScCBUr0ts8gsAtjqrlBGWcRiyNfR5dyooGIEG6I2ZjISdGQsDHP7X+
         HFDeqocdSVZ6X8E2EbGNz7FbiyjaAdHWUrIpVcMkY+0MJ9DOgM4SH7OlC+oqbEdYDyBc
         BmvuCQmMWM6uFJXwovlkx9ssdjLgt4ipAgYgleLivEtShY8Aet9Yeba+Mi890u2mqIzj
         3c9QLk5roUSw1IVuSMgcQctWH2gPj603wyR6D6Dl9ndQ4H084hIKU/Do96CY+gB7XRAM
         in7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763538687; x=1764143487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XjfQmr7tdw+9KHryrOocOifT9IiBmdnXI4W6fT2KkY=;
        b=KSOZVHfLBafktf59PMD2pm6y5Z+XmL9vYzY4BndylOk06kxj0dAd/oW9WFLcChAhUx
         jyYcEbd1IYu0A7u/84wpd0WqQFWICw3vroYFqcKnL64IsLE3/ruaaCywTEoOq/jrLJI6
         Zi4fnUORhtIf61NENzgzOOsh48kmxmT4yIrifJpag2vxNE2PLKgL3NwBc58VX0yXz3mw
         WFMEyq2YF6EUINM44pl5CGuo+bC0BI3NRAMiqaXGYomyF1SHgQISaB47bFi7vUFdsgSs
         LWoV4z+XAXTBFiDfxCmumXQeNk62o1vmlLM3pC/Cgm4KJ41rvsoqgUdAYwoIyiHJhR6n
         7qHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJfX1PjgiCEmz+KHM7gE3Hm82F4OYuDqhTvLqTeX3IVwxktb/Tw5vXVOrmTN+9CpxvevJRQBgIgNnNKqsb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd++p1fxxWl+0V2kWc970AO7HaWOX2OcLuKLYi78XPpwTiY4C9
	ocSNCCRNUv2NhUMqAb4lqAbVh/ot9EHWtSfvcwxrXs9BPNCPufmE7S1+/phdTYocPzSV+GqbfFZ
	0lrSWd/aqqlAJcEHqpr7vC9IZjBdqGxDp+ToUJwXsCPs3mSMOJJvI+Ve1ZaCTB9aa0zBq
X-Gm-Gg: ASbGnctuwlBQvmaZK1tH7ZWTXKVbgDnB7HRENwFtiL+8VeUVZilp4tquCtUL9TY+itS
	H6M9arUwU/lg4ERmBtbFHQMc4Xq7S1G1iOH3Gemg/SUtBRQT0B42CJmNGLgx7GQK1FI6tZQLYFv
	eyZj2Wjfj4CVennT+D0CPJr5YFX/LoOPvfw/2DgBiyHcu+dpWPsCOcwJZTkY865ESZLUiPS/uqq
	Xb/o7Ll0AZHUsYGgEmayzyVhxLWHKeWe0683Teas785KNwOjuigUGepmEF49GgeVfDZ02DWR4Aj
	HlD42hSck9i7nQMOmuNx7iE1iRz4V6HYHJ7Pp6FYy2q8azuo3erifhHMRsnzRHhC8upuIOqnlUu
	eBkEm3242kO67+nV14Mc8AjqmG0yODjYk9sJ7vrdf/M+mF6XAnFmU/XsfH+6TaDVhQ4CLmGAaiE
	BYvf+W3YnldOVkxfklUZvvBHs=
X-Received: by 2002:a05:620a:2908:b0:8a2:a5b2:e3bc with SMTP id af79cd13be357-8b2c31e904emr2349528685a.89.1763538686834;
        Tue, 18 Nov 2025 23:51:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmwiwC6dVFx6NmfG+wYr7pqxNybyE3jGE4HgxI2bEAvpklfPkCwwaYej8biFwFpQXl2WHGsA==
X-Received: by 2002:a05:620a:2908:b0:8a2:a5b2:e3bc with SMTP id af79cd13be357-8b2c31e904emr2349526885a.89.1763538686425;
        Tue, 18 Nov 2025 23:51:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b8427sm4454564e87.45.2025.11.18.23.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:51:25 -0800 (PST)
Date: Wed, 19 Nov 2025 09:51:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        quic_shuaz@quicinc.com
Subject: Re: [PATCH V2 1/1] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth
 support
Message-ID: <j4ji3vemr4q4t7lrnkphi3thd2lk5ngfm5gscuabiuuadc6b56@byxfajvl2r4p>
References: <20251118140406.1551669-1-wei.deng@oss.qualcomm.com>
 <20251118140406.1551669-2-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118140406.1551669-2-wei.deng@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: XSnJfqyCitblqULCdPT_4YRO1KZzCLzo
X-Proofpoint-GUID: XSnJfqyCitblqULCdPT_4YRO1KZzCLzo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2MCBTYWx0ZWRfX4Q7T4oSC+clL
 sqEWLMWbgkI2X2OsEuWs5ocBQmaSFUbHU697HRErAT+O7lCa3IW5wKDn6fMU34hmsJZjfBcpGPw
 Kds7Y3+YdxNHxVKOin5ISn7sDNTldrNr+kWS7ns2+y8mat6Fz2qHi0VwLKLijwmfETatpp+dNxw
 +GvyfIxWTY6MDSTnEOqAI4yEXKcfyHYYq3zM5F7wW4lNWnYPRimM6n+1q06SRTuwo5R9b8zcjm4
 AJgUUwpCv8/fcysDdybWJIwvyPmOAPIk8fqnkKmw6iq1Qjk3jX8EEPDt2h5naQ/nRJH7oLPfonq
 wV2XOo3p9UDL8LCwMb/m8fWta26gng5vyQoHu+OOf6/1d1+6krcEvPmMwIpLDOhLY6A1Qv/74Fs
 5U+9qfxCQENZ+IMlM8RXOoPMGHwDXQ==
X-Authority-Analysis: v=2.4 cv=LMJrgZW9 c=1 sm=1 tr=0 ts=691d771a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dDEM-9S5bOE7Kyg1U10A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190060

On Tue, Nov 18, 2025 at 07:34:06PM +0530, Wei Deng wrote:
> Enable BT on qcs8300-ride by adding a BT device tree node.
> 
> Since the platform uses the QCA6698 Bluetooth chip. While
> the QCA6698 shares the same IP core as the WCN6855, it has
> different RF components and RAM sizes, requiring new firmware
> files. Use the firmware-name property to specify the NVM and
> rampatch firmware to load.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 28 +++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

