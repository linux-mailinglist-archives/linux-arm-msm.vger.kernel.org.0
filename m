Return-Path: <linux-arm-msm+bounces-52232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8A9A6C12A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 18:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C570B179B7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 17:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2EAE22D7A0;
	Fri, 21 Mar 2025 17:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkhnGGp4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747BD22D7B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577647; cv=none; b=ERu/7Lg9yFlSs0U0xHuEaWCJEYmaH2Nd48Z6W0N7inqJbuJmSVGKznvL4SXpgJcvj72EYpD6tNYBfBIYAguOLwwaBQ96LyRz4SOyPMjd0ooYqV0BjIGj3/xDdh2JuS8S5v0YFwQb/S4wp4xZ6ejf7lOfeo2QxUl98/b/3TDjP2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577647; c=relaxed/simple;
	bh=qmKoCAZRoRbHTTOKcO+4PVhKdKeMHGgyeEZ3jlFoy9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=totv7mddq7hdY27SbfZeo8vNHj80Rt7ms3Ty9BSVwaP8W/YdTp8EkhcYmTclP9Pm9eSNElIGsHNpUgHnfOJzkL+L+ZJ2POEy3Ym48aANbS/9Icd0RNhdVOe17L3mg1jj/bHYbf29nAlSa0hhSbOBnADCDk2XNOoHWarjW25/5iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkhnGGp4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATLn6001207
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 17:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uDTpwkPptGdzgbOoxDa8xyDZ
	cduGG5xDhf0EsIsjkOI=; b=dkhnGGp4E36ZPnBzDW9+hVc9fAjGmC5BU860RBm+
	tqmgwsd3pznlFpM5KMgCzG4LH8WN2QOiUj3Ka+fR7uUSB5O4adT7+rVbvjfIWivM
	QfxVz05f3Morlm8DScJyFJMTpuqASsj4lN38RVYxnyGDle+1RxLff7UYYdNMHioh
	FVz59BiX5bQpV0IOEog0kDxHQgL0kKhhIsIYGSB5sNBytRC3EnAeaRtAlpKCJyO9
	y3sF3tv8cnvxbSVfML3YjZ2RH5A0N8q5Wxvr9sIKDp2YgpgiTdSk/nYsfC54o8as
	z5zZgEKLSJWuu5OBi7IiR9X9agyfBVTP0fT94FPIIS7sHQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4u9sda7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 17:20:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4769a1db721so51517801cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 10:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742577644; x=1743182444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDTpwkPptGdzgbOoxDa8xyDZcduGG5xDhf0EsIsjkOI=;
        b=GPYbv1T0kqN/Bc21lFJFsFmegyd0n8EuXS1RTovm44Y13U2KNuFxK9hhE1PClTh6m5
         K2ERNXtien1yT6/0Chq0OioFNN0UDsFwsE1lIpS2jzA4z1qanQDyAzosed+vFt3YqSzu
         qoI6HdOrpr503QHInwngQmVP/0l2JYU6Kn9CCkPnnt02zoKilnDVZncc2NKxoSJvMl3M
         gBXWkNbfhCrlXm9pr7popaB5mJx/In6At3F0Jv7UqRXEFrZn5rLdSi3o+e6opZ0QNI9p
         g2fRBar67wTkFkgEZDd0ShXVqRDqmVvGTVCCSaF2DJzdJAma1GGe0CtH/x+UcSakWvi9
         tTxA==
X-Forwarded-Encrypted: i=1; AJvYcCXxy0cc4OYutXKtCpz/W3A7BKMzDrv3N33DNKGp4iJWu5+69zrfUqKygm60oT2LHgbnd2TGsz38QsjcfRXP@vger.kernel.org
X-Gm-Message-State: AOJu0YweSVhcmTyQU3jlReg5aBHwIKxbovqMAOvuO758kIXtVnVBhxYa
	RX7EV/ACczkj+biw1uSxvfL/cdUG8ejv8qGrB+BcM9hi23XclcldoseNhFC/DYREr0Lg9XFQh3o
	gCxIZ1ImBP8BH2xjDyftn846qymGS9ioqzGBYJDEb7iVNgvNEYM2R4kVJ85fqr0cV
X-Gm-Gg: ASbGncsPI1NJoYPIotk96DIYs2nsJcvxE1UmHqUnPk4bo8eUk7RJXJXXSeSm6aiSe9y
	ERp4eIIBMcFRn9J5Eegsi72loQhqLlc4LqWdhQCULdouiYtJlLlIsmOIhccxAjiwkKMMRsvdpzP
	iou1e9XWFvbCQb4+tu1J/V6uhTnS7RTNu58vGjcJonJEU8np/0N3m6Ikx7JMU2t5+lduSrWB9al
	SrJfdBl/jQShObS/lnQOot76gwcC5QZu3ZBDFiOiJbomj1rbai2OTefkfKEeiZLU40rj0XSiYLc
	A+1uqSbT2xvyxtkf/XvaSoxBErIPeMAWSBh+Gc65vddpxkZDXyze+0a2RUX7hs6rb5LUhRU9ywv
	zRf8=
X-Received: by 2002:a05:622a:4d8d:b0:476:a7f2:272d with SMTP id d75a77b69052e-4771de8b4b5mr72699101cf.44.1742577644388;
        Fri, 21 Mar 2025 10:20:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx0VZLa5EFNdEAjuIa1FS+mTNMST/xHfZhUEXNJJ7m5u9qI7CPpdWYXoz0qNcBgm/3w2c4Hg==
X-Received: by 2002:a05:622a:4d8d:b0:476:a7f2:272d with SMTP id d75a77b69052e-4771de8b4b5mr72698801cf.44.1742577644139;
        Fri, 21 Mar 2025 10:20:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c98dsm225951e87.67.2025.03.21.10.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:20:42 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:20:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: add APR and some audio-related
 services
Message-ID: <aglvc2n5acln7lnnsnoyzyxega3bttz7qrzmmjn2atr77xsvph@dpzcohdphgdk>
References: <20250321-sm6350-apr-v1-1-7805ce7b4dcf@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321-sm6350-apr-v1-1-7805ce7b4dcf@fairphone.com>
X-Proofpoint-ORIG-GUID: fuB5QqIGPgP-1DuNOVP9VaN8CF3g4sFf
X-Authority-Analysis: v=2.4 cv=FYE3xI+6 c=1 sm=1 tr=0 ts=67dd9fed cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=d6hRspmLNtqVbEz1Xe4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: fuB5QqIGPgP-1DuNOVP9VaN8CF3g4sFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=833 mlxscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210127

On Fri, Mar 21, 2025 at 09:12:57AM +0100, Luca Weiss wrote:
> Add the APR node and its associated services required for audio on
> the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 59 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

