Return-Path: <linux-arm-msm+bounces-48300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A70A38EEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D96F3A6D82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556B819E999;
	Mon, 17 Feb 2025 22:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b0xCenwB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA1519D89E;
	Mon, 17 Feb 2025 22:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739830821; cv=none; b=OTZUI7FdUFh1foDN7YAYt9tw2lCXqnbAER4YF0rGx0G6bck7iF6oAZoqnSbtAb8Q/3PfWUiu6arCP+izOMyZF8ITxWg4w5vEUp3TWzohDKWGMrh5OZw4KpF63EcFx92N0h0n7SQNn9bquDjA/Uw4dq/6MfWJHCVQ2dXPE2KSwtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739830821; c=relaxed/simple;
	bh=j/tvJyrR3ovKzSfPB3LiZgR2D1Lr52JfmeGV4c6ICfk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+M4iZi6mjOT5R7WP3x8D/4qXN23zEqps11XdJhcbeE0/yx8X6hSmnAXb6XabXbBDLAxMnjBL9UsD0P/r6O28jpAoxpLuRFhv2+EwyauBMQ4yhHwcUXee9+iCyaNB/RDrCkutppzvpKs9u4UHwxeZIhhWPdHp96JwU1Zxa81a8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b0xCenwB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAgoQq025635;
	Mon, 17 Feb 2025 22:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVbOwd4rDC4+XI6orsMGTj2L4zMQLlpY8kWB5b5Dw/Q=; b=b0xCenwBs9GJuZwk
	8mXoe4a9nGWNjbNRQitvDm1FEmbm2mOGlFKy6/UHT6p3SkDit8fWdd7w580T5YmC
	oBUhCgOMbskTyKD2mXgeQDlXktQqXdQwJ6NZujoMDLAFgrrGoS5Jq/vgfYI5eal9
	HlziTJ2hdjQ2vsvoFEcwARbOjwDZbuGABHrYctp77W33iNpfXgrhyCKU68DvFUUM
	BDErvq2tTHFVzHNKqfpwPNsJtHxGjNlF5nnCWtbCfc3KUPxT4nEqVymqVkra/DWm
	/kEX33lbxnHGxUf7iV3Htyx7lM9Q5yxGw8sOXgdBx6PF9/uzo56Jx03jIVe6CHlk
	rttpjQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7vtxhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 22:20:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HMKBPt020550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 22:20:11 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 14:20:11 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Li Liu
	<quic_lliu6@quicinc.com>,
        Fange Zhang <quic_fangez@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v2] drm/msm/dpu: correct LM pairing for SM6150
Date: Mon, 17 Feb 2025 14:20:01 -0800
Message-ID: <173983047014.1708530.3277590461422590844.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217-dpu-fix-sm6150-v2-1-9acc8f5addf3@linaro.org>
References: <20241217-dpu-fix-sm6150-v2-1-9acc8f5addf3@linaro.org>
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
X-Proofpoint-GUID: BQGxw8OzYKV2Ynn4CkSywsaSLwTpZKBe
X-Proofpoint-ORIG-GUID: BQGxw8OzYKV2Ynn4CkSywsaSLwTpZKBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=745
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170173


On Tue, 17 Dec 2024 14:35:40 +0200, Dmitry Baryshkov wrote:
> The SM6150 platform doesn't have 3DMux (MERGE_3D) block, so it can not
> split the screen between two LMs. Drop lm_pair fields as they don't make
> sense for this platform.
> 
> 

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: correct LM pairing for SM6150
      https://gitlab.freedesktop.org/drm/msm/-/commit/24b50b7340ab

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

