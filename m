Return-Path: <linux-arm-msm+bounces-1402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151357F367B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 19:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E16BB21169
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 18:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A30E55C26;
	Tue, 21 Nov 2023 18:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dsmpedhh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A7C9E;
	Tue, 21 Nov 2023 10:49:55 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALGLmuD020418;
	Tue, 21 Nov 2023 18:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lCgylGPv2jsccAcpuVS4wvUD9Pfnb4fjRsSLJaKLxFE=;
 b=DsmpedhhMbFvtrefEyqaOIbD1Tv8h2Rvho5jrGE9fw1SuCA8LmebDI/DjBDgBQV/Yzxg
 px/yvCRxls30XPgfkJ97yC2HaCX9qQePNDah1Yob1WupKk9k0JHehyOFdwn3Ee/M9Zwo
 YYKdJkf11hFaMDal9OJPPgTh/3XALnVTU6mG5dGN5n4NFoniWt6iJODLDwAitq0VrKa/
 xoXBUmm/WGdKd7UvrzDOH9JrXupkqwgXJ8h7LQqn1TO7n2DRbstX+OoDRwl8R2sOuftT
 VqyWRkv83nRpDbGTSr/DEssJ9Ss/thji0j+7J+Wkfw4QQEzuBiTdURrTRnwRHCo3CMLu VQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugyb48fd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 18:49:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALInf6X000863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 18:49:41 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 10:49:40 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Su Hui <suhui@nfschina.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] drm/msm: remove unnecessary NULL check
Date: Tue, 21 Nov 2023 10:49:29 -0800
Message-ID: <170059249755.25841.10526095705316851191.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <ZSj+6/J6YsoSpLak@kadam>
References: <ZSj+6/J6YsoSpLak@kadam>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xIi2dVQc35rpRu0TlypnHPZiz5Iapafy
X-Proofpoint-ORIG-GUID: xIi2dVQc35rpRu0TlypnHPZiz5Iapafy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_10,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxlogscore=674
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210147


On Fri, 13 Oct 2023 11:25:15 +0300, Dan Carpenter wrote:
> This NULL check was required when it was added, but we shuffled the code
> around and now it's not.  The inconsistent NULL checking triggers a
> Smatch warning:
> 
>     drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
>     variable dereferenced before check 'mdp5_kms' (see line 782)
> 
> [...]

Applied, thanks!

[1/1] drm/msm: remove unnecessary NULL check
      https://gitlab.freedesktop.org/drm/msm/-/commit/56466f653cb5

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

