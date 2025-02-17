Return-Path: <linux-arm-msm+bounces-48301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF27A38EF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FD61166B75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00FA19F101;
	Mon, 17 Feb 2025 22:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Obc5FEi7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689A219D89E;
	Mon, 17 Feb 2025 22:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739831079; cv=none; b=bbnoWAyj/QmU1Cf3U+etYHQmzCpfcrl7JH2X9Ywy85erOfsoySE0mLtM0Zxxgtgh3z2JbtfaquQoNuse7zk20X4rfCcrFvPga+NkYyVOo8RykzCAnJ7fP0O2v3X0fZUxtQJDfSrhfgv57mAOILodjxj5hrBqJnMdCEtVGhCcFOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739831079; c=relaxed/simple;
	bh=it19JQl8CccaDTSYioy0FykxP64haZrU4CQSTFyjJdQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cT65LW7zuakvzfzx7Ra1LrDY8k37sQdu9DL+gtLh82SkMn9M+/xakR4/kweF7IzFDEUpZy24Oa5g5iCP58YhoWKPPu/KllBEHSQXj8T76QteT9Ro7Mo4mG2AvovTRc3DUO47dKWCmbQmpIPbdmCuXqieduF7fPEqqK9/J3Ov1EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Obc5FEi7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HLseiP025439;
	Mon, 17 Feb 2025 22:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BezjTr2w8NGEPfmMwVnT/CHKG4YCNq6hQj2ah+q+7yw=; b=Obc5FEi7X7yHcJQl
	19NheZmWEJ8jf78vgk3GtbZhY7HF1w6bA60/2D027j+4EVs0zYI650vG98r8eXwu
	6Ox77PAeFbQle9AypoyuaHorjjKEaggyBv17IRr2XlMVnx60QAPQGn7rwIw+a7zk
	uHCbc4EGxD6Md7NeDvul05mHnG+KSS5jgzByPYshn41xhxhkgZwlixyVh28srk7Q
	0L81kFXXoZ/7RmNFJ4enab/rmzdHWytQT8p7CWnqDBR0bBSIjX+7/jDmbjILAFcC
	EaTniiVypNZ4JGjimjU1Qzh7Ft6voMhuN7WiR3MS2x5TIVxXzKO+ZqXrXWE4+v5a
	ncya4Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7ttyfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 22:24:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HMOUtc021120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 22:24:30 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 14:24:29 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "Stephen
 Boyd" <swboyd@chromium.org>,
        Paloma Arellano <quic_parellan@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v2] drm/msm/dp: account for widebus and yuv420 during mode validation
Date: Mon, 17 Feb 2025 14:24:16 -0800
Message-ID: <173983092057.1709443.13749455776821744245.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>
References: <20250206-dp-widebus-fix-v2-1-cb89a0313286@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 785yqQHfquSojqhKccmV_CMygEBDXw0n
X-Proofpoint-ORIG-GUID: 785yqQHfquSojqhKccmV_CMygEBDXw0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 mlxlogscore=692 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170174


On Thu, 06 Feb 2025 11:46:36 -0800, Abhinav Kumar wrote:
> Widebus allows the DP controller to operate in 2 pixel per clock mode.
> The mode validation logic validates the mode->clock against the max
> DP pixel clock. However the max DP pixel clock limit assumes widebus
> is already enabled. Adjust the mode validation logic to only compare
> the adjusted pixel clock which accounts for widebus against the max DP
> pixel clock. Also fix the mode validation logic for YUV420 modes as in
> that case as well, only half the pixel clock is needed.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dp: account for widebus and yuv420 during mode validation
      https://gitlab.freedesktop.org/drm/msm/-/commit/df9cf852ca30

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

