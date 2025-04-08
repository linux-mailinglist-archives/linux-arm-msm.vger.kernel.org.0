Return-Path: <linux-arm-msm+bounces-53519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72674A80445
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 14:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87CA93BF1A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 12:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEB5269882;
	Tue,  8 Apr 2025 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xklge4he"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CB026982F
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113576; cv=none; b=N1zph583HiacEzYG+PPi3eF4BswuP/HOuTF2YpcZcjB7ppUsO90QhGtJKQoGKC41T1tsB8mu9xSweXb7NgTMrjcQRfbtEXpY603BMNH7CgyDcv9cyPzJGoTnhnXc/f0sIFSX+U0Zsd8PO1q+f9rFG5mi5q14ESoOy3IzDn+La2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113576; c=relaxed/simple;
	bh=6Q4B7GpyPTFBkWAifzFqT2Yt0K6BppXaJfVIu5w/IjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTEDFR+EBAsz7ZS47LDZfl8fMbWn7hRUUMoiIEoZJTL+6d1OJqD7boTjhShpiH8WaJI7M35+4of4iEPGICvWxxdcoxhy6OEjSIoglfbyVRzUIcTvidchpanRIc/NsUZC5LMLszd3AMltTd/qATDj/Y3jvS0Xe/djRonEl6ut+1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xklge4he; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538B8AK1019572
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Apr 2025 11:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NEuaNgipirFcEWokWSaWAS/H
	yieGaYJXo6f7MVJMQQ8=; b=Xklge4heqEb6htj8B5O7IHd428xO57ftGWanUiIw
	mR4/sOdbi8VjXnwUa/ND193G+DoZbkPHxW2lv0gGqWArKaC4QvbiMDqbKNYNn0RF
	QVwRWcIUMVSe9xonU831+uYGwXOTZ17u7ZTIoMDhD7tO1bEtxkzMZZ39nOSo7AwW
	w3Wg1ispeItWnd1UvoIbgN1aDTOo/NYdJhqKlDXO0EFK5isRGO7hg2LaSSEawevu
	ftk6T7ByD0kTjgLBRvUix5cFS0MPr2WbshmO3ILW20l4gSXfoXM3mfraDwCcXWXJ
	fQytu+NoPZiBJqSR3yhMlc9oLW4/uxFhMHFSFd23bIDFqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3fmn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 11:59:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff78so1607420585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 04:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113571; x=1744718371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEuaNgipirFcEWokWSaWAS/HyieGaYJXo6f7MVJMQQ8=;
        b=gC2l8Sk86CKDlUbAjjbPsC4cBT0yAWrq4JaMtgnHKCbR0GAqVtUOb5UBPRY8j9Rhis
         hN2jgRe5binQFK5sVEeMpC0WRSOuJ9GOykoXXGNebkXdWUXhZEF+LAR/e4/X5mXdaEsp
         bAUF8SHMPk0EzsU1ec/CUvl3FXNw49aurgTymKqdrLmHVXO+t8EG7EoACzvAG/CMGg5Y
         zZOFXZ2n1qstUkrFZmwXCw1UjKnrjzBjNbmVTO8rZkSb4NeDsqvmtMf0TAwecsXhHcii
         R1II4Of7Qt528sGAlznbL60tQq6vVgiOA/6kjLyzIa9k6dvmWG1twzvMRjEVm2fXHroD
         68uw==
X-Forwarded-Encrypted: i=1; AJvYcCW3+SZ4pAI6zs6+PRZB83wOeI/wWitCUaaQbr6NzYOxu4io/epyB5BO+nxxwEgWNp8CsZ+oXFsOqE4LEnQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YzOIcsCo3ET1Pq2wj9Ogv3sv3MEg5yIwBEgUq5RnTr15or9GH95
	bUeaEEPzjBEMXLJQtDOI9Ma8FsQkcC28ZnXq3BFk/wPX5tSsyCYiMhjH05BNDQnMGlVWQ2tjm8C
	hwH1Lvt/fhxrDanRgsVcwCaH2emOD/TPXtf6cpjadz4X6qM7+HTQmvhO4TRVN6w/U
X-Gm-Gg: ASbGncvJxpmrgGFIraAs3yd5UnwWm1Ejp5Sf9BvKZ/sd3m9AMSW2tMyFFlLfO2Cb2jK
	3lpiDJETdiRk6GNhxY7egaDKac61/yIa87fwPyj4nZ1cykb9M69zwzx/u+YnDqU2m/Kr6MBBNrs
	76iHyOLXdbKKkYRNPd30uSdOOn+qCG3LlaiJfRtmeR6rEmkGNynWA7hQbyoaMrwPYw+uAYPj5J/
	i8yteFcC4O62i/VpoUCGBnrgro8yLcB39tTlrlm4fpaI8Pu7W3bNOswWGTtU5PI/mjlcOIz92cE
	SOjJPwXWn/BgXvLfwby2O2Nvaeq4D1LISbp4kjXhGjdcdKo68qqXNJagfHE38SipLHGRN5/Xh1a
	bi7Q=
X-Received: by 2002:a05:620a:4452:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c774dd611emr2077710385a.38.1744113570956;
        Tue, 08 Apr 2025 04:59:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO0pdqrUOojsKZC0LUZebfwayX/lBneIGD6ckCJRsQXTk8bZ4JOWxGmFcuR+OIU3QqcGFMkQ==
X-Received: by 2002:a05:620a:4452:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c774dd611emr2077706885a.38.1744113570585;
        Tue, 08 Apr 2025 04:59:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab4e1sm1507877e87.23.2025.04.08.04.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:59:28 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>,
        =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
Message-ID: <megx72fwv3xljmimtftryg6ueusjd2f3wv37u2lstdrjt2vlyf@3w32pt3ozivr>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-17-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-17-42113ff8d9c0@bootlin.com>
X-Proofpoint-GUID: LHGh6AVQxL7_c371Yn2PT-Yt67GG1nzu
X-Proofpoint-ORIG-GUID: LHGh6AVQxL7_c371Yn2PT-Yt67GG1nzu
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f50fa3 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MqdoT2xZwiyagvIbdbwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=906 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085

On Mon, Apr 07, 2025 at 04:23:32PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

