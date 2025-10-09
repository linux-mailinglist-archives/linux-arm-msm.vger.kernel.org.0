Return-Path: <linux-arm-msm+bounces-76636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9946BC8E65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 13:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 654C73AAAAA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 11:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBED32E040E;
	Thu,  9 Oct 2025 11:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iH5NI9sB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2D72C21F3;
	Thu,  9 Oct 2025 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760010745; cv=none; b=FOOQPKpsDx1hMUJFUYL29f+QuQIm1VC1AXCwJbmeW2JUP9Bmf+t07RiKM4KCbg5ZN5YZu0uQwGK9ZLJZPvBVxjEmdCforfLH2suBlXGRz0P086BypZjUnfVMhspf1yw4q32nFHN6zSgWrcAT2v038ccGgVn7yP0sADVEH/VapGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760010745; c=relaxed/simple;
	bh=+Y7tkK/AwXD1JAaZ5mISpCJrU9h0KyjcOCp8vB37t3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d794OkoCXY7u9bNSEuv8CX92t4bQFUk95m17rBNG5Fr7t2DdoW8M9MPKEQfM1cyuIwFFKgGPWr8VZsXSQ6EdAASu356VQH7pU7u3AeMh9ngMXvODk/g4R1Ov8ONEhTBJSY5Gx1il9T2cn9khOaDF6NrDU+lk98hbnLVMk97uNdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iH5NI9sB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EIew022299;
	Thu, 9 Oct 2025 11:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NKvuQhGcUEq6F1dym/+rBYs2bVe5arKDIgYghOvq8XE=; b=iH5NI9sBcPbQOAJw
	/ncTo4Yg4PBtygak9hgrl5Qr3DPh1d2UVsPNUAIZ/1vvBKJBHuNhB+AV0mJ4+jnd
	wAfUlSzqcCcPjiAiKC4oE8Pa9unbedkB1mkKJ+Ae4A7FLB2gt7Ju1q10B/GALd5k
	MeK2dyLqBUgzZVBVNwnhtlGikEH2/RmsVoHtP4mr3E5U5k0ubiuol/2LQNqB00nj
	IiDS6LLcfH4Ke83PSvvp0CZF7lGShjV5I4ZxTYWa7OZiiKDDy5oGDx1FCV88cBqP
	X+fclCmnbbNTbieA1176zqLjEOQBH6UPHWFHWAGbumS1u8r3is82HFUh/Cd8AxsP
	UUfSsw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sjmd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 11:52:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 599Bq2Rr010848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Oct 2025 11:52:02 GMT
Received: from [10.206.96.75] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 9 Oct
 2025 04:51:53 -0700
Message-ID: <c4051862-508b-47ed-8bd5-c84d20f7002a@quicinc.com>
Date: Thu, 9 Oct 2025 17:21:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: phy: Add edp reference clock for
 qcom,edp-phy
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <robin.clark@oss.qualcomm.com>,
        <lumag@kernel.org>, <abhinav.kumar@linux.dev>,
        <jessica.zhang@oss.qualcomm.com>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <quic_mahap@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <vkoul@kernel.org>, <kishon@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>
CC: <linux-phy@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <quic_vproddut@quicinc.com>
References: <20251009071127.26026-1-quic_riteshk@quicinc.com>
 <20251009071127.26026-2-quic_riteshk@quicinc.com>
 <24dd250e-f2a3-47ea-af21-b0e418ed8028@kernel.org>
From: Ritesh Kumar <quic_riteshk@quicinc.com>
In-Reply-To: <24dd250e-f2a3-47ea-af21-b0e418ed8028@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8W0NO6wX4ddzZqqUKXulVpHfq3jqmCAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4MfVA5eqJenJ
 SFoLlHKeZyCgjwHRrmXhe1UOiAarvRftESHdj26qrzNQCdFoCNRRMd84b28OArEOIxPYVxuuaSY
 NgHGawCK+DI5jgHcy1OyoTXtzAffBr6qzq+EYYJwmRoT+91ZvMd8yUK3MRHPKZO6+EFZfQh6qy4
 6A26OnJshQsRTn3CGKEKPnzyP2s0/XRqK6AKTFbRpgx2RiX8Q2KYmdNxiUn510hOLzAr1O+BZwe
 zWn9azHesL+aT03hyQlhnDY7RsXf7Q8j37VtqJKChno9N8fzM9GwwlgirW4Je6uGpG+CvxQdtYc
 fEzKvLJhxL3nI6VPZXbKutxME9P8dwV09VOWHMd+O1NTQp5GVbKPbEvsGjj3lozBgw4vhSbT12B
 Oul8iRNB1bKCBOAsIjkNWyc1/9U6LQ==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7a1e3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=c7tAmdlyf66g_q6FNG0A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: 8W0NO6wX4ddzZqqUKXulVpHfq3jqmCAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121


On 10/9/2025 2:57 PM, Krzysztof Kozlowski wrote:
> On 09/10/2025 16:11, Ritesh Kumar wrote:
> > Add edp reference clock for qcom,edp-phy which is required
> > to be enabled before eDP PHY initialization.
> > 
>
> No, you need to first look what is happening in community.
>
> https://lore.kernel.org/all/20250909-phy-qcom-edp-add-missing-refclk-v3-1-4ec55a0512ab@linaro.org/

Thanks for the patch. I will pick this and add support for lemans and 
post v2.

>
> Best regards,
> Krzysztof

