Return-Path: <linux-arm-msm+bounces-67847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A806B1BFE4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 07:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34A103AC64D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 05:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9505E1A3167;
	Wed,  6 Aug 2025 05:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E6S3LKRX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE99818FC92;
	Wed,  6 Aug 2025 05:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754458028; cv=none; b=KyyLLJugnYXGPFaCU8aZYYzO5Q7XkbPvl24Zr64Hsb4Y+A3YdkzI+0pOR+GisQBOCQxFZeTuOGntamEP+TqFU8NyUlAALxVb4P8bKGd0ctDSNcdtTnq+tn/hKdxIUlXDC/7h9Qgq32BnLalCiPuvpemnVCpnnh+NUtQRupJF7uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754458028; c=relaxed/simple;
	bh=8oGRrwvw8cPWXvzaJPfOYd2IpSAIAtLyqKQTvY9ISGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gjypmnOBbJ4KBnaOljNK1g3jkRwKKhiCYPl8hSYSwkqx+T0PQdnRT8WgfRTX04CSaJyvPwj73t3z7c4rfxDIErdg8/Xz3aQoJIp5XUU86S02PQ+OqIGVtGdtFg3KTUjZVR+bvz2HA9L+l2SvDqofsoKbU/tsbVXPHLjqJ60E1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E6S3LKRX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761f1Y6027758;
	Wed, 6 Aug 2025 05:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oGRrwvw8cPWXvzaJPfOYd2IpSAIAtLyqKQTvY9ISGg=; b=E6S3LKRXZJaR7P+L
	afGJKx1eQkNksw0lYYYJmM59wl+HNUMQAUMKA2KqW+tAohPGQdwUwUNXE1UxDNke
	a2ljvLECXiViyCDhj0e33S3GV8ulrsvS56AA4AdpbNZqkSBhd3JI0X6wUMHdc7sJ
	I4COVzgscKA/0+y7OR8pQcSYv3liuz45IM4J0g0Bg0wgdnLp+G4CRyO/BH4hKGnr
	6ocJ6GhxmSsL4u3k7ACPxGXNxpBuRvA40MdVfhn693Gm/y+FUV9DN/DcuOzbTSkJ
	xcwf0uSDU01PIpoULZ9jBDJhJ+3J9kWTB+KkVVFmcXMibgTIWloFqoMNEwGWmeQr
	BXxtiw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyb9he7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 05:26:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5765QomM010731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 05:26:50 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 5 Aug
 2025 22:26:44 -0700
Message-ID: <2c88cbd4-7ab8-4834-9300-c8b6c4c688a3@quicinc.com>
Date: Wed, 6 Aug 2025 13:26:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-2-dbc17a8b86af@quicinc.com>
 <b24ln55wgmjzksugbowgilxqbnp6d6mgq4cdqljrj4jftuefa5@gjcszc3t4bqg>
 <179982fe-ff3f-4d57-9ac9-15f0512facb3@quicinc.com>
 <b3tgv7zhiix5rzrw4xv5rtaoaikstdew5lo4htvepl4phl44dx@q3xztyk6fagy>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <b3tgv7zhiix5rzrw4xv5rtaoaikstdew5lo4htvepl4phl44dx@q3xztyk6fagy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXyyRrxzlCJ/Ha
 pPAjSk+4VwMZOOOvewE97PVBuGb86lgVl0VgqDAblPZ0u+XdJ8zan3xSWiV8xWT59eLx5RG8/Vp
 1MpUpD1vfcForghTpPniD795rsOpvnXvr/YHxqlKdz7kbOpo7FZRDF1nLK7+3aexOZAIjis6rQM
 0v28+VYPR3LnyLphLWsqpbuT5VciU/HU39yxhxwLhgj6CaBOatkYkMGITtrH/IoMoGAse02u/kl
 5VXcoOgzGFXZ5f/9tACQkv6lvKwnmIO7XxMn5Q2jy+YbY9YJr0zY02Ck8wp36vpSnU363Cfgtu+
 dAWrcBZ6pENQDKesG8Dhy9lVKZpIU0YDDvJI/TS8KVI3Q+mRmNlSpI46EgBJhrHC+wgZc+P6+yc
 HUgdx0vu
X-Proofpoint-GUID: 6ZrFc1r1XmiVWkdfnk4wBP00b2g42qqz
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6892e79b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=KDXxRo0yZI-lJWp5Yt8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 6ZrFc1r1XmiVWkdfnk4wBP00b2g42qqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 2025/8/6 13:09, Dmitry Baryshkov wrote:
> They are different patches, reviewed by different people. C&P might be
> helpful enough.
Got it, thanks, will update in next version.

