Return-Path: <linux-arm-msm+bounces-23271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 255A490F69C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17FE71C249C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 19:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFA315886B;
	Wed, 19 Jun 2024 18:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J6843BB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C8A158DC5;
	Wed, 19 Jun 2024 18:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718823585; cv=none; b=Xczx6P8NLYRVnOIHner4ukXEKJOGcGjHoyDousRAqFfePrBkXwhD8KoUHBM9gbqFzdLY9JMe4Tg5gg6ktHhNbCN9fEsC/DYS7DhUCL2vBPdAuIcTYJlI9G4lSBPjhL5IZs2c/jVd9RLxIq6+BeW8FE0MIWBjnjhnzovNg4StGoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718823585; c=relaxed/simple;
	bh=i1s8Euqc3END4IzxVwtlpsSoRlGdxxyQMDScslGjmhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KVaYoxBTzCR2THgIKF2Nite8D/Ucx3pPdLU/IpsvhwWUkgZ89ynlHZowQUKjSZtniiosw143xm2//rsttrLV3/XQGiOA15zj/ebDcoz2xKne5Zix4CFQ0R02HiXzECuw0Ihei5vGL7aLiKGku+DxPdrbRLn5oiI9VKL2nkJMYi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J6843BB7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9iV1G006022;
	Wed, 19 Jun 2024 18:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ibLN8OyO+VXPj1Q0uh/U0kclQpIn6i4Yryc+elE/QKM=; b=J6843BB77LYXlwtC
	392Uq8DPfYb5qou7/kyXB0FDm+at2PgZvYIb38sk5nyO2Y6Snq2fuMzw3cjRAc1P
	ju1GxlAWwDcJWWriZIT3TXQra++x8SDlaTqYEtuE/Glp+RgD+s9WH6q5SZdIjvn6
	mkNYmRCXFdR+s3b6l/UNcDe266btVOynMFl3zUsCp//Fa+cpiYLbg2T7CVcREjX/
	7EXABdSP9ucBcdjw5KLolaaLF8xi844WBGKDHmt8c5OmR51dZfQOaSyZaHHi6BUP
	5M7rNlPuARSCH7RFkn1ffgoLngL1hFk3ZOnz/N7rTQUQAYs8K6Z7N/CaSYlij6S/
	9qF2sQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9u2k9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 18:59:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JIxUwc011051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 18:59:30 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 11:59:25 -0700
Message-ID: <e8bf90cc-b08a-bdd1-8890-caec19245d76@quicinc.com>
Date: Wed, 19 Jun 2024 11:59:24 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 7/8] drm/msm/dpu: support setting the TE source
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-7-67a0116b5366@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-7-67a0116b5366@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4xwkFv8wQzuoTQ7ViJPMow3PHnn3IZGZ
X-Proofpoint-ORIG-GUID: 4xwkFv8wQzuoTQ7ViJPMow3PHnn3IZGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=728 clxscore=1015 mlxscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190143



On 6/13/2024 10:05 AM, Dmitry Baryshkov wrote:
> Make the DPU driver use the TE source specified in the DT. If none is
> specified, the driver defaults to the first GPIO (mdp_vsync0).
> 

as marijn noted,

mdp_vsync0 ---> mdp_vsyncp

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

With that addressed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

