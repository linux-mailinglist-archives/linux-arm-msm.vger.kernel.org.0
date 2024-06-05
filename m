Return-Path: <linux-arm-msm+bounces-21807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD2E8FD71C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 22:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E9381C21DEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 20:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782C1158D8C;
	Wed,  5 Jun 2024 20:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VOmNOIek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E95158A3F;
	Wed,  5 Jun 2024 20:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717618185; cv=none; b=Z6Z9h9HPB5Z8GmqkxTe3hL38GVvD4bbWpjnpjmdQ2ogR+Wm/qGbET7+yjviWkvTu83IN0O++2bF5HIURcdlMLWfOTgbGpDZUYqLUoYBNoqyZXu/uz23qk7VVj/0g5jTRvU5cgzLeX4Xu3EfhrGhzmfsWZO2oBVTjsLseNcYwv54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717618185; c=relaxed/simple;
	bh=1PTAqnG5L5GVFLy20mgHT8PgnpGSE4t4j7HuVelXoPI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KNNYL9D7gq6VNXCbSDnYvElZGDFaLdjmg7GVqkJzLOs52oePA8JmC9z+uQSegb1Q8vsK3pVDuYYVYZVRtovED7gSdi5QgzrXNfaeDV9GRQ6zL5bvS+JAnYiwojjQPDC3APBVETjnY2I1BynDM3F6MbxYSzp2v8DtWm6vSrOjCfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VOmNOIek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455B1aH6032112;
	Wed, 5 Jun 2024 20:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T7MqUnXiUijaMiXGYeE1lWQXCf6L1E6l9FxTfTw1E6o=; b=VOmNOIekPx4KaG6M
	JZR5bbTwZg5dxuNpnWjnZi+55mpGcNcoT6rDO6ZGqU3UOg08k7V3ahOTF5s/ibRB
	lm5jAILCFMQ8OZ5gNicyz4R8dvlqUmE6fswlvuiljJsp76gQtuJenOXx5sLkpOPT
	Ue2ug5MTJzaH207BktVpdylmjsYTQ6d1aS45wNIDDh/O/TJOQDggZKEbOmyode1e
	1GiSqpY/nxsQ0dzoNn3qgCM5zg00wjm4E0SfZ7wbHfWpq9jfq9MsOt/AN6MwuuoP
	gel/dLz8FNFRB/JAL3EpTHMkKo/QbSybFG/sJq+tq3h3Or+GL4dwPXeYgeME31XC
	Nlzciw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjk899vje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 20:09:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455K9Yd2012575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 20:09:34 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Jun 2024 13:09:34 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?=
	<trabarni@gmail.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/msm/dpu: fix encoder irq wait skip
Date: Wed, 5 Jun 2024 13:08:46 -0700
Message-ID: <171761747136.369436.8553570115358208188.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509-irq_wait-v2-1-b8b687b22cc4@gmail.com>
References: <20240509-irq_wait-v2-1-b8b687b22cc4@gmail.com>
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
X-Proofpoint-GUID: mVyoJYahHBALGPzv4LZtO_jF1wmcOwkZ
X-Proofpoint-ORIG-GUID: mVyoJYahHBALGPzv4LZtO_jF1wmcOwkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 mlxlogscore=707 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406050152


On Thu, 09 May 2024 21:40:41 +0200, Barnabás Czémán wrote:
> The irq_idx is unsigned so it cannot be lower than zero, better
> to change the condition to check if it is equal with zero.
> It could not cause any issue because a valid irq index starts from one.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: fix encoder irq wait skip
      https://gitlab.freedesktop.org/abhinavk/msm-next/-/commit/8dfe802d4a7c

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

