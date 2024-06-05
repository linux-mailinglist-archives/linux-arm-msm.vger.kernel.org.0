Return-Path: <linux-arm-msm+bounces-21804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2118FD711
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 22:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 618811F24A50
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 20:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846BE1586C2;
	Wed,  5 Jun 2024 20:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e5rse5p5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53123C6BA;
	Wed,  5 Jun 2024 20:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717618153; cv=none; b=qOGXJyhGnjMCGaSo9KCrSEdbTm/LOPmg1CRFvDKu1G5GTkjnbNxRpw/3JkY9j5YOnCSDM4padVbXlB3gYUQhvJ/wLc6tGArJoVHch99txcfYDUNWbXuAcyoJFLjhzNOgo0BuJukrOgzkmFvlTMyOHLmqkgHXFWmzcl0bn0P7KEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717618153; c=relaxed/simple;
	bh=psg7vsPUBq2OZY+E+9KiVePLDkVSSarfYSqphs/lkMg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uUdykz3b/cNKne6oEWdaeFWBoKXvaceMwCx4rrtNaMjjY8F+faOfmmANZ+MpYgORlyP3nSVlN9Adm/e8rTxopOxv8JgEzDYkpQt0uOZ7J1vSiqfgvDd2+ptjKmD1Mr2vd8c/TccYKXmbXcV1kcujsehNpCJMbg+WPFk++WqDy7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e5rse5p5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455B28U5032432;
	Wed, 5 Jun 2024 20:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Slwr5x8koORwrUoKMkWJqgI9ypAGN6EHO1EZUIHQLH8=; b=e5rse5p5d2x+A3nk
	VPTff935NWQJ/QS3JpmOux4NkwO1BnBpXmpdV8QiyEohRIDoi0X6UjpBA8uQCz0f
	0mW+b3GW7Qd/o1nTbpgvQjXs07n4CgRS1gZ7meOVqxvOUKMmp/ZR+Vd667WtFf7t
	zmR12Pkk/ixefHSuR17gXQnqIKQ/JYIvKo5sc6eQafbRqZhk5aRUwo0murr5xK07
	TDIkBOvSbep8K+i4X5AccAhNESwImORCdZU/PLXfJpE5IMD2tzF6W57mtiDirsLA
	IbQWLEcoUVOchQPSxbL23DB1ow4JO3PVLoDZB+FBo9kxI/oS5bsCdT5wtuLIro3E
	jKu9og==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjh3tt11b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 20:09:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455K90Ip011920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 20:09:00 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Jun 2024 13:08:59 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Ryan
 McCann" <quic_rmccann@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>, Junhao Xie
	<bigfoot@classfun.cn>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/dpu: drop duplicate drm formats from wb2_formats arrays
Date: Wed, 5 Jun 2024 13:08:43 -0700
Message-ID: <171761747141.369436.16281750566495584556.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240524150128.1878297-2-bigfoot@classfun.cn>
References: <20240524150128.1878297-2-bigfoot@classfun.cn>
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
X-Proofpoint-GUID: QLQsAV5NXQ3AvGoANCZLu60lEd1RjTs6
X-Proofpoint-ORIG-GUID: QLQsAV5NXQ3AvGoANCZLu60lEd1RjTs6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=297
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050152


On Fri, 24 May 2024 23:01:12 +0800, Junhao Xie wrote:
> There are duplicate items in wb2_formats_rgb and wb2_formats_rgb_yuv,
> which cause weston assertions failed.
> 
> weston: libweston/drm-formats.c:131: weston_drm_format_array_add_format:
> Assertion `!weston_drm_format_array_find_format(formats, format)' failed.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: drop duplicate drm formats from wb2_formats arrays
      https://gitlab.freedesktop.org/abhinavk/msm-next/-/commit/3788ddf084b7

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

