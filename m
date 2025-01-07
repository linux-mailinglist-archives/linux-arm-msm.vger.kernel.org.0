Return-Path: <linux-arm-msm+bounces-44069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C30A035A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 04:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 095603A26B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 03:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D854502B;
	Tue,  7 Jan 2025 03:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bzJ8RUaC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27018632B;
	Tue,  7 Jan 2025 03:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736218844; cv=none; b=G4mIVf2obH6JZQiFwZzYwGIoKJnSRYC7/htrWsbe6DMdabc90GHSPngchl3fAlFPsRfCKW9/H6MLx9ZSYXSyU/puxQrvoWYwPlko4wtYzzCzFTQVBhikzFL2X6oBkFxukdagc/viFGzoa1Eog+3sfjP+8exT/39Nr4VROCFVz+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736218844; c=relaxed/simple;
	bh=fDDARDcGg6GmyF44eS27Jw1XuMiNi0523+Z0H+Vdc1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YbEW/zRhLTXr2NqnLUoelIdtpQhW4MTfdqJS0nQf2tcezqSqfNghECDwAyI0nfH5gy0ceEdYEzAbHZCx76phjoU6hqC9S1tEDntny4llsWElbodNApBoY1K1Gme72fhWI5G0f/AAb+Z5J6Pozu2xaHYlDkmU6k2j/ftwdyjZuHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bzJ8RUaC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506JO1oi014898;
	Tue, 7 Jan 2025 03:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+KvZeoggwDcF1BsaVIBtnVCL/V8WFqcdXHj/YWjac7Y=; b=bzJ8RUaCeFWeBawV
	gUg2VX/KazQPqT9tXPS+pdBzXubSDHRgJZeOwwYNpBIxzcjEyuQju2olaqNO6MWH
	pp2cvw/TzCillgVVcP+CyI3EDsWgPqkidC31KreAKK3iGoXXg6gTW6z35c3qKZ2m
	KdDu3eHfxS2Lez72wFNS4TuBlx1TfZpI9HmKq+AaixGZR9Thx9oxNZYg+4XoRb9f
	zdBGMBH3FgBaQgX+Nlm++4byTNLi9ig6GpTxDTniepsrecestSpE3AQ49k3LSxEl
	mifNx28aqHIHT6Ufj58dTC5iIEKfH+hB9DQmfU9ZGYkeUR+vVDKUnCZgPPcRSrHs
	MGuLng==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440n9v8td7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 03:00:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50730UKw023218
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 03:00:30 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 19:00:30 -0800
Message-ID: <43d4c976-deea-4a8f-828e-ab706201f98f@quicinc.com>
Date: Mon, 6 Jan 2025 19:00:29 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/dsi: Minor whitespace and style cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean
 Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <20250106-drm-msm-cleanups-v1-3-271ff1c00795@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250106-drm-msm-cleanups-v1-3-271ff1c00795@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: waMd_4k_9qMDbbBR91y87-ZmW-xYsbnz
X-Proofpoint-GUID: waMd_4k_9qMDbbBR91y87-ZmW-xYsbnz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=915 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501070022



On 1/6/2025 12:49 AM, Krzysztof Kozlowski wrote:
> Cleanup few obvious kernel coding style violations: missing or
> unnecessary braces in 'if-else', unnecessary break lines, incorrect
> breaking of long function declarations, unnecessary 'else' after a
> 'return'.  No functional impact expected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 51 +++++++++++++++++++-------------------
>   1 file changed, 26 insertions(+), 25 deletions(-)
> 

Thanks, all formatting / style fixes are good

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

