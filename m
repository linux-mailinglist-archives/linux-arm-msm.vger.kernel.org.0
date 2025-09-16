Return-Path: <linux-arm-msm+bounces-73746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF1B59BC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CE101691FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A66D316905;
	Tue, 16 Sep 2025 15:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3oPnFiD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D174305071
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758035454; cv=none; b=BReG79KYAtzY4FAbSpbYSYK8UVcGv9VViOjjYOzkSzt6ZZgR13hO4YautAClbBv2fTv1kNrR7xLOB8hjkzyaGsIo45Q5JRIltpwk6KZ4+QAs1tsARaAy0gF3RtGkHzBknmkppoBEOjQ9THfGQwD6OufXLWbWWPmi8fko+mr3czM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758035454; c=relaxed/simple;
	bh=EQkMGw7chdf4s/ipZleWGh73O0Ryq0/JBuSJdDHibm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7tiFrP83ix4gBAMyw/yqZ2y8B54Lfkkj5GawR6hKPvnVHiPuDH9nnucG/Rl6JorLOqXo+LPCc5J1xfvIZf1rjjGXvIrN1fkoFUfGkcdPF9mP6K7j1Qoyd0vU5YaJQHxdpCv1GErwjWURnPJ6nXsjKJCoPGJiAm8PKrwyoc+P/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3oPnFiD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GD1JMj020258
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g1Z+oPGXQpLxnAZpBbOZ/u5c
	mt3wM5YUAcTV6PLokuA=; b=d3oPnFiDYbzgsQw8vdiCpR76ns9JcYMBKPVaX3jd
	gApfGla58qI5RqlUdRsrwP7l4h38RQrOVWEJBaA7Bjpw152xxSpJgj6FM4j/pAdW
	E0rO56RTTKFDdrN4AJMSCnu3d6XIFwbmp0drBaztN2DdcT02u7WDNv0uGcySfcBV
	C45I9SLbYWWwgJornlsCEjUPpLm4PuJCUHjWE4cn3sIfqehMouKdlJz+68Q5G+M4
	UeZ1GIOQYwZjTl8ojT7PumN5QELIeu0C55hbDAbR5tKe+AHUkkCIJrYjy0kdXXDe
	Q2OlISo6BuWzYQ9jrBBNohaTST6pNEEygFxBgv/5BASWjA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chh84m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:10:50 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-8dd9b359de7so134979241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758035449; x=1758640249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1Z+oPGXQpLxnAZpBbOZ/u5cmt3wM5YUAcTV6PLokuA=;
        b=mmMoAuAQvkWlJPRffCAo0dRXEh+sZr+BDYY9bCH7gt6IVrVj1/usWyk6RDHtBa6Drd
         csreO6p5rBM7m7mUXGJrv2tFQ6vXiFfo0ofpqfsHp79PtwX4f1Qvi4+qRgpeKmMi0tUB
         cEFBl4/b5eTi/edELPy0X+mhzmuKUGE88RoFPOBI7iAfvZlveBgBJZBuybQpPJ/09wm+
         v+wHlRtoZk+a+zuqdyit9SDDJ6L6EfPWVOIQrZV5j8VpwD9Z++BG5Hov4BAXrpOODRP8
         ISiRtLUJ6Zd4ck9D+WoX+kPT2sieT76bNcqdw90FcgxQzgjMiBMKcOPzQz0xXOVvh33y
         4p3w==
X-Forwarded-Encrypted: i=1; AJvYcCUPNnkIz6TIcYllx61kGyWv0xVvmTGckiii31QO7KJwRae9aKkMdhWB/sAb4U6JvSMdMjMTkxbZwAqL7uHK@vger.kernel.org
X-Gm-Message-State: AOJu0YzjpDeFAU0m3+gpPyzMGsNUyvKIfHEiPADq+NPqAPygZmVmx16B
	XPNHTmYm7hif/RUBzhRLy/KeoJv7ZymvxISXUYOi+9z8l8+2DDVq0kqKb3PxcRo4UZXuTwLvja9
	v6irxhGmTibgAo/s1y7+p6RR6y131uZ5oTQbbUwvOMFJfTOKGA8AxwzowyoIDArZH0JB5
X-Gm-Gg: ASbGncucwowYlBvZtONs/pGRS1fyiqataiaEhEt4yg29aw3TxASAk321UugFR4dVk97
	os2PDKClSmaarm7pZSmL085nWWuHSYLiclF10D1eeA4sCz+HRKZ/DOR1LORJI7zwABWtv/1Sw58
	WFM9qPuLh5e1d/oIuCb8PC56+JHndJMJsFTj8UZq6lVKSmiTRZM3IhW3rohgIGkJQWmosJautSM
	Zu29IfH9d8YBMV6jNEbx531AHT1hIQsLCckdfyLD6BnyaEkiz/0qnG+TQoOLe+NmnX2c8fe9LNr
	j3varxioAT1dSh/9pEQc3S0LFhpHAhnmFQisZB+VkTdqNUxTna6wpmdkuw+c5e6Oj06S3PUjthp
	LeVCsz3ypR3h8WfrpyTShSvfdJPAJKngGwm/A1xHwPsjh/U6od3JH
X-Received: by 2002:a05:6122:8c1e:b0:545:f023:ac1d with SMTP id 71dfb90a1353d-54a1699578cmr4957817e0c.0.1758035448949;
        Tue, 16 Sep 2025 08:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOjBcIPt0evZtEawDOU4ceL65KWW429XS23INAGRqTzAWor5/oJYp5i4nvKOrZ/npWDeBcWA==
X-Received: by 2002:a05:6122:8c1e:b0:545:f023:ac1d with SMTP id 71dfb90a1353d-54a1699578cmr4957779e0c.0.1758035448483;
        Tue, 16 Sep 2025 08:10:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-35e8957bc07sm411231fa.18.2025.09.16.08.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:10:47 -0700 (PDT)
Date: Tue, 16 Sep 2025 18:10:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH v3] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <av6zvj7civjycnj7vsdfufdlnpcq4mlpz5cwpamtapzkdqoe6h@rqfea46xs2r6>
References: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c97dfa cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kjV3pKRppw1HhCH-an0A:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: fvZ5HHnIJBESVW3UJG343McZLSx_qXxn
X-Proofpoint-GUID: fvZ5HHnIJBESVW3UJG343McZLSx_qXxn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX43XT7MLK8lj7
 8+cyR8M42p0BDnfEpU4LPCfy9RYpZ/chfzqOOkXbKuFs/h0xYUxy+OKIcHUMKKnf8MgMc7j7JZ9
 LgVxLjc2RS06GRTS4IYXb38kCv379j/nf+SB9yCrGsXtVCawX5DD2bOzmyqtWzbJnCIjSREHGVo
 +d/6wsCXM/VDoMWPn6/VB9vQwsDJb4ybjB6DmidVbq1rJkCgGc2HOIMpLiuURMlWd66/2X9LkRA
 vQYUDwTtMvX66C7U2wGbfZSX12q/ouC/GUJ9Pzr92a/sTg9ONIR5p0kVnAmhi+FKHLWwj97gEtF
 sn7rg4gQpauxuuKRjgOI+GhBYpl7bNdU0L7EvqmNGqKHVzsMiKZD+CHa+Nz+clis1AE8+sGy93R
 CdtuiuKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

On Tue, Sep 16, 2025 at 08:11:03PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> SM6150 uses the same controller IP as SM8150.
> Declare 'qcom,sm6150-dp' as a fallback compatible to
> 'qcom,sm8150-dp' and 'qcom,sm8350-dp' for consistency with existing
> bindings and to ensure correct matching and future clarity.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
> This series splits the SM6150 dp-controller definition from the
> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
> 
> The devicetree modification for DisplayPort on SM6150 will be provided
> in a future patch.
> ---
> Changes in v3:
> - Update binding fallback chain to "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom,sm8350-dp". [Dmitry]
> - Link to v2: https://lore.kernel.org/r/20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com
> 
> Changes in v2:
> - Update commit message and binding with fallback configuration. [Dmitry]
> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

LGTM

-- 
With best wishes
Dmitry

