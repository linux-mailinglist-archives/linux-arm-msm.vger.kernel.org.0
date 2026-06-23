Return-Path: <linux-arm-msm+bounces-114246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PUllFSuwOmp+DwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:11:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B97AA6B8983
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:11:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KjEJ4diJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gg1k6DmB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114246-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114246-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A450308EB7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC05E30D414;
	Tue, 23 Jun 2026 16:09:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04FF30CDBC
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:09:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230990; cv=none; b=Da8LfK3kGv9RIYQOcqPv3DhaUafgVpbnErjfeIletEFfp9Fng41MfewHQKhN9mT3SSDWdlIuQMgka8IOXzm1Q9d4XjT9amnGUhtdOLyD6Djdjq63OGVl7Ms/NVpv1lsSNsBJN5w6Iyi2AB9Ni3ZWCmNCTRzz6ZAUbeDwnnH3G08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230990; c=relaxed/simple;
	bh=if7r+uTVqsu1Rz1LUUNR5eK8lGZ6SOOcel9CPceNbVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aEQSH2fwDVybHT3l9spEKZNZzPOeBrVQv+pksHnZI0eBoWbhOqXWZnvPNoXsOyk+NJUXfmOpLZqQRts3Ye7EYJIgXCwswX/zk6lfGv841NzKGXUItKO2V29pZQESZW6i5S8S44xW56cPEqntSi4uidZM+sdagE3UYo633rhR/is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjEJ4diJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gg1k6DmB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZk7d4052866
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSJH8206N3zXxZb5NwNeSdYyuC4r9dG7EEW5EpoiYlI=; b=KjEJ4diJ/AaJ0SWQ
	yvUoPZwlLY2irWcHoyqoihkzjq7etgTOfCN3X1hS4VT3p1D4Czk/aXnLHHuWfHew
	MIKEs8RiFWGipWvQDCX0y2aNe2GWY+S1wOIgKCcEhZ3eEOjeBh7nLVWUaLDtxs3F
	uE3fu+aghEiLN6N1irlBgVzIfJBheTLeYBLmSIOHKY0Yz/9c0t9baPmlSFJ4Y9lB
	6/ZVNvaY2eHT93FAuHitpQqiOOzjZHUWCtJXZv38JFzHAI3frOoZPZWCsH3+xZX3
	amLiybRjVVD9RTUbuKsdTdKuH6c8hCmEsAvYzL7qp7dF1pdkdG6Hl53kGFwEdku+
	fKONAA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9yse2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:09:48 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966ca0b440cso33805241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782230988; x=1782835788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSJH8206N3zXxZb5NwNeSdYyuC4r9dG7EEW5EpoiYlI=;
        b=gg1k6DmBaObcxG5gd+CcmuxU2Tbt1GxfsFJ+5x/qF81q8+u2z9GvwIhtN3yom3v9ag
         TatLtVsZJU9BlXfOluKdI0eHAGE7BICoSlmOpSkqbTOFwU/r629U4M2/J1RrX6ctT/AZ
         xlfvM/tAvMRQJdx4EEeoeVV/TDHld6BXFaSwjFcES8RXOciBfXHk/SWdW45/AzPLOYl4
         Ft/yRD7N0tnVFNpfHlzhHJ7JVZ8276kxo1jmzbg8OriNpOV8EBAIajEKLJkxBUZMqiAV
         jqz13/wNZaYv3dkYimGejVz21bs0ihwp2UyQSJb46M6I2g3KqNcVLzALFKbUZb0JNZgl
         20NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230988; x=1782835788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fSJH8206N3zXxZb5NwNeSdYyuC4r9dG7EEW5EpoiYlI=;
        b=QI9U0U1n5FXp5Vun+VfmB8MB+A9xNQg7bASfmiKoyhqiEBqbZqickvSxTEcMP3UEAz
         zX88SlyX1IZeRxZeoiHzGvhq2hz9zMUK9ULPXdLkXNmJoTwKWgRVBr2JOzJHLxrVcqG/
         c8bnyNXcFfh6UlCYMaFu6YLnmQuCWiES5y+OZ+T/TzhniEOn99xjBL/6ArfrdHPh7bly
         Cq4+X88i1ewSGnNA1bOzqn+MybB6ahXLKmPPsTBxs2UxTsYTF7QN0IedWKdxalhdgHcf
         NyfSA3Df3n1ihQAWFCr+iKGgJVfjbVRXsP1SZdlTbMF436HU0m8Dsf1yj+XeP3ESZ3O9
         s5zg==
X-Forwarded-Encrypted: i=1; AFNElJ/W9PQxktRpCqsLAjFUPSf+cAOYoXt/tDDqbi1fOB9zHyKX+ZR+9ZbJLaCXUfeJmgLaVq+xcc7bfSafbSJV@vger.kernel.org
X-Gm-Message-State: AOJu0YyLkoFs2/6PWZWw6Iz2XmPfGoU6pFXYBX8Fup89fnxst2k65w0b
	fCu6WtW5w4+mGi67cEPbdWV0fdBX6dII9ZjHgG3f1FwSBJoAnWkz3hIGJ3/PQMuf1XrzorJM5To
	WNMWWlghBY6j/WNc5how2TECSVCB1Jz2wjKOYlnZ2vupnyLb5GM2FNF8ferv5AMlNd0VEiIPb4k
	VA
X-Gm-Gg: AfdE7cn+aHDVy0VNrU2CiRf6vKV2Qxzx3Hgb6Z2u99ug3mldFyfE4qff6hZREKkUlW1
	LbOueEHS6LG/tIzHxjnG0yVvcnUonhy41WrkzCcitN3CzumprRsiePX84vmswU0Nl9I12NZs8pN
	lJol8K6w0Pg/SmFj4S0gNera5rGR2J6ei4J1qAgXGyC0Suanka65c3Y8BpQGGcoZ6bepXk7jcHL
	Kp1/EPiNfgeKMM2fKvffnFS55UpTJurHpxGZmRqttxjAwokCGuOQ8z6PwkJKkeqMdx6uz17Q7KK
	lDD6Idv43AzsPoBVLMnoThQ3yY9MzKBKSTb0VVG+9yBedcJGCfnB2Aq7Sbyf50Ep9ANRGM+uioi
	3sBruSkaY1oKI/eZl8At4q6A5+Zra+oLm7d4=
X-Received: by 2002:a05:6102:1620:b0:674:84bf:8e0a with SMTP id ada2fe7eead31-72b16d7a278mr3803412137.7.1782230987789;
        Tue, 23 Jun 2026 09:09:47 -0700 (PDT)
X-Received: by 2002:a05:6102:1620:b0:674:84bf:8e0a with SMTP id ada2fe7eead31-72b16d7a278mr3803389137.7.1782230987312;
        Tue, 23 Jun 2026 09:09:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99b968sm536990866b.24.2026.06.23.09.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:09:46 -0700 (PDT)
Message-ID: <aa1471ac-bd1d-4e1f-b61c-3db86d2e31aa@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:09:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] iommu/qcom: Fix pgtbl_ops leak in
 qcom_iommu_init_domain() error path
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3aafcc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fzWtvpM4OtHSxDPwpw8A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: pY-fG8DDa3pePECkH3UE-Si0l28AmlOY
X-Proofpoint-ORIG-GUID: pY-fG8DDa3pePECkH3UE-Si0l28AmlOY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX9FBEWs29EHw8
 8PwDan2rILxnSMrROWQ2QscpFaqVCDrRupPHMj3P37TAG2uu8v6FIaG8gI9HCpIwu25AQRBUTvI
 UeGwp4AKZMVsBByHHpTH8LaszlAxipCYqqKwmwc4Si+5AwfS1W+RgGJTF2XT1N0WHoJ60Z/7Q15
 A2blrg4LEfSRE8wOj6YDZ/KtOlpDp7q26yuAHodo5EYPiAxOv/q1ypVyHgz1RpqbhCIklKoyvOg
 uLMPOMJhzJOowRC36Il1+zOLSwbdhYWeN8T3R1cqeDgsJhM03oFPs7EBiImpRTC+VPS34kdoRm6
 l0TGs+0ySjm54sF3JcnEzTj2P3IqaUZHqdJcZig2EK8IdjaWeohLpfDteFRR3bugXTyYJUq7nXc
 TkWuVqi2Q28EXRgdjHzbQXzbaYx+DZIrak674FEfvf8Kc5yMEnYGU2T47Xp247UbnxU5s0RGSca
 hIV49LHPM/VUdfVdxsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX7AeHKH55l/a/
 pCx3movneCBa1np23AbKEjGBXdVE6PL2DooUemEWuOU3MyrEVEeBdyRe3//Y8DbdZX9lX8HvO3J
 fqXWKYFHijXkrcXvp4oBYjbH1R1NL8w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114246-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B97AA6B8983

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> alloc_io_pgtable_ops() can succeed and then qcom_scm_restore_sec_cfg()
> can fail for one of the context banks. The goto out_clear_iommu path
> only cleared qcom_domain->iommu; the locally allocated pgtbl_ops was
> never freed, leaking it permanently since qcom_domain->pgtbl_ops is only
> assigned on the success path.
> 
> free_io_pgtable_ops() safely handles a NULL argument (covers the case
> where alloc_io_pgtable_ops() itself failed), so add it unconditionally in
> the out_clear_iommu handler.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 4e714a8e1fac..b6ce85f7f923 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -314,6 +314,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>  	return 0;
>  
>  out_clear_iommu:
> +	free_io_pgtable_ops(pgtbl_ops);


This label also jumped to when alloc_io_pgtable_ops() succeeds,
but there's a nullcheck inside, so i guess it's fine

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

