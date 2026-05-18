Return-Path: <linux-arm-msm+bounces-108089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDJOMCu0Cmpx5wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:39:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14722566CE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AD733039835
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 06:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801C63CAE9C;
	Mon, 18 May 2026 06:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/QupLAN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UpvtwWcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE60D3C4573
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779086193; cv=none; b=b1dGZ/FcFq/DlIGjkDH3yC+GNpmXeptGvGZDKOCr9OjTkK6SXt96tdj0iM+02oa04PY5vX409FaQBp9zN84Yp1FUmH0E4R8K98DR6bynYr1O2g2jFuzgCP5iZRv8ONq9JgjQfN2uZtznYVEZnt5gldPbawkzJY6hyUT7NkgmNL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779086193; c=relaxed/simple;
	bh=5RFO+Ssvg4JmPw/yA4u/nPzTGuYXVhi4EeKK7/9cMjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqfnxWQy2TJWbGwWguj94Z+6QmrTE2x4uep0Z3Hfwy2R+30k9yYIH13N1Nc61EP0QO0WPpwClScQgjhjzd/PcPvRG6IgCa5gaj/qKzZhurwk8L9cZkc7T4GRil+Xo68hEFSDVBnggfRFUWea9V/ZrPm0psG/GgpUDvrbANxOvE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/QupLAN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UpvtwWcp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HNo5gd707013
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OhWjBMRcsj+kQRn2s4H2mf5lmW3+OFeXfq83HZ0y7aE=; b=m/QupLAN2LODnD+C
	1P+6W3OdBFoGdhgeeDxf4ZtQ/rsutO1IA9kh5gKqeZ6nEZJH5eqe+RNl0HRrdeJ/
	V8bPW352grJGS9o/uz4btRY9KY6O+/w1bLUTVALAIyo8g3XwHY+FOfZzTlF9bj5X
	hKWA2uWixvvB1NEue6ZAdsa1LdINFuOS7RtGdwsdZ9U34ppEwyTjpPyIEdJvQ7ef
	ZS5U+RjDTKfrFimo+Mki1a3zlnSTCYcGCFJh6Uf3lOR2Z7POlYFkbSckkZTt4Ltf
	8zFrQkYUSmy+t6o/9e587Yl/NjYdS+gq79PlN+meOlpQjSw5H9YpjkF97fr6AbyK
	CHyL/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw505h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:36:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368b15eeb3bso4512535a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 23:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779086187; x=1779690987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhWjBMRcsj+kQRn2s4H2mf5lmW3+OFeXfq83HZ0y7aE=;
        b=UpvtwWcpxpxJjPBFrGQiimvEbpEorpBhuBTtICwPn7BlpA5WMsqiPiT3VeDbQ5eFQu
         S9eWmehC0niD/2QP9XPb/9XfmzR51PbPJcxLWleFQyOwoMaJ9nTLAjFRUZVvGQy/X8ch
         vMoYCTUoVNwYQfaZS5ub/6Y0ES5fiqSdmF7TWhOa6669mqdP1XyXtkQsDli83Xjn8hOf
         ES5QukaWtTJGY9Nggoc8bhFMGXRM1NX+kdBx/JSzrQBQywAGO/PHdPCXwxQ4xJsKtjsI
         mN6qvzLSpH+BMtW5vUhs9zQbJ7l1zMZJ+CfiOLkoXmjJbQ1VR9Fng+M3VKU1Vi+pzSci
         x7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779086187; x=1779690987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhWjBMRcsj+kQRn2s4H2mf5lmW3+OFeXfq83HZ0y7aE=;
        b=Ggkb1B4/zXM0JiQWnEuRgzGN9YdgO1hZOSxiIKhVd6sozlhKj/7vAm1fIGcQwn4uaD
         ZkLuIMUNDJeXSkFtPqkfnSS2JRqdAwtKlcm2k76BeiWaMT49fFwI6j5tcZr+01kK4QBk
         tQgEgYsYwyA355q6ZHEdw5qVAR8g9DpUu23VVgVqnguiUfpdHHICIyplRZNeBaz2fHw2
         v60J48JIqqEGSKuTZc9LLpO143G1fHaB9IPQm+V+l0uTpbBksq+PrctnAe0uXOcMdxCi
         aWpGsOiDByCUXuz+QII8PBVeFxMaA0k7YYlJk0JMC+u1Ezniec26bhPYarVcrx6NmX6f
         c86g==
X-Forwarded-Encrypted: i=1; AFNElJ90QUPcktjYS5cxH/d+bIlzo11GS6E0HxLY10TdbZhaI+VfMpFp37OYf/BsRcSkFC+fId2hjbqe1MQGiS+9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Nwpw0R9iA3BbDv/2H1q28Tch9Amzs63R15CJph8T4YDr3C9A
	j4m+90EMRLMS+cA/L7OFtetXHRbdJl1geg0iytEQl5OSpqhK5BD7ePj88AJwJP2oDPN495pF1Zo
	RD9Suzh+z/zv7OQm2MLfnc51vfow7wTgutVqw1o4nvPrkJnKvZ52GjZS7X8wiuQnZyFYFpD8zVp
	Q=
X-Gm-Gg: Acq92OE5VaNyCNcTddMFNaRbvnlOR+cZi/kPqdHWudXykVygzRFSZ8Qzc9h/QU+BHH/
	FBY4XyFCtNkBXdYhvk6L8rP4E9QhDqOdLjmhd3qVU+chSbLvMk0jUfVn+HUapAfEWDALgauP3bc
	yg3kjw5AgJKSwLmJwdgp2J6HbhH/nlb1N81cdPiHKADgMx9ay+BCoTY12DeFdyw86S+KqrcWAr0
	tkUvVjTg/bjJTfvItAtW2g5QBxDoDC37rmQRkXYdN0PCVBgD0W1Zb/rRxQfkSfygSrWfJ1gY3qZ
	MXIqnYhvmrtt1RsE+2VLGKhM1TaStPNnzVAZwkBStrCT8Rp+Lu3NT1Ex4vvwlans+XJLjqU6Ogx
	Iza9C4PvCvAp1nOXn8PXUyNNFcOtrz7GdDAOkbGRkmywqd0h4y64P311NEm3y8+HUyI7eqd5Rgz
	Kl93BabZmwYls+l/jfNGU=
X-Received: by 2002:a17:90b:4c51:b0:368:2074:b7a with SMTP id 98e67ed59e1d1-369519af671mr13714076a91.5.1779086186754;
        Sun, 17 May 2026 23:36:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4c51:b0:368:2074:b7a with SMTP id 98e67ed59e1d1-369519af671mr13714036a91.5.1779086186266;
        Sun, 17 May 2026 23:36:26 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951278e7fsm9708269a91.8.2026.05.17.23.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 23:36:25 -0700 (PDT)
Message-ID: <e626963b-7f20-43fd-b3e0-e16d9b6f13f8@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:36:20 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: qcomtee: add missing va_end in early return
 qcomtee_object_user_init()
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: jens.wiklander@linaro.org, sumit.garg@kernel.org,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org, me@brighamcampbell.com
References: <20260513091031.145826-1-robertusdchris@gmail.com>
 <8182784b-b6c2-4136-af8d-3aea4f5a4662@oss.qualcomm.com>
 <agat1sBHqkGWKzOD@soyboi>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <agat1sBHqkGWKzOD@soyboi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2MSBTYWx0ZWRfX8aclfXbNafm+
 RsFUL3mrls0rY9DzwMqUBvFzV1X10QpANv+TM7yuDoVE3uILemwQirB+smPoCVrDeAwqGUu3zfZ
 d0zrVHucUx8/FaLHzqu1EQC5htZifPTl8qdjqwgOR1+ruuVA/4X4QG9QzeMOluu5bNUkfBlZow7
 9NhhRpB/CUCjNj6ITVqcbP8KRTsdeTnvynP2Stz8XzMT7leQG7rWQpX2K01g6M0YyrmiudFeyyw
 /a4VAlBy1kB1KNfDQz6bPlTr0h2rpFlaZRf1VA+SzPpEf0alazr5yHj9U52aXHyagZuqs32ylPT
 U9e8qY3TpXihCbnyt7MxqQgqAygyYC+/V8GtOgQCa9AnJptbw6nlRN8fVT0jEUis1rzJR7KErxR
 qEpzFtqfizfJUU4XPtqor/GaKlYIr4ThTg4FS4uLwxYSBFRCLl4reind735+/7nubE9p/LhsRze
 usSgGZOvmApSCX+fk3g==
X-Proofpoint-GUID: 6cVzWHjfogtSoNw6nqrBrqJ2Am9v3cOF
X-Proofpoint-ORIG-GUID: 6cVzWHjfogtSoNw6nqrBrqJ2Am9v3cOF
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a0ab36c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=X36vB_roDklc4VALgUkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180061
X-Rspamd-Queue-Id: 14722566CE6
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
	TAGGED_FROM(0.00)[bounces-108089-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
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

On 5/15/2026 3:23 PM, Robertus Diawan Chris wrote:
> Hello Amir,
> 
> On Fri, May 15, 2026 at 11:31:50AM +1000, Amirreza Zarrabi wrote:
>> On 5/13/2026 7:10 PM, Robertus Diawan Chris wrote:
>>> qcomtee_object_user_init() is a variadic function and when the function
>>> return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
>>> case, there's no va_end to cleanup "ap" object initialized by va_start
>>> and that can cause undefined behavior. So make sure to use va_end before
>>> returning the error code when there's no dispatch callback.
>>>
>>> This is reported by Coverity Scan as "Missing varargs init or cleanup".
>>>
>>> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
>>> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
>>> ---
>>> I don't have the device, so I am not sure how to test this change.
>>> Thank you.
>>>
>>>  drivers/tee/qcomtee/core.c | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
>>> index b1cb50e434f0..901a31e8201f 100644
>>> --- a/drivers/tee/qcomtee/core.c
>>> +++ b/drivers/tee/qcomtee/core.c
>>> @@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
>>>  		break;
>>>  	case QCOMTEE_OBJECT_TYPE_CB:
>>>  		object->ops = ops;
>>> -		if (!object->ops->dispatch)
>>> -			return -EINVAL;
>>> +		if (!object->ops->dispatch) {
>>> +			ret = -EINVAL;
>>> +			goto out;
>>> +		}
>>>
>>>  		/* If failed, "no-name". */
>>>  		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
>>> @@ -320,6 +322,8 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
>>>  	default:
>>>  		ret = -EINVAL;
>>>  	}
>>> +
>>> +out:
>>>  	va_end(ap);
>>>
>>>  	return ret;
>>>
>>> base-commit: 5d6919055dec134de3c40167a490f33c74c12581
>>
>> Hi,
>>
>> Forgot to mention: how about using a break instead of a goto.
> 
> Oh right. In this case, using "break" statement is enough. I will send
> the v2 of the patch. Maybe something like this:
> 
> 	if (!object->ops->dispatch) {
> 		ret = -EINVAL;
> 		break;
> 	}
> 
> and then remove the "out" label.
> 
>> Then feel free to add Reviewed-by.
> 
> I want to confirm first, if I changed the patch using "break" statement,
> do I need to add "Reviewed-by" tag in the v2 of the patch or not? I am
> still not sure when to add "Reviewed-by" tag, like can we add
> "Reviewed-by" tag when we changed the patch?
> 

This is a small change. You can add the tag when sending your v2
as long as you include the change.

Best Regards,
Amir

> Thank you.
> 
> Best regards,
> Robertus Diawan Chris


