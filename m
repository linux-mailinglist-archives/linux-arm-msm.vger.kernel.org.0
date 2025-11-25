Return-Path: <linux-arm-msm+bounces-83279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C1EC858A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 15:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B2E9F34EA87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B13242D7B;
	Tue, 25 Nov 2025 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzwYKouo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="knthrXPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC18F1C84BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764082110; cv=none; b=P/vlgVxvtdX4Mw8h3LPjTSUVKJoB2r/jPR2suJO/V3HY5BJ8xHcOU7XhppHeZMR+KG6HmtRXrrwgXbLHSCQUU5tc34RItGUovNcCjqyO9G+NNuKC99D5ExIE3Gl+AjzWI4GVSGQS+R3lLho+eih65ppfQSGJ+wUWJI7qaAAXcMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764082110; c=relaxed/simple;
	bh=XbQ2uZVTaSVHjjWD1TUnEkQeVw5L7ahtuBLTqwR4ytE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phWUapPN6CPVzbnvddk303lDlmnX+puBbfdam65dlz5PodXBrwXO/RamfDrzGbQnaOXvGyIkZOzPZk4CEB/jeI/h/pgMxTcanyHsQ3dPHNDdP/NxlxPDxiRjssm3jR0HfeLS/BmMOgItpn5/5TUS46y4WIm7Gwk9IA0lBLHSGbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzwYKouo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=knthrXPe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APD82Fe3317683
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2J63HAWT/xBRSAZdQdUSYuIS
	IPaqDrp8aGKI/vJREVU=; b=QzwYKouo7G2xySngcb3N+7/Ui5J6y33hstKhvQlv
	2BAkWnNKYblxvdEFsOaWMIDHmpO/6S+Wje2gxz+0jmV5jERGCuhVSWd1r/yJGPo3
	hVoLWAOcoyqv8kdnFLwCHUcDkFE6rjflSxmhMVVHXBe6elzj0GD20hnoZV+3PQ/j
	LP6jQoVQdePeciCalOaMA/HJtG3kLHUZnzeGvnpWXBh75AINV2KnrHvsq/31u3v+
	Lx7obMuoc7ucQBIRPAiYA9fXGWuQr4C3jU1FcDe7kfsqIOc4Jm6GBEvN7384LytQ
	ZAqGgZVI/P7vbGWOyG5K4ZYTqHZ/fsMokQhLrjwaY1upkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qg8ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:48:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee3dfe072dso158749741cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764082107; x=1764686907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2J63HAWT/xBRSAZdQdUSYuISIPaqDrp8aGKI/vJREVU=;
        b=knthrXPem+PC/17UcH5NzZmAppdkG+heMEjK87NC9pGVjm3vVvdAQYNCKG/YG90Zqr
         mWenOFSCZTIJfoOrg8JXipiiBTFvzEQdNGIfz/87vSmDb9UD3CeR/6GWbyrAseFYaitm
         RbY07hDdobALzdJNcC2l6lp2gn5FtaFO9iKI84F/OHfBPKDqdTqzLF8QQZeFN7hdSjfA
         ecXc3AzigWaNQU2ZeRYHbUSN6WaCqbecipwdIHASZ8yJtzd0SJZslOpKgGcutoPyDASJ
         LmCSkzgns35uS9btrQqPMy2XhLgdEPzEFVhmZprjKZ7nPqSQpp4Ft9pyG62kZ9meaNVT
         DxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764082107; x=1764686907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2J63HAWT/xBRSAZdQdUSYuISIPaqDrp8aGKI/vJREVU=;
        b=ZA2PzQzF29PYHImDQFiUdyBTp7JqSXBdA66oY9heBWWiuvNileVmvKEnnvwhqLtqSH
         uZ7V9CFw0cOLIgB5P6OU2L37ZhFQEpN9HP2wUwFhBr4Aij9GFLqgtC0eJefSfTMojVtO
         65XCL2XeGLnMiDE4ticCnytxAqVyrNn+YFY3BU25WmJtBzHgqlj7ViNh9U56gYreU8Lu
         McEcUin6aiPh3bYSYRMX/ij/qEARJb5Nm/GYnIxMNinrBZBqMxPCWgt/H2Ehn/CrLNUs
         xbV0Qp/7tOrqy0rSDbSwitPPLERyv8X8Rq4CV2zazVkeLDM+d3x/dNKILuZLFPk3xupb
         dupQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEVqha4AXXaBKuf9VQCH/9qfYVbsLagqdyX+B8rEqQOJkjFq0AEbTi2AaY16VYKUaSIKddsTVuGMe/GuSx@vger.kernel.org
X-Gm-Message-State: AOJu0YyK0cuYNIO2c6GsGPRddTHZKp8XJXAxcAmfKkrufdA2mMDdowvx
	ldp4zEnXUkWwpMcEoMVQDeZivI+7ee82afOzlZOaUStf4puKSPpEtyJX773bdH18kyAlGvp96zt
	t6bp32i6YaWW+5PM+I8tCy0ho00GzXBgsIdwk4bbKzC8KTuovH+bcV6+A6BRPqoL9IDg1
X-Gm-Gg: ASbGncsMuO5TqOz7WscFaOhFw952ziHYqroCYtEeBQqTyFlOgKuDECdyN2SiK2D9VmU
	iGQOyeoRUWC46TH/0283uPFGEVXGHAAfXqLNZ2m6zAkT/syTeImyZd9jJR9VLrmxFXc4oekqqGq
	aXyPUyIDD9/+DXdQE+Gj1JgZWeRkPrJuKZ4+Y6s8C0UIotN7AhT4V8rCn3DQ3k+YD1wjoljSxft
	gNgwK32eHm/4DkMEb8rQ6vfxAjKDjbLVXIaqLqmkVHugWlkFgnliJVyhIc8eJoBCc0a73yF4u/1
	FdWMyHtnCkQtix/zgZ7PABts/eiVu6FTmjTD3IeBINhySxLKiRXLW0Dnkrc/mYHCo4fFUu4s6aO
	U0M5jTz+HMeKXw+yfYyjyI8zPAMPzNqzp2RDtjEvfzqG/dqwZsYiCrziBsu9NzxBABLgc8ASqIE
	STvxeTsArX
X-Received: by 2002:ac8:7d94:0:b0:4ed:6e70:1ac4 with SMTP id d75a77b69052e-4ee58911639mr214711221cf.42.1764082107218;
        Tue, 25 Nov 2025 06:48:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLx8aIX8BiCbNvSxqGqHKSgfTB/Fws1bzqBUnUGjst6JC4+3XSzRzlcwUpZfMZo/EmN4sXbA==
X-Received: by 2002:ac8:7d94:0:b0:4ed:6e70:1ac4 with SMTP id d75a77b69052e-4ee58911639mr214710831cf.42.1764082106732;
        Tue, 25 Nov 2025 06:48:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db88f71sm5302737e87.34.2025.11.25.06.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:48:25 -0800 (PST)
Date: Tue, 25 Nov 2025 16:48:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 06/10] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <syfppoocftklfe2fqkx2c6wwanjuikxc6tozybc2jvfrxfbf2y@n7nmho57tuvk>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-7-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125064758.7207-7-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyMyBTYWx0ZWRfX/f/hmJjI6QcL
 Hu8M5bnLGKMzb3nu9m3+IJOYKBnF9Sj6+QOuF5iw+WJAeTb310+IaHRgNUg7wN13R3SttAoT8Me
 s9cxHXHMxDqDU+GcjfL5Fkz/X3j0DSuvmz3YQwSiz3yqyLsHA00l/UJVxFuan0LSymmI3WALjXA
 t1g9AIcv/OenJh2N7x7YWlOPdCKlt/3ta5tVEEvhiIBD/INhWP9xNOOPN2Sy50GegLcuHgFgng1
 zcF/vg6D7W/NyEmBEuSF1JexxwUEuFw/xdplBXngSF/+9WKzji93gJ86Fv9USakhBR3gORgBiUL
 kRNxQtSWMSnyYoeLGokoYGXwUvpgUBo1C9mZLBBDE0Ug3Et4yCspy6W+FtGn+zZNUi7/W/eNjgB
 DBfoBL8+Ddu/81yO4OdDPfB0NWDW+w==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=6925c1bb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nXOiHK4lao4tYTmu_wUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: t3DzD4yfKmBugwhdObESbEg12XpsEx43
X-Proofpoint-GUID: t3DzD4yfKmBugwhdObESbEg12XpsEx43
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250123

On Tue, Nov 25, 2025 at 02:47:54PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI PHY support for the Kaanapali platform, kaanapali introduce
> addition of DSI2/DSI2_phy compared to SM8650, However, based on the
> HPG diagram, only DSI0_phy and DSI1_phy works.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

