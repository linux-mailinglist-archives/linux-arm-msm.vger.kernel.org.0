Return-Path: <linux-arm-msm+bounces-70739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CEDB3490E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 19:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B9D81899152
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 17:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076E03002A2;
	Mon, 25 Aug 2025 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1DJUYCy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820641EFF9B
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756143579; cv=none; b=TdZX6n9bS+2BCUDtpp90p9jd/3YWI+hHkO8L+0GfOa004/e+CFz6TXQKyuT7i1fn+48gGfccGoy3PqghuDin5+nx02k4F6bEuTv9Dq9mehWu3DmKPVZtrN1hRTAeaZ6bmiZzb0fDTyOxz/XCUs2tCJzDaKBTPvUZVwZeouHBGhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756143579; c=relaxed/simple;
	bh=W4ZV0iP23nMN77zh9xn8UD1fExc+eozPldRuZJkTj2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIptUmW44KIxTXeJtZH+4xDH01Epsd3VnI97b4j2qSgj8u829UkWM9Yp01tF6fuESwYYhhLKyx0/zYTFb4en7hJcAm914EKZtrzrXHfzc+MgVk54pxSfHPrIyJV3DJ8eyc0X5WD5RmkOzPw8vVvMkz6U+ibjJS3Ji4H6WHJ1VUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z1DJUYCy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGY1Ie028657
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oIsZvuj3zyqTv/yqZeIFq35X
	0m+hZSGafrokoFxwjBg=; b=Z1DJUYCywhGvuKF3VHAarB4nGAQo5JCQzmdMIk/w
	jgNGeZU+w5q1LRcxOYUCeBj+Xk4EdY+Tho9QH5/c4gthlFqDk8H2tvsEQMLHTxjG
	u8XnK4Wp7JmR8QD7UBM3abGObz3CrfE6i7qvKAnSVhD4ZF07U3dHVIDN2u0qy4DY
	TBJy51dxvM3G2yF+9hWy/upcNPXZvzlSxlJ8DxY3nQZD+6Y3aIIhG1LnVEUNq2Vi
	KK1eNBpBNG+HakaUvpCpp24OF/SDtck/B7EhzJGBRxV4KmFQIeOgGBMoSBnDieFq
	8YUTzpqXQ7MW/1uy8g6Z8qyAUdm3uQfiU4z84yzbVc3rzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwyqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:39:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b134a9a179so48286521cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756143576; x=1756748376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIsZvuj3zyqTv/yqZeIFq35X0m+hZSGafrokoFxwjBg=;
        b=VT9JZhn6/h80C4slYl4h2bKX6JruwpBaMjuIAllrSIEpdz3h0XU6gB9xpYUmSE10DB
         BMHUg4qCI8eWCRBxXUS/lHeyMhlO/XJQCfzFqL7lo4UOuFwTjQhjKe3jCjjbmhYQuEk5
         ol43AwFlT/7Uip78E10fy0+c0H+Twne9EJYeY7dpsnvas6xZoqMZP+ctZ68TJjf+QkF5
         ViQj5ezRpP1xhZTNWXhoIZ9U2CSVY12Qm9kweyqJfWGRUfsXCa4G2j8HFCeY70r6AXlR
         3Y24KmpmZFXOT7mraMkIxEc/Vufz2XeIMuKckeHQPVqAZPQgF7XB+cTA7XDz6czsV7SX
         O7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnsGTOjYXDpfEl5hESsAQl7GUxDxYZqeIH2mS9KapsIZNAn8JkGIbhfPIpPSa5m/EqgWdZ2TdkenPv2VxS@vger.kernel.org
X-Gm-Message-State: AOJu0YxInWDNPpgUmyF20EBefuYVqfzClahSCzi2Fiw3F6WyEKVTqbPW
	ROVg4qnimXg4i6R6O93NtYVLhSnKAGsfaOP3b6grbb2wxvfk2eNizNoW+b0g2EykK8LsE5VGsXA
	OoSHZhgIuiubcouWoLDX39d82PkbqVq9eR1gZDKWa/k1hQaVKStARnP6g+3QWYPl66HJU
X-Gm-Gg: ASbGncvL3KLfaMVetzAulglBaKuL4ZD4EY61vRP9FhW3P5RFQa7Qw03H75aZiPq6W0e
	J9Le5G5FzgXhWr3ZKB65W5lAA0ouGRKPiQQPbNgUuPt/5MHVfJF0yBXAQWnPCpzkxaXnl5ZPEVu
	2EZLJ3tMfLAJYgQID63G9pzHF8jAt6GKWJl+DJ09kOza/co2IAiYgWVytFXQHPU2cy8Jz5Cy/vR
	3qyWyFxm0hA99q5vETwKlgveUH59YUuu9x72rjdvyZjMbDwPhx2NM9ASLJgWKSxwjsXfgbWoLgz
	D7S5Y6udfEqtj70aqeMlGuGTDpaLzXu6LRTEU+SjWoLnN2HPMTxU1WuspdVfuvvpwA6DQKjoZKe
	ptIbFb03MRuG9nIgCJW2ZfSV7mdToOrsK6HYZjA9ZMOtpJHDzdmB3
X-Received: by 2002:ac8:5e14:0:b0:4b0:67c9:fd3f with SMTP id d75a77b69052e-4b2aab20a48mr171262921cf.51.1756143576170;
        Mon, 25 Aug 2025 10:39:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu9ExTFKxMITOA8Nf6hgeYhq40ePHq4NgYZNNSuNB7d0GTcBRxbB53k6tbpruIYLU+/S4KMQ==
X-Received: by 2002:ac8:5e14:0:b0:4b0:67c9:fd3f with SMTP id d75a77b69052e-4b2aab20a48mr171262501cf.51.1756143575665;
        Mon, 25 Aug 2025 10:39:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5fc0c4sm17741041fa.70.2025.08.25.10.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:39:35 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:39:33 +0300
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
Subject: Re: [PATCH v3 11/38] drm/msm/dp: separate dp_display_prepare() into
 its own API
Message-ID: <rsywfefrwv67umbi6xeybelsu5u6xqyklvtarnoluu5mzz5u5k@bkexqpdd47ew>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-11-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-11-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfXybSRSEPOOd5u
 s4W7BIB6rov0QSmOx/ZbhLtdThsEnhu2r38Mwsh2PUD6nMuTWshaO0f8IG1vDR9p4pZT0jnh07I
 VS8WpgDJQhVnwszzdRNtjFPd7FGdojZcv89IhSGcVB8sK9StnOPLuBA2jf6iGphWILLsd0d+0RZ
 x0aY3O0WF5WD4/wYQ+L535hRFK7b2MECQEaaBbtBuWPZSpfOA9vcEeSqGdtb2ijyb/5K9Q1HUHF
 hjnHfbzKfRh4JCtaH4/AfqwLvZSzcJsRr3JU7pIvTH7+rpO2ffgINrqWelJT+OsNv1fdWIDz5Lz
 Lz9tqhikc/FIJmn8OW7HNsUcku4WAktUL1kGL4WmP6elkgqmkBI9sVleQUvEm+wtgWwGoT0NN4A
 biyLUhFv
X-Proofpoint-ORIG-GUID: 8MQhamD8RFFX2OPfwXBdqLQflz844Cnl
X-Proofpoint-GUID: 8MQhamD8RFFX2OPfwXBdqLQflz844Cnl
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac9fd9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=oD_kwPJ1Vc7tpeseQ3MA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043

On Mon, Aug 25, 2025 at 10:15:57PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_prepare() only prepares the link in case its not
> already ready before dp_display_enable(). Hence separate it into
> its own API.

Why?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry

