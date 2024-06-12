Return-Path: <linux-arm-msm+bounces-22515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA12905BFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 21:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 450921F2331E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 19:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BA982D91;
	Wed, 12 Jun 2024 19:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DxcjmtRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE014EB5E;
	Wed, 12 Jun 2024 19:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718220658; cv=none; b=HSsznT6eHMta0iOODjPqundPoklgzN8pCe7W/seHzH1r8cTt8wVE5HM0T8z2fKKshem4DAygID1Yr6Zmc8HZIBVvTLwde1w1Apeek21yT8FHRTXzSG/EGWyHzS0uufbeAloDquG1fgnHwVOFBXaaHmU//HE0bq6AZnECG4i5Cj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718220658; c=relaxed/simple;
	bh=/ZMFjzeP+3mUcXmt5IOmYEwCnOMMsnMaPprtQmPzmHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MtLteSU9wTmfs19uSQ4fPk5ZMNVFjRKFWCR+1eE45idrLtBoY4ctDoR3NoiHI94qpEVAIbHWOkFGiF3mXMFXddt0usA947eKYqSfjIkSXSwkxDOa2udHhKdbHd7ONQEKyZetHOH+IVwmZEKwf8+swSm3ZEFB/B5WQCvzMs9i61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DxcjmtRq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CDqm4x019114;
	Wed, 12 Jun 2024 19:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OweUuhdB9244WWdTLOqzMSffQaKHTaN0TxH31JMWZuE=; b=DxcjmtRqGYLq0qXS
	uismcLWhlL8oqdZzIskTBCPVUQ9DwMbvuxWQz0l9GvhYWDCGv2wUwzjc1+NZx6sY
	9Jj2iWcyz+9Z6/Fd+pwSubb1njHGlaidjEWebXJlPdya6h1MqrvjYqIPOSXkmT28
	3XK4jAs9mk3YVU6w2zqht0IQCnzTOQ1a+TORTN5FQDQo82HAO67pjSeW7KM3PIcI
	EwSi04aODYVBK81JhtcR+LqAixgeyFESdlnW5JAZgZIgHh7hxgHySgRKoU9/w/pu
	lUnRe0v0adiBkvscH/5d/k2EFfI56JWLAeEAZITJwKJ85LH+zqRAr7aom7wmnPlo
	X0BDHA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yqcxth268-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:30:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CJUUXh011599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:30:31 GMT
Received: from [10.110.56.180] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 12:30:30 -0700
Message-ID: <99457050-9848-03cb-0242-bd9448ea8f6c@quicinc.com>
Date: Wed, 12 Jun 2024 12:30:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
 <ZmmTr48zLCxRVlYf@archie.me>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ZmmTr48zLCxRVlYf@archie.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ARVEH-kmyglR5rfomLqcwZY1_ab7eAOc
X-Proofpoint-GUID: ARVEH-kmyglR5rfomLqcwZY1_ab7eAOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=793 spamscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120138

Hi Bagas,

On 6/12/2024 5:25 AM, Bagas Sanjaya wrote:
> On Mon, Jun 10, 2024 at 04:58:08PM -0700, Wesley Cheng wrote:
>> +Overview
>> +========
>> +In order to leverage the existing USB sound device support in ALSA, the
>> +introduction of the ASoC USB APIs, allow for the entities to communicate
>> +with one another.
> "... ASoC USB APIs are introduced to allow for ..."
> 
>> +USB Audio Device Connection Flow
>> +--------------------------------
>> +USB devices can be hotplugged into the USB root hub at any point in time.
>> +The BE DAI link should be aware of the current state of the physical USB
>> +port, i.e. if there are any USB devices with audio interface(s) connected.
>> +The following callback can be used to notify the BE DAI link of any change:
>> +
>> +	**connection_status_cb()**
> "... connection_status_cb() can be used to ..."
> 
> Thanks.
> 

Thanks for the review, will update

Thanks
Wesley Cheng

