Return-Path: <linux-arm-msm+bounces-117503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xFQ6D9XnTWqq/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:01:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8510B7220B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:01:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Fjdbr4gN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="BhLcDB+/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117503-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117503-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39A05300A3A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 06:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5AF329E46;
	Wed,  8 Jul 2026 06:01:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A81ABED9
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 06:01:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783490514; cv=none; b=TU0aRV+rh6AEdLcjoWg/4fg1dJMUn8RXnsMha0rr438pL8QuSK7ltvRMJhgQBlvGKFqoGO6iGDq0nBfPKqPLrlr8iG5BBFHVeetRcTEyajhljmkC6ZUOzhwg0GSdfrS00vgfse/KCi9N+tM4EYoeXhQ0Pf/sVHDBWBz1Ycz/eiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783490514; c=relaxed/simple;
	bh=WRcaoMH+g/SoWUtKRqzbRYwUKYcUQ2XK7GrXG21fTJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQuyofDPHV5HvQMxa+E+ZaxxVxCGgfWTEIYyGLDAbdiqKq7i+6ScSmHdg/+M+x34ADsDYdfaRIORQ3Bx959dsb73cy+0cqwYkromW9mJLb5XCP5p3AA4jTSgqx+bxr6G6vCXPWwWdihr6KkM1aBqU9/o9BCGglkejVMTbmRN0XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fjdbr4gN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhLcDB+/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668429PW1656437
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 06:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7z8OET7rO6M3TRuXlj9b3aCKb7Zgt+kWJI0H9Bb/fuw=; b=Fjdbr4gNWBSM8/F0
	0tZHbKfgy1SYKpIq59hJGEZYeCBQtwX7vVFGQUX7uVcvAu8aISWrnF4KILKeotMR
	eFOt2iq6GOZwDdzKL6UtARsDBBj1sB/ySNYzLcCHfDJEr/GjuUyfIsxpx8LP6taU
	kEqfMrPcg6satyig8DGtXxDLSG17sGuf4C7y57zyzIuos8RNd+q1aml4+8xTeKTt
	Iah4yuLAPIE1KbZNFepnFDSzMmFT2TbNo3p277pZ1xqD1rFy3T5FO4Q40ZE5mscY
	bPKQk6g1R2FI0rsI2iqlTLdxm0cELW2/xIPm/GDEqs2XWQ2jSGVJIyZHKhDnZPg1
	cx6bOg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssrwtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:01:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9a700dc0eso4465315ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783490511; x=1784095311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7z8OET7rO6M3TRuXlj9b3aCKb7Zgt+kWJI0H9Bb/fuw=;
        b=BhLcDB+/nUMQxwCUnyzLEuPs7FSflmsBSsoM9jW3HozWpW0Xjtc98/cZzBFf8V4JK7
         Jg0BUwmopPGm/PGjvqEuYk/s3tQUbOD0dEQncl/UutZKBY/PSTQWQH+fsa5oGMOrZhop
         EFPgmp1ErRKfiwRRseIe3Db+jD0UDF1F+lka/xVvto5aSEmGrCvOGtNWfCTukl1sO9E0
         2XnsCumOxpdCC9BOuU4mCFY2meajAL39QTwU1cgCjRx4pR2C1IPe9Bspr9phWpeMqlwB
         oKTJsc5NuIKBbbJYktfCcN5vjqKY/nN0AjjaTWFqGjpdfY6lRYtlrNvmcsD37rK15pGX
         RI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783490511; x=1784095311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7z8OET7rO6M3TRuXlj9b3aCKb7Zgt+kWJI0H9Bb/fuw=;
        b=oqUXRON5LW38acOPp9bqltTISVBQF3ueZiWBgBXTkL70h7VXesjihN3g1Snq1XSlQE
         8IHSFEhGq/5o6nDjZfCW0QzguquVfjqIodTrg/Y+rnAxYGnz5QsmiR6Y/pA4jXZUelv0
         1Y1MGUvIuLMTzgQlo28G15tjNVatx0kEBx8qiQxfMvaRHMDnklMtQtxUT9T71pUjLlzT
         f9yRFAeDzZTJMOIG2A/53nbjs90GzJjHanKIHU+cEj+l05+7iod0Epky8OfE4qfXO3ir
         LZAr7Uycw6gcIN2MfhXQKjAmIXnzD2C0uaZ4nQUMLfsLPzG1B4gv9aGTbJooQxm6dxIc
         CKiw==
X-Forwarded-Encrypted: i=1; AHgh+RoAIXRfZabB5aZ+nG0FxbSqLwIUKzk/pXgZetNE1hqo5NhESbhyAmQC2LrbtxwTFPfFVNEGWBAL3AvNc/7U@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5vBzQFWqgxcVNgeGgM4DcoODMOuH6hF8e3So0QrKuiL3XvL06
	e+Disr2l5HNigONx/8ybildUPeqVJgM39xEyNrNYqPb0vcSf1MpXpFmZl0SNzk7VLOq/7RwdHrP
	8n9FKAqOwCLslh+X7YbysXwPZffIrKxmaxK30vDSmbNJQ/vz56Ayw/qljr26fPbRjfdQ=
X-Gm-Gg: AfdE7cmcrD5da3F9+jtNxnKu3M13CNIi+QzDFUrwSm+1Kd0nLQmjkK6miQmcOA8MESS
	GtBmOdWZ5XB9zG16gJfUfMlZgPUy4NSa0WzI+NXrdDHpB7IsRi53vHznxM+j5tgV9097tMaQgmK
	0jZEyEQaqdrlxhMYRFlh6WTdHU52VkL+lijGMpsUOzms4AOQ22A/hpYRAr6VFyM6TkgoQB5BeEI
	iCQ4nRiyM4c2chQdDncs19OM9LR+PuzXSA2Y+mrM0Jcba+GXvrmKGik2dSbeNnT+7j7WhveD+Jy
	SLR0YQ4Pllu9Hrk9YSpYWcE48qHyaT+mvQ2MUkjVZcnx8zHdV9pWZwF3hjWqc0rmwTExttsxEPR
	HqfLY9k/gYSdA+ZHMBOn+tf+3nHiJtLGOKpr/yy+zoAHM
X-Received: by 2002:a17:902:f686:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2ccea5a4c8emr12224095ad.43.1783490510836;
        Tue, 07 Jul 2026 23:01:50 -0700 (PDT)
X-Received: by 2002:a17:902:f686:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2ccea5a4c8emr12223645ad.43.1783490510210;
        Tue, 07 Jul 2026 23:01:50 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.113.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ea74sm22247685ad.41.2026.07.07.23.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 23:01:49 -0700 (PDT)
Message-ID: <b7c8b25b-374f-40a4-9c6d-bb20ee0cb5c9@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:01:43 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tee: qcomtee: Track the object invocation context
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
 <20260707-qcom_uefisecapp_migrate_qcomtee-v1-1-f659cbd5d04c@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-1-f659cbd5d04c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4de7cf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=+r7WnWcjNhrw7ahDJtTqLQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Xpymrd_i7WOtP7wGS5kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1NSBTYWx0ZWRfX0hIZfZk70vS6
 SHMRJ9IK0iTNlafyAY832X4Kw+8sPvTQgxc5Kl8UTuamH4Gjjw6UvdER/dJj8H3kAxwiHBhon8I
 ch1u2WzWTVSsJ9ISGrKSQsSr7amdeVV3Evfigxcs+PBwz4Pga9cEELLfKMvBBJ4mXQhEpiZnMeA
 RpNzIHeO2YhgsmSwsVPnaJdu5Sg82Wk7ER4EMuoNAymQIkWWrdFMzA+c5cLfGTKtELiNp+c02F0
 nuzbTPdGAlzOTsAJviw+D7rxCtq9MotQEjkYN35WH/xRJPH0P4mZJJ1XV4OttLyGtnrTfwOwu6z
 934ZnLkiJP9rL5r2zex/d1a+EBIgnom//xKNP6CPC1kFPpNbUk7Qxixmt9ppv3MlVDd+hncLDVo
 UDPgR70phA9z2+6hM6PXTYpbynwIyunDUauBdn+6Xk2nsFNwwL1XrKY9cbJZWAtI2PeFI8G+sHn
 ZjPaVAipzoTeH9vb/jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1NSBTYWx0ZWRfXzRax+1TaEfJG
 1mJih0BQO5jstkjZtER4aZ/YjUZbmB2lcR0BfPtPcsIVqJ3nx4nqznXpHOEbH7SG81JAFXSNjoP
 vEvdfKt/8x0FaHXdRf1/KUCJL7FCu38=
X-Proofpoint-GUID: 70zTGJUlcyRLAmYzdoJ883cnCUF7Ul8c
X-Proofpoint-ORIG-GUID: 70zTGJUlcyRLAmYzdoJ883cnCUF7Ul8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117503-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:harshal.dev@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:sumit.garg@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:basantk@qti.qualcomm.com,m:apurupa@qti.qualcomm.com,m:aneelaka@qti.qualcomm.com,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8510B7220B0

Hi Harshal,

On 7/7/2026 4:11 PM, Harshal Dev wrote:
> QCOMTEE needs to distinguish between object invocations arriving from
> kernel clients and user-space clients in order to correctly marshal
> UBUF parameters and decide whether certain operations should be permitted.
> 
> Add a kernel_ctx flag to struct qcomtee_object_invoke_context to track
> the context of object invocation. Objects invoked from the kernel-space
> are expected to have the MSB of their 64-bit object-id set to indicate a
> kernel context, whereas objects invoked from user-space should not set it.
> To ensure this, we restrict the object-id space of user-space invoked
> objects to 32-bits. This is in-line with QTEE expectation of 32-bit object
> ids.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  drivers/tee/qcomtee/call.c           | 24 ++++++++++++++++++++++--
>  drivers/tee/qcomtee/qcomtee.h        |  6 ++++++
>  drivers/tee/qcomtee/qcomtee_object.h |  8 ++++++--
>  drivers/tee/tee_core.c               |  4 ++++
>  4 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index 0efc5646242a..a74a54d67b06 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -397,11 +397,31 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  {
>  	struct qcomtee_context_data *ctxdata = ctx->data;
>  	struct qcomtee_object *object;
> +	bool kernel_ctx = false;
>  	int i, ret, result;
>  
>  	if (qcomtee_params_check(params, arg->num_params))
>  		return -EINVAL;
>  
> +	/* Obtain the invocation context information from the MSB of the object
> +	 * `id` field.
> +	 */
> +	kernel_ctx = QCOMTEE_GET_CLIENT_CTX(arg->id);
> +	/* User-space identifies a NULL object via a 32-bit TEE_OBJREF_NULL id, whereas
> +	 * the kernel uses as 64-bit object-id. Hence, we check for a NULL object by
> +	 * sign-extending the object-id to 64 bits. If user-space is indeed invoking a
> +	 * NULL object we must extend the object-id to 64-bits from here on so that
> +	 * QCOMTEE can recognize it.
> +	 */
> +	if (!kernel_ctx && ((s64)(s32)arg->id) == TEE_OBJREF_NULL)
> +		arg->id = TEE_OBJREF_NULL;

Does it need to be MSB -- why bit 63? the object ID supported by QTEE is 32-bit anyway.
Let's mask the upper 32-bit and do something like kernel_ctx = !!upper_32_bits(id).
What do you think?

> +
> +	/* If the object being invoked is not NULL, drop the MSB from the `id` field to
> +	 * obtain the actual object-id.
> +	 */
> +	if (arg->id != TEE_OBJREF_NULL)
> +		arg->id = QCOMTEE_SANITIZE_OBJ_ID(arg->id);
> +
>  	/* First, handle reserved operations: */
>  	if (arg->op == QCOMTEE_MSG_OBJECT_OP_RELEASE) {
>  		del_qtee_object(arg->id, ctxdata);
> @@ -411,7 +431,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>  
>  	/* Otherwise, invoke a QTEE object: */
>  	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
> -		qcomtee_object_invoke_ctx_alloc(ctx);
> +		qcomtee_object_invoke_ctx_alloc(ctx, kernel_ctx);
>  	if (!oic)
>  		return -ENOMEM;
>  
> @@ -648,7 +668,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>  	int result;
>  
>  	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
> -		qcomtee_object_invoke_ctx_alloc(ctx);
> +		qcomtee_object_invoke_ctx_alloc(ctx, true);
>  	if (!oic)
>  		return;
>  
> diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
> index f39bf63fd1c2..5d292a2ff83d 100644
> --- a/drivers/tee/qcomtee/qcomtee.h
> +++ b/drivers/tee/qcomtee/qcomtee.h
> @@ -17,6 +17,12 @@
>  #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
>  #define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
>  
> +/* The MSB of the object_id field indicates whether the client is invoking the
> + * object from user context or kernel context.
> + */
> +#define QCOMTEE_GET_CLIENT_CTX(x) (((x) >> 63) & 1U)
> +#define QCOMTEE_SANITIZE_OBJ_ID(x) ((x) & (BIT(63) - 1))
> +
>  /**
>   * struct qcomtee - Main service struct.
>   * @teedev: client device.
> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
> index 8b4401ecad48..2528d07e4576 100644
> --- a/drivers/tee/qcomtee/qcomtee_object.h
> +++ b/drivers/tee/qcomtee/qcomtee_object.h
> @@ -146,6 +146,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
>   * struct qcomtee_object_invoke_ctx - QTEE context for object invocation.
>   * @ctx: TEE context for this invocation.
>   * @flags: flags for the invocation context.
> + * @kernel_ctx: flag that indicates this context is owned by a kernel client.
>   * @errno: error code for the invocation.
>   * @object: current object invoked in this callback context.
>   * @u: array of arguments for the current invocation (+1 for ending arg).
> @@ -158,6 +159,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
>  struct qcomtee_object_invoke_ctx {
>  	struct tee_context *ctx;
>  	unsigned long flags;
> +	bool kernel_ctx;
>  	int errno;
>  
>  	struct qcomtee_object *object;
> @@ -172,13 +174,15 @@ struct qcomtee_object_invoke_ctx {
>  };
>  
>  static inline struct qcomtee_object_invoke_ctx *
> -qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx)
> +qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx, bool kernel_ctx)
>  {
>  	struct qcomtee_object_invoke_ctx *oic;
>  
>  	oic = kzalloc_obj(*oic);
> -	if (oic)
> +	if (oic) {
>  		oic->ctx = ctx;
> +		oic->kernel_ctx = kernel_ctx;
> +	}
>  	return oic;
>  }
>  
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index ef9642d72672..7f986d7fb47f 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -706,6 +706,10 @@ static int tee_ioctl_object_invoke(struct tee_context *ctx,
>  			goto out;
>  	}
>  
> +	/* Userspace object-ids are restricted to 32-bits. */
> +	if (arg.id > U32_MAX)
> +		return -EINVAL;
> +

This change belongs to tee SS, move it to a separate commit with appropriate message.

>  	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
>  	if (rc)
>  		goto out;
> 

Regards,
Amir


