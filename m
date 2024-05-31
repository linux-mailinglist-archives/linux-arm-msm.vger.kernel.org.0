Return-Path: <linux-arm-msm+bounces-21319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 623EC8D66A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 18:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA5551F224C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C95C3D57E;
	Fri, 31 May 2024 16:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="llSl65jg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5D2768EC;
	Fri, 31 May 2024 16:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717172320; cv=none; b=LjiI7jAswEu9OTLFkEM7Vlc/JGPQu8iZ97cxmLcVXKbQzP43k9nFbQae2//GMRdqN/uKF7Toeo1gwqoALTNoQb2BDjROiX5+iphXncu46umLtCepjnPXzfPGvs6MaTDcPFbu4HL+EeGDRuPUVGYgRVQ432wa+da6tevQwFrO28I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717172320; c=relaxed/simple;
	bh=Hj0vEj7c6cwkA2oKS33jVheiYDaPMJ2IGapRx0pjAt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QkVQamxboS6pzdpZQgfItjupRKYdf+fucMJzZxXYKVKEpzjwyGRzRg5qsk+cZVvXbbhKrIDHpB+z3V5JHMG8f/jIdhHDicuaWUopFnFOPLxHRSxra0ggxsm168vqikc9ddha2Bj3LUulDtqaz2o9BqvKwFR8viM2IgNO39Zw4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=llSl65jg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VBU6U8003487;
	Fri, 31 May 2024 16:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIzFseeuuSm8HDVz4Niia26WaDuHcYXYVvYEjMLmYRo=; b=llSl65jgBGSzOihl
	TE+3umfmpofxGgqxapf1wsjiZLdCQYiTKbobCUT8RM32lXueZ9vxKrX0aXUA5W5P
	iwrexnFIFBkLoCsYBMo9r94haIMbqdX8X9XMW4WjPq+fIyo+oZwUcWsq7v89Vk2t
	zhZOhLt1AtqF3Ku6fRhqP5BQbfEQOQJO627rtH7fDbQT2iTcVQ2VSth6cC8NpOf0
	kRxVh4NQfg+Z1BtIpz890Zh8lO9OSoyud8QJ89//bFWoc6DpeyVe/jQypDexiN0J
	Cz7v5/U8xWYBEqSrOZPifBF1Zof7sp8YGECw222ouNrdERSUsqYlzRGCYoCXMRzi
	dOPgHA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yesw5kee4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:18:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VGI8Kw013354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:18:09 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 09:18:07 -0700
Message-ID: <7428a2f7-befc-6db8-76f4-3ca8dc12d31c@quicinc.com>
Date: Fri, 31 May 2024 10:18:07 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson
	<dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KDqy62VT-sUlJKS5paT22JNBEFfhfxT7
X-Proofpoint-GUID: KDqy62VT-sUlJKS5paT22JNBEFfhfxT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1011 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310122

On 5/30/2024 5:12 PM, Dmitry Baryshkov wrote:
> There are two ways to describe an eDP panel in device tree. The
> recommended way is to add a device on the AUX bus, ideally using the
> edp-panel compatible. The legacy way is to define a top-level platform
> device for the panel.
> 
> Document that adding support for eDP panels in a legacy way is strongly
> discouraged (if not forbidden at all).
> 
> While we are at it, also drop legacy compatible strings and bindings for
> five panels. These compatible strings were never used by a DT file
> present in Linux kernel and most likely were never used with the
> upstream Linux kernel.
> 
> The following compatibles were never used by the devices supported by
> the upstream kernel and are a subject to possible removal:
> 
> - lg,lp097qx1-spa1
> - samsung,lsn122dl01-c01
> - sharp,ld-d5116z01b

Ok to drop the sharp one I added.  It should be able to be handled by 
the (newish) edp-panel, but I think the TI bridge driver needs some work 
for the specific platform (no I2C connection) to verify.

-Jeff

