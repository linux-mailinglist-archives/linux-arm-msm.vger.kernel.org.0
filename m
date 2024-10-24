Return-Path: <linux-arm-msm+bounces-35728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 567389AEEB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 19:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B1652864F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536971FE0E8;
	Thu, 24 Oct 2024 17:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OZ2gebQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7101F76A4;
	Thu, 24 Oct 2024 17:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729792422; cv=none; b=o36PlpDEcnlR2AgA2U8RFuBg46snF7L0HwFfj3AVtLN1AjYVTlIkzZbFDbGTG8lVx4JJPMAhhFTmUdIfNJg92WfZ9N5qOrdPKsw2bR6/gKtIqSrr9iGTahQ8NWYWtoS3wRJVw57ZuDExbQQqleA9//i9R0Q64tV1JZvcE7RW64w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729792422; c=relaxed/simple;
	bh=gVdBWZgjEzErTQcLG35kNcui/iuWPZZ4OQiyX08vqhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qf6igAhHTh6bwuvoxTgK2P+DjH4BC5XWTnC/FF31Ob2mciQk4ookWd2WkhvovKgEVDAj54KJyynK6X6e0t+9KhIhmvV/0BJUPq+N+dwAlJ0dof0Jj19RbydIQbhsBP/vsDhUvy9hzqYHM/MSjyTMvQIEpxHkU3G7P0OXKP17IXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OZ2gebQa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O9X2xb018730;
	Thu, 24 Oct 2024 17:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1i2ZXNwjEcPtLkLQKb7CxSRAKZ/hfhZMiMaFS6mOGpQ=; b=OZ2gebQauWdyEHHP
	8xZYh/BWLIgle3S8v6vNi/edwqwbPjJ/M+WEDYkmgVPJWf8FbXsY/u0SYedgbh2+
	FWQlm48hoVr/kr7uQEqxfoMlKzmrMqtB1NXEja6Kt0c5oR91dKCrdOp2V+nldarq
	Us82f27ERqEWKRXH1VpEHe7a5PYQiLccdEaTZrMig0AzQjwyHRDh5U3Rz4IUvwVS
	XdTdg7m8G3hC5xbf+NZHIjwPOGniOotQ8lDxz3lECb4jGlTrEGJZMBoFJrOmtplQ
	b2cA9xkG4HhvYOWLhhvV/mOD+jKJCO9CF0ywNC0GuYO2Uv+7VXU3Dum4GAN3Ih/Y
	ZJeOIg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em66ej1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 17:53:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49OHrRdf029277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 17:53:27 GMT
Received: from [10.216.42.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 10:53:23 -0700
Message-ID: <1b6b8585-4e7a-4ac3-85c6-bb6dafc147ac@quicinc.com>
Date: Thu, 24 Oct 2024 23:23:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable sa8775p clock controllers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran Shaik" <quic_imrashai@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241022-defconfig_sa8775p_clock_controllers-v1-1-cb399b0342c8@quicinc.com>
 <glhmky5r3rd44hmnxgtgeelqp426fdsh7w2fqpuusz2ek6eauw@sfptftzsilix>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <glhmky5r3rd44hmnxgtgeelqp426fdsh7w2fqpuusz2ek6eauw@sfptftzsilix>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VSzStdRTRqwzeI_PgqhInfsFWFqLStKP
X-Proofpoint-GUID: VSzStdRTRqwzeI_PgqhInfsFWFqLStKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=527
 suspectscore=0 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240147



On 10/22/2024 3:33 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 22, 2024 at 01:36:38PM +0530, Taniya Das wrote:
>> Enable the SA8775P video, camera and display clock controllers to enable
>> the video, camera and display functionalities on Qualcomm QCS9100.
> 
> Please mention the board / device rather than a platform.
> 

Will update in the next patch.

>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   arch/arm64/configs/defconfig | 3 +++
>>   1 file changed, 3 insertions(+)
> 

-- 
Thanks & Regards,
Taniya Das.

