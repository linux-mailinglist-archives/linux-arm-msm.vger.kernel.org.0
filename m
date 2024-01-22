Return-Path: <linux-arm-msm+bounces-7873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C918376B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 23:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A9841C219C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jan 2024 22:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177AC1D6AC;
	Mon, 22 Jan 2024 22:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ca0ojc6P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964E215E94
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 22:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705964243; cv=none; b=lyJimg8Xgsg91lxtwf2U2Xob1nXA6Vjw/S6HuV7zDWgduLfLdEmGqlc6HGaZu9WeUJ5giZllw9bYmVM7Y6kNX5fhm3IXgL5svKcQNpU4mnHBOVBwwp9ZgIoFkQynZnRhZFnmLzwi2MNCaNHK7LT4+mTeetAQFI8SKiMt1CyC0p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705964243; c=relaxed/simple;
	bh=PN+iIJaP9mLrTXUky88tCPBG6Fqwf3rCXN4zSwrucyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FxNnIBZ0Cl2K+sLh4GOR84ie5/Y2SZvvCfkkAHr/2WZsj78FoCFI/NAZSHsnPp8s8xcJD3jxk22U4HZQfSr0N/tHTh346lN9+HlQPhdA+D/QSZfyT6Tu8LkeuXdyeBktnMKskrlBRp0uNYRrjy9M/dTvwndLYj8eZZdbfJ3VPI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ca0ojc6P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MIbU4Y025976;
	Mon, 22 Jan 2024 22:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EC5KLFYJCt3kaSMZL4b7d25l8B3+5ncGG6vhirauSTM=; b=ca
	0ojc6PXXHbLjLuQBvl6g565ectbXkSoAvkzZWv4OGnAwBpBnrET0PT1sUPGU8kpd
	CGad6p4BcZAWI5G81CFQDK8IZyIVOc4JW6n4CcXrti6iWPNlSofNMNks/Pc7ZfFn
	dVfTbXk0dXKFDdXUSk2RdFcrmgDc/6VTHdPywd66KbtJndhCoclXps4X1KOMUVjF
	Iku6sH4+XVuxxxxFsAwZFPc4c2a452eRAWox4yos1DiHnDDcqtaJF1b8b1Sh5mZc
	JPQOH6MQw4tEWOt5P/4IwF2Ket5q7L4u+30IGoO70BWhkhKHDFhvS2GruItjRmNm
	M6hW78zqCK33zJPGg/xw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vssjws7f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 22:57:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40MMvC5Z026776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 22:57:12 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 14:57:11 -0800
Message-ID: <76b6f813-3548-df82-ea26-f406d984c496@quicinc.com>
Date: Mon, 22 Jan 2024 15:57:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: QAIC reset failure
Content-Language: en-US
To: Baruch Siach <baruch@tkos.co.il>, Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        "Ramon
 Fried" <ramon@neureality.ai>, Orr Mazor <orrm@neureality.ai>
References: <87ttndw6m6.fsf@tarshish>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <87ttndw6m6.fsf@tarshish>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7Otf0U82F3W9wne9JEPbkRn1bHVyDJh4
X-Proofpoint-ORIG-GUID: 7Otf0U82F3W9wne9JEPbkRn1bHVyDJh4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_12,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 clxscore=1011 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220163

On 1/16/2024 9:58 AM, Baruch Siach wrote:
> Hi qaic driver maintainers,

Sorry I was holiday last week and I am just now catching up on email and 
seeing this.

> I am testing an A100 device on arm64 platform. Kernel version is current
> Linus master as of commit 052d534373b7. The driver is unable to reset
> the device properly.
> 
> [  137.706765] pci 0000:01:00.0: enabling device (0000 -> 0002)
> [  137.712528] pci 0000:02:00.0: enabling device (0000 -> 0002)
> [  137.718230] qaic 0000:03:00.0: enabling device (0000 -> 0002)
> [  137.725720] [drm] Initialized qaic 0.0.0 20190618 for 0000:03:00.0 on minor 0
> [  137.734326] mhi mhi0: Requested to power ON
> [  137.738520] mhi mhi0: Power on setup success
> [  137.855108] mhi mhi0: Wait for device to enter SBL or Mission mode

This all looks good

> [  137.861578] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to receive START channel command completion
> [  137.870733] qaic_timesync mhi0_QAIC_TIMESYNC: 21: Failed to reset channel, still resetting
> [  137.879063] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to reset channel, still resetting
> [  137.887334] qaic_timesync: probe of mhi0_QAIC_TIMESYNC failed with error -5
> [  137.894866] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to receive START channel command completion
> [  137.904006] qaic_timesync mhi0_QAIC_TIMESYNC: 21: Failed to reset channel, still resetting
> [  137.912263] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to reset channel, still resetting
> [  137.920517] qaic_timesync: probe of mhi0_QAIC_TIMESYNC failed with error -5
> [  140.807091] mhi mhi0: Device failed to enter MHI Ready
> [  143.695094] mhi mhi0: Device failed to enter MHI Ready

This looks like the device stopped responding to the host, early in 
boot.  Trying to access channels while the device is not in MHI Ready 
state is odd.

> This is with firmware from SDK version 1.12.2.0. I tried also version
> 1.10.0.193 with similar results.
> 
> Some more state information from MHI debugfs below.
> 
> /sys/kernel/debug/mhi/mhi0/regdump:
> Host PM state: SYS ERROR Process Device state: RESET EE: DISABLE
> Device EE: PRIMARY BOOTLOADER state: SYS ERROR
> MHI_REGLEN: 0x100
> MHI_VER: 0x1000000
> MHI_CFG: 0x8000000
> MHI_CTRL: 0x0
> MHI_STATUS: 0xff04
> MHI_WAKE_DB: 0x1
> BHI_EXECENV: 0x0
> BHI_STATUS: 0xa93f0935
> BHI_ERRCODE: 0x0
> BHI_ERRDBG1: 0xc0300000
> BHI_ERRDBG2: 0xb
> BHI_ERRDBG3: 0xcabb0

This suggests that the device crashed, which is unexpected.

> /sys/kernel/debug/mhi/mhi0/states:
> PM state: SYS ERROR Process Device: Inactive MHI state: RESET EE: DISABLE wake: true
> M0: 2 M2: 0 M3: 0 device wake: 0 pending packets: 0
> 
> Any idea?

We may need our firmware engineers involved.  I think there is already a 
thread with some of the POCs involved.

-Jeff

