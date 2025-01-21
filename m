Return-Path: <linux-arm-msm+bounces-45699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D09A18127
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 16:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11CAB3AB173
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 15:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1FE1F4705;
	Tue, 21 Jan 2025 15:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d71jjJca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470801F4299;
	Tue, 21 Jan 2025 15:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737473386; cv=none; b=Gfo+CSRzbrsBNPIdyYxol64V1tzArSnMZOkz4AXyKz+IPRMWP1P9hCg8Jf/1Ku0GzsLq32zshFxW+SR3XDseMXn4GhRnkMFYpuXkux05wtfEpJQYMsMrHfVNjy6JmxmajKfH5OcO+SO3mC/AMW8ZLRcEBkM6E/MnwCks5Fy38ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737473386; c=relaxed/simple;
	bh=hZUVhBT9ZVscOAlnCeZiXzX8lMVxX6KBc7liCxqVgYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Zp6QYdirq/YhzN3jMYEPfx2SH0X6lKJXf9zvs5YWPKG3p0w49ic7xBoa/797IppKeUYfIIxDnKC+k4cgSNFSuzzmG1U6Anm8NF/l0LlfLDBftNNkPfs/eG3rstiETsdC7afbfjz5bNXconztg3LJX0sjlNrpQmB8xV2eBeJElKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d71jjJca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L9Hfhc006606;
	Tue, 21 Jan 2025 15:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRaedevMSORfkAEjpYG6dBAlSk0930ZbG6DAT5O4hjI=; b=d71jjJcaZgCmvWV/
	boTG2KmKVMPbN/wfuY3Kd59WoVlr8jrWBYWImzjElBFkgmsjQXYJj033daPPZLwS
	5mSeC5TfL6DnKmA0FIePnmrmL7AijoDSinZzyyfCj6sN3mNsybj7Uy+edVuUvDUa
	rmuEPjgfA0EUPk1+81eUY5vW1rauKA4hWYExjGwUYPpbY8X7f+l/yApt3Iw1ltGn
	SHMO+5bvislg0v0Fq3xCM9GxmdYCu36h4BGpBA2nY6Ed9r+JrzCGiHRgPu4FTtXO
	GLcIJ4ZVo/Ll133rWlXDNoIt0cjn5VKsMmVeTviPzzs1DHfAs9RWyl33pcD7xCcg
	GJBBGg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a8tuh6jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 15:29:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LFTX8S029595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 15:29:33 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 07:29:32 -0800
Message-ID: <dbf3e688-d7fc-06ab-aee6-3ed1095148c8@quicinc.com>
Date: Tue, 21 Jan 2025 08:29:32 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 7/7] accel/qaic: Add AIC200 support
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <quic_carlv@quicinc.com>, <quic_yabdulra@quicinc.com>,
        <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>,
        <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
        <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
 <20250117170943.2643280-8-quic_jhugo@quicinc.com>
 <20250121051624.nhest7s6iyh2ll4m@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250121051624.nhest7s6iyh2ll4m@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QZ8m3zlp2BF81syHGF_36z3fy4GUrIB-
X-Proofpoint-ORIG-GUID: QZ8m3zlp2BF81syHGF_36z3fy4GUrIB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_06,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=856 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210126

On 1/20/2025 10:16 PM, Manivannan Sadhasivam wrote:
> On Fri, Jan 17, 2025 at 10:09:43AM -0700, Jeffrey Hugo wrote:
>> Add basic support for the new AIC200 product. The PCIe Device ID is
>> 0xa110. With this, we can turn on the lights for AIC200 by leveraging
>> much of the existing driver.
>>
>> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
>> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks for the reviews/ack.

Do you have thoughts on merging the series? I think I could take 
everything through drm-misc, you could take everything through the MHI 
tree, or we could split the series by tree with a phased approach.

-Jeff

