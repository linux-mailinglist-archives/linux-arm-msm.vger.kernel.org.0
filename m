Return-Path: <linux-arm-msm+bounces-83343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CE920C879A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 522D5351265
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 00:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC5261FCE;
	Wed, 26 Nov 2025 00:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nf9oO2VI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gdJgAlRY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD7F63B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764117375; cv=none; b=eHNT9y4oUfUGfIk9wy+IP6ZHz1zdUuBsTht21h455yVzAPBgGrtZDh5XRKxBODtcmdbRBQBPO8wQ3gqKLQgramN5rUj4Sqf3J7rCG9L8mgDx0MDy6cUHqZ+Z//KMpyu+G5XjpZXcUPIxz17R7tqW74xudfAKcLg5hAcU6y9+qso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764117375; c=relaxed/simple;
	bh=/aP0i57ftVa8J1CJ3M/bvYU8K6dKzdPywG3+7NaToCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkw+LGmJKwQTPVhP85XPF31+lEVABG+imJ91l/qILJ0FF2fmJtYwJvXw7cH9lcvboEsLr/nzsCmAwKEbIAKlpcKAIFBMSce5RE3ao85CTtwh7UxizCj3xR/OEQe5iKnlpuMhFPfCqZABN9VPvRugCRny/vhowlSTEpEQ4zZIVNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nf9oO2VI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gdJgAlRY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APLV7GB3666218
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kUmhtGKileNcr5d1+kHjKgJg
	QZ3oEKqCuynOnc1D3Ms=; b=Nf9oO2VIJJLviXbqo+9exi8tx6bWVyUtLj4B0IYJ
	vdJocpRAAPfT0m80IjKwOEQhZojD5dceTmBYX9oio9rmXBr3ekEeDUUMqqppCGpx
	XmbTfmKF3woQfqOXZ/L9PTwhs9gdceidTXPqvnqgScR+riczL4EQyxQhPZ/hX8Yb
	3BvBigJKntbIJLEyP/wxR61i/P4aCT80/5044kKQOnev+v01fFhwvv8akD1ILWHn
	pqxlb/6l0jmAOLzYCtnSQj1KrK7sig9TDDU4SdKPjsreYtsXLqcrzhfAA2qdrU15
	zDQ91trvCCdiA9/0J8OFjfFTtrrJLRiw+cgmlXbqRxGtNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemran8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:36:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b259f0da04so1594094085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 16:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764117372; x=1764722172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kUmhtGKileNcr5d1+kHjKgJgQZ3oEKqCuynOnc1D3Ms=;
        b=gdJgAlRYNsrgoDnnw8kGEA8KYOYaJaCYE62JEIk9K53/JHRkAklwCknhweN4LLn5WW
         KIvVr6f87OccPGmBIlzpmTiOSbkpdbYy71jo+SwZBi2Q7Pc+EUcc4lryOn2852lupVVa
         TQUAaElWZInURa1Q1OoJmXua++XyZsUwuQcuad6ijflkE7dREx7sIkITMgflJQUaqOFr
         Dhm3I32uPa9aNoOhflsMFbcR9NPyuwdiTypJhXWgE5FBL8GH6TyRv2ZrXlK3y2LejAuN
         7hYAOWtUcw0mqPNiv0Huc9ok56bnL3WhS00sGk7cyqs29qLE86WreFuW1JUUl1RZ1uzc
         G6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764117372; x=1764722172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUmhtGKileNcr5d1+kHjKgJgQZ3oEKqCuynOnc1D3Ms=;
        b=wZUnUN8sge7tCRaOTPloGoeKaRDhwYKFbd0UW260BztvHs0p6PRyR3hdiH6BJZlA++
         q0xXeACDX1eHEInqV2By7SHdVmFN9Ssw/EPpnjyurUT5rjT2QueMZcVp5gVDXwEuFMeX
         Mwge1ljTNg3dPNi4x0JLPW6NhG3+utxZwVYjkF1qSy+jukRRcm5zdFYMFdcYcfoJ8oz9
         haiRAwYoKoMHAg9wJ+4J5I1bdhK6xckzCVsp2qi2R29dTe4WjQiNAGEzCHbHqcBzJ9Iy
         IdWEEP3YWUugtOORFsULwv6xNEDW1+FLQada9QEZa+VqpMGZssTu5yCwRQdLDCV7w6ki
         qAoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP8OVhCwIj00JZZ1UmWtq9n63b7nEQasvcuFgQd9gNAXitGBuMkyAvpdBnBLg6jS13HhJmYQ60rDrajkmD@vger.kernel.org
X-Gm-Message-State: AOJu0YxXXjaHlFW/j+JiwA0DfiUVcyyvvQnaZ7Puj1jmdIyLcucWfuru
	BsrTniaASTbPw1GemODeRV/tanWTaQ5X5OylP6KbhkYIQu+EGtLe4e9oZRpo5aGFZrsHS2kt02x
	vHiWHOehoQ9On3sicuxCVWo4FBJaf68jhQZDy+lTh9Iy1Ec+fGDKPYgBk8O3YCMhK4DSV
X-Gm-Gg: ASbGncvELZ43nhc1p1Zbue1YflNYrRieH7mnQ9VE0f31wbSnxa5GB8h01NHfdP1A/OH
	FvR1MqQYyE4keCFhHjizai0wEPBz5UAPCniWJZe4AlZydscB5K/+e1OQN0osjyJCPU7V/y5UGlX
	0U5JNGhq5iyN7rUB9a8QY6xVyBjci2DT5neWKG1snuTgx/HP5lQSApXITSW7fUgWq0AEQdQPv+T
	Zgv4nPStXs1hlKJpsoRE5iGAlAI+LB9kQvJsi0dqDgODZl0yqVRfujQrWSi1dlBiihKE4FWMLOv
	RWcG1WCo92FKd0PyAHORaEqxNA8oiY/kQkXi0NM/wyrtb/oJPhbTDSHgeqgxfLSBhx+Ty5MokyJ
	RvZHonSTskwhKagoDHKQ3M+AHnklBk8/ejgaNHrcVOIYl0odvv42SJX85RgF97UWF/CPJBugr50
	d0IvF/T6ERZ6E3QXkFxm/aVbQ=
X-Received: by 2002:a05:620a:4721:b0:8b2:598d:6e78 with SMTP id af79cd13be357-8b33d1cfa05mr2248613385a.20.1764117372081;
        Tue, 25 Nov 2025 16:36:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbUaNky8a208Ayn7g+O3N1SROBIZYsA2yB5s5KH6Rgu9PO7xh9bnordGESPhEkayE8CbD0yw==
X-Received: by 2002:a05:620a:4721:b0:8b2:598d:6e78 with SMTP id af79cd13be357-8b33d1cfa05mr2248610585a.20.1764117371653;
        Tue, 25 Nov 2025 16:36:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbee7bsm5579665e87.50.2025.11.25.16.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 16:36:09 -0800 (PST)
Date: Wed, 26 Nov 2025 02:36:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4] drm/msm/dp: fix the intf_type of MST interfaces
Message-ID: <3cnujrkkcui34wg3jrfoezradc5itm2paw5mgkii2d2snlac2a@lerj4ldbvf4l>
References: <20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PcLz22RQx3qu0nZv4f_pwb73snwa6khN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMiBTYWx0ZWRfX5qyAdUD15ME1
 sSH24UjvVDGOC0L3zgVvP7nAkRHBwBsXiN0q+drJalTPYDQbq/Jqa9RCVfxEqMqZueLhvOHo6+M
 RhlBDFNCQPuRYZJS1VXPxjcEM2DPWS4CGCo8cX4GY300/eIKmDloF/VUnmwVHDWOfkcXeue663B
 nn2pGXwwztepPAaZcif/SZ8Djaoeh3Rc9PwyStmgpmlwOK8ZeFopqOG9biYLQqrJeRJeDl3EkrD
 1bbhBlghrn36mixlVZDO4ZUcJSWGdjW5e8j+AALvpliqKwHCeuu1/w4KZHeMiN6V2nCqutPkMv+
 7KW2K2+6e8g9o1EopXdqhwduefMEJiUBBy6fN9nOqS7Q1YRFOx98M/Agd61anfxbGrXIq0kwk55
 bxNH+tgL+JUVxxx1g7+Kb+YM5j7O5w==
X-Proofpoint-GUID: PcLz22RQx3qu0nZv4f_pwb73snwa6khN
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=69264b7d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=OLtbIiM-HhkAdaCUfmYA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260002

On Tue, Nov 25, 2025 at 04:22:12PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Interface type of MST interfaces is currently INTF_NONE. Update this to
> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
> dpu_8_4_sa8775p.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This patch was split out from the MST V3 patch series:
> https://lore.kernel.org/all/20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com/
> ---
> Changes in v4:
> - Splite chagne out from the MST V3 series.

Why?

> - Link to v3: https://lore.kernel.org/all/20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com/
> 
> Changes in v3:
> - Fix through the whole catalog
> - Link to v2: https://lore.kernel.org/all/20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com/
> 
> Changes in v2:
> - Change the patch order in the series.
> - Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-3-f8618d42a99a@quicinc.com/
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> @@ -363,15 +363,15 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>  	}, {
>  		.name = "intf_6", .id = INTF_6,
>  		.base = 0x3A000, .len = 0x280,
> -		.type = INTF_NONE,
> +		.type = INTF_DP,
>  		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>  		.prog_fetch_lines_worst_case = 24,
> -		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
> -		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
> +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
> +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),

This is a separate fix, it should be a separate patch.

-- 
With best wishes
Dmitry

