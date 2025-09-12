Return-Path: <linux-arm-msm+bounces-73319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4487B54B8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 13:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32B183A40CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C428E30275A;
	Fri, 12 Sep 2025 11:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvQWuptq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B88A30274A
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677682; cv=none; b=ieCD2rn7dZxVJ4c4gzDTu5IW0EuI/Sn/x023WIHwCK54Ck2bN61wp2rd9qZtY4iNHExmQ0TYmB83rBqrT9gcVr/EjqqMIIk1DdCAMcExSVaipbUWFvsy8L60Mdq6N49dDhi9Ar6SQLRS2RYOESN80uHiIxR3Jd+oDK3OuVYC6iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677682; c=relaxed/simple;
	bh=dwEOCDuz8pHP9PSRzykN4SseAntCzLGGuNq+yxAvNyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBfsAqATawbXFBaV00H1+vxTE8vMWBfGpD9i5DWvhNfV8HS8ve96uqoK98+QHekFO5Qfs8IS8pk96E2DWbF5LHGOOgdk3LkupaMPxs2PM5jPePNJfnIaNZPJpXl9uRTQ6ZP7+oxOcD2xZ5ldByur9nTXVaiWQUUgXmRwzCjowDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvQWuptq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fa7g013235
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GToV4QE6cCKItMQsLrIeSPhG
	neO7K5k2i2q1jGRtV+I=; b=UvQWuptqKdBsydqZVnOxBAy2NHjQMB4PcIhj2s2J
	hP5GPM73YQX3/bjE5eZENftiDyxAixdB0O0kORIFVnWbNcel7vpUsB7I44qnUNeZ
	NepM9rpBTdNPOBDUc4r60Nfc10odNSPIYR2Mr6V35b6He5QVTRMBKARIJHv/83TL
	jvGUlhIaz6uMhi0xU5ftuM6X+JgGzW45ctb55uf7DMhF5wESOseibbdKRq0/LgKo
	KpLeR3ZDWc9YxuJUof2mr5zf7WIn8eO6GdtTCy2Fh9qBvSChNarq2nDlI/5BzSwv
	tSNjHnIkxYu+YKkA+aYUhfj9eWVMHmWHPpYDUTZYEe9wQA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqgb7yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:48:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70ddadde46bso36482966d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677679; x=1758282479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GToV4QE6cCKItMQsLrIeSPhGneO7K5k2i2q1jGRtV+I=;
        b=XjTJtuQrwOQvHtXGkFEw//x994Ci1DslCI5BgIF6mgRT/H1QfnSDYnq9cuXgqHsvob
         pPwltt8DoltiR9Q0a3pWVKrYL8ZshHdDGmzCt62DpPBLe7mSeHSoUUTDYuLnhnY/WL6X
         spTkEwTdVY9UPcN8j8vFCT6VKVAVZIq1ILHefKvGWX9Vw1kmKkVaoPBMMgJfNtsxT0Qx
         2Fx1K500hfl8h950lUCXwKiQxdeU7DxuZnli3i8uqw1GZ5a7Yrlg1LHjfewAmp+lWGGq
         PYinoUmQ3NOQPY/K1UDRFBmfyP9rqpUI4bFsFopSCr/3IYEpyp1RT6N9aJ4SPJ714Xx1
         YUpw==
X-Forwarded-Encrypted: i=1; AJvYcCWPXZfXe+lpIc7Lu0kFWoRG1h2nc2s4BOG7C5v3H5qEsjAMcS/wTMNbEybf2UKRAnKQKdRNPIbDcWSnDRjS@vger.kernel.org
X-Gm-Message-State: AOJu0YxdYXgYtgCJUjirRkcV0u1aB+O2Pkzmt7jTkwAVgEwnOUdYHqJH
	gl2A1anhqlkrbzTx4y7+CJzv3yUV8ZZImaXn1DvZcZk1hFts5mVhXAW4K7DI2Oc2ZO1M6lwU4qF
	QEV+2fkXS8nWAF6RA+Cs6iF2eGTjBmvnI2x50lg14q6MTCOEO9nBgNAM/yCJYY+pymOWF
X-Gm-Gg: ASbGncsEFqfIJSI7Xfe7dZ/jnERXTgy0QBFwWnGMU2eXiNM1Vv06KALxbXDOVoFd59v
	o+EC7CvPXyDFM52CjgjnwMddKL2SjrZeuz1iBmePs4ZMmr/5YKVMYLO8wHOBKObpLPqUVPoBu4c
	QeM2WFR5OjKTpdjz5VJB+CWZM1RV+4lSDTHcVEkqbG4S96eJqsAQdiQ2IBYuFJIdoqUqiikFUAV
	vx6oww+dhSBzl8GEQdwOeVX6R0KVE+14p6QZZa3q9zUaiKUgbQt2u39fzdKq/U06ZRdpjH1fuDM
	VW+1M6uzBpx/gaxJ1xhP0g4/itBugB2j4x7TcVVL2ZPQ0VhoF2R/qCHXPviJw+/UVEdImouIpoy
	KQ9rtvfEbxSjDlpW+CuXGpuVT5Tv85UV6olMpLpf/3hvI+KDlCObo
X-Received: by 2002:a05:6214:2428:b0:715:94ad:6add with SMTP id 6a1803df08f44-767c3772553mr34660646d6.47.1757677679092;
        Fri, 12 Sep 2025 04:47:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOipAh7umVQHV6wn1IWs32WNBot8nat+cTmZungdIIqqFVBnoEtURSnSYREkpzlbIAflY9Sg==
X-Received: by 2002:a05:6214:2428:b0:715:94ad:6add with SMTP id 6a1803df08f44-767c3772553mr34660316d6.47.1757677678632;
        Fri, 12 Sep 2025 04:47:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1c014cb1sm8425911fa.62.2025.09.12.04.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:47:57 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:47:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH 2/2] drm/msm/dp: Add DisplayPort support for SM6150
Message-ID: <budeqnh65mcmtc5rscbgvy2nz3woptxnht6sddzg7jhttsnx5f@bwf3kyvbrfaj>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-2-02b34b7b719d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-add-dp-controller-support-for-sm6150-v1-2-02b34b7b719d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: S-LZNkS5RKWxCy-PBoIufY4QvLAUnmdV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX7r3xG+MGa9jy
 6EWRhximWmwutmNUnGcoccwYbUB+JcwijnSQ2wVi3LJ0KnO0UdNbkIyjXayarypeOPKjy+rUGgn
 dAId71zQnftHkf4GfTgW/KVBt8NHYXpNu3l5fXfyOhw1haseq8yJ6W+BiWJC6o0dWcm9bHqW9vX
 lApRBulE6ByKYMP3wJ4JBaDIqL3KKYvu4FaV3/YVgk1C1ESBgSldU5/YDudIabcrGc/36RCNzKY
 FqnjptqSNVn/i3MLtF/2h9irDreFSgDaPRw93kjgvqd673TzB+Y8DEFMXHYqTwDFgoYCiJzTyFB
 GBOJanLmHq8fLqkNSHTyymLsYs2tZhEAjb5Uf9RkF8CLwe63DfaPY4YDa5pxnVaLAvKF7anoK2/
 fS8cqfkO
X-Proofpoint-GUID: S-LZNkS5RKWxCy-PBoIufY4QvLAUnmdV
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c40870 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2HRO-YaP1JHyyBiP0YUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On Fri, Sep 12, 2025 at 07:39:17PM +0800, Xiangxu Yin wrote:
> Add support for SM6150 DisplayPort controller, which shares base offset
> and configuration with SC7180. While SM6150 lacks some SC7180 features
> (e.g. HBR3, MST), current msm_dp_desc_sc7180 data is sufficient. Listing it

SM6150 supports MST as far as I can see.

> explicitly ensures future compatibility.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
>  	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
>  	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
>  	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
> +	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
>  	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
>  	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
>  	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

