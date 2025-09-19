Return-Path: <linux-arm-msm+bounces-74229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D62B8AA97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 18:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 572F83B7320
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60CA321274;
	Fri, 19 Sep 2025 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzejlcw+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE0322A4F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301046; cv=none; b=caFDzfm1RT8z+tYE2LofHfqCsIP72x8hs3Npg/xk0tCSxgoA/JF6QvFQVOyOQm4ovh6rk+7x/xY9VfqCjUolaXGB/8XrXs5eIWXxtniy08lAESvcMiAZik1vjyTZ/BtroTroKDmwrV9zewpquK+uydZUItrLFXzzXlqFeEiT3zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301046; c=relaxed/simple;
	bh=ctfjzDj1Y6E0fdIK5UdF6Txrjk8dtRoB1xXgHseP35A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcmzO9JSQfKjiEsI3/vlC4FBrCGSHAbLgw2apSvVf31IqgoVoFFTfq9qDaoEstCFq3nAFkLphmeJORkUvcjApCFO37qrykYkLoEWniv5+QPfeYnUkQiI/O4Gow/agFDOw2iwBW00gUOyRqBXX1ztgoHEDZFBg02sz2r2i1jQM7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzejlcw+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J9tFPH007399
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 16:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2SMDH20YTKikXCE41BaWkB66
	TeohJUYWgem0sV6RAUA=; b=lzejlcw+i1oBedZfaNudsMlavk3kgScMIid84gJe
	pW9ux9XX/6CJYWa/LZgO89bvsDFUDjY6X/zCuvr/wbSvFpz1jdcSrXoVLklOmTyu
	+nKbzo2RQ/JzD78ltijCipZSZEPetdnBGRGBWGDcIbSTd0kWdPJ/vbNUwpRZUE7J
	V2V+o57ltvjq0m6g1RYMnnVivLzSljWY12aW4lDtd3JMkZ1xuhQxZaYOqg/KeIO1
	GnWJw/NrV42nrWBcRA5wHTydBSca0OMox5kU/0096QiaI9+ncNl82tQA22s7lWfZ
	UWmqNzEUx0axd44nKN2Hb8L2OZdALFJ914tp8V+mj+KO9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebewnca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 16:57:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5e5f80723so41618691cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 09:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758301043; x=1758905843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SMDH20YTKikXCE41BaWkB66TeohJUYWgem0sV6RAUA=;
        b=DHpbhKWJFbBmX8AZdFEcCmuS4dSo+UWrC2L7KB/VikcO7lZA8Zk7tIXPENyhMGYAqy
         z9J5RElWN5lp5ttZqfOUQ8a3l4V9Fm5m+mTELRIjDIHEqYvQyD+81a78Gt3E1airGP9x
         7YmHOSEpIv8sITihQqKwGZYeY/2AR3LcxcSTWco3FBJpn4dV+MVXQfsWg1RfSXD2LQpD
         UVUHFigOMwsrKuZed8mqv8RdBJEQDNMGgReQLwtNtl0dfZFfr2p+Auh9JMVFns7BNduE
         tLo9RkBbjPiFtq1X4KgyAqcaGEizgrcWLvQ+hWlANpDaxPQqJJninUD7CcmJOoB2IwMR
         O7NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP5kJ+IIiGKneKoO+RMuaDdR8s2egEqppitddO4zm/6BrVxL0dKHpNaopLy21WnTYy28+aGtFGC6KcoZ4I@vger.kernel.org
X-Gm-Message-State: AOJu0YxGmblNs1JE+BMECzMqOXL6Y4mSJwXCsDv5VQJKXCO+y+zMpDNq
	INvVltZeRo+v13vfzBW2G3zOaA5KUp0hkOLzBp1J5u+qCCJGfUoEdwPgOeevsWYgoYmA6P+Rm9p
	PppAhUBzVwlLiQy1fsre/JlNOjW5PntchWN0ACQFL1OMEgJ6aLlxhmI6LFEZZZ0QZmgPT
X-Gm-Gg: ASbGncviGRATjfoOD8WcBmmE67EPKwX76thpGahIV6809abAm3hQaTLfjiJKnU8R39L
	G3SgD5QaEdpyw8fCP7kT4CJfo0VwGftTtkqGU4FntFSfYz5CQTKNcgZvAM9PYCpfYe0AyDP/U8B
	7ufq8PSpndIS3A+a0o+WE3pn72xgdVM3MQJjRsyzim0Vi2k9+QicXIIcs1A5l2+j861iPqLQ22c
	HcaUL2U6b4vBe7nG6K/4EJoseAPMNI+gcOtWMZF0HL4GSY6ucxdfiQ5hXQBYvtEof0pBd+FwWQ1
	IxPmX5N1v0cdeSqM0P/3ZPrdsgTmBXXYm42QRiZXqJXUGNqRkH1UohIdwtEyJ9s2CpYy4HvNgzB
	nDb8ChspUmiUoVtTB369pOu0+L1c8XX79gHkH/mOFRWg+qjxlCCA2
X-Received: by 2002:a05:622a:550b:b0:4b7:a887:9e68 with SMTP id d75a77b69052e-4c06fc182a2mr52471591cf.4.1758301043043;
        Fri, 19 Sep 2025 09:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Y/hhgM/FH1MUqyFEYlRSM4m13q51NUGUOwCJl1YfmyFvHD8/eWgbghS7pUxj3fFOk2haZw==
X-Received: by 2002:a05:622a:550b:b0:4b7:a887:9e68 with SMTP id d75a77b69052e-4c06fc182a2mr52470981cf.4.1758301042221;
        Fri, 19 Sep 2025 09:57:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36371919865sm9009371fa.62.2025.09.19.09.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:57:20 -0700 (PDT)
Date: Fri, 19 Sep 2025 19:57:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 10/10] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <46syobyexy3ya3jjemmxc5g4tfkup62cks7gg7qpbnrga4fdhw@4ramayspl5uw>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org>
X-Proofpoint-ORIG-GUID: HBuZPqIlEDdOLObQZwPV5eZqNNfiXPIx
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cd8b74 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=CHF6AoUvwY4jIHrWGZsA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HBuZPqIlEDdOLObQZwPV5eZqNNfiXPIx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX3vN1e2JJ8e62
 pfItIye5dVE5rXuhw783JwXmEtuKJE8+FEnJHvQIy6YcbN5pm0CcKl4REvfwfdmKpq6EO0JmQ9u
 y29jG9v71xVyfBlZh/IsrVUD8sbjPcTSkQkAIdjVe9iwU1MRdxrbXEp16kuUgNseW4PaI6eXtzg
 LjOcJT581UHb5Jtn+TpVIJDjMEUZ8D0x9q7rg3VxCnEIx+ck2YVqMIAStYZ0pHH3qfNpFGjqFhs
 iKLLLNIXIxEI4nYxVt0057ReqPCUxHrwBdU+KXK5RX+2dqp3rqb0coMQwPJfPfck+YFGLqjiE7s
 kia9jVttva5SFeGVaqRStdqL/TC/7fNMOc1Ua/iX5+3KLJhnAmepa8MT3xM9jT+rc07fTAOo7z8
 VB6rwAsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074

On Thu, Sep 18, 2025 at 09:29:02PM +0800, Jun Nie wrote:
> To support high-resolution cases that exceed the width limitation of
> a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
> additional pipes are necessary to enable parallel data processing
> within the SSPP width constraints and MDP clock rate.
> 
> Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
> and dual interfaces are enabled. More use cases can be incorporated
> later if quad-pipe capabilities are required.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 +++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 35 insertions(+), 32 deletions(-)
> 
Please fix the LKP report.

-- 
With best wishes
Dmitry

