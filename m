Return-Path: <linux-arm-msm+bounces-111311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gX43CaROImqvUwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 06:20:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF30464508A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 06:20:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TeFlzpWN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U8Cn3BRC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111311-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111311-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1ABB3016916
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 04:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9D53806B6;
	Fri,  5 Jun 2026 04:20:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3291A3154
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 04:20:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780633234; cv=none; b=q6O1tD4QlKadHX2i0zEj4zJlclJ8yGl5spaqP5+w1Prfx5o2bP7KIMDIfqBSBt53LHgaQRp/VJ3eJDFdHMtOb1oZvgny8d51F5Xl1XDIrngoVD6n3YDonYgzmWjbdJ0IgvjMW+FJekVGijRUeFyUsSxMRtihupY7poiktY2OK2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780633234; c=relaxed/simple;
	bh=/1G8Cw1Xjst/4UP/6F2jifftweRUSpOdTYJLuJxQHt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QkV5nWZBwdLrMB6dNl21EIvYXXMWIkvuQ8Cko/LHJ+Fu3H5CMEvGFnsWU3Sc+IsJn5Bm0IeN5xe6Pq7nzTJ3jQ/LzFYmbOHIjDmATY5zHCFSnWPETmfi+NNBNJrI93pDlt8vXtytwaG9duh+Wy1mH/NM8C4X9jYe18mITRSB4gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TeFlzpWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8Cn3BRC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654KKQNn2701382
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 04:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xSdIr74WsECiFVFTbvdmX76z6Kdvl0NJjOUdtSDNmM=; b=TeFlzpWNj1+Gd0M5
	s8EyHohdiVBeqfXS7AbtMxDxWB0DhZJnJFcYpcMgmS2IWh8pyF9o1IRwqQnLte5x
	C12weqeyvinXhsHQ/7C/inAxKeG15KS734M15pxsuO86tOqiYRkYmlcYZiNvbUQ8
	j89prfPIXErFjjDU6bUjZWdyXePDb2cW4C7RutL9P1+jFY2DdiYqUmUADbRPqPns
	liTNrKutgV/twx3SqEtzXgdYqPga92WBrVb5KPILJQX3PeJvXevZPE/4bl2Y7jsp
	4mAkr+qC3cyd3nhG8Sxr4IuYzS/1BpzznRp8HL97lk4gpqXASYz39NbloX70/Zqo
	X0ZrJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekgaj1m19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 04:20:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bc54005a7so1986072a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 21:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780633229; x=1781238029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xSdIr74WsECiFVFTbvdmX76z6Kdvl0NJjOUdtSDNmM=;
        b=U8Cn3BRCRiUgLH4fS0JiAQV3MlDeHkTD7COZ4corXJo2FFpccOAuPjNzzM5ZlWgDWU
         fn3nphROePSdld/RHNTd0kWk/DKaJTQtWQ4xQshVOWBDL7uhCapdq1ObSGfn9zsY0G5h
         twd9nwijWZDOr8Jylk8GdT/Jz3/TU9eP6AjtAcv4p5wIMANKyR7jSEjuV/XsJmXcVGlJ
         wmPzAXo0tP5AQ8XKNW4ggLZtiiCUqsSrWwsRzb1XKKZRYmmfimX+Jh8wjIDyKJ+TBYol
         dn8usLY3kgNSuZdbS4WX/UmZhrAmlqRUma/JbVWGpSfrggTy3BTJ0Q44GZzeVZlGYzt4
         eH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780633229; x=1781238029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xSdIr74WsECiFVFTbvdmX76z6Kdvl0NJjOUdtSDNmM=;
        b=D1mmUlkIqk31FoloZXaanNSiWQHLiYZoRKzyhdp/oCw/ZUaqnfYh56rthsiv+htbuJ
         jb+ysA7adItU+PDZqCfnDGJWR2ed3j7ATWeLgduPpLggz+vhUAILQQrtp/6yQFYqOVOO
         TrluAkCCY2Q9vb6Jl9NGi9JoqH7GBK0CLU37WtCAbunr1wp5BQW+6reAWlu+uWBEY0tU
         SZzLjx+isvtKf0liuqYdLP7/AHD4AYhpCTL0NW5TUShpd/Vij8mOuJPETEhFZbdjxCBC
         TjoKh+ZOckZt+mwNTDvKgysErgWmv6l/eEkaxFmSzn3KZWwVV63PL4p+1Ok574nvDZI3
         61kQ==
X-Forwarded-Encrypted: i=1; AFNElJ+JXCjJFuCxl2JIAy1wzbHAeOwu7Ybp8HMywRqMnOpPUt6yTzxYfufUAAT9QhsikvgVErzzTd08ciat3R+d@vger.kernel.org
X-Gm-Message-State: AOJu0YyKpL2tKBlTCFEOgsTWz90WfPGL8XkON2aD9N0ZntVCUs/7lvXr
	TK1AoTK+t9cMdR7b//NK+GT+aK/uSwkW9Gnz5zh4z79v7+1KWFzYviN/JdOVzO2d+nkscxLMw+A
	4pA3n7RYYGe0QzG7dbBFdUEkMrzutYPwv3b6iAOFcC1Jr48uFD0601NoQTJmPawy5p8r6
X-Gm-Gg: Acq92OHkHFrlArsSNpw9YPWiY39op9IerbU5K0f3WChbuHmB1G7biPlxIL5IlxthWfV
	kE8EIZq/ergBvo9VvM69ufr9ufaAnb7v7v+ZdHwpGDVkALAK4dcLFJuQk4y7qX6o5J3pgN4GL+s
	u/uiOWGtsL1DM8Z1JftWckOUpGeaqXSOo9b2Vn1L1cVPblN2vt1jGRWC2NBBwHWcM0iqhZX7z24
	mAeaHeFufTIFVo084XUBowDV5Q/lVyJ0+utK//OZBeBrRFWrlD1xBwmOjd5BdyMKOiXChWE5iqB
	Xgyl9CIO+BAR/XO/zrWP02dNYTuLraB7f7SVvQ5k2t5YRmmsIUtxTY1sgw1hDpUrWIV7d024CsZ
	edGR36yeRwkTR2uSIVh5+enr7fX71AVb+hkbNQERAcAHgaR2BKiwBQQKY9/Tbwv969kBH+g==
X-Received: by 2002:a17:90b:6c3:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-370f0481909mr2176032a91.19.1780633229206;
        Thu, 04 Jun 2026 21:20:29 -0700 (PDT)
X-Received: by 2002:a17:90b:6c3:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-370f0481909mr2175993a91.19.1780633228706;
        Thu, 04 Jun 2026 21:20:28 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8679esm74673315ad.21.2026.06.04.21.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 21:20:27 -0700 (PDT)
Message-ID: <b83f7fa5-346d-4795-bbe0-bc17772321fa@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 09:50:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/1] remoteproc: qcom: Add NOTIFY_FATAL event type to
 SSR subdevice
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com,
        quic_viswanat@quicinc.com, quic_mojha@quicinc.com
References: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
 <8612d109-dc49-403d-9499-9c0319930cca@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <8612d109-dc49-403d-9499-9c0319930cca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDAzOCBTYWx0ZWRfX14yZTEfvOh1K
 jb+sH+4i2F5X+a9CouPdB5bGI4GvXOWRif8k2YG7Xr/1Btn8ArFJOATAJAr0ztzuP00Cf8/7Uoa
 o2YkE35x9+pt3e0a8T3LLnEf7yxt9K3mdJKax/64/NonklT+5FGr4Oe4kTcu8ukpYDeeqxCPQIL
 OFp+tZsKncKRAtl/PxVflLdv+WBKePOXVxAu1wSF3MMdnL6vuJS4y4ezig5lXbLFKQi9/5S4Sij
 edoqma1MKQsxBZjchD2jgrtPefOT2Q0H3ye/KuabACui4QvHbSVFuly334pYv88CsLXvrvQANrh
 px4Sy43ou37U7eG5wj2XlIGWR4Pw03PK9TGA3D1kk7i87PqNyS4gJuNP1pbsPuU++yTt62lw94D
 /V5jpU9QMUlkcfPZCuQKtWbBMQ+ateTiIJDwMdMYlybnADCcm+UUZXLJtm0VnfLqR+qQVplntOe
 uNBWSI4eeTpKEzo5/1Q==
X-Proofpoint-ORIG-GUID: v1qT_iKG8D-m6W-QnloQ6YOvakH95xvF
X-Authority-Analysis: v=2.4 cv=P4AKQCAu c=1 sm=1 tr=0 ts=6a224e8e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=X4DHI3SWk1nqzx7-H5UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: v1qT_iKG8D-m6W-QnloQ6YOvakH95xvF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050038
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111311-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jeff.johnson@oss.qualcomm.com,m:quic_gokulsri@quicinc.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_varada@quicinc.com,m:quic_srichara@quicinc.com,m:quic_viswanat@quicinc.com,m:quic_mojha@quicinc.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF30464508A



On 6/5/2026 2:42 AM, Jeff Johnson wrote:
> On 8/19/2024 11:09 PM, Gokul Sriram Palanisamy wrote:
>> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>
>> Currently the SSR subdevice notifies the client driver on crash of the
>> rproc from the recovery workqueue using the BEFORE_SHUTDOWN event.
>> However, the client driver might be interested to know that the device
>> has crashed immediately to pause any further transactions with the
>> rproc. This calls for an event to be sent to the driver in the IRQ
>> context as soon as the rproc crashes.
>>
>> Add NOTIFY_FATAL event to SSR subdevice to atomically notify rproc has
>> crashed to the client driver. The client driver in this scenario is a
>> ath Wi-Fi driver which is continuously queuing data to the remoteproc and
>> needs to know if remoteproc crashes as soon as possible to stop queuing
>> further data and also dump some debug statistics on the driver side that
>> could potentially help in debug of why the remoteproc crashed.
>>
>> Validated the event in IPQ9574 and IPQ5332 by forcing the rproc to crash
>> and ensuring the registered notifier function receives the notification
>> in IRQ context.
>>
>> The client driver in this scenario is a Wi-Fi driver which is continuously
>> queuing data to the remoteproc and needs to know if remoteproc crashes
>> as soon as possible to stop queuing further data and also dump some 
>> debug statistics on the driver side that could potentially help in
>> debug of why the remoteproc crashed.
>>
>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Acked-by: Mukesh Ojha <quic_mojha@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>> ---
>> changes since v1:
>> 	- No changes. Rebased on top of linux-next.
>> 	- We will now have a user for this notifier, ath12k.
>>
>>  drivers/remoteproc/qcom_common.c      | 60 +++++++++++++++++++++++++++
>>  drivers/remoteproc/remoteproc_core.c  | 12 ++++++
>>  include/linux/remoteproc.h            |  3 ++
>>  include/linux/remoteproc/qcom_rproc.h | 17 ++++++++
>>  4 files changed, 92 insertions(+)
> 
> Core review comments below assisted by Claude:claude-sonnet-4-6
>>
>> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
>> index 8c8688f99f0a..6efee422cc23 100644
>> --- a/drivers/remoteproc/qcom_common.c
>> +++ b/drivers/remoteproc/qcom_common.c
>> @@ -86,6 +86,7 @@ struct minidump_global_toc {
>>  struct qcom_ssr_subsystem {
>>  	const char *name;
>>  	struct srcu_notifier_head notifier_list;
>> +	struct atomic_notifier_head atomic_notifier_list;
>>  	struct list_head list;
>>  };
>>  
>> @@ -377,6 +378,7 @@ static struct qcom_ssr_subsystem *qcom_ssr_get_subsys(const char *name)
>>  	}
>>  	info->name = kstrdup_const(name, GFP_KERNEL);
>>  	srcu_init_notifier_head(&info->notifier_list);
>> +	ATOMIC_INIT_NOTIFIER_HEAD(&info->atomic_notifier_list);
>>  
>>  	/* Add to global notification list */
>>  	list_add_tail(&info->list, &qcom_ssr_subsystem_list);
>> @@ -428,6 +430,51 @@ int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
>>  
>> +/**
>> + * qcom_register_ssr_atomic_notifier() - register SSR Atomic notification
>> + *					 handler
>> + * @name:	Subsystem's SSR name
>> + * @nb:	notifier_block to be invoked upon subsystem's state change
>> + *
>> + * This registers the @nb notifier block as part the atomic notifier
>> + * chain for a remoteproc associated with @name. The notifier block's callback
>> + * will be invoked when the remote processor crashes in atomic context before
>> + * the recovery process is queued.
>> + *
>> + * Return: a subsystem cookie on success, ERR_PTR on failure.
>> + */
>> +void *qcom_register_ssr_atomic_notifier(const char *name,
>> +					struct notifier_block *nb)
>> +{
>> +	struct qcom_ssr_subsystem *info;
>> +
>> +	info = qcom_ssr_get_subsys(name);
>> +	if (IS_ERR(info))
>> +		return info;
>> +
>> +	atomic_notifier_chain_register(&info->atomic_notifier_list, nb);
>> +
>> +	return &info->atomic_notifier_list;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_register_ssr_atomic_notifier);
>> +
>> +/**
>> + * qcom_unregister_ssr_atomic_notifier() - unregister SSR Atomic notification
>> + *					   handler
>> + * @notify:	subsystem cookie returned from qcom_register_ssr_notifier
> 
> @notify kdoc parameter references wrong function name
> 
> Should be qcom_register_ssr_atomic_notifier. The two notifier chains are
> independent; notify from qcom_register_ssr_notifier points to
> &info->notifier_list (SRCU), while notify from
> qcom_register_ssr_atomic_notifier points to &info->atomic_notifier_list.
> Passing the wrong cookie to atomic_notifier_chain_unregister would corrupt the
> wrong list. The doc misleads callers about which cookie to pass.

Ack.

> 
>> + * @nb:		notifier_block to unregister
>> + *
>> + * This function will unregister the notifier from the atomic notifier
>> + * chain.
>> + *
>> + * Return: 0 on success, %ENOENT otherwise.
>> + */
>> +int qcom_unregister_ssr_atomic_notifier(void *notify, struct notifier_block *nb)
>> +{
>> +	return atomic_notifier_chain_unregister(notify, nb);
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_unregister_ssr_atomic_notifier);
>> +
>>  static int ssr_notify_prepare(struct rproc_subdev *subdev)
>>  {
>>  	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
>> @@ -478,6 +525,18 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>>  				 QCOM_SSR_AFTER_SHUTDOWN, &data);
>>  }
>>  
>> +static void ssr_notify_crash(struct rproc_subdev *subdev)
>> +{
>> +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
>> +	struct qcom_ssr_notify_data data = {
>> +		.name = ssr->info->name,
>> +		.crashed = true,
>> +	};
>> +
>> +	atomic_notifier_call_chain(&ssr->info->atomic_notifier_list,
>> +				   QCOM_SSR_NOTIFY_CRASH, &data);
>> +}
>> +
>>  /**
>>   * qcom_add_ssr_subdev() - register subdevice as restart notification source
>>   * @rproc:	rproc handle
>> @@ -504,6 +563,7 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>>  	ssr->subdev.start = ssr_notify_start;
>>  	ssr->subdev.stop = ssr_notify_stop;
>>  	ssr->subdev.unprepare = ssr_notify_unprepare;
>> +	ssr->subdev.notify_crash = ssr_notify_crash;
>>  
>>  	rproc_add_subdev(rproc, &ssr->subdev);
>>  }
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index f276956f2c5c..1828831e0e77 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1140,6 +1140,16 @@ static void rproc_unprepare_subdevices(struct rproc *rproc)
>>  	}
>>  }
>>  
>> +static void rproc_notify_crash_subdevices(struct rproc *rproc)
>> +{
>> +	struct rproc_subdev *subdev;
>> +
>> +	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
>> +		if (subdev->notify_crash)
>> +			subdev->notify_crash(subdev);
>> +	}
>> +}
>> +
>>  /**
>>   * rproc_alloc_registered_carveouts() - allocate all carveouts registered
>>   * in the list
>> @@ -2712,6 +2722,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>>  		rproc->name, rproc_crash_to_string(type));
>>  
>> +	rproc_notify_crash_subdevices(rproc);
>> +
>>  	queue_work(rproc_recovery_wq, &rproc->crash_handler);
>>  }
>>  EXPORT_SYMBOL(rproc_report_crash);
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index b4795698d8c2..5101a7ec01bb 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -596,6 +596,8 @@ struct rproc {
>>   * @stop: stop function, called before the rproc is stopped; the @crashed
>>   *	    parameter indicates if this originates from a recovery
>>   * @unprepare: unprepare function, called after the rproc has been stopped
>> + * @notify_crash: notify_crash function, called in atomic context to notify
>> + *		  rproc has crashed and recovery is about to start
>>   */
>>  struct rproc_subdev {
>>  	struct list_head node;
>> @@ -604,6 +606,7 @@ struct rproc_subdev {
>>  	int (*start)(struct rproc_subdev *subdev);
>>  	void (*stop)(struct rproc_subdev *subdev, bool crashed);
>>  	void (*unprepare)(struct rproc_subdev *subdev);
>> +	void (*notify_crash)(struct rproc_subdev *subdev);
>>  };
>>  
>>  /* we currently support only two vrings per rvdev */
>> diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
>> index 82b211518136..f3d06900f297 100644
>> --- a/include/linux/remoteproc/qcom_rproc.h
>> +++ b/include/linux/remoteproc/qcom_rproc.h
>> @@ -11,12 +11,14 @@ struct notifier_block;
>>   * @QCOM_SSR_AFTER_POWERUP:	Remoteproc is running (start stage)
>>   * @QCOM_SSR_BEFORE_SHUTDOWN:	Remoteproc crashed or shutting down (stop stage)
>>   * @QCOM_SSR_AFTER_SHUTDOWN:	Remoteproc is down (unprepare stage)
>> + * @QCOM_SSR_NOTIFY_CRASH:	Remoteproc crashed
>>   */
>>  enum qcom_ssr_notify_type {
>>  	QCOM_SSR_BEFORE_POWERUP,
>>  	QCOM_SSR_AFTER_POWERUP,
>>  	QCOM_SSR_BEFORE_SHUTDOWN,
>>  	QCOM_SSR_AFTER_SHUTDOWN,
>> +	QCOM_SSR_NOTIFY_CRASH,
>>  };
>>  
>>  struct qcom_ssr_notify_data {
>> @@ -29,6 +31,10 @@ struct qcom_ssr_notify_data {
>>  void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb);
>>  int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb);
>>  
>> +void *qcom_register_ssr_atomic_notifier(const char *name,
>> +					struct notifier_block *nb);
>> +int qcom_unregister_ssr_atomic_notifier(void *notify,
>> +					struct notifier_block *nb);
>>  #else
>>  
>>  static inline void *qcom_register_ssr_notifier(const char *name,
>> @@ -43,6 +49,17 @@ static inline int qcom_unregister_ssr_notifier(void *notify,
>>  	return 0;
>>  }
>>  
>> +static inline void *qcom_register_ssr_atomic_notifier(const char *name,
>> +						      struct notifier_block *nb)
>> +{
>> +	return 0;
> 
> qcom_register_ssr_atomic_notifier disabled stub returns integer 0 instead of NULL
> 
> The function return type is void *. Returning integer 0 rather than NULL will
> trigger a -Wint-conversion compiler warning in kernel builds (return makes
> pointer from integer without a cast). The immediately preceding sibling stub
> qcom_register_ssr_notifier correctly returns NULL.
> 
> Fix: return NULL;

Ack.

Thanks,
Vignesh
> 
> 
>> +}
>> +
>> +static inline int qcom_unregister_ssr_atomic_notifier(void *notify,
>> +						      struct notifier_block *nb)
>> +{
>> +	return 0;
>> +}
>>  #endif
>>  
>>  #endif
> 
> 


