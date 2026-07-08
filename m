Return-Path: <linux-arm-msm+bounces-117515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vca7JJ/wTWp/AQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:39:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F4F7223DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 08:39:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f4F8+R0j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PHLBzKs+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117515-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117515-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB2B4304854A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 06:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329B33C3448;
	Wed,  8 Jul 2026 06:30:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B863C8C52
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 06:29:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783492202; cv=none; b=u2N0amK+fzzVH54BcoJ2SjYgYqJMoI5pYQ5KVnK9mbNFobbPlkw7DRDVCjiieKlvBLq9Wq9E18iTh3vuVB263ZHSaxyB29c1glkwMesYmXwF1Kllt+nhO/kOYczi4HVkczgyAxKD+51M2KRKV5nIKunQmIQO4P5bx/QCBu/tYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783492202; c=relaxed/simple;
	bh=0eFyRhU62Sp8Fxi3jAmIZTFwuMocCNKG2j2XsRE2x/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOWF8e+pSyw6vqerUSw7l85GFtRnlTgQXeDlNLpXSO87no8IG3eUmq1H0KfWkfBHKd2gmXht+tLSHGVgdMtycfBmj36jC8HVlwHQXAIUxR2CvJRf4rdZQ3KpoMUjDU+afyk08TiOQW1I5UcbtJbhsq2M3gyIn/kS19NdW20QP7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4F8+R0j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PHLBzKs+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842k881645088
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 06:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1F9UyrOYpeOrWMjmcc95u8JvN4hXEK2XvrTpwrlEp2s=; b=f4F8+R0jdQPbJCLU
	Jo9jKtE6ZeM/krA4f8BRaa5WWv5MtwJLy9wu6XUPNDvonsTtzJ6G+CbPUIHdBS3b
	t47jNI+5DA0Yy3pc7pXefIaHMda8Xo8DbVbmGZFcTGDFssoDqriyCKReSZ1JcrU2
	N6yLMbSAx1M1TQgoGmNt1K1NqNw7I4T5cwqpma54Lr54sgetex6P9eItNzt5TKdq
	HpFdPSPT29J9EipLQx4S7SYwqYWjh21PGaOTLXYDNL7tHofCBn5CdzspdmnED36v
	bUfSgUuJNDnSD3+6do/xiixI8DCKGCkiDjIhpVBph6ZFBDq7TieHbF88TYmKH0e8
	DnHp+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0mh5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:29:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6823efcso4124385ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783492187; x=1784096987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1F9UyrOYpeOrWMjmcc95u8JvN4hXEK2XvrTpwrlEp2s=;
        b=PHLBzKs+iHW/s04qnc/r0pu01rHgioLogFq2b6xw3taQK+c0/02GODsTEM7l8khaV7
         xjL32xkr9n3FRpHrQtIhgiTqQScoddMcX8b8zqMuIEcVkgxR/C4I14uhj+lFZiYmmDW6
         W6BzyWNj2DNtL2ojqO6ZXYy/MhLvgNyBiIBK9y8jOoIBklFiLWZpxf3OLI5TYbFooUKt
         ZgFZ6UzL6ny0TwObudncMqnUja2Uj+ZRusKn3OJqfvuZbObySBL2SnlloqHSeA2O6VRt
         TJv1SeTg9RF2g/zR4Nddot8FbUMjY5B+IM0HQUinksr3w3nbFEdEI5CY1INK7TaPcq/x
         AKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783492187; x=1784096987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1F9UyrOYpeOrWMjmcc95u8JvN4hXEK2XvrTpwrlEp2s=;
        b=kmQkPxyMvrsWa0Mzm2rU6OLrqAKOQjHGdw3SfpMKr+XtRiBkvUuVnv0HUNMToCKtgg
         MhZZkBii2iKk1HwX8+cX/rWir6Xav8lFjGsrjmMhRFQXZvyYpwhHLyzS307gkr9f6JQC
         vXPvFwb5tk8nXpj7v+6qg0r/oqlTMlgvlaTRtnmu/XsFMdltx8hh/Bh+TFp4LMkyL+ZQ
         gbgBKk5Z9aDAu5gNcfXzq7lcrP+EBx2X5nBEPXA4IQP9Khq0oH2J80kMjYG6ojWL8Ob+
         X38VLfcDhq84hjpn84BmrHclmMKaIZAHw2TkN5HB+DvtQhNLyRmQYHtpevvWnm580ia6
         nODw==
X-Forwarded-Encrypted: i=1; AHgh+RrvQ1lwHVS3yRTwEkxfM4VCLLpnrVpnAxFKqPYfh9ZbYs/tZCuz+bvycuJls/CAsp3L+QpqXLiOTJLUNwAm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy1Xc4XhSm1iFHhzcYZU02rGxYR5AVYNLd6xGQTthT5lIIJVTm
	qc27J6iBy+1+uhLfBkwLhB19/JhraeIGxXa1zzldw05LceHKX3fwqiNtcePpuuK+DJdEF8gi1c8
	VZZIY4TMoOXNG24mn4r0IBG2nbgbV6uqc7aj+bhOm6Y/zmG/vw+QqA2QWVkft/x/fbrQ=
X-Gm-Gg: AfdE7clWtKVoXK2x5LDSIjmzmAlvHEPO30ymsRDTw1fmd+Ebbb1wH3jYc2fVJlUDfv5
	B6Yf4D8jFx00FXy4OO3WV35deMDeIMxdpGDYvnlYxTRxRIkdrGjcOc/9X0SMyfuqxSXYV71ra9l
	ZuDK36wYjfZviQHJMNyWn6W4LhSn0hnLQ4xmdGXBq1g3VOCef/VjXdOylMW3KRp91z7Gzoa75YJ
	Y/1OoAHydag1KXF7izKcaCQ3/3lEijuJnPHmXdaTR6CT9vlNZiRjGqOvhWvU3lnmMyWB83vOBq3
	qS128iNDLQGX6BLtpDtp9XaXTbJ2LnSehuV6qkg7sYD5TOa6uA1/qt6Q9mI5DQHDRzE8SydgR68
	zUA+nhGkVH3/JeDw4BbYL16ttZ5eyq0tY10WoULdtuMrl
X-Received: by 2002:a17:902:f791:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2ccea59f7a1mr11657575ad.42.1783492187112;
        Tue, 07 Jul 2026 23:29:47 -0700 (PDT)
X-Received: by 2002:a17:902:f791:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2ccea59f7a1mr11657335ad.42.1783492186630;
        Tue, 07 Jul 2026 23:29:46 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.113.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5c361sm22607485ad.80.2026.07.07.23.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 23:29:46 -0700 (PDT)
Message-ID: <651db8ad-ff57-4369-8401-f51bb7ea46f5@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:29:40 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] tee: Add kernel client object invoke helper
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
 <20260707-qcom_uefisecapp_migrate_qcomtee-v1-2-f659cbd5d04c@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-2-f659cbd5d04c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qR1tqsvSP_5O5LTQ9LDxUCiA8QgNw--U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2MCBTYWx0ZWRfX51wTOFgx09Xj
 Arfx8qbhEA3OIBsyFahLUT7jOtDrjUh2hfo672CFELvGQYYOvk1QOLo2+56PNZ7f49h6mFcsSxX
 g27PojXRkiSJ/dzXs2CPG5eWQ4W7CD0=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4dee5b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=+r7WnWcjNhrw7ahDJtTqLQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1yzuO3Wzu64Mvm5RHTIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: qR1tqsvSP_5O5LTQ9LDxUCiA8QgNw--U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2MCBTYWx0ZWRfX14CogmhVzDAV
 U4qgqGFmGZBRVODQveTGSVA3JRnA4FxaHrAyvdxGplVPnAUo4GQtOGygpqLbLorS9Yr1uRXxzH9
 HR5sn04a2UDLu+QFCOC8SNZs+m6LSV0SPZ6+wDlUisvrbNJ+7KjL6pLLPjjzr8MBgydl1dE4gNH
 1FbPEPr5z2hAHR3HBzyP9UGaKv/8pRz31QfNj26n4DjpFwMXKmKN0MlpfWJMVEhvOhp7UxGiPt4
 ZsSmwVEG/iZqDFBJ5wTpQ4oQLWjPvRHujOXvV8Gm7sorwMA1qLcXFABS0zwKLnOv7VnymdArhcB
 qXvodK5q+BKWvMXSZE4Jytcui7MH7HlM4pDuxOKHTu1wA+x8z5Hf/+zOmsJj4CsJbmpu9RvsgAa
 36GtzdQ4kzxj8wV1PwcdacBFTQlVYcHVCKdLOa4tH5EckYU06dwElSsD5piCDfAGCKJvumd2C7g
 8aNbkxgX01F167qlKAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080060
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
	TAGGED_FROM(0.00)[bounces-117515-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:harshal.dev@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:sumit.garg@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:basantk@qti.qualcomm.com,m:apurupa@qti.qualcomm.com,m:aneelaka@qti.qualcomm.com,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5F4F7223DF

Hi Harshal,

On 7/7/2026 4:11 PM, Harshal Dev wrote:
> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> Kernel clients can open a TEE context and invoke regular TA commands
> through tee_client_invoke_func(). However, there is currently no
> equivalent helper for invoking TEE objects.
> 
> Add tee_client_object_invoke_func() as a kernel client API for issuing
> object invocation requests. The helper checks that the backend provides
> object_invoke_func() before setting the MSB of the object-id and forwarding
> the request. The MSB of the object-id informs the TEE backend that the
> object is invoked from a kernel context.
> 
> This allows TEE backends that support privileged object-based calls from
> the kernel-space.
> 
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  drivers/tee/tee_core.c  | 13 +++++++++++++
>  include/linux/tee_drv.h | 13 +++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 7f986d7fb47f..0783802fd010 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -1413,6 +1413,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
>  }
>  EXPORT_SYMBOL_GPL(tee_client_invoke_func);
>  
> +int tee_client_object_invoke_func(struct tee_context *ctx,
> +				  struct tee_ioctl_object_invoke_arg *arg,
> +				  struct tee_param *param)
> +{
> +	if (!ctx->teedev->desc->ops->object_invoke_func)
> +		return -EINVAL;
> +
> +	/* Indicate that this object is being invoked from a kernel context. */
> +	arg->id = arg->id | BIT(63);

Setting this bit is a qcomtee backend requirement and should not be
exposed to the TEE subsystem.

Kernel users of qcomtee_object_invoke() should use the normal object ID
value. For example, access to the initial ROOT maybe represented as
TEE_OBJREF_NULL | BIT_ULL(63), but the upper bit must be managed by the
qcomtee backend for any return object, i.e. The backend should also set
BIT_ULL(63) automatically on each returned object ID.
Callers should treat the ID as opaque and must not manipulate the upper bit directly.

> +	return ctx->teedev->desc->ops->object_invoke_func(ctx, arg, param);
> +}
> +EXPORT_SYMBOL_GPL(tee_client_object_invoke_func);
> +
>  int tee_client_cancel_req(struct tee_context *ctx,
>  			  struct tee_ioctl_cancel_arg *arg)
>  {
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index e561a26f537a..ca99c6b747a8 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -283,6 +283,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
>  			   struct tee_ioctl_invoke_arg *arg,
>  			   struct tee_param *param);
>  
> +/**
> + * tee_client_object_invoke_func() - Invoke a TEE object from kernel space
> + * @ctx:    TEE Context
> + * @arg:    Invoke arguments, see description of
> + *          struct tee_ioctl_object_invoke_arg
> + * @param:  Parameters for the object invocation
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int tee_client_object_invoke_func(struct tee_context *ctx,
> +				  struct tee_ioctl_object_invoke_arg *arg,
> +				  struct tee_param *param);
> +
>  /**
>   * tee_client_cancel_req() - Request cancellation of the previous open-session
>   * or invoke-command operations in a Trusted Application
> 

Regards,
Amir


