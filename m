Return-Path: <linux-arm-msm+bounces-73298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44987B54995
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11CDB3BCFF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A57C24338F;
	Fri, 12 Sep 2025 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="baq9JZNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0637522AE45
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672435; cv=none; b=hJOJAOATlx48yJvCdwc9hri/uGQs+5VlPa/sW4WFBoCHd87nYLJpRn7lI7L/LxIeGq3M5xH2HLQoAb79deNccfGx/N485dx1HJjrBZyyBBTPJALsrKRaRVe1SBJyAHqOs3je8ocG6CMSp0v/l807LVmqN3mGYs6QTFlZEG6Qzks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672435; c=relaxed/simple;
	bh=lGn8lwvYmkoBLqlcSTBOdo/mB29tRg/g9F6ugJIwNjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0unLK1JUGMYCqJncJNd0wkd+MOummMFQPPEbQmWlT4qy6VqcVF/IuTTJTzNp4zhUMsDoJZ6aj1XMLEirDtwy5HKokfSk4N1cVnY7JT06GZ7bwna96omklSGSQCUaktQt4sb01oFIgEdLUvEJO8W5mSCku3NLPqc+htDwdDnzP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=baq9JZNn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fEBJ018560
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2+yk/HK2uTnuVPRZXu78qeeV
	MxzPMF0ZBseadsxMnhI=; b=baq9JZNnbBmtFqW2UCkb8P6sbj8TO0pqY2b/7FaO
	ywtAcEEjCW0fP1NFmwJ2ZmyuM3qyL1s7Q5y1aW6oXXCven99Q9ZZBRVAqyRVkP8T
	tibnnQQDd95xH4Xsk0216wOSu2WzFbmu/25Eo9VM8WPN6bDJpYr8n6jNCi3hpOZu
	NT5IQ6UZn4hvzXoVJCDKzS0+etyoDyg2umSy5EBclcVvaq0iHHvB2EZwangsKRUf
	PHoQbZlk4F18xguE7gjsWM/w6x7HzwRRnQA01k6p1Ywzp2c1vbE3K5meUlQNsmDA
	PTjj9Zy9TGop9cvAn5o9VWYukgf7X7bcJU9cMIsb7vv4pg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ak568-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:20:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b62de0167aso46112271cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 03:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672432; x=1758277232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+yk/HK2uTnuVPRZXu78qeeVMxzPMF0ZBseadsxMnhI=;
        b=nc0ES0t2GBl+NoVrXzGpC628x8lPqEGSvbgfx7YyRm2a1TvjOrw0zCmy3FPUOCGoc6
         ys5c9I8VgqiRdNuBB08dwLvxw2FRhs8RpntRQcdE6WOnjiD1Xjn2cD6RYc8t2YUnUPkj
         C/VEMgN5LGKeIup0PVocjo4XTbnsPRZicq5dWTDpiobo6XWdNCoEWAUSYWgSzbzh8dO5
         E4GAAd/bRm9XdNgVgEcn1Pc2PaV3gyGGEjXtQ6FOsspubYiojJtkUOt8/ajSP8ilOAmp
         80zCEarQ45jyqkvTniNFr6U4sN0ODKLdXE92Xrr4q489APbYJVcLtI/fagMVaCxphZXj
         tdTA==
X-Forwarded-Encrypted: i=1; AJvYcCVd4VTD8QBJ6neIliXx3WtDK3uijUPFe7OcWD0sXEJQNXA8w3MT56sdF4sPykF/JQ0LZ5nsB2VmErnMB9F8@vger.kernel.org
X-Gm-Message-State: AOJu0YyXQtl01XVfqBTNN9TEg57pxxuVpwDXmdg6Zhmc8NugBlSNNDqE
	yRBgLudXsGUp7MF1QdWImJYKfIdZJPucjjNs4b440MW7XYgm7DTRluBd79q58LpE5+AMa/hJ0tg
	pgAJFwxRxO80dJoSh3YP67mCCT2eYJtV4dnjTb3psITCdlBEEZab+fiU0rWrHowqnhBGt
X-Gm-Gg: ASbGncvOeGH6vWUIK3dqV5Njbqvo6XX73+khvjmlIzrh6/EWY0olb8O5wfXJ8w00TyE
	xuxz51fjYeJQT61FJ2gR/0fBwMAIdW3Ra+CPKgtYfGED3gXW53TGKk54TtRqgAYLuqT9My/iNL8
	qdGInjj+3JWFnJ7iTrOhlo6KGVNc8/NxKnyLbz9Pzjzp40OfJ7u8HVwG9TT+T3MCuXomc+LJSp2
	1i0uFC2xY1gGE95fjcx/WnVrz9Kou+PAlU4qesaD5+Jd6PUDsqSTQUBbvL/lBXkjUZftHU0v/Mf
	jxxc9jRbB3hXPwmd7rOBJVpf6VOEPzt3QWtk4bhHL0SYwcNLCmW1kcfrQRmv/CPSPlQWO5eR0yQ
	bfPE2yKy/afZCm07ByRVbScBwCgOVvhprJTF7Qx6Ya/+UTuKmLmtl
X-Received: by 2002:a05:622a:d1:b0:4b4:9169:455e with SMTP id d75a77b69052e-4b77d05e8cbmr30994841cf.34.1757672431545;
        Fri, 12 Sep 2025 03:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+kKC6NUmFZEfIjk6emSV08toNNjqRGF3CD3khX2vxvSwWG/Bv/20qxW9fKMHmTyb8jBpykg==
X-Received: by 2002:a05:622a:d1:b0:4b4:9169:455e with SMTP id d75a77b69052e-4b77d05e8cbmr30994371cf.34.1757672430879;
        Fri, 12 Sep 2025 03:20:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b5fadsm1073715e87.6.2025.09.12.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:20:30 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:20:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
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
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 09/13] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
Message-ID: <x6p3hgatsauguzxryubkh54mue5adldkem2dh74ugf6jf3ige3@cb3mmigu6sjy>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-9-2702bdda14ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-9-2702bdda14ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c3f3f1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lnF_te-ij5czt4pA2k8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: FPupcBex46jxXlKstS_cHgZG79zbNoea
X-Proofpoint-ORIG-GUID: FPupcBex46jxXlKstS_cHgZG79zbNoea
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX7OSXQz4eQ8dO
 rHWaUST+iCcqVwKB1WqqBRh/haLGqds18o89gmC2ffVieMh7aeB+rvVLrIQsumtmok2062DWJLm
 BIv+EI5HJn52TlysLk/Hro8omAC6rZejyIMpXDf5bBfbIGIYEoiU4GJYa00wq9p55Vc5LtmDEVv
 qccvzWSI7MfoEaTV1Geh/d4YdVxY5e3cA0UezAXxFvGYI6HCPZ+mdke2AAYIKeSL3Nrs2vFKoRY
 A8L0ASfY6Oz2FdcadcpN68bCigHmOUopZdjDSebwpzL+bDPW8WFWUL8j6AKCOxQyRe0iSOBPmhg
 IIdZK4gvm8AB+w2C0850F2A6cSzwsQ6ikRnbyjerXAB7VPV8Wq9NR74uVgStaiy6iD5hqY5ijSK
 cogkR0fY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On Thu, Sep 11, 2025 at 10:55:06PM +0800, Xiangxu Yin wrote:
> Parse TCSR registers to support DP mode signaling via dp_phy_mode_reg.
> Move USB PHY-only register configuration from com_init to
> qmp_usbc_usb_power_on.

Two sets of changes. Two commits.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 47 ++++++++++++++++++++------------
>  1 file changed, 29 insertions(+), 18 deletions(-)
> 

-- 
With best wishes
Dmitry

