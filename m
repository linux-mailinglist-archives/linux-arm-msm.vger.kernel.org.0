Return-Path: <linux-arm-msm+bounces-26589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 198DC9350B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 18:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9D64281A41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 16:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76901143881;
	Thu, 18 Jul 2024 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eYR0SzAr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9577407A;
	Thu, 18 Jul 2024 16:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721320246; cv=none; b=ac90ah1kuFGs46R4QQfKquQbiuTU8PjGQ3CoWAdZ9IuuGxkrjes/Ns12aL5GpUTLpKO2AC+rebZ0mWvDCJCXPPFrk6K04UeHokYddok5D1z4y/QrMcjBcHgCRYfsmmL1TuejzmZVM2QVoW5eLQ6P4tahyjO637n7Wz23tToavjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721320246; c=relaxed/simple;
	bh=Vp8+JszYeMk3yayL2aVp/US3TeXozBLpGN0LNcdDpd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QxgGgy1/3+9z088/iP3CrbaM2/VCQOtyEFyKIxOdWNWckvGRoBAadS0c2Nf3rHcdPOBcpY7iOHM1nRBnzb5gtQahHuNlEbeMHSo370N/nPVjCQWFcdUuQwVFpat0D2kkLm0VkjuGyPP/YhnWt17k/V3fWzAPkcZFVM63cnkt6I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eYR0SzAr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IBD0bU023117;
	Thu, 18 Jul 2024 16:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMBFcktZdmc0z3TopgxuHMV68LS7+LE2IguujeZ60z8=; b=eYR0SzArbkIzf9gz
	KI1GpCCTUtPT3jZubG/Yk4yQwftTrw3HxjXytCSVguYr90imG5W1sR66DkHxQ8CC
	SjG3VMi/eL/qQOPlHoRoWrjiOjRrJyFGh0VSp99SYm7NxXR0AwhxIkueooE1g/NE
	VuG5XzIRB8RMfDecsIaty4a0JpFii+XLm/n6581c471pUovHId1U55srInA+kyeR
	fOz94mamx+Nk+C5N92lAda159vugz09BYVzPYgUalQFzdKBXYqaScuLSuqFl5QNh
	m0JTwLjAqAE2QW0cKM0Efo45Bqe/JrmzJRawH2G5HThacLVXdYWFpJb4PjPcyPyX
	f0trvw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfnp2fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 16:30:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46IGUgJC005035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 16:30:42 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Jul
 2024 09:30:41 -0700
Message-ID: <dfc3bb3c-f26d-6af4-a598-d802348bc95d@quicinc.com>
Date: Thu, 18 Jul 2024 10:30:40 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/6] add improvements to mhi driver
Content-Language: en-US
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tYfoucVpImbAUqXkzGJQBxsCZmDKueVx
X-Proofpoint-ORIG-GUID: tYfoucVpImbAUqXkzGJQBxsCZmDKueVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_11,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=771 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407180106

On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
> The below patches address
> - memory fragmentation issues: when several iterations of mhi controller
>    register/unregister happens. In our case, we have a PCIe WiFi device for
>    which fw is loaded everytime when 'wifi load' happens. For this, we need
>    to allocate 9MiB of coherent memory with 512K segment size. After several
>    iterations, when the memory gets fragmented and 512K segment becomes
>    unavailable causing alloc failure.
>    
> - debug requirements by printing critical mhi debug registers
> - bug fixes to mhi_irq_handler
> - RDDM timeout issue
> - memory carveout for RDDM segments.
> 
> Gokul Sriram Palanisamy (2):
>    drivers: bus: mhi: Added shared-dma-pool support for mhi_dev
>    bus: mhi: dump debug registers in critical sections
> 
> Karthick Shanmugham (1):
>    bus: mhi: change IRQ_HANDLED to IRQ_NONE in mhi_irq_handler
> 
> Praveenkumar I (1):
>    bus: mhi: increase RDDM timeout
> 
> Rajkumar Ayyasamy (1):
>    bus: mhi: check for RDDM cookie set by device to indicate readiness
> 
> Ram Kumar D (1):
>    bus: mhi: add support to allocate rddm memory during crash time
> 
>   drivers/bus/mhi/host/boot.c     | 209 ++++++++++++++++++++++++--------
>   drivers/bus/mhi/host/init.c     |  70 ++++++++++-
>   drivers/bus/mhi/host/internal.h |  37 +++++-
>   drivers/bus/mhi/host/main.c     | 115 +++++++++++++++++-
>   drivers/bus/mhi/host/pm.c       |   6 +-
>   include/linux/mhi.h             |  20 +++
>   6 files changed, 397 insertions(+), 60 deletions(-)
> 

Please post v2 to the internal review list before posting to the public 
lists.

