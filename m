Return-Path: <linux-arm-msm+bounces-108908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN97KUV/Dmqe/AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:43:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E784659E86E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 05:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7161730180B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 03:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E356234DCEB;
	Thu, 21 May 2026 03:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otHukdjL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VOUOXefT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EB2299959
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 03:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779334978; cv=none; b=C3X8yWfF+oVCwVYzP9AkhytbzmjSYbtlyGyPrBKYrYVlC/AMvcsYwUtB9uHxKbCT4RuuTpFaoxNpCss7Hh35iIS7iMz3duY4daJAVISPil43yp8ZJ9xA9Rou5Qm8ZeSbipQLeDeNuBvG7Ed2RTRZo9M+GYKBJOdM4jHMDr23A1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779334978; c=relaxed/simple;
	bh=/XjCPxEgGNN+atUEroSNZFqHio63EwE/Ev/LLcgANKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOCudAd/NTZiA+0lJR0ZIhw7IGJv1ZFvpjJ6IEEWcIKB5UiFWhojNrcobpE/OxUQCV1QjFfYaa2kDcx0Rj6+HIkYfTlXQFl5X+rgGW6pq44yMYZbVm/ORQhuOR/wYmGke7M6eMNr4WL2EQslVWwEykjQwE7Dv82hL5IrVKjqXiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otHukdjL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VOUOXefT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KLKRa63680274
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 03:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xD5NLpXfnIseB9t5q7naGLC9DxcIYZPc4Gj/KvnSuTc=; b=otHukdjLjLP/a0v+
	GZmZgBpQBVcGemFoWKF9OoFOSUvPetMbMyXqmdMiTX+P/YStfx0OAXh4I4FnGm1U
	AIZ3aZZcK/OmrsJU7J6Q4spuZc2zTw8kRNTh2qwyU8+XTZeK/X4uwr0OA1dwV1yf
	l04ZvB25l2Ig/KvlX8GIAw7qL6gWevCeLnljm9sPwgHshkRwCchqOx6VW5fkVpr3
	VbAJvZHUIHS+/kHRuSxg2k3S0ynw7u8ogMcNycaBVQUR2kcf7e1teZAk7hAO5hv/
	Ij99zbu1I+YXsWomEryopQz/o7pdNj2zakear5DmtNn3GUZEkwYeEorE45uVBeOy
	+MG0Rw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j2x40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 03:42:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba718173d1so95070925ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 20:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779334976; x=1779939776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xD5NLpXfnIseB9t5q7naGLC9DxcIYZPc4Gj/KvnSuTc=;
        b=VOUOXefTwdADgc7Z2HF17qt16iNdGda2ISHsa7ownwKWtLx5QXMX9hI25/7I6BVHKV
         TUel36VoqMFjlZP+S6WzPVCuOBtHvVwIC3WDVXXShArt8Enylcz39plnk9fL/lpX7DCv
         Buv65PaLI7XYX1btQRrtBYWJoFO7MEuN+cV69dBwaW86EGbByNL/ItcOi0U9C/jfmqw2
         SOUOJ1Q7fP5jL1rxXo/mwzGpN/HWNG7pxJZ913LemXxZk7GclhufFTsJXYQ7djt98DUa
         FJ3VCmcvXyP/mAmSNUO2o4cHNxrIYnRtt1TiH4lgRtq89TIo8h91AuNxQ7j0nONsCEUS
         9yMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779334976; x=1779939776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xD5NLpXfnIseB9t5q7naGLC9DxcIYZPc4Gj/KvnSuTc=;
        b=fw/ihkyPX4jvk+FH1oSDQD54u6Jne0lKefY6db7Z7yqmcbZM1y4k343oFlLDLuGh/f
         EjxTh2eiNqDZBYAN6wWvfvTVZZ4GrNb8F1pqJtQhSSa7RzztO5AfVTqQT3KKs5F2fr5E
         7suk/IZyMxRG1OJKkPRrAqxRj77Rqz/dhuzoYkVh3vg/xsqvhQa9/f0C/FmyWpW0hPsx
         Zl2VaxjHlaQGzsGDG1qFHN+181aA1cqrZjEc/TPFdV1axqXHnqoFKlB65cjWt+y+qKFp
         bK8Q6Af4ZiGv2RUKx8h+Z6C57rTnENvtegYeQ2ui9mUUAZTfxjBz7dqXR9TjzWeoetbA
         TSVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RE82kiM7FTx/ycz2HvOYz3+idyKEkiMbpiRbfPbMA96m2PSxKw+8Wx9C57GoIqKnM4d9+VUrfi3vaohz9@vger.kernel.org
X-Gm-Message-State: AOJu0YwA3qyFMpAXoPddTXMq4HXwyhmC6Wk/lvTdfoMRQToFkcEhCQp3
	dT+hYwhuaZRi5f8i3zhMMeCyUJ2gmEjyfqqMFAbPclGcHgYFim/lP0eqAjI1HuXcHdwWIGhqBTQ
	8m5RDK2jBFSk4y4Q5DyuOFiG4gbsmgqLWgafn3e2/AeVVwpQEu1HxAjYSFERrFwteKb51
X-Gm-Gg: Acq92OEDLUam7OYjV4GKwtRxvvpn7DJrcp3Er/qlAZY+rImG2I8z+6Oj4urGPaZxsZU
	+LcMgFfFhXDXc2BKIFbQWAG+Jz+7byG1hP/TvscM8Vz9/XRTjOyWBNkqp8MfPxdc1tD8TITzAcF
	PscS6AwT1lW3GYTIdY8QEeSEuHD4Deg/VlE/gcpuPQBoYjNCoKJjpUgKf7mF9vtZCuO625P8C9u
	oEH+Bp1uNt6AkOKTzVYRwCjZIpB0DYdYvOWdpEOFGft1xJIqO3/9nUAjefqPSWlOGA6em5ogkN9
	+FkgmKBDxAm4t07ZhSZ6T9t3Mxt8aT1kncd5LpkfniaFY/hQraxtDs7SnC5zJGqRtHzGo7B7L85
	WBodqPbYhlKmTcVQFNuA+Xl1VwoLMqRak+dvw/3wlV1dj3xJDp1S41OC8wujtBzZwIuXHoIkqCB
	bgoUp9NS1b2yYKFE3W
X-Received: by 2002:a05:6a20:9185:b0:3a2:d838:bfdb with SMTP id adf61e73a8af0-3b30885a85dmr1362748637.29.1779334976010;
        Wed, 20 May 2026 20:42:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:9185:b0:3a2:d838:bfdb with SMTP id adf61e73a8af0-3b30885a85dmr1362699637.29.1779334975454;
        Wed, 20 May 2026 20:42:55 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb115c38sm21138070a12.28.2026.05.20.20.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 20:42:55 -0700 (PDT)
Message-ID: <e67907bc-ce96-4654-b210-2ae8f35cacc7@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:42:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260520082747.7seyyua4gfv256ev@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0e7f40 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h3XtbvSS6J2BgG28aqoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Crx3sAJbjNUxx3p7HztitZKX70vUo4gp
X-Proofpoint-ORIG-GUID: Crx3sAJbjNUxx3p7HztitZKX70vUo4gp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAzMiBTYWx0ZWRfX0OBH1ndlrtFr
 lZSXOYIPMUoYLCVEA4cA1bSGTiTFmi60vIqlSqKHEIb5PPk8Us1yeTAMmgVi9M9ZJ1Irq+/lNvi
 MMA7bcHAv7ecwjbVoyDInt3MrWwBX4bKUSjImy9h/TsviiKfgzV6RILN9Ogsl3YFKFn7vZYXJgu
 aUMbhO488A1PpdyNF4LWDmCifqE/dgeNhSLsjKt4yrF2Y47cFdxtUY2c9DbtLRNfKeRTw5H30AA
 LLUaeWyf1rm+4dewE/i8OA4mixVDXTlmH2oP1Mo91OfWDiKfIyePGOTcbIJfcHdKFm6vkOugwnT
 P04yQYOgzYJkXA/V5Hoc6GPsc4FJL8YlAabciIFZrZam26eTiAOLxw44gvzmuOiK984ase7bb07
 etIO98fW/M7bvkK8e8ooXxnoCh6NXhZzn7PhmLZNN+Lha/eNyjLdYU2txtcp1/QVQJqFtbzOY7f
 iZvUli5qxP0oNHoa4pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210032
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
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108908-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E784659E86E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/2026 4:27 PM, Mukesh Ojha wrote:
> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits.
>>
>> A new qcom_pas_attach() function is introduced. if a crash state is
>> detected for the subsystem, rproc_report_crash() is called. If the ready
>> state is detected, it will be marked as "attached", otherwise it could
>> be the early boot feature is not supported by other entities. In this
>> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
>> can load the firmware and start the remoteproc.
>>
>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index da27d1d3c9da..ac2a00aacd2e 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>>   	int region_assign_count;
>>   	bool region_assign_shared;
>>   	int region_assign_vmid;
>> +	bool early_boot;
>>   };
>>   
>>   struct qcom_pas {
>> @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>   	return qcom_q6v5_panic(&pas->q6v5);
>>   }
>>   
>> +static int qcom_pas_attach(struct rproc *rproc)
>> +{
>> +	int ret;
>> +	struct qcom_pas *pas = rproc->priv;
>> +	bool ready_state;
>> +	bool crash_state;
>> +
>> +	pas->q6v5.handover_issued = true;
>> +	enable_irq(pas->q6v5.handover_irq);
>> +
>> +	pas->q6v5.running = true;
>> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>> +
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (crash_state) {
>> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> 
> I am not sure if this is already discussed, but what if it is the first
> crash with recovery and coredump enabled? What would be in the dump,
> nothing? As there is no segment, is it expected since Linux did not load
> this?
> 
> This is even true if it is a crash after a successful attach.
> 

It is suggested by Bjorn:
https://lore.kernel.org/all/qfls6xlvfppqw7p6rjpmzqesh6sbob4myfc6dz47qh3jywqrjk@5xiutkbybk5d/

I did a hack to test the recovery by setting crash_state true, it can recovery
(stop and start) successfully with below patches:
https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/

For coredump, it will return from the first "list_empty(&rproc->dump_segments)" check in
rproc_coredump as segments are not configured in attach.

Thanks,
Jingyi


> @Sibi, has this series been tested on Glymur with KVM?
> I don't see the iommu property in the below patch.
> https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com/
> 


