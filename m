Return-Path: <linux-arm-msm+bounces-33331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBD999260D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 09:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80FA4281077
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 07:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17560172777;
	Mon,  7 Oct 2024 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GmWzylDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72736849C;
	Mon,  7 Oct 2024 07:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728286219; cv=none; b=GnNHinTYYUQHdymTZ1umDvJA9lyHk90T3LFxY/vpA8Tt9wPTTHR8/OgOLmQ/1Z5Do0cQUXD3pHJs7PkGf86PIib1+h7K5rP1z4DC+zgsgMTAAtQnljqUQI+UfbbQ/eSDSYia1aHeyJ1bnm/z/CNAaq2yGg3vDqkQ3KnpE5+NG0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728286219; c=relaxed/simple;
	bh=aLoMZdxh3uOEpqG7Uu0zzP8VAX/KYgDgxjPn8P77cjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VN+AAPPzTEn3grPuoOBPLRwfBgMW+nOytyIfOXKuQc9sJCu5iNxLGr/ogsb8BtKvvtMdDHKuek4npoz38/J9Wp5BNo0jUc+4EKeb7zp0rI/6K8jKbSiC5frV0Myrh+3CPwhNy8fKhKO/t8BZcDHpX7GnKAJEvcdJ93Llld2RH/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GmWzylDZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974TBk0019257;
	Mon, 7 Oct 2024 07:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hQjau/0hro0QRYXRVJnoranDlNsLogdZXe0NM9u0PY=; b=GmWzylDZx0TxzyKw
	6AwnoejTM3r3b51gtPbVgVhouxAR0OnRbdl9GwLoNhjrcbnBtzC6puLfWKRiXIMk
	JE3065NTAkmvdTaJnljzCnUc2h786yzMSJZ42CYJrNlyn0LulDCeKWkbQkbfCj1R
	ivEhauNDXyhkSDEjBe5Gk0fzwTXyRASSyvMvHfEVZuKv9VE9m3YE8I+rWbyOaJ1u
	UQ5pRHikeMhUIDF+tGy12bIo+gVvUDCDg1Uy15zK18BRipT6u9mt5QIys2xTJmww
	bGVFshAJOa9tWTj7w+dzyhMa205s46alLDY8EhUixIAwDFy8T1bHdckNXlyJpS4K
	ujGN9w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xsn3bpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 07:29:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4977TsmY010821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 07:29:54 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 00:29:49 -0700
Message-ID: <489b3828-521a-712e-3976-9496ee4e4f9b@quicinc.com>
Date: Mon, 7 Oct 2024 12:59:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC V3 2/4] firmware: arm_scmi: vendors: Add ARM SCMI QCOM
 vendor protocol v1.0
Content-Language: en-US
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <sudeep.holla@arm.com>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, Amir Vajid
	<avajid@quicinc.com>
References: <20240702191440.2161623-1-quic_sibis@quicinc.com>
 <20240702191440.2161623-3-quic_sibis@quicinc.com> <Zo14-rQ1Jaxh5Idi@pluto>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Zo14-rQ1Jaxh5Idi@pluto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EZzSVUvzsiA3KBDQvOmyGo_ygzqMdgRj
X-Proofpoint-GUID: EZzSVUvzsiA3KBDQvOmyGo_ygzqMdgRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410070052



On 7/9/24 23:22, Cristian Marussi wrote:
> On Wed, Jul 03, 2024 at 12:44:38AM +0530, Sibi Sankar wrote:
>> The ARM SCMI QCOM vendor protocol provides a generic way of exposing a
>> number of Qualcomm SoC specific features (like memory bus scaling) through
>> a mixture of pre-determined algorithm strings and param_id pairs hosted on
>> the SCMI controller.
>>
> 
> Hi Sibi,
> 
>> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>> Co-developed-by: Amir Vajid <avajid@quicinc.com>
>> Signed-off-by: Amir Vajid <avajid@quicinc.com>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>   drivers/firmware/arm_scmi/vendors/Kconfig     |  12 ++
>>   drivers/firmware/arm_scmi/vendors/Makefile    |   2 +-
>>   .../arm_scmi/vendors/qcom_scmi_vendor.c       | 184 ++++++++++++++++++
>>   include/linux/qcom_scmi_vendor.h              |  39 ++++
>>   4 files changed, 236 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/firmware/arm_scmi/vendors/qcom_scmi_vendor.c
>>   create mode 100644 include/linux/qcom_scmi_vendor.h
>>
>> diff --git a/drivers/firmware/arm_scmi/vendors/Kconfig b/drivers/firmware/arm_scmi/vendors/Kconfig
>> index 7c1ca7a12603..6bff4550fa25 100644
>> --- a/drivers/firmware/arm_scmi/vendors/Kconfig
>> +++ b/drivers/firmware/arm_scmi/vendors/Kconfig
>> @@ -1,4 +1,16 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   menu "ARM SCMI Vendor Protocols"
>>   
>> +config ARM_SCMI_PROTOCOL_VENDOR_QCOM
>> +	tristate "Qualcomm Technologies, Inc. Qcom SCMI vendor Protocol"
>> +	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
>> +	help
>> +	  The SCMI QCOM vendor protocol provides a generic way of exposing a
>> +	  number of Qualcomm SoC specific features (like memory bus scaling)
>> +	  through a mixture of pre-determined algorithm strings and param_id
>> +	  pairs hosted on the SCMI controller.
>> +
>> +	  This driver defines/documents the message ID's used for this
>> +	  communication and also exposes the ops used by the clients.
> 
> operations
> 
>> +
>>   endmenu
>> diff --git a/drivers/firmware/arm_scmi/vendors/Makefile b/drivers/firmware/arm_scmi/vendors/Makefile
>> index c6c214158dd8..c1d6a355f579 100644
>> --- a/drivers/firmware/arm_scmi/vendors/Makefile
[...]
>> +++ b/drivers/firmware/arm_scmi/vendors/Makefile
>> +	if (ret)
>> +		return ret;
>> +
>> +	msg = t->tx.buf;
>> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
>> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
>> +	msg->param_id = cpu_to_le32(param_id);
>> +
>> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
>> +
>> +	ret = ph->xops->do_xfer(ph, t);
>> +	ph->xops->xfer_put(ph, t);
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_scmi_get_param(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
>> +			       u32 param_id, size_t tx_size, size_t rx_size)
>> +{
> 
> Similarly...and looking at my past ramblings...this rx_size is the expected RX
> size AND also the size of the provided *buf too, right ?
> 
>> +	struct scmi_xfer *t;
>> +	struct qcom_scmi_msg *msg;
>> +	int ret;
>> +
>> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_GET_PARAM, tx_size + sizeof(*msg), rx_size, &t);
>> +	if (ret)
>> +		return ret;
>> +
>> +	msg = t->tx.buf;
>> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
>> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
>> +	msg->param_id = cpu_to_le32(param_id);
>> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
>> +
>> +	ret = ph->xops->do_xfer(ph, t);
>> +	memcpy(buf, t->rx.buf, t->rx.len);
> 
> ...so that this memcpy is safe since rx.len is equal to rx_size by construction
> (if I read correctly my past review/mublings...)
> 
> ...in that case maybe, for better clarity you could re-name the rx_size
> param as buf_len and have it following *buf in the param list...
> 
> 
> ...sorry for not having spotted this naming/order niptick earlier ...

the only caveat being rx_size can be lower than the tx_size
and we dont't want to copy more that what we expect. Addressed
all your other comments from the series in V4. Sry it took a
while due to its dependency with scmi perf changes. Thanks
again.

-Sibi

[...]
> 
> Thanks,
> Cristian

