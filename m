Return-Path: <linux-arm-msm+bounces-76007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2BEBBD55D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 10:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 496524E061C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 08:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB6B25D533;
	Mon,  6 Oct 2025 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSSvtF+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951851A83F8
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759739336; cv=none; b=tSdMhzJjAz1asyQDpfnLN1JXhLk3NijFNS69l3qbWqxtmrGB5OQk9nj+HeYMmegAUcKskacWOhDzYmYFUqvN75E8lYotQCN58B3kiK9ivA8qywHVm8XJInGE6U/CwH6LwUAym4c6e1GRzUlQ1sZKNtkgT9mrQIJx/OfKHnLxDtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759739336; c=relaxed/simple;
	bh=ew0vJWVJulFUpGzp6GbSkojdXLce2+5kVbuDWsVNrrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/3DrkngpwUQeiw4nuIoN/ft0wp+YC+11yg/AX5j2d1VbZ5XqGUxky4/S/FSZn6+MQnQQs81GKDH9GpyZByt7QLabthw3k95ZeByfiLpaSR7fFz9Zdj5ZQC5BsFc4Fhzljrfktoi3hhp2/RgxHfly9Q4XqQKINp2XFRf4tKcaRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSSvtF+E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961V5tb012073
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 08:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fySFI0+vB4C2jZwTubej+JIBaPURTzcto53v2iuju/0=; b=JSSvtF+EV+lEe3aW
	HdCNglBweJ7uJXfNoYT/GyNTNvVOLaG6JqNdCqvQUqx6Bg1onQwFvG0S5V7hN6qy
	GWU9oH5N+kPsFyQJiGypl4mFosNXvRl8peDSkz1GAVJnm67uQ5y2g7ZOMzTnCg7v
	6L6OZssRWfcWLOFZS9EOsajv5bHTQbTCKWPn6DEJgUzSCNMYPxurMTWd/E1CsKlm
	SFnr2dXyIeb8dEar1Agjt33dL3+DABK9vL0Ogl/A/OH2gw8gf7boUqOH091S+a9r
	MY7GinrPiCmEgvNkRYtSygH49dtSf/0q65Xr0Ifqw4OGNNsIcWRjDwQIaxRdbEaq
	gmdhlw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn3jtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 08:28:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-865c7dee192so100632485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 01:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759739332; x=1760344132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fySFI0+vB4C2jZwTubej+JIBaPURTzcto53v2iuju/0=;
        b=Fk63P2ExH4ywUI5cLCLExy3cPxW+BpkfrSqSTjeNd8DOu6aW6GXj3vTGDhrOHi35iL
         73djt1NQw/mrgNWlnYxCy0LY+PzJrQUZReBLEFaemvxV0R21u0+lnAWvnBXq4yD1F3Hs
         0DERBPfMor1lW5PZ3tqqsbIWLzW0Mw2hSCiZVQ97u0ZhFcnKJkRxuCE9DxcGKzK28Vgn
         H6F3J6qZTF0XpS/QEsjiX/SNo2Dsp/LfOla84tQuqsWwlzTeMYsqg2RETZ+0JTmfgE4s
         DV5NvNeUiF08izM9hKubekuVi8m671asN+5uCfLWfGEXdEff+f2E+w0Cp+VkAfxHlkg1
         vhPA==
X-Forwarded-Encrypted: i=1; AJvYcCWWG0+YjwSq2Y8mkj1TqY16E4C4NwS8fNeO7MLTQywZx9AKGNqeC5gQoKpY7CmW5E7YgCQ3Wt1rq7/siG9p@vger.kernel.org
X-Gm-Message-State: AOJu0YxctaWKljTOAgnRxHu2UNJs7hAHiTFC0xYOKZATCTm6SoQst0rz
	UZLnFa6qkeMwpis8XhTLT9z+cver7txt8XW7gFyO+VUP63T1rtRTLHYksD1T7O6aQN2eY+zXlrl
	pVf9UNQGgalLr5OSU1VQJ4h577wtiYLMXOULm3v3bsr9PfdUoyBKRBMliEWq3FDIBUPw8
X-Gm-Gg: ASbGncv9qWdoYQdamE3H6P2xEyvOn1lZSnG/zvzqmFuyop9pUOCtj+wzLOjOVG/JaH6
	6lY+MLycL0Q11wrxctPpb2UkJPbczczCpKEMbyrx/WLHmRImti5KQkMHsl1kY4GWG2EDpdGnPS5
	i9K4J29YpNnREaQK0QevX2cjJJhMtAcGZrtCAKmcjSpnazJi1aVBMPs1CGUYEJszN/AAtWx9vlj
	gV/QW2a/bKTmtRFnK1Tu0X79gP00k1AajF5nkSlpT/tsaNi3vWp287tU16iL/qpyqnx+7RY0INn
	lUkdSDnV6z5bN1IfUCJNh2stkkymb/6KZFg3+cUEVsZwpbE+h6vAmP4wJnqdiYoNDlZYcw22x8G
	lwPMbu5B4qC2MOhRkuEmuB/UFm6g=
X-Received: by 2002:a05:620a:28cc:b0:855:b82a:eba5 with SMTP id af79cd13be357-87a342f8541mr1018833185a.2.1759739332406;
        Mon, 06 Oct 2025 01:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExpG1GPi83h7oEKjeN5OxS64YtQ149fVac/bi4Nb1qP6pl8aEItSm3iduplFbNPRMuPJyo9Q==
X-Received: by 2002:a05:620a:28cc:b0:855:b82a:eba5 with SMTP id af79cd13be357-87a342f8541mr1018831185a.2.1759739331800;
        Mon, 06 Oct 2025 01:28:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83f6csm1105339366b.31.2025.10.06.01.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 01:28:51 -0700 (PDT)
Message-ID: <565924dc-84d4-40cc-8826-5143338cca21@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:28:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/msm/dsi: add DSI support for QCS8300
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-6-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251006013924.1114833-6-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX/iWaDZAMiAOM
 dzqF2cbaLvTf1FsVNaxQvrOxJmm1GB0ngYLuQTgVZ0Oi0DUGBHnKlZCAgqn6PQB39YiMIGA3bDh
 +RToMr2EgGNhgoFB2AMEA8uGy9xHnm2OC+lYcRtsnpH/JzkLZAX23ldBXyaJDb++fE3CZFjCH/J
 fnJ63Fv1skwyR3NFgHS9GMaKkn95mEn0OmaOvEkvglxTYjUbaIHWdOgFzrOjbv+jE4PXof6nmb8
 ahoaOWLu06FCif0LsF0+qpNB8LZKZVuT3EJ7Gg5Gr6drBzqY8mGKEYBh0NIUaVep7+QXHN41WAt
 WfsJHM8t6RtJvJ/v/iqpySkfRgq77viQfj4THgx12F3v4hg2s6+Se/AODdvPM6Ph0oSAPuy+mJU
 s7HAqHHVoQYiK0ObctogM0HNqVMJvA==
X-Proofpoint-GUID: hbnWO1nZOjHQdpqfgCqKJeAfpipwg6KY
X-Proofpoint-ORIG-GUID: hbnWO1nZOjHQdpqfgCqKJeAfpipwg6KY
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e37dc5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=rHxuBsFVyQJAZ78EHecA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 10/6/25 3:39 AM, Ayushi Makhija wrote:
> Add DSI Controller v2.5.1 support for QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index fed8e9b67011..b60384ea0b32 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -226,6 +226,17 @@ static const struct regulator_bulk_data sa8775p_dsi_regulators[] = {
>  	{ .supply = "refgen" },
>  };
>  
> +static const struct msm_dsi_config qcs8300_dsi_cfg = {
> +	.io_offset = DSI_6G_REG_SHIFT,
> +	.regulator_data = sa8775p_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(sa8775p_dsi_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> +	.io_start = {
> +		{ 0xae94000},

"{ 0xae94000 },"

But there is no need to introduce this ops (vs 8775), if the secondary
IO base is never requested, it will simply be left unused

Konrad

