Return-Path: <linux-arm-msm+bounces-112554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aWaaGeS9KWpmcgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 21:41:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B86E66C8B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 21:41:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j01KYfzd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WXCeVMZG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112554-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112554-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 305513002F75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1353737B036;
	Wed, 10 Jun 2026 19:41:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3669737B018
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 19:41:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781120479; cv=none; b=MD/HO/nYSpTWoBIyCdhpBuh0a+ugHgUB/maXgNEpoOivJnGsmSOdd+5wxMViFqyTQEdsmOavNWQF4ne/AXmC26D2cJVH+4y+U2u5VDtTjoo492WV19LklryyUHxHh4FOjSHQC/QlwwpA4+4eZ9urGIrbuesawl2KKmCEQHM+ptY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781120479; c=relaxed/simple;
	bh=g5/Ofsl03+8N0WvSMiLEwq5x8smVDUw0THHJiGfC8jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jOukg/DZoUugqrLR9GWrFd4ARSk2ZPfWqThxUF09reVyUofrxTnVhV9VHzmA+Tef8WwHaqP18wdErDDZlH6/MJp9WY0aCbqehsKDsxrNJc0L5u1GKaSb2jqbdb43+XhjrSo3FRIx7BZ9ZZzlfTaKkZmaADwPsNWdA717MRQiaS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j01KYfzd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXCeVMZG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AJYdRm2545950
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 19:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7SUFEKWjPsAnYpOR216K/K8sFu8L1tKoAtfRugZJ46k=; b=j01KYfzdPTEEOwRX
	Jb2QeJdNzuIHGh/9lf7iopypRa3CCk3jiuXdfnKLVR+0BFBW34tF+3R3jFSLYhBV
	vMOE8zjHR71ZRI3lwIGRVccVrqnOu+fnleUCJmShEFKfelncb3WuUk/fc0sZT4Rj
	z/2kIPNn246qPh8M9EI7rpIB1PBSwrwZSQoE8Z5lhdqBOUDPaIap4J9mlKIsGD3V
	k/qurQnA6JxkjX8gQI5ZiQLKJBl8Gh3PGMhXcfYZhOxFYlyVbXjpLRoIHdScGzbq
	h8i4OHsfnXP+rmqkAPv8EUpx1eBi7mIxk86ycamqrpg9XysiLYPP3btSHCMFgiQ9
	UJiEWw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7000uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 19:41:16 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-13815cb1507so12617740c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781120476; x=1781725276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7SUFEKWjPsAnYpOR216K/K8sFu8L1tKoAtfRugZJ46k=;
        b=WXCeVMZGj4jn19p0W763RROlWSnTCoKpnd+83huScSsMKvFlYtAz9rOhCv4Uf6U2L1
         eohhwy5r18rkxBhvXWEOlS+PgbFrJI5bRsonEZMDZ2P4dlxO2vQcTlhHhRskcuTVjv1b
         LiYU9bVxKgdCPO9X42aCYPlPyk+lQbWAGQdlM91JGFg+nXIySUtiQHApfDRp1VqccoeF
         O7WkNBWQs3fw0JyOHm6wbzsuI+bvbm24evwSjHtGu+QlK7IKfiaNH7OrFdQq1BM2l0vU
         muSyhLwSLeNBVTNTZPugkiPv+aYRi43EiVSE7MY6QuImSrDFysMMhClDh8ZrsFSDwB5I
         97LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781120476; x=1781725276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SUFEKWjPsAnYpOR216K/K8sFu8L1tKoAtfRugZJ46k=;
        b=GVQrZHLwsMNLZ3wLIynh1hjHRE9/l+VpJfSmYAODe3YWCmlew+Iut9Z2N+dtv8NCpP
         uJ0n5fVkO3qRRx84WyN47hjEOoXEZ0TZSNo608BHUt33WuAr2S7kE3156cIIQypT86Bt
         P+x5ZDlz171wgUFU576OL0c2sK5K4tYcON/t3Fcado0zG2h6dE/uaKxB6CyYj0CZBcTH
         awH2QQNIcRT1B2/D2rdNgwYTJzkDcKArMdbKXLS1J/OoKW9F5qDUdAmVsUyIDNxsoU8m
         eufRCNuteCWF9UjRtlwDxZh19fm0HhblzhntDcLERnQXXNh6i8vHWZMjZpWlztvVMg/z
         Au5A==
X-Gm-Message-State: AOJu0YyaNkOPHakoH7ziAqdaNZYShKfK337amSBvwhNmFRAMyZZ7YGk0
	HT/p2pLi4OV7PTJlq91raQYLhCvPO+/DXUErq4xS4s9Cy3621iEICxmzK0vN5EFRq4fJ91mHPE0
	GaAi3gNMnx5ztah4Y8MuJspJup4gxam0pIbLxqHllh1IyzraZjiMZuc2wmj9fye5x2iMk
X-Gm-Gg: Acq92OH614LkE7L8gg4LWD6icvgk79JN7RKpDfS8flKDSdzIsGFusLJ4iRXPxl1F7qR
	NWJmnmgUXqyzcQwHBsM70egMavaG+wU/rfub9w571+Ll4gusFcX/90p6pxECgMFPXONuWBxwOEw
	FHry5umo7mvDvAZpp/dWw7DMKjVJy37zOOlzlL8pIhQFrgTHR0cZMD/eg7wcE6p0chosiw9xIjE
	Ib93iYh+WkxE/FqEzwEbfkFfxCYG8t8IKHriYCNQFVAAFn5+HIwz9/4iHsi0VKHHQYtJXLwDLfW
	cAGXUqPaqjRdkG7O4b/wbncjn4V8SWTEOOqMxlg7uXuyrjEOu25X++Vzt2dq3ok4sN5SpjO4Ggq
	hwOwRwi1pYpmcBkpzg+JZaWGtVYRX4Va5GtdJSc4aKdNEc5ZkNmoMcpKA1PBlSZj2
X-Received: by 2002:a05:6a20:6a20:b0:398:837a:7af0 with SMTP id adf61e73a8af0-3b4ccf82d99mr31713274637.30.1781120008737;
        Wed, 10 Jun 2026 12:33:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a20:b0:398:837a:7af0 with SMTP id adf61e73a8af0-3b4ccf82d99mr31713213637.30.1781120007955;
        Wed, 10 Jun 2026 12:33:27 -0700 (PDT)
Received: from [192.168.2.6] ([49.204.16.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c864874da11sm2947108a12.20.2026.06.10.12.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 12:33:27 -0700 (PDT)
Message-ID: <4417c3f9-854a-4613-bf14-777181daeff3@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 01:03:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
 <a1b599f9-44a8-4cd6-b4ea-5c28eef9f221@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <a1b599f9-44a8-4cd6-b4ea-5c28eef9f221@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE4NyBTYWx0ZWRfX78v0N9Y7fi0V
 B4Xpz7964CzELkthlZBpXGef6eI+jdbSde1JLHd+OtcpKVjYZSHMsBkOy97dkDem7ZH10Rre0Lc
 y2cOFtXsE3mNB2oAAQ4NmUUK7f/CKW9d55SDFoFg8Kq57HQ6e0YAf2Qwo01v2Gjj9z98lXoduXc
 LvSg2dwFHx/+Tv6iKDHNcTlxLnnlRbpeVC2CtPuk61MZjeFh1ONjfrFatJz8kCtXg0pWZVQy7B5
 aIQhqH/IA1PfaCZ3Y+IRh0UyIjPhKfVuQ83V5bDvkLugi7YIYAJE/xFGIwbKwIRBllWk6LKFr2Y
 abKPljTSOlvapwDo19oTJvjrHpIcVRa9GBiYclcf51vSYhiyPNg/RhzVx6zZu3ZwYPlSuo/oFhP
 e/+5LfpBmIExNHCrXQcfggU3VrnmOY/6DweKRtKOcIR6+4qq0KBv5d/hXpHXQ4fI1J4O5RR8ZAd
 AWnCZJUxM8a1PeY3MCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEwMDE4NyBTYWx0ZWRfXwhdDNNDfA0IJ
 HpJ2ndHfJ0yOBgNTSPOFzlC2T67EihIcQTZF3JioKt40S71jRmn9pM3+uTK5Oqr0BUtQWZLITEP
 XlpwzAIAnKQBszxF0NH5XSN0m76ho34=
X-Proofpoint-GUID: d48TPdifW6InVlDqysb_78-dgY3crjj6
X-Proofpoint-ORIG-GUID: d48TPdifW6InVlDqysb_78-dgY3crjj6
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a29bddc cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=80DA36llApf5Npk0Bpmn+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=XCvaPOw2vJVSrvyNqp8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606100187
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112554-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B86E66C8B2

Hi Daniel,


On 5/27/2026 12:06 AM, Daniel Lezcano wrote:
> On 5/19/26 12:49, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various power
>> domains including System, SoC, CPU clusters, GPU, and various other
>> subsystems.
>>
>> The driver integrates with the Linux powercap framework, exposing SPEL
>> capabilities through powercap sysfs interfaces.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi 
>> <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                  |   1 +
>>   drivers/powercap/Kconfig     |  13 +
>>   drivers/powercap/Makefile    |   1 +
>>   drivers/powercap/qcom_spel.c | 787 +++++++++++++++++++++++++++++++++ 
>> ++++++++++
>>   4 files changed, 802 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c63f147e8c54..5c7542754ab6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22238,6 +22238,7 @@ M:    Manaf Meethalavalappu Pallikunhi 
>> <manaf.pallikunhi@oss.qualcomm.com>
>>   L:    linux-arm-msm@vger.kernel.org
>>   S:    Maintained
>>   F:    Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
>> +F:    drivers/powercap/qcom_spel.c
>>   QUALCOMM PPE DRIVER
>>   M:    Luo Jie <quic_luoj@quicinc.com>
>> diff --git a/drivers/powercap/Kconfig b/drivers/powercap/Kconfig
>> index 03c4c796d993..e3a47c653499 100644
>> --- a/drivers/powercap/Kconfig
>> +++ b/drivers/powercap/Kconfig
>> @@ -93,4 +93,17 @@ config DTPM_DEVFREQ
>>       help
>>         This enables support for device power limitation based on
>>         energy model.
>> +
>> +config QCOM_SPEL
>> +    tristate "Qualcomm SPEL Powercap driver"
>> +    depends on ARM64 || COMPILE_TEST
>> +    help
>> +      This enables support for the Qualcomm SoC Power and Electrical
>> +      Limits (SPEL) hardware, which allows power limits to be
>> +      enforced and monitored on Qualcomm SoCs.
>> +
>> +      SPEL provides energy monitoring and power capping for multiple
>> +      domains including system, SoC, CPU clusters, GPU, and various
>> +      other subsystems.
>> +
>>   endif
>> diff --git a/drivers/powercap/Makefile b/drivers/powercap/Makefile
>> index 5ab0dce565b9..8235fb9d3df6 100644
>> --- a/drivers/powercap/Makefile
>> +++ b/drivers/powercap/Makefile
>> @@ -8,3 +8,4 @@ obj-$(CONFIG_INTEL_RAPL) += intel_rapl_msr.o
>>   obj-$(CONFIG_INTEL_RAPL_TPMI) += intel_rapl_tpmi.o
>>   obj-$(CONFIG_IDLE_INJECT) += idle_inject.o
>>   obj-$(CONFIG_ARM_SCMI_POWERCAP) += arm_scmi_powercap.o
>> +obj-$(CONFIG_QCOM_SPEL) += qcom_spel.o
>> diff --git a/drivers/powercap/qcom_spel.c b/drivers/powercap/qcom_spel.c
>> new file mode 100644
>> index 000000000000..fed5647959a5
>> --- /dev/null
>> +++ b/drivers/powercap/qcom_spel.c
>> @@ -0,0 +1,787 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Qualcomm SPEL (SoC Power and Electrical Limits) Driver
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/bitmap.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/powercap.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>> +
>> +/* SPEL register bitmasks */
>> +#define ENERGY_STATUS_MASK        0xFFFFFFFF
>> +
>> +#define POWER_LIMIT_MASK        0x00007FFF
>> +#define POWER_LIMIT_ENABLE        BIT(31)
>> +
>> +#define TIME_WINDOW_MASK_L        0x00007FFF    /* bits [14:0] */
>> +#define TIME_WINDOW_MASK_H        0x007F0000    /* bits [22:16] */
>> +
>> +#define ENERGY_UNIT_OFFSET        16
>> +#define ENERGY_UNIT_MASK        0xF0000
>> +
>> +#define TIME_UNIT_OFFSET        8
>> +#define TIME_UNIT_MASK            0xF00
>> +
>> +#define POWER_UNIT_OFFSET        0
>> +#define POWER_UNIT_MASK            0x7
>> +
>> +#define LIMITS_CAPABILITY_OFFSET    0x20
>> +#define ENERGY_RPT_UNIT_OFFSET        0x04
>> +
>> +#define ENERGY_UNIT_SCALE        1000
>> +
>> +#define SPEL_DOMAIN_NAME_LENGTH        16
>> +
>> +/* Domain types */
>> +enum spel_domain_type {
>> +    SPEL_DOMAIN_SYS,
>> +    SPEL_DOMAIN_SOC,
>> +    SPEL_DOMAIN_CL0,
>> +    SPEL_DOMAIN_CL1,
>> +    SPEL_DOMAIN_CL2,
>> +    SPEL_DOMAIN_IGPU,
>> +    SPEL_DOMAIN_DGPU,
>> +    SPEL_DOMAIN_NSP,
>> +    SPEL_DOMAIN_MMCX,
>> +    SPEL_DOMAIN_INFRA,
>> +    SPEL_DOMAIN_DRAM,
>> +    SPEL_DOMAIN_MDM,
>> +    SPEL_DOMAIN_WLAN,
>> +    SPEL_DOMAIN_USB1,
>> +    SPEL_DOMAIN_USB2,
>> +    SPEL_DOMAIN_USB3,
>> +    SPEL_DOMAIN_MAX,
>> +};
>> +
>> +/* Power limit IDs */
>> +enum spel_power_limit_id {
>> +    POWER_LIMIT1,
>> +    POWER_LIMIT2,
>> +    POWER_LIMIT3,
>> +    POWER_LIMIT4,
>> +    NR_POWER_LIMITS,
>> +};
>> +
>> +/* Unit types for conversion */
>> +enum unit_type {
>> +    POWER_UNIT,
>> +    ENERGY_UNIT,
>> +    TIME_UNIT,
>> +};
>> +
>> +/* Power limit operation types */
>> +enum pl_ops_type {
>> +    PL_LIMIT,
>> +    PL_TIME_WINDOW,
>> +};
>> +
>> +static const char *pl_names[NR_POWER_LIMITS] = {
>> +    [POWER_LIMIT1] = "pl1",
>> +    [POWER_LIMIT2] = "pl2",
>> +    [POWER_LIMIT3] = "pl3",
>> +    [POWER_LIMIT4] = "pl4",
>> +};
> 
> Do you want to use NR_POWER_LIMITS instead of ARRAY_SIZE() ?

ACK, I will move to ARRAY_SIZE>
> Please unify the naming NR_POWER_LIMITS -> POWER_LIMITS_MAX

ACK

> 
>> +static const char *const spel_domain_names[] = {
>> +    "sys", "soc", "cl0", "cl1", "cl2", "igpu", "dgpu", "nsp",
>> +    "mmcx", "infra", "dram", "mdm", "wlan", "usb1", "usb2", "usb3",
>> +};
>> +
>> +/* Domain register offsets in node base */
>> +static const u32 domain_offsets[SPEL_DOMAIN_MAX] = {
>> +    [SPEL_DOMAIN_SYS]    = 0x40,
>> +    [SPEL_DOMAIN_SOC]    = 0x00,
>> +    [SPEL_DOMAIN_CL0]    = 0x5C,
>> +    [SPEL_DOMAIN_CL1]    = 0x60,
>> +    [SPEL_DOMAIN_CL2]    = 0x64,
>> +    [SPEL_DOMAIN_IGPU]    = 0x08,
>> +    [SPEL_DOMAIN_DGPU]    = 0x44,
>> +    [SPEL_DOMAIN_NSP]    = 0x0C,
>> +    [SPEL_DOMAIN_MMCX]    = 0x10,
>> +    [SPEL_DOMAIN_INFRA]    = 0x18,
>> +    [SPEL_DOMAIN_DRAM]    = 0x1C,
>> +    [SPEL_DOMAIN_MDM]    = 0x48,
>> +    [SPEL_DOMAIN_WLAN]    = 0x4C,
>> +    [SPEL_DOMAIN_USB1]    = 0x50,
>> +    [SPEL_DOMAIN_USB2]    = 0x54,
>> +    [SPEL_DOMAIN_USB3]    = 0x58,
>> +};
> 
> Same comment

ACK

> 
>> +/**
>> + * struct spel_constraint_info - Power limit constraint information
>> + * @limit_offset:    Register offset for power limit value
>> + * @time_window_offset:    Register offset for time window
>> + * @supported_mask:    Bit mask in capability register
> 
> Where is 'supported_mask' initialized?

It is part of constraint_info table and used as bit mask to compare 
againt capability config register value during init for each PL for 
different domains.

> 
>> + * @domain_id:        Domain this constraint applies to
>> + * @pl_id:        Power limit ID (PL1, PL2, etc.)
> 
> [ ... ]
> 
>> +
>> +/**
>> + * struct spel_domain - SPEL power domain
>> + * @power_zone:        Powercap zone
>> + * @lock:        Mutex protecting register access
>> + * @sp:            Parent system
>> + * @status_reg:        Energy counter register
>> + * @pl_name:        Power limit names
>> + * @name:        Domain name
>> + * @id:            Domain type ID
>> + */
>> +struct spel_domain {
> 
> [ ... ]
> 
>> +    struct spel_system *sp;
> 
> [ ... ]
> 
>> +struct spel_system {
>> +    struct spel_domain *domains;
> 
> [ ... ]
> 
>> +};
> 
> There is a cyclic dependency between struct spel_system <-> struct 
> spel_domain. Could it be solved ?

ACK

> 
>> +#define power_zone_to_spel_domain(_zone) \
>> +    container_of(_zone, struct spel_domain, power_zone)
>> +
>> +/* Helper functions */
>> +static bool is_pl_valid(struct spel_domain *sd, int pl)
>> +{
>> +    if (pl < POWER_LIMIT1 || pl >= NR_POWER_LIMITS)
>> +        return false;
> 
> The call to this function is strange. It is like you don't trust your 
> own code.

ACK, I will remove it in v2

> 
>> +    return sd->pl_name[pl] ? true : false;
>> +}
>> +
> 
> [ ... ]
> 
>> +
>> +    switch (pl_op) {
>> +    case PL_LIMIT:
>> +        value &= POWER_LIMIT_MASK;
>> +        if (xlate)
>> +            *data = spel_unit_xlate(sd, POWER_UNIT, value, 0);
>> +        else
>> +            *data = value;
>> +        break;
>> +    case PL_TIME_WINDOW:
>> +        /* Decode time window: bits [22:16] are upper 7 bits, [14:0] 
>> are lower 15 bits */
>> +        value = ((value & TIME_WINDOW_MASK_H) >> 16 << 15) |
>> +            (value & TIME_WINDOW_MASK_L);
> 
> [ ... ]
> 
>> +        reg_val = (reg_val & ~POWER_LIMIT_MASK) | new_val;
>> +
> 
> [ ... ]
> 
>> +        if (new_val == 0)
>> +            reg_val &= ~POWER_LIMIT_ENABLE;
>> +        else
>> +            reg_val |= POWER_LIMIT_ENABLE;
>> +        break;
> 
> [ ... ]
> 
>> +    case PL_TIME_WINDOW:
>> +        /*
>> +         * Encode time window: upper 7 bits to [22:16], lower 15 bits 
>> to [14:0]
>> +         * Time window register is separate from limit register 
>> (different offset),
>> +         * so we write only the time window bits without preserving 
>> any enable bit.
>> +         */
>> +        new_val = spel_unit_xlate(sd, TIME_UNIT, value, 1);
>> +        reg_val = (((new_val >> 15) & 0x7F) << 16) |
>> +              (new_val & 0x7FFF);
> 
> 
> The trend today is to use the FIELD_* macros for bits ops

ACK

> 
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    writel(reg_val, reg_addr);
>> +    return 0;
>> +}
>> +
>> +/* Powercap zone operations */
>> +static int spel_get_energy_counter(struct powercap_zone *power_zone, 
>> u64 *energy_raw)
>> +{
>> +    struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
>> +    u64 value;
>> +
>> +    value = readl(sd->status_reg);
> 
> nit: seems an line in between would help for the readability

ACK

> 
>> +    *energy_raw = spel_unit_xlate(sd, ENERGY_UNIT, value, 0);
>> +
>> +    return 0;
>> +}
>> +
>> +static int spel_get_max_energy_counter(struct powercap_zone *pcd_dev, 
>> u64 *energy)
>> +{
>> +    struct spel_domain *sd = power_zone_to_spel_domain(pcd_dev);
>> +
>> +    *energy = spel_unit_xlate(sd, ENERGY_UNIT, ENERGY_STATUS_MASK, 0);
> 
> nit: missing line

ACK>
>> +    return 0;
>> +}
>> +
>> +static int spel_release_zone(struct powercap_zone *power_zone)
>> +{
>> +    return 0;
>> +}
>> +
>> +static int spel_find_nr_power_limit(struct spel_domain *sd)
>> +{
>> +    int i, nr_pl = 0;
>> +
>> +    for (i = 0; i < NR_POWER_LIMITS; i++) {
>> +        if (is_pl_valid(sd, i))
>> +            nr_pl++;
>> +    }
>> +
>> +    return nr_pl;
>> +}
>> +
>> +static const struct powercap_zone_ops zone_ops = {
>> +    .get_energy_uj = spel_get_energy_counter,
>> +    .get_max_energy_range_uj = spel_get_max_energy_counter,
>> +    .release = spel_release_zone,
>> +};
>> +
>> +/* Constraint operations */
>> +static int spel_constraint_to_pl(struct spel_domain *sd, int cid)
>> +{
>> +    int i, j;
> 
> 'j' name is misleading because it is usually used for nested 'for' blocks

ACK

> 
>> +    for (i = POWER_LIMIT1, j = 0; i < NR_POWER_LIMITS; i++) {
> 
> Do not rely on POWER_LIMIT1 because if someday it is moved in the enum, 
> all the code assuming it is zero will be broken

ACK

> 
>> +        if (is_pl_valid(sd, i) && j++ == cid)
>  > +            return i;> +    }
>> +
>> +    return -EINVAL;
>> +}
>> +
>> +static int spel_set_power_limit(struct powercap_zone *power_zone, int 
>> cid,
>> +                u64 power_limit)
>> +{
>> +    struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
>> +    int id;
>> +
>> +    id = spel_constraint_to_pl(sd, cid);
>> +    if (id < 0)
>> +        return id;
>> +
>> +    return spel_write_pl_data(sd, id, PL_LIMIT, power_limit);
>> +}
>> +
>> +static int spel_get_power_limit(struct powercap_zone *power_zone, int 
>> cid,
>> +                u64 *data)
>> +{
>> +    struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
>> +    u64 val;
>> +    int ret, id;
>> +
>> +    id = spel_constraint_to_pl(sd, cid);
>> +    if (id < 0)
>> +        return id;
>> +
>> +    ret = spel_read_pl_data(sd, id, PL_LIMIT, true, &val);
>> +    if (!ret)
>> +        *data = val;
>> +
>> +    return ret;
>> +}
>> +
>> +static int spel_set_time_window(struct powercap_zone *power_zone, int 
>> cid,
>> +                u64 window)
>> +{
>> +    struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
>> +    int id;
>> +
>> +    id = spel_constraint_to_pl(sd, cid);
>> +    if (id < 0)
>> +        return id;
>> +
>> +    return spel_write_pl_data(sd, id, PL_TIME_WINDOW, window);
>> +}
>> +
>> +static int spel_get_time_window(struct powercap_zone *power_zone, int 
>> cid,
>> +                u64 *data)
>> +{
>> +    struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
>> +    u64 val;
>> +    int ret, id;
>> +
>> +    id = spel_constraint_to_pl(sd, cid);
>> +    if (id < 0)
>> +        return id;
>> +
>> +    ret = spel_read_pl_data(sd, id, PL_TIME_WINDOW, true, &val);
>> +    if (!ret)
>> +        *data = val;
>> +
>> +    return ret;
>> +}
>> +
>> +static const char *spel_get_constraint_name(struct powercap_zone 
>> *power_zone,
>> +                        int cid)
>> +{
>> +    struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
>> +    int id;
>> +
>> +    id = spel_constraint_to_pl(sd, cid);
>> +    if (id >= 0)
>> +        return sd->pl_name[id];
>> +
>> +    return NULL;
>> +}
>> +
>> +static const struct powercap_zone_constraint_ops constraint_ops = {
>> +    .set_power_limit_uw = spel_set_power_limit,
>> +    .get_power_limit_uw = spel_get_power_limit,
>> +    .set_time_window_us = spel_set_time_window,
>> +    .get_time_window_us = spel_get_time_window,
>> +    .get_name = spel_get_constraint_name,
>> +};
>> +
>> +static void spel_init_domains(struct spel_system *sp)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < SPEL_DOMAIN_MAX; i++) {
>> +        struct spel_domain *sd = &sp->domains[i];
>> +
>> +        sd->sp = sp;
>> +        snprintf(sd->name, SPEL_DOMAIN_NAME_LENGTH, "%s",
>> +             spel_domain_names[i]);
>> +        sd->id = i;
>> +        sd->status_reg = sp->node_base + domain_offsets[i];
>> +
>> +        /* PL1 is always supported (required for powercap 
>> registration) */
>> +        sp->limits[i] = BIT(POWER_LIMIT1);
>> +        sd->pl_name[POWER_LIMIT1] = pl_names[POWER_LIMIT1];
>> +    }
>> +}
>> +
>> +static int spel_check_unit(struct spel_system *sp)
>> +{
>> +    u32 value, shift;
>> +
>> +    /* Read power_unit and time_unit from offset 0x0 */
>> +    value = readl(sp->config_base);
>> +
>> +    /*
>> +     * Unit calculation: 1 / (2^shift)
>> +     * Masks limit: TIME_UNIT (4 bits, max 15), POWER_UNIT (3 bits, 
>> max 7).
>> +     */
>> +    shift = (value & POWER_UNIT_MASK) >> POWER_UNIT_OFFSET;
>> +    sp->power_unit = 1000000 / (1 << shift);
>> +
>> +    shift = (value & TIME_UNIT_MASK) >> TIME_UNIT_OFFSET;
>> +    sp->time_unit = 1000000 / (1 << shift);
>> +
>> +    /* Read energy_unit from ENERGY_RPT_UNIT_OFFSET */
>> +    value = readl(sp->config_base + ENERGY_RPT_UNIT_OFFSET);
>> +
>> +    /*
>> +     * Unit calculation: 1 / (2^shift)
>> +     * Masks limit: ENERGY_UNIT (4 bits, max 15).
>> +     */
>> +    shift = (value & ENERGY_UNIT_MASK) >> ENERGY_UNIT_OFFSET;
>> +    sp->energy_unit = ENERGY_UNIT_SCALE * 1000000 / (1 << shift);
>> +
>> +    dev_dbg(sp->dev, "Units: energy=%dnJ, time=%dus, power=%duW\n",
>> +        sp->energy_unit, sp->time_unit, sp->power_unit);
>> +
>> +    return 0;
>> +}
>> +
>> +static void spel_detect_powerlimit(struct spel_domain *sd)
>> +{
>> +    struct spel_system *sp = sd->sp;
>> +    u32 capabilities;
>> +    int i, j;
>> +
>> +    capabilities = readl(sp->config_base + LIMITS_CAPABILITY_OFFSET);
>> +
>> +    /* Detect power limits from hardware capabilities */
>> +    for (i = POWER_LIMIT2; i < NR_POWER_LIMITS; i++) {
> 
> For my understanding, why is it starting at POWER_LIMIT2 ?

Since It is failing to register a powercap zone with 0 constraint, I 
need to add alteast one constraint for each domain. PL1 is added by 
default for all domains.

> 
>> +        for (j = 0; j < ARRAY_SIZE(constraints); j++) {
>> +            struct spel_constraint_info *ci = &constraints[j];
>> +
>> +            if (ci->domain_id == sd->id && ci->pl_id == i) {
>> +                if (capabilities & ci->supported_mask) {
>> +                    sp->limits[sd->id] |= BIT(i);
>> +                    sd->pl_name[i] = pl_names[i];
> 
> So, that explains the is_pl_valid()
> 
> Please do not use duplicated array with non-NULL pointer checks
> 
> Or sd->pl_name[] contains all the *valids* power limits, so its size is 
> different than (or equal to) pl_names. Or it is a fixed array with a 
> structure containing a flag telling if it is enabled or not.
> 
> No need to duplicate the array

ACK

> 
>> +                }
>> +                break;
>> +            }
>> +        }
>> +    }
>> +}
>> +
> 
> [ ... ]
> 
>> +static void spel_remove(struct platform_device *pdev)
>> +{
>> +    struct spel_system *sp = platform_get_drvdata(pdev);
>> +    int i;
>> +
>> +    if (!sp)
>> +        return;
> 
> Why test if the value is correct? There is no reason it changed after 
> 'probe' was successful

ACK

Thanks,
Manaf

> 
>> +
>> +    /* Unregister in reverse order: children first, then SOC, then 
>> SYS */
>> +    for (i = SPEL_DOMAIN_MAX - 1; i >= 0; i--)
>> +        powercap_unregister_zone(sp->control_type, &sp- 
>> >domains[i].power_zone);
>> +
>> +    powercap_unregister_control_type(sp->control_type);
>> +}
>> +
>> +static const struct of_device_id spel_of_match[] = {
>> +    { .compatible = "qcom,spel" },
>> +    { }
>> +};
>> +MODULE_DEVICE_TABLE(of, spel_of_match);
>> +
>> +static struct platform_driver spel_driver = {
>> +    .probe = spel_probe,
>> +    .remove = spel_remove,
>> +    .driver = {
>> +        .name = "qcom_spel",
>> +        .of_match_table = spel_of_match,
>> +    },
>> +};
>> +
>> +module_platform_driver(spel_driver);
>> +
>> +MODULE_DESCRIPTION("Qualcomm SPEL Powercap Driver");
>> +MODULE_LICENSE("GPL");
>>
> 


