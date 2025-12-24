Return-Path: <linux-arm-msm+bounces-86539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CDFCDBDAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F22EF303643A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C503130F7F8;
	Wed, 24 Dec 2025 09:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJB781z9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIbO5oMf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB022C0F70
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569543; cv=none; b=B/ExdznrO3zqQrHkMmNEg4vuiIFc8cQ4ummsPCx3AtibNMVdmZmXvZG79IBN1IK7zFdOCG4TgPDLKbxRlHj6x2BR99f38MUIw3gB9QHLwKXOA7sU6PE6WmBwWRdbHdHFDvuCbNQMo6O4KmYG/QIXLon5zA0QDAZGBKz7ocCBwhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569543; c=relaxed/simple;
	bh=5B3+ouxQ9RqZsKmPuZn6TFIBEfshjHwSx3NOk8U0K3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVCjkB/AfCdb3O5ztQDTvtPn6Y88a3Vd1sC0qZH0EQlzgtdR2xRAi0+ODwGEYZKDjsqjrTYXZGX7vAt4F8vuZfcvVxAOOriX+WosoDKjyorPTd12CSXfCot1wcHm2UCUQZ315R9UBqRueAyyglg8VI59d6O5FllZsBUEOEbrSCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJB781z9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIbO5oMf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO593u01018073
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kNZYoGn84KEw3IN79kmyri07
	VMy75K8i2OKiRq3hRFM=; b=FJB781z9rhq6a/uv2Vk6NHSWReNhcA3csn4WDI3O
	GYX1496R/6vg2mReiPEh8SzYyqcU8x1PgEHyyr1iApIzwMDYi1XmgUQsSIJDBTRK
	lZ0yHAFHdU8pvt4OY+XL6hhlr/pbzbKyEvrvaIsZa8MvoxlLwQSCgglgCCfWctPY
	42A2bhC9wjeaaDqupr0SsyaCSu82Fm2eWhWO7/M5GPNfH20F52kb3DyAtsypDeqI
	S0HbpGYP6lZFf5cW89nUUXAkUXlfm2Ll/8ePvcr4hU7kRxHJQz5wKQtNyuFlBEZI
	kW0p7UGK8DzOLKg8nJTY6Y0fK+EOT808vslIg+4Gc20Kxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsagbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:45:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee1b7293e7so200868641cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766569540; x=1767174340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kNZYoGn84KEw3IN79kmyri07VMy75K8i2OKiRq3hRFM=;
        b=SIbO5oMfDt09o+xshYeHqlI+elFFeOPHfv7YK2no8+EWmrN9GM+cZuVli7qDWsSAFt
         OPsAMNv4S1OH3zR6G173lJOhRnfu/yilmR+WY8/u8B1y3UuJxWyHSaOZW8X1XwvRVWBH
         ASbjDs83jGAs5FuGwgmR3XA5EBEuO0VgTLAB0HWMvxtZvhTdTjmv317nU5KboPT0UKYf
         rRrTcgjUYZmNeWsb1C7rkqMGo9awdVzsY2D7rL0hFQRc90x37JcLN54dCV5b+u2eCQSi
         gUa5mIEhMUIlbSXiqPgSMpTB1NvuDpQsAt7W97ujgZ0n06e2nRWKbh+IhlDYTxdJwZQl
         TmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569540; x=1767174340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNZYoGn84KEw3IN79kmyri07VMy75K8i2OKiRq3hRFM=;
        b=dX5//Dx/dJntIJf7V9WVV4/+wNpHOlrqJciFusNNH10+Y+WZYp/nL2prtQcJBlesom
         yng/kdDrmaMB/WaP8UXbksbOBcpCelhHNDcMmvGyDbeOz8IgzLJMyoRag9pjaYvrtdUB
         QO9CElpd2VReCXosW1InqB+yXbJKit7Bjp7Z7mpviRtLVY91KRjtThInyZGHDklBi1+p
         x0ARFKwIMdNKo/ee7bcT6xfin9PxxZcSWTzg2NOQoXzXc5paxhHQ87IziWHvoiooWUAS
         pNFa52ddlQYc0ehshnsKiKNJQEHV1+kePVcWXQizecXvbrpVIPHQZ+B3pdSOo+oG/pEQ
         lm0w==
X-Forwarded-Encrypted: i=1; AJvYcCWgGInYkOumtWcdskdxA3gUrdz+T8H+4CSzMlM3DhohyxUQ6t94KUtdXoMj0gfGgav8LgO8wu1ZzmKdgAXP@vger.kernel.org
X-Gm-Message-State: AOJu0YyRbGiXz6Tnpc/+X1dvLv4mEEK6DiHkixrsau3kZwju4JSRzEjA
	Kvv5DQPdlHolHdofWqu9HQQBWD5TjwV3xUd0tq9RFVLvsupWVQXvIdxuUny4x5NedUSb81v4qDg
	fG/TGaRb77eT0rIczQnhPpbqEzJKL2pC0CA0UjLX5qvs2L5t8v/Py7nwtxQd63nS7o8h8
X-Gm-Gg: AY/fxX4Zwu1lP4nglKYWPK64kFf4R1+heXfHKpfxF/BtEICpjv5t7ySNqAtOHJBF26n
	u+wYuG8MLPUCXuDtyyKgExGXHqtSovkgTqA0GpuC2gVlLvVvlCoI10qgCESxVzt6m0/lyNX1ByP
	1oyHXEFJWOB3+sKMZhiwR1Ok3j2TXMhoNOOZi7FiwnetnOFAS3KTtemKKC1km+1pSPQjmtY63QZ
	h/Juc2aOol99fMMLT1zEUGm9x4RWo+MhETBqZ7PBYWtte2TwVKlGtkfhEyc3DlLfE6wGGZvfSdC
	ePn2yKuFbFXYEMHxN32373mKdhLZrirhDfBn0687Tm3eonZjBz/c0ZTlZ0hfQhXDTcDmXvWKrxn
	s5mHoig4rtFVJ2ehMJ4/6EQ==
X-Received: by 2002:ac8:5654:0:b0:4f4:d298:b47c with SMTP id d75a77b69052e-4f4d298b553mr72365391cf.28.1766569540054;
        Wed, 24 Dec 2025 01:45:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjSG1+ZBgqd8GIreMXd4dlylTmnEM3yAQau781ExM+qF41Z4K3TPcRZYouoE9IsTkeSfyEew==
X-Received: by 2002:ac8:5654:0:b0:4f4:d298:b47c with SMTP id d75a77b69052e-4f4d298b553mr72365221cf.28.1766569539544;
        Wed, 24 Dec 2025 01:45:39 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193522cdsm274610645e9.4.2025.12.24.01.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:45:38 -0800 (PST)
Date: Wed, 24 Dec 2025 11:45:37 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator
 support for Type-A ports
Message-ID: <b3ja2ca23epn56c6knbg2lq5uwr2rkf6w2elf4teehzym7yzze@txr2qlvgbztj>
References: <20251219161407.2075701-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219161407.2075701-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MiBTYWx0ZWRfX0X172ZV3Ngkt
 FC4I92/tfZcxhDWS7nmIE9PFnL/rUQFtHZ1SUGKLCrhZERdQ6wTLFrGoJyX3SF7ElWH2FNf77OW
 vF4ypb4x/A1dmYw23E8ZS4wTQqigskZEiiz3x1pxjAj38FuSlVdW6eVjH7L49l6xsge7oErsNAv
 AQAAPeRiZQICkqKqeHnoOfmChBP0y2l0/QISaO36bayCR54fttiZYUCwVlP5Zip/McPFdwRwJ0T
 +H/d1kMCoZR02dQ1Y5y7AsSDDg8wcaUCvS5xUyKOVjpL4ykqqD1QY2mBV3BBR4jNY+4iKZhsWSz
 /CQ7Kb4vOpzL6Nl/ufe6SBIi8htYJXxSwJ7fWLjiscMHWQoBP8daQcJg0wCZwbFH2sT+YFx+0d7
 tWJfcYkfrAhZWe7Us6N/FevB5caseL+QDJykBmi3e0hYWB6A7irmxWAGzW7vuFOhexWXvi9yhGn
 NFB9wF9OQpuuAogGLNw==
X-Proofpoint-ORIG-GUID: YUMMQmgaGnGCSLSTzdJ3BwLzgmy_zraM
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694bb644 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VfrTVM5IFoUUBtdl8jsA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: YUMMQmgaGnGCSLSTzdJ3BwLzgmy_zraM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240082

On 25-12-19 21:44:07, Krishna Kurapati wrote:
> The Multiport controller on Hamoa EVK platform is connected to Two Type-A
> ports. VBUS for each of these ports are provided by a TPS2559QWDRCTQ1
> regulator, controlled from PMIC GPIOs.
> 
> Add the necessary regulators and GPIO configuration to power these.
> 
> Implement connector nodes to embed the vbus supply within them. Since
> there is no entity currently that can read vbus supply from a Type-A
> connector and control it, mark the supplies as always on.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

