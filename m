Return-Path: <linux-arm-msm+bounces-66986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CA0B14C7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 12:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87AD87A6A7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 10:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8536028A73B;
	Tue, 29 Jul 2025 10:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnTD/atV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0F328A70A
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753786104; cv=none; b=BwqMaE7QiE+ZAAdJfcIMVD+34jCHnWXBDwEQuRJvzOqokLu9SbPRU98xCPgTS/oO5DRDtg/yUSKuyTIF15sel4Nt0XwU1tO+o3JTK6H+66z4ihFKH2dPD0l8UN3d0w+P/fyNuDz+ZITiWqXoNDaKq1ybZVZc+hsYEqtu4Z/MpfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753786104; c=relaxed/simple;
	bh=hKHbjjoJ+iGtckzDyicYvICv0iTNTrl7TsrUzNgpKaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9JWRenVKQbc2ZHcbT0Tuq+KmjXCRGzxGmfFXvtE72B7YHkkCPvVxCK0Kw0jk5zcH4viIIclmbYbwZ51CLcXyGSP4QEoAH6bLSO8ef9LAREVLdFumHr+kGBU45Z1kYy4iEUE/+S4a/ZXgu2jX6wTPE3nE+kJ0avBO7/MliJV5R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnTD/atV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8Vo0x004983
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aIZodOZfSRc4bXLg5h+oXoOK
	Sy3LJLxbr/aCH937D3k=; b=lnTD/atVx4T4mnTggzkJ16I9SaQKJuhYu++ApJLv
	WcR078znfxHSYM09lIWgW3PCeNT/z3NLxt5Z+saZ3ITy9xrU/4vlXgklzHuZD5hQ
	tPGFNMkae5h8UbvrTOarKQRvH/XM6d2754gZKlmATH9c0hyG+fdLJAVLKt5jWOCH
	tam/MyEDe9todFmT7M0xdCjz0pYKDXGYOXJj2qV3mAhJhg/oq27PpgRuITyf/mH2
	aDpq1hRTNoHGDn/kskCIckJKWYgYhPVIDqLLdgWxgFopjbzPB3D6cUmv3irUXwCp
	TBlUqG+fJfIYtBJFTUUM2SCtX3V1TWSEWa5wCH/Zcoq6MA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyu01h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:48:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e33d32c501so1382899385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 03:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753786100; x=1754390900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIZodOZfSRc4bXLg5h+oXoOKSy3LJLxbr/aCH937D3k=;
        b=mpbXIpad4+y23YjLAHHwzqGbTkkODhAsu8fsGHhaZvk1KgFAwDxf9x0OW2/lOlT3XJ
         A36SAxAN1iJO8gCfrACnvi8MOnX7h+M/DRfjh66UlSnRBfiUJEz+Gyi4oEEhUBbH5fa0
         nU7Zk7kFY7g2GfJJLsn/VHqiDaNmaqtFREzVf4xvhs+NinYKLcTZMfovPwkZ/HJT8Xjv
         n+hxPRNWrUuSQY5HiYpRunR6JMIDcx4NAMvndz1j7p5Q++hcSDKGfllvIOdX+sksbNgP
         ocgzmmgvR5x1LmCwG1VPnogRW14eS51j7t9BarlKxukAiPt1CYRGa3Z60AZyhiR4E7oM
         bsFA==
X-Forwarded-Encrypted: i=1; AJvYcCX23Iw/q+CJOxRo2gQzq/5wBLGCK0Hm+Jw8bKOZ/+BuDuML5nVjkMzLtlGMxA4fu2/fz0MycEWYkOUNbtMx@vger.kernel.org
X-Gm-Message-State: AOJu0YzDG6X/PTV1IV+8zVdO0uuxIRIjWzkjVtZj9ZCgh/RPYw0qtFrf
	wN8XohDOBSCWetlYoHzkkGKQwvoyDL9pTViCX+6h/gsaL/5tTT26ED6X4rHQTT1UJ3I8qrBffgI
	EIssZF3ulGL3D5FnOlcvbR7C30t/6NBjsE0Fgyj17kAN6zF4F4BKhF6XkmqK+VLTSs+a3
X-Gm-Gg: ASbGncsVMpWuRZXkEKi0PlZDgLY08m7DBZwpm/w47ZvId5uaJaEAsl1PS1MJZnnFWc2
	02kFjxnOqlX3smV/E3TryvPMBH971QYFMj1ZJ/ACgjKPjyd2V2CEYzzjZjYBx5RIBUHWZDG5Ldq
	plRW9oUK9qHUqWcmLPxCCFb41yWoeB2IlyugxtI8BYKW2QZcJBK6YnXSwS/THpVltYWXsb7U3O/
	daoldfsM+a9p5r7Q3HJfTWl9dwz2bqHnV7F6s6EF+rEHVxX2O9ZdveKzrybcQcWgwsll4jS0ctS
	ys/4IYoa73XMg89acf7nPZ/on3qtdtBUrKUlVkBMQ/yACiPvF8ztNNsPCst3370PelkOAQYlRAr
	bzsCxYT0jw0FkI4MOMX2PEfdFkDcFo3UWOBSRWGTS/U79UACdqo43
X-Received: by 2002:a05:6214:1cc9:b0:707:1a5a:71c3 with SMTP id 6a1803df08f44-707206fcfcdmr237668406d6.16.1753786100350;
        Tue, 29 Jul 2025 03:48:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFddgyjGv1hFw/a867iR4nqNHV4MwlsaV9ZbCgAmOWAOWVeaSDHwt5F9kad21ptJ0V3bBzeWQ==
X-Received: by 2002:a05:6214:1cc9:b0:707:1a5a:71c3 with SMTP id 6a1803df08f44-707206fcfcdmr237667936d6.16.1753786099873;
        Tue, 29 Jul 2025 03:48:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331f423597bsm15621391fa.44.2025.07.29.03.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 03:48:18 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:48:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
Message-ID: <25uelsjuw4xxfopvfn4wvlj2zgivwbjprm74if5ddwvht4ibfz@yctc2kvfmxyw>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-7-227cfe5c8ef4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-7-227cfe5c8ef4@oss.qualcomm.com>
X-Proofpoint-GUID: NnwlD9GraZRX0qIKMxEj7GZKkUfIACaS
X-Proofpoint-ORIG-GUID: NnwlD9GraZRX0qIKMxEj7GZKkUfIACaS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4NCBTYWx0ZWRfX5TfFxD5mCI1R
 O56FA0ZWKvHCpzslUvFzJ5M/rQC+hbu/w0zTCFRK59CiZlnOfzpt0HeYlIpWoy17O+u8FXtpmjr
 PwsjcYp2yOSrzuArECDox+6wvJsbtIKrLrSjAA7oZ1kw4wMkr5bKX5/WFLUJP7vE/qHJM3ZOsXd
 YUVpaHOE92GyX+6sf0uPRCcbCpy2VgIXLn53lIOKC/akaGEXyS02IdbfhAvtEMUs5syYJO5paGn
 Q2NqIVcWay231Kjjz4Pv4vFTSBI1y7l5TuFdwsqCOc9CgctlkERO9rKHrn9IuAV52ZZy7TKhhlc
 XmyCn2xIRjGQBBzEf3wdgfyoYUlZpSmNcyM+KtlTeIElbaIgS93QcBVfBAoCHt63S720Y04g9xd
 MIwAMau07xc4dvtEy7e6HWfL+TImazfYk0BG8DCJXlQ70Ob7chC5BaRndjScz2rqJL1P6yfU
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6888a6f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=QLzzLPEayNjuskPGAjcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290084

On Tue, Jul 29, 2025 at 11:12:41AM +0530, Taniya Das wrote:
> Add support for Global clock controller for Glymur platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 8633 insertions(+)
> 
> +static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	int ret;
> +
> +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
> +				       ARRAY_SIZE(gcc_dfs_clocks));

Why are you doing this manually instead of using
qcom_cc_driver_data.dfs_rcgs ?

> +	if (ret) {
> +		dev_err(dev, "Failed to register DFS\n");
> +		return;
> +	}
> +
> +	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
> +	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
> +}
> +
> 

-- 
With best wishes
Dmitry

