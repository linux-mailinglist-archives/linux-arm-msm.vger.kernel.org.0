Return-Path: <linux-arm-msm+bounces-73670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB05B5934C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFB27322006
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EAE2FF67B;
	Tue, 16 Sep 2025 10:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GnSbv5g/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDE029BD81
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018039; cv=none; b=EQiHv9IxkGN6Y5+uYgkH9pUG0Yvv2TCBYWarhH3AYdp7B2eKuEtzq2kepn3dCnQJ6Bmjdr7U8BsSZQy4R3oehBR8D1luiAG/AQANNxGSMd6LRsfJEr80tjA9HQNK53/+kmahq0Lsl6j067QNJi972a6YhQyWWcH+sFYMKFD+lL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018039; c=relaxed/simple;
	bh=Z79MuAHqLmnfhIXPhPe1WTgGzRY3sqQwPS+B2AZHKGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7RRIdJkE6nzdEb7Y+8uB8E0LGbtg2C3iwyu9iQwyLpOXXJ89Q7wMCsxZ4EbOEu/cS5i3ZtBm3mIWkrhyvbULa/IrghggPyFYE5z5bTZ6keN48OKgtB6DnMIUxATTitu7Zsh9J+x/EU/ouu9WSi1v+F8+eJ2AMZ7YGkeq+B4VTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GnSbv5g/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9odlV020031
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fX0Y/gtR++vND/LuB2Nc1fsO
	EUd47UfUpCZUEjof6Zk=; b=GnSbv5g/5O3hW81nWJ7ffFKFtbH9IDf6UXsaINIf
	SVCUblUcW/qjJdYivWkOQe5zw7uZxPqnBiTqoB4SqZRsoWGJFH+sHFgSxs/vNlAG
	Lu4e+AiGiqK6CzA/QGQFteHdh00+C906yXsYkVuvsAxbQspaRpyHsyFloSqbgVv0
	Z9vYFcglIbaoYgUb2qvYygdfDMKTJQILB0YktwMLKwmTL8wPbC09UV8UVcATpDiU
	oOdBCD9KRgDv8RUWuX56xPHtpbe5/2r7yS88nGLpC1Jcwcq2XHbjP43+2T1rQaeX
	sIYf42LSBb33dU2ByJU1S+iVzTy+fZSYIpytDI+qXjhuQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1sm0jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:20:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5f818eea9so101799091cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018036; x=1758622836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fX0Y/gtR++vND/LuB2Nc1fsOEUd47UfUpCZUEjof6Zk=;
        b=tVBHqyjqT3n7ZgpMTsXxVfGSDBIvtLRrREJr/+hLyDHbPBcjh8OlSsPPEywZ3CGxnA
         uU/ep68v0MY8a5YTGeDNzLr7RISueTy66R2sgF/peSChUgXHDJK4UVFvM+TOMkiaqyO5
         4fR+1i+aEDisUmx+T6mYgLUXAE8Vx2PuXuddBSZgaYW2CzownlFLh9uomHd84Ith++Vc
         YmygWWevftCvepa8JN94wK/rM8LWXBvW2zpWE54CAfIlTxineUCjpfA5UHKhMLZimJki
         nteVXon8Q8nOTzkb2Fapt0M8tbEWg7mY/JVBCrsW2dcEviGAY8+/uhBOjThwA0JFPh46
         2KaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHbXHp3Ip2jJYKAFzmIBQxMjeM8U68EgfdRizp96J3Lx0+X4jK6z55JvESwxXF0dHChP5yewVQ4JWiALvM@vger.kernel.org
X-Gm-Message-State: AOJu0YzSXM5MWABLxTYib9NQuSpm9AQYyAD0tX2UIbePrKleESBlHQgu
	M+LalIUx7ceTpoNQxa3doetNzsn59W4PuG3xclWRgLIxdXQWrPodgl1lDS6h+xI8R31Os8SEWXn
	w1wlqczyplWaEaKFhdlPIWt6nev3kNjGtwHXw3fGq35snFy7CtZQCIJxCGMXmZYzcrkaB
X-Gm-Gg: ASbGncuv9zKF/FHmVJ8itKK2S4WK23Py7N5NAU0b1YAHObON5r5jrXciwW+JaTLf12A
	ccQB9/gdJ18VK9SgcF83QKxCpNDjazcLHjF00TyDN4Ql56HN8Dwx6WRSh6GWQEqvi1HwBny24O4
	cTyfb09JVhHIrK/z90oVwtT5J1pykSR2rQM0hP1tyJJJkB6hB6ONqAhOJrbyxScasiLUH6kGTBM
	WOBPp16sEGe0dQ6g/9npnYukpFe7e/5IlvrymajJvRSprsspGNres1I4R3xlEV4p8/VmwJzv/nA
	nonKe784LCiw0IiujT58GO3yIVaB1ZGxrWcnMISWELfEGKao1uEbU6uPkW16jQjrfVoakDfhyye
	U6XSjWgQSV/4tshFT3iPk4cDfW02IVM1A57G/+SkSs7jjLiv8wcb1
X-Received: by 2002:a05:622a:4d45:b0:4b5:e644:67e with SMTP id d75a77b69052e-4b77cf982a8mr262930411cf.16.1758018035903;
        Tue, 16 Sep 2025 03:20:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwQ1pTniGU4JXGr/sMdK5biZOWU0CLhI+tTtSwMj7eFmqrGcBZ1WkDskr95Pi8m+6q+eazYQ==
X-Received: by 2002:a05:622a:4d45:b0:4b5:e644:67e with SMTP id d75a77b69052e-4b77cf982a8mr262929951cf.16.1758018035258;
        Tue, 16 Sep 2025 03:20:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a8211d6sm34724701fa.43.2025.09.16.03.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:20:34 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:20:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] regulator: rpmh-regulator: Add RPMH regulator
 support for Glymur
Message-ID: <gsnmpdxnuihagle276sagfcxpblxvwtjztb34r53f3nub7be5m@twj5lizpevpd>
References: <20250916-glymur-rpmh-regulator-driver-v1-0-bb9b00e93a61@oss.qualcomm.com>
 <20250916-glymur-rpmh-regulator-driver-v1-4-bb9b00e93a61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-glymur-rpmh-regulator-driver-v1-4-bb9b00e93a61@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yFuMU6Y7Q51Yz4kNlk7Z63ZFNFV_NsMh
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c939f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=A_yzNFqrIlXfnZhuJ7gA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: yFuMU6Y7Q51Yz4kNlk7Z63ZFNFV_NsMh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfXyHJNevSSy0XZ
 LWmQTvSPcitxTqfLQRlcrJOitVu5JRkFVffqobzgjhtQtL/09qOjN1qhEIJZQQIlPc2c8CDOm02
 Rz5viS755gEFqN/rsPy5gtbLsBs9hMxdQM58GoGZQauVMM2mc/mhk8Td9sdYUhIKlf8dTFLYKbN
 Kf1qrZ2YF0Zqpfv2TiJjlzBRdhohCn0jCWckwthelGzIeYoybRh8ZVHZviiB4S3w987I+EVHgIv
 4C3R/nc5uGLfcGYyMtLDhtUK1KIVe5XzMpyGT6AGjpUi617/YisJDnGTAwwl7L9KrUAuLb18nuT
 btpN7mQHsQ2zEhoizWJcE034dkXRxs+m9u+bgscdg7SY2fPBZELZRMEG0OLB1FIuacRdPJ4TlU0
 m8WCrLRx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098

On Tue, Sep 16, 2025 at 01:28:18PM +0530, Kamal Wadhwa wrote:
> Add support for PMH0101/PMCX0102/PMH0110/PMH0104 PMIC voltage
> regulators which are present on Glymur boards.
> 
> Introduce new LDOs & SMPSs under them (PMIC5 subtype 530 for
> both).
> 
> For these new LDOs support a new optimum power mode(OPM). In
> this mode LDO will automatically switch between high power mode
> (HPM) and low power mode (LPM) based on the real-time LDO load
> current. Its operation is analogous to SMPS AUTO mode.
> 
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 188 +++++++++++++++++++++++++++++++-
>  1 file changed, 187 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

