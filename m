Return-Path: <linux-arm-msm+bounces-21806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5B08FD71B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 22:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B5532835FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 20:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFABB1586C2;
	Wed,  5 Jun 2024 20:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o23qrZEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C360158A1F
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 20:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717618184; cv=none; b=D4zM4Is9+WXoqExdaukwkIyVDGiZLvymJaPjCUcWTnkvNKkfSuqshRz+2gt4l/VEC4bS9m5Hb3UNSxeiAocmaFaTjE2D30y7LBwGDvQlSQfbVfZerqo2ZcQUyfE42sopdjA/+TF2R+d+6tdFaFUrdXMAbcBx/lebQjKk4v3qvgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717618184; c=relaxed/simple;
	bh=f5Dwx3Ai+W+R5jRCvX1EopQbwKEixYaE8fUwgAfaxHc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZGAbmD7qBlgbWYrlHa7wQ8LQMwRZKg3+z2XaW8KxPoHheARm7paV52w+teZKpaynaUZzda5C2AfodwnquuFt3+n5Mfyn9Gq8frU1tYJMIIHR4AXR8ttEMYAbrWmSklVRMMVaSBxpdJwZD4/1FF9Xtr9qptazFoCbImbTUNkiK1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o23qrZEV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455BLOwV026788;
	Wed, 5 Jun 2024 20:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X8ulnPdI6P9hqCynqljglzwQ5rZ0YLEmf9Xou6RwdIw=; b=o23qrZEV0coVZi4p
	23sfjwsO0XCHe3ikxyRXm2id32Zn9hnlns96BW0KPMAzItoStJsjGqBoMQZs1jt4
	7uDrqp94/ikVc0ecIcGuLgabkqB4+wyiQOzLrjjAXWR2HddsSFPxBjqcb3Px7h4T
	bPnGh242ozqGALb3dmfddFvJecwIl8cxyHzNDbZuCBryMeZ/uvshcrmuQ/85UxqF
	BXdKplK9EK5+sm+cy5OWF77C3VAabqKGoCRVqKCkY4AgnJ5IogZy2UPt9GO8g+OO
	k2p+iN0ZX00K82W6enIEdY/87iEerKqJDp+4kNFSowF9ub5Gr606MneJEYSdpFob
	7OyrfA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjq2th7uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 20:09:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455K9Xgv012280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 20:09:33 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Jun 2024 13:09:33 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Stephen
 Boyd" <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] drm/msm/dp: fix runtime_pm handling in dp_wait_hpd_asserted
Date: Wed, 5 Jun 2024 13:08:45 -0700
Message-ID: <171761747144.369436.4069978788653033405.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226223446.4194079-1-dmitry.baryshkov@linaro.org>
References: <20240226223446.4194079-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ---RimkuYvLBK14onvufXzcia0fRilSR
X-Proofpoint-ORIG-GUID: ---RimkuYvLBK14onvufXzcia0fRilSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxlogscore=881 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050152


On Tue, 27 Feb 2024 00:34:45 +0200, Dmitry Baryshkov wrote:
> The function dp_wait_hpd_asserted() uses pm_runtime_get_sync() and
> doesn't care about the return value. Potentially this can lead to
> unclocked access if for some reason resuming of the DP controller fails.
> 
> Change the function to use pm_runtime_resume_and_get() and return an
> error if resume fails.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: fix runtime_pm handling in dp_wait_hpd_asserted
      https://gitlab.freedesktop.org/abhinavk/msm-next/-/commit/3e40e281afa0

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

