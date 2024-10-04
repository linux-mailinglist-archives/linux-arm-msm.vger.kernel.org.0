Return-Path: <linux-arm-msm+bounces-33077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6F198FE3D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 09:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A65C283412
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 07:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E2313C8E8;
	Fri,  4 Oct 2024 07:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="flcGdCzW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30602209F;
	Fri,  4 Oct 2024 07:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028625; cv=none; b=PN/CnS3Q4HWYn910DRwTas84c87npzkluNdAKrOXinQKWOHyPrwCKeJ7HaFUvP+s5PrDPV06N7S6GGigKDUNDFG3BnRWUt5NgQH27krWlGZtNnf0hJ5Nftx1QRk3RC3dwnnj0wZ0DUBWMGvfMD392jPUAIpIvz5oc21CS6eEtzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028625; c=relaxed/simple;
	bh=vKItct9zqyrlNmjqjGVmodbGPqw0IvHUm/p+teN9uOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KFnWhTCHDj+Fwia9Zw9J82FShoxPUOtvsfrtfieQbzJ9Dx/c0H3Hj8/wPivZRm514C1G124l9GeCq11sQ863mCCI+z2mxPkSjwhTHuEywYjWEhrLyhgFeKQmef+vNhhaFpc3qwM0R1+MBAJ56X3YVQxxQTVRwSdnFMwYL6H55yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=flcGdCzW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493I107p028279;
	Fri, 4 Oct 2024 07:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQ0IyKm1+hfb6F6atsLeB6XKRGBHzjMU8+yIDdOLrKM=; b=flcGdCzWHl6OQ54f
	sEO5OY7ZPHJCgta3ZPUEBdMKdAn6PCfyXbQhjEmEj0xwQ8sB2n5pb04RFmWBnCsw
	mVDHpoJm9q6wNDntVllwMd9KBTyBMwil1A6AKEMWpfkHv+zsyoRfJzUR2Jq76X3N
	EQ72WOYxkbz8w03OPf1xTvM37WiOlk1lta6j4Kd5440y0G+eaawTfdD7JdaNjUVA
	ieq+yceO/aI7jwWriMWecPLbgg1c9pP/dMaihYk3bw2wANe2ymGVmPKoq6KmLGTV
	vU5ZMdRZ7kbMmENuXYADyEiIeuOs2bLTjLh4JTk9I5rxc1D0kh/+g9Y8Mc3DzqmV
	9yEVkw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205jhdbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 07:56:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4947ubbD012090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 07:56:37 GMT
Received: from [10.50.18.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 00:56:30 -0700
Message-ID: <134665ba-8516-4bca-9a56-9a5bbfa71705@quicinc.com>
Date: Fri, 4 Oct 2024 13:26:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 7/7] arm64: defconfig: Build NSS Clock Controller
 driver for IPQ9574
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Devi Priya
	<quic_devipriy@quicinc.com>
CC: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <p.zabel@pengutronix.de>,
        <richardcochran@gmail.com>, <geert+renesas@glider.be>,
        <neil.armstrong@linaro.org>, <arnd@arndb.de>,
        <m.szyprowski@samsung.com>, <nfraprado@collabora.com>,
        <u-kumar1@ti.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-8-quic_devipriy@quicinc.com>
 <rlqrgopsormclb7indayxgv54cnb3ukitfoed62rep3r6dn6qh@cllnbscbcidx>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <rlqrgopsormclb7indayxgv54cnb3ukitfoed62rep3r6dn6qh@cllnbscbcidx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XRmzgI5jmiao7LS4RLpEr8vrY7ybQ_n8
X-Proofpoint-ORIG-GUID: XRmzgI5jmiao7LS4RLpEr8vrY7ybQ_n8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=988
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040056



On 6/26/2024 11:44 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 26, 2024 at 08:03:02PM GMT, Devi Priya wrote:
>> NSSCC driver is needed to enable the ethernet interfaces and not
>> necessary for the bootup of the SoC, hence build it as a module.
> 
> It is used on this-and-that device.
> 

Hi Dmitry,

Sorry for the delayed response.

NSSCC driver is needed to enable the ethernet interfaces present
in RDP433 based on IPQ9574. Since this is not necessary for bootup
enabling it as a module.

Thanks & Regards,
Manikanta.

>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> ---
>>  Changes in V5:
>> 	- No change
>>
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index dfaec2d4052c..40a5ea212518 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1300,6 +1300,7 @@ CONFIG_IPQ_GCC_5332=y
>>  CONFIG_IPQ_GCC_6018=y
>>  CONFIG_IPQ_GCC_8074=y
>>  CONFIG_IPQ_GCC_9574=y
>> +CONFIG_IPQ_NSSCC_9574=m
>>  CONFIG_MSM_GCC_8916=y
>>  CONFIG_MSM_MMCC_8994=m
>>  CONFIG_MSM_GCC_8994=y
>> -- 
>> 2.34.1
>>
> 


