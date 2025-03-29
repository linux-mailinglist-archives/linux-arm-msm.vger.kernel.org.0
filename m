Return-Path: <linux-arm-msm+bounces-52812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E10F9A75552
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 10:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B227A7A5D4C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 09:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7581940A2;
	Sat, 29 Mar 2025 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cGjRwBM+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37254320F;
	Sat, 29 Mar 2025 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743239347; cv=none; b=gxMG1OoEyFW8WquSBEhyXtD7FoEvJSLWkNTpCl5U84+CdRtYOuKcGA9euTZV2Lt6ePmiqWsfH1t6Zj0OpWoIqWGmMxDAdNd8k1k8dG5XAqQrIxu0h60dLLoSASFE/BJs+3M/BxBbvj4598MRmdZ26KRQhJsjzhl2qqjX/dscIBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743239347; c=relaxed/simple;
	bh=OZn2CPtzCy2mg+HUXte5qQXN6fv5nGc+/md3iFt+lwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tblqGHlHOl8XRjKR4F5cqH6BFVugFaMrQeKz+4Ch4BvxgLfauZOz7KnxDzNc5Oe4PXT1ppQdjbp8KBzKWvNtPz+JVO1nP9P3Vvp3bZxNy+NPKHFUjt0m9g0GxPrLKRW00eqZFQMV/oi/EiXd5837G/aPaU3+1mlM87dfXfRrvCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cGjRwBM+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52T7iR16014825;
	Sat, 29 Mar 2025 09:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXKkzX9mErv+JTwJzYqoSC+oddzi1P03gwtR3Y540f4=; b=cGjRwBM+qPOY6z5L
	kn2EG7HgLQMtGiR+INc9r8dsWY3xKoE/fdJo5zq4rjiABW5KG6Elagmt4iN1Qt0u
	cjCDfGI9DuL/ukufqsZdK4C/wquGMH5WaELR1G1Tea1m1ZLJKSIQVaON3dssss/a
	Y/u1TK6rA89P8mE5NIuXzvxwEzRoQei28P5UgfHl8R/uGaCaXbnyaL7VO0fI2H2Y
	VhW8m0HNVaGMU7ieWaFktAyvlESI6vwgZmQl3jjujFg7ApC208ioznVzGriOpVTH
	28xfFVzbAh4M12PRdD50RdtiXDzvQQDUZokolQtvU6vW++FNPvS2QGZ9FXu1du81
	icPG3A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1nrawj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 09:08:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52T98LSj017793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 09:08:21 GMT
Received: from [10.216.2.59] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 29 Mar
 2025 02:08:17 -0700
Message-ID: <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
Date: Sat, 29 Mar 2025 14:38:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 2/3] i3c: master: Add Qualcomm I3C controller driver
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
 <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
 <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eYBjDdDYgkLTx7i17GLHH1CBL8Dd05E2
X-Proofpoint-GUID: eYBjDdDYgkLTx7i17GLHH1CBL8Dd05E2
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67e7b8ab cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=0umaHvM9SrpUm-h6xacA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503290064

Hi Markus,

On 3/29/2025 12:34 AM, Markus Elfring wrote:
>>> Under which circumstances would you become interested to apply a statement
>>> like “guard(spinlock_irqsave)(&gi3c->irq_lock);”?
>> Didn't get, hence a question.  Do you suggest to use DEFINE_LOCK_GUARD_1 instead of existing method ?
> I propose to pick further opportunities up for benefits from scope-based resource management.
> 
Sorry, still not clear to me what should i add/change ? please share me 
some example.
> Regards,
> Markus


