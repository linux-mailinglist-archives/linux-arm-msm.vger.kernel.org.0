Return-Path: <linux-arm-msm+bounces-27097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1393D5C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 17:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B8FD1C22A6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 15:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E0A176FDF;
	Fri, 26 Jul 2024 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S5IEiqBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FF2FC1F;
	Fri, 26 Jul 2024 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722006886; cv=none; b=eLOYOEnpIdwBRfrcjY/fS2KLYkpLa+mSLsXZvXu7zLgpYRATo58HWwfPRTNGlSh7ELrKS26rW2EaVEGXaYhvOQm2gvf6r63e4O3BDnkOYwaBE+oNkA2I1pUJWq7nyBn9aVh5eNa0lTRB22MvymH4fTBLdJ7PlDDfur79N9EZa7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722006886; c=relaxed/simple;
	bh=5LVNVgJYxLKeFXaN2Sf8hg9qpW2jGfxaxTMWDzN5Rgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oVWuPQtPGA95DnCqvbO4NpPeMCC0NdpGPj6XIern4z8TQ8tGwBeTGhD5GjQ8+RP2fkEXzu1imtbBQd/Rth6iIeYir8qd/yReRC+GOYyxw4i2DOZjmXBkdLiLX9BGR1XIKJ40WOYc299LEXrojKCph1oPr2Ps2X/q8chkIWbUfrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S5IEiqBY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QBPASk019951;
	Fri, 26 Jul 2024 15:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLF8JeJASjno619fXeYlFDhDT3LWhRVwe2maAaLrMr4=; b=S5IEiqBYlKfZLvmQ
	lTj8GPL14R5VD1TuRlKAO+1CqaPv4fd2NZvtZbcEpUBnU1017M5N4heVcBCIp9el
	Q6ZJQYGlGyvPytmR5YGogwkSG7NI9WH6JpSTCsI0sqOdZDqRmyZ2fIX3NXiHwYDp
	tHt1a443CuaRpuiC7/Ewh/kwpRs4QGnPKcbxAy8kNvSn5OFTHNkR7dx6QZIKVJ65
	DOEaFgzp062NU/0yCqX7vZbIpKKW0RxT2RBYoet4RjP3O66zeX5MliFR+gJXJzDC
	O7OgAlceudPh29m/CuJFeTyUEx8pHhbm7t2nQrFv5TBzeB5SnsONojXn5NTqGKNm
	IO5jxg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m1s91uva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 15:14:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46QFEUe3003825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 15:14:30 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 08:14:30 -0700
Message-ID: <70a510e7-51f1-05f6-343a-27d40577b54c@quicinc.com>
Date: Fri, 26 Jul 2024 09:14:29 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Remove the description of
 DRM_IOCTL_QAIC_PART_DEV
Content-Language: en-US
To: Zenghui Yu <yuzenghui@huawei.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <ogabbay@kernel.org>, <corbet@lwn.net>, <wanghaibin.wang@huawei.com>
References: <20240716073036.453-1-yuzenghui@huawei.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240716073036.453-1-yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9jJjmmN6kN0xHNxvbIHT-2YD5fFukusf
X-Proofpoint-GUID: 9jJjmmN6kN0xHNxvbIHT-2YD5fFukusf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=759
 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260103

On 7/16/2024 1:30 AM, Zenghui Yu wrote:
> The partition device ioctl was removed during the development of the
> initial version of qaic driver. Remove its description from the
> documentation to avoid confusing readers.
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

