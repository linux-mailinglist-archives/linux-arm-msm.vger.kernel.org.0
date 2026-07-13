Return-Path: <linux-arm-msm+bounces-118733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RfFPNPi/VGqHqgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:37:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23632749E1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:37:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jiya2In7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TSNxYNdT;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118733-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118733-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF8C93006142
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DC037A835;
	Mon, 13 Jul 2026 10:37:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0411DE8AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:37:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939062; cv=none; b=RDcK9ulpZ6gMyTJTmhXo+c9T80JGHMvwMOCcK+x0mK4yfIH5HV1ANDT9WrLxjjdOl5gkpxLqlPb9XIoudHHY3S4ASyxf3/OmxqZ4P81LH8f0XkNRsRgfB82m26vB5ey1eIoj+B6IK/R5oVzqn2ElKtDzCG+sFQKiKaSLuq7Bo70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939062; c=relaxed/simple;
	bh=3m6DR4cSmxHyJCDJk9YiqjcbJJEkVqxy+iN4N4Qm6Z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nj3OVi8cmutJzPjxFmG6BQnF6xmZ1JMr5GJfs/fQb9KCdwzHCMVai4JA3K6pkrT9Z1WDe3MDSZaSE1qf6zSZuyMKE1RhjUMRUSt37AB4jauh05YKlKuGgLGQHX8XuZjFjtmJIsv3ezVPqR9iSZ4AwB6/7qrKNi3SFrGEoa4Okos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jiya2In7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TSNxYNdT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9dVXP952913
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hLzz6wWDeeMpdSkdKzw84YBlgDHYl4DWCf56D/vBLUE=; b=Jiya2In7+lIR6dpl
	kG//M8VFJ7nKNSNW8ngMtqL4nfi5kxEluD68zBDUE3n4Kh2hYVmTP0rUSZik+bSG
	WDDiEaErEJVm6emkVMLSdBs/kOi1DY01r+3KcFZixIHj0OEOQssxEYRFlJguRmLk
	Vs8UAGGHofJd3JFxeYwhjOQIibRPJbjsml0M0K+LVAFtntHiDDrcWZqT4w/eA60j
	JgCetDfe9deXFLANAY5LdWv9ei58d1rLvv14l4YHNIVhQzUKyLPUuHhOu0c8mmky
	LjavLWnqGniUWHU7kgtG3sFPcXgFEfvumdWZpMbWggAY4lwqyhDEMFFsNe5xIdKz
	EztttQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3g6qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:37:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c069f73e4so6661361cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939059; x=1784543859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLzz6wWDeeMpdSkdKzw84YBlgDHYl4DWCf56D/vBLUE=;
        b=TSNxYNdT3wM1NnOmaa3TrGC5oQBfBcxQgHxVxQhdumGN39ocJPcs7JYr5umNMi/MQy
         1zTXHYQt4CQvxtalMEH5NJxLweK7MsJ8qkEkA56SKpoYOWtwSRmjJ9Nm+DfzRpvgEa3l
         FieAINTzGhOARt3nmA2Z+jodpJn9ALyKNx7twc38/sgmiHTuAP1qHv8CIDC+Wpoiw+Ep
         bqHnUApWPnAVSBjGBPz5fyy9aoNUWMmnzD7PkOwCUAvuCwqH15LI+exqHMLxqbTa2lUC
         ET91g5XJTpOMuHnos/X/zQ2ZRA++Y/Zx7zoQZDpIRDb+oWeTv5k6UGLjHVzbAIZOcr4W
         mhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939059; x=1784543859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLzz6wWDeeMpdSkdKzw84YBlgDHYl4DWCf56D/vBLUE=;
        b=qAcUbsDi0HySOPBlfjBDjELJHAfDCW5Do35tNgaj3RqWNMIZMhMN/EaSbYeDqA1wDW
         9uu7viDoztkDL8Ny5pr5LgRc0qtXhjPNPkKIEztYH9soRp6LT3qX97gT6wsKu1AOEdJ2
         /Hqba4FRPjaVeOVuxDogpU6Pk7MA587KMU3v7q/G9XB7b65+eK2yfPnjuQeHurWQc5rY
         y61T1Dea5xSxUwEFQjUUwhAMHwsgDdmFqN79MoIeAWJWcM5o58Fok3Yey54aDJ3/+iSw
         rdO7OvIkIZ/VKjQAmGTTzB4N9Gt05DK8J50S2cF9Yue2bp5AcSeUaDNNe2m7Djf73QQh
         GW+w==
X-Forwarded-Encrypted: i=1; AHgh+Roz0xCPckHbYuZKYlQnzxBG5FKm0j/toaWXHvGGusITWVn2yLXXedPtKsUtqWmp6z1+qW71yiJlO1ojDNCO@vger.kernel.org
X-Gm-Message-State: AOJu0YxPzmhpBifTB0NyR1EVoSLLX8ZPpIFiLIGOkogMUKjMHaJVRErX
	tCk5Qi42OUcB8bHp0rQ7JpEMn0ktyvboNDjCLsoHaLLjV5q89FqB8noovz8vY9m4Q3SOrsyeOsh
	0PajGjvaC3h9PnjUzzjaJchxdowGzTivO2gEhCBsB8l67BPr7YgfNrpPkf9NHpzl1p9ZD
X-Gm-Gg: AfdE7cniUdErMobb5AgIKPbcep/LY+x2NNcrXP3Ue7+ExiVk8KqhHX0of5aSgjvUtxr
	Qf4JSvLlM+w9/M3teBZ2pepZ80niP6xai6Zrishn0xIoPBqi5rWUk2xbRDX2njUXut5dsIrkV01
	8yT5ccO0NBO+tO/mASQ4EDSLgUbyHBVsA+wZna/q/qNyw4qrQ/LX2mHUyk/5rVn4XoH06vzVOws
	H3wTbNJACj9FvyEo1SIeoj0RqaKt6nRVJkaAPwMrZ0UdtYjgGN1VXDHTRoTz0ELJPkrp+jvQPJ/
	9occCI1AbbUKnpf79j0U9rGZlZVU8GYecCVMbVmjD3u4GMMPm3LR/6Er46gUKcVTZyo2B4XfQYN
	JSBUByhT3pVktFqDRkIay/Fuc9MijaUt0Dh0=
X-Received: by 2002:ac8:7dc7:0:b0:51c:857f:9c1c with SMTP id d75a77b69052e-51cbf3aeda3mr70349311cf.11.1783939059560;
        Mon, 13 Jul 2026 03:37:39 -0700 (PDT)
X-Received: by 2002:ac8:7dc7:0:b0:51c:857f:9c1c with SMTP id d75a77b69052e-51cbf3aeda3mr70349131cf.11.1783939059035;
        Mon, 13 Jul 2026 03:37:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d5de95e6sm722744166b.39.2026.07.13.03.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:37:38 -0700 (PDT)
Message-ID: <b967394f-b1ee-4718-8629-b5814b4e129d@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:37:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: scm: fold tzmem into the qcom-scm module
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, linux-kernel@vger.kernel.org,
        bartosz.golaszewski@oss.qualcomm.com, harshal.dev@oss.qualcomm.com,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
References: <20260713045811.484554-1-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713045811.484554-1-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sbwgopywHkXwpQ4q4MbNfSprJk7-yBsq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX5B2iGrvjtbiU
 6GhEvrMKBPsSePK/X2RJZjk46jvSQ2L0shp/KHNYwTwqtw9ajts7ul89yGwbPDpv4qvHPo3Uewf
 xSGBjotUI+CNUZsqlXGXUKt2FoWd4oI=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54bff4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=TyXpd46oalzF_ysv1t8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfXzcmZWNlUbi9e
 netTi9xP7riTpiniu6S51hrooc/IKU0l0Gege4TY6gDBk2RXLMutk7ycFcD8vxMe0Hacgjdz2Pf
 uideSrx+Vf/Cn5kcFUrduKnlLHJiEhkVMXaa2azNJhz96NF3BywP7JaDo1NVX4YqbRn2/iedWRh
 ihZlxvC4i85GABLnJ1U2JyJUEXADH2nmJYMk5oRCRxXLOVOWORVMZ/c9OafxfOh6a5RbU/4D+f1
 IMOU7btXzP0gsxlxTNPbOGPpKqT6M0T8m1ZZ6mZuMzZpXq67Nj5zQuwrRI5gZRgjGNiQ5QH74SL
 AMJk6uVNtr3GB8RaJ+gNV+4fQfQzjHTPEzi19QqAlG7TVVR8c7HWypDVx+9htluDd2JnNyegnlw
 j5nf8cUjGZ1uhbgnpwkzraktla1xRk55FvlCOtIfWiV6+RHVldCqUCQ3HdGSBJBVgjVdQH4xMKY
 xzI9BTuQ/xm/Ls3Y/Tw==
X-Proofpoint-GUID: sbwgopywHkXwpQ4q4MbNfSprJk7-yBsq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130109
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
	TAGGED_FROM(0.00)[bounces-118733-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:sumit.garg@oss.qualcomm.com,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23632749E1B

On 7/13/26 6:58 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> qcom_scm and qcom_tzmem have a mutual symbol dependency: qcom_tzmem
> calls qcom_scm_shm_bridge_{enable,create,delete}() while qcom_scm
> calls qcom_tzmem_{alloc,free,to_phys}() and qcom_scm_get_tzmem_pool().
> When both are built as modules this results in a circular module
> dependency and depmod fails:
> 
>   depmod: ERROR: Cycle detected: qcom_scm -> qcom_tzmem -> qcom_scm
> 
> QCOM_TZMEM is an invisible tristate that is only ever selected by
> QCOM_SCM, so the two are always enabled together. Build qcom_tzmem.o
> as part of the qcom-scm composite module instead of as a separate
> module. This breaks the cycle since the mutual symbol references
> become intra-module.
> 
> With tzmem now internal to qcom-scm, the shm_bridge helpers are no
> longer used outside the module, so drop their EXPORT_SYMBOL_GPL() and
> move the declarations from the public header to the private one,
> alongside qcom_scm_shm_bridge_enable().
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607122327.3zkZCUaB-lkp@intel.com/
> Assisted-by: Copilot:claude-opus-4.8
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Makefile         | 2 +-
>  drivers/firmware/qcom/qcom_scm.c       | 3 ---
>  drivers/firmware/qcom/qcom_scm.h       | 4 ++++
>  include/linux/firmware/qcom/qcom_scm.h | 5 -----
>  4 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
> index 48801d18f37b..55751d282689 100644
> --- a/drivers/firmware/qcom/Makefile
> +++ b/drivers/firmware/qcom/Makefile
> @@ -5,7 +5,7 @@
>  
>  obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
>  qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> -obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
> +qcom-scm-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o

Does it make sense to squash the kconfig entries too now?

Konrad

