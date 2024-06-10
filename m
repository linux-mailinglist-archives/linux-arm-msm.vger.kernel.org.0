Return-Path: <linux-arm-msm+bounces-22232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8A8902C89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 01:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A214A2828F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 23:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840E7152189;
	Mon, 10 Jun 2024 23:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MWnef0DN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133343C0C;
	Mon, 10 Jun 2024 23:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718062633; cv=none; b=eFvqX22qiSHjK1hU8Rb1aIhU0NL8i33dG9Sm2XrDF1qchVa6KK2cYGuWQlRbAKhC1hxA9sqedn+qlsTrGM7PtjdXSWM3U3kfmMEI+z8cQhdqUabLUofOiHusdVDDReeQmQQ/bQbEHKGIq8LGk7CNpxe0GCiHEoFLxggYNXTsZog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718062633; c=relaxed/simple;
	bh=9cEJOPE2RpbqEAENzqQsuPtohaf5MRTGcoYQvOo+FjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ojrby8pyKEYOdhWs4wLFZ6gM6nrqI3jyq1HCgCDuCqIQnkUuaz+7SkvFsbxCaHTJ9hT0HCue0pYMzvgLh8g0odD8tgqBd51z99PxCAef+Cepu91j2SCr1QqF0rJfZZFXBPKoLq8YEBfZHjMjr3aP6oniUcNg/B4ViMEAfRbyEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MWnef0DN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AECaKx021412;
	Mon, 10 Jun 2024 23:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EO1UzCQ1xrz9eOEjnbCgqr2cmZlDFwe8lIz5c9cEIyc=; b=MWnef0DNKfKuZ1fK
	ZN7ZGdRFVpslCF4wZONOZE2y/ZkEUFZJ/uqpTd5LldQbE9h/A5piYfoDpMmCk6RI
	FoQrmMwM58/i7bmBmO0qYrxYtifVE5pOoZsL20CHGW8MQLNF4Ijh7MZfiKZJ2A83
	3QEhUR4klMRN6HPtVPOsAWTfKh5HORUoQ9JTWeCUatBVtagx1SbuGPYFeKdhW4R3
	KOkW/hKI0ZxJKk5X+98E5K5O+wwMoEful11F8bc5I+qTkm8WWc3uG57/wq8+/Vuh
	L0TFbPGUv/ZLPfb1m8fm1q4UGUyW8Nl+0DvvFwHGFM0YoJxngT33fJYdk8LEIx2s
	UoTrQQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymgk8vyd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:36:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ANapJU028562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:36:51 GMT
Received: from [10.110.56.180] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 16:36:50 -0700
Message-ID: <de13199e-1c3f-df75-6357-d3c2333fc43b@quicinc.com>
Date: Mon, 10 Jun 2024 16:36:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v22 03/38] xhci: sideband: add initial api to register a
 sideband entity
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20240524001043.10141-1-quic_wcheng@quicinc.com>
 <20240524001043.10141-4-quic_wcheng@quicinc.com>
 <40e65895-fc87-4754-ab5c-29d7c95b6d17@quicinc.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <40e65895-fc87-4754-ab5c-29d7c95b6d17@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _L7t0l-o42xEQg3DEh7wPU1rsmp4SbO1
X-Proofpoint-ORIG-GUID: _L7t0l-o42xEQg3DEh7wPU1rsmp4SbO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_06,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100175



On 6/4/2024 4:13 PM, Jeff Johnson wrote:
> On 5/23/2024 5:10 PM, Wesley Cheng wrote:
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> [...]
>> +EXPORT_SYMBOL_GPL(xhci_sideband_unregister);
>> +MODULE_LICENSE("GPL");
> 
> Please add missing MODULE_DESCRIPTION()
> 

Thanks, Jeff, will add this to the drivers that need it.

Thanks
Wesley Cheng

