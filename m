Return-Path: <linux-arm-msm+bounces-74539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B70B9734E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 20:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 100E91785B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 18:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764742FFDCE;
	Tue, 23 Sep 2025 18:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="es8n5gGP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31D72FFFB4
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 18:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758652364; cv=none; b=pMXwEeKrVmDbAb4F0GF4BbXrQW6dApvX+i7fIL1aUtuj+uja/wUBScCJU06rJM1axqlYreCr7+bBfFUHolX3VgqzifA2+ArnBY4qwsaM2jK3npwrEk+XLGE6ScjIFa9ba0zOdISBu9MGvpNE5Wn78Mpj7wj6/GiOu4CCBkZgLaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758652364; c=relaxed/simple;
	bh=xlUwMom0yQylASsa5GD7EC+5DktGsdejR5nEE2JCl+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pex5CZhQYQYc3VfVOhQw9XwKysCCdHGYmu4RQ6YjY4DkdsfO5Q0CruaJ+DlGQWtbEgkpIbfl2RutOmtyNwKR7+GO/0fzyIriTug1vzohMN7KvmRjjoE1Qb4IDGhSZae8qIh9pNjEZfz9CwSZULszoLVDkpB8ABhoqYucTdEnQ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=es8n5gGP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NF0Khc014962
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 18:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0ywgl4YoydNFbxN0XRqWFqXQ
	EgLsb3KzEP1PoHIEnTc=; b=es8n5gGPQGrm5R6zA26WUXGLiyn821zeBMRxFToR
	CsxJJwtQ1/nIDVBeRUJTHoIf1vHpSgBUAGbePMCfqvfDwYwYgWVP3C4h/lNtAA1s
	ktpt8/NOEPxpn5hYTo24YMoWhniTHCq7LrznEm4REwmA8qD7TRsVSVUhIkUchWxG
	Z15SDM+n25tv6Oe+VEeBujJEQTsyIcB2VejohYt4/MDHFVVXds927/VFgG+7xCup
	mPRuOZ2eARdaCyDvkE+POTNdL1gP/D03SaSDCkt2m8WAbgiNtTk/nWwX2lAy2ORq
	X4URjki7i4uyh7gsyhBosT5L2b41fF1Ph47LWDq97IIg0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk5kvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 18:32:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4cdcff1c0b1so55721671cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 11:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758652361; x=1759257161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ywgl4YoydNFbxN0XRqWFqXQEgLsb3KzEP1PoHIEnTc=;
        b=ECXEOszQB4YZ9T7kA7XyrYhzJMmdtvBPZbNIQ5N1yrv9aKLZc1/lf8tl5lDTlS//9n
         P8Vg7063y9EPpxmz5F0DqYhUPVORPW9Ad/TSjCwOJDyGHyl0SISEfTP2t4CpSlDdQep/
         9D8w4OVMF9/lReQYy8qQ62Otxs6OriWrPDtb+kH13FHvG1VMiFObwHCpZ+2gd0cWKpOg
         N3NWpUNLzVvR6MljpIvpIJ4IYbcqH5Pkn8Xocv80AwEMzAk9r61VwmdbanjtNOkx+AX+
         EPYpp9hBGxTysFOevu/vFa8efsoYhWvR0mAU4JZHGylMQhPX0ozp9ElD2yz+/cUnfflz
         uX0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxQdHGLP3eOOi/4BrkfTmhsbRw8s6fV1vMIRNRwhBYFsPArUiVgyDIMmbm5J3wtoTVFtuWmdjtlO4p3/GN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4SpEkgPmlryuWa1snjGQoiX58KX0f6yJXuOVm89+9nnuzd8Tv
	2LFF+SofVujHdmifTJbOHYzKQLUzGogll5Hr+DJnq6zyeb9+9LanPPUFZ708PCoZ96YQhKP4uUX
	xIGBVUwFuaZthXU5bfbcNh3nJ2YEIdDv8JeU5MwZuYGZcUxcPSvHvpTMWAv+EUX+n4CMm
X-Gm-Gg: ASbGncvnqzBFke2X9wDo2olSlHPWFHr7peh3jJUyUuXBtQSdpU8g3C1yB79vy8FS5B7
	F0fdkWx3aD5jOU3iV3PzQeF7yREA6WDEu1ayBFx6o/cgbgjDTF4Ve7HcLu5fqNRK6RXzh5RCgeX
	cz98bNzzssd/R0OvBHIulJKML3fpKAXSwI7aeX2xbh+y93R9MXk5LIxX62fHInU5KgnGkOqY1uY
	tskPyx7EDqr44kj8lTXnp4xsVVYa5/JnBp+/AQdIFq6LEmL0l3tfGLPb2PK2BONMQmhzTpaB0hL
	K20FOJNRnjHFqcObGJZ17Jnm6vbzLDcXUekgIq/REyCnjqDTx4FI6G6I12VZxvFSG/gk+EbIgbj
	fj1giPCZLcwyVo8R/tZmybRFyOO94z67YxGu5QavJi8Ep4SoesMjO
X-Received: by 2002:ac8:5f8f:0:b0:4c3:a0c1:335d with SMTP id d75a77b69052e-4d36b898548mr37820231cf.37.1758652360488;
        Tue, 23 Sep 2025 11:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMBlvHXtNDgFyPI1NlAGqjKTycFvFqD7+JE0+3TxE26+LvFO3cH0FAg4wxgHNuHH6UPT3b5g==
X-Received: by 2002:ac8:5f8f:0:b0:4c3:a0c1:335d with SMTP id d75a77b69052e-4d36b898548mr37819791cf.37.1758652359989;
        Tue, 23 Sep 2025 11:32:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57a0ed3d148sm3565534e87.84.2025.09.23.11.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:32:38 -0700 (PDT)
Date: Tue, 23 Sep 2025 21:32:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Add firmware-name
 to QUPv3 nodes
Message-ID: <kijycy56wjgztfgltj773opeu7zc2ct32msbfioliliming6im@r4imwgdv3x2h>
References: <20250923161107.3541698-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923161107.3541698-1-viken.dadhaniya@oss.qualcomm.com>
X-Proofpoint-GUID: FQ4jd0qrOr4YfupK7KP-KWfTgGEkMvdl
X-Proofpoint-ORIG-GUID: FQ4jd0qrOr4YfupK7KP-KWfTgGEkMvdl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX9BKX4VyxS0lU
 sGFtH2vAkAmhz/Yx/vCnR3QTUFmRXrMcLiWfw1jPu4AKruacKGDgUJshoNU9uQB4OM630YwN3Uj
 AVnoUfU9knJwXwt+AM1yQdFZH8FzR1/i0IGUJJJzarG3l1p7R4f0e2yxYyC/0ZvJmFCKyah3y+5
 E/CRUGxboRLBAApNZfhF3prmYdxSJwbUcEA+SvszwyJVyysrYwGV+opl/u3uJu58OLaF9jQ7E6j
 Emur3mLoR/+9DRjoW6B5r0NjcidX28jhAYyR44iD5XeJ2Kz4ktYPLfMHHih1Cc20pr0dYRQ9skL
 2G2hID8pNJUUGEc0/kpZ4dNSreSQ76d/CZVuCKm/duES21LF/MzQSx9c3Hn4zyClEKePTQLMxZm
 iKhnfXT+
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d2e7c9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N2x_zcOB-Zb5SKZ0QwgA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_04,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On Tue, Sep 23, 2025 at 09:41:07PM +0530, Viken Dadhaniya wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
> v1 -> v2:
> 
> - Updated the commit log.
> 
> v1 Link: https://lore.kernel.org/all/20250923143431.3490452-1-viken.dadhaniya@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

