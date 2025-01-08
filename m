Return-Path: <linux-arm-msm+bounces-44320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8758A0535D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 07:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E057B1651E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 06:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AA51A83F9;
	Wed,  8 Jan 2025 06:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="myCwcFpr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B6F15852E;
	Wed,  8 Jan 2025 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736318549; cv=none; b=C39IAwFqBgl4FAyBOhdsFtEJu/4JorG5muZHKEZh/WcuA3wV0+GnvSlIiqW8GtpIb4lhdYx9ygM45xPyOCis7OylDFCLmgPFirhv7j+f3f/w/p0oFer5TSEroWSnkCi0oMsTMByFzEQ8lTNR3mE01DbAixSv7jWdJpwkxk9TK6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736318549; c=relaxed/simple;
	bh=Frd5d+So7TskOsopHuWut+cQ4qx3mlGTfHkwDm1mZD8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=BlZtL4VpY8s4j1y9+HbDVnYLe4lBNPQ2npbnrHemkkFffr2CvQ7jtDW1LCiRGf5EiB6Va3WiOtbqqELBOxprlByN70VbJXOlK6gKIQ+J/YO0BKaJk/i84sl7YMtT3pbnPf44cuN9GcuaU9kKtTmomUyjtG80zwuzKjYkfl1DQVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=myCwcFpr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5083nvT9007264;
	Wed, 8 Jan 2025 06:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YZ0yIDJ9HFhnAvtpJBGdsr9ieGq4lZ6bLNIGbPcTjKA=; b=myCwcFpr1GkqCWdD
	U2V0gF6bhPLwTgHnaMn0kqDz4ZczzaHiGPpMd1m8Vluhvxieu2unzq1wmRmZIjVx
	LAlLUCr60PM3gNiUCOCBdz8WNocWJLG79FC9Q4QLwADSM1XWG1i7m53HYKpDUOcz
	klqXZI6VsrR9rUmGJgydWPVnL4uj/38vitKW+osrA3BymspRlyKGDrlXvhZV1oZB
	Plp0M/Kcb2sH/7TbZ0oDgFMlJhcnjNeRrovPVHG1NveQA5c+BDCUR1JYNbwkeNDX
	vzIgm2MinRfZpSrFwuBwpEXAwDtGr6uwhkMlMCwHJdfRmq62B6Nfzl8ezt9Dlurk
	LjtD2Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441ht58bbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 06:42:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5086gMjL018827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 06:42:22 GMT
Received: from [10.50.31.204] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 22:42:17 -0800
Message-ID: <3ee41b72-774d-4080-9c3b-3dfeb6babba1@quicinc.com>
Date: Wed, 8 Jan 2025 12:12:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/8] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Gokul Sriram Palanisamy
	<quic_gokulsri@quicinc.com>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mathieu.poirier@linaro.org>,
        <konradybcio@kernel.org>, <quic_mmanikan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <dmitry.baryshkov@linaro.org>, <quic_viswanat@quicinc.com>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-5-quic_gokulsri@quicinc.com>
 <ligcw5ndzuu4kgegxb6f3ttzpmw6iglyzq5kt4l45xyeemsfsr@f2735qq7frhk>
 <d07ce5a7-43a3-48d0-90c9-55ff7a34d650@quicinc.com>
Content-Language: en-US
In-Reply-To: <d07ce5a7-43a3-48d0-90c9-55ff7a34d650@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aeIP3m7hnfEIqtOOx0VyLWekbY6d4nXv
X-Proofpoint-GUID: aeIP3m7hnfEIqtOOx0VyLWekbY6d4nXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=455 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080052



On 1/8/2025 11:59 AM, Sricharan Ramabadhran wrote:
> [..]
> 
>>> +#include <linux/firmware/qcom/qcom_scm.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/io.h>
>>> +#include <linux/iopoll.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/of_reserved_mem.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/reset.h>
>>> +#include <linux/soc/qcom/mdt_loader.h>
>>> +#include <linux/soc/qcom/smem.h>
>>> +#include <linux/soc/qcom/smem_state.h>
>>> +#include <linux/mailbox_client.h>
>>> +#include <linux/mailbox/tmelcom-qmp.h>
>>
>> This will require mailbox maintainer to first accept the tmelcom mailbox
>> driver, and share a immutable branch with me (or we have to wait until
>> this include file trickles in).
>>
>> Please ensure that mailbox maintainer is aware of this request.
> 
> Hi Bjorn,
>   The plan is, in the next spin of TMEL[V3], tmel driver will take care
>   of routing the request to either SCM(or)TMEL, so that client drivers
>   like rproc/crypto etc which requires those secure services can be
>   abstract (ie) just do a mbox_send_message with a SCM cmd id. That way
>   for adding any future secure services in client drivers, nothing
>   extra needs to be done and this will avoid this header dependency
>   as well. Is that approach fine ?

Ok, with more thought, i guess this approach will not work. Will stick
to what you are suggesting, just use mbox->chan available in client
itself to take the decision.

Regards,
  Sricharan

