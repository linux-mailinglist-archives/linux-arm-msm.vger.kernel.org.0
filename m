Return-Path: <linux-arm-msm+bounces-113723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qB5mI0PHM2qkGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:24:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC2069F444
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:24:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KFDFZX8U;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TrqgGoFE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113723-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113723-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01C4E30160EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2013ED5C5;
	Thu, 18 Jun 2026 10:23:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FB03ED3B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:23:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778193; cv=none; b=mVbxbcmVDjb40NxOsHIw02F6Wqz4fMzX6xBe/owXlkYdWmW9XbQpD2/nijK4hN1O9bkXNm4FMyEM5F2l8qtyigUCQVRokzChA1ZAcEDIvhgWO8tyJlettHNqLkezyPeE+sFQ+DB5eGTKjPI+1y0SPqyelPgpVznVr7uJ76st7oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778193; c=relaxed/simple;
	bh=sSkoBFFbBJwMZdJuNpZSehyo3ZGfkPbFzpGCOcxAI6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKA5GABmIUffEgHEB0MdtrzZyv4kle/iYvAbvGsYZVDJgXtN47jeam++W32WuLev+Wdl/AqBUGlUUIpLzLF6nZ0UfN4l3dvJ/+DCHjHsu8Y3PoFfNGZGtMvcS2SNtkOM788VBmVw50RZtkoJQeQorQUhboWQCx8ERGpIm7kKOn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFDFZX8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrqgGoFE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8G2QE1253181
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4L9VLOUiqJO1r84H7xi4SOas+JNKnymuoCmp6YngeY=; b=KFDFZX8Uy8U8p9p1
	dLppmnE5XpRn+HIj4wkYZ8uaPYFi+4z2E7NQzf4LXbFCJRGIqrDP8Vt1Z8oSK5ZV
	H4Ziuw3hB1z/H/GErj/WKXYjvI88bJcDytwiHHfpOo7Rljn+92YWCgyqIxo12wIz
	3hDd3gcp9YBCOv5nsj3Ei4pzdtzcceGGtV/ShxxxCPZmsw9D1va5JU12fJplLGvV
	tUE48aQsrN4a2NJCm+S2L6ulp8bBLMwF64WHbHaXWGpmkH/U8a/qISYNpv28b/Fl
	3yUDPwpsvMrNWIsj3HirkLz4CCVZMHQ0oPcCcq1aD7ZONMc5TwcQA6q/XggDvnxG
	zOomCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7k71g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:23:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156dc90fdaso22383185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 03:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781778184; x=1782382984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4L9VLOUiqJO1r84H7xi4SOas+JNKnymuoCmp6YngeY=;
        b=TrqgGoFEkHMQfl9NSUbTAdeALjDyoKHXcI3JZyX7P1eImySX+QoU2T/UjSB5cCRset
         Sn0y8fHQY0WGRtpW9SsqCHfDFc9kcZq5JOn9hX68uxn5lgLaduf3QX4WOo55f8dJMly+
         YL21n1StOYLcfokezqVRi3WeXr/dgLLntGJtEqpMwdjBmuUMbbgOZrZPMlNG5cHPkkKo
         p2j7cDbTJyKiiJLg/CjEGZzuESkfkTiXE5R5v1RUyPr4jezzJr+Hcm1uE2uifHOCkqwz
         vTA6rMFTpCoBmSVfJyZqda/5rTNAJ418ooU+vZdmINruEE3OOdoqKiRgrDvh2d29Fw5L
         VrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778184; x=1782382984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4L9VLOUiqJO1r84H7xi4SOas+JNKnymuoCmp6YngeY=;
        b=gPsgxa0E5gsRrZdH1udEecw/22AFCOVZQiXqrOsaKJTMz1xfNguYi7EmQLhUplQy9r
         4RqnjD7aFA91YBNQczDBuoqG88dOtiJm5EGbnr8HGT4qZQQRC4y4xB1T0JxHEHa3yhsN
         ujeuABUUnkpET6ezhYJBKS9NkQoARAgzCjIBwK/2n4KU4dh5MgApZIHD+BAh+0dswy38
         oMW/Y2npU9h0v3trbXe4koWvbXYI/K6od2kLgHkhiltK6JQzGUaYAZYVkIMIw5CBBGCk
         7n0/Q8WoyG5wbSW8XVJpSSzSNYAae3OIVSUiDqlWetyMvj7if5JQ+8DD3qiI+RoDsl4B
         4RSQ==
X-Forwarded-Encrypted: i=1; AFNElJ88Txq+GkYiUM3eWqJLDUoGo8/j3I8kFsKQv1iCLzF8WtqS7yxItgAq6XxqBVq92+5RpgHESbV9wfljk5FB@vger.kernel.org
X-Gm-Message-State: AOJu0YwbOUVtVjJtCMJ/ct0P3aWyYlAgPijZ6LDGLOx8dP5mWNrabjey
	Ud8esk8exSputt3I0shTZolYN6bELFYi9CNxoLH68LXtpOYp5ziBpC561tvw7ubxYOg110qeGyt
	jT32uQDb9OFjsIR+jb9O1XE6wI+h6MU9y5qYo7ohqf3oM6D5AVHegVoEjndEmZN9NFzb/
X-Gm-Gg: Acq92OGDt+jQjUEpox9XPaDj5SL5UCzh6ML2XnUHlEHntUSqWINOci88wFJCCkv5EIs
	UHfyoiztzxl9ik9fpqYc3HlHbCBKG6vheAAzOdXSaLBzuAlkIGi5hzGUTtfez+/jkiatEdP2eF0
	Purxihv2z33je6wjjTeZyp3SrE8i650Aj7uf9a73GGeyhgPsk071uJd5uhGX6IB/l//LFUTvZF3
	oOgz0HXJ0Y66j53AJ6tnYAMkQVWqDfNGnPBD+64YqyqeJY85p3VL11h4UYg7bdXaUk94iqDrovi
	v1DHfZ/wTQDF6xfUXHgii6a6q3GPUsJrfUNNSCFwu1gPfq6LCCQnNf1KYXao6U3VQQ+IcWTwhuR
	R+DWENtSmVQ1cT5pmUheedhsUgaEDhV+rWnk=
X-Received: by 2002:a05:620a:2995:b0:915:f92e:9b with SMTP id af79cd13be357-91f27dcda5emr249706785a.1.1781778183892;
        Thu, 18 Jun 2026 03:23:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2995:b0:915:f92e:9b with SMTP id af79cd13be357-91f27dcda5emr249704485a.1.1781778183389;
        Thu, 18 Jun 2026 03:23:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb531896dsm919148666b.27.2026.06.18.03.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:23:02 -0700 (PDT)
Message-ID: <59e9c722-f58f-498f-833a-41eed573c23e@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 12:23:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: iris: rollback OPP vote on PM resume failure
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org
Cc: abhinav.kumar@linux.dev, stefan.schmidt@linaro.org, hverkuil@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260604051814.41738-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604051814.41738-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfX0Y4wgC0T5xoe
 q8Rf8gSCJoLTmBzOE4DzJxj/quTuvGgMJBQvzCWaf6Y44cHG9vD9kTL/xqC9bNq2vCoOs3NBK34
 qbs9vRfKwNFqKftrkMhqIlQKFi+uuVcXepaj7IbOzbf/3ZKq2bFCqYswrxM0/CsGawES2+yI1p5
 sA8cSvAJP65YkP9HP3+Vmuop7oRTPBPb4c62q/xBMr29nrDaWBTFvRN8htOIlm9XUYPstWDr97p
 fKq6kPuw4qk21gQ/5cMh7/CxycaHWpiKkQZenx2q8BRGYBy/LRKgaITk4jAiR9KQTmcRkK7aL4y
 7XyRCq366JsP1scsqZU+u1xzsGxhbfn5k0XvR5udkrYeWeQ2DSD0PXLFHfWrvOq9j4IiCJtFu9C
 XPOWUEN4SXRLFxSYvEuRbWU7MY6RruNRPRHD6M4ZewTBrcrjZyP0fYTrYM1gY0AplmXELW1M03a
 bj4+ev0AYj7eeSYX8rw==
X-Proofpoint-GUID: HE9x_SQPsORxphss-oJPSqPRpTaU47fg
X-Proofpoint-ORIG-GUID: HE9x_SQPsORxphss-oJPSqPRpTaU47fg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfX1spcMXdO5ncd
 vMhhUgN0xiTmE6tsBiPWpsDmo+4Z0uBvjo9hPJHBhHC93v6Sheogkc8pfFqN6rya9r/tAQhh576
 lgf3SkcnNtW9ZUyTu3fJBlzy7YEC3fo=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a33c708 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=3zvT7FoGJXuxinjMNUkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113723-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:abhinav.kumar@linux.dev,m:stefan.schmidt@linaro.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAC2069F444

On 6/4/26 7:18 AM, Hungyu Lin wrote:
> Rollback the maximum OPP vote when
> pm_runtime_resume_and_get() fails in
> iris_enable_power_domains().
> 
> This ensures the performance state vote is released when
> power domain enablement does not complete successfully.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_resources.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index f5e3341e1430..a7d25f7a201a 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -79,8 +79,10 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>  		return ret;
>  
>  	ret = pm_runtime_resume_and_get(pd_dev);
> -	if (ret)
> +	if (ret) {
> +		iris_opp_set_rate(core->dev, 0);
>  		return ret;
> +	}

opp_set_rate(0) would only drop the performance vote but keep the
clock ticking (without ensuring power). If the device's power state
remains disabled, the OPP vote will be kept disabled too. I don't
think we need it at all. The clock may possibly need to be disabled
instead. Or maybe not, if it's hw-controlled (which I'm not sure if
it is)

Konrad

