Return-Path: <linux-arm-msm+bounces-113520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c7AnBNFgMmrqzAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:54:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E686F697AF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:54:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cYORuCxS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gQEQd+ui;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113520-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113520-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB02E30A907A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 08:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826C53CE4A3;
	Wed, 17 Jun 2026 08:44:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E3C3932E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:44:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781685889; cv=none; b=SFQqayVICADOt6Rf1iaQ2dU+MRvCMLtwaaHIy6nU9ogwmheA2vAaZaLnmpKQyKTARCZZhLDDDbBAWtXB3LEDuIx/E23XVH20qgznqd+0wl9FqFnjHecnfvBnpmtzgWuG4RCtv9c1IBnUPaeExptkJ6j9lgthdmJ8QORyAab4HEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781685889; c=relaxed/simple;
	bh=K9Vi7vlWEM6R2XrD0PUsZNIIlSxZqb0KirTzry+BIgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBgVB8rFB5Yn+h9Rz1djgoHGw7DU3ihZk9BrCGqLyMN/jQsU81sXMprqGT7ZLGsIlrSw4fjNLjvN0e796NIt0E4jXSvuR8bRwBxJWlaI1YyR58GK3JLS1ktcKC+B1bT8SSZpdSBwAoFG7A/j6I8Onn2CU77qq95I5PkFDvUbXV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cYORuCxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQEQd+ui; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UPVu1703232
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XznFvh4eZUi3Kj0r41fb3c6a+RCWc3jRNVgC0hbA8bg=; b=cYORuCxSijDC88BD
	sGf5csfyS9bKc5NM2Oe6cB4iBTT5cTvTQJsjtscP2OU66KW4Kc7vn9c2ipd8SwKd
	avAzqJl9upoCjAhXw4U9ga+/QWcwamN+IJQdb4FZ8Xll1h40H+BoLAQ6YpnLbeTQ
	Xio0JtCZ6yQaHqAF8zdfRsxTjti0lJw7b5SoTuyy7cWVGO4TzZH/FL0YPUhB/bNR
	rWh0JhW4+sF2ftu5/arjmXOi2f/EX527Y4nuwyv9fGd7MActKbh3z2k47mheh8Os
	piOH7LeX7A+5RB6R3F7ST/iXQXd+MoLaLFgtJujkytBVsX06ZDuaVSSns1G3N13S
	gI3fNg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet267u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:44:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso5305318a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 01:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781685874; x=1782290674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XznFvh4eZUi3Kj0r41fb3c6a+RCWc3jRNVgC0hbA8bg=;
        b=gQEQd+uictyBCwE/kDON/Ws0sRlDQO2TSema4liYfAqcd9WQJV08LB6ki6FIUFgpFE
         tNMw9By9l16yUv02f6lf/VzQR+yfuUfJQt6jaO+2nj4MbYw/i62gCy1+U9FVmboE3LUG
         2cVe7XXQ9RzzDe24VVyzfvElG0DJ2cOPPTzVhATYaw34QnluonmsZWFimMEtAaoogYUm
         Q1oJ10QW/imLOEwl6FExXBDDLMAOr/cO9ld8FmLmiLqoG5DXIdX+pZqel7tbhA+IrIp6
         BE7TynbxMFPHzHBeHL8ZuRAJaI7SzyrNOlv4qv+U5jLwUrW49zcKl6uvuH1EyvSil2vC
         sFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781685874; x=1782290674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XznFvh4eZUi3Kj0r41fb3c6a+RCWc3jRNVgC0hbA8bg=;
        b=Xx6z4QQpAQYokUT0bs5epaljLape314CdObtHwZuXG9jJKsrfcSiZEeO7069KE35M3
         PbLE+OsiVGQSI2EZc+H5gHxv5K3RqgtOFyraqNO8od0jBRziFddjjHl1UqdVC+nVP41X
         9T2mq9wPLc7OJBe0goe/MoLqisDRPPLAVDsfXLYqbdkhq1oM0PlLyEJOM3UhC+XCv6dY
         uDw9RWc2CmnKaHzPukzDIehqYGkdQcZzBYNdOX2OwRUo6FWW69ZodjvkuAxGnGhaL3Lc
         zPfTk20sUAPi3VjRPXJjQ/fXNZ7Bk4ike9ro33brBrHvenHSvSzQ4iaCps16Qg4ZquRj
         htqg==
X-Forwarded-Encrypted: i=1; AFNElJ80614WQ7W2lhd8ok8nukSZMtYPh8/d9AWF7jn5pfxrEY2xo+z5/7j9g9hY76iGhlfkGLdq0ny8OQMhwvzZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyLoKxCQo3/C+ry+SlR0zaVsP43q4gZV/IOxXuA/WnP9vFx7MJr
	7GT2hVVIDh0RtjBScPjf4RPcYKmusdqtHMfAJ1Kpz7x3Jx0k++aFUVhc/Tc4EIU27Qohh7EidGN
	ctV5p1/nrlbFxLm6s/rD1vNQ52nBwU9vfNIIeTI96bTKyyQuMHr9PKq2fSFO4snVz3FLx
X-Gm-Gg: AfdE7clnkZNWz7pvSpYzwHu+s+kySLCv+bq+wZ569to5gKjLcd04FXOLrBOG3AY2oW1
	q5oG03qx14s3bGTvWkjGUnJoKPyhPWtMSVJBf9itsXsUp3JKZ+sw+HxvIX8bAOHyPTpGeNEaSJU
	QqCWdi/fyxW8S7blDEbnFpAx0nRj8xMVxoGgomktM3mWXZyf2Aw5LoMo3WPwyGLbr0l7DYCuTTE
	1u/F8PMBk9nf/W+gRHqiml2xsxQEjQUz4H79havdC+BucKYX3mzGH/3tNYiQxjFcrC80cE4cxS2
	EvMJGyxcHpd5FocISK+1Su2+toI6rxnuOJRUiyq4vVA29sObbMK4S3zx5Se+kS3gYWtuM5/tsJ5
	StVN2R447Cg6UOnvf5Q23iGPcghM3h7RbZ4MC7X2u2pRPwMIM8aQ64kG9RY/1I/Q+hhskU7NpFB
	Q=
X-Received: by 2002:a17:90b:5447:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37c936e1c23mr2816720a91.16.1781685874012;
        Wed, 17 Jun 2026 01:44:34 -0700 (PDT)
X-Received: by 2002:a17:90b:5447:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37c936e1c23mr2816688a91.16.1781685873555;
        Wed, 17 Jun 2026 01:44:33 -0700 (PDT)
Received: from [10.133.33.52] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521a959bsm5434327a91.2.2026.06.17.01.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 01:44:33 -0700 (PDT)
Message-ID: <58e290e7-e9f1-4fb9-827f-229de9cb0234@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:44:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: core: Avoid possible memory reclaim deadlock
 in TX EQTR context
To: Bart Van Assche <bvanassche@acm.org>, beanhuo@micron.com,
        peter.wang@mediatek.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
References: <20260616090654.421850-1-can.guo@oss.qualcomm.com>
 <ab8de800-0e16-44db-9dd8-377f92b3d408@acm.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <ab8de800-0e16-44db-9dd8-377f92b3d408@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oOEWG6Jt47IxBPTauq9SkGn9DZ3k7BEF
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a325e72 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=HB7fT6Jt0Jrlpd79jdEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: oOEWG6Jt47IxBPTauq9SkGn9DZ3k7BEF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4MSBTYWx0ZWRfX1O3efLi7tQLV
 6wr6QbG4DYcUUCLi85EnECdnRPQfSJ7MJORL5eYgs2hDF+CZyYNoacY10xyBa/CKwjTOOyoH0Ls
 wAUnspEHfljsMdWePY5ZyMXECl7v4zFHJq6cYPzjjylRGSfhcjzQ5UlpJJGaV+gkPVG+tvBXvvp
 cCxmVIA4oozqIWIrw0Vt/YyYMR67Z0bk0xECTShHHMg4uCjPjJNguQ9fGMlnjaxzhahFouqU81d
 +npexU29OsMkL40RfvaCgxzlgM0uEu2xy5hm5k3bbIUG/bItOkPgduL7+PpsU9gosk7yNZ+B8Jh
 ANZLmbt8qgl0xkERmL+2vXgeEgwbPlY5/k+U78t1qIngLyXrgri8xFYsBpZlJs0zYvOcNth9uml
 l0BuXAGzR5UA3WygWgiBD9cFa4rEOedJFgH4pclITvE2/PXoNN6vMNWA+cKYrzr+WJyvRlqgwKv
 x8u6yvVOSuCR2NQRPLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4MSBTYWx0ZWRfXzHLNFo86citT
 aoZUeH4vF1UdIq6rQDPcbzz3h0vpg0WS1ewxyDSNT9aT05sGw+bgdjl0JlaWj4DCdW1CaTUHJtk
 mDZCIWqGbntmpsUJ+H3ehW1H+td+tz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113520-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:beanhuo@micron.com,m:peter.wang@mediatek.com,m:martin.petersen@oracle.com,m:mani@kernel.org,m:linux-scsi@vger.kernel.org,m:alim.akhtar@samsung.com,m:avri.altman@wdc.com,m:James.Bottomley@HansenPartnership.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E686F697AF6



On 6/16/2026 9:31 PM, Bart Van Assche wrote:
> On 6/16/26 2:06 AM, Can Guo wrote:
>> diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
>> index 4b264adfdf49..3a2fb5329d27 100644
>> --- a/drivers/ufs/core/ufs-txeq.c
>> +++ b/drivers/ufs/core/ufs-txeq.c
>> @@ -1059,7 +1059,7 @@ static int __ufshcd_tx_eqtr(struct ufs_hba *hba,
>>                   struct ufs_pa_layer_attr *pwr_mode)
>>   {
>>       struct ufshcd_tx_eqtr_data *eqtr_data  __free(kfree) =
>> -        kzalloc(sizeof(*eqtr_data), GFP_KERNEL);
>> +        kzalloc(sizeof(*eqtr_data), GFP_NOIO);
>>       struct tx_eqtr_iter h_iter = {};
>>       struct tx_eqtr_iter d_iter = {};
>>       u32 gear = pwr_mode->gear_tx;
>> @@ -1217,7 +1217,7 @@ static int ufshcd_tx_eqtr(struct ufs_hba *hba,
>>       if (!params->eqtr_record) {
>>           params->eqtr_record = devm_kzalloc(hba->dev,
>>                              sizeof(*params->eqtr_record),
>> -                           GFP_KERNEL);
>> +                           GFP_NOIO);
>>           if (!params->eqtr_record)
>>               return -ENOMEM;
>>       }
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index c084ccc72523..e7f104987c6a 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -2760,7 +2760,7 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba 
>> *hba,
>>                      struct tx_eqtr_iter *d_iter)
>>   {
>>       struct ufshcd_tx_eq_params *params __free(kfree) =
>> -        kzalloc(sizeof(*params), GFP_KERNEL);
>> +        kzalloc(sizeof(*params), GFP_NOIO);
>>       struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>       struct ufs_pa_layer_attr old_pwr_info;
>>       u32 fom[PA_MAXDATALANES] = { 0 };
>
> Modifying individual memory allocation calls is error prone. The next
> person who modifies this code may not be aware of this conversation and
> might reintroduce a GFP_KERNEL allocation in the TX equalization code.
>
> Please use memalloc_noio_save() and memalloc_noio_restore() instead of
> changing GFP_KERNEL into GFP_NOIO. Additionally, please add a comment
> above the memalloc_noio_save() call that explains why it is necessary.
> See also https://docs.kernel.org/core-api/gfp_mask-from-fs-io.html.
Thanks for the suggestion, using use memalloc_noio_save() and
memalloc_noio_restore() is indeed a better solution.

Best Regards,
Can Guo.
>
> Thanks,
>
> Bart.


