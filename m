Return-Path: <linux-arm-msm+bounces-60792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A34AD38E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 15:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44E4E1BA3406
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF79246BCC;
	Tue, 10 Jun 2025 13:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qx0NUSpL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC5A246BA7
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561281; cv=none; b=qOKqTf0qIqYZD0qp8/DrrbGWemmcyRDN2X7eLAQMXL4oq0Nok2yN+W7cZNDR4NZ9nz6RQLYPNT9GHjBwwH+uvIvT1mar9hE2/BaPpZtx9GUkdvCbkWZItwDMqUUWYtZ0F8ClA2VlnHoZJvEwQA7rZMzNrLVpOTWVoSrTn2Wz2mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561281; c=relaxed/simple;
	bh=AWosMa9QcTrhoG5oBkH7hkxBD59mNOKn7GvbXL3TVGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMX8XR3sieLrQIuQX6rcYB6gUIF4piiXRlFdjEFvwXP8Mfgv8iFIJVx0tWvDxy2M3BTE4P813f3EUB52eITkW9v2ZSJg+L/E0h8Ns7TimTRbK03oa0fv4nZHDEVMz6YUSZpW2bJWG+pO45a1G6F96pbYh3drk9L4DQjd5A5/mTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qx0NUSpL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9Oilb013755
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g6IwQRxCUScwxoqS0e4XHRFL
	lV7pUybK/kFVnN3gEOo=; b=Qx0NUSpLbFRnnJwDivnuJ8s4sTgo/boEDUuXyXQO
	Hi3V1oGCKilWewi9Kvax9DwsZZrjE/iDYqJokwD8VleptqpE8QTEeJAMJa7qiwNO
	TAoL83Y08TAcNzd7J8zkiSHVT5PD2oWVUpFK0uF09lldeLvhVdab1RqQn5M87ASE
	T4gxcUO4jZ1lORlFqVaJDBPpkiGYFLSIvKwQjte9AZ4/rctHDy/JwvBuCNBfoic4
	IoBMBOeFPainOeALttPyrefHeGXPcwAe/N7ekcfS7VxFb1WAyGc69bG1KLlVmZaJ
	kRGzGhbIme2+B1E6KVlmNYC0trNKTGBx7ZuW0iSenhvonA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y4au8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 13:14:38 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-87ee6a621bfso171466241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 06:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561277; x=1750166077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6IwQRxCUScwxoqS0e4XHRFLlV7pUybK/kFVnN3gEOo=;
        b=h66TrT5ZozMlR0xoB0TkS2WEUoYkWMCuMRPD7spV/nY0crURR9ClBHa1bFjVUhzFbT
         iOQK7IhdzRFpBdB1cEGwtb5rDrZcN3+84wqs0TmGhg5iY9WBzjL0caT++MOjAdWdqkt/
         hWkU1iyQ66Ov1iyxZKItVtu4cLD2sVa2XiDRxLz2QKQrxl3FkzaaOtrlRWWIZgvPKbhn
         hjKrf7OVDUhLeRZk4PGh5nKseFfXX8w1zzgA2CIf+0/9Gj6r/261ZZCZgDBXQ5LnvgLK
         cypXooUpt2vj3n7TYZIJXoPiaaAwj3sJpwYlEidV5TEQdEV0JZhkSSL4n1IOb+VvEDIy
         63hw==
X-Forwarded-Encrypted: i=1; AJvYcCWHh0XSqUMbhFQlbkDsNeaj0pdV654czCu79YZvQ06QdGVlqML6Nbn0GlT6Cd02ss3gMFW88O9SxIwpJZQE@vger.kernel.org
X-Gm-Message-State: AOJu0YxshWwv9H3L8iljfAh6yFu5/wpvcupBub+j7xNqxag1GLaZG8F5
	03AKISvWqtTcAs12lESC5G7veP7Dml0vES1nEXfnkCwUsmd8mZxt6i/wbmt0DAB+viEquCiR74u
	NxLGnNutPFNTOdr9KTtTRLiayI2owwojn2GvX/sWwsMjc/l88x72EW224pMATHMapwXDnW79TBX
	k9
X-Gm-Gg: ASbGncuYIQr/pq2mTc6gucKiPflOygw2gtv0dxrXefylcuiE7iwH4gw9WJKy+J4f9AC
	J2UdpUHWkTb2UPgapDqp0aGihwzviS4riHJRkecTYQw7i1eY/PDAA6NABMxeCSKLgE3dhDzSjMv
	fnsuVjTidGcb2cvfGV73jHO4u+HOcqeKGkWUQRbt+/LZbu8tV7iZeSmqS+ETKnGI65UCqLJUmFF
	dgFYyGZ+AMoAc1oXmpZKrExiKJKfzCtqaOQ1hO1qlqy5cvEd5l60MbxNnFEIVTCX+mxqrzVVLHk
	vI+KBaY0dMIWH3PX/1I2S6HIQIFz9e7g1VT6C4eGYFuWApSkoRovLZ28cjHkGmxJE6Lky2Bx3SM
	7ZbPLAi0mYtmD84hZjIm+Ku05SIsE7c/3UiI=
X-Received: by 2002:a05:6122:787:b0:530:720b:abe9 with SMTP id 71dfb90a1353d-530e4875aacmr13391970e0c.7.1749561277032;
        Tue, 10 Jun 2025 06:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYQC8rt3kTrusAsNuIp+4RWIrv68jhYVstYuYleyxm6ZO9onHgFJwUJlqd4EmrytlbgstvxQ==
X-Received: by 2002:a05:620a:28d4:b0:7ca:f37a:2b4e with SMTP id af79cd13be357-7d22987fcffmr2356233685a.23.1749561265466;
        Tue, 10 Jun 2025 06:14:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a3basm1520440e87.155.2025.06.10.06.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:14:24 -0700 (PDT)
Date: Tue, 10 Jun 2025 16:14:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
Message-ID: <skvwhicmdzewywoxm2bims4e6geandodztd6apmrolzqpzcibo@fqnjrs5shp3r>
References: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwNCBTYWx0ZWRfX/A31ljQq8X02
 jXy2I0bFs/qZa+wqLQ2CUT9YBrNGX3yxx18MaC4I8NmVEuGdJDuRrQGYUHer1/u2uZfkm0mk6ST
 3e7hz6qCg+/gIJSYCZAefCK+IyIcO/Em0vOxlOVs0vHtqIb+rvUgLO8v8i0VnJHgP1CcEC4Agfd
 BC4HtIxEAFtT8sFz2LB/8R9N+EnJ26DyvmXBmplN7CqZc8DEkLjaDDeoKJpMlH7rbQpkxUJgffh
 6Bgaq0VvB4eg0D5/uVV2K85CuBMOwOeMgO/NQnpO7ZzoKMI+DoQdXUSTeFAepgDM3vUfvAH/dYd
 IconPNDpnpP5h8qnnsGPwtxPRLTx9hDDuUYEI9wEb9PpRggkaNVknwL8caXTbjjs+2Og+95rwuR
 0dW/nvYf+XV3O7TcRfK44XWxZauRq15HmY/hTjv/syum811IQQWfFGAMP0z380tRX2q8BVZi
X-Proofpoint-GUID: syOOhfohbk54fcrWa_StI9Nn4XU186kw
X-Proofpoint-ORIG-GUID: syOOhfohbk54fcrWa_StI9Nn4XU186kw
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68482fbe cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=HWQ8LJbAKwhtnRb1DegA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=771 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100104

On Tue, Jun 10, 2025 at 02:50:03PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Based on the downstream release, predictably same value as for SM8150.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 +

Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  1 file changed, 1 insertion(+)

-- 
With best wishes
Dmitry

