Return-Path: <linux-arm-msm+bounces-16590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C49AD89A4D3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 21:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79FC71F21729
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 19:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59556172BC9;
	Fri,  5 Apr 2024 19:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fIuTeQrk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1941172BC7
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 19:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712345071; cv=none; b=ZQt1gynJycUzspyciaHVweT/X4WvI+RIhSfDeUoSAS9lKVDHvFQF7CP3JqHmqlvI7q0VaOoDtBA9awErKq0pc7wOaIoeLc7f6WBDwcd7RBS3s3/Yo7qj1G0+dNi/M9OO3rEu47j6u7CO2a16cuTo8pqjzmml7DCh1+K1y0eKDYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712345071; c=relaxed/simple;
	bh=nC3HlYiDSwDN3NH+bWBoGkT2bYXXlmxg21ZJfgtjWIc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aX9JJBdqelmcMMzFdBgjyRGIIyCYGTEXy0HvRRahjLF7FOZLu+I2KHOxSzPg3uFO6BGJwhBKSJqudxwsX+HE9rN8dswa6D+n936LUJ6YXcOysCjBvq3d8HuV3A6BTlxUPzj+O5GFUr/rhIPu6FskWbTEJNrYxRfY6W7fE/RUP3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fIuTeQrk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 435JNrxh020652;
	Fri, 5 Apr 2024 19:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=aLa2ePu0p1MA0/TnlorrREf4EUuIinovhi4gsJ7N24Y=; b=fI
	uTeQrk1rb22rfGMHJmurESkq2/TJZxRhh2JXlcr8e3Jx6EnhDTW+Rz5SNux1zrqC
	4IRrQZDypIICaMm4ntBw88ZyW/gayoxJa6HaXZLyNkksVdImDaLeVg8AcCw81SkH
	KYffGidGWei9HRO7lxcIG+RzZtdtZh+MDNqy+oalescr7ivrkxOb7Wr6qfaMCXW+
	Jf7qUGkIY4W0AkQMhmhU1zRGihP7t8Gr7fTssjq5qPirvhUu1tXx6ZhtNX+1MrQZ
	8N7swaDgNfaawyApovA7ON8DL/cmWVlE/qL+Y38HVjkcoUYt0Fi8zUdQmDaXSkyi
	Z1R69PlzQWIRkpovVOww==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xa8fc2371-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 19:24:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435JOKIt000412
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 19:24:20 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 5 Apr 2024 12:24:20 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: (subset) [PATCH v3 0/5] drm/msm/dpu: rework debugfs interface of dpu_core_perf
Date: Fri, 5 Apr 2024 12:24:10 -0700
Message-ID: <171234488306.16869.7672593703422608580.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
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
X-Proofpoint-GUID: jG3B76jJnGUvKt8b5Fm7lO9YwSZuqtYl
X-Proofpoint-ORIG-GUID: jG3B76jJnGUvKt8b5Fm7lO9YwSZuqtYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_21,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404050137


On Thu, 14 Mar 2024 03:10:40 +0200, Dmitry Baryshkov wrote:
> Bring back a set of patches extracted from [1] per Abhinav's suggestion.
> 
> Rework debugging overrides for the bandwidth and clock settings. Instead
> of specifying the 'mode' and some values, allow one to set the affected
> value directly.
> 
> [1] https://patchwork.freedesktop.org/series/119552/#rev2
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: don't allow overriding data from catalog
      https://gitlab.freedesktop.org/drm/msm/-/commit/4f3b77ae5ff5

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

