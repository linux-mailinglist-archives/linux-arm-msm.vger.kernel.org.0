Return-Path: <linux-arm-msm+bounces-63598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D1AF86B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 06:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F88D7B4BD5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 04:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1004F25CC46;
	Fri,  4 Jul 2025 04:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BHwWAbh/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE98D252906;
	Fri,  4 Jul 2025 04:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751603025; cv=none; b=dZq99vBxXm5yjaKCzuSK6Z/SxZPgucgJWEN07jajBIKTZ7+Fo4a6AdSK2N2UlLBPYDruxsCTvUjkkFuFAnh/ko9jHJ3anzO5aqNcpTDvRYcSxzxsBjYLluNSxtiwV6llTLBiK0L3HTnDJchTVWDaSc9LC74axiCJ9Tu3vDQdCdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751603025; c=relaxed/simple;
	bh=OvxNdnQ74uQ8nHm62YANOFxLGZf31u+IHThS/kjFuPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t0NHVeX+OprMzYmLOs1VXDfGchJqSvwR7YanGPFKfZlczipua2tfqOO7Fa7Np8HNDeCmIWA4jDGCJd2jPgiuZ7Kp3c1j5i4TlzJnyLY/9R2jE+APPG3c2pesyck07R43k2xqUYZQ6ToqHduBqyUFt/MVW1eU49+VIjZZAWELOFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BHwWAbh/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HC8Ol032128;
	Fri, 4 Jul 2025 04:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0445/eYFRFumWInKkw8yHbZRIG87CvsShAGp/8DDfM=; b=BHwWAbh/GnAh1N3r
	pYeRrs24JxXmThQAVOIb/3QJKh0s9o2mq8p0wBl72lny316AGfDvK4jFF7ICriru
	ehDFxdpzrBYH0YIuHF27Nl2aHnI16bbQ38zCjJvE3MTZwewYqUOQaJFOU+925nHr
	MzuYfVoUn57pOoLT/zrIc0drSJc7sQm+NroHNNn8Qqv87YgX6XLJAxY6dcHrW6ge
	GPWYWMIwKWwnnfhZAlMYcKyLAs0Qcn1wobqhe3PZb/UVZZFhsWfio6bZTNCrjdZV
	b/1YK1y+VoI1ONex46XReZde2e28PL5ISwXEAxV9Z8HG29iLxhJpmZd4Rh4j8K+O
	VP33KQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kjspr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 04:23:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5644NGBL014989
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 04:23:16 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 3 Jul
 2025 21:23:13 -0700
Message-ID: <8e82f971-8a1f-45c9-8f8a-9ef17f8c1a70@quicinc.com>
Date: Fri, 4 Jul 2025 09:52:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/2] scsi: ufs: qcom: Enable QUnipro Internal Clock
 Gating
To: Avri Altman <Avri.Altman@sandisk.com>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
        "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
References: <20250702151441.8061-1-quic_nitirawa@quicinc.com>
 <20250702151441.8061-3-quic_nitirawa@quicinc.com>
 <PH7PR16MB61965FA0A8DFB0877CE51690E543A@PH7PR16MB6196.namprd16.prod.outlook.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <PH7PR16MB61965FA0A8DFB0877CE51690E543A@PH7PR16MB6196.namprd16.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68675735 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=_CqmqpiUMaDpWP_MQkcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDAzMCBTYWx0ZWRfX1rVDcQz/8tkk
 t2bHvTp1GVrWqn612/I6Wwc/hSj9281TBi+8HkNODnfutSOVcnoVFVlLAOzpyZNc4jxWBJZdrtY
 i0DQiWc2qUP0heQQt+slcFNc+VdW0mjMsANIPt6CsBt1eQ6Mly7JnnFg6plSehF4RmaEl7Kdy35
 HjnsysDE474Zq853hOsk/OIwaU1nLoE3EXlZVo8J6M5d6Dbc6SVnweaIfl2U3eGuasGiJYn1S+q
 ZvqKpnZo6yxLjyWN/xtwMHiGswG+f4bWomxfyNqsZ7lCqH7aer0Hvwc7RuElvhqTr5VtQvatUri
 cpHESqj10qZA93MbXSWwKq+ctZzuJSey4Z+I7NodxYqrJHNGGsIvms7jac3Z6xDaGqg9Ndi0eIE
 O4qXW3GFPTs+AVuaghUcR+S0L8OJgm94XcpVtxZRItFCQIpsUgbCK0cYji6C020VoPCQiziZ
X-Proofpoint-ORIG-GUID: Bu5w3aQGuQdg0GM0yBlkBtd4UbhL-wkU
X-Proofpoint-GUID: Bu5w3aQGuQdg0GM0yBlkBtd4UbhL-wkU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040030



On 7/3/2025 12:13 PM, Avri Altman wrote:
>> +/**
>> + * ufshcd_dme_rmw - get modify set a dme attribute
>> + * @hba - per adapter instance
>> + * @mask - mask to apply on read value
>> + * @val - actual value to write
>> + * @attr - dme attribute
>> + */
>> +static inline int ufshcd_dme_rmw(struct ufs_hba *hba, u32 mask,
>> +                                u32 val, u32 attr) {
>> +       u32 cfg = 0;
>> +       int err = 0;
>> +
>> +       err = ufshcd_dme_get(hba, UIC_ARG_MIB(attr), &cfg);
>> +       if (err)
>> +               goto out;
>> +
>> +       cfg &= ~mask;
>> +       cfg |= (val & mask);
>> +
>> +       err = ufshcd_dme_set(hba, UIC_ARG_MIB(attr), cfg);
>> +
>> +out:
>> +       return err;
>> +}
> Might be useful to share this with other vendors as well. Maybe in ufshcd-priv.h ?
Sure Avri, I'll move this to ufshcd-priv.h

> 
> Thanks,
> Avri


