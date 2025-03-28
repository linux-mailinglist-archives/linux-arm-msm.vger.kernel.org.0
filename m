Return-Path: <linux-arm-msm+bounces-52774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE7AA74CC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 15:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7387D18997E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 14:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA131C4A2D;
	Fri, 28 Mar 2025 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UW9FKCgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6361B4235;
	Fri, 28 Mar 2025 14:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172188; cv=none; b=VitagVHpjvbnefeG8qTnRfF94IPhJ0dBhFM4hdn403tp3C1qDwP9WieXZXRM69Kt0mebfGk12lZ0oRvS8BmemfrrAyiYBCfYsQCgw06f+9Sl3UDjBaHA2kPM4a5UdN/+3PNGYAVQ134cFcu3VNwJXzf+HlP5snH57wWKrwP3a2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172188; c=relaxed/simple;
	bh=Y/exLLDHCX3Z8sjPzo+Tq7ukas5heEz+KHU1McNFDdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EPFZWqq6Sho1FtNSE6pUmQFhFtSmtxlJo3IwP2pJrJL/NWY5Lvyobz3KN1lj8z/xv6dtKL3n6/JAlzGyo0SmrJJObFLmM+iWCZ9hhtZUH2vncvO0a5B1WIteu4kZWtYiWVlDF+es/SVsrqQMQTgjD8V4hZbzg1IqyVU7Q7Z69e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UW9FKCgJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S856HH011218;
	Fri, 28 Mar 2025 14:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6NGIQHY4CqP2+W4rV15kcCHVC1zi2EcPSvd5Z1AwSd0=; b=UW9FKCgJL5kkIYZF
	n5oj3AtSdAjSiJUXa4bN8JBZ+yaGEqIEUygGTtq2hXTl6YKD9wkrGklEhPLoE3GJ
	FjqyMDCzC+EehrtyUprAOdQrKgUH3ICkSZVHGvzIMqsEJ5v9oUEzSJ8z5sfT84P7
	6Aso+W+eNNOZS6ig3GSB3VZwtvu6JzXNnWmpanVCtYUbhXREqAxDAMZxotI98D4X
	y2OYdERVhwawaJW41hRJXE0fvke6ntNVj48hZbymH+LnYLroij2YGchB8eEizPzE
	fJ6YJHUycrMxbS71aJV1RvG5wZsRr0A48KfSr/ijY/XsCm3YYJfhWp+Ui6GQ0+Rh
	LPFaoQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nqxuh51s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 14:29:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52SETdD8012326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 14:29:39 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Mar
 2025 07:29:36 -0700
Message-ID: <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
Date: Fri, 28 Mar 2025 19:59:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Markus Elfring <Markus.Elfring@web.de>, <linux-i3c@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jarkko Nikula
	<jarkko.nikula@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
 <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SrTjOU1G05fnxYXje6cxzk331-0KmyQh
X-Authority-Analysis: v=2.4 cv=e7QGSbp/ c=1 sm=1 tr=0 ts=67e6b254 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=P-IC7800AAAA:8 a=6vbhIhILFGkt50-TBsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: SrTjOU1G05fnxYXje6cxzk331-0KmyQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_07,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280100

Thanks Markus for review and suggestion !

On 3/28/2025 6:49 PM, Markus Elfring wrote:
> …
>> +++ b/drivers/i3c/master/qcom-i3c-master.c
>> @@ -0,0 +1,1107 @@
> …
>> +static void geni_i3c_abort_xfer(struct geni_i3c_dev *gi3c)
>> +{
> …
>> +	spin_lock_irqsave(&gi3c->irq_lock, flags);
>> +	geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
>> +	geni_se_abort_m_cmd(&gi3c->se);
>> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(spinlock_irqsave)(&gi3c->irq_lock);”?
Didn't get, hence a question.  Do you suggest to use DEFINE_LOCK_GUARD_1 
instead of existing method ?
> https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/spinlock.h#L572
> 
> Regards,
> Markus
> 


