Return-Path: <linux-arm-msm+bounces-63817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D2AFA017
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 14:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C65A4A6820
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BD325393C;
	Sat,  5 Jul 2025 12:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VoPZOof0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0058376F1
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 12:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751719594; cv=none; b=bRAz2LJuoCAqR+7CPmf1NKt8eCp8GkJVh27wcbuSrputAtGicXPULcdjYTjzNdb9CG7Nf2gOWdqrQwMY9KPQJYAGewHz6KHeLz6wZxbhdhFao2nh9kVg2d4EXrgKvrJrb/aKReME1cieVEzWnyheFASdhL4BcvddGLbLwW8GoqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751719594; c=relaxed/simple;
	bh=+QWiZ3k/zz6MPehIUlRJoQCAmNRvIffiV3ZDmpUjQDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhu+m2nSOx7FaBWDz0jV8bLQIHw/6s9Cf+j7l2nZdChBtBvy/722NpnIYe814SaoO5mt2GXdhzhk1SfSh22iBI42vWWM6A95ESdIcu2gCFes/1gXMt0Pg9N33PZndxgCDPivE1WHF9kzkCCD9+amN/1evxL8eaeH42sgwaQJ9sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VoPZOof0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5658DBQP023921
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 12:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UYd/QM7kNbzE/0+JdoP0lyMt
	hOowAH6D1Fe3WmozC5E=; b=VoPZOof0xNRKqXrdnvvofYojgiI9T+HjtAWrg8aS
	B3XcsHsjyi8KzxiDTtkGkmt3rtEbf05Y8Ijqnf71yBpYwBqqP0wS5gBb/0zNSQ0L
	2Y0998l7HoU8TFVx112FhiSDWxjW6D8CN8EJguxWHrDTtbwHfDKOSIkDm75I+2Mu
	ocTxI4rrKsbmXoJnPYQsec0j8LlTyRfKejMgyoJwvmL8ic2NRvvSPRh+ypKY64FX
	+neBCxK1cN0Iju3SfLHVjKvVtHmUYG1u7dQQ7wr74ZZ5jw82OoEicGgeiKEulmfO
	+jTLS6cQGkiVv9wlkh7fA+D89ruIML6f8ODdbrQFsNlckQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucm926b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 12:46:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d4576e83cdso487770085a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 05:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751719590; x=1752324390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYd/QM7kNbzE/0+JdoP0lyMthOowAH6D1Fe3WmozC5E=;
        b=N7cSbTjC/XRKoTed881GeQratg5z8gy2kpl1ASCcKYf2T18ZUY5CsMY6pm+udMsRUi
         tmG9eM8wHHY4KzFKIDdlbxvcyCudbE1g0ubex4zdpQJxYfUitBGHwGbJUj1BjxIu85BU
         flEegFw7+K5/J8mXpy1SUdNsXxbvsl5eVxWpbhUYnkmevPIVGW29RoWNU/48zx4ufTM8
         UEfK4GPiilQZwwia2YEqx9Kv9cJC1qtpFF/ViBwIX7Lx4VBNkXCvz4jb0zq1m1BYe1U3
         FNwil0eAIQruusGZW8zxBY7D6Pt3ZNpbmq/k+jJGwBBDkCD72aoNGbtagWer9Sh6NiGi
         2K4w==
X-Forwarded-Encrypted: i=1; AJvYcCWVtqpomjVwmX90/X2t1zz/YeaTUpbDfeRHLCGJKjqjEseOMULGBt/iiTDm8D3A+C6KCM2f5lOdQ64ThAwh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyea1U2nWaX61qDFVECnGqqvjxuVfsm8kuo47IYaVdk5b4jI/z+
	9QtBzMpELFncRo/8nrTKo29pK6kKWDWOYTJcaGgD0g5gEY6tec9H6mRUv8K4W5b955DbcKn24EF
	+0KIP8wmzYSTNRAK8049vxqrd2IZ9RHar0LddyR7hM7A3ZLRYauj3FxlkbQJPSePzLb3H
X-Gm-Gg: ASbGncv7Uk497UMb3AbyY+q6IwL/HR5lDpiBwYjumI2i+jfWkD8NN7l7pmbBL6+LYt9
	gOhpyNT/HkpPzfAU0S3S0PV674wPDQ+cCF4H1LSXVuJQjc4ZmuVZydmWiX/29TsXdHqjKU/16/0
	TUcwehfaJ+WP2qPQKYL2x8r2oMYbxiKUm2oC32VPoyOfQHOaC+DjMKiPAcS89PGaFg0qWkjZSlx
	vy1SPFvnQWc2xyK36ZaAcDTsmcDVtGbRbtIbc2uSe1wvyN7Xpsj5iRYAWBx5fO2n/4Y+AvSv884
	pmkNwtWaHnbwmT37NoIWwH5hhS7JgfkCcopQBx9z5Uo9ZFHmT5je51/atoJW/yQeehi+5aMzC1v
	7eQqJlO//g48wzaWRmWlMnZUychmWiYSF7PQ=
X-Received: by 2002:a05:620a:2947:b0:7d4:53e9:84f with SMTP id af79cd13be357-7d5ef3ea607mr271221185a.3.1751719590018;
        Sat, 05 Jul 2025 05:46:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsjh50DSBiojtn0YL0uID2TDa0qxeaMgUcWU6CWXdfPuVnZLYCtykVVhhYWDqjL3aJw+mepQ==
X-Received: by 2002:a05:620a:2947:b0:7d4:53e9:84f with SMTP id af79cd13be357-7d5ef3ea607mr271218485a.3.1751719589582;
        Sat, 05 Jul 2025 05:46:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d2fb8sm569861e87.58.2025.07.05.05.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 05:46:28 -0700 (PDT)
Date: Sat, 5 Jul 2025 15:46:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1-crd: add USB DisplayPort audio
Message-ID: <fvyx662cayttlyrniyjifu7vi5sflmptzs323wm4a7pey7ethz@o2xq2j4ifwx4>
References: <20250624122933.54776-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624122933.54776-2-krzysztof.kozlowski@linaro.org>
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=68691ea6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=iTZVlg6EzTYP-dx1yXAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gzqLB2zlJJ299FQrsUVreoX_DJlPo6ed
X-Proofpoint-ORIG-GUID: gzqLB2zlJJ299FQrsUVreoX_DJlPo6ed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA4MyBTYWx0ZWRfX6zVVuIzv2Lhs
 M/N915DdWiIOclatQMETiZk3I0EErPQBNAb4o/05snl6W1NbYmJM76KfyzBDt6J3NbJ06wI+KkW
 NFUyaJYBkogGeMtGiyZW3AIRTGkPs7KYIsrL5maD2B4zYVYgnjLeQCDGcZugmb1jwDd+BVaUPdu
 iWr0qwllRaSlumjh0LKIVBtgj+Ld5Ev1scPBfmlRG1gDDrpzAe844dUNF8eVrpqOFvyTnBxl3cH
 qq8Mb71Gg5G27e1+SAG6q0zAyrunRnLWWqleez1tXf6iIvsgOiwGQ132LTqfJw2OFWeX/8STDyX
 WUWb826o4LqbrnuPOVAxdSP7xEvA45Ku4FqhF8nCE+75u5/Gh36XTqbgMJpwWFVA1+UpCWL81uq
 SlZsHOL3kRJqLjLcmxEb+ICYzTrT0c+PZw3jErGqhr4oolGr3/wYs1B8jMxrTCmKF8XO87WL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=729 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050083

On Tue, Jun 24, 2025 at 02:29:34PM +0200, Krzysztof Kozlowski wrote:
> Add support for playing audio over USB DisplayPort (the two left USB-C
> ports on the CRD device).
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes since v1:
> 1. Rebase (x1-crd.dtsi appeared)
> 2. Re-order cpu/codec
> 3. Add blank line before status for mdss_dp
> 4. Tags
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 36 ++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

Just for my understanding:
- Is the corresponding topology file updated? Will this work with the
  current topology from linux-firmware release?
- Do audio drivers handle playback if DP gets disconnected or
  reconnected?

-- 
With best wishes
Dmitry

