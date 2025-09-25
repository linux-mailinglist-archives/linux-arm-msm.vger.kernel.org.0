Return-Path: <linux-arm-msm+bounces-74893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E16B9D3EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 315662E7C53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36BD2E6CC0;
	Thu, 25 Sep 2025 02:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8AzB8Mu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD662E11CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768940; cv=none; b=i4WIqZW6RwZUKrD+xxVi4muc7lXemXP/Jg6NAwHK7chCJl4BO5M8UM0cc8sm1pIkJBYYNvnCuipqrhAV5PkclQk6Y8y89AohKcdIhX7VpVkj5CUgo5UPe0jjoXvyp1ONkkG57grLQUrykR8Jojwc7ZFL4IsWG7q3pFNmTWZoNBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768940; c=relaxed/simple;
	bh=H3KAcTmwmORg8SJ/xG7H5u+L0tAoDnAnaELg5U+7sqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhQrtpgFCbtNy/1N+ZSrd4sb4sF0/gY6JZTHovMraaCtcaOW4M/j0boKvfxkft307n9tM8RLSqttKX5L8ArNAFV0+Zsjf6JYbLoSg4oKPnMeqaRiC9bulsUN/uixl4UAgFk8SV1JZG+TjwGFiTFMnD8cNcqo0P/u9AWgmn6JLOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8AzB8Mu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0Z2pG024258
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lbAXN6mA77BRJN0uV3xHHBfz
	VOSuZFy9BYewzxG21Rg=; b=f8AzB8MuyP8nEoEpNuzCVS+vA1YYt3oDHjnpirqc
	Zm+6RCDvbDbmCgdTRc8loA4vgKo9Rvat4uKr9MfR3JrN82i6sBgHX+cyIFZt+Cu9
	0ay654UXCApI5NfFcnSmZRCsn4W5zKeSgrD/R9na4y1Q3maZT8U7TvVcBOYO6CCg
	C42D9F5+R8sWM6vAhGHS3PkzM2lDZFyWW/XJNuZyj7eloXKa8+Axv6DTJtCHOTEX
	OwJQNhXOkEjFSNMPnLqjdKc3ZfklAKvYGK4OagWljoNiyve88/Ot5tkVOUqAYjE4
	1zHnxqcWuyRgMEUDhVH4pteqU52Psq3BvcLGKZKoihCESQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0dhfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:55:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8589058c59bso168435185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758768936; x=1759373736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbAXN6mA77BRJN0uV3xHHBfzVOSuZFy9BYewzxG21Rg=;
        b=irf8yuPssL7f359DSozlYoSqygyADwkRoZot5TABKfIet41WQVm2/k9uzJW7/Plcim
         SX4fb1azqB9JODkicoQx2NpILqaPGDa/jKGI40phTlcZ+F/5jtb0mPTjcfzcSq574g4C
         RZRYlPFv9mzhBl99kMMUVXGmsDKfvusM2RO5STvwS2o+AWHjDyknYenvRiH9mVR5B5nf
         KseHu/5SSfXqm9E9oNVKaIDky4VLXCVzFo3j9l2ez3gRitMoRMAeHphL4X8RWoicavLL
         r6O4g2d9q9SXHmopyQ1OaWqn9AqIjd978krYMQGNke+oO5NyOGfcnT37qCGmPLt+LHGJ
         bXJw==
X-Forwarded-Encrypted: i=1; AJvYcCUHa7oK4o5rhdwyyqkg4pJxGrKjjEXnUFdKFeYmkF/Cgt8i/Thq4eiq5ltJBDRqXz/ZAA4bO1rdaeYWNZVE@vger.kernel.org
X-Gm-Message-State: AOJu0YycVPDbr0rmGBsgwM2lhVFx1JTHxSyrJjMFt8JKfwxorYpiMhrd
	l1MZRf4WUYAEcPopUhJZJsibZLZRdO1K/HLKP022bax3wIjSY/RdLMK9v/RRLmfpu9EQZmoqVpj
	AGJlfCQd5LYPNYj0d86YqosyPHgCR4TNyL8k/5FTESxb0Fk1kyI9Z4xRhjhbVey947/ia
X-Gm-Gg: ASbGncuYJNLeNuLlpohJgjT5QtUwpRkGnn/VxGS4NTvXL/zPm+MTpKSax7v6/aj7wGA
	z4cVj6t2Nf4OPv3OSa+uW9+b2q+XkOUvgxkQeiWJFC+lyJyUwzbkR1zl/FsDGdNB/LiVUUXXfA4
	ub0EL8UO5qSz7YRQjRgCZWu2/7a78Ijh+dbtJmXWHbctmBuRU1T7GVB+XJmastxN31AgvP0g9Wm
	L6RCUx3HoMqugVtPXqSpATnGrmHDJLD8BjphuiaUsQHONb5duypX14OyTwE1vKP6anUFRLVNAo1
	uc6V+gmoHLfakif0tFqEqISYr0QeT9E618jsksnLZPHQ5ASD4FUfgpYCM4ry4dEHelZSlWqa3MB
	UaPSRA1Ssl7VCy5ajVns8AxHmX4JdiiCsZBiF8dATXaT+vCWySIoZ
X-Received: by 2002:a05:622a:13d3:b0:4d7:e9f2:efb8 with SMTP id d75a77b69052e-4da4cd45987mr26133041cf.58.1758768936460;
        Wed, 24 Sep 2025 19:55:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDcOH8M6DYCRGbeJRkW/0/SS5z3YW3oZHH0vkC9OBNOaylp5NhxGGlOrhD3KELtaAzAefxGg==
X-Received: by 2002:a05:622a:13d3:b0:4d7:e9f2:efb8 with SMTP id d75a77b69052e-4da4cd45987mr26132861cf.58.1758768935931;
        Wed, 24 Sep 2025 19:55:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313fc1921sm266870e87.62.2025.09.24.19.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:55:35 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:55:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/10] phy: qualcomm: qmp-usb: Add support for Glymur
 USB UNI PHY
Message-ID: <xunzckmlj2gn7zxvklpwop2v32vmlvr2ri3wnykj45dufqrnzh@hvcuggj55lkf>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-9-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925022850.4133013-9-wesley.cheng@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4af29 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Es_qMKvyyIjXqoqR7w4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zjlB0u7ZjI5UFgSCUzw1lOWzEvxYe2U0
X-Proofpoint-ORIG-GUID: zjlB0u7ZjI5UFgSCUzw1lOWzEvxYe2U0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX4ggboW8vK3MC
 Wn7Tfmi0zayl4qGcdVY04nIihswWbH551GqAIBf05qahkvIAGBY6JpQB4sejDCeOxit3lmtxAlu
 VEm7BIMgSatOL0e7TPNertfnPktjWGZriTmD2P25vQp6+FiVyAkcDh36+r1zV4AZqR8Cqwuz/Xd
 NmmPoUzcSs8x+vY7fOjpBWxY+aT6NWhxEZ1+b4MMAc1yTG2GM4Z02Gx/AAtJxHwZd3Fb1Ux9oW9
 P/5sSdIG90aDy20Y2Cq9zP09Ij+QpgeuG03gATHfy11np6b+wFersOKa1M+MYsbET2n0fEZ1Xhg
 pUkSdJ5M+xr/eYvaL265oD/cDVqyyG43wEDu3SPLx6amiO2N9PJrabWABbRDByKJdD3zYy3wIkA
 cjgvnuaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

On Wed, Sep 24, 2025 at 07:28:48PM -0700, Wesley Cheng wrote:
> Glymur contains a USB multiport controller which supports a QMP UNI PHY.
> These ports do not have typeC capability, so it needs to be differentiated
> in this manner.  Update the QMP PHY sequence required to bring up the UNI
> PHY for Glymur.  The UNI PHY follows mostly the same register field
> definitions as previous SoCs.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 163 ++++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

