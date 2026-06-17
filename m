Return-Path: <linux-arm-msm+bounces-113624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cXIVB6CLMmpD1wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:57:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C276995BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:57:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pR76cSDz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jgl+uKIr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113624-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113624-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02F7C31FE2F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9483EF642;
	Wed, 17 Jun 2026 11:47:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFB83EF0A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:47:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696823; cv=none; b=VQQbcNqtt4+AYV3qFZy8ajzkHmSb3oMzF/NuieXkPRbPQfRwJbHTF54OkHKxS2KXZ2GJQAGLQ1qlje1hyQEb1hZY3FPMAoGZLsOmecj0OsFSkfKM7wqWO12+8DfKbch/RzfIL0YOWGdD7lE3gPGGiaJg5XWixOWLUSykiNMBe8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696823; c=relaxed/simple;
	bh=mkFLfnS/2FDmTBVL9hz5P8Hk3KlqN9gtvDdDbrIzECg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ThXwhGvv/2PJFrljCqjsE+L7HsuUs3ys8iL9XCo6W7kuB86fJDlJlOROaM/nhNxrvmNUQhF7Rk+P96tBdYIabsJfy4ymXs2TKUKSGmUs1x+jWtatHKgiAeJGiPsSnLSVblynJShRZ8bkO8PTvxzZRLESk62lq6GvGfqdo7yx4GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pR76cSDz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jgl+uKIr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UXLv2217643
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nrhjT/VonZlPSYP2Cy5dXBtmUz3w1kLQ+hxFoxWx5YI=; b=pR76cSDzyn9FqfoF
	lVoFRWTTdObzTiW7ZwphnbQwuoXXqRF0WF8oKqfxdVfiv/gMEhancDeRE5OlSwku
	jpxFFWbeRJrP4a4SnV221cwNf9scZauvL3jN4TsR9m8lVMeoeVSAy4bcmATLrZPW
	ihV2Jd+yDGTeaEYgszSuy+lde5anjIYSf2Q2F5Ymolra6O1J2KkkRXBZzLjSPbU2
	kbw1Vry5ZID6bCIF9gbB+tEykCJ7NSkr7kup7Q3QgVyiToua8sl3XfAfhPoLR6oW
	K4otNQXLNVR6j8Ae1svRKgXLqX4dL+ByoWjwtGLdfzLmQiyEdu4rPiyXMm8zDmdw
	8I8d0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueerayf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:47:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915732517cdso26323685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781696820; x=1782301620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nrhjT/VonZlPSYP2Cy5dXBtmUz3w1kLQ+hxFoxWx5YI=;
        b=Jgl+uKIre5A7GkPkqL6oOSOeD7zkcrAlAjo8PcAFvxn17RweN7YC97ocT7jWgrq6hW
         bmuoBvZiJzGVevz4E+L8iMUR7SHXwS58DMxvcRbScdPHmU4al6DEp1GrA7Vf5vOzCxyt
         bTrJByTBAm4r6b5AUT+YWlkxdlcJF1hoso/PYsId/ZzdS1ZZh+4qwKhP7EHrdfkoXZV2
         cgPiLJFRKAAqTGct+LqytY290/97/JXhTs7FFIVq/K+TAvhAsD2R+DL9kJjISkFtyWAq
         7JDNuwXQgcbugjMSEWPi0ZoxFuripCFXfTvot+HoDfUlGFWyZn8U4CnlTqU7WLOtBcw6
         VC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696820; x=1782301620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrhjT/VonZlPSYP2Cy5dXBtmUz3w1kLQ+hxFoxWx5YI=;
        b=C6Km9MjJIcWXs504qBICTe18CJwRg6unlSfCY2y4X1VEIZSObURv/BvEhy/Bh5k6gp
         rL5795Jk+R69DXp8FsO8Gc+D9PCbiGgV3vF8oQMt5eXsjXD2qy+Vmsu286SXVBdzjyXS
         NGWNEiA6lKVQ6nCsPL9kofTgR8lWD2U3IPiFi9mwyh6Kj2p9V3y/LWK18sOPp50iaPGV
         QMw9nDwmxTXt9oz1yUunmkkgiL77R9s90Yb5eaVSkDS9J+L07Lh/cKWhv/YiW3MVGmeV
         +Xaq67ftF03QjFjzpR9OEO4YoljYHVyzxN6xap6k9MEjxNZ2QPHVCPz2gw5hN9eMvULn
         mEyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9VS+8V+z/9DJzN7WEQOxfHbR0PM8vnSLnnH2qt7GUqVhLakjQaRG1hAy/TR+P9gTs8WlWQ/3cj3iy7yluC@vger.kernel.org
X-Gm-Message-State: AOJu0YxdpJhDVMdfSfQNjWpDzAl+Z2pv2iR6pxFCzX1eaawwZetBrpsY
	KyWPl3/iy3+iySNMx+1HKvgKw0i4ZLlUmiGPod4kMIK3eOSXGdhvgUhf8CUDgZDKi19MHCQIHOk
	LYk6AkLxKIxfUo68kfnsHU6+4amiy/Mh3FXuEMSsnR1st3PvfQNQIEQbeHpnWM7Hzgdz9
X-Gm-Gg: Acq92OG+3a6lhTHszF03i5uq0uc0TckMMDnGHBOtIDJIClKVULgLTtLtk5OXotTgOBW
	6x0WE4eTk89uxWzngfzxB5Ig5ptUxLDKJwSr/B+UL8k4WuS2kvru7GQ8WoOGO2Lnh9olD/BUKIh
	n3/+Dnd1hvHE5IeSz0vMc+Mdc63SBktvl88lOPkF1cnQ4oS+XgWBW43ioR2bu8GtZtHe/WfjZV1
	s2cQgHSIC4ihHuqtDoAOPH8J7fmNbQ78SW7jrYE7rn3J6CrhIdmBLp1ub5WaV+50s5xUuS2Eq9Y
	9oy6X75JLb708R9LqS/VwJZKB9VuoJpKaK47vYZEcQ55nz6hIIHPtMsFVgv/GPOjCEkARltKFRw
	laxuJwruAH5JzHQb7AWmTrAxCHx0jEypAVfQ=
X-Received: by 2002:a05:620a:1727:b0:915:6433:2599 with SMTP id af79cd13be357-91db94877e5mr291909185a.1.1781696820274;
        Wed, 17 Jun 2026 04:47:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:915:6433:2599 with SMTP id af79cd13be357-91db94877e5mr291906085a.1.1781696819694;
        Wed, 17 Jun 2026 04:46:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb51007a9sm771684866b.21.2026.06.17.04.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:46:58 -0700 (PDT)
Message-ID: <b769697d-3fbe-4afc-bcc4-557e80f94f9d@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:46:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: unwind notifiers on populate failure
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616005618.9328-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616005618.9328-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMSBTYWx0ZWRfXxTKguk7IS0Bd
 uQ+rXM5+WyfPkjoVvBIUoMlYfuq6Jt2yiV9VtTXM6lehinWa7zqs0pHkranifxnbB+IqFNmtTsr
 srXxaYlZGRDoBIj04iON5qzwd/wJLp0=
X-Proofpoint-GUID: IUlAneeC9IlP9kRZ_q8LY5XNcpdVAzts
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a328934 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=K7GB3kXSwgtqqrUBk-sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMSBTYWx0ZWRfX6dX66Wkb2qq1
 VSTqwxtaUvT1OJP7aRfXGMzGM1BVg6XQcKC1Rho12KiwXXvcgHofAUHCM3KTWNaeZJ39+v0tdYT
 8+0wnCzmWyn0lce+FCBHSKm2kFRiTbqX5qTDpJbEGxlUBKapsmC5yeIaqxqASGficJJIrSRqCgX
 HjqlZAekwxYpEKVVzYwPbQlHGLPfAVXk6ae5PhnCcPz+bZy0CjSUpZfIdLAn/uRABKhyinpQ0wp
 FQXy/VjV6qVjF5hj8roZb8EBP0lnCopw2WJi4LVcnJ7NWwreoZP46+tbbJj30K7BvnarNR/UHuh
 1PrwqzmEl6hLSFpGnwoCfTy17fJIXoyJriehMrw1u4iXbyRxvCmDXOzlKRpnAoeGYbmFRzNLu1A
 DPQ97e8ttjzoNgY+9u52kluZ2L+N+YtJxYhqst3Lu1irvw94Y4+UW2Yh94TJO0SYzkV6rIMeVqP
 JnGifY4XRqX1S7HGIaA==
X-Proofpoint-ORIG-GUID: IUlAneeC9IlP9kRZ_q8LY5XNcpdVAzts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113624-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iscas.ac.cn:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69C276995BD

On 6/16/26 2:56 AM, Pengpeng Hou wrote:
> rpmh_rsc_probe() registers either a genpd notifier or a CPU PM notifier
> before populating child devices.  The genpd path is unwound if child
> population fails, but the CPU PM notifier registration return value is
> ignored and the notifier remains registered on the same failure path.
> 
> Check the CPU PM notifier registration result and unregister it if child
> population fails.  Also depopulate any children that were created before
> devm_of_platform_populate() returned an error, because the devres cleanup
> action is only installed after successful population.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index c6f7d5c9c493..a75ff97423e8 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -1033,6 +1033,7 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>  	struct device_node *dn = pdev->dev.of_node;
>  	struct rsc_drv *drv;
>  	char drv_id[10] = {0};
> +	bool cpu_pm_registered = false;
>  	int ret, irq;
>  	u32 solver_config;
>  	u32 rsc_id;
> @@ -1107,7 +1108,10 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>  				return ret;
>  		} else {
>  			drv->rsc_pm.notifier_call = rpmh_rsc_cpu_pm_callback;
> -			cpu_pm_register_notifier(&drv->rsc_pm);
> +			ret = cpu_pm_register_notifier(&drv->rsc_pm);
> +			if (ret)
> +				return ret;
> +			cpu_pm_registered = true;
>  		}
>  	}
>  
> @@ -1123,9 +1127,14 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>  	drv->dev = &pdev->dev;
>  
>  	ret = devm_of_platform_populate(&pdev->dev);
> -	if (ret && pdev->dev.pm_domain) {
> -		dev_pm_genpd_remove_notifier(&pdev->dev);
> -		pm_runtime_disable(&pdev->dev);
> +	if (ret) {
> +		of_platform_depopulate(&pdev->dev);

devm_ functions clean up after themselves already

> +		if (pdev->dev.pm_domain) {
> +			dev_pm_genpd_remove_notifier(&pdev->dev);
> +			pm_runtime_disable(&pdev->dev);

We can probably likewise turn pm_runtime_enable() into devm_pm_runtime_enable()

> +		} else if (cpu_pm_registered) {
> +			cpu_pm_unregister_notifier(&drv->rsc_pm);
> +		}

This is a valid change, deserving a Fixes tag, see:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

Konrad

