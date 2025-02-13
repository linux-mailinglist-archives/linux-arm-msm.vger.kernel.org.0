Return-Path: <linux-arm-msm+bounces-47857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F3EA33955
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 08:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1A4F1628B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 07:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A762220AF88;
	Thu, 13 Feb 2025 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NrVC0Iee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D44920AF6D;
	Thu, 13 Feb 2025 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433373; cv=none; b=BTy81V8ANGP6QVvQeSRjpw68JVpfi/m3njXHQ7rN0HMKbl2LVx8mCnXdwuoO/KndztQ3/LNGn71oOzu/uSKKLNP93jzjQbke8sSlHhybzQ9vHdlfkGjyzLwm+yvc4KRO/v4S21iZwdhf+ojjeVwpPkpT4e2wunoL/7myqMQvCRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433373; c=relaxed/simple;
	bh=2Uc8K89lE0uWZIs0oK3hlodSTLVChNSVCiXAEXGJsPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GJea5Vup6cAa0AVe3gP1LDVXtlNKy0CTqp+/xhc7qVNKb48UfQElfizq9y2LN+OKAyRy6gWl6M1JqIBHxU7nePlgo586J/Da8CPWS9v1cnpVzlmTYvZRhos9QP627ZUwO0F979XwmWhvMGC8+qmxLoVQWUZIzZoWt+k38We/UXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NrVC0Iee; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CLjDTw013703;
	Thu, 13 Feb 2025 07:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7y2mJuEdlm/pritz5pU/RHzXk27S62Sg5arowrorT40=; b=NrVC0Iee/WSzHpTS
	wiocvhtdJHSUeHzrPELDTINUeA+0EwCmKaeYG8mr4TSb81JBs33f3EpSSALPKcfX
	l8LoB2rCbnV7DLjLyBtROkcZMVInCyfSUDHaW54/MJki2vfilVpJ0Ug14EqEkgvB
	nMk2RTBriOJLpwgGyh7N9TpLlvuSXStaxfDH+hzd6v6MXBb+UmGN4bara3Ki+Kne
	38a5TYiimk4dWXXqPu4pc6ZBZIsUUXAtOxSwLlGJDa82SF3wTOtNX/ZsC6ASc1/E
	2t6nvVopHdg9wpaHzXhWXyl6mk6hEVqgg+rEpOfVVUSamQVGAD1P6hDpfM4SdoJ8
	NRCMRg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rsd7txkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 07:55:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D7txHv028872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 07:55:59 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 23:55:55 -0800
Message-ID: <a8543496-095a-4467-bae6-784f68e62597@quicinc.com>
Date: Thu, 13 Feb 2025 15:55:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs
 attributes
To: Bean Huo <huobean@gmail.com>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        "Keoseong
 Park" <keosung.park@samsung.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
 <20250210100212.855127-9-quic_ziqichen@quicinc.com>
 <619be8d99c88c9519634a3b116e71b22d2e25fd8.camel@gmail.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <619be8d99c88c9519634a3b116e71b22d2e25fd8.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sKY_o7Y475zvoh-Rjn0Rw7579PzGA4HT
X-Proofpoint-GUID: sKY_o7Y475zvoh-Rjn0Rw7579PzGA4HT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxlogscore=809 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130059



On 2/11/2025 2:24 AM, Bean Huo wrote:
> On Mon, 2025-02-10 at 18:02 +0800, Ziqi Chen wrote:
>> Add UFS driver sysfs attributes clkscale_enable, clkgate_enable and
>> clkgate_delay_ms to this doucment.
> 
> "doucment" → "document"
> 
>>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> 
> 
> Reviewed-by: Bean Huo <beanhuo@micron.com>
> 
Thanks, Bean

-Ziqi

