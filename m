Return-Path: <linux-arm-msm+bounces-97965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMwBIaAKuGkWYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:50:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C7729ABE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A181630041C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB6B393DCB;
	Mon, 16 Mar 2026 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAqSr9KL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMG5Wlyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB5E2D7D27
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669022; cv=none; b=oNlJTb4KdqUKl0zTgLwvJQ4M+d7/mXqYXX42UnTfcG5KBEyA4Q6aBvehwOCmn5+f0zA7TikVooim4P8MVAShiAx6Z2LpzmcJA/5ce32aq3FmsnbLZqchMT72IxgosgCxVhhz6tCGqIlXW+QG3WTkhdYq9JLtFhEyaAKDYhFphK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669022; c=relaxed/simple;
	bh=YD94EvCpPG2eq8uDf2SS8FdQPIaR4Uiz9n2gqkCJlVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOaYE0EFe23OIZWBDDUPHMqX7gz0np5luhu2oJLKnDIdmMhHV48fAdrbYvO5oExeTi1fPxxVfSDjf7P/deuiw+xjKIGpU/7UlJAqcEHVVdDcm9HG+bL+eryPdoKhyCuljtNOmAsK/p7y0MMf8yeoBkaH0Rw3U7m2NlFCK9eGu9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAqSr9KL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMG5Wlyx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBhsoS323839
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IT+TYjjfVWdlPgCtwind5gio
	QLytQt0ar7UUb+shxsE=; b=SAqSr9KLwsz+k5TuQC0EK3zYCn5Q1eFEi5Ax89J7
	CGwdWI+14oCYp9id6DR11UJXoTCopFVGkdxyql7t6rBRQnfyivHOEQrEPuoimYfb
	2vKrSL2RE37ObqPDblaAdft9wbN4bmc/EkdjtwfTPku4K4NFGJwDWY4fHqDORP9A
	4lnSZhZvMO2bH3VskEf2WaD53bH5XI756lxGKD6lGVIy7Ks18eBasUi6zr04qNkm
	JwqzNXM1JNdONLKmkQfauRw83HvlW2AGM68B4r161epJHEyZ4K+ErTsQxE74dri7
	3OPe/QOmLAk1osPg+3Vx36L/aohr3eBCsm8T17tizpxHRg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qp4w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:50:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd781c0d90so3243704185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773669020; x=1774273820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IT+TYjjfVWdlPgCtwind5gioQLytQt0ar7UUb+shxsE=;
        b=MMG5WlyxBILis2cAwsBFc+VkC5k30Ej0WN49SJJmRUWV+dZuTWGnSEa+rJcj8LpR28
         0FaF8TsoYQeJu8Ad8+hua24f0g3t7fG4RwIGiRLRYoo3bWzVJgwJgMAyeL/cbQN7Wb0z
         PReEDogG8X1OqxPJTWUMvealtzvnPpyxVbryLCUZ7D3R+URXsem3cQCpg3RvII3+pjDI
         kR0rk251hpCwvUZ87ws3aAlwdJ49ImFeFQnGIymVvBW8tBWoAjB1uAW9XVggKemTPTZ3
         Yps7UMTvATyLzL+r7whqdny5C56AduXeAMLLT7sQpYUk3Dkd7xviUkRrO/vV8ybvA6wt
         yiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669020; x=1774273820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IT+TYjjfVWdlPgCtwind5gioQLytQt0ar7UUb+shxsE=;
        b=IYhVYtzsOfyo2zDoxGyS0CuNWKp8zDN6bEdOWgSk8Ys0x8n6SgTH0nQzad2dTqoSuB
         yDHq2vYI45AvlOIROm5JbMnXsMowwRgCFbNsKf0EwLtNAC1OOcCkmNzU7RbXN7QRf5AD
         Cfy+9Ht5fg0Wf79J3dT4yAM5rMe4whrVBfxB+p0iDCLXhwp7zfj3q/3Qlr4ezO1Davr0
         1CClAIJMYuzu3wVZ9mv68rdlBfh8s0Z6qPUMs8O8pJPn6jI6PVsaW4My+jS2Aj/srkiB
         OuYdl8Wf/ukWL2HCm1GoQxokI6Nuf9DNSFlUKPT1i293VQzqIZHBptCFrswz5f5XJXnz
         Rv2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeTB2dG/Qtln/YX1mjbCwaGJtBMEXmKLJLfpGR1OftkdpHf0Z9DKZvX7yDJNl7e7zOOW+rV/AkvbKRZrnF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkrq+K0GgmwmayE7L91DqjvQOe3w8ctTBn1+9rDLwNGzy25rXn
	xb3kGRIxGuV4rf7YjCH90KRcLtNtWNGIqVinFjH7wWxJxCFhnOgjQU9ZX/Fz+ihWtGuGB0izRed
	5ToTIJiI9D0Vja49JSrIeM9P2Z1sJul/aJjGPJwFQ5OQ2eU1WIVSLcb6Tx/O/EsWHAN8w
X-Gm-Gg: ATEYQzyd1O9orT7j1NAd01j/l9P2MF5eczXBp1XGTIX10w8CXpE6ko2VidbF9U+q22c
	XqgIKx2PX98r90RNHiqCbo/f3N3eqEC9V5+wqJ2xDK7zWOW4Ndd41beteVvUolgy38/thqTKjeI
	1Bp9BT7u+gY5iZWxnqEdBw+f8FgoGdIMBDPRSJckC8RlELcwA8NK7uSUHSec8axyg/mWyJE0KJA
	C11g3PMwz4Jm+sheIk0aG4/XaFHR5EYa3HyJt3XL43NDSegloon7uc6t0K9wKdmX7C/D1tkrOxr
	oJAqVyUVvPgFxHkd4CLf74j1k0VD+7dfie+exU82o36GbdCMtJgci5fAzGTQhAnUaWJyjyh+Pk3
	A75ccgRfmzU7pFWqLRCrkjA19C/nCU7zOgjfYB8XvjyhcPYmWRjZ6vslhyToIF/J2/iYsFKPT/3
	seb/dbf7gwn8jJ9apqACXNQ86RNt5mw2ciNh0=
X-Received: by 2002:a05:620a:4056:b0:8cd:7cea:aea0 with SMTP id af79cd13be357-8cdaa895609mr2091275185a.39.1773669019613;
        Mon, 16 Mar 2026 06:50:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4056:b0:8cd:7cea:aea0 with SMTP id af79cd13be357-8cdaa895609mr2091270685a.39.1773669019128;
        Mon, 16 Mar 2026 06:50:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33e51sm3381010e87.14.2026.03.16.06.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:50:18 -0700 (PDT)
Date: Mon, 16 Mar 2026 15:50:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Cc: viresh.kumar@linaro.org, rafael@kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Add QCS8300 to cpufreq-dt-platdev blocklist
Message-ID: <uf4rqdqgj6ll54didnyajtsruyex4ghubgrd4sc3qio7vtumef@yfxedf6zj4rf>
References: <20260316103752.289324-1-faruque.ansari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316103752.289324-1-faruque.ansari@oss.qualcomm.com>
X-Proofpoint-GUID: 7EWMym_0p8qQgNT26ezG3tK1oKTVN6AM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwNCBTYWx0ZWRfXzaJBD0uFCA1N
 kmn0QtxwywT9NzN5ox/lmcOEFV74lVzQSIGwNTsi2qKzNxhvN41NZC1MiDDshM2caOvX0SOlTo/
 0o3Tn2Ue8vxdOpH0t96yAnI336p7OENfJHnEAvTSsAAm5kvNJ6BjEyHxKKo8rdulhY19MzOTCqD
 FLPn5QJ201rgD58A97HFPAZYOL0o1xC+S1nrQXYb9mfMxmIGwO7NivWQijjv90gzx3wSUoptveS
 KzCyywd9Q2X81Utxdjbp2nF7uxPnX76RzkvRa4COFWiilO7+1QIHbXwOfqZJcn8mwcjaWXHVNYH
 s87KSNvDS8H3yePEdBugQIaEjFp1wNrhLrZJ7F2TB0wz6mr+fdsND0RMydZgJkcxWbgjQl+0avf
 KeATXQTtD+WbmJYz15l0NtzV02A8w52ZkQtbMFk6Rrf25AkyqoQbv69lvEIUNJH0ktEiXZg3BOt
 3xwZSGG7xYRDtb9q3EQ==
X-Proofpoint-ORIG-GUID: 7EWMym_0p8qQgNT26ezG3tK1oKTVN6AM
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b80a9c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=UzGNXosDaVyU3g9DD2AA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160104
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97965-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36C7729ABE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:07:52PM +0530, Faruque Ansari wrote:
> The Qualcomm QCS8300 platform uses the qcom-cpufreq-hw
> driver, so add it to the cpufreq-dt-platdev driver's blocklist.
> 
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

