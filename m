Return-Path: <linux-arm-msm+bounces-44317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADDEA05333
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 07:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C81E91631DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 06:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1941A76DA;
	Wed,  8 Jan 2025 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IYmcJ/HT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2500D1A726B;
	Wed,  8 Jan 2025 06:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736317777; cv=none; b=ByyfEf/s9meSoZhYFlRIAgfs2lz9Ce/DGz3gWRKsprFkmimEnJ/A0PC8TYBb79crv+jQQ2qY55Y5rtlG0pJ5Dp8ka4M75Nmi9dl0j2RyJFEJ3DjWOM33wbrIb8o6jFVn8vtE7qPo1F7CSkJdSIEE69FUO9scYRpQjjsJWcSk7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736317777; c=relaxed/simple;
	bh=1Eu2PEsX3ae/CUSfWu+3pTwDiETUxSrqDWT/7W1/Qvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VhbtseY2WrdjBPwd9IA2u56qq1bGP/enorTg7aCukhQEwZD1xgGZQfHO2os41ApLR5teQTa8SEkyqRRbNm/wDX/lrx11gIfAqiQwmG0W7dY/6+38ubILx3ZisaeIegbKvHjXWSWrhNSRJOAejjEXmpRnMe7W7Nlx09flAIM3cn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IYmcJ/HT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5083wguI010041;
	Wed, 8 Jan 2025 06:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmWyxdAHRkrWyuaBiPrCNe6aRGpT7xkTybIqsMf1xeE=; b=IYmcJ/HTUGoS0aPS
	6JYW3olcXI5L1Ezt4ilfo4HX2GfZ18g3ANQ2bbyfbEs3kbYJabEL2UVV9hf9d9S/
	/WNu6HlpaapGec0UXAkBL6vSHzx93zwKadKZId3Or/S8hqxSQF0ZO6rZG5ZK3mOa
	FYf6S69mqxkPOvlweGKJqZDtY6MH/bnNRIKT7KAaAse2PxPoPe7Ld+XA4dTnAPgg
	g93h8CkUO+m1PARpaHq1aYjHFRXWuk9sHLRskDr3fxeJc9ixuvfGAATsB9DLz7jj
	Ic8Y8BqIhAloRuNMC/F5N3e+rtg+d0Y4yPLB5u3oDBjJ0HCxeQ8Cp5XaGtcjFj6Q
	Nkzhxw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441hx8g9yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 06:29:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5086TVnY030749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 06:29:31 GMT
Received: from [10.50.31.204] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 22:29:26 -0800
Message-ID: <d07ce5a7-43a3-48d0-90c9-55ff7a34d650@quicinc.com>
Date: Wed, 8 Jan 2025 11:59:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/8] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
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
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <ligcw5ndzuu4kgegxb6f3ttzpmw6iglyzq5kt4l45xyeemsfsr@f2735qq7frhk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1S8TmIx7A2EvGKILSRCdnNN70249r5sg
X-Proofpoint-ORIG-GUID: 1S8TmIx7A2EvGKILSRCdnNN70249r5sg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=395 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501080050

[..]

>> +#include <linux/firmware/qcom/qcom_scm.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_reserved_mem.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset.h>
>> +#include <linux/soc/qcom/mdt_loader.h>
>> +#include <linux/soc/qcom/smem.h>
>> +#include <linux/soc/qcom/smem_state.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/mailbox/tmelcom-qmp.h>
> 
> This will require mailbox maintainer to first accept the tmelcom mailbox
> driver, and share a immutable branch with me (or we have to wait until
> this include file trickles in).
> 
> Please ensure that mailbox maintainer is aware of this request.

Hi Bjorn,
  The plan is, in the next spin of TMEL[V3], tmel driver will take care
  of routing the request to either SCM(or)TMEL, so that client drivers
  like rproc/crypto etc which requires those secure services can be
  abstract (ie) just do a mbox_send_message with a SCM cmd id. That way
  for adding any future secure services in client drivers, nothing
  extra needs to be done and this will avoid this header dependency
  as well. Is that approach fine ?

Regards,
Sricharan

