Return-Path: <linux-arm-msm+bounces-71423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3956B3EBE5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 18:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BFDA1885F84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 16:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793732E6CAB;
	Mon,  1 Sep 2025 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kl0c3/a6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A65713E02A;
	Mon,  1 Sep 2025 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742920; cv=none; b=E8n6Jpige6s7zS5ujl04sz1S2LMY5/YdQHSncQzSWcBmZHgtryCUDKXmYhBjjKTOiPdQvNmTDPW1lTuMH37u3ewl34eLF95XVZO2XP/FOjDbD0V4tQ6NynhVNzfVynhjsjom1NHdTGoMqPngEU/Ej2UHvpgzC4vpN8b+jS34uJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742920; c=relaxed/simple;
	bh=EqeoXDvX4Ec7OVi70BK9y0ZJUtPChN7RnVzhxWXW0xA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ceY6Rvi3ykPHvS5y48Hhz8OU7jRQBECgwLU3FwslfJ5RSp0EeRIJOW4SRfXyxuNpGnAvhsBww1DRMT4TC5BaCmZ1ZYUB0N5li3me3EjQxm1G93aDy8FvdBHu7vWBVgU0U8asbVq+cnzr9qPGx7hNConHKoHXF2y74wyA+9KLQrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kl0c3/a6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4KB5015350;
	Mon, 1 Sep 2025 16:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8NHbnWA+ivENT66Nk4iYanDhKZZcbI1nQw9qnGL0QzM=; b=Kl0c3/a6dcN8+wt+
	E8q1c5TiWkCSDeMFZ8qEneTZ/4NLbs9FLHJzW8Jy5HhLAMcpb50sSy4kZobmTy0N
	ut1q5qCN7pl7PPTO7fh8gaC5LpnxautUE/Qgdg7kXGa8r6VLrgo6AfpW3sWpfOXl
	5HEveiY//dFDBAOBd0wFFLwX8P8e+hPNRZ/0FXiJ46lE5CH6f3EbzzDTSKRK4STc
	V5tpr2kYiPQim5CkhHH4GTl81cQL6i3r1FHpTpSfOP8AfjTivg7iT5vyf5vFrwZO
	mQDgHdMXRDTJz9pvIClNWM/VuPxCE03gRlg4KRDRT3M6IteCE2kxF4GWHeQ1unLy
	D/sexA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utfkd63h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 16:08:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 581G8XJb026669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Sep 2025 16:08:33 GMT
Received: from [10.216.44.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 1 Sep
 2025 09:08:28 -0700
Message-ID: <1efa429d-7576-49da-a769-b1eba9345958@quicinc.com>
Date: Mon, 1 Sep 2025 21:38:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/5] scsi: ufs: core: Remove unused ufshcd_res_info
 structure
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ram Kumar Dwivedi
	<quic_rdwivedi@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
 <20250821112403.12078-4-quic_rdwivedi@quicinc.com>
 <1ccecf69-0bd8-4156-945d-e5876b6dea01@kernel.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <1ccecf69-0bd8-4156-945d-e5876b6dea01@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=eaQ9f6EH c=1 sm=1 tr=0 ts=68b5c502 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=2ANJes_M-wHGjwGGIWkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: baEnfMBlZR06je6vcouClH91UY1MjV6O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MCBTYWx0ZWRfXz+Lr2ypsoGVA
 fvl6l4jVny94Npt2x20KpJaxFMPEfpZVdsvCugGNvymdT7q0VP5tFytfRt4BbyWal3xmdwUeE+H
 dzffcQb3kARYwbXUHm3ZFuDLQl7EiiA5wm1uXz95Pjv3YpJLe95iqcXrYhBT894N1E8+OJZB170
 DGYHXMhYb0WanT/hIS8+YUBeCdBD1zE1dStdubPTcsu/cFe/ny5XhU4lx+7Tafl+sgVHVRR0REb
 FWJNkrWPuG4XXMwYviDt96ZjBGlyXXieAtuUa9PXzwcPOFCB5vS75g9BNEJApKrS/GQooDFnegO
 85PHvwOFJKfo5QxhKJLcJIf1kCKHI70yUMBnG0CLxxUQfkNOXuIPxwxWK4byUP2meeEPsL9nYD+
 ES0bBnx7
X-Proofpoint-GUID: baEnfMBlZR06je6vcouClH91UY1MjV6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300040



On 8/21/2025 5:18 PM, Krzysztof Kozlowski wrote:
> On 21/08/2025 13:24, Ram Kumar Dwivedi wrote:
>> From: Nitin Rawat <quic_nitirawa@quicinc.com>
>>
>> Remove the ufshcd_res_info structure and associated enum ufshcd_res
>> definitions from the UFS host controller header. These were previously
>> used for MCQ resource mapping but are no longer needed following recent
>> refactoring to use direct base addresses instead of multiple separate
>> resource regions
>>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Incomplete SoB chain.
> 
> But anyway this makes no sense as independent patch. First you remove
> users of it making it redundant... and then you remove it? No.

Hi Krzysztof,

The driver changes are in the UFS Qualcomm platform driver, which uses 
the definitions, while ufshcd.h is part of the UFS core driver. Hence 
kept in 2 separate patch.

Thanks,
Nitin

> 
> Organize your patches in logical chunks.
> 
> Best regards,
> Krzysztof
> 


