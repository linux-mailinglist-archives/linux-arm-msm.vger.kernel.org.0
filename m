Return-Path: <linux-arm-msm+bounces-68737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12228B22490
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 984773B0EE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D4C2EB5D2;
	Tue, 12 Aug 2025 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+p1DqYm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B052E265A
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754994441; cv=none; b=pWMnI/jtcSo57oXZt/iP0hfBXA5geE4/rAoO0Pl+TmbvuxySm+ZrDQiH+HOAmDU6E20mhRy6jN6UWfEfoHgP4y3FhvT40uWaNFcUWYgBWlnNhSX5JyvkjDoFp4Qni1C2CZpiYxho3t8SWw5GMHUWe/oIDdwGvFXncp4dnuTFfWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754994441; c=relaxed/simple;
	bh=p6XJ2Ia1ZWj9X46ugQeYG4h7CM0YCYpi+GVyAiwcBag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHfynb6BwND+Egpm1VrG3l+COtS88Ikr3+lplvRsmdDduHpwbSzG/IYfkOoflZ2o8oqRBugIUmZfD5FpnItruigmZBqVHJTnqj+W1WbjmjqosWoMgTvvPTJuXX3IQVnk8VCGLdzCLuECk9Y7+DD3ZkPjPfS9AllNr5BvDEvzy7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+p1DqYm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5ZfWb029197
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9vCp9m+qHfHd3sxSOOc74EeHEbwHcJ/Vc8rKeqTxWw=; b=C+p1DqYmbrJU/Coh
	bokhX1Hwqe+djWwDbWYX16FTHV52bz+TPAG1ISJJx9RagMCEfE6NwyQ4whxAvhbM
	p1wwopY6ag5xi8uvABmqHSLWe/eRltRVQnOKvrrjwyt8uaExrI4PPLzCLckYv2M0
	WU3fAZ38r9xeDgp6WhiCTML9ypUd7a5oXxDRy3C+cMGM30kyrgR2fl3PKtEojDrq
	kqdFOYrt/cKIex/DgTFQMGnUMCGTlIlQmt6NGAeC/fhmYwRicYRQJD5H03IOHW0b
	ubCflHD5qMRRSG2HVgJjBvlhy7TAH29DKKZ72BVkQwHBkRpzYMuLVUtlAFPp06E3
	wNQnog==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmfq94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:27:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af23fa7c0cso15687321cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754994438; x=1755599238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9vCp9m+qHfHd3sxSOOc74EeHEbwHcJ/Vc8rKeqTxWw=;
        b=f2v9R5fPOZ2Ef/MT3MaT6jhLfhlz7m9aEwBqEPe9Xz4yk5W6VYf7qFQf9VreRbqB1M
         AmMjfJsbghF2787wij1Opw7zSqZqwBTYf/5pIYBkDp5+GkP1/6+9MFdtMoEklHzrPDXi
         RXwRNwmctdLQgUYWorHGQD+gSvt4mQBN5dTKJY1/Byjcd7a7bLh+AzrJUq6HPcJdHRm9
         5jQpDGyZtEEkkfVr7lnL02dcGLJmWP2lqPacqrr6d5hzMKl/a4oieYPDm6O08EpyWVAI
         aEqipd1Pidnns38xHyOUhx9Z/n0NULf4sIFPBd/STsqv2sRMjglOf3Ngu+HyrhVm8iLI
         xqSg==
X-Gm-Message-State: AOJu0Yye9vjAM86wOS33VzIOBsWWr84YnZZB8QOb1No704rXO5JuzQuU
	ddmMWy4dXPQHV7hgdI9QrHIpb/FbrIeedLgWTQ89JL9+PNrAUi0jUx+uEaJmWH0XPW/8+vMDgM0
	MQokJTiZtTT2W6b1gz4BOPA/IzfaQIJipLoS/ZxrSSPTB8AsC5iSinviII3TZ9YBaKUJZ
X-Gm-Gg: ASbGncsYW1Y5C5bxBtE0UJf7HAYQmCR7F1x4LVEbLkGM2Qy/SQCCwlRuNNWShRoSBwp
	YSrVoPMO04FHyMSrs5fLQ8OoGwuMr4qHTX+vZ2s+1KitAiyLcFhCgsk0nZ+N9sJw4Nkbj/zY75v
	1492BJnrBwfZTU1Gj9MwHIKYy9Em1sQ8Cwe19Bh1ieH6WcijP29HXAWGAnw0hPO3+4HAGzOjAbC
	SmW1DeqzOuQk4yJ59xRe7qyS/pcOf2cZNw4BhS1Lk+1hpR9lHQB0LNQFkKysXfQj2A8lVGCE0is
	Vn/wJBWn87Nl/BenBD2tusSPZGIsRckmHt3NxP3UXgjUk3xCC6t7GiaA2j9vgojXN8O3wNyMVbj
	rHolW2221KO6HKpR6Zg==
X-Received: by 2002:a05:622a:1a26:b0:4ab:6de9:46ae with SMTP id d75a77b69052e-4b0f6267d03mr2669021cf.13.1754994437730;
        Tue, 12 Aug 2025 03:27:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcHGbLJllfiL6T0pXR0Qe7084myDh4JmZG4tqCEOLzDDsKtMH0MRvtexCeFrKzOU71x8TNjA==
X-Received: by 2002:a05:622a:1a26:b0:4ab:6de9:46ae with SMTP id d75a77b69052e-4b0f6267d03mr2668781cf.13.1754994437236;
        Tue, 12 Aug 2025 03:27:17 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af9f4796e23sm444380766b.26.2025.08.12.03.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 03:27:16 -0700 (PDT)
Message-ID: <0bda8e0e-4f86-458f-b55e-c5b0d6cd5c30@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 12:27:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,mdp5: drop lut clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX58kamnqTLv6u
 MAQ1fG6OJOP5QEnKJ0WnUZx+ZyzEJiH+PabstB/E6KDY3lU1bE8cZxTALlEJzF9e8joR2B19D1x
 4GL3fMG44/Q6uh36tSO5/bjp1i9J6JH6ddIJJn9aWG6BbhdE9iUy4aJkIvBbrKtZD4KF6u+K05z
 kENJga0RWuOMx+TMAbxCOIjolRkwq7oJ2STB0s8Te2a+uYgFh9c1cF1I4dLgBIBEcjOf5as+puX
 57CPnrmMaoeOZHumye1Si4h8rIMtTFU+yIrEiuewz3+hU07vGe8zV4XOqkKMHaZgUJIlfXwVawP
 1FSpAj09FdVesy2cqPwU26T4KcWRmo4ec+UrGqsFCuYYw0xTbFhBEIE+a1ULOwC1w+QzTuHc8NY
 llBtBdtw
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689b1707 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vZF-wXTcH1iwIe0ERPwA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: q1o2NI1JgyPT5ZmHEYLHNRl9UYuAyyOR
X-Proofpoint-ORIG-GUID: q1o2NI1JgyPT5ZmHEYLHNRl9UYuAyyOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_05,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On 8/9/25 10:36 AM, Dmitry Baryshkov wrote:
> None of MDP5 platforms have a LUT clock on the display-controller, it

8974 and friends seem to bind it to the GDSC

although on msm-3.4:

arch/arm/mach-msm/clock-8974.c
4197:static struct branch_clk mdss_mdp_lut_clk = {
4203:           .dbg_name = "mdss_mdp_lut_clk",
4205:           CLK_INIT(mdss_mdp_lut_clk.c),
4609:   {&mdss_mdp_lut_clk.c,                   MMSS_BASE, 0x0015},
5118:   CLK_LOOKUP("lut_clk", mdss_mdp_lut_clk.c, "mdp.0"),
5387:   CLK_LOOKUP("lut_clk", mdss_mdp_lut_clk.c, "fd8c2304.qcom,gdsc"

Konrad

> was added by the mistake. Drop it, fixing DT warnings on MSM8976 /
> MSM8956 platforms. Technically it's an ABI break, but no other platforms
> are affected.
> 
> Fixes: 385c8ac763b3 ("dt-bindings: display/msm: convert MDP5 schema to YAML format")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> index e153f8d26e7aaec64656570bbec700794651c10f..2735c78b0b67af8c004350f40ca9700c563b75f8 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> @@ -60,7 +60,6 @@ properties:
>            - const: bus
>            - const: core
>            - const: vsync
> -          - const: lut
>            - const: tbu
>            - const: tbu_rt
>          # MSM8996 has additional iommu clock
> 
> ---
> base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
> change-id: 20250809-msm8976-no-lut-4b5100bcfb35
> 
> Best regards,

