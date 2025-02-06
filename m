Return-Path: <linux-arm-msm+bounces-47007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB951A2A29F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 08:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E94A93A3B40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 07:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA451FCFCB;
	Thu,  6 Feb 2025 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G6rmGoCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72BC13AD18;
	Thu,  6 Feb 2025 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828170; cv=none; b=JCqed/HrHxsKJ3L52PWFSBJEAN6C37uKRSxnwZKYT5sWL1BWQ1ozsCJbbljo/2rSH2pGB+v2Va0Gea+uBUlmml7MalOO6XEHlcTgXaIoM7t2ojd0PQH6d8EzsEVgkVf/Apgu/iJK/jSAiT9dB3zLSPsIKlqx717Iuy4aQYLskao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828170; c=relaxed/simple;
	bh=+7rwxfPErmuk67ZPpwisSG6OfB5xMkXSna0Mm1NchZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ed6CSJarUpfosX3WLlRIXw35U+5iKpoYQKCWouf8RM0eWIZLdAi+bjVtXdiUW87CABwDtkHUYxu4lNJT5z3ekR7VpCIYoEbjHjlU6TPvF/pdAe5buzW2Yc874QFW6yz+7T6Y045PvBWC3rUR42fpM4hQIfugDkPjIAefwAwIioY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G6rmGoCP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515LDWsr021178;
	Thu, 6 Feb 2025 07:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oyKAm4bZSkr4LY95Gx1TvERaahCxH4oLHlzoMXYqk6I=; b=G6rmGoCPzwS4SVbK
	Jbs5W+/sM7WqUkAKd1CytF5zt3BxEb2mzFodh3/ya6TJoxHNCyhMFS274s/jfTZA
	eq5W411RscviHMfcAUfL6J4UBlQPSVy592ILd0AY1kYh13d8Qz48/euSHHIm4CKf
	VvZVK+wfmskf/VbkkTNaArRKVUjpaPfjKjW6rNrXjPEjxigyz5X2qd1T5+NE0+u3
	7Ad+fNtm0Tf44uj06w45Ahu3szIhS7c9bZsaSG28kshW4/eLowCpjg3tjXabQK9g
	k3Gu82Nptd9VdYsnEV/7hzVxnUsHTXKIQvEFqjcZP2Cckji7E1nQZCUNqSkudIOc
	UWs5bg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mfqch653-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 07:47:47 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5167lk19023061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 07:47:46 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 23:47:41 -0800
Message-ID: <5595f528-c342-4ae3-823f-6fb44ddc73fa@quicinc.com>
Date: Thu, 6 Feb 2025 15:47:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] scsi: ufs: core: Add a vop to map clock frequency
 to gear speed
To: Bean Huo <huobean@gmail.com>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
        <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
        <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>
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
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-4-quic_ziqichen@quicinc.com>
 <21d0a62a4f7f17304d81449e75c345f1e47948ae.camel@gmail.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <21d0a62a4f7f17304d81449e75c345f1e47948ae.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e4qrT1abqgPFNJCbmg2QBAiG-V32Ljff
X-Proofpoint-ORIG-GUID: e4qrT1abqgPFNJCbmg2QBAiG-V32Ljff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060063



On 2/3/2025 8:55 PM, Bean Huo wrote:
> On Mon, 2025-02-03 at 16:11 +0800, Ziqi Chen wrote:
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> Add a vop to map UFS host controller clock frequencies to the maximum
>> supported UFS high speed gear speeds.
> 
>  From the code, seems it is not "maximum" gear, it is corresponding UFS
> Gear.
> 

Hi Bean,

Thank you for comment. Let me explain for you that why it is "maximum 
supported" gear.

For example, the freq 201500000 supports G1 G2 G3， this VOP will maps to 
G3 which is the "maximum supported" gear.

Maybe we can change it to "corresponding maximum supported" gear would 
be more make sense.

Let me change it in next version.

-Ziqi

>> During clock scaling, we canmap thetarget clock frequency, demanded
>> by devfreq, to the maximum supported gear
>> speed, so that devfreq can scale the gear to the highest gear speed
>> supported at the target clock frequency, instead of just scaling
>> up/down
>> the gear between the min and max gear speeds.
>>
>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> 
> Reveiwed-by: Bean Huo <beanhuo@micron.com>


