Return-Path: <linux-arm-msm+bounces-69750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 966CBB2C16A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B55933A6563
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23464326D49;
	Tue, 19 Aug 2025 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwveoB+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98A42750FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604068; cv=none; b=tjzkuWBvtdQ/NlLe7xZ261FgZdtyyNLzyS96j5mG1Xhr0wJoGiwa/Sa5HdRpRXYpUmYLabOalnxAlL7iWD/LmscG6MSEnQqarAg5c38wghewjAO7hwbncKFztC6wpY6VVQ0ed7xxHkRYiu7DfLh+/VNKrEyiIkLQg9eGiEhbdpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604068; c=relaxed/simple;
	bh=a21opQrx6FtgjxLAH8msEDeK1LTD9NhoP7uXufEvrZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCJztKYuvoG67z+Vq70vaHOeXUvomf6R9qmUjYjH1QgevUxFPN5LRTvZnmfQsV4G1GAnmKrFtNF5qC6JsbUdeD9lu8KO5t6JD6NXnDwYF+iMqLyFVgT5Sr386vFF0XdPaNtpzUQgOfjdNr9R0AsuycvQhYd1+2SR6OdmpZRPkoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwveoB+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90XO3007208
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eTLV4pbAiALqLWMe9z9+F23m
	6/Z57HSatoPEldwbxjY=; b=BwveoB+we/C98knvJ4KJIE+TpFVSfbPzdCUk6T1e
	sS9viKkbTE8osTL7y8p/imthlQwonXoE95UXx68uVipXP4QGdCJwmP9YyQ8Ujhlw
	b0UJrSEinRKtJN5+MSG80XO3u6cmKIcl8BKDHsnwkYcwW+bouG2zuf4joQ/v1t7Y
	H6gJk/ydtNvtMcvLulX3Pfb03SW4mj2hE1qFpD0NWuVPwhab9OAYfMh5d/leUHE7
	e7JzUB0jjgUR+lqT6Gpc9ZiXvd4HYafno5PloaWMhVPp9rnESCkebPRYwgT6zxlI
	ABcj1gErNhi3Uzg5uNZrgd4GIuU0JnH1YOxELZAKcB+oVA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj748dgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:47:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109bd3fa0so59276141cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 04:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604064; x=1756208864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTLV4pbAiALqLWMe9z9+F23m6/Z57HSatoPEldwbxjY=;
        b=Hj8N0BNIgHX//W8efwznfC7bYnypZImDrAGD9ngbXocMssbgQ+DfMiBUBerW5jFNBS
         bNyDy/wrHs3gsp5ihhbkGQWby5CJAr1Squ0o+KSI29XPACITdj4C//PEUEarekb9NgG0
         ClakP6p5hN98H14dGinPUq7oU5TK6q17ILDB3IdCkERBP9IUIPOhxd/mMLm7IZMQHRTr
         Ns+hJvSlheIezwwpgMM8W1VDnoUq0rGRZ9FldR2zxRbirDfd/uTpsdyAiMcH4HCSrAq4
         8ghjRGAsBVsyMi7rZZCXyRPaUdPeCLBPeqmYpEmXKdH3a8FdDTGLGZ1rgBJYsVTPFsaF
         plZA==
X-Forwarded-Encrypted: i=1; AJvYcCV1zf7ubre/FnmHSVfQrtp3D2RUCCj9isyaqKFLbIPytLuZF71AQVpWaFGlMAKV/ghSyUFesZVmgB+kNfCr@vger.kernel.org
X-Gm-Message-State: AOJu0YxrV19+OXpqTdrC0kyptY5Z0khH+B95Sp3kPDHfrK3p1j2Kby8s
	lq4LrYXCiz062tmyyF5iZD+/eWCxHRdvc39RuoccYP0n89Vszy1EvctEPeAoDd7XEzGLrxtMItN
	GmBJRUeypfz89h0d1dqGSlkMwqaB96GfOozjdTfX3Int58nS22ieICqIKDsmWWeRmoWB1
X-Gm-Gg: ASbGncv9uGlHsy9SfPqC8X+G6GG1v//3IrKM5XbwUSeD3W00FOavjVArLDPRs5Dcast
	HFINA+ye3P+D6J3/REnh1FyqmYGp4mEB3C6m+ZeYfQUo6Mf4MaYysg7b0h7AWIWu9TtbHs2Cj/E
	otfPIEpu79CKXxwhCEpPlHW8FHFew6V+6ngunQoJLd7hFkw4lrWLCawcQdlWaZGDGezzicb3sku
	pZreaw/pqTGjrv+/jWeknAcy/zGQyc0H3MmIiLyWrBE9F2mX1OxLy1MzUFXZYi3CFy2cHTtqjl3
	+SxrT/sGe6XERqEEtT8xWTrWuUJNfdvXHikts4lgyQKLufX9KC9Dsn0TP54Rchbqmpke3V0LoRL
	tOh859IbRKNoNSylwUJkGEp4YI9WyX8ViS6qdsqUm1qSm82CBcMnV
X-Received: by 2002:a05:622a:4896:b0:4af:41b9:f66a with SMTP id d75a77b69052e-4b286d32b7cmr27661341cf.26.1755604064593;
        Tue, 19 Aug 2025 04:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUsM+R5H5wwSDp0LniUfNSxIvrGeWb7sj9B7rqdTJ3m7dL4JTwfKGIh+GVqeo5+ljeA2NF+A==
X-Received: by 2002:a05:622a:4896:b0:4af:41b9:f66a with SMTP id d75a77b69052e-4b286d32b7cmr27661081cf.26.1755604064113;
        Tue, 19 Aug 2025 04:47:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ff916sm2047292e87.131.2025.08.19.04.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:47:43 -0700 (PDT)
Date: Tue, 19 Aug 2025 14:47:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: use kcalloc() instead of
 kzalloc()
Message-ID: <x2fao6hlzdis6pqucfqwrjtv7xr274cdkjpz2jhz7iglbpcbei@y3dxedn2diwf>
References: <20250819090125.540682-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819090125.540682-1-rongqianfeng@vivo.com>
X-Proofpoint-GUID: qIy1KWD6o0NVvMh8t_uN-jvY3RehEU_b
X-Proofpoint-ORIG-GUID: qIy1KWD6o0NVvMh8t_uN-jvY3RehEU_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfXxEaafEVUZfIR
 5FTW8uSI5FGKFSCvK54z64KNnNw2u1bta/HoNHFXOH1Q2Eahdv0uTsVtx7wfOB+Zpm3bHWDi4U5
 Ht6KgguOmWLFs760P+XH3JsYxQEZLY/UyFJxaFrT1yNDvtkvi3PgkmI2LdJwcFZgLyY9N2CL4So
 fHzZY/rHjkeO6cC5gkh0973e0gYqqwyeiIa3xgg7DHonYfI25ACnvowjqZexLETgkt0UdihHBY0
 4wzDra8H1Xgihzo9lI7ULNrwqeMq6Lbkgi0knuZJSqDP1AHsaaxD4q1HX47VylhB/KvmsX/0KCL
 i7Fka8ae8oHEzm2j+pQvsMaHEYsb4jy3x3SohNqsl2/zz4MB4snB0rQG6MxMPEH4+17GVNIjZbV
 yje5Ku7T
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a46461 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=KBxqgXywe9IIF68hBIUA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

On Tue, Aug 19, 2025 at 05:01:24PM +0800, Qianfeng Rong wrote:
> Replace devm_kzalloc() with devm_kcalloc() in qcom_pmic_typec_pdphy_probe()
> and qcom_pmic_typec_port_probe() for safer memory allocation with built-in
> overflow protection.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

