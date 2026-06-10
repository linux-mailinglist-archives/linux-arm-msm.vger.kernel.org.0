Return-Path: <linux-arm-msm+bounces-112285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VcdSNYvWKGq9KgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:14:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B3566592C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:14:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aTKptZ+9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TKzkbSAP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112285-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112285-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B22ED30E1182
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 03:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABDF340411;
	Wed, 10 Jun 2026 03:12:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E8E5B1EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 03:12:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781061128; cv=none; b=LUIo/3hwsiU95xF9REZcpUCFaJTY5lAv53POkFpuk36APjkzpRlZfxUjU/iChBgxn48OANwlP/0j5qfRwgjT6jHYjTIsOGreD4TehraZMnwcpIVAynFSZ8T39m4yaxsjYQF2c1SojwOKmJClH/fjN920O10fKHcF/4APM7nv+BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781061128; c=relaxed/simple;
	bh=/NryWXkR6E+3gURwL7KyTpAD8KltnuDEeM+zlykdqEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2NbqrWpCozOIpPz+HsiTrrzc9wMWhRGDq4ojVM4KPctNB2DUfircypunzKlfVKERMHqiKOByjMtuaForxPMakhnm9xPeFnUaU7EWEJh5hRDY3LjfDfSkKzEu5zaB3Mq+IElf6IRLNO8W8dJMkcidTz2dYuthMYJa39cxTBdtZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTKptZ+9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TKzkbSAP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2eqeg4097280
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 03:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KdVRlNi9iQwpjqqFmnz7dwVDhPsaks/t9Zm6pawkFs=; b=aTKptZ+93aq1bhm2
	NHkU7BAiHlgkKB1GI0ZTUT1xy+lj8r57tB38BoMSkJVWwVHjrLZHCSa2Dn2/uL9l
	/oE8i4v6HnWqCGB+S1ek+LuOYarUD6DRa0yjmcqmfQIT5uXfxi6YijQ0sG4Wa7zE
	I072jF4sMqCM+u9uvBTUyro2CdydWnQXP6b+65O+O4MeZT453xb6+rE6nQcRUWZF
	YH9aR0Oca8MwQOmgJRx0zgPUy4XNJc2fUWJfKoW182gsyi1bAEh+wcSfINtR68L9
	fSW+1swmACxIzUW2hiiXKtRCThJLlcuC9yhhsSMniZQtBNhgDzxjdDqzVv2zttUe
	lRPXZg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jvna3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 03:12:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423efbfb61so4172388b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 20:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781061126; x=1781665926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3KdVRlNi9iQwpjqqFmnz7dwVDhPsaks/t9Zm6pawkFs=;
        b=TKzkbSAPdI+y4cxkiGWqoH9Eahl7IaLXoMFpa7Ok8P7SUfCWUkoSIlVw2nRxJNTJS8
         iuhq99qAVXJn1ndZGh0q6CMD942wPHOKW0DjMcPAYgzvGf9WSrBs5j0JsopabS5YKFO5
         +FbEp11xvIXkyyYRcuPDrgcEnxre0ZhifEmIp6E+zWlRvV35Sgi6XlomQLxnnVp9p/0w
         zjHFeoatt31m58lZWIfxSJVAlDACb9obEFf/r+5dQAiQmtuAEzmvn8ciyzAgwFjHhzNz
         J717Zg89wpsG8tmOrV/YnUJ1FHjKkQcZcd2kn3OKnJlj7OZdpAAPbqxI90tviQ59ZVWd
         f+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781061126; x=1781665926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KdVRlNi9iQwpjqqFmnz7dwVDhPsaks/t9Zm6pawkFs=;
        b=Lpq2/hY1KiaPlgvBeavvaMDTSD8W+jgs+Bkw+iOgHf2tbZQylEnsAoJEthIEGztoKS
         4htigridmkY3yU1DWjo0TPR03lohyqgMiBtY3oQZcJcNDPqf1GlwdRZBbvjCqifGMjyF
         +OvLNUlc01HDz7HUrfJL1Qo+1SPALv8ectS6KMjjicEU2+si6QpLDtRdIWrK9UD4GmAb
         IIy5OnZk2UlzIAvpbMHhncuhGgL9iwzxVfnJvHWuBYdSuV/FOyi1efOGkLVVp4kwgLWM
         8yEoRr3+Gy1+vOLNPMxIsCpbZRXLH8owR03kaxPhlWeAQcRcFIkGHzu3NjcmAhbewzj4
         n33A==
X-Forwarded-Encrypted: i=1; AFNElJ+929VD+BVcFESkbeJ5+uf5dqt4abw5HVnWAmikSZyICl6u7UNiPukfcWPl3FFndRYIQCHyMP2Q5dqQssUa@vger.kernel.org
X-Gm-Message-State: AOJu0YxCJezPUyvx1X8lK2dpn0H+21uLqsuB7u72pIs30J6dB6QS6EF4
	SVrzXfprO+fw0uMWTWwfBM42CQPzB7gPlXdgOKKLwuaFi5LpQy0xw5Iaygkjp6ydhiGwBNnuOhD
	RNX71dMYtMYV+sHDXXndroyJGOByHQpYhyI6w573W0iTVUH0b17MQpXP9STZOkjyG2CydmLpk9X
	xHrwQ=
X-Gm-Gg: Acq92OEAlafBZj9bR+Gt6nRqYbgRFeE6NbQObO4BEFlr8M06aHPB/XsaPrK6SGpUFmr
	rL7+x/5CP68enKfDryGM91uGfx2ty6Li8OmKb5hIWRxh5BUXzNpIubNTqA5jdrAGLT4FuNaeClA
	S2lDgpxDSB+f9OXUyeXI1Eie4GA52VV4KsfyChFldCy27sYo+Z4CZ3J5Z8Y4alz1pMqNUvo3EQs
	Haf1JLgkEFBI1V9Y6eXLbCYB4C9E1emfvuwBC6W9vg7NHG5dASJNJ2OjFneVl5VK4vEQUmtwLR8
	m+Jrqu6Rc2mOQVy2MTTTrgHxfdp2HeSCn+is+GRX7G71+2esQao3YIwTsqkCfSx72rsghg6z0P9
	K4/Zvc6Ta8UN+3CpdSB1I7M1taNasbLQnQbS/2igCTaDr+Ocb6HnpGCAvGVeZGANrtP9fyD3UH9
	DJTdh5KBpTL5pJfyoBwNPENgvH0KU=
X-Received: by 2002:a05:6a00:f9a:b0:842:7296:dba with SMTP id d2e1a72fcca58-842b0e2fb1dmr24452671b3a.7.1781061125742;
        Tue, 09 Jun 2026 20:12:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:f9a:b0:842:7296:dba with SMTP id d2e1a72fcca58-842b0e2fb1dmr24452638b3a.7.1781061125289;
        Tue, 09 Jun 2026 20:12:05 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm27496629b3a.26.2026.06.09.20.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 20:12:04 -0700 (PDT)
Message-ID: <88c161d6-caa3-4fff-afaf-d10cacfe9929@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:11:59 +0800
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
 <e67907bc-ce96-4654-b210-2ae8f35cacc7@oss.qualcomm.com>
 <20260521112205.rq6g6ev56l4u47uu@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260521112205.rq6g6ev56l4u47uu@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tionpuwucd-TDAEN4_dyWNjJuUF7VFL6
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a28d606 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tERN6AOGqS7yUma0NWkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDAyNyBTYWx0ZWRfXxrcCxxMlSKh9
 8RJhkCwpRabtG/zounVSHQWErXINnV9ZdYlMHWtoctGRO4rPcCP0JzVatAF7sDsQa4xuvhwnLFl
 vyDkctO4yLiXJ1kAkDuVRvL1cvlWFz4sOaSvoMyBUf/m49FJEK0k381v0x3Ddk4Sb2b2UWty88O
 AyGKpjaTyvAPsjNwP4LcFhr0wos+n4JqyLAFbj3WrjlWCA4U/u4YJVgExKIzn1xyPS0TUS7nXfr
 L48O5q0aYogFvvHzuXWEbmb+6pPMBc4Rq15IaM2FHIMmn2ifxxAGRm3DcdFDOm/wEPYxDYYyoVs
 v8wfIGqXYXXUyXPIoVjDzxzg/oTXhfSZD6mNO13iRyFS2YSltEKskQeJDdr9nY08d9APBTjh7ED
 09JXGT8xxHLhvRQ/PeV9UgN6raJ4OC+HOH5jjVXOXtwE0NgOt2N3Q6wjCNi78INsh+jJh2wbWyU
 uYh8bWXcMctXgERiabw==
X-Proofpoint-ORIG-GUID: Tionpuwucd-TDAEN4_dyWNjJuUF7VFL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100027
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112285-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:konradybcio@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gokul.krishnakumar@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30B3566592C



On 5/21/2026 7:22 PM, Mukesh Ojha wrote:
> On Thu, May 21, 2026 at 11:42:49AM +0800, Jingyi Wang wrote:
>>
>>
>> On 5/20/2026 4:27 PM, Mukesh Ojha wrote:
>>> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
>>>> Subsystems can be brought out of reset by entities such as bootloaders.
>>>> As the irq enablement could be later than subsystem bring up, the state
>>>> of subsystem should be checked by reading SMP2P bits.
>>>>
>>>> A new qcom_pas_attach() function is introduced. if a crash state is
>>>> detected for the subsystem, rproc_report_crash() is called. If the ready
>>>> state is detected, it will be marked as "attached", otherwise it could
>>>> be the early boot feature is not supported by other entities. In this
>>>> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
>>>> can load the firmware and start the remoteproc.
>>>>
>>>> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>>> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>>    drivers/remoteproc/qcom_q6v5_pas.c | 58 ++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 58 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>>>> index da27d1d3c9da..ac2a00aacd2e 100644
>>>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>>>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>>>> @@ -60,6 +60,7 @@ struct qcom_pas_data {
>>>>    	int region_assign_count;
>>>>    	bool region_assign_shared;
>>>>    	int region_assign_vmid;
>>>> +	bool early_boot;
>>>>    };
>>>>    struct qcom_pas {
>>>> @@ -510,6 +511,57 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>>>    	return qcom_q6v5_panic(&pas->q6v5);
>>>>    }
>>>> +static int qcom_pas_attach(struct rproc *rproc)
>>>> +{
>>>> +	int ret;
>>>> +	struct qcom_pas *pas = rproc->priv;
>>>> +	bool ready_state;
>>>> +	bool crash_state;
>>>> +
>>>> +	pas->q6v5.handover_issued = true;
>>>> +	enable_irq(pas->q6v5.handover_irq);
>>>> +
>>>> +	pas->q6v5.running = true;
>>>> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
>>>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>>>> +
>>>> +	if (ret)
>>>> +		goto disable_running;
>>>> +
>>>> +	if (crash_state) {
>>>> +		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
>>>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>>>
>>> I am not sure if this is already discussed, but what if it is the first
>>> crash with recovery and coredump enabled? What would be in the dump,
>>> nothing? As there is no segment, is it expected since Linux did not load
>>> this?
>>>
>>> This is even true if it is a crash after a successful attach.
>>>
>>
>> It is suggested by Bjorn:
>> https://lore.kernel.org/all/qfls6xlvfppqw7p6rjpmzqesh6sbob4myfc6dz47qh3jywqrjk@5xiutkbybk5d/
>>
>> I did a hack to test the recovery by setting crash_state true, it can recovery
>> (stop and start) successfully with below patches:
>> https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/
>>
>> For coredump, it will return from the first "list_empty(&rproc->dump_segments)" check in
>> rproc_coredump as segments are not configured in attach.
> 
> 
> I was not against any of the stuff, but mostly checking, if we agreed on not collecting dump
> for first crash when soccp minidump is not initialized which falls back to full dump of the soccp.
> I see soccp minidump id in the downstream but we have not added in 6/6.
> 

Hi Mukesh,

I prefer to add base rproc attach feature only in this patch and skipping the coredump in attach
workflow.

Thanks,
Jingyi

>>
>> Thanks,
>> Jingyi
>>
>>
>>> @Sibi, has this series been tested on Glymur with KVM?
>>> I don't see the iommu property in the below patch.
>>> https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com/
>>>
>>
> 


