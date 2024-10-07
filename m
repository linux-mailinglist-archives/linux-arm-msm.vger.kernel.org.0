Return-Path: <linux-arm-msm+bounces-33434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90B9935C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D68ACB208F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 18:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393431DDC0B;
	Mon,  7 Oct 2024 18:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RHCjqpo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645EF1D95AA;
	Mon,  7 Oct 2024 18:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728324732; cv=none; b=JYwh2dEWtXlH6tmZL10WuEyeDuE72IuDCfZ8XbE/j/nK0HMF31VL//wEazMJbGJ5a9+qgJmLjdbS5OMMwcCIwO4nCsnCJCaNG6iySZcxlFreZogbig07VLTRuG2atqDI5cuF2XubGWShD26RHeZGSxzxvF7zpB3CHDYEjFZYPok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728324732; c=relaxed/simple;
	bh=q2blQXl7VZqqv0NRkutules44p3oJage2MRbySqdbiU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwHAQhQM1gdYBTZz6yujhnCSIP5TaU6ud6tD6BmHVS6wC1qPOg2aZAYCpDlveE8vSy6es1paTcWuC26zx0O1wy5JCdClsgyably3uXZSf8tX7tgAF4vVbjW/Rd4ey3f27spa0Cm3a/TIdUSRVOqOv+1mLMOkRcYgaAtIt/XVf/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RHCjqpo2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497EbMOZ017633;
	Mon, 7 Oct 2024 18:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hi5KO7EC34wbdYJSNHHVbuNU
	lz11GTXJosbTj9nX4vk=; b=RHCjqpo22mTtx2CwckIdKrNiG1KMMRV+WmrqNNR0
	S3IkHXIeIv28snathxZidsoAFSMdkRRHtKL4mLPMsDlctnBh6frbVy0Drzo/4+ft
	kC1OTWQv/ZNpXexgHlO8nGrMtsxsm1vu+I2yAhS5/DHza1F1K9VuqdWOiDqyQBlq
	r6iEqucCnbKmhN802ySuB5PxHV27505L8UxQMuBeVP3Oe1rkTrZRSfNtZUFFxLGI
	CYqripxXOEMaXGPPLbxFsJsCK4Rh8qefBW0Z7u0VjKTnbdsiuQQKxlIsL4ek9GA7
	P6PMmHhpSo4/b/6iOWupzBGCBLxTXLZCX6wcv2ALC+lT9A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xs4d125-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 18:12:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497IC4Yn017846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 18:12:04 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Oct 2024 11:12:01 -0700
Date: Mon, 7 Oct 2024 23:41:58 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Kuldeep Singh <quic_kuldsing@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qingqing
 Zhou" <quic_qqzhou@quicinc.com>
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for
 unsupported SHM bridge enabling
Message-ID: <ZwQkbqpVzMDm7iJV@hu-mojha-hyd.qualcomm.com>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-2-quic_kuldsing@quicinc.com>
 <2fi7pyhpetqyhipjiihuafddggwdrh7abuvfkks5hu5qid2rfm@ibuiecrhijey>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2fi7pyhpetqyhipjiihuafddggwdrh7abuvfkks5hu5qid2rfm@ibuiecrhijey>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xRXiLoY6X-Li91jJYuqXg3l1b3yDkFsk
X-Proofpoint-GUID: xRXiLoY6X-Li91jJYuqXg3l1b3yDkFsk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410070126

On Sun, Oct 06, 2024 at 08:35:57PM +0300, Dmitry Baryshkov wrote:
> On Sat, Oct 05, 2024 at 07:31:49PM GMT, Kuldeep Singh wrote:
> > From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> > 
> > Currently for enabling shm bridge, QTEE will return 0 and put error 4 into
> > result[0] to qcom_scm for unsupported platform, tzmem will consider this
> > as an unknown error not the unsupported case on the platform.
> > 
> > Error log:
> > [    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
> > [    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4
> > 
> > Change the function call qcom_scm_shm_bridge_enable() to remap this
> > result[0] into the unsupported error and then tzmem can consider this as
> > unsupported case instead of reporting an error.
> > 
> > Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> > Co-developed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> > Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 10986cb11ec0..620313359042 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -111,6 +111,10 @@ enum qcom_scm_qseecom_tz_cmd_info {
> >  	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
> >  };
> >  
> > +enum qcom_scm_shm_bridge_result {
> > +	SHMBRIDGE_RESULT_NOTSUPP	= 4,
> > +};
> > +
> >  #define QSEECOM_MAX_APP_NAME_SIZE		64
> >  
> >  /* Each bit configures cold/warm boot address for one of the 4 CPUs */
> > @@ -1361,6 +1365,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
> >  
> >  int qcom_scm_shm_bridge_enable(void)
> >  {
> > +	int ret;
> > +
> >  	struct qcom_scm_desc desc = {
> >  		.svc = QCOM_SCM_SVC_MP,
> >  		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
> > @@ -1373,7 +1379,11 @@ int qcom_scm_shm_bridge_enable(void)
> >  					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
> >  		return -EOPNOTSUPP;
> >  
> > -	return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
> > +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> > +	if (!ret && res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
> > +		return -EOPNOTSUPP;
> > +
> > +	return ret ?: res.result[0];
> 
> Could you please make it less cryptic?
> 
> if (ret)
> 	return ret;
> 
> if (res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
> 	return -EOPNOTSUPP;
> 
> return res.result[0];

Ack. for this.

-Mukesh
> 
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
> 

