Return-Path: <linux-arm-msm+bounces-107696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBwuL9d3BmoUkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 03:33:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFDF5486DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 03:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B87F030086E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 01:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C31226B764;
	Fri, 15 May 2026 01:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBhnEuQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnbWlBNO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6F935A395
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808720; cv=none; b=eVwrur/0XxVLUsKv6AEeLGkEfvRTozqHnULjhv5V1tEc7p+17miWj1+3LbrYw97hhJGlLk2FGInriZuh8lTz2RvqBpExQnmDjQRAoiPnOF/nFU3u8XG9ECD3qx1fAN0wiVcx+VKvAnsUQxoeUqSTClv49kOgxdsAzFVyRlhI+QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808720; c=relaxed/simple;
	bh=usEwnKkEaTPE+yU5TGR0oURw8nv72W+T5MSwsVZgYLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1vNV9f6lVrdD9UYrJcqMJIXiGjvl2cQ6nRbTFUgy2RXbJHG46qBYh2An/UC18qCQHiBp6k0KKXKnZWHilP+OysIm2GwKKxuiYgzYcPK8oRttHMdyBI4L8HRqn6o31Twiu5Tc7zPHXoHMayosUdQylVBxcsOxruBKuNPD2tldPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBhnEuQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnbWlBNO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIq7e73797495
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HxJXpfYBS7mpaWwbnqYYsS+05m4PCWFY64z260Mm9fM=; b=cBhnEuQ0Yie0TnAK
	ERP5nO11N4a6rv1v443pUEQeOIvJNTeSB+U/1IIHjNRqGwplsJegcwpCjkkTDewn
	2wtiyff9ZRDB0oC+8HLS/V0GBHVksQdQnUHzhioXaNopAWQoi9lVInwwdYdpcnQm
	+gq/+WiuOlqzUA+vofQPAueWWx8YHQZwSVU56+OQLrG30Ao83W9tthtIWeYVNGU3
	IFIYNpFW08vYFTxBkz7bAomDrDQMoSLF8nrhtbSJIiNlbU6kRq9/na80VYGPQt+p
	T7Ep6Xgr7SgZ7pUiK8q9rudAGVn3fv6de9pX1Chx0QtyuatsztnI+Me50mwrQ1Sj
	Fto94w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ss0jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:31:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2babbeff9e4so4441935ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 18:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778808717; x=1779413517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HxJXpfYBS7mpaWwbnqYYsS+05m4PCWFY64z260Mm9fM=;
        b=NnbWlBNOEbudVYwcjMnnf1tvDQC49sD+xCBoK7f6hwQeCjGitL7m8RHR4JvYRnPh9H
         WZFIc7ZNOxkiqJ91DIDmAqXlinyGJonz6CXxxIJvSf1aXWk/DoD7RF4GDwtj6qLmNExp
         UtCqzurrJsj/kmOeg6TYE42d6aUQvwQnGMatW/46qaJXm999yD94blD7CR99JRR2TJjt
         4nPGCg+MDt5NylSVVjaNs5ELbA+QDHUjLhCkdpCFlhOgV497dzRDnQVJqeB0TpvEvhTf
         gMuw7sRfDZdoCSgXN5EAJf6udymC1Xti7BsH8WzoDtBpLoF6pU6NjtlKJwk794J55H1I
         zZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778808717; x=1779413517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxJXpfYBS7mpaWwbnqYYsS+05m4PCWFY64z260Mm9fM=;
        b=N7IXOA9Cn6aBqiZbPEazv1fNw4FOpUWqjo4XTsSs0JChuesbPjpiiBHHxaRnTKDN4p
         +Vd2wcRqUt+usPS4IfKyDqdWv6fMumyIE3Vm7VsqxLfj8+/tsywhc84bomgAdaGHhR0N
         rqqrQdzx0WV6IJCtegqu3im9KCIuQS7mVtWfQeCen7/hN3/6KrRT8XivhHOXxsFUcZ5w
         +rR1AjLDi/p8Elp/1sBN8TDE9nF244lJRLDMHhR5d7IiCkCMGryK6cxuK9eFEMMHkYbB
         QSrkQWnFzC2c44p1GC46QAlQgVWQYpDGJ8AOeMim9DDw8dMG70xrNHFE1lr7sa5KafvS
         w3lA==
X-Gm-Message-State: AOJu0YwlbeuqWU6ETitDNhN9Ig6TY0q+y5wHjVHcBsxPif5v82aAeEY8
	NQkLwMITz4/3NhYR9KvAVku5ej3Wg6mUr4Abaj9rXzWjSRxc/9J1UTCwTONxjUc/D14Fn71SIu1
	s1vTfaMAMTHfvxG2Z4WMsQl8KJskCs7a3dvZhO9d8GsabxnuFQ2S2pBcMYNEs6M7f0ZE=
X-Gm-Gg: Acq92OFKi0D6suqqsCS6r60ZcrCDYbCZapuf5DeZxWQsqhpT1KpAGONyUsuacyxVD0J
	MKQqlMfqAIzc/J8FUBOJK8/5s/ndIFpkWJZ32MsskkL3nZ0K6lAQ68oIR1/rajoG7rGhUEkhAqM
	Lx2AjX1jO0mIQB+YIriTG4+hBvTJtLrCVeripu3mQ55Q/FGWdjjWKeL3ub0rIsjOaPQNASOm/fg
	dzKU1uOIUh5DTM8xveW2PMtPypRqKMPtf9LfXLqDxEJ7hBm0W+vl2fH8+1L+TCOTAiW5O+4sibn
	E86dTcL9bKBRwUHWVpjsq+c8RTxTJD50gbKKdFGOdKSoCXgO059p1lqGdUb9Gx1RneX2tIkvL6o
	W5yv1zd8NX6BywjIGyiXlvR2zySwgm8x8KPmWGVNh1yFCvbGOQr+/9JBh2++aaQhw7Hy+RXKmJI
	/w0s2pF/nlGqnlQqzkI90=
X-Received: by 2002:a17:903:2ecd:b0:2bd:3c21:a053 with SMTP id d9443c01a7336-2bd5283e0c5mr51230025ad.24.1778808716720;
        Thu, 14 May 2026 18:31:56 -0700 (PDT)
X-Received: by 2002:a17:903:2ecd:b0:2bd:3c21:a053 with SMTP id d9443c01a7336-2bd5283e0c5mr51229835ad.24.1778808716140;
        Thu, 14 May 2026 18:31:56 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd7e8e5904sm10360535ad.64.2026.05.14.18.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 18:31:55 -0700 (PDT)
Message-ID: <8182784b-b6c2-4136-af8d-3aea4f5a4662@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:31:50 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: qcomtee: add missing va_end in early return
 qcomtee_object_user_init()
To: Robertus Diawan Chris <robertusdchris@gmail.com>,
        jens.wiklander@linaro.org, sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org, me@brighamcampbell.com
References: <20260513091031.145826-1-robertusdchris@gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20260513091031.145826-1-robertusdchris@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAxMiBTYWx0ZWRfX/syWb9EH3Cni
 pc7xRL0pggJAadruPdfoJjAhPex9U/MtOtpfMO6VJi6UcHrEsaRYvVLqsLCmTkAEOlfFaGu683Z
 mo3X62b7PzHscOaLvD9K0G8gXqkNvv/C4S1vpyYESGrCbpRYSbJcoxV4ZF0HdOMzQVwiUNDZNKS
 vFjNhRSkomw7tfM1fzoY5lwSQcB6pYPVzohXTTQsa3HAA7Ze1mwslFVxOn2lNcFfloZzIKC9cfX
 iT+50Vonqo9AWJJo+JgYyrm/tFdvkRzyrUj3s8rEBLz5AqsrvKmlXR6jWzJJXvBwHCTRNoDVHBT
 LRuoeGLiJlhik7s+V5As0SWw7dpg1ZZsSJgqZb4NyMeMH5v9ahNO00mC51qAF2GFRyGhn618xg4
 YfzymG1rDR3buS8sIxO7g1mu1C3sf5Es/056zuLIMYqteyzny9zDE+X5bV7tTjOgelb7meXd6Qn
 1Qk9CSt0TMsjCcNRRuA==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06778e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=A39jgTEGnKEs4j151ysA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: xuFDkYH9C_1HNI9a9Gpz98NRw9rwxW8X
X-Proofpoint-ORIG-GUID: xuFDkYH9C_1HNI9a9Gpz98NRw9rwxW8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150012
X-Rspamd-Queue-Id: 1FFDF5486DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107696-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi,

Forgot to mention: how about using a break instead of a goto.
Then feel free to add Reviewed-by.

Thanks,
Amir


On 5/13/2026 7:10 PM, Robertus Diawan Chris wrote:
> qcomtee_object_user_init() is a variadic function and when the function
> return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
> case, there's no va_end to cleanup "ap" object initialized by va_start
> and that can cause undefined behavior. So make sure to use va_end before
> returning the error code when there's no dispatch callback.
> 
> This is reported by Coverity Scan as "Missing varargs init or cleanup".
> 
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> ---
> I don't have the device, so I am not sure how to test this change.
> Thank you.
> 
>  drivers/tee/qcomtee/core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> index b1cb50e434f0..901a31e8201f 100644
> --- a/drivers/tee/qcomtee/core.c
> +++ b/drivers/tee/qcomtee/core.c
> @@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
>  		break;
>  	case QCOMTEE_OBJECT_TYPE_CB:
>  		object->ops = ops;
> -		if (!object->ops->dispatch)
> -			return -EINVAL;
> +		if (!object->ops->dispatch) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
>  
>  		/* If failed, "no-name". */
>  		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
> @@ -320,6 +322,8 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
>  	default:
>  		ret = -EINVAL;
>  	}
> +
> +out:
>  	va_end(ap);
>  
>  	return ret;
> 
> base-commit: 5d6919055dec134de3c40167a490f33c74c12581


