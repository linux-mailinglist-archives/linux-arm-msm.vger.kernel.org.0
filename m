Return-Path: <linux-arm-msm+bounces-117475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eeorB+7gTWoA/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:32:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE2C721D21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 07:32:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CpvlSJgy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NIT8t8Sc;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117475-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117475-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61A783013025
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 05:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7083BBFB0;
	Wed,  8 Jul 2026 05:32:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A9F3BB689
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 05:32:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488741; cv=none; b=rm2V5GxCpDWRejt08kBmw9YeTRbHea3Pqi8jSSxa41rJggCqkvZMmLbC4rGOj2T6J1KI4S4WwJ1YURkjwUlZucJqzQEPZsjjF42U6HnJo1eDYixSfmjGL8WRB8feSzXeh7jfIhyPLoQTT4a54DiAMvt0o20g7wJWfabDNGwPtig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488741; c=relaxed/simple;
	bh=CfGwp4sRltWJnhxId3QetivNUX7yJL8o70vbQVYKWVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UafrRhxBWV5DjSRUzIR/xxEvPw1ap/pVzcBZc49PKCs4L6m7FM+eV1dfdui62Ovh1aAmPa9OYmRvqxDog8uUAoYdERl2HdKnjV6hB0SbPtyXBym6p3zjPfdkFiPQcx0pfHOVOCA0RWpKYP6PHr38pwCgWLHA9SvrJCT7l4pkrls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpvlSJgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIT8t8Sc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842ZYT1667866
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 05:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1dcvQOjzdEFeDS9jSCqL2FDg3lGBLE0ADMTjQl3vc8=; b=CpvlSJgyUzLu+y5p
	YjUhl5ozRvtVrp+FN+A82xm6xR+QGQrKhGPJkNaWpnd9Ix9Bg6M/WwB1k3hMa2rZ
	HUnXBN8LdF92JS6IHSWgsyZMh7LH3e3hIUo9Gsu8LZR1PSI+TqghsAMu9lYMf7Zq
	WdnLwd6wSMZRuX974/hNC2s6N6hqaXEGA5LHSgrDN2S2JSjwXgVsvlqfB8YssZsG
	LWbR3vPzsFIreINdnVCk4LPTF3FYbMPv7woZ8FFyPUBdfunpyFnhHbWOq4bOI9pB
	tldyCECUONNVpAH3INkZF4IPOD5lyUpj47cTE6vMPyruPfJQQzXtQz7fsTfXlmBU
	gtysMg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5tt5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:32:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c33f48ee4so3254671cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488738; x=1784093538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1dcvQOjzdEFeDS9jSCqL2FDg3lGBLE0ADMTjQl3vc8=;
        b=NIT8t8ScRNATnzpHQUbCmFOmkiau5lcaQggnKZDTV5ZZ/WbOryYmB44/4jOtwniRjd
         19uRwm6kqx4ZS3SVEHrPygTgnaLlNzmxWdReSxaMfURMejJn6pHt7DvB4hqbBtncfuAq
         fYQW6dXkiApOTptMZLu7cDGqSz2V7nda4DRIjgpni6p06dtWdCBi3SuTNbOL0TJSFBZG
         xFQMD1hyhG6viGGtPm2uo3CbhexbeZWlKwUk/lC10Da6/INu758dsUUJj+O8StSiVkJh
         uzJjmiXkD9GMqmyDMrMj1ae7972ZJSSPwuWDEclcuqDxAQpFlkdCE+WnRd9mxwLcMfRc
         r/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488738; x=1784093538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1dcvQOjzdEFeDS9jSCqL2FDg3lGBLE0ADMTjQl3vc8=;
        b=sEMLaMcFSeYpmuAXOykpAslWWwDwD0gi7AHCvGLp1mKRiXvcDLiQE/HlIRI2XsWB2y
         fHiuOiU1+jnqqAL0+QxoI8kpZi5hJWtYeROcIUDGejzCcbPv6Z2I0uNLiiTfXB+1Ba2p
         Mooc985+TNSmAhtmHCXk2ms7mHNT1S/jUoWckmFlJl159bF4/kuERYvex7/fc1QVehYw
         APNb1u6Dmp9tnGu0Y67mFkfa4MSNZKzADVpmGgKHzwyP5yTisYgCPByA4FwT16aoXpfu
         7vzPMQV42Gqc4ROr2GTwB2SAaY1Aa+iDBqME4y/t2+k0oLHDpa44ca0yRUpvMhgKSOLS
         6sDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpE91h3NaDfuZrlMfCmRoyCDD3xFeOlOkxyk52oGvWPQVVEcGthkhGPb2XH87kY3Is3qj/IxRlc5vLeJQrf@vger.kernel.org
X-Gm-Message-State: AOJu0YzSb8266Wg4TCQg3PlIZG6bcU7q21Cgr1nnO3tO5Cy9ifsaHy7r
	X7NSImj/UQohh081cCKQBlPM8muFyZdwAzrgxWN/jqFeBrNv8KpkjWTbSn5ijHezfwTIEgmlsxc
	kcdf4C0PpDQ3fQixwHDc9SidOPXv3LQbDNHikkHEY656Ml8uNrnD9B2O38Ubs+i3VcC0b
X-Gm-Gg: AfdE7clHjK7sz2RYuPGI8Asi3MWN8kMknf/rTlndtpo/AQb8tu/vzBOCrlGlnTB+cQM
	NzQ3mSmWPyVQHS9oQc7jEScnjEUk6P7by8NIX8KUO8R2NQfg/jGzXG4jY43Ggx69E3OG5LcIh6C
	gYJs2K357PZZbV76/P9C2o2mvm3DOzAkAzp03K8QcvC+d4k+mSflT/30JaUeAJa8lz9lGA0Ise7
	Lu8Gm37mjFN9bd5K/BtA4UhvbGpS1YhpIn7d4AXY1vJnMV/HzdjSdalW3POvvDS4AgGTCuijJm0
	flx/w26qQ5n1atqfy2qwGTYVdTrTvhHHNn35I1Q3m4JTgO3I0nNQLD8DlXWD+dJFf0WmliG1C1X
	3e8ZN8HTex6Nj6ElL24ik2QhSaO+043UfYpqr18s4qkbFPA==
X-Received: by 2002:a05:622a:588:b0:51c:7b12:5ffe with SMTP id d75a77b69052e-51c8b5767ecmr10578451cf.74.1783488738430;
        Tue, 07 Jul 2026 22:32:18 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:51c:7b12:5ffe with SMTP id d75a77b69052e-51c8b5767ecmr10578181cf.74.1783488738002;
        Tue, 07 Jul 2026 22:32:18 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.252.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd88aesm6799785a12.3.2026.07.07.22.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 22:32:15 -0700 (PDT)
Message-ID: <b9be4ed8-a012-42f8-9241-69d4e57ab0e0@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 11:02:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/18] media: iris: drop IRIS_FMT_foo enumeration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
 <20260708-iris-ar50lt-v6-3-374f0a46c23b@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-3-374f0a46c23b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rd3Gcw1idsXcvKN9eNTGJX8MNUybvYJ5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX5oq/1gg8I0+1
 iKKRYYII/U8lJP5srlpaQ/Tb7fS9eDm5iuCZ+vD3K9enheEKNeMqlPKK1XcSh9D9GLBLCHOqJJp
 gUvmTk1UhgDpoMfBwE+Ne0RbIqLP840=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4de0e3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=bHmrfCP7B8u675IrmFjzDQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rxka54P1vYUHB5Al0hYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Rd3Gcw1idsXcvKN9eNTGJX8MNUybvYJ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX2ZNjg6Psdt39
 kfZR4ZaVVVHVVDr1s7juoxUgclExeFLh7Qxa45kjELExe4+DQv8axgZyKAkkrGZenBvykkik1NQ
 ZK+1HN/jH83TaffSXNyB1Z7C6SZgFKs45WdlYzwgeKGIiiIgsqC4g9bUJhkq9cIZ//P/lyXju63
 FfMSv7QWDWr1g84CNwGdXZHelvZfiAm9A9oelnleK0J9kwX46Jbpu1OC6VrgBZvdjxVgyAZGuCk
 oSE0OE11GnFyf+kASSDzGvB0NkgJxGZQrFG4k+4KKOb3cLoX1lyJeQJMM9X4ssq0IjkKE5paiJm
 7jP+UZ1Pe4RtocCk0Hs0Z2eWMXvmCVYUzvhgeNV+IHlAYyjni9INuHsZJ8cLmsbs1m1pqKiOWSI
 5pwF51QFGNd3x8xW2lwkNKcSSbINzvh95kc8jFGBxWGx2dvqDbdE99V3XgECfWZIDl9Wy0c0R0o
 LpK8JGCZi2AzsNgNbDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117475-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFE2C721D21


On 7/8/2026 3:58 AM, Dmitry Baryshkov wrote:
> The IRIS_FMT_foo defines are only used for indexing values in the format
> enumeration arrays. However this kind of enumeration doesn't follow the
> V4L2 logic (which expects an array with consequitive indexing rather

Nit: s/consequitive/consequtive

> than a sparse array) and complicates adding support for platforms which
> support different sets of formats. Drop this enumeration and use flat
> lists of supported formats.
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_instance.h       | 14 --------------
>   drivers/media/platform/qcom/iris/iris_platform_vpu2.c  |  6 +++---
>   drivers/media/platform/qcom/iris/iris_platform_vpu3x.c |  8 ++++----
>   drivers/media/platform/qcom/iris/iris_vdec.c           |  8 ++++----
>   drivers/media/platform/qcom/iris/iris_venc.c           |  8 ++++----
>   5 files changed, 15 insertions(+), 29 deletions(-)

Otherwise,

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

