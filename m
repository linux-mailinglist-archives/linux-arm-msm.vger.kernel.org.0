Return-Path: <linux-arm-msm+bounces-1401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C517A7F365F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 19:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B72FB2121D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 18:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788513B7AD;
	Tue, 21 Nov 2023 18:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jI5UO3/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E149E
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 10:45:18 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ALIEZGJ001102;
	Tue, 21 Nov 2023 18:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uBi3DtkV1kBFSIDxcBwcArhQghrRbJ9ECwzDoXE0Mmk=;
 b=jI5UO3/U/GTkrv9dACD7AIGluAx7ir0Eq07Lv7cWPqzrqjzA0C4OlSnB59OYVtRMqE09
 Yda+yfexmMORKsIZq4OZc5mvuC0fl+osCm4y3iE/EUJP2ao2t3RqBWLxFetQd71ZI40V
 RG8kXExDDzSRILwSwBBlamKJg6bxSUAtVPsSucPHmIh74Ikk5Xl6yk0HmgehvU/uSEzP
 03xQpZ82tle0hBKyjV4VUdxHT+x3PqX+DOlbf5aPx7aGczFcArIgIK92v8vSOnfhc9I7
 tV3ZuUiAb/ivTYwxCjdUVJJZoEYCfz+rRreiHSm8HsfG6WLq4iRhCDcBt7YdSFjau37u 2g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugxn8gk6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 18:45:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALIj8l5014548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 18:45:08 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 10:45:07 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd
	<swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter
	<daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2 0/2] drm/msm/dp: fix DP subconnector handling
Date: Tue, 21 Nov 2023 10:44:58 -0800
Message-ID: <170059219222.23520.11858172389818758850.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oVCE0wIdLQ71FCbsgpLT2f0IRoZ3wlhb
X-Proofpoint-GUID: oVCE0wIdLQ71FCbsgpLT2f0IRoZ3wlhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_10,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 mlxlogscore=461 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210146


On Wed, 25 Oct 2023 12:23:08 +0300, Dmitry Baryshkov wrote:
> Fix two failovers in the DP subconnector's patch. I didn't notice that I
> had another patch adding the property in my tree and later Abel pointed
> out that we shouldn't use subconnector type for eDP panels.
> 
> Fixes since v1:
>  - Add Abel's patch.
> 
> [...]

Applied, thanks!

[1/2] drm/msm/dp: don't touch DP subconnector property in eDP case
      https://gitlab.freedesktop.org/drm/msm/-/commit/ebfa85c504cb
[2/2] drm/msm/dp: attach the DP subconnector property
      https://gitlab.freedesktop.org/drm/msm/-/commit/21133266ca12

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

