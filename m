Return-Path: <linux-arm-msm+bounces-6675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1419827717
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 19:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFDE41C224F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 18:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8015E54BCE;
	Mon,  8 Jan 2024 18:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pYC+LYGD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D254BD6
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 18:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 408Gxn4f006582;
	Mon, 8 Jan 2024 18:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=S/fAx+BznxJOfUx+O5QEarjWLINfbSbBW4CX1byTYn4=; b=pY
	C+LYGDWGkrQIoukOV70S2nLGyqpnrT9WyVT3BH6hlScqzIglE6r5CnNV6xVMrJdS
	Lx5bs0/sMlz8obnypSpBtYP0XONBQV/2u5vxzmvJEEhIVxF9Z9IcbpUlmbVBD+bc
	ftb3iGecLr08Q7pvdAUQ7Ez3eoZeL/4JGu+2aRFEg2HOexEUyXiPGAydHexPMLno
	rQkZQY88M61DBAfcWYgdEyjc/R/dtkRTiN1nvo2uDYZjbj2oFYoRrv2ZC1oCOszV
	3ZvCKJK412hO0nSo4342etKbuiA2oXPW0YchqfKHLao9VBMxrPfuoCvQKn1p+0Lt
	v/GxciT5yV5KP+Yv++fA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vghmbrq6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 18:14:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 408IEkH4009737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jan 2024 18:14:46 GMT
Received: from [10.216.57.161] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 10:14:43 -0800
Message-ID: <49d85352-d022-4b59-a3f2-d8f7ef3028ac@quicinc.com>
Date: Mon, 8 Jan 2024 23:44:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sa8755p ufs ice bug: gcc_ufs_phy_ice_core_clk status stuck at
 'off'
To: Brian Masney <bmasney@redhat.com>, <linux-arm-msm@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Eric Chanudet
	<echanude@redhat.com>,
        Prasad Sodagudi <psodagud@quicinc.com>
References: <ZZYTYsaNUuWQg3tR@x1>
Content-Language: en-US
From: Shazad Hussain <quic_shazhuss@quicinc.com>
In-Reply-To: <ZZYTYsaNUuWQg3tR@x1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FeUzKGeBTRn0mT7T2mXN5RCvc831HdEi
X-Proofpoint-GUID: FeUzKGeBTRn0mT7T2mXN5RCvc831HdEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1011 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080154



On 1/4/2024 7:39 AM, Brian Masney wrote:
> Right now when we boot the RideSX4 (sa8775p) board on linux-next with
> a quiet kernel log (specifically loglevel=4 - warning) about 50% of
> the boots fail since UFS cannot be mounted. Changing the loglevel to
> 5 (notice) or higher to show more logging makes the race condition
> and error go away. I tracked the error down to the following:
> 
>    - The ice driver fails to probe due to the error
>      "gcc_ufs_phy_ice_core_clk status stuck at 'off'" and returns
>      -EBUSY and is not retried. platform_set_drvdata() is never
>      called as expected.
> 
>    - The qcom UFS host driver calls of_qcom_ice_get(), however this
>      will always return -EPROBE_DEFER since the ice probe failed,
>      and platform_get_drvdata() is always null.
> 
> Here's the relevant log messages that I was able to get from a failed
> boot once I configured dracut to time out:
> 
>      gcc_ufs_phy_ice_core_clk status stuck at 'off'
>      qcom-ice: probe of 1d88000.crypto failed with error -16
>      ufshcd-qcom 1d84000.ufs: Cannot get ice instance from 1d88000.crypto
>      ufshcd-qcom 1d84000.ufs: Cannot get ice instance from 1d88000.crypto
>      platform 1d84000.ufs: deferred probe pending: ufshcd-qcom: ufshcd_pltfrm_init() failed
> 
> I assume that there's some kind of vote (icc, clk, regulator, etc)
> that's missing from the ice driver, and another driver is performing
> the necessary votes. However, I don't have access to the hardware docs
> to tell if that's the case. Can someone that has access take a look? I
> can post patch(es) if someone can point me to what needs configured.
> 
> Brian
> 

Hi Brian,

I can see that gcc_ufs_phy_ice_core_clk needs the gcc_ufs_phy_gdsc to be
enabled before this particular clk is enabled. But that required
power-domain I do not see in the ice DT node. That can cause this
problem.

-Shazad

