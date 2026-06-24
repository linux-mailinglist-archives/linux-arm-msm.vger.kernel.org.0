Return-Path: <linux-arm-msm+bounces-114275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 62pfAHVRO2pcWAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 05:39:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 925556BB221
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 05:39:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JYe5kdPK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C1LEGkWO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114275-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114275-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C6E03012B36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 03:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20D330AAB8;
	Wed, 24 Jun 2026 03:39:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799BF2F360A
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 03:39:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782272370; cv=none; b=OFMjjMTaC4gyr0i+Pk3n9JEptHCet7Ea8fCJXrwg/1Xhrpk8Zb2kigJR13t4gK4TV6yHFtW//eQimdP25PIiMZE6CIpw/VAh4tXsVAoN1E/A/P2t/Ps5L+WcH2y+N/oIL4iNVJC8F/FmEuie7whhjl6uwOcuvKuFqOLGZIhc8AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782272370; c=relaxed/simple;
	bh=2EjvsFaAQeE9qVmKbO4mrLlRLyngDmWauWcSEj7FHSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EvvJT1kKT+FfkGJMR/V2Kd133cWuMSHrl08ssxB9py8jkKVu8SA43tmEQeRqZrtjZ5GuboLuIA3vBUYWXgX8qLxWq47AZixamnF028B8m8KTQgQDx/Qm43075Ebxs+OfX4xHz7Y/LXx/XWMhjBeYa6psXPsrRYSkidVL0Aw5L4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYe5kdPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1LEGkWO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O1T6pv1876017
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 03:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0+XSenEQTH5fxmy4dSQBjH5RjWqklrxJNjZYQ6591Q=; b=JYe5kdPK6G8mYgg3
	8XP3zCeiGHkzuT0TcZJsrZCCjNMfbCw+ltwP+MS73WkQ8a7KmZl+jJqpfvTjVX//
	9tg0qomyMap6oIyo4Y2IpIhKihgY5QlkbLnZduJiw0gNGRyEPh+ZeGs6HSSoxPZ7
	yxRF9iBkK6gRgXH8zS9irH9UHh+gOswgMsKYUhVI88uAkeyFcM+4PYPbqm5H7X/j
	G8Yo7RbMFk+ZcIKovcY0JtLSudxsiBbEH4obpKOOjoTqVt78+PryOcTkdLi8F8Jn
	HD4+8i0edgzuaqlqrIrv6k/fpjF9pl+ldd/+iPT04E5yVYm1DPWQF7ZSg20smqEt
	n2C7UA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh2ynd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 03:39:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37cc07f3e36so814861a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 20:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782272367; x=1782877167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0+XSenEQTH5fxmy4dSQBjH5RjWqklrxJNjZYQ6591Q=;
        b=C1LEGkWORFr678vR4U26bPoMyr5eHt3veicuNh3dxEweoi93d5QtgrvJyZYbaqOSY4
         B8NAIbyGpDsJKSdWugsxh1+/Q4VEJmIfas1yvBMAJoHMoDlehVN3IMJr9P+ihKVAEuO5
         NZ7Kdhz+qVQteik1X+GnbZpboa7JSH/s4Q/CvFqkmJxjUeoWzndGVCqIQYfZAP9Qlm+p
         uv4yIQ45IiYdWvTgANwwtNVUYba1frIzWjAO9BbzFU8bN7bOZPORU7m7iNyRAP7vkKLd
         je2WmXYi6NouAJBtpTFT13N64ZxxvbC/tbvT2Hl9yDpC464yrSUZzMG4Mh413fApQvbo
         mi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782272367; x=1782877167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0+XSenEQTH5fxmy4dSQBjH5RjWqklrxJNjZYQ6591Q=;
        b=O342TgItxtMgS4Lo1ieSfgpoECLE83KAwVJyuGOvlbPiiw0Lf4RCuxTUWzV/a20vP4
         0ebZgZL/PKau5vCRuyrQH3ljXlEwr7bAJiZN5TyR79jAstjwEYTj4IzLrc881TBQKzOb
         kkUbUXb116dwTKITFGEAKAHmEdSnXxFEzxZeASSdZ3txm1tYZgveMw8Z0DQAdzT37fyR
         sZqRCr3YqNIm2q9ORR95jb4tnsFqD4Q3IP0qWOBf2xQPKV5gFuNoG9VcHvvNE7ojY7g9
         ga0DmbPtDHmSQAOoqIc5HGEiiLhlw5QYIIizx9sdFMgcAEYMEwBPO6TmS7obFM6XuxNp
         wCUA==
X-Forwarded-Encrypted: i=1; AHgh+RoioNiD3YhJEfH194ZMfIRu8gyqD8u7l4wzKVN/fQuVYgmKnpVHUrfE0kqeO9NaldUaV+R5xrCbDJp65Bb1@vger.kernel.org
X-Gm-Message-State: AOJu0YwKaeAcbszoBtYz6kznct6zfimk2cS0eQf3YOeK7x/PbCZtY6Js
	1Fpf2708oYgSk406NavbPFcnwUZxkWoKyLYdvLOlbiTfw/IzdEHywYiyEBKRCHlHVGrY5r9+hJ8
	7QlKqakueNbwX1wC9rTQz+d63ImXp0fCEvKdMfL0094Yf3N/XP7RLAGeUFAPtG4Gn9eQ=
X-Gm-Gg: AfdE7ckzCB+n/5g/i6TgV7qK6ijL00K1OZW6bALypoQcPgi1iEIOT6Dhl1S2pV/CXWs
	L8CEDM6Bd1epzR/6gl8taX5O6Qb6dcUIzOC/+y75AkSrSxqlKHeEbTBtJhrhbaL9lpkX8hvicoe
	HTgLGzoXesALPTGJeu+fz3Ok0lXGzHghCoq+MqFuI7xzu7pa0MVRHz/QJUO/rlurqk0ejuHo+Mv
	/aZpt1z1LDxX4z/Q7XM2fc/swldnMuVjMME0y8vbEo5DOzcRYE0PFHBDj4Gd87Qy6obsF26Dqz+
	9HlYF+YXjg9OOEIODGFV89YMqk1jRjEDYinsvOpzRbq8yKnOoOX4F99frxs0jd2JKiG6hRmmFxM
	Gn/vnCSFrNpBOxjsApk5OsSv8PTlZPi0XyQKO0Gk8bus=
X-Received: by 2002:a17:90b:57cc:b0:36d:635b:85a0 with SMTP id 98e67ed59e1d1-37de415329bmr1726669a91.3.1782272366895;
        Tue, 23 Jun 2026 20:39:26 -0700 (PDT)
X-Received: by 2002:a17:90b:57cc:b0:36d:635b:85a0 with SMTP id 98e67ed59e1d1-37de415329bmr1726647a91.3.1782272366408;
        Tue, 23 Jun 2026 20:39:26 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.15.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3ca3eabsm862534a91.1.2026.06.23.20.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 20:39:25 -0700 (PDT)
Message-ID: <6971c4b5-d091-4fe2-b843-60da8b32d48b@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:39:20 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tee: qcomtee: Drop unused assignment of
 platform_device_id driver data
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <c21803b3f2ea1522bb930dc1dcab79c2627f2234.1781620559.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <c21803b3f2ea1522bb930dc1dcab79c2627f2234.1781620559.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDAyNiBTYWx0ZWRfX+4U5Jv3sOnHw
 qhZkugIEREH/9gzMSXm+pMmZ1WOa2eU/bOuJzl0U9tkM7lgzp2+IR+HIear1+p7liOSeN8zLS1Q
 InDchn0aGh5YU+dUTMvCtWBr/VTz40nnZau+FSqyxYpj2fum1r9Px4A1cgqYBcxUBxPTYc79tWm
 GZ0mY1ynnp4Je/WNdPOB/dgcJ3l0fNpgVhhAerPB3eGpX+M9MLCLx/AjETUlioUxWd9iy/gIVFY
 Z+ZoS9C8bHgcmLx/0YKR/+S27ymkfaYwUGCSZPe0XIXVhW1Lnb6/Lm1swn1yHacXUx48VUZw1vG
 XeCCzVKf+/r0EA18YfwHTfQsQjnytiQCYZyMquUP1a/iyA+PK7tvJp/TCLYap3dheJgWH2iuWAn
 v/WImwQ9ahGlvAnZjh7IqDpcOF4auDdwvxNo6bOD+OCni6GT66j0DTsbfta+tRIGPq8ACC6iX7S
 KFCbBUaG8jZOSQg6ONA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDAyNiBTYWx0ZWRfXzB4PW34+/A0Q
 2lpyyc+h5lb7DuEBd2C7SXBIBYLIdOSvd+KTlNk+cN7zHwLAL2MgcQRDQEL25SlDJNFspHt5tLZ
 o5mO/DTREplh8ZgGyMdUTrn8rtB3CHE=
X-Proofpoint-GUID: yePK56zMlXiPbUC0s1S6VE_HJpayR25t
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3b516f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=+1+sR1ZYQ3C5TUrBrcwr6g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=zM1L8A4z-D6ZsxyLzxkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: yePK56zMlXiPbUC0s1S6VE_HJpayR25t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240026
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114275-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:jens.wiklander@linaro.org,m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,baylibre.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 925556BB221

Hi, 

On 6/17/2026 12:38 AM, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly sets the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop this
> unused assignment.
> 
> While touching this array unify spacing and usage of commas and use
> a named initializer for .name for improved readability.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> while this is a cleanup that can stand on its own, it is also a
> preparation for a change to struct platform_device_id that requires that
> .driver_data isn't assigned by a list initializer.
> 
> Best regards
> Uwe
> 
>  drivers/tee/qcomtee/call.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index 0efc5646242a..4a597eeaf174 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -798,7 +798,12 @@ static void qcomtee_remove(struct platform_device *pdev)
>  	kfree(qcomtee);
>  }
>  
> -static const struct platform_device_id qcomtee_ids[] = { { "qcomtee", 0 }, {} };
> +static const struct platform_device_id qcomtee_ids[] = {
> +	{
> +		.name = "qcomtee",
> +	},
> +	{ }
> +};
>  MODULE_DEVICE_TABLE(platform, qcomtee_ids);
>  

Looks good to me, thanks.

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

>  static struct platform_driver qcomtee_platform_driver = {
> 
> base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac


