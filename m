Return-Path: <linux-arm-msm+bounces-114249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nvY/DEWxOmoTEAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:16:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 235A46B8A17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:16:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k9Exqu5/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="V79epM/W";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114249-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114249-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F354301CD03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F42A306742;
	Tue, 23 Jun 2026 16:15:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88152010EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:15:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231355; cv=none; b=dwCxabLGPUHDzAmdpc4MvQekKDEtCKQajqpsqEFhavDGeWoQgfL/afcF3hdurT9r0bu7sWZrittyrJPi4Di+x6fLu8/TYAkYBFnJgncBuMow3T257PBmZsD1nRl2IB+3hAGkrXAevVAwvvzQyn6ckW++z6xATvCZTM4NQOnSuRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231355; c=relaxed/simple;
	bh=1mgKP/Cw+MYtYWfmknl77kCg0msl/90xn98lTJ0CA2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I9SP59cIrIZvCnXh+NS8K0XAyUfNaHuHE4CvGkeaTjTIUk4ti5wU6PIsJHmjihK6ZeMDeeQ6lKnnZgXxkJpGdYmqGh2QiQvAlEPl2IEMFXx1ZbNY5phtOQN3EK//GPt/LS0/dpgzGk6Xbr2JN26LLidi8y7JP3ukg8Jq3T3Vrm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9Exqu5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V79epM/W; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYt39113975
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JpnShpDWp6cKrywbsJbMpIC2QEMS239oypSj5Z4wF1s=; b=k9Exqu5/dgqKDN1c
	cB/qWC7gXYZY79XSWQifRRTftMGDZWWodL3n24TIuGE5VrtYC2Q7lZirZg+DbP4y
	5fzS0mRaKjCWKkOzyuTOyobPy2nn3CcFHwbqBqCiHUc+ftv1/z/3u6RXEV2J73nI
	jPpWYoo1PyYSHH1r1gSOU+DTPwD3XMDjIPchrFsEGOTw/zUH/53B3uU3NV32JfZz
	Pfc9qL6KBPz1ihpvz1ysvEKiDMrq7UY/Ku4aGnXHRzMaMt9kYEqk7lc8We/GySg3
	2eTPffuOqrJ/7vGKOiBfVcTK4gt8TY2Yz6pGxFSpb6c2sn++q3dJIuLD97Lez24S
	o8MkyQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvtfhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:15:51 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e94078c746so6097a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782231351; x=1782836151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpnShpDWp6cKrywbsJbMpIC2QEMS239oypSj5Z4wF1s=;
        b=V79epM/W1wq0lWsqjTFX6h3dZRRus2FGTgHIaAPp1wteK6fd4+nwscjtuXHs5u1bED
         YR8RVqOuFotAj+B4OzaLQmDllyWgPB1ljzIUw3YahMd8SQBALp6pjL65KBrbxbRlNKY6
         FaQezDpKt0bDDYDanDjm00cWO4UtCrQxBpLpFnekuRyiOmkSjXvFVkGxq97gwHoujsYl
         Eg4W5IaQiJhJTnDAVrExIfJDRM4HROaKQgcoNq7EOFWPGnCNcSsYXNmnYLH5uekPXDpN
         kn9ArNzkrACRCQtM1Y+hxz0qhHPN0Yz3m9AyOtRSAZD4QAcR4v93spEqDrugyhMep8z5
         6dLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231351; x=1782836151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpnShpDWp6cKrywbsJbMpIC2QEMS239oypSj5Z4wF1s=;
        b=OporgyGdyX5tBqKWh8g25QwkHEFpA4kWTCMCB29jbPUCxRIvGQWfDzlJ8dOdycNgka
         Tfgr8KjECY1LUxeNbRlic5CAm8e/S+WSUifPB9eop67JzKn4KOYnkcuqGrxbgxS8Q/7v
         uesV9VEN2j6Q+Y3lXCeamsMtaB4UM4XznjG74u4D/pXatU07wsMLAlL/vahdxTr5ygIx
         7k9n6MjIS/VSU0PjhBIcfwS1AB/5Cfr7DJ0RkKLeXLQm5hktc7afaNbe1t10JnwtISen
         Q0sGgYdTwQ/Y1VuO8A8DGTDZTXJMVd83ZhGBMIP4VMjC8M4P9n3wEtmapvySrWzggsY+
         g1Eg==
X-Forwarded-Encrypted: i=1; AFNElJ+KE/eGswfHPY6y/+lpRofAq6/daStMbVVFEhbErddoQyMfkWj5r4TKxMOHPXuyXAe4X6aBZ1K4qA3ZomHp@vger.kernel.org
X-Gm-Message-State: AOJu0YxeoLllt1trMYk7j7HnzgIv3Uv/4/FIuCk8GJIM3oZxhX+r/Ry1
	Asb/ioD44vTXsemw2edM2L/BBdGqzTxolsYDkUPROrAI+fUsfN/M/7lYvmWkDd2zz7SFjSmwYu+
	lychG0bzwXmVqgWbQWnFoegcZr1PAEStTnXCiA3Z1E7eSkCpQ2DoVy6asOvwfK4uVHXS6
X-Gm-Gg: AfdE7cnFbFmItgCgZkMB24LUBp1SlRXuAt30UaVQ6b2vIofc/zLBnBwwBn9tX9evh9F
	iYXVCAsyxw/Ahi5M1F6Caerc7If+Sq6XIqh0VZXI0vgHoogPEERjdOBcfw8pFvpa2gUjLDKvXEr
	AjWYOTCoZyBtP8JLYN4Utj01JPuu2fklhSlW2Z90buyxMspZz8yN8hOSSiN6QQ1pCogkrQwMRK/
	vEN2e9b0Q1xx6QhU+anedoBKKgbvYhcMgSI5o8dE4K6Y41iWc7YfN2Q0Bp94dp3EGUVqYeI54jA
	vpW3lSYOkN71YNGPksZEWwTgMpqz+QQvl4i9NPUL2MqA35ho2VenFqbWymvC50SU9v8Of8BH95+
	P5ESouiY7jTljxZ+70upWm9njjz6+FXPwpko=
X-Received: by 2002:a05:6830:6d17:b0:7e5:f49b:35b9 with SMTP id 46e09a7af769-7e97084dac5mr2813266a34.0.1782231350905;
        Tue, 23 Jun 2026 09:15:50 -0700 (PDT)
X-Received: by 2002:a05:6830:6d17:b0:7e5:f49b:35b9 with SMTP id 46e09a7af769-7e97084dac5mr2813248a34.0.1782231350491;
        Tue, 23 Jun 2026 09:15:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b856f92sm4762756a12.11.2026.06.23.09.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:15:48 -0700 (PDT)
Message-ID: <13ebe945-8e7b-490b-890c-27f775ed6f9b@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:15:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] iommu/qcom: Publish pgtbl_ops before releasing
 init_mutex
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-6-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-6-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3ab137 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gOOtitiCZwdyowkBYvIA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMyBTYWx0ZWRfX34vB5HH945wd
 NEWDLTvj+egazCqUu7mAhYsWaOGzup7Z/3dVsW2C/YRXBdYwxwpi0d4gZgL6xtgI/m8TwZiFLBl
 w1iMo2t6YyIxPbnix1eZDNxrhhAwxe4=
X-Proofpoint-ORIG-GUID: Yj8AD0KFn_myCIv--K0iyqeEC7eKvH76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMyBTYWx0ZWRfXyzqK8vos4IcX
 5r6fkgDlnKFILZB2A2gnV1BesrwufTOV9fiL+03sF1ynFhWoVSqUuY2Hm0pIzQaNKrDO+iWDocq
 aZ8LyHuOzGNR/Y9moa2eHjh8nt5OOdO0125B3oOQRr1fk5t3JEfw7iaL3Mr+9tFkOpTH6cwNKeG
 PdgAAxB5y+LBJXLrQ9UChhUpasmLaocq1YLY6WEnyrJ/4hOdTes2FK0KrqeStEH5DOv+mckoxsa
 2nyX5XmpxwPvx6pjetpAVBzEvPISAWirQVt+bDUu7WrL4NUklXQbBJ/t0KEz58ZcvTvPBBi8Zt3
 WoLkpw8+4epaRDBPe6Ihc6gVsN7eff2OaBqqSB8GsOOIxbDSAz84DBFLz3c58C4n5uCTQhxtp1a
 WG82NtdN9DtbNtNGSwIt0klYzhQ3OFIzqAj2CxIsiFha2vuGoCgnMB/sXoLVtsRmvwT2NjhhLTI
 vCxZ2wbo+M4lD7HPviw==
X-Proofpoint-GUID: Yj8AD0KFn_myCIv--K0iyqeEC7eKvH76
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114249-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 235A46B8A17

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> qcom_domain->pgtbl_ops was assigned after mutex_unlock(). Another thread
> calling qcom_iommu_init_domain() would see qcom_domain->iommu already set
> (domain fully initialized) and skip re-initialization under the mutex.
> If it then called qcom_iommu_map() before the first thread set pgtbl_ops,
> it would observe a NULL ops pointer and return -ENODEV for valid mappings.
> 
> Move the assignment to before mutex_unlock() so that once the mutex is
> released the domain is fully visible to concurrent operations.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index b6ce85f7f923..40fb0408dc07 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -306,13 +306,12 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>  		ctx->domain = domain;
>  	}
>  
> -	mutex_unlock(&qcom_domain->init_mutex);
> -
>  	/* Publish page table ops for map/unmap */
>  	qcom_domain->pgtbl_ops = pgtbl_ops;
>  
> -	return 0;
> +	mutex_unlock(&qcom_domain->init_mutex);

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

even better, we could probably just wrap this in guard(mutex) now

Konrad

