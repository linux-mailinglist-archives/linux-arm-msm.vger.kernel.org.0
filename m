Return-Path: <linux-arm-msm+bounces-70775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ED9B34E7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 23:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 169C016F56C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 21:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C072BCF51;
	Mon, 25 Aug 2025 21:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnEXUW47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8416129D280
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756158946; cv=none; b=HUBqA/Yh7sI/mIs+NZHuHDf2fN2rJJpOA5An0X6injHmTWtnuuIrYBJ8nJ7NtPdplh0NVXd4V3g2KUnL5myZooprKXQJ+wLoiA+kzi67uLTXG0XXfVBISaoWvpFg2KcgKWZRGDeXlTP/pQMc4WsMvVZrOhEzHnBfdTGJbHpocdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756158946; c=relaxed/simple;
	bh=NXFEpNyEVttMDMgHEZeZ2cvskfO/A0LFfXyq/AemQgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIQuHfU4GPpAKE/OmEyvYyzmkVD7HgeySDu3EbjrEzA1+X6H+KGl6thysb4T1TWnlbk0oGY2JIP0w9PEYgMGt5uI3zbYK/LU9HCLD5PJtvHPHBzApg/izO5cIvsLa2ntYcoFV2h03rOUZzhcyo8b4M4yY56r7MDlSo2FCukA5y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnEXUW47; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PDNrNN018862
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cUqE7qCCjIfKy84Rr0H8Cz13
	kHS6QOxmkyR9AlwzF6w=; b=bnEXUW47jL0w7zec4aFNHejepHoQkNSHY7DZ9tek
	bzcbuSbguIBNE7yvx29VLJVkjPMI8RM6ndrvUJ5lAoxPtjANKfkoQCICsLcGFJUB
	5VW/vG1q1VKUjxcDaKk6vamrDriNQSXWRFb0Ws7IroTvrnttx4bKg4fUWCbr5ycA
	md3x9uy/CZLIQ/m44pVbLbAATU+vi8VwcaaYe7B3SB87xvnfRAzksN596wEqNWb4
	6y6tgUoXlR/L5KDO4G7xuDKVN0FUBTWdgJhKASYYS/uOuTWAvXVFPOmgOLXe7IJI
	uk9x0c1Zi/xpjBjVHkZNdfGTxFtNlu56KQVc6GU3nHv7Bg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpppn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:55:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2955f64b1so134707171cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756158942; x=1756763742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUqE7qCCjIfKy84Rr0H8Cz13kHS6QOxmkyR9AlwzF6w=;
        b=HmFuH/q97EKWla77QfoSCIF2KDW1o5PBpJ45tJIb5bAiyCO+59jsxcVk+uUOLzri3M
         7OkAvZ1/qja5NZw+WiVl0TfNjEjvgcL8cDrvCr3G/zodHRyGjDfR02UGiwc4ZKisENx9
         YxMrPxIUpvoHC1b+l9kIrg96yBoAcm15CRdsp9SjQox5dSCLZNsgHHcVcajs8UAdDWaI
         1HlX6Ixtg42VLyiEVE14lrXbPyv+atTbzjEj77zkCVtU0aqu3MTDiN/iPEaohAouzJ4K
         q5p/MYxdr6pQBQAKsDEHdZJOkIfycXRDsCdi1XlEqY7j8fec1FyMGeLP1u7a37OURLez
         zA1A==
X-Forwarded-Encrypted: i=1; AJvYcCV2X2bbkEdUJg+vsbQGk8I2yg/WG5XBMzr83xP+ZXSSzPY7yKDHWbmRIYHhpNkGmxiUfC1kgNouARFY+Xgo@vger.kernel.org
X-Gm-Message-State: AOJu0YwfUmmFQWi+Nar96/imlyJFSafKNmJc3MhD9U1LgqepHpLJMmCJ
	Mr7BAyrtvmDuCbF11sWsKc2o/hjGoKLdWYC3SU1oTeoub5WV2FxWiFcTp6/0hQ6Prg2x2f1HfCg
	CPnUoCtJj9X+suUWQNYY63m8AKWzeZZVvf9nAlieOYwy4igAUBCic79VakR+alPG5+WPK
X-Gm-Gg: ASbGncuOrBePFcPRQac82zuQCjfazp76EnvkAxt8OnDUZLfDYGxHiqn1AhsJnUZ31wl
	J0cC4AJWz5xObS+D7q09ngAtebG4OebA7tHc1/4QIs9I0aPmdw0i0VqTRPNpzOk15gxjhtO+XZ4
	NDzK+OlcOW6Jvuyd9+V2v3zISk1p5KIBom/YD33H/aDDKpf1cxa71gwIBTNq2KP2b2lxh0e7VDZ
	aWItfNIVQ8EHGndWHY6NiEvcRvhUWbGrMAWT5k/GtkYm2/qAVGaQGi0TR3Ou4DN99iMYPX2uHi6
	h3eMe17LKStx40/A/uLBrwFPR4EKJynwjnx7BFfWI1KWwPYaIHKenY9wqQ4l6+e7+Rt3LVEZOvL
	QjU1vHtIi0EkiUvCweWU6XKO2zz8MP4N6PcclpvJppTO91Crv//4D
X-Received: by 2002:ac8:7e8e:0:b0:4af:1bfb:1658 with SMTP id d75a77b69052e-4b2aaa196b0mr152453161cf.12.1756158942114;
        Mon, 25 Aug 2025 14:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFoMD3lKyx/+uaoF6/Udx3va33ITgDznogbeIupv27fT8xR/EpMcyEGrE5fvEV0eWAe2Y/LQ==
X-Received: by 2002:ac8:7e8e:0:b0:4af:1bfb:1658 with SMTP id d75a77b69052e-4b2aaa196b0mr152452801cf.12.1756158941479;
        Mon, 25 Aug 2025 14:55:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8bacasm1855198e87.97.2025.08.25.14.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 14:55:40 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:55:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 22/38] drm/msm/dp: Always program
 MST_FIFO_CONSTANT_FILL for MST use cases
Message-ID: <s5a6fpyqg5nybnnbrv7wwjvrsj44tr4cihcojkcfwmz5dc4r5m@rioxbgxvwayn>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-22-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-22-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68acdbdf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1UWbhTYU8iixJmD3m_gA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: DvpGH4OH7h1moFOFNf2k019VGAgYwIYb
X-Proofpoint-ORIG-GUID: DvpGH4OH7h1moFOFNf2k019VGAgYwIYb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX4paqGh0r4PZW
 YHc8dC3QharameegNmreiIr7qaULgKQ3h/iymdVeEg6NGKRLuX1Vab2xNnyo0ZXH8McxL04uTiI
 morGSAgQsKphi1FI8swBYaFVbnXIQNHYyjkRcdxLBmw+lbHbF4GF8tiJ0xL+X4CSapx4xrYqvmq
 vZGhGakS86iALsLMsb1+ZOSblQa+C9vUl5E7qWjDzZgH+o35YH6mPTWlvkUGarn6IYv6rxmIoZm
 B7v8GfjL5oK38qnvLnnLulC1E9LLXf8a1zqoTSp56fodbVj2HiRqx/Z33pJKXTFvWwbUFzw3ePa
 4ajeDG6lE33R+zCc9POOHQlBV4nXiSHl+UFsSZaqDaEvat85vN7I8x2sMwi/8rmTMvSFgwyHlDq
 3mmWdxyv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Mon, Aug 25, 2025 at 10:16:08PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> As per the hardware programming guide, MST_FIFO_CONSTANT_FILL must
> always be programmed when operating in MST mode. This patch ensures
> the register is configured accordingly.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c  |  2 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c | 12 ++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
>  3 files changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

