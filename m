Return-Path: <linux-arm-msm+bounces-38570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 612699D43A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 22:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D614C1F228B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 21:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD6F1A2545;
	Wed, 20 Nov 2024 21:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XhOXPBLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ACD16F0CA;
	Wed, 20 Nov 2024 21:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732139334; cv=none; b=Q96GzEVA+MEUodmHLJjsYRCQQ2Q7BmAiwin1aAah3xWrrm9/mg1rgnOQpDSD9/veQfWdn/QnAI3+Cvbs+ozHGmakIfzHETRZMRmtpcGFYIGKFad66NHF/Gb26aQ5DWR7RQzOWIch7t9X8lfrrrTT4hPRPSuDAAPcNw4oviNKifE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732139334; c=relaxed/simple;
	bh=MCCVk9QeEf65CLnIkhrYJ6SaHER11M7n5GE6mlwgDZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pMstXh4HguF4vV7KjI5QeQurdKhbywiV72WE0uyYiS5MC+ZU9z4TQqPjkyHBDidQYvKXZ/3BbJ8zgswxYNhUf7HvvfyxmppQ+2nD3v2bP7TotjzQt/qAO0YFauZD1HyZtF1Qt9giNqg2sQaHDVkJvWJN8r9EXXajDhYKbCWFr9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XhOXPBLP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJpaJB005741;
	Wed, 20 Nov 2024 21:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbzXMMBGeHBIuLI+O1/0RSTNzqyyDni0fx8RrTrpu98=; b=XhOXPBLPQp0j0CdC
	3aXhN6Rjo1SzsJQJcqa0pTDZ+Wc7NZjbdWFgvksg7Vl7EOuKtTqoL/+Tunrxlq7M
	uZPDKLlRFAtGtQBe8U1XCL7+INSwJtkB+r8mQtWftlUYdfvuSRT6wE0bHooIL0Is
	OCDaIU15KGCB5+T1IU4thVi8H205bFFab8Fg1TW0tbCW5u82fRVMQ7ReU0RObEAS
	HXmnkNaWbQciyJm9JmKx7uPjWVLJKiKb0rBjcpeFAp70MBnnCi2PfS1S8r/tQCMN
	EDt2wA/4nMV+oQmwsAAGSb9MDGED3TfHc6hW6OWxfethZJJMHivqm774RXeyNZqP
	qIvSjw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7y8dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 21:48:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKLmjsb017752
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 21:48:45 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 13:48:44 -0800
Message-ID: <fbb61e9f-ad1f-b56d-3322-b1bac5746c62@quicinc.com>
Date: Wed, 20 Nov 2024 14:48:43 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH net-next v2] net: wwan: Add WWAN sahara port type
Content-Language: en-US
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Jerry Meng
	<jerry.meng.lk@quectel.com>, <loic.poulain@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20241120093904.8629-1-jerry.meng.lk@quectel.com>
 <863ba24c-eca4-46e2-96ab-f7f995e75ad0@gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <863ba24c-eca4-46e2-96ab-f7f995e75ad0@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3dd5OcwDBucLlhiiyO3ggAhMH_df5lX-
X-Proofpoint-GUID: 3dd5OcwDBucLlhiiyO3ggAhMH_df5lX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=736 clxscore=1011 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411200154

On 11/20/2024 1:36 PM, Sergey Ryazanov wrote:
> +Manivannan
> 
> Hello Jerry,
> 
> this version looks a way better, still there is one minor thing to 
> improve. See below.
> 
> Manivannan, Loic, could you advice is it Ok to export that SAHARA port 
> as is?

I'm against this.

There is an in-kernel Sahara implementation, which is going to be used 
by QDU100.  If WWAN is going to own the "SAHARA" MHI channel name, then 
no one else can use it which will conflict with QDU100.

I expect the in-kernel implementation can be leveraged for this.

-Jeff

