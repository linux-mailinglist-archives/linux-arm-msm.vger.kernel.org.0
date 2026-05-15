Return-Path: <linux-arm-msm+bounces-107695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKBlFvF2BmoUkAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 03:29:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF35B548685
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 03:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06FA43003EA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 01:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA89368291;
	Fri, 15 May 2026 01:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j56L0qm8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYCSRJgI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4983385BE
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808222; cv=none; b=tFzydiI7q4GlQoK1+sUpkQ0OF9b5VbBlMXzWmZhvmy+upseGOOBO40SdBE/J2kgrp9CCM//cccIujwlYC9KYyFGeUm8SZnwgMSbN4HubKEkH86ZIpW4ofNXYs3FN5A3MSN/fNPfoMWoi+L5tVS38RGX8pBXc/1GfyKAQXu0Q4D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808222; c=relaxed/simple;
	bh=xCFPu1zNnERScuds1BA/xDI7JtrElF8fFYPNfBb474E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iOdMEMnw3v2u5iTojB3Ux3O9rpvwqok6W87IyH23WBDtlQcBcP7Qfrj/16hjviNIGP7N7KW1N3cdS7B0UDEA+fGrNbTJPQQGHp81jWbMfIjHSdzPyN7Z6B854zWT8FliJ+6Xm1tD+tNrdSOxhFC0y6GN0ial0jCfhR2kMLxS9Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j56L0qm8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYCSRJgI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpUbK3795589
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbRyF0yHF8n8xfJ6kWgsPZHepfaFdKar74Yr2tZG1yo=; b=j56L0qm8BMNVIf3Y
	gj0eN+2W9sAi7aK1lwSHVZyd6JP5ByEv6z5prnc56YDYmj8uOOEsaDXUES5YKYE8
	pg9wboQvYOSh0cqXAKGDP+AarJmDlnFzzM0RTVCtPEHdRrR7s1QmF+NvEYkx+/AV
	PIw8RUu24tQ+5msdyGrCVdfW38BhgcDo0OQIOQcyWvLjwvGbTHT+ENVW4kBM71wI
	akHsAWXi3Fw5niBoyqy0VX1/t48HK8j4xr9DlYMjWaK5VKSRWh0/3Pd3Vo+0Rnon
	sk6sy/+JdgOtVwfwQA3uH3V8CguBN3rBDWbSz15venb0a4S8gpn7k7C0qLCDC8i8
	N1tPvg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1sryxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:23:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so402841b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 18:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778808219; x=1779413019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GbRyF0yHF8n8xfJ6kWgsPZHepfaFdKar74Yr2tZG1yo=;
        b=CYCSRJgIirgVy3f/xXnvXjBlLkT2vtxu2Pk40oFP0RYFE0NMggqbJu+jnez7Di+l+e
         Viz8G21Mr8VJcF3a/JsoCWShgBRVjBjlGc8sAGFff3ajlqgOk9RqXpiXbaSWwauTdJhG
         GIdQrXXtzeShPlLqGKfLAJWQP0rNPqMgoyCxcih0cbJJf2F9OqAIHk1C5wczDxgeyhJc
         mwgKwuuTge4mUgL0vmwj9wqEMLpEPsWUw8LDvCiKN8Q/2Sru1ofm/VLSphgFMUGYFFwd
         Tl9lMxtKIztY6F6taS3Zn1SwCuZfVHALZpkHyDE9dJePKbmp5STGH4//QTRgaCoQPuJV
         caOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778808219; x=1779413019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbRyF0yHF8n8xfJ6kWgsPZHepfaFdKar74Yr2tZG1yo=;
        b=YwsmBvp/HXJ2kUkXz3N46bsWJrPJx5ZqlZnzRWHq+A9YJ97+hw1R4rwzREnE6BBQVh
         sLfQPYuWstYp34lPa49/f50t1Bpeq1bFapyejiwtw9h91MA9IC2wYy17oNWkEHdg0BLY
         2M+Hv7U6Z2ZpAphkc3tadCT/GUvQICzsxcu3fTQKIuI8jtgjah+kO7muCmwepWLjdPst
         hIQbzDyFt7MniO7twCEpxga0a0ohQK6FFvGfOfAtbP9fCvigR6ozTnLzgN+SQHh/AHhY
         IXqrahNrAE3cZT9HwLmOyGNSHNQRyiuMUq9EpSmfTHuE3xyE0BAysAMHkhyNh+qmWrob
         mOtA==
X-Gm-Message-State: AOJu0YxoiQRlua9hr/nVVuaTusHZjMo9Yz6pWxSpIf/CSjzCjLFrCwxq
	lhDBhEViN1nLmVbe+8lJjK6zsWjnzKlMmzqrRdfZYiEk0jgrx7gPhUo9x6bXPsS1SsjbGy40dPK
	vi+oIQHxZ0TL1+M/So3gxGQEbiNgEpi8+ANFOXAkzloEDclFWZbZ3itDnIUM+MxMODSE=
X-Gm-Gg: Acq92OESNNU0PwpZshvWVvhEDUZf1OtI1hAdAte/f+yt5l89ZsirWvj6soja2F3Zrbc
	rWH0OtV/87hXo1/VIrC0Tm7cCO5ViHDyr4AB1QM4bG13wr5zCEYYuHnA8wsxlEssFGE6a10JYFw
	+RfNvy8fleA40sNILEm7N4DXckyvqnxqiffzrGtAt74xXIxJXybc+bUP4+0mPJ7RO424khJyyMv
	POdoCxp/B82ICQuCyarBPe7dqqMTMW2goKt/lOK/yP3yCpMvE5M5uOwIh7aQSGKknHCtCoPq//A
	uDvBZfff3cQiQFFLyJmtZPA9Sho0EFVz/AHu7kmh1OdMJsqxz6RzfENWjXDBuA+1+QPv2515usQ
	wh5Yp3RS9tKQWkoI78mcYsvVy0CdtOrkT3SMPeoY7F1fHpYUjG11bYwqNg2Z5PugWewUP2dnBh7
	bjDGGOo0C3vnxreXvfUxQ=
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr5239996b3a.16.1778808219194;
        Thu, 14 May 2026 18:23:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr5239976b3a.16.1778808218670;
        Thu, 14 May 2026 18:23:38 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19663ff8sm4062970b3a.8.2026.05.14.18.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 18:23:38 -0700 (PDT)
Message-ID: <6f67ffe9-41ca-4102-99be-440356ba672a@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:23:32 +1000
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAxMSBTYWx0ZWRfX0BCm0uFKTNXp
 6owGHpUo8ziIFW3GJkBCbtPNbz7u33fZmvRKHhaxpOCwGz4CDAoDFZoO49PhOkrMPWlm1l0QCDo
 DbPfM8/gHqsKCVH7UrxIvl80Y5XeqBpn5tKfzC4URjlIbnlzgjkaJq74HBFwLXAtekNaPn/UygR
 0ZS3ypBFMfWIQcfH/uMONodSTZNWWVzmi9f0XX5I0U79eJ36pd3QWeP3P+6n1fckGKsASC4W9d+
 B90jH9zWtR+Uy534egINsAb8BwaQGYJ3E/HNjqqDzXNnrthyvM9CBQ8ypxjcmZSo2CP2ZCL6wkn
 yGI3lkwOI6gTSCgDpNh28nxdpuMijtX+qeEbalvWAVRXk4mpGr2ctXWLx/jxYCLkrA4tcbW/0HU
 6Z7bRtrr5GnGdRhSmPhFojeObNFhs1/3vhHqlKqdcVlleTAPWujuYg6dYC1dyTXjEAEmPbHn3R9
 9Vgmy0QGomDPfKQVj0g==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06759c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2fb_BHWLsD0z38efADMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: oUzcQBADpqIT6t42CI9IYfSHTaTZE_tt
X-Proofpoint-ORIG-GUID: oUzcQBADpqIT6t42CI9IYfSHTaTZE_tt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150011
X-Rspamd-Queue-Id: AF35B548685
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
	TAGGED_FROM(0.00)[bounces-107695-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Thanks.
Amir


