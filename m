Return-Path: <linux-arm-msm+bounces-14171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 604D487C1F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 18:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 916F71C2034D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 17:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F606FE10;
	Thu, 14 Mar 2024 17:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QQhK3vxm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0CA71B48;
	Thu, 14 Mar 2024 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710436536; cv=none; b=QwHv+AB/D7DmgjqslEC2FnBe/AnDWvvYCjwa8fBRxkVS8RSpWSkQYN3Bq4k+pEjCeQucbdLUCA8Cr0oGkGGleAXgQ2l/IkaCwYGLsEL3JZXw23VcxtMugxqnUyPjfmMsK30+81gNUjY/xgV/aTt7yoogrTkZSPEsxFMmqiGcuyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710436536; c=relaxed/simple;
	bh=ufpv9eHmImj1ZeMfXW/42WU0CukeEiBS1SO5mBHtlKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JNHdt8gKBKSvqXFVb3elGkcK0mczSAhJuZ9Ue9S1i+4XpRt+atPPq6rnaDxFh79XVfEb/hh4kPjvgjsCuOS65ZZIXW6oezIJUNf99zdVOmR/MqjX/Zo2GAWzXdxslJTJnIO2o8fBxjskw38FFqGn/RsC5wYV7cpqUrnPhF9ZzWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QQhK3vxm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42EGXsKT029401;
	Thu, 14 Mar 2024 17:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=0p2GF0Kdi08mgtJSStQ53nkTeryJahRKeHhIuEpikcM=; b=QQ
	hK3vxmI746yKeOvW1zoFYPYh/or5Ku0KBQElL5TJGG3frz5YounQVCKqi9fL22/W
	LuAuRdiD9rhRzvFB7Jzct104tAiqtCedBH7Yu40qail1D56UxNhFwSxKsGxREiz9
	3DkeQ0bMRzPYpG+yRpXm03/8Sjm0q4g6NYlxYu/jR7V5Ddzd94hfPLuurpkGB9lg
	KHwolrG2cEXxvCg7Rva6NUNcZck6xcvwbXL5tmS3GxH/IKWMgn6emYyNuX6yudSV
	BXiZDGVEhTv0fllJaOeBK8S4TLLPvJ5FvOhJs780kXZN5Ozh86ua79Zd5wUvz+SH
	gK4pH2wDER7lg3RgYcFw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuwau96u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 17:15:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42EHFSVe023121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 17:15:28 GMT
Received: from [192.168.142.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 10:15:27 -0700
Message-ID: <43334f03-2ff5-a29d-cdb7-eaf3b80c4d16@quicinc.com>
Date: Thu, 14 Mar 2024 10:15:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] soc: qcom: qmi: add a way to remove running
 service
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        Johan
 Hovold <johan+linaro@kernel.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-2-24679cca5c24@linaro.org>
 <9785a6e6-3700-0b89-b4b5-7981ed5bdd38@quicinc.com>
 <CAA8EJpr0vV4THO=+rNTXmK5YJtQwzfcsWCWHUgU1XaiSEudtsA@mail.gmail.com>
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <CAA8EJpr0vV4THO=+rNTXmK5YJtQwzfcsWCWHUgU1XaiSEudtsA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sJDB1zQK-yiiyWUK5xkUJvsjMSNH4wMp
X-Proofpoint-GUID: sJDB1zQK-yiiyWUK5xkUJvsjMSNH4wMp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 mlxlogscore=795 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403140131



On 3/13/2024 5:09 PM, Dmitry Baryshkov wrote:
> On Thu, 14 Mar 2024 at 02:03, Chris Lew <quic_clew@quicinc.com> wrote:
>>
>>
>>
>> On 3/11/2024 8:34 AM, Dmitry Baryshkov wrote:
>>> +/**
>>> + * qmi_del_server() - register a service with the name service
>>
>> s/register/deregister/g
> 
> ack
> 
>>
>>> + * @qmi:     qmi handle
>>> + * @service: type of the service
>>> + * @instance:        instance of the service
>>> + * @version: version of the service
>>> + *
>>> + * Remove registration of the service with the name service. This notifies
>>> + * clients that they should no longer send messages to the client associated
>>> + * with @qmi.
>>> + *
>>> + * Return: 0 on success, negative errno on failure.
>>> + */
>>> +int qmi_del_server(struct qmi_handle *qmi, unsigned int service,
>>> +                unsigned int version, unsigned int instance)
>>> +{
>>> +     struct qmi_service *svc;
>>> +     struct qmi_service *tmp;
>>> +
>>> +     list_for_each_entry_safe(svc, tmp, &qmi->services, list_node) {
>>> +             if (svc->service != service ||
>>> +                 svc->version != version ||
>>> +                 svc->instance != instance)
>>> +                     continue;
>>> +
>>> +             qmi_send_del_server(qmi, svc);
>>> +             list_del(&svc->list_node);
>>> +             kfree(svc);
>>> +
>>> +             return 0;
>>> +     }
>>> +
>>
>> is list_for_each_entry_safe required if we stop iterating and return
>> after we find the first instance of the service?
> 
> Yes, it just adds a temp variable here.
> 

Ok, I was thinking that tmp wasn't necessary because we don't continue
iterating through the list after we free the svc. I guess it never hurts
to be safe though.

>>
>>> +     return -EINVAL;
>>> +}
>>> +EXPORT_SYMBOL_GPL(qmi_del_server);
> 
> 
> 

