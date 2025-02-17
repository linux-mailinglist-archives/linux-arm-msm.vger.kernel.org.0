Return-Path: <linux-arm-msm+bounces-48306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3A7A38F10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BED8F3ABBE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7EC1A83F4;
	Mon, 17 Feb 2025 22:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UfxWNC+/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6D319F115;
	Mon, 17 Feb 2025 22:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739831337; cv=none; b=A4cAq/yHsQh4vGSh7BETI/njCpZo3vRJEtrOTnkBi9JOHQkZ8/jLBwdbtszySywzJWBaOlmNvqP6TR/iBNe7PgIJz1tSpa5AumbdoYjAUNsPOOyKSPCl/H1qpDKXnoJnzNTGULHYgWM9fzSPC16/jPEazEqqG7S6N9kDzOSKiR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739831337; c=relaxed/simple;
	bh=0pkubBL3Lac9RferHD31Q0nRQv1dXYW9gdNdNRTI5+o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N6yEcg4VWEGCY9X4hSHBXbjRoOf3b4wWP5gL+iSAYHd7UhjyGtZfo27hsy5Ejt9dcO+Gt0Ktr0ZQffdGLqfY3YLaa50Kx4fuIMYQbqRe9fXyLL5usOUQ1Ez4EihbLSRGo54kANvj5CMvZ//0ayqtnQ56r5V6x6Xid3/RUQcoFOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UfxWNC+/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAfIev026272;
	Mon, 17 Feb 2025 22:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85rHUocnU9lklzB9BR0gJkyl7D6exIAQ63c0M02GufQ=; b=UfxWNC+/E3dM/UZ6
	Jv8Gv5WIEhs6rTWFo+sC61wnYOubkZlFsLck4JvG2z57atGeO8cHDCVySkmVmGef
	lKw520Qf2Dp7dHkDG6hCk3MpzbZ1v/49uDeSAxV/PIWbwlBfalSmlwrgcLygPDxV
	j9t+Bfojj38GMeFeqlb4P9CDR6uusgjyr+uKeYz481g2/6De49LU604OgGlgZX/n
	ORoQ8GwA3Xe2MPck6S74YpmONsXgHF7oyP7AdNRN95u5OUSv0YDuBEBs6Gc/lKDa
	MGUvik1YH/KuxvUVhc6zZdmS66EcTkq62P0Mj01Ent8ipEeH34KWyI3qxpNIg32G
	51S52Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7ttyaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 22:28:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HMSTWO009718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 22:28:29 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 14:28:28 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie
	<airlied@gmail.com>,
        Ethan Carter Edwards <ethan@ethancedwards.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Simona Vetter <simona@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>
Subject: Re: (subset) [PATCH v2] drm/msm/dpu: Fix uninitialized variable
Date: Mon, 17 Feb 2025 14:28:19 -0800
Message-ID: <173983118340.1710817.130011978241538683.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
References: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
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
X-Proofpoint-ORIG-GUID: oF4oUbUp5fgCIti7eZfx5lni0vTmDY6B
X-Proofpoint-GUID: oF4oUbUp5fgCIti7eZfx5lni0vTmDY6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0
 spamscore=0 mlxlogscore=666 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170174


On Sun, 09 Feb 2025 22:51:54 -0500, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> Fix this by initializing *ret* to 0.
> 
> 


Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Fix uninitialized variable
      https://gitlab.freedesktop.org/drm/msm/-/commit/978ca99d6bd8

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

