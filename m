Return-Path: <linux-arm-msm+bounces-101610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO1IGtZ3z2kewgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:18:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC8239202C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFE803058BC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 08:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E53B2E62B3;
	Fri,  3 Apr 2026 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1XoZOEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Evbc6uKl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACAC221F1C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 08:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204294; cv=none; b=oBXnsKr8/QY13JqA2jLHUrgZOEJvsFmPQSKfQgjqYkasvwyNMOwUa3+5hUQXsCxJnyufQdtjtwtXFxr58oXzyH3Y5SXM5Muv7E90naFXeAXDvyUzl+jnfioiAT2IyvD9OS4BrUOD4mVzEWVDO6BIltqg2vMX85UkC6xi9lVsb38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204294; c=relaxed/simple;
	bh=aOlO5RTXXkab+Eb8Y3HbTOkGkD3BJoZszYg0vGQAPv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWYK5nCwRVjmwKwvfkAOjoJSJL7J7cO1vW+A3dt3az0vJ4nFRK1BGmGXW+u3ocGkTNNP/bq1MJiCoZxDk0mFmCoCmJ2XCN8tRxMesT7hXekRxvYQrDDWYrvIQ84+roAFxzvcMkzj01m3+KchxpsIDcVk9+R8F3ZtBw8NiD/QlpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1XoZOEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Evbc6uKl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336FIRG142148
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 08:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9QNzfSdzILrWECJHe9a3GABkzGiAZJ8sMLoAMIu4d80=; b=K1XoZOEub4XArpi6
	pCrba6juViBq0SgqN3LlX1rYYJktiOi9U0wq/Z8bSFyWZ9rujk4MFEFAKnuxp3X1
	YTozswlhOuRapxkajIC4BAyT8uyfBdnrSnh6KDaa8qyeE6IcKh85Ojh2esSnVV/f
	ilocT1gvYKNr9dhqycGy8UiFy07EvEmvt0RRg/whJhIUdhKpo1TU3KlvWKH+sxP9
	N/WbYjppFbTEintCP9Cs9i1ZVe1PbWxrm4w+42co7crrm+T97BmBybKbU6e11IEx
	Xfy5FfK2twplcNkopqpHBkHBzCwmlduTK5Jtrg/1GmfFH5hm8BdLLzhd+g93LvqB
	fG1lAg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y0bq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 08:18:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76bb22a8ceso2182468a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775204290; x=1775809090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9QNzfSdzILrWECJHe9a3GABkzGiAZJ8sMLoAMIu4d80=;
        b=Evbc6uKlR7liSYioXOrlMwdfbp4WXazL73twO0E0KMV4I1ru6zeoz29VNK74uGDVPq
         ra0A3QlhPYfESHd2JySPXyx3vi0Qcz3faYVSVrd+HC/VyzmzFWeOm90V1r6fSTxTfT22
         sQhJu4LMSPrhHEVvdAr8hiI5KWitzUefLaIdBVWJDrvFpZ0b4gAxcr8ySHfjGkoOKrfz
         9p6zJntR3Xc+of8GnSo84/DoPSORnnf8o7HRGMOGkax7MElT6Fxvdks1y5LovW7dwqQh
         i7Ote8+sINdd+oKFflH2Do1RoAH8TVi8Rr28GRBI1JExtYM/fsx3/ppuoi8BMOOu1E6S
         2jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775204290; x=1775809090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QNzfSdzILrWECJHe9a3GABkzGiAZJ8sMLoAMIu4d80=;
        b=Gi/813OUP+aHnR8hxhPsVAzljtBweIlvXByFcqDh0rso5cZDF0eEzrPwMsI2TX3sVl
         xywyXP+EkEV1IavyJmBfMRgib7R1ax+hR8NOLu7nbecvWyw6xyrXNmbq5xJzkzAy411y
         h/CPdzZ08n8GAqogpiYZiS15OYKvKfysA0rdr3UbmT5HfKpRSc2NjSRBn58ywmsTWNx7
         0wgk4TbKN2WufnjDIGdPo7KEBL2WUIWV4OQfJFJW9TSZ5E3xMlsGbZr4qMEF0Yjqzw7c
         aRiFbioad1NUL3e+ly5mRLNv5Bykl/hj1VMNMJbDTi/VaGVDlCx3wDsopRCQHJZr9rSy
         Jilw==
X-Forwarded-Encrypted: i=1; AJvYcCUF1S3iEhmZaBtxHJ39+SGRYtpJb3P/YFTetgrB1LKy2LA7Thfof9n/CSMSFiNltL8F8+Izg9ZJV/IcHHLW@vger.kernel.org
X-Gm-Message-State: AOJu0YzymtHM+AyscPIN5/MDmRF3PlgriGfEX/AnSHyYVvdObcUqePq0
	RurMNLgVqo34Nbx3qHvec4D5K22JOz86blbUF3hnQAnNn05LmDt1aYpW48lyuKOKWYidjJFaa4D
	+cHK9E45it3Tl9UYy5+1DhZQpEDkgSzMip9/z3yj0+z4wBq0KV9cNwQfYBKn3eQvBX5HD
X-Gm-Gg: AeBDietF9xOPJxEI6BL14PO1edLxBuUqEhjCD5AY993dCP956t+pl1U2hKNfBFThAIc
	nsLCzk5HyAUx++qWCCkMSnTAKtPNVTPh2lKPxcYurUbOLNKDeMSnA3vGgLJ06VhyaJ6UtNMg9rT
	qCrgBuOcQGO9W6MgRcJ1jPD0coY0pEQ8tqS7mCqnWt50urgtdTIbtsTxq3BgOzXYSonsn6fkvL3
	AtKPrTrUd1fDgUOz+1tkrFxqZmRlbtpEUEIIutBIWMR9zlWBn5h3eUFh9mjo9Y8MDdCkMGJ2uQS
	itqi4ww4H+DAylTHSkLtdeHy8bBW+JzrJngVnpIoP97BFMCUA8mkqXhAijOE2LFfAKycRwMIcbA
	oGA3B2/PmPgp6UUwKecdH5s6cX+1nDSilTLLlgioYj6LBhtqcBEq+tM54dc5TUgq1YAGxJT7Q/V
	YpYQWUcs/3JW1Ujib/NA==
X-Received: by 2002:a05:6a00:3027:b0:824:93e4:2ddf with SMTP id d2e1a72fcca58-82d0da3f8afmr2144230b3a.13.1775204290342;
        Fri, 03 Apr 2026 01:18:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:3027:b0:824:93e4:2ddf with SMTP id d2e1a72fcca58-82d0da3f8afmr2144205b3a.13.1775204289818;
        Fri, 03 Apr 2026 01:18:09 -0700 (PDT)
Received: from [10.133.33.157] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9a24039sm5313994b3a.0.2026.04.03.01.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:18:09 -0700 (PDT)
Message-ID: <10de33b0-b613-405e-832e-852202dc776e@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:04:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/7] qcom-tgu: Add TGU driver
To: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-3-songwei.chai@oss.qualcomm.com>
 <a0a9fa9d-5438-48e0-b3de-def97d4214bf@oss.qualcomm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <a0a9fa9d-5438-48e0-b3de-def97d4214bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cf77c3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pxWJ9DaTX99kDjaxMB4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: vYo52Q_YW3npAcg2dJZtyx8WUkMxmunH
X-Proofpoint-GUID: vYo52Q_YW3npAcg2dJZtyx8WUkMxmunH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3MiBTYWx0ZWRfXxzylOcD3yCDs
 ImRbQZy9r5i/p8tfGQ1KOLIt99gTQZHSPE/Uo3UEjqNF4NO/bmTJD+0PVEuvKurySmNfundaoDw
 /G1/Muib3zu/9TCX42+XnZAKxSIIn9LujgaiYtfAjQi5/vzGLV7+PYKZ+3LzSrnKpLEvjWiv3JD
 ZUIpDDUtENeXQaN+NjIrkClARxz7eezVsp4jrinOrjNQS78GmPFJUzdzzobOizjcV3vspu+Eej3
 YLg+s5Rtxetb4Dt5cbn45xicfh6LG26ReJNAqAXYaSpFPZChVL6KGDrue6ZOOiXj+GrgS8hd87W
 0bodexEtHFzR6TEHY5/XfVuboezlgBJZaT+Xtr3J7vRNlMeml7jqsH6cagDCK9wrRyX76yA1iVd
 eFSpz4D7Vcn1fJNXrutU1ub32WxbvQt4UZyyDnPDmz6SdIXr8lubPPVk8vNvX71t9ViGziT7/Lu
 3TGfAPgsyJqcstC2Vew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030072
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[30];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101610-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAC8239202C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/27/2026 10:16 AM, Jie Gan wrote:
>
>
> On 3/17/2026 11:26 AM, Songwei Chai wrote:
>> Add driver to support device TGU (Trigger Generation Unit).
>> TGU is a Data Engine which can be utilized to sense a plurality of
>> signals and create a trigger into the CTI or generate interrupts to
>> processors. Add probe/enable/disable functions for tgu.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>>   drivers/Makefile                              |   1 +
>>   drivers/hwtracing/Kconfig                     |   2 +
>>   drivers/hwtracing/qcom/Kconfig                |  18 ++
>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>   drivers/hwtracing/qcom/tgu.c                  | 183 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>>   7 files changed, 267 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>> b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> new file mode 100644
>> index 000000000000..ead237bb7d89
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -0,0 +1,9 @@
>> +What:        /sys/bus/amba/devices/<tgu-name>/enable_tgu
>> +Date:        March 2026
>> +KernelVersion    7.1
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the enable/disable status of TGU
>> +        Accepts only one of the 2 values -  0 or 1.
>> +        0 : disable TGU.
>> +        1 : enable TGU.
>> diff --git a/drivers/Makefile b/drivers/Makefile
>> index 53fbd2e0acdd..82b712a12a26 100644
>> --- a/drivers/Makefile
>> +++ b/drivers/Makefile
>> @@ -177,6 +177,7 @@ obj-$(CONFIG_RAS)        += ras/
>>   obj-$(CONFIG_USB4)        += thunderbolt/
>>   obj-$(CONFIG_CORESIGHT)        += hwtracing/coresight/
>>   obj-y                += hwtracing/intel_th/
>> +obj-y                += hwtracing/qcom/
>>   obj-$(CONFIG_STM)        += hwtracing/stm/
>>   obj-$(CONFIG_HISI_PTT)        += hwtracing/ptt/
>>   obj-y                += android/
>> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
>> index 911ee977103c..8a640218eed8 100644
>> --- a/drivers/hwtracing/Kconfig
>> +++ b/drivers/hwtracing/Kconfig
>> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>>     source "drivers/hwtracing/ptt/Kconfig"
>>   +source "drivers/hwtracing/qcom/Kconfig"
>> +
>>   endmenu
>> diff --git a/drivers/hwtracing/qcom/Kconfig 
>> b/drivers/hwtracing/qcom/Kconfig
>> new file mode 100644
>> index 000000000000..d6f6d4b0f28e
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Kconfig
>> @@ -0,0 +1,18 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# QCOM specific hwtracing drivers
>> +#
>> +menu "Qualcomm specific hwtracing drivers"
>> +
>> +config QCOM_TGU
>> +    tristate "QCOM Trigger Generation Unit driver"
>> +    help
>> +      This driver provides support for Trigger Generation Unit that is
>> +      used to detect patterns or sequences on a given set of signals.
>> +      TGU is used to monitor a particular bus within a given region to
>> +      detect illegal transaction sequences or slave responses. It is 
>> also
>> +      used to monitor a data stream to detect protocol violations 
>> and to
>> +      provide a trigger point for centering data around a specific 
>> event
>> +      within the trace data buffer.
>> +
>> +endmenu
>> diff --git a/drivers/hwtracing/qcom/Makefile 
>> b/drivers/hwtracing/qcom/Makefile
>> new file mode 100644
>> index 000000000000..5a0a868c1ea0
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_QCOM_TGU) += tgu.o
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> new file mode 100644
>> index 000000000000..58c19f12f3d7
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -0,0 +1,183 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/amba/bus.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "tgu.h"
>> +
>> +static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    /* Enable TGU to program the triggers */
>> +    writel(1, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +}
>> +
>> +static int tgu_enable(struct device *dev)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    if (drvdata->enabled)
>> +        return -EBUSY;
>> +
>> +    tgu_write_all_hw_regs(drvdata);
>> +    drvdata->enabled = true;
>> +
>> +    return 0;
>> +}
>> +
>> +static void tgu_do_disable(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    writel(0, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +
>> +    drvdata->enabled = false;
>> +}
>> +
>> +static void tgu_disable(struct device *dev)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    if (!drvdata->enabled)
>> +        return;
>> +
>> +    tgu_do_disable(drvdata);
>> +}
>> +
>> +static ssize_t enable_tgu_show(struct device *dev,
>> +                   struct device_attribute *attr, char *buf)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    bool enabled;
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    enabled = drvdata->enabled;
>> +
>> +    return sysfs_emit(buf, "%d\n", !!enabled);
>> +}
>> +
>> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) 
>> triggers. */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +                struct device_attribute *attr,
>> +                const char *buf,
>> +                size_t size)
>> +{
>> +    unsigned long val;
>> +    int ret;
>> +
>> +    ret = kstrtoul(buf, 0, &val);
>> +    if (ret || val > 1)
>> +        return -EINVAL;
>> +
>> +    if (val) {
>> +        ret = pm_runtime_resume_and_get(dev);
>> +        if (ret)
>> +            return ret;
>> +        ret = tgu_enable(dev);
>> +        if (ret) {
>> +            pm_runtime_put(dev);
>> +            return ret;
>> +        }
>> +    } else {
>> +        tgu_disable(dev);
>> +        pm_runtime_put(dev);
>
> Sorry I didnt observe this issue with my previous check.
>
> echo 0 to the disabled device will result in the pm_runtime reference 
> number goes to negative. We dont need pm_runtime_put(dev) when we try 
> to disable a diabled device.
>
> Thanks,
> Jie
Thanks for your careful catch here, Jie.
"pm_runtime_put(dev);" will be removed here in next version.
>
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(enable_tgu);
>> +
>> +static struct attribute *tgu_common_attrs[] = {
>> +    &dev_attr_enable_tgu.attr,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group tgu_common_grp = {
>> +    .attrs = tgu_common_attrs,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group *tgu_attr_groups[] = {
>> +    &tgu_common_grp,
>> +    NULL,
>> +};
>> +
>> +static int tgu_probe(struct amba_device *adev, const struct amba_id 
>> *id)
>> +{
>> +    struct device *dev = &adev->dev;
>> +    struct tgu_drvdata *drvdata;
>> +    int ret;
>> +
>> +    drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +    if (!drvdata)
>> +        return -ENOMEM;
>> +
>> +    drvdata->dev = &adev->dev;
>> +    dev_set_drvdata(dev, drvdata);
>> +
>> +    drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +    if (IS_ERR(drvdata->base))
>> +        return PTR_ERR(drvdata->base);
>> +
>> +    spin_lock_init(&drvdata->lock);
>> +
>> +    ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>> +    if (ret) {
>> +        dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    drvdata->enabled = false;
>> +
>> +    pm_runtime_put(&adev->dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static void tgu_remove(struct amba_device *adev)
>> +{
>> +    struct device *dev = &adev->dev;
>> +
>> +    sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
>> +
>> +    tgu_disable(dev);
>> +}
>> +
>> +static const struct amba_id tgu_ids[] = {
>> +    {
>> +        .id = 0x000f0e00,
>> +        .mask = 0x000fffff,
>> +    },
>> +    { 0, 0, NULL },
>> +};
>> +
>> +MODULE_DEVICE_TABLE(amba, tgu_ids);
>> +
>> +static struct amba_driver tgu_driver = {
>> +    .drv = {
>> +        .name = "qcom-tgu",
>> +        .suppress_bind_attrs = true,
>> +    },
>> +    .probe = tgu_probe,
>> +    .remove = tgu_remove,
>> +    .id_table = tgu_ids,
>> +};
>> +
>> +module_amba_driver(tgu_driver);
>> +
>> +MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
>> +MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
>> +MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> new file mode 100644
>> index 000000000000..dd7533b9d735
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _QCOM_TGU_H
>> +#define _QCOM_TGU_H
>> +
>> +/* Register addresses */
>> +#define TGU_CONTROL        0x0000
>> +#define TGU_LAR        0xfb0
>> +#define TGU_UNLOCK_OFFSET    0xc5acce55
>> +
>> +static inline void TGU_LOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        /* Wait for things to settle */
>> +        mb();
>> +        writel_relaxed(0x0, addr + TGU_LAR);
>> +    } while (0);
>> +}
>> +
>> +static inline void TGU_UNLOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
>> +        /* Make sure everyone has seen this */
>> +        mb();
>> +    } while (0);
>> +}
>> +
>> +/**
>> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator 
>> Unit)
>> + * @base: Memory-mapped base address of the TGU device
>> + * @dev: Pointer to the associated device structure
>> + * @lock: Spinlock for handling concurrent access to private data
>> + * @enabled: Flag indicating whether the TGU device is enabled
>> + *
>> + * This structure defines the data associated with a TGU device,
>> + * including its base address, device pointers, clock, spinlock for
>> + * synchronization, trigger data pointers, maximum limits for various
>> + * trigger-related parameters, and enable status.
>> + */
>> +struct tgu_drvdata {
>> +    void __iomem *base;
>> +    struct device *dev;
>> +    spinlock_t lock;
>> +    bool enabled;
>> +};
>> +
>> +#endif
>

