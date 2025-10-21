Return-Path: <linux-arm-msm+bounces-78222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73404BF909D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 00:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E2363B97F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 22:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C09296BBA;
	Tue, 21 Oct 2025 22:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8ffH920"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EF2295DA6
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 22:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761085448; cv=none; b=mZz31A8iFzZD2QQ+I2DT5eehVqixHwXFrPx88DByLYLvMUf3Vbkb2JQVyz1AC5jBihXtrV8BHKDs4uCoC9Kf4Sk3mTHabFErIZAYhnDJbQ25L4DQ83BOAETpwK9fFJkWEhMmaMYlfT7Fdv/aSdkpLnDwxdMMxnl4oWEwG7oYXcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761085448; c=relaxed/simple;
	bh=VjKZ+Wz+UTUQ+T+BFxRHjXMJn7immbv/KaLWu1NsK/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BttyW3lXptqWxx4FMSyUhLw+yP2bzxVu4qlc/DNk28S7E6XdfwprQVfDUlqBoTRl3k/z0wgxdW3Xas0igLEFa+REUYVuJe1OKGzNGD9t8g/e0C+dtqsPEC+nWqS8b+JNAVjq8Meq9Fy25LJ6hjqbYwvv3hQHahSDbZTPEG4MNYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8ffH920; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LE61kU030670
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 22:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lIEwbkRaccnwSfJnrPULJgVj
	h2AzE4jEqLw017t91ks=; b=d8ffH920y81sDXJTooPV8MnGy2hX3Nb3a4bcPr8p
	OZWFwu6r9r9tQxtxajXn+en3N7hLPQENOQg81bu+Ce6JwkSSNrHAwf5f3XZUHnTh
	sg5xcQAIltFt9ir77juHGe7hxEnVWxTsFkKWiRpsSKDRjgfa7ge3hxKCeAsoWjhc
	x4e9fulDcne8w/QxMZ0NvxvsKPPBmXw+N5tUSqBZTh9f/84Y/lMkEgbau5/RQQxr
	NLebsg+uc8oOFpsTnQTHh3nrHQS3+TOpQCmvUWNDpkeGoJY/hARG2LnvbJsRsRQw
	g+sjF2/9M4dD2zqzU5yTiOIoJfLcpRr8HxcLXHyHSpy+gA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wswnvs4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 22:24:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8b15de40fso16909901cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 15:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761085445; x=1761690245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIEwbkRaccnwSfJnrPULJgVjh2AzE4jEqLw017t91ks=;
        b=mq9uTkFhbmfwwrqHGNPiq82Q8dm3zCXA1p8RRt+WXTUVUAJ+i2mRJNj2vsfa39CRZK
         sQZgRYkNxk4HH+2b41LbeLccd2oOyNFdcKMV5Y2Ux3dF2ZD06uVwkyK5XSIzqvW2lNJm
         pmgfK45X4l37iqOE9E89mSkdxOLiH41xPO0BAUOqUCC3lLs2XKsWrdIdVqJJoivTKJMa
         rIvqAW/x7IdTuTHbJeRo9cA3dnKHu/lH38sphcun3+rahi74pbxlMZ+0e5PaWLAMXzLw
         GCxXkezdzRv71h6JfoJTjX4lRAZAWkp7W9tp1NNWqkG9TrycBRdfDAnrXsZFLIZYTMVP
         yQcw==
X-Forwarded-Encrypted: i=1; AJvYcCUB53BssJHJwtpnN4vPMIWUMBTQ5x7Q5BoDrvR4a9NueK3WfyDnIpYBnDP3C5bw+BMDN3bTQEvayhIUMtDk@vger.kernel.org
X-Gm-Message-State: AOJu0YzSwWf2+1k+BwcPx1qF0FbcEBFLNMXMPjbM1B2pv2zjue4bJRb4
	mctJxFQO4NEcLFk6LkHFEhAEWBEDeqhq+breaAcRKMKJFNK3fPEthGhNFIc+c+T8KM52jbvOmye
	neAkOq8rX75tiG+Mq32WLy9t1BSei9dIaXiS0OHOW6TUleiOotXv2IAJa+v/9SZxhVcVkTkC9Em
	2l
X-Gm-Gg: ASbGnctLo9HUBgoC4G7KNJm4sfX7aLS6by+usEpcAPjQs5VFlbdokAO8HP7uFjyiVP8
	lToZYDZ3CJhxjNKz6Ir1RLoZxCLruHhtPNGn6xbWFrbOxvf2lZ0WbNyToIAhkp2TN8zgRhd3Czf
	TGOlhQpbi9TWb4xLlgeyWK3ADtuokDTgHhkMW0srA/fVlfQjQZodkvkFLsPdOMWOrUyLrxNsZiE
	nPcv1uDKYgpzWmepQicJfFiOO0l7HfEus17Af076fLdbz7mMrAVbKgA7S9+Qe9gPpVBLfxiYvU7
	ZB5xa6ZGQJ0fLd9gu/aIOhea6rL4Ldz0nO5aO3lL8V2tCklXrxBfXrX5A6j2Nd5qgiHP3ld3SKu
	s8Ph4mSBCC8MtqhFhyAdgM0xNZu2tQtkXwjTQB56roe1QkOMN4nmnFYXapSAlhpZ9hVnIgTFbIn
	bLV6GBUN+CmCI=
X-Received: by 2002:a05:622a:130d:b0:4e8:9692:edc3 with SMTP id d75a77b69052e-4e89d3e6fcemr230204061cf.78.1761085443945;
        Tue, 21 Oct 2025 15:24:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO2dilNu+3Zu/5DJhOTiCUiS3fXKtfJ77ro3v5QwU8FFufub12ZqYiI70pcMuWzlO7TRAAug==
X-Received: by 2002:a05:622a:130d:b0:4e8:9692:edc3 with SMTP id d75a77b69052e-4e89d3e6fcemr230203811cf.78.1761085443542;
        Tue, 21 Oct 2025 15:24:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591eb14a5d7sm1234007e87.53.2025.10.21.15.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 15:24:01 -0700 (PDT)
Date: Wed, 22 Oct 2025 01:23:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] regulator: rpmh-regulator: Fix PMIC5 BOB bypass
 mode handling
Message-ID: <te5ubj3byqxfp7mivsmwpcfjdjb4sds5cjhybmibjiexjehswp@zbppl7syod24>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-1-5c7a8e4df601@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-add-rpmh-read-support-v2-1-5c7a8e4df601@oss.qualcomm.com>
X-Proofpoint-GUID: AELPa6GR38klYSeLO7xbBpnSQeRn2chX
X-Authority-Analysis: v=2.4 cv=Maxhep/f c=1 sm=1 tr=0 ts=68f80806 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=pnqgtF6Cvftx_ToyVugA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: AELPa6GR38klYSeLO7xbBpnSQeRn2chX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX5tnzbf9ymYAv
 wwm+VsEi6yKf1dFPS+ktiEWyv2MQGr4R5agmbyt8vY3ThzaHgi6qcI8gKGfIYD9jp35wmtyDv4v
 y+lCFSqFqbi8VoyWhOhTeUK0jdgPuDLzYbCBv/AQloEMRbHMjxwBeWfC3vcgp/rgoN6tE5Zi5Qo
 7efZHSbhD6RAcfYZn5gGUS+EWpNL9exHkoTQbtdzt1p7FbgC8EtvXHvgDz98dIubPo6RS5F4iKk
 pQGIWsJEZYTvDamY57BofUAZ30fKMsanqgsWQJpaBpRQyaBcdpAbppDC5jZOmFGeSwO7RcAWuep
 RdKhrjKSrjeYKFQEB23Cl2N1YY/QfFgXg1+o0Wk9P4ljP+Vcam8G554SlukpgU40Ql/XTIPjpr6
 F4m2Zdig26qi0HJRBHe47IgjruY7wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

On Wed, Oct 22, 2025 at 02:38:53AM +0530, Kamal Wadhwa wrote:
> Currently, when `rpmh_regulator_set_mode_bypass()` helper function
> is called to set bypass mode, it sends PMIC4's BOB bypass mode
> value for even if its a PMIC5 BOB.
> 
> To fix this, introduce new hw_data parameters:
>  - `bypass_supported` to check if bypass is supported.
>  - `pmic_bypass_mode` to store bypass mode value.
> 
> Use these 2 parameters to send correct PMIC bypass mode that
> corresponds to PMIC4/5 BOB regulators from the helper function.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Also missing the Fixes tag.

> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

