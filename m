Return-Path: <linux-arm-msm+bounces-98084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OlyACQCuWmJnAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:26:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 745EC2A4C37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD15F303D334
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FB738CFF2;
	Tue, 17 Mar 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p06eLQJG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnx9h1v3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E9438D019
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773732348; cv=none; b=sQDrKyZygxnRKqNaReilFQcpoh8lguuimVpp0ppRGWm24CsTvCzQcjK+8wURoyxGHEw7E6V8gHN/xaZ30tuKsh2w3wGeJh6PcmtCDOmJ9qNw5ZdtpXs9YTjcoaJrfLWJlm9kfnVg//nzkDyQSPOnlr6CVdnPWPUp3nwLm1iPPSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773732348; c=relaxed/simple;
	bh=T1DkRajQ2Fx1FXClOZ3HkTJa4bH+dZfBrnZZ0d76Oqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FOH22Lab4HP3k7TbVkPKDFEGgYZlvOtmQDeOSKRAkbw+gsW+HzXSKf50PyRJHLlB8TwZnZSrmbKQelOdtovsdyOWAuPsCevUXx1fHVfXIiEb9tp0Ap0Z3l+FNg2dpIch5kRhMenHJ56b9W0b4GhCckRqMwuh20to3ZtpN6a2YGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p06eLQJG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnx9h1v3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H1vAGv3102507
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+bwp9lWgbR2lH2flrsKdI0s4t6nnu4OL0fXKGIRvOnk=; b=p06eLQJGUziiak5M
	HoeSS0lgxecHrXzuTGIj3EOPkzKFscrIp1HihVDfm4GmZcJKPcXii+WeaW/YAHwO
	0mwDvjiPwePDOh1VhH2DneE5M3GUdQUEuzrpkhVrh0a00XfRfXwlAvDECH7QXzLN
	JZb4p0YU+qKyhZUBf1y0UIRgtjrr0To69K+pN5UjNvqgdvFEMj/tPYBTFAaJozVP
	8VfDpGhf1zBL3zxE7oeODDzjNAOEWbumPevt+9E2pXmOg3bD5n5R2OvOXjDLmAQN
	y7lw1/cZUT8TiKP9WcSOuEZyD5iFcmPnc08J6RNNybBHzYIHeQABYKxK5uiUWuLG
	S/3Iuw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb7anch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:25:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c74169c1efbso43298a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 00:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773732345; x=1774337145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+bwp9lWgbR2lH2flrsKdI0s4t6nnu4OL0fXKGIRvOnk=;
        b=jnx9h1v32gqCSWe1gAeKk3/pOF4/fq/duvmC5pe/JnIOgVov1mXCvYw+zx3ZW3QdyE
         iZ0zakAhYwWQYw3LT7jLlnRYN6t+g0ezgvEJdK7rKQbVpfz/N1OKQN4dLsbcu6K99NOn
         pUGvkbwbEIkhqS5owo+PEKgkTOFvjUG4dBJlEaAdlgQ9jFsCYx5OobLGRsh9aop/XdoK
         2TZIc92Z2lzMpyxNmC8Pe17Dup5lNNP02Pi95lEj52+z74BJtuuSj/nkruS5h5PFxZuI
         U/DBkRPeW11h6oSCuQd2tzUI40iSO2X4Vtmj8aAPoQrYeGwW00mdbOnamFNJLi8Q+Lus
         Zrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773732345; x=1774337145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bwp9lWgbR2lH2flrsKdI0s4t6nnu4OL0fXKGIRvOnk=;
        b=UfFoU6SQPqcbvCooUJxWtNbWt4wkPXykqYu1ASGXl8FdyypKaKKakHhPgrm8NKtr8v
         ZU0eopEP49HWnJ0NLMknKu3SlixTaGOZQLhCsM6eiWrNvVuS9Pufe7a5SSyOWdiTKFPd
         sG10uaUV1QnYp7ExwU15YwfBEL+QDmzJZlDzd/v1f5xIC27ry3VFOC2CIzhhhPZyzQUB
         T0YZMezkdla74/aaqLXi2iTLDQ63vA61lGJNyBid+Kuy+/Kb8/vMigj5T7CeWhqddPV4
         QhUjocc0Wp5BhZ/73p1lRLkLtd4ynznATyLrkV9YmVZC7MittaigpwJutFiEMbtyMCQC
         NIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5w8VtQBHq5oSGZQGF1QH+KATuZLhQOspI6SIlwFFUcg+D9AWCY8GSHwGY7Pdncj2oz0NULkhDjN0LtoiM@vger.kernel.org
X-Gm-Message-State: AOJu0YyaR9oSWUq+bHznylpVo1OWg5QUkz5ajq516OoOKY/zT7euRzbR
	Mfc1XoD2MCN9fKC7ClkhbacfBs81eBHvurPgvEUDbd73tX2VrxSq3+DDGKDTNc+ZB2qt4K+kKfV
	Dpm9EofaGon/+ffjwroJ2p4CQAh/MRnKfuuiGUrTrbEkiUveHPUeVSkmv/x7LwDLt0tzL
X-Gm-Gg: ATEYQzykSBrLs25XLkJbfG+u1Vqyy6+e26Ni/2ppjPw103EUhXKuW/bl4iib958I7B/
	aS+6kDsXbDsn22H56C9P43OiLgKlvuqGey/6aHhLpxsdA7Iu1PSco2r6bVZKirLZqJR1KzJ36uF
	jvl1AIbQzsndLRusGCbj2YI6omfe1O8BMDuxky/GCsuTibP0nxEWyAjYtUQjpKp5MWtuVSVMFRL
	xW0Bsovl1YURYtQlf8bQ0XmaXR5bW6wwP+RgHpbslLxnTY/zMrrkoCuDSQtJFj+/ysFH6e+FlHR
	EjwTApGGgdqYJIIayJ3cJMeFgb5ZUqWNm06Yj7BzW0jAGZoPRGAIaJptKX7PnUu5aerWzCMu1Ez
	XKxzR+lLNnH6AGURm3O4y203aB/gc2TrnttVy+Nljy6FhZrsYqjw=
X-Received: by 2002:a05:6a21:7103:b0:35d:2172:5ffb with SMTP id adf61e73a8af0-398ecca524amr15217342637.47.1773732344370;
        Tue, 17 Mar 2026 00:25:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:7103:b0:35d:2172:5ffb with SMTP id adf61e73a8af0-398ecca524amr15217296637.47.1773732343542;
        Tue, 17 Mar 2026 00:25:43 -0700 (PDT)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eba9e183sm10821306a12.14.2026.03.17.00.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 00:25:42 -0700 (PDT)
Message-ID: <c09a65b2-0c3d-47ed-b7bc-133346c9f58a@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 12:55:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] thermal: qcom: add qmi-cooling driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-5-gaurav.kohli@oss.qualcomm.com>
 <abQcBXjiqmk2apx_@mai.linaro.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <abQcBXjiqmk2apx_@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA2NCBTYWx0ZWRfX9joYFnbbK6r+
 R2a0pKcJ0TWiEZGbeLyoNJQ8PjnFnMhlYcTjyIeckCkCppdbB5PVczNBStys8xIZgFAtLQR6q/1
 d7euNVBV90o/CKPbZEJRX7jVuKrVSpzseW3oaw/8KbVzVIIRzNMdxukLfIc6tkBHpTIS6WUS/Yc
 6zUPZvSyhQZiYFJ4rVbCTPUO1T/8Fb6s6WeWi26vtOwPW9F3NsozgRNLmYA1ZdmbT1dvPWq5xQ/
 p89zZFfRVBl5yu/V7YRx7sxbNbtU6gzywwCBj40EsNHG7rHw2Ler2lt5vWSXd5TQr6pDFC9Xqjw
 MpukTgWSCg+atIJIYrpty4nuhTPKOB6XL4Oi+60Nd9Mj7KvSCMAKbbHcqBW7mRC7v1UJO9FebSZ
 T7DPOjQBOZLZKa4Q9+cl+f6x9JVnYIfvRGm1YbGpUB52M7uhlICcO7lUm6b5tvmAhzzj6Mowxvx
 kcupPNTqz4ZLP4MDA3A==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b901f9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Stzn4eCAKNuSQEIwgJ0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oBLmRuS7mxR5PWq_Uctn1wE0kBYXqP4V
X-Proofpoint-GUID: oBLmRuS7mxR5PWq_Uctn1wE0kBYXqP4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98084-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 745EC2A4C37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 7:45 PM, Daniel Lezcano wrote:
> On Tue, Jan 27, 2026 at 09:27:18PM +0530, Gaurav Kohli wrote:
>> From: Casey Connolly <casey.connolly@linaro.org>
>>
>> The Thermal Mitigation Device (TMD) service exposes various platform
>> specific thermal mitigations available on remote subsystems (ie the
>> modem and cdsp). The service is exposed via the QMI messaging
>> interface, usually over the QRTR transport.
>>
>> Qualcomm QMI-based TMD cooling devices are used to mitigate thermal
>> conditions across multiple remote subsystems. These devices operate
>> based on junction temperature sensors (TSENS) associated with thermal
>> zones for each subsystem.
>>
>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>> ---
>>   drivers/soc/qcom/Kconfig       |  13 +
>>   drivers/soc/qcom/Makefile      |   1 +
>>   drivers/soc/qcom/qmi-cooling.c | 510 +++++++++++++++++++++++++++++++++
>>   drivers/soc/qcom/qmi-cooling.h | 429 +++++++++++++++++++++++++++
>>   4 files changed, 953 insertions(+)
>>   create mode 100644 drivers/soc/qcom/qmi-cooling.c
>>   create mode 100644 drivers/soc/qcom/qmi-cooling.h
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 2caadbbcf830..905a24b42fe6 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -124,6 +124,19 @@ config QCOM_PMIC_GLINK
>>   	  Say yes here to support USB-C and battery status on modern Qualcomm
>>   	  platforms.
>>   
>> +config QCOM_QMI_COOLING
>> +	tristate "Qualcomm QMI cooling drivers"
>> +	depends on QCOM_RPROC_COMMON
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	select QCOM_QMI_HELPERS
>> +	help
>> +	   This enables the remote subsystem cooling devices. These cooling
>> +	   devices will be used by Qualcomm chipset to place various remote
>> +	   subsystem mitigations like remote processor passive mitigation,
>> +	   remote subsystem voltage restriction at low temperatures etc.
>> +	   The QMI cooling device will interface with remote subsystem
> 0> +	   using Qualcomm remoteproc interface.

Thanks Daniel for review.
will update this.

>> +
>>   config QCOM_QMI_HELPERS
>>   	tristate
>>   	depends on NET
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index b7f1d2a57367..b6728f54944b 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
>>   obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
>>   obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
>>   CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
>> +obj-$(CONFIG_QCOM_QMI_COOLING) += qmi-cooling.o
>>   obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>>   qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
>>   obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
>> diff --git a/drivers/soc/qcom/qmi-cooling.c b/drivers/soc/qcom/qmi-cooling.c
>> new file mode 100644
>> index 000000000000..463baa47c8b6
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi-cooling.c
>> @@ -0,0 +1,510 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2017, The Linux Foundation
> 
> Why this copyright ? The file is from scratch
> 
>> + * Copyright (c) 2025, Linaro Limited

will update this.

> 
> Missing copyright: Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 

will add QC copyright also.

>> + * QMI Thermal Mitigation Device (TMD) client driver.
>> + * This driver provides an in-kernel client to handle hot and cold thermal
>> + * mitigations for remote subsystems (modem and DSPs) running the TMD service.
>> + * It doesn't implement any handling of reports from remote subsystems.
>> + */
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/err.h>
>> +#include <linux/module.h>
>> +#include <linux/net.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/remoteproc/qcom_rproc.h>
>> +#include <linux/remoteproc_cooling.h>
>> +#include <linux/slab.h>
>> +#include <linux/soc/qcom/qmi.h>
>> +#include <linux/thermal.h>
>> +
>> +#include "qmi-cooling.h"
>> +
>> +#define CDSP_INSTANCE_ID	0x43
>> +#define CDSP1_INSTANCE_ID	0x44
>> +
>> +#define QMI_TMD_RESP_TIMEOUT msecs_to_jiffies(100)
> 
> Seems to me a really long duration for a timeout when doing
> mitigation. Would it make sense to reduce it ?

Let me come back on this, as we have to run lot of stability testing for 
this.

> 
>> +/**
>> + * struct qmi_tmd_client - TMD client state
>> + * @dev:	Device associated with this client
>> + * @name:	Friendly name for the remote TMD service
>> + * @handle:	QMI connection handle
>> + * @mutex:	Lock to synchronise QMI communication
>> + * @id:		The QMI TMD service instance ID
>> + * @cdev_list:	The list of cooling devices (controls) enabled for this instance
>> + * @svc_arrive_work: Work item for initialising the client when the TMD service
>> + *		     starts.
>> + * @connection_active: Whether or not we're connected to the QMI TMD service
>> + */
>> +struct qmi_tmd_client {
>> +	struct device *dev;
>> +	const char *name;
>> +	struct qmi_handle handle;
>> +	struct mutex mutex;
> 
> Can you explain why this lock is needed? What race condition is it fixing?
> 
>> +	u32 id;
> 

It is unique instance id used by remote qmi service per subsystem and 
needed for qmi connection, may be i can change this to instance id ?

> So 'dev', 'id' and 'name' are only there to print an error message, right?
> 
> IMO, we can get rid of them.
> 
>> +	struct list_head cdev_list;
>> +	struct work_struct svc_arrive_work;
>> +	bool connection_active;
> 
> IMO this boolean is not needed.

No, this connection_active is setting false during subsystem 
shutdown(SSR cases also), at that time to prevent setting current state 
this state machine is needed.

> 
>   - connection_active is checked in the function 'set_cur_state'.
> 
> If the function is called is because the cooling device is
> registered. The only place where it is set to false again is when the
> cleanup is called. But if the cooling devices are unregistered before,
> there is no reason why 'set_cur_state' to be called in the next steps
> of the cleanup.
> 
> What remain unclear is in case of a peer reset, if del/new is called
> before reset. But in such case, the request through QMI will result in
> a error which should be handled in this driver.
> 
>> +};
>> +
>> +/**
>> + * struct qmi_tmd - A TMD cooling device
>> + * @np:		OF node associated with this control
> 
> Why needed ?
> 

As we are using thermal_of_cooling_device_register for each tmd, that's 
why we are using np. But if we change to cooling-cells=3 then we can use
parent device node.

>> + * @type:	The control type (exposed via sysfs)
> 
> Duplicate with the cooling device name
> 
>> + * @qmi_name:	The common name of this control shared by the remote subsystem
>> + * @rproc_cdev:	Remote processor cooling device handle
>> + * @cur_state:	The current cooling/warming/mitigation state
>> + * @max_state:	The maximum state
>> + * @client:	The TMD client instance this control is associated with
>> + */
>> +struct qmi_tmd {
>> +	struct device_node *np;
>> +	const char *type;
>> +	char qmi_name[QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1];
> 
> const char * and use devm_kstrdup() instead
> 

will update this.

>> +	struct list_head node;
>> +	struct remoteproc_cdev *rproc_cdev;
>> +	unsigned int cur_state;
>> +	unsigned int max_state;
> 
> max_state can be removed (see comment below in the get_max_state() ops)
> 
>> +	struct qmi_tmd_client *client;
>> +};
> 
> This structure can be simplified (refer to comments below in the code)
> 
>> +/**
>> + * struct qmi_instance_id - QMI instance match data
>> + * @id:		The QMI instance ID
>> + * @name:	Friendly name for this instance
>> + */
>> +struct qmi_instance_data {
>> +	u32 id;
>> +	const char *name;
>> +};
> 
> If I'm not wrong, this structure is only used to pass information to
> print debug information ?
> 

this is same as mentioned above, using this instance id for qmi 
connection with subsystem.

>> +
>> +/* Notify the remote subsystem of the requested cooling state */
>> +static int qmi_tmd_send_state_request(struct qmi_tmd *tmd)
>> +{
>> +	struct tmd_set_mitigation_level_resp_msg_v01 tmd_resp = { 0 };
>> +	struct tmd_set_mitigation_level_req_msg_v01 req = { 0 };
> 
> Please shortened these structure name. It is unreadable. May be you
> can do something like:
> 
> struct tmd_set_level_msg {
>         int level;
>         union {
>         	     struct qmi_response_type_v01 resp;
> 	     char mitigation_dev_id[...];
>         };
> }
> 
> I know the other QMI services are implemented in the same way but it
> may be worth to simplify the message format instead of wrapping that
> into structures again and again.
> 

Sure, let me update and come back on this.

>> +	struct qmi_tmd_client *client;
>> +	struct qmi_txn txn;
>> +	int ret = 0;
>> +
>> +	client = tmd->client;
>> +
>> +	guard(mutex)(&client->mutex);
>> +
>> +	/*
>> +	 * This function is called by qmi_set_cur_state() which does not know if
>> +	 * the QMI service is actually online. If it isn't then we noop here.
>> +	 * The state is cached in tmd->cur_state and will be broadcast via
>> +	 * qmi_tmd_init_control() when the service comes up.
>> +	 */
>> +	if (!client->connection_active)
>> +		return 0;
>> +
>> +	strscpy(req.mitigation_dev_id.mitigation_dev_id, tmd->qmi_name,
>> +		QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1);
>> +	req.mitigation_level = tmd->cur_state;
>> +
>> +	ret = qmi_txn_init(&client->handle, &txn,
>> +			   tmd_set_mitigation_level_resp_msg_v01_ei, &tmd_resp);
>> +	if (ret < 0) {
>> +		dev_err(client->dev, "qmi set state %d txn init failed for %s ret %d\n",
>> +			tmd->cur_state, tmd->type, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = qmi_send_request(&client->handle, NULL, &txn,
>> +			       QMI_TMD_SET_MITIGATION_LEVEL_REQ_V01,
>> +			       TMD_SET_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN,
>> +			       tmd_set_mitigation_level_req_msg_v01_ei, &req);
>> +	if (ret < 0) {
>> +		dev_err(client->dev, "qmi set state %d txn send failed for %s ret %d\n",
>> +			tmd->cur_state, tmd->type, ret);
>> +		qmi_txn_cancel(&txn);
>> +		return ret;
>> +	}
>> +
>> +	ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
>> +	if (ret < 0) {
>> +		dev_err(client->dev, "qmi set state %d txn wait failed for %s ret %d\n",
>> +			tmd->cur_state, tmd->type, ret);
>> +		return ret;
>> +	}
>> +
>> +	if (tmd_resp.resp.result != QMI_RESULT_SUCCESS_V01) {
>> +		ret = -tmd_resp.resp.result;
> 
> Is this result an errno error or a QMI error?
> 
>> +		dev_err(client->dev, "qmi set state %d NOT success for %s ret %d\n",
>> +			tmd->cur_state, tmd->type, ret);
>> +		return ret;
>> +	}
>> +
>> +	dev_dbg(client->dev, "Requested state %d/%d for %s\n", tmd->cur_state,
>> +		tmd->max_state, tmd->type);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_get_max_level(void *devdata, unsigned long *level)
>> +{
>> +	struct qmi_tmd *tmd = devdata;
>> +
>> +	if (!tmd)
>> +		return -EINVAL;
>> +
>> +	*level = tmd->max_state;
>> +
>> +	return 0;
>> +}
> 
> The get_max_state() is called in two places. When registering the
> cooling device and when updating the cooling device. The first one is
> called one time and the second one is called when there is an event
> like switching the battery mode (ACPI only). Each of them updates the
> cdev->max_state field. Otherwise the get_max_state() is not used but
> cdev->max_state.
> 
> The code above should call the QMI to get the max
> level. tmd->max_state could be then removed.
> 

For first time registration also, framework is reading max_state 
callback only to update cdev->max_state, so to maintain that we need
this variable.

> I agree there are other cooling devices doing that but I don't think
> it is correct.
> 
>> +static int qmi_get_cur_level(void *devdata, unsigned long *level)
>> +{
>> +	struct qmi_tmd *tmd = devdata;
>> +
>> +	if (!tmd)
>> +		return -EINVAL;
>> +
> 
> We should assume the core is doing the right thing. So if we
> registered the cooling device with the private data, then it should
> return it back. If not, then it is a fatal bug crashing the system
> which should have been spotted when doing some testing.
> 

Sure, will remove the check.

>> +	*level = tmd->cur_state;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_set_cur_level(void *devdata, unsigned long level)
>> +{
>> +	struct qmi_tmd *tmd = devdata;
>> +
>> +	if (!tmd)
>> +		return -EINVAL;
> 
> idem
> 
>> +	if (level > tmd->max_state)
>> +		return -EINVAL;
>
> It is already handled in the core code.
> 

In older kernel, i think it is not taking care for sysfs path, but now 
we can remove.

>> +	if (tmd->cur_state == level)
>> +		return 0;
>>
>> +	tmd->cur_state = level;
>> +
>> +	return qmi_tmd_send_state_request(tmd);
> 
> The command should succeed before updating 'cur_state'. So first the
> call to qmi_tmd_send_state_request() and if it is ok, then set the
> current state. So it means you can pass the state as parameter to
> qmi_set_cur_level() which in this case not rely on the caller to set
> the tmd->cur_state before calling the function.
> 

Thanks for catching this, will check error case and then only update.

>> +}
>> +
>> +static const struct remoteproc_cooling_ops qmi_rproc_ops = {
>> +	.get_max_level = qmi_get_max_level,
>> +	.get_cur_level = qmi_get_cur_level,
>> +	.set_cur_level = qmi_set_cur_level,
>> +};
> 
> As commented before, the remoteproc cooling device does not really
> provide a benefit, so those ops can be converted into cooling device
> ops.
> 

Yes, in next post will remove remoteproc cooling device.

> [ ... ]
> 
>> +/*
>> + * Init a single TMD control by registering a cooling device for it, or
>> + * synchronising state with the remote subsystem if recovering from a service
>> + * restart. This is called when the TMD service starts up.
>> + */
>> +static int qmi_tmd_init_control(struct qmi_tmd_client *client, const char *label,
>> +				u8 max_state)
>> +{
>> +	struct qmi_tmd *tmd = NULL;
>> +
>> +	list_for_each_entry(tmd, &client->cdev_list, node)
>> +		if (!strncasecmp(tmd->qmi_name, label,
>> +				 QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1))
>> +			goto found;
>> +
>> +	dev_dbg(client->dev,
>> +		"TMD '%s' available in firmware but not specified in DT\n",
>> +		label);
>> +	return 0;
>> +
>> +found:
>> +	tmd->max_state = max_state;
>> +	/*
>> +	 * If the cooling device already exists then the QMI service went away and
>> +	 * came back. So just make sure the current cooling device state is
>> +	 * reflected on the remote side and then return.
>> +	 */
>> +	if (tmd->rproc_cdev)
>> +		return qmi_tmd_send_state_request(tmd);
>> +
>> +	return qmi_register_cooling_device(tmd);
>> +}
>> +
>> +/*
>> + * When the QMI service starts up on a remote subsystem this function will fetch
>> + * the list of TMDs on the subsystem, match it to the TMDs specified in devicetree
>> + * and call qmi_tmd_init_control() for each
>> + */
>> +static void qmi_tmd_svc_arrive(struct work_struct *work)
>> +{
>> +	struct qmi_tmd_client *client =
>> +		container_of(work, struct qmi_tmd_client, svc_arrive_work);
>> +
>> +	struct tmd_get_mitigation_device_list_req_msg_v01 req = { 0 };
>> +	struct tmd_get_mitigation_device_list_resp_msg_v01 *resp __free(kfree) = NULL;
>> +	int ret = 0, i;
>> +	struct qmi_txn txn;
>> +
>> +	/* resp struct is 1.1kB, allocate it on the heap. */
>> +	resp = kzalloc(sizeof(*resp), GFP_KERNEL);
>> +	if (!resp)
>> +		return;
>> +
>> +	/* Get a list of TMDs supported by the remoteproc */
>> +	scoped_guard(mutex, &client->mutex) {
>> +		ret = qmi_txn_init(&client->handle, &txn,
>> +				   tmd_get_mitigation_device_list_resp_msg_v01_ei, resp);
>> +		if (ret < 0) {
>> +			dev_err(client->dev,
>> +				"Transaction init error for instance_id: %#x ret %d\n",
>> +				client->id, ret);
>> +			return;
>> +		}
>> +
>> +		ret = qmi_send_request(&client->handle, NULL, &txn,
>> +				       QMI_TMD_GET_MITIGATION_DEVICE_LIST_REQ_V01,
>> +				TMD_GET_MITIGATION_DEVICE_LIST_REQ_MSG_V01_MAX_MSG_LEN,
>> +				tmd_get_mitigation_device_list_req_msg_v01_ei, &req);
>> +		if (ret < 0) {
>> +			qmi_txn_cancel(&txn);
>> +			return;
>> +		}
>> +
>> +		ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
>> +		if (ret < 0) {
>> +			dev_err(client->dev, "Transaction wait error for client %#x ret:%d\n",
>> +				client->id, ret);
>> +			return;
>> +		}
>> +		if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
>> +			ret = resp->resp.result;
>> +			dev_err(client->dev, "Failed to get device list for client %#x ret:%d\n",
>> +				client->id, ret);
>> +			return;
>> +		}
>> +
>> +		client->connection_active = true;
>> +	}
>> +
>> +	for (i = 0; i < resp->mitigation_device_list_len; i++) {
>> +		struct tmd_mitigation_dev_list_type_v01 *device =
>> +			&resp->mitigation_device_list[i];
>> +
>> +		ret = qmi_tmd_init_control(client,
>> +					   device->mitigation_dev_id.mitigation_dev_id,
>> +					   device->max_mitigation_level);
>> +		if (ret)
>> +			break;
>> +	}
>> +}
>> +
>> +static void thermal_qmi_net_reset(struct qmi_handle *qmi)
>> +{
>> +	struct qmi_tmd_client *client = container_of(qmi, struct qmi_tmd_client, handle);
>> +	struct qmi_tmd *tmd = NULL;
>> +
>> +	list_for_each_entry(tmd, &client->cdev_list, node) {
>> +		qmi_tmd_send_state_request(tmd);
>> +	}
>> +}
>> +
>> +static void thermal_qmi_del_server(struct qmi_handle *qmi, struct qmi_service *service)
>> +{
>> +	struct qmi_tmd_client *client = container_of(qmi, struct qmi_tmd_client, handle);
>> +
>> +	scoped_guard(mutex, &client->mutex)
>> +		client->connection_active = false;
>> +}
>> +
>> +static int thermal_qmi_new_server(struct qmi_handle *qmi, struct qmi_service *service)
>> +{
>> +	struct qmi_tmd_client *client = container_of(qmi, struct qmi_tmd_client, handle);
>> +	struct sockaddr_qrtr sq = { AF_QIPCRTR, service->node, service->port };
>> +
>> +	scoped_guard(mutex, &client->mutex)
>> +		kernel_connect(qmi->sock, (struct sockaddr_unsized *)&sq, sizeof(sq), 0);
>> +
>> +	queue_work(system_highpri_wq, &client->svc_arrive_work);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct qmi_ops thermal_qmi_event_ops = {
>> +	.new_server = thermal_qmi_new_server,
>> +	.del_server = thermal_qmi_del_server,
>> +	.net_reset = thermal_qmi_net_reset,
>> +};
>> +
>> +static void qmi_tmd_cleanup(struct qmi_tmd_client *client)
>> +{
>> +	struct qmi_tmd *tmd, *c_next;
>> +
>> +	guard(mutex)(&client->mutex);
>> +
>> +	client->connection_active = false;
>> +
>> +	qmi_handle_release(&client->handle);
>> +	cancel_work(&client->svc_arrive_work);
>> +	list_for_each_entry_safe(tmd, c_next, &client->cdev_list, node) {
>> +		if (tmd->rproc_cdev)
>> +			remoteproc_cooling_unregister(tmd->rproc_cdev);
>> +
>> +		list_del(&tmd->node);
>> +	}
>> +}
>> +
>> +/* Parse the controls and allocate a qmi_tmd for each of them */
>> +static int qmi_tmd_alloc_cdevs(struct qmi_tmd_client *client)
>> +{
>> +	struct device *dev = client->dev;
>> +	struct device_node *node = dev->of_node;
>> +	struct device_node *subnode;
>> +	struct qmi_tmd *tmd;
>> +	int ret;
>> +
>> +	for_each_available_child_of_node_scoped(node, subnode) {
>> +		const char *name;
> 
> Ok, I think there are already a lot of comments about the code. I'll
> skip the DTpart review in this patch and jump to the DT bindings.
> 
>> +		tmd = devm_kzalloc(dev, sizeof(*tmd), GFP_KERNEL);
>> +		if (!tmd)
>> +			return dev_err_probe(client->dev, -ENOMEM,
>> +					     "Couldn't allocate tmd\n");
> 
> Usually we do not return an error message when an allocation fails
> because the mem mngt code does already that. So I would replace it
> with a simple return -ENOMEM
> 

Sure, will update this.

>> +
>> +		tmd->type = devm_kasprintf(client->dev, GFP_KERNEL, "%s",
>> +					   subnode->name);
> 
> 			devm_kstrdup()
> 
>> +		if (!tmd->type)
>> +			return dev_err_probe(dev, -ENOMEM,
>> +					     "Couldn't allocate cooling device name\n");
>> +
>> +		if (of_property_read_string(subnode, "label", &name))
>> +			return dev_err_probe(client->dev, -EINVAL,
>> +					     "Failed to parse dev name for %s\n",
>> +					     subnode->name);
>> +
>> +		ret = strscpy(tmd->qmi_name, name,
>> +			      QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 + 1);
> 
>    			devm_kstrdup()
> 
>> +		if (ret == -E2BIG)
>> +			return dev_err_probe(dev, -EINVAL, "TMD label %s is too long\n",
>> +					     name);
>> +
>> +		tmd->client = client;
>> +		tmd->np = subnode;
> 
> Why is it needed? I don't see it used anywhere
> 

As mentioned earlier, we are using this during cooling registration call.

>> +		tmd->cur_state = 0;
>> +		list_add(&tmd->node, &client->cdev_list);
>> +	}
>> +
>> +	if (list_empty(&client->cdev_list))
>> +		return dev_err_probe(client->dev, -EINVAL,
>> +				     "No cooling devices specified for client %s (%#x)\n",
>> +				     client->name, client->id);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmi_tmd_client_probe(struct platform_device *pdev)
>> +{
>> +	const struct qmi_instance_data *match;
>> +	struct qmi_tmd_client *client;
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	client = devm_kzalloc(dev, sizeof(*client), GFP_KERNEL);
>> +	if (!client)
>> +		return -ENOMEM;
>> +
>> +	client->dev = dev;
>> +
>> +	match = of_device_get_match_data(dev);
>> +	if (!match)
>> +		return dev_err_probe(dev, -EINVAL, "No match data\n");
>> +
>> +	client->id = match->id;
>> +	client->name = match->name;
>> +
>> +	mutex_init(&client->mutex);
>> +	INIT_LIST_HEAD(&client->cdev_list);
>> +	INIT_WORK(&client->svc_arrive_work, qmi_tmd_svc_arrive);
>> +
>> +	ret = qmi_tmd_alloc_cdevs(client);
>> +	if (ret)
>> +		return ret;
>> +
>> +	platform_set_drvdata(pdev, client);
>> +
>> +	ret = qmi_handle_init(&client->handle,
>> +			      TMD_GET_MITIGATION_DEVICE_LIST_RESP_MSG_V01_MAX_MSG_LEN,
>> +			      &thermal_qmi_event_ops, NULL);
>> +	if (ret < 0)
>> +		return dev_err_probe(client->dev, ret, "QMI handle init failed for client %#x\n",
>> +			      client->id);
>> +
>> +	ret = qmi_add_lookup(&client->handle, TMD_SERVICE_ID_V01, TMD_SERVICE_VERS_V01,
>> +			     client->id);
>> +	if (ret < 0) {
>> +		qmi_handle_release(&client->handle);
>> +		return dev_err_probe(client->dev, ret, "QMI register failed for client 0x%x\n",
>> +			      client->id);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void qmi_tmd_client_remove(struct platform_device *pdev)
>> +{
>> +	struct qmi_tmd_client *client = platform_get_drvdata(pdev);
>> +
>> +	qmi_tmd_cleanup(client);
>> +}
>> +
>> +static const struct qmi_instance_data qmi_cdsp = {
>> +	.id = CDSP_INSTANCE_ID,
>> +	.name = "cdsp",
>> +};
>> +
>> +static const struct qmi_instance_data qmi_cdsp1 = {
>> +	.id = CDSP1_INSTANCE_ID,
>> +	.name = "cdsp1",
>> +};
>> +
>> +static const struct of_device_id qmi_tmd_device_table[] = {
>> +	{
>> +		.compatible = "qcom,qmi-cooling-cdsp",
>> +		.data = &qmi_cdsp,
>> +	},
>> +	{
>> +		.compatible = "qcom,qmi-cooling-cdsp1",
>> +		.data = &qmi_cdsp1,
>> +	},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, qmi_tmd_device_table);
>> +
>> +static struct platform_driver qmi_tmd_device_driver = {
>> +	.probe = qmi_tmd_client_probe,
>> +	.remove = qmi_tmd_client_remove,
>> +	.driver = {
>> +		.name = "qcom-qmi-cooling",
>> +		.of_match_table = qmi_tmd_device_table,
>> +	},
>> +};
>> +
>> +module_platform_driver(qmi_tmd_device_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Qualcomm QMI Thermal Mitigation Device driver");
>> diff --git a/drivers/soc/qcom/qmi-cooling.h b/drivers/soc/qcom/qmi-cooling.h
>> new file mode 100644
>> index 000000000000..e33f4c5979e5
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qmi-cooling.h
>> @@ -0,0 +1,429 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2017, The Linux Foundation
>> + * Copyright (c) 2023, Linaro Limited
>> + */
>> +
>> +#ifndef __QCOM_COOLING_H__
>> +#define __QCOM_COOLING_H__
> 
> I'm not sure we want to export all these macros, structure. It could
> be contained into a .c file.
> 
>> +#include <linux/soc/qcom/qmi.h>
>> +
>> +#define TMD_SERVICE_ID_V01 0x18
> 

will update this.

> IMO, this definition should go inside qmi.h
> 
> See https://lore.kernel.org/all/20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com/
> 
>> +#define TMD_SERVICE_VERS_V01 0x01
>> +
>> +#define QMI_TMD_GET_MITIGATION_DEVICE_LIST_RESP_V01 0x0020
>> +#define QMI_TMD_GET_MITIGATION_LEVEL_REQ_V01 0x0022
>> +#define QMI_TMD_GET_SUPPORTED_MSGS_REQ_V01 0x001E
>> +#define QMI_TMD_SET_MITIGATION_LEVEL_REQ_V01 0x0021
>> +#define QMI_TMD_REGISTER_NOTIFICATION_MITIGATION_LEVEL_RESP_V01 0x0023
>> +#define QMI_TMD_GET_SUPPORTED_MSGS_RESP_V01 0x001E
>> +#define QMI_TMD_SET_MITIGATION_LEVEL_RESP_V01 0x0021
>> +#define QMI_TMD_DEREGISTER_NOTIFICATION_MITIGATION_LEVEL_RESP_V01 0x0024
>> +#define QMI_TMD_MITIGATION_LEVEL_REPORT_IND_V01 0x0025
>> +#define QMI_TMD_GET_MITIGATION_LEVEL_RESP_V01 0x0022
>> +#define QMI_TMD_GET_SUPPORTED_FIELDS_REQ_V01 0x001F
>> +#define QMI_TMD_GET_MITIGATION_DEVICE_LIST_REQ_V01 0x0020
>> +#define QMI_TMD_REGISTER_NOTIFICATION_MITIGATION_LEVEL_REQ_V01 0x0023
>> +#define QMI_TMD_DEREGISTER_NOTIFICATION_MITIGATION_LEVEL_REQ_V01 0x0024
>> +#define QMI_TMD_GET_SUPPORTED_FIELDS_RESP_V01 0x001F
>> +
>> +#define QMI_TMD_MITIGATION_DEV_ID_LENGTH_MAX_V01 32
>> +#define QMI_TMD_MITIGATION_DEV_LIST_MAX_V01 32
> 
> Having self explainatory names for the macros is good but somehow
> these should be shortened because they are too long and do not help
> for the readability when they are used.
> 
> Perhaps, add a documentation in the code with the corresponding
> structure vs their name.
> 
> [ ... ]
> 
>> +struct tmd_get_mitigation_device_list_req_msg_v01 {
>> +	char placeholder;
>> +};
>> +
>> +#define TMD_GET_MITIGATION_DEVICE_LIST_REQ_MSG_V01_MAX_MSG_LEN 0.
> 
> Where are these macro used ? And why are they needed ?
> 

will cleanup the unused macro.

>> +const struct qmi_elem_info tmd_get_mitigation_device_list_req_msg_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_get_mitigation_device_list_resp_msg_v01 {
>> +	struct qmi_response_type_v01 resp;
>> +	u8 mitigation_device_list_valid;
>> +	u32 mitigation_device_list_len;
>> +	struct tmd_mitigation_dev_list_type_v01
>> +		mitigation_device_list[QMI_TMD_MITIGATION_DEV_LIST_MAX_V01];
>> +};
>> +
>> +#define TMD_GET_MITIGATION_DEVICE_LIST_RESP_MSG_V01_MAX_MSG_LEN 1099
>> +static const struct qmi_elem_info tmd_get_mitigation_device_list_resp_msg_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct qmi_response_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_get_mitigation_device_list_resp_msg_v01,
>> +				   resp),
>> +		.ei_array = qmi_response_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_OPT_FLAG,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_mitigation_device_list_resp_msg_v01,
>> +				   mitigation_device_list_valid),
>> +	},
>> +	{
>> +		.data_type = QMI_DATA_LEN,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_mitigation_device_list_resp_msg_v01,
>> +				   mitigation_device_list_len),
>> +	},
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = QMI_TMD_MITIGATION_DEV_LIST_MAX_V01,
>> +		.elem_size = sizeof(struct tmd_mitigation_dev_list_type_v01),
>> +		.array_type = VAR_LEN_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_mitigation_device_list_resp_msg_v01,
>> +				   mitigation_device_list),
>> +		.ei_array = tmd_mitigation_dev_list_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_set_mitigation_level_req_msg_v01 {
>> +	struct tmd_mitigation_dev_id_type_v01 mitigation_dev_id;
>> +	u8 mitigation_level;
>> +};
>> +
>> +#define TMD_SET_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN 40
>> +static const struct qmi_elem_info tmd_set_mitigation_level_req_msg_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x01,
>> +		.offset = offsetof(struct tmd_set_mitigation_level_req_msg_v01,
>> +				   mitigation_dev_id),
>> +		.ei_array = tmd_mitigation_dev_id_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_set_mitigation_level_req_msg_v01,
>> +				   mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_set_mitigation_level_resp_msg_v01 {
>> +	struct qmi_response_type_v01 resp;
>> +};
>> +
>> +#define TMD_SET_MITIGATION_LEVEL_RESP_MSG_V01_MAX_MSG_LEN 7
>> +static const struct qmi_elem_info tmd_set_mitigation_level_resp_msg_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct qmi_response_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_set_mitigation_level_resp_msg_v01, resp),
>> +		.ei_array = qmi_response_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_get_mitigation_level_req_msg_v01 {
>> +	struct tmd_mitigation_dev_id_type_v01 mitigation_device;
>> +};
>> +
>> +#define TMD_GET_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN 36
>> +
>> +static const struct qmi_elem_info tmd_get_mitigation_level_req_msg_v01_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x01,
>> +		.offset = offsetof(struct tmd_get_mitigation_level_req_msg_v01,
>> +				   mitigation_device),
>> +		.ei_array = tmd_mitigation_dev_id_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_get_mitigation_level_resp_msg_v01 {
>> +	struct qmi_response_type_v01 resp;
>> +	u8 current_mitigation_level_valid;
>> +	u8 current_mitigation_level;
>> +	u8 requested_mitigation_level_valid;
>> +	u8 requested_mitigation_level;
>> +};
>> +
>> +#define TMD_GET_MITIGATION_LEVEL_RESP_MSG_V01_MAX_MSG_LEN 15
>> +static const struct qmi_elem_info tmd_get_mitigation_level_resp_msg_ei[] = {
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct qmi_response_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01, resp),
>> +		.ei_array = qmi_response_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_OPT_FLAG,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01,
>> +				   current_mitigation_level_valid),
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x10,
>> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01,
>> +				   current_mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_OPT_FLAG,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x11,
>> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01,
>> +				   requested_mitigation_level_valid),
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x11,
>> +		.offset = offsetof(struct tmd_get_mitigation_level_resp_msg_v01,
>> +				   requested_mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +struct tmd_register_notification_mitigation_level_req_msg_v01 {
>> +	struct tmd_mitigation_dev_id_type_v01 mitigation_device;
>> +};
>> +
>> +#define TMD_REGISTER_NOTIFICATION_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN 36
>> +static const struct qmi_elem_info
>> +	tmd_register_notification_mitigation_level_req_msg_v01_ei[] = {
>> +		{
>> +			.data_type = QMI_STRUCT,
>> +			.elem_len = 1,
>> +			.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = 0x01,
>> +			.offset = offsetof(
>> +				struct tmd_register_notification_mitigation_level_req_msg_v01,
>> +				mitigation_device),
>> +			.ei_array = tmd_mitigation_dev_id_type_v01_ei,
>> +		},
>> +		{
>> +			.data_type = QMI_EOTI,
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = QMI_COMMON_TLV_TYPE,
>> +		},
>> +	};
>> +
>> +struct tmd_register_notification_mitigation_level_resp_msg_v01 {
>> +	struct qmi_response_type_v01 resp;
>> +};
>> +
>> +#define TMD_REGISTER_NOTIFICATION_MITIGATION_LEVEL_RESP_MSG_V01_MAX_MSG_LEN 7
>> +static const struct qmi_elem_info
>> +	tmd_register_notification_mitigation_level_resp_msg_v01_ei[] = {
>> +		{
>> +			.data_type = QMI_STRUCT,
>> +			.elem_len = 1,
>> +			.elem_size = sizeof(struct qmi_response_type_v01),
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = 0x02,
>> +			.offset = offsetof(
>> +				struct tmd_register_notification_mitigation_level_resp_msg_v01,
>> +				resp),
>> +			.ei_array = qmi_response_type_v01_ei,
>> +		},
>> +		{
>> +			.data_type = QMI_EOTI,
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = QMI_COMMON_TLV_TYPE,
>> +		},
>> +	};
>> +
>> +struct tmd_deregister_notification_mitigation_level_req_msg_v01 {
>> +	struct tmd_mitigation_dev_id_type_v01 mitigation_device;
>> +};
>> +
>> +#define TMD_DEREGISTER_NOTIFICATION_MITIGATION_LEVEL_REQ_MSG_V01_MAX_MSG_LEN 36
>> +static const struct qmi_elem_info
>> +	tmd_deregister_notification_mitigation_level_req_msg_v01_ei[] = {
>> +		{
>> +			.data_type = QMI_STRUCT,
>> +			.elem_len = 1,
>> +			.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = 0x01,
>> +			.offset = offsetof(
>> +				struct tmd_deregister_notification_mitigation_level_req_msg_v01,
>> +				mitigation_device),
>> +			.ei_array = tmd_mitigation_dev_id_type_v01_ei,
>> +		},
>> +		{
>> +			.data_type = QMI_EOTI,
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = QMI_COMMON_TLV_TYPE,
>> +		},
>> +	};
>> +
>> +struct tmd_deregister_notification_mitigation_level_resp_msg_v01 {
>> +	struct qmi_response_type_v01 resp;
>> +};
>> +
>> +#define TMD_DEREGISTER_NOTIFICATION_MITIGATION_LEVEL_RESP_MSG_V01_MAX_MSG_LEN 7
>> +static const struct qmi_elem_info
>> +	tmd_deregister_notification_mitigation_level_resp_msg_v01_ei[] = {
>> +		{
>> +			.data_type = QMI_STRUCT,
>> +			.elem_len = 1,
>> +			.elem_size = sizeof(struct qmi_response_type_v01),
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = 0x02,
>> +			.offset = offsetof(
>> +				struct tmd_deregister_notification_mitigation_level_resp_msg_v01,
>> +				resp),
>> +			.ei_array = qmi_response_type_v01_ei,
>> +		},
>> +		{
>> +			.data_type = QMI_EOTI,
>> +			.array_type = NO_ARRAY,
>> +			.tlv_type = QMI_COMMON_TLV_TYPE,
>> +		},
>> +	};
>> +
>> +struct tmd_mitigation_level_report_ind_msg_v01 {
>> +	struct tmd_mitigation_dev_id_type_v01 mitigation_device;
>> +	u8 current_mitigation_level;
>> +};
>> +
>> +#define TMD_MITIGATION_LEVEL_REPORT_IND_MSG_V01_MAX_MSG_LEN 40
>> +static const struct qmi_elem_info tmd_mitigation_level_report_ind_msg_v01_ei[] = {
> 
> Where is used this variable ?
> 
>> +	{
>> +		.data_type = QMI_STRUCT,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(struct tmd_mitigation_dev_id_type_v01),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x01,
>> +		.offset = offsetof(struct tmd_mitigation_level_report_ind_msg_v01,
>> +				   mitigation_device),
>> +		.ei_array = tmd_mitigation_dev_id_type_v01_ei,
>> +	},
>> +	{
>> +		.data_type = QMI_UNSIGNED_1_BYTE,
>> +		.elem_len = 1,
>> +		.elem_size = sizeof(uint8_t),
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = 0x02,
>> +		.offset = offsetof(struct tmd_mitigation_level_report_ind_msg_v01,
>> +				   current_mitigation_level),
>> +	},
>> +	{
>> +		.data_type = QMI_EOTI,
>> +		.array_type = NO_ARRAY,
>> +		.tlv_type = QMI_COMMON_TLV_TYPE,
>> +	},
>> +};
>> +
>> +#endif /* __QMI_COOLING_INTERNAL_H__ */
>> -- 
>> 2.34.1
>>
> 


