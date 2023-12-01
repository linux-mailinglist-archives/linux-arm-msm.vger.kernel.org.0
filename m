Return-Path: <linux-arm-msm+bounces-2921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB5980101B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E25FAB20CED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080214CDEF;
	Fri,  1 Dec 2023 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WWzOL5lf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5E6AD;
	Fri,  1 Dec 2023 08:29:07 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1BLifl029255;
	Fri, 1 Dec 2023 16:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=G5hw65bwWWTIpsT+/2eFCiG3XyYCVlrTUm4AMs1wZ7A=;
 b=WWzOL5lfofL8I3wPyemWXmmaSGA/ZZbIUR/Wuxq9Q+AbDCmFieK9QmuVCeOHl8hR5sX6
 YRguArpxmCYu9HF9dSsjoNhLgn5q221NJWQ6X0lRmmNOss+Pq3v9kuq2YIQ9Uti2eVKd
 nrulIwLUjTYwEtRj47qld06pWX1T5IiaMHcp5HMwyIxFJQ7N7JjC/SerWLhPmpAvUScb
 PAN0Y6wX/sMkSGwtDG9WGkCJrnrBaUmaKN0GPd9nVu6I3LpPItsT5QkxCjvBzHlguySz
 Q81EPCE91YWgb8JLb72glzW94esiPDKqPzV6nRsb5grw7GIGs0y4MEcpoIpxhLHcuXqQ +w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq3r2j9jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 16:28:57 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1GSuKA015439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 16:28:56 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Dec 2023 08:28:56 -0800
Date: Fri, 1 Dec 2023 08:28:55 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Johan Hovold <johan@kernel.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Rob Clark
	<robdclark@chromium.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8180x catalog
Message-ID: <20231201162855.GH1766637@hu-bjorande-lv.qualcomm.com>
References: <20231130-sc8180x-dpu-safe-lut-v1-1-a8a6bbac36b8@quicinc.com>
 <ZWmUFdWif3QGrqQc@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZWmUFdWif3QGrqQc@hovoldconsulting.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8GGEN6E7BHYpaJCRSd15h9IvrK6-n_Rm
X-Proofpoint-ORIG-GUID: 8GGEN6E7BHYpaJCRSd15h9IvrK6-n_Rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_14,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=903 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010112

On Fri, Dec 01, 2023 at 09:06:45AM +0100, Johan Hovold wrote:
> On Thu, Nov 30, 2023 at 04:35:01PM -0800, Bjorn Andersson wrote:
> > Similar to SC8280XP, the misconfigured SAFE logic causes rather
> > significant delays in __arm_smmu_tlb_sync(), resulting in poor
> > performance for things such as USB.
> > 
> > Introduce appropriate SAFE values for SC8180X to correct this.
> > 
> > Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")
> 
> Missing CC stable tag?
> 

I figured it doesn't matter in practice, there's still a few issues left
preventing people from just running a stable kernel on this platform.

But it would be the right thing to do...

Cc: stable@vger.kernel.org

Regards,
Bjorn

> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> Johan
> 

