Return-Path: <linux-arm-msm+bounces-38613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AF69D478F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D93B9B23D10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F391C9DCD;
	Thu, 21 Nov 2024 06:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UEZ+qIFP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1AC1C830B;
	Thu, 21 Nov 2024 06:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732170611; cv=none; b=PjgYTRCFx5pTmyg0VfpEWyedP7WNYGD+ppPxwB8u1qj17F95z42jzXX1GOzAF7IFDaUG8J2Y4aFr7hizCmKr9sF1y7cGeelqumjLst8y945S1o90iavAqgN04EVCNU2bnWrTQ3citSNtu0j7Wbqs6rF3OUaSiLs1I5UR63ApuRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732170611; c=relaxed/simple;
	bh=dAlSzJaDzYGsaeo4w49gz5jCSrI9lGWjmNEzfGro7j0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k8/9OzcK/CgufKD7NWB3elq0mYoWlJnraUFD3bVhf/Uv/g/xVKkWD2xSZoldjUKW927FGSaNYM9zYMYfQECPc7XU1RWktniqalJZg1cMRUO8ubg2lhk+1DM6TkwcKpXHYqUfpdX3D0vrktmXJRrNj2s1U1mctEE1H5T02AosuLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UEZ+qIFP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL0Yj46004466;
	Thu, 21 Nov 2024 06:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gr+JWUTvGIUOXN5PEXraHWM0OuhKA8B9C0NHGITewQ8=; b=UEZ+qIFPQBAMKua7
	Detma/BHuDkeidilPnALoV3g41hUJojbSbbyEa2emwa+swEpf8Z/Dj3whfi0Y09L
	uEQG3dpq8JGx8taSfEkLz3TRSB4rGOQB/IQAIAMq56kDrmRapuwIKt6ZATAsS3UR
	dKy2hdx5Ukr2BA0UMSz2LT6JlKaNTlZeqEvvzHALlUa2HxujZMPOG4Hy51KM/dVr
	VUschmSieDk5k5C+K37QBgqX4ZK6cKCOn5XrJ4VcsTiNNrPJu76UYk/hO5WoiLgr
	fn4VB7iJ53Me0i9ino9/4ZKp9u71/fc1AWZSMPZEjNcOVvQQ1s8jaDWUVnRoAlkS
	vKMftA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea72k9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:30:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL6U2mL012800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:30:02 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 22:29:59 -0800
Message-ID: <3e53ba1b-95ad-43f1-aab3-fa4365e16209@quicinc.com>
Date: Thu, 21 Nov 2024 11:59:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] misc: fastrpc: Introduce fastrpc_shared.h header
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <arnd@arndb.de>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-4-quic_ekangupt@quicinc.com>
 <2024111832-sprinkled-boastful-8fba@gregkh>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024111832-sprinkled-boastful-8fba@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1IQRiqXP_6Lpa1sIcygDkV0mfxGKOu2E
X-Proofpoint-ORIG-GUID: 1IQRiqXP_6Lpa1sIcygDkV0mfxGKOu2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=594
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210048



On 11/18/2024 7:28 PM, Greg KH wrote:
> On Mon, Nov 18, 2024 at 02:10:45PM +0530, Ekansh Gupta wrote:
>> Move fastrpc structures and MACRO definitions to a new header file.
>> These definitions are consumed by other upcoming features like
>> debugfs, PDR support etc.
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc/fastrpc_main.c   | 136 +---------------------
>>  drivers/misc/fastrpc/fastrpc_shared.h | 155 ++++++++++++++++++++++++++
> Again, why not just "fastrpc.h"?  No need for the huge prefix here,
> right?
yes, right

--ekansh
>
> thanks,
>
> greg k-h


