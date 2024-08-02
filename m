Return-Path: <linux-arm-msm+bounces-27757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8081D9456F3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 06:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B4681F24278
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 04:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D731C2BD;
	Fri,  2 Aug 2024 04:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JoWQZFVy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92EB1849;
	Fri,  2 Aug 2024 04:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722572653; cv=none; b=GCpt7B+rzDxqqlk+yri1f3FTPqI10DbcTceYcMhJqXicF1nRBmgcnwjnnuaWKJ6IJ+xeiYTLU3gVWxRA5P+7wlIeD2pGbobxhWQGZBCIrbuVwJ37lIspmbW7HUK4td7D5PpDupcIQhKNE7HbpU2LA8lYUZmJk7c7BHVPg3kxux8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722572653; c=relaxed/simple;
	bh=QmNwr3lsB5Zwkp+KlwWIdj9bsNKp3PtP6oMvA/7wYT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sfN8r6Gxt4QVUxq/HGqbdyOj7B9vDdot4rqchaiVGSh1djWHarN83V9xPdOgKfPFg7cbIsWk5b1mH0Czk/gcFjlIcH5bopgZ79IbjJEjunTBGmproXnUbV/FhiQbGudT+uSHbzm5yxdU8BgYeNulDmsXlz+H9gCr6QsWDqcluL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JoWQZFVy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471LaP75030334;
	Fri, 2 Aug 2024 04:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yc4I7idyrxzQa/AbB5FzqC6ekVPfwrY+aDIwwsos468=; b=JoWQZFVyDRJyENAS
	VX77AYfJv4NSDZDUyaO9PHKZTq3Yv/T7ZJQqmziasgWeqxq1UWUnyWm5pC58sGhY
	fx/BoAgq+bbnLBtr+HK2piGyYbfSweHSeWRLENoGtHme7OK8HvUiJiI3KlN3hHyN
	99Dc09hUyQllEh4UOkTCT/cw2mGo/X9Zf6Y7tx/jzjCfvD8DPFgxTIOgM9sgtaL2
	vU24PBRDgWontnWKwOLsTssS9UmQUVUrNKg4/CC1r0O5ZPiM1VFDJJshHEB4ZrGC
	sNsJoAbruBxo4qfihUc78M1TEhjWb9cIhBz+HXaWK31kVz/qC/+ZsAsFbZTTAyDK
	4q2Izw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje38nmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 04:23:29 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4724NSkJ023055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Aug 2024 04:23:28 GMT
Received: from [10.216.16.55] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 21:23:21 -0700
Message-ID: <15eddfa1-aed4-b18e-dfbe-ab23bb411873@quicinc.com>
Date: Fri, 2 Aug 2024 09:53:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 0/6] Add Additional algo mode for inline encryption
Content-Language: en-US
To: Mikulas Patocka <mpatocka@redhat.com>
CC: <axboe@kernel.dk>, <gmazyland@gmail.com>, <agk@redhat.com>,
        <snitzer@kernel.org>, <adrian.hunter@intel.com>,
        <quic_asutoshd@quicinc.com>, <ritesh.list@gmail.com>,
        <ulf.hansson@linaro.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-block@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dm-devel@lists.linux.dev>,
        <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_viswanat@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20240730115838.3507302-1-quic_mdalam@quicinc.com>
 <cbf18ce7-f9bd-c05d-d22-f56ca4ae3240@redhat.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <cbf18ce7-f9bd-c05d-d22-f56ca4ae3240@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YCUjs79D2phKMszWOC2fayLXduWCRL5F
X-Proofpoint-GUID: YCUjs79D2phKMszWOC2fayLXduWCRL5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_01,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408020027



On 7/31/2024 6:18 PM, Mikulas Patocka wrote:
> 
> 
> On Tue, 30 Jul 2024, Md Sadre Alam wrote:
> 
>> This series of patches add additional modes for inline encryption
>>
>> This series of patches depends on [1] Add inline encryption support for dm-crypt
>>
>> [1]: https://lore.kernel.org/all/b45d3b40-2587-04dc-9601-a9251dacf806@opensource.wdc.com/T/#ma01f08a941107217c93680fa25e96e8d406df790
>>
>> These patches tested on IPQ9574 with eMMC ICE for raw partition
>> encryption/decryption.
> 
> Hi
> 
> I discussed it with Milan Broz <gmazyland@gmail.com> and we concluded that
> there is no need to bloat dm-crypt with this logic.
> 
> We believe that you should create your own target (like
> "dm-inline-crypt"), it would work like a linear target and it will attach
> encryption requests to the bios that it processes.
> 
   Thanks for reviewing. Will create new target driver "dm-inline-crypt".

> Mikulas
> 

