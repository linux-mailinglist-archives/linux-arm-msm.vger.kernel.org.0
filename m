Return-Path: <linux-arm-msm+bounces-58311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2A9ABAF17
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2EC83BAF0F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 09:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DD013D891;
	Sun, 18 May 2025 09:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0/g6Spg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDC83FC7
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747561706; cv=none; b=vDoZEedzEPw0lujYlkxG4PMUcVIJ5EFfGiRw0TDDalgIggpRGd2LrwVL8Aa8+nUK3GKgpJgyX0WYVwmv8ydtZ8dpXoGaUmEs8h8pOMgbl5+xJ1rIGuLliHwp54zED4C72rUUFlAasjp5ekMK9pRdavCh7y3pakU/wwHGnEcMqGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747561706; c=relaxed/simple;
	bh=fAd1GnAf/ExTF++zbaiyjk1utzg/TAXkIrKsAtv8WiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCLEzo9hZLFjLloXntZiLXvV3brXdcGN5uAEtbG+kPCh56dcRIMZJY6k8srf2y5pX8AublFBc7Y0l2HdkcWUG2Fd8mbdCYzhNWBt1I0CStyOLHTOz/QMTRA71PKvPKR/yJXsjBBjBP+h9ZZlIA+Myl891JwhjP53QqRG9KUAEGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0/g6Spg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5mqkB030629
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xeOReUMI3Hxt03467caU2I9E
	n3IbDwST/lECenXzhQA=; b=X0/g6SpgQqhIg+wgpQurGGuX+B1uwWoypnY27hcY
	Y1MbNVyNZBBE7z84kQO32/lwWMR3x8t3FI+JtqWuYGmg3u+MaygDIiQ8xYn4l3QO
	gktAdp8JExjheKeUn4VsqN8hgkWhkxtJA9tCdjbMqSve3P7X6pikMyunlEY9usqY
	/SDsoqvJetWtcD0R08dTgL3VDYkjwzoolLyl/mvyIFA2KPh9WzlgxMTKhkf1SViN
	61kV6R6KdylosE1wLWLLkHnTQb7niqeKxYFUXhR2Ixa0zilpjfGVvKOfu9k+OqQ1
	wnww4x+uGTcjAG2/mHRsaLqkj+6lsnDd1WREOaofdUknPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcstng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:48:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7c30d8986so1092144185a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 02:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747561703; x=1748166503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeOReUMI3Hxt03467caU2I9En3IbDwST/lECenXzhQA=;
        b=LdQ/FAx7uH1ZIu83QJCr/+qfWxnZaxSp+ThBTLuDRJRaRr9GA4gohLcR8I74Y3BlaQ
         Wx/SyvNmzZoT9CDlc5D/MOzV/jRWlB/4A2n39wYC27rd/rCq+HVopEk/4vj+/JCJ1ncL
         5YgDo5zp/HXo73WLewo1T8IP1SaqNUxjgzL4vMqzxcLP0WRtmHp2hB5cKU2JhXd1JNpv
         4l0NM0KX/hz4RsGDsqoIAPPbFnp9XaK3anX9lEvv0KpZTC6pZIvIsHtSJu++DSxJ/Qi3
         grLQSOpFaqTV3cE/ysVjd2n9sm5WKRfMsn0r0vyVRnRQbZxF7P11Jly/GXaOlYT+yvJP
         j90w==
X-Forwarded-Encrypted: i=1; AJvYcCWP5sS61rFXuBLh099qEDo928SLNmY23naqo8E57kwaPwAvoidroc/JtxjANCE3WVWJf5O7XS5+CwOH+zOa@vger.kernel.org
X-Gm-Message-State: AOJu0YwOgy+zgeTdcWiBVuR4J9inMzIfFvsGBuhsKQrcl/zLfOztSB/t
	xTgMaQAQ6J8OpVLCRSSDPP2e08bdSt1CrS0F4mom4KIhr+RnMgSPpcu6xCqTHMoK0RlqEyQMWho
	jTS5pDnGr1VcKl4ZK7Md9kruRfKoHLisvy7Gu51QY9M4OebyVf2YlE2QX2cJsmv7ps1M4
X-Gm-Gg: ASbGncuteGHLYNnAGAoTlB0Lf2OcXTMlNnao5/ShLmKThinSpmUNS77ixkKtEgZoB5+
	wXbLj0B7JfREUxiv8nmcfGsHHrXnQoMh8HHhjwukvMhW9WaTcxkzPkiHcu0IHHGQaw/+0iIFmUf
	5CyqG+PtGmYssey6seV9YCVABXPpBUJaiC7aTEb44b+42gUa1KqYM5c1R9mIftwvxK4omNXIvva
	ZXobNJr8Or+AuEn5KztudkytmfsghWhaHbz/LfrCXUghclb/v4zb0N1Do/QLVCsgHOurYsRUC8I
	RpBJhaEhYyrx7uxUNC75GdIYhmNJM/YtWZ8zvMvVCT+qx5YHV0E6FkXy7JOuHgm9VurB35DE8gk
	=
X-Received: by 2002:a05:620a:19a7:b0:7cc:fddb:74d9 with SMTP id af79cd13be357-7cd47f1f04emr1103060185a.22.1747561703386;
        Sun, 18 May 2025 02:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhxYxoAbPZWvahXZRqd8LNtg4r08bn/rUDslpr+bykQGwOpoo53NY0+RqXYiJ6KdhKIbXOig==
X-Received: by 2002:a05:620a:19a7:b0:7cc:fddb:74d9 with SMTP id af79cd13be357-7cd47f1f04emr1103057685a.22.1747561703046;
        Sun, 18 May 2025 02:48:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017eb3sm1344694e87.119.2025.05.18.02.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:48:22 -0700 (PDT)
Date: Sun, 18 May 2025 12:48:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 08/14] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Message-ID: <ubugepmnr66od42jux65ffegreksmfxmfzkjcjred32htkzoch@h2pfezdxan4c>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-8-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-8-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-GUID: H1gJ2JUG6hgry8BogI424EmFF99-KBfD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfX/Sp3AVGq9zSM
 /rnBnkv11YyoMsXEJVZc2QwKAdlceDT+nV5wOrbH8jfNeqgr+R0CmPpysUvjb4vyXpnZQJlap/8
 oCWkVDFf/WZMSGSrkPCcwdkrTHmGwpPfJrn647sEo+FFeT3eQZcsgkHDwaBQCYy7dyJGq3qN9Le
 Wbg5gwxfBP3TG0B7GdhzGZ55E+75o4L4oH0yjKWhX30itdJGN4ePDYDk+pJQdRG8FWj0E7O5XfY
 mgKIIREZyWY7sOgWGyhCCDQgzQo5fqJFZRxN3OHAmECKceCamCOshJtu+ZDUot5KKqtGHxfbL0M
 UjaaPZprFc+Mupu6o8IzHhJCSWW03ISrssPdKWxp4+9Lq7uuN0ZvqvAClyqCnPb2aG3cTpaxPRB
 vTCUaUSuZJkEaR3y0bSTCgnqXQint2HUGJAj/FcpGYlwMZ0kkadBP4QGm/i6UpxIxIhEXXWg
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6829ace8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=OT4qMnZDQSWkCWZbIpoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: H1gJ2JUG6hgry8BogI424EmFF99-KBfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180091

On Sat, May 17, 2025 at 07:32:42PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 154346591365f3f89d467674952abb2f067e7ce3..a20b57e964d31adb22f0b79a5178b45f0f5ec5d5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -668,12 +668,12 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  	 */
>  	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>  	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));

Nit: UBWC_SWIZZLE_ENABLE_LVL2 ?


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
>  	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
>  	u8 uavflagprd_inv = 0;
>  	u32 hbb_hi = hbb >> 2;
>  	u32 hbb_lo = hbb & 3;
> -	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>  
>  	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
>  		uavflagprd_inv = 2;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

