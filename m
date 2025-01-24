Return-Path: <linux-arm-msm+bounces-46017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EEDA1AEC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 03:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 322E718901A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 02:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4EE1D5AA7;
	Fri, 24 Jan 2025 02:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iE44FkBV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22B640BF5;
	Fri, 24 Jan 2025 02:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737686424; cv=none; b=UR/K1zL4rzG4SFrb8UqMopblDNmemOUvHxqQgnt44v24HQsoDiJLbqXqKw/WE/JjKuFVymHmxCoWgc7M9hQhAEoeeVmb/zJX0C/xYk6YoWz6yUm1NPMxT0oqOncEx8drhAjnXQEZRKhMb+Xa0DS44GNEmnQH98FU+OlifNMpyUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737686424; c=relaxed/simple;
	bh=eEPhkTwHGyNHX//+3d4UUEemufJEgLVDpC9rwvp02UE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=i9YXrn1Zd4Mzyxn97x6/wmgSJctt8B27cJPvJOIc6QzlQRBtz7UvuzOBp47aSoWML7hM0+yo3Ho59G2pyL31hkS2wI8AVcAVq8ZND7WyoGT87Jwaz/5O1xSP//fgAoImbHAoH0JTH0HM2IriBsDAB3z1/6WKRDUoI9YiycehJmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iE44FkBV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NNvh8s025590;
	Fri, 24 Jan 2025 02:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GujXHfe2/olmjRRDiVpSdvoVMOjJ62T2U+enR2tRdXo=; b=iE44FkBVPGjhVyK/
	cepYNPwSTuHCDNI93laCf3K5NyZs0uSG/cvFJAaC4wj5ZnQbzbV94DeBjVG8QDuM
	7bX0DbGc7yUGMu155QMK2Ojghzk/3UyU61DA8+m3nAV7OaMCuSJE9+WUQy+zdWQX
	+DdQSlpmWc9TT3vPR+hHE0deXmaA49/jJdXzrwNAU3TIW1iEu61q9/Zg+Fm6Js+i
	6gFYCmAac27XeHDPVas5ihFRTRtWcOIRfKdvIOZmOu1nPgujBm8qPPPWTvQ2A3W4
	e8leslfHg9JiXn2DT4v/vmggZ5IabFQjdCqjcETP418WGaoBFX9endgiR2mZI7YT
	R3yCag==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bywc08ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 02:39:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O2d4pw005269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 02:39:04 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 18:38:59 -0800
Message-ID: <f09421c8-e6db-4189-9c1a-6ae0a863ae40@quicinc.com>
Date: Fri, 24 Jan 2025 10:38:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] scsi: ufs: core: Add a vops to map clock frequency
 to gear speed
To: Bart Van Assche <bvanassche@acm.org>, <quic_cang@quicinc.com>,
        <mani@kernel.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Peter Wang
	<peter.wang@mediatek.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-4-quic_ziqichen@quicinc.com>
 <a0359746-2cf0-4db3-891d-b4cb4ff6c163@acm.org>
 <b998f9b5-9965-4cc5-9e76-4ae743596f6b@quicinc.com>
 <cc07ebd1-fa93-46be-991b-c14e4222750c@acm.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <cc07ebd1-fa93-46be-991b-c14e4222750c@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KcnIGAbTP111X2mXAKTMG8YlFA6LDYQB
X-Proofpoint-GUID: KcnIGAbTP111X2mXAKTMG8YlFA6LDYQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240017



On 1/24/2025 1:49 AM, Bart Van Assche wrote:
> On 1/22/25 11:40 PM, Ziqi Chen wrote:
>> In ufshcd-priv.h , the function name of all vop wrapping APIs have the 
>> same prefix "ufshcd_vops", I need to use the same format as them.
> 
> That sounds fair to me.
> 
>> As for return the gear value as the function result. In our original 
>> design, we also return gear result for this function, but finally we 
>> want to use return value to indicate the status , e.g,, if vendor 
>> doesn't implement this vop, we return -EOPNOTSUPP , if there is no 
>> matched gear to the freq , we return -EINVAL. Although we didn't check 
>> the return value in this series, we still want to preserve this 
>> extensibility in case this function be used to other where in the future.
> 
> There are many functions in the Linux kernel that either return a
> negative error code or a positive value in case of success. Regarding
> future extensibility, we can't know how this function will evolve in the
> future. This is not an argument to keep the approach of separate error
> codes (return value) and gear values (gear argument).
> 
> Thanks,
> 
> Bart.
> 
OK , Bart, let me improve it and please review again in my next version.

-Ziqi

