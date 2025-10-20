Return-Path: <linux-arm-msm+bounces-77981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51713BF0BAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 066193ABE72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED7F2F617E;
	Mon, 20 Oct 2025 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUEhM1CI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF71828136F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958425; cv=none; b=D8dzdff7bkb7Li1PjkgxeNLg4Sdb6CGWqg4koi+udX2uAtCw2Hkh7FQzBrGjLZKr+PGg9RvnFSY5t7TWeGHKPlN6DGCr0aFHTS2sqj5li+2ZnbrXjlyMfQp3uCx+8K6wns98yM98KgkUC+SXkUA4h6Ow4UHonUjbNKyuNMZFD9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958425; c=relaxed/simple;
	bh=gnjYFPak0EJqXOMJIeFPWg6gTRvFdpKtV12xixzFsEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2tEFh6FSgl089CXKzQqTW55JCyBnMI58GTK3dWbYR7on1i4DR+sSJj6as+87i6tI2nRvrSI6sMhH0YF/fJ9BeQYwhAndv7im/SVh+HaMsFTyE9kE5uWJ26uY4vI9ARJXKXeUrBEY65OH59ggCCWCoEokb0Ulz0PT+GMPnFJyu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUEhM1CI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JNcq7Y020759
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QwARkMhltT677TdXPdgdzsla
	GT8f6DdXmqDptEd8yFs=; b=HUEhM1CITXNSzgZSNTvZk88Lf1OMEyCK4UjBkM9I
	r+CJR9t6zTVN9jLM7pjIWbLhmbF5urUlyJpQl/nEnyO7PE0z63QO7VD0lQffU16R
	gIdXEK7lMVY6wv99FjoVyLq056HuOsjqNSxG5E7ANSQwsZNra+5WbwyV/LoKCuQ4
	F7RJB2RfFG6SLU/kmzF1fJObkCak51ulr3KaNvkXPd44RYbOIUMiFKJVCi6HAAF0
	D8YA/EqCQ1kDoRhwlX/VZbfD0JlNepXBZqcB6JIdFVlWzkf8wrAOrpxWwmW/dR/a
	8cEE/ziyPWDnsWN8tfK/Juvt5witnHgn9fJtE7DE1TvnIQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469cemk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:07:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78f28554393so135749156d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 04:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958422; x=1761563222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwARkMhltT677TdXPdgdzslaGT8f6DdXmqDptEd8yFs=;
        b=oj9f9y2hv634G4OFEVyej4YmfcB4wek2oaDKY0gFKIuu7EwQSYmgHwj+o+VcO9vjex
         OuhvuhoTK9iVSo05RB/QrQKY+o6i/YmhGAmsZ5f1rZp5ZbcxK//Kjtv524/qiJpeRVGn
         FGjpIrjMtBaQlBwg2f9NOr9g6erHN+lVE5s+B4Pzbwp7PxAuTk5s9jfdbUNng8uvfzIU
         B/fRmcrL/I/mXx7MmamsUf9YsS3MWrIIPae+Ntvg0vALa8fypvOR4L8hiEWE5C4k2lul
         f+Myk9CSstwvgqawQhIXzRPKvMlYGacsQjJnEIgJcLzuY8nphNM8xco+eOASceYO/6L8
         qwnA==
X-Forwarded-Encrypted: i=1; AJvYcCVf38Wbzua+9vdnxO1tMqZObba6MYGSUfKgJkKAgDcC4+jvMYXZI01+fjnbz/yRqNM4Vd3lPnAoH/BoPSpe@vger.kernel.org
X-Gm-Message-State: AOJu0YwW3DZ9askMT/o/yfQFllMJrGBL8Gh5tGvsTWjApbxU8BqSQkTf
	rfjJnWqQQ371UhEmvkDQLF6kmsg9loU4Rzjx6xkj1S+fbFD08ku2UCGH99sHp95QXyoonMD+5A4
	kyXrGKKRFaFphih7JD/Jqfa9kdbmTvRB2JggUI9ACXGabjW+bkjVGFSCd2veNueJ8JfKg
X-Gm-Gg: ASbGnctXftEUK/gINqUEOSKvwau0+UCOl+CyeG6vgbSKb6UFMEBKtAk6CN0QloIZRUt
	5l3IiOSlonFuOtqpUPczitU96UuXrxUzq1618KswiTfADwRqS3H1FsNdkMr08wJSpkh3ddtCjD4
	D5ssYO2sYSCwDyG1sVzjaQhY+xedKtHE/k0Z0XYhZeqkwrJMS5onVBcpHUhIbKfgG/c+pxszOw2
	Yz6qWmzBfJuYSl8BOZGliaZFInOxBqLJaLxpkGNImz8Oft6asbCB+QP2SNkloU/gLU8KJgVYxoA
	WRKC/iyHpGpwGqQ/JzxzVR5ghklex+Kry4NHZMYVDFB0VpRQBgCh+pgxr0GaKVa5Jdr9NuA8Uf5
	Aul3GwMN9vXM6hsWSsmK2r26WCd3qEU3H6dIzlZUxyNe+jSbSY3Uftd4Ln5Pgse+CTCnt78QK8O
	tjn7v8HG/AknM=
X-Received: by 2002:a05:622a:84:b0:4e8:b270:aeb1 with SMTP id d75a77b69052e-4e8b270df4fmr81413251cf.52.1760958421837;
        Mon, 20 Oct 2025 04:07:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECGSfBuSQKnPmaCRmRZAaNbAZ4uXKdc3BnEN3QaNW/fLebd3lRA2J85RGIO1q+4dVSjU4yrg==
X-Received: by 2002:a05:622a:84:b0:4e8:b270:aeb1 with SMTP id d75a77b69052e-4e8b270df4fmr81412931cf.52.1760958421385;
        Mon, 20 Oct 2025 04:07:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921e3c0sm19964621fa.23.2025.10.20.04.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:07:00 -0700 (PDT)
Date: Mon, 20 Oct 2025 14:06:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Align ethernet
 interconnect-names with schema
Message-ID: <ew3x5kajsb4keyj7umnzsid7ltdveumsafl72vt53iaa6rz7rs@sdqy6pmfigzy>
References: <20251020-topic-lemans_eth_dt-v1-1-25f4532addb2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-topic-lemans_eth_dt-v1-1-25f4532addb2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cgMZaIItHlmAg2say1wpuOyHgM2KipN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfXyR+RUQ7rkWKm
 PpgB8X4lkLddqjPmq5YlTRti7/RwPYazsOZSDp6wOxSW0ctDK1uX4AZWo8ha4tBs3bRnWWV1kEg
 PjRJtZVTVz9znFeyCsh3JE2CCfWSvnoCRHo3IliFfhhBVyRiZnL+kPhxXm0CPWM/vx1HK02+CCj
 AiZLjLt37cO53HQjNPRuRMmG/6TUukALT+9MoJJ+rTqFU6ixGf4Sfa8opyNOoOQzf9GVAodZcVF
 y+K/5QKJwZb2mJ8E84K30coav7SIjaZ5xgfLMnKSO/IcoX6y4bhg0ewt+61BYrTGpa2Cbm+IrxZ
 5mzlShyvNse3USNfi6Gfsg8b4lWfGTnGZ6IeMNWiDZ9XgElE6H3cQ1RaX5cFyZnU8KBwcNs8jQT
 Gvb1ozphEMyOMFUttIqDv5OpwIriYA==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f617d7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=RIJzAXRtEeeaT4_sP-YA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: cgMZaIItHlmAg2say1wpuOyHgM2KipN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On Mon, Oct 20, 2025 at 10:31:22AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Reshuffle the entries to match the expected order.
> 
> Fixes the following warnings:
> 
> (qcom,sa8775p-ethqos): interconnect-names:0: 'cpu-mac' was expected
> (qcom,sa8775p-ethqos): interconnect-names:1: 'mac-mem' was expected
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

