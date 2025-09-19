Return-Path: <linux-arm-msm+bounces-74238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5AEB8AEA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 20:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6937518928F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 18:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66A0254AF5;
	Fri, 19 Sep 2025 18:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRnz2kIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBE334BA40
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758306576; cv=none; b=pv+tKk6AXt4aEWeSXEEqu2SPrcvIc3VZI+P9npWNftRXnIGKi+RABJSqYagSL/nZszOxUY+4+EFdVFTyzSWgMSIWO/jNaiNRSH9jhSm9Vq81SjvTc15nF9Ry/xyS1t07OBTqMWgQkGwoHni77mf5z/HXICLSDD61E23th8gVUlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758306576; c=relaxed/simple;
	bh=5HcGcJPfAGJVWwh47JGBEvlbeUbK69QuVa8rC4DOV5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHulKoUFqd6CieEdAx0PF4ArGYwIlnUtfr1fVi5tqUepGdhko373j/5WNLMj/+57pEeNXcpztkZ+AfM8bjzNr6TZF1c3Q1P7xXihI5/MR62jFVJQ27Gmax16BPIYP1PDWV4VvX9LfpvgSI2CyUfcnAcK9LE28y0+S1n3/G6CtUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RRnz2kIR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JHEVmv027215
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nELkMuG6G4b4hNEzE5++D+4i
	ykuQu225GTPV54pVjNk=; b=RRnz2kIRHqwrjQd99LcWnGKFoqNlJppKNVg6v/zN
	74LFRnDceaW9jKBreZkDEvDKElFeX749jroH92Eb0OinTtrVOK/OLHxnPyg52eqn
	z2yiikSeEf5Qq7G40h/HbIevhMsTjnvwsSXtlHkCl8eCOJ5myA94VAxTu8S02VAw
	tI5ZRPQOFDswW0M1tCn35ZNF0j49zKygeaWbk8y6GNlLGwAf0HzEX6z1J5ivyG81
	mi/zh+GtRBC8RgVZOexYC3lNhqsncw25aPQrOc4CZkbkTJ/DmTWG/hWKgV4UTe67
	+fgKPlWYvjtGzlVqaxWbVoDt/eFGzsZ0juSSyBzxc5da5Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jhfeb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:29:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-79390b83c48so44973256d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 11:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758306573; x=1758911373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nELkMuG6G4b4hNEzE5++D+4iykuQu225GTPV54pVjNk=;
        b=jXjheI5pTM7DKwtVhcmTtHv7uhv+Pir6DzbtOYbdddiER2EswEG+4qBvqgzujLaDbG
         4AqN1Ckr/eTOH9b02oUZ9IW7rwA23vq7wB9eYSxCAGrD4Gfh1KzvlXMhXS01/qDGEJTr
         S3w10DDncAHxTpH9d8JiVT0KENxjLyefYiglp3w6vxbC+88piOnaZS8sUIKkRnYHSdwS
         5qrqr5pr9eRujDlWUEZB2XUCvTJPCy3fZkoHJcO3Rn82sbX1+YEytn4KIiVcVy7DzOOj
         XQFkDtVZmgJHgjCmlCq3KouOuln90Vi3+gZUTmhGGCem5NEm17gekZMB8z5nyiTsezgs
         mvKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVXACegwQb0csz9Qpl+uDb4uiRQrIAtxkagHIxcyeDSCyHUQtL+WYDMrs+1KzMbxzzIQqipeXRECTO6PIS@vger.kernel.org
X-Gm-Message-State: AOJu0YxeV7YkfpJRKX09WKGJdPWywPe68qd+xmPvd8mbqLCb2sNDzAX3
	WOWGIqDOJRnBS00ymx5pHk4BF106KXP4xM5PQZzX0Zj7DOWK8ZB33+vXNd4je/Kz+xW6bLwiMlF
	dA2WRalRpRIvdpSp0Tgh7sgCW4f540YkLQrSuxWDNK2t9w4j9MaZKEt+heWEuaO8rm4w8
X-Gm-Gg: ASbGncuIEQz5En7EFqh2pgcCPiDLkHdxbJvlP41pqwrrS2pZoey7bSExh+cIRRtdXM5
	4zWF3p+DxDqWzE8MJRnurqtGM1Mwk70Rk2aBQVFPf0kMWge4cT3D4murt+hzpyeXxmflRi2T+71
	ga/w3XFoAje27j774PF3mgKsUeE8vV9CtisVwsNvLA4NNyjBAHbIsIvsXw+aE6gX7hU61lT7DnJ
	BYCFCk/LYcSzGel2/e8NPyma4zzwfHoEw4mQwxuM5Tkyzy+fFg4wgiUNuiHj2i1bigo1YuYnQXT
	6YvYG5RRdyTNCkcAFflFaGzfpSIhhWtLQ7l7yV9+PY8qxF3SNa67NpJrFRxTL38Iu496QRJg0Bj
	cHrtqGfaXnvoRfZch/NRK7MPVykrLSkQSEPuIhnWkjiLjXOvHi3p0
X-Received: by 2002:a05:6214:212d:b0:786:8f81:43e with SMTP id 6a1803df08f44-7991a92b751mr45979806d6.33.1758306573189;
        Fri, 19 Sep 2025 11:29:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1heRt8eGc/n23vl3sA3KqPDKFH72DXCf2ZbAaB5smb4GgH0KGIrCssMBhJrzkGAMEzwdWYw==
X-Received: by 2002:a05:6214:212d:b0:786:8f81:43e with SMTP id 6a1803df08f44-7991a92b751mr45979186d6.33.1758306572586;
        Fri, 19 Sep 2025 11:29:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-579ae3d9c88sm958682e87.140.2025.09.19.11.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 11:29:31 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:29:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 08/14] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
Message-ID: <j3e7f6fqeilaz4nek2hnh7obsvjwret42dkmwervcg3c74o7ai@pz244lhrwuou>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-8-eae6681f4002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-8-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NjDTTbnAEHqpi_gfViLS-4uJuCdfcdu1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfX9T8UkLlJDKEn
 Y4mOg8S2TunIHSKONCPZR2FpHx97YiJWl8/jglpBZXaWIL1DPY2a8jmmc/LhcN+XEiVrPztte2u
 DCl2mOfNY3umbbH9EMtxR3IFoPS4MNu8zyQZlsLWFZ/ftSU3SYar+3gybmV0NzH7nEbO2YQB9DL
 qZcYTDrTfVRgZzXFc4CtGpVzHbghDEKSrpjgTJ13kdPd18H4w03f+CzxsTHEoJhuFpUgbn247ca
 kkWV7T3+vV37qWnmm3JM48P+y2oiH1o8szbQa8ocI2MtfLKmIrfwAP43E3aPx3OMTz4WxAxkkbU
 pscRYkDTPMyWxsPGElttOO9QCYWI0hHxLg5AJYX89Pd9yGCy2IZvpNfigstDwU6DjBpEifcl4m2
 BjAZnfM2
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cda10e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fgmTnHYI-UD6AacMZvIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: NjDTTbnAEHqpi_gfViLS-4uJuCdfcdu1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110

On Fri, Sep 19, 2025 at 10:24:25PM +0800, Xiangxu Yin wrote:
> Extend TCSR parsing to read optional dp_phy_mode_reg and add
> qmp_usbc_set_phy_mode() to switch between USB and DP modes when
> supported.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

