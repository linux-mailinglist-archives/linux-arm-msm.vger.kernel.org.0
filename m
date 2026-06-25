Return-Path: <linux-arm-msm+bounces-114493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hRO8OGv5PGoHvQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:48:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9136C463A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:48:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ACBWIlfy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V72QxshA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114493-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114493-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3CC03051A72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7733839A8;
	Thu, 25 Jun 2026 09:44:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F5936C9EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:44:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380660; cv=none; b=tyHJXnPmJganwx87fZhlzFOTL5XGS1oRec9RJ6gx2JmhvzavvypjcB/CE4W0pEzJFxhsgDYqNt02Zo8nL1vJT4glohNCSShGKKx3Iel0vhi/apopQHOjFzn37/T+aHOexha/qFtP+joH01qf60twfuJiDnldVzxb3hbgdPweHbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380660; c=relaxed/simple;
	bh=6g+jRBdLPCtmrXSl+ZeBezUOvp3mrscy01YbJDgZj/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5SFGEYEa25JR9dK50CSCXf5Wr3f6dyJqzN7xKEhjPBiCSqHH2DkphS+vLegKLfUc0OMK0f/o64DvHfaTp1B9jtaQpVwxyKDWXEVETbRM8+pMj1K1Yf59dQB0SrqmU0CmU3cW+rHoj9LT+4FliFlVfFS0hPBfoV1hppKrDOg/zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACBWIlfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V72QxshA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pbXJ1885650
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3w3x8F7EpJJvDzUCzufd3NipAnTez81YBJ5Ga8zCtYk=; b=ACBWIlfyclT851X2
	ad24kPSmXxNIFqG0/DMzCQYW4/ynNdGhe8ChvxewOLMFZDENUmVq4Bsd9ccqmbRc
	EO1CSOfG83qOojLSnHJMszQGjVXNWAnif6Dx3msml3oINVUgG6MWZFjnEOkj8ytx
	/WHAXPOlqlz0DNBdLJYOsWnbE9rpWOPyDe4+vxLL4rG86nrwC1DN2nJl3D0ObBSX
	7gDJkUzRa6x0Qca1y8FVkwIiB4MNjDI+zNlcVU/kJtGSkprwLW5raFgVJdnt4d1q
	mn4NTaF3i1Pws8nerwR7nmPglx8XNJEfp8GC/R3GlJFs5vOd5HuwU77ot1gWRStg
	qhUVCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmhjn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:44:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915756c1407so26959485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782380656; x=1782985456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3w3x8F7EpJJvDzUCzufd3NipAnTez81YBJ5Ga8zCtYk=;
        b=V72QxshAWg3aT7ZefD+2FjIS5rOmKh4STJ3MccOon3fmVVSErXed1/3lnpZf8mqlQd
         W/lR6RFrk0w7dH6PBzZE8FbtJt7OL9Hfzf1a6ihdV0HUI5f9P4TtF1Q1FlXLCIMt+Hln
         vaKx0NLzPrxxHX9yFAW/zwXvf1e1wJeJwbLBE0fCHvbdo3QA1yRta9HseHg4zNlHfpkM
         3/ilJ0lFTpFUQmseJLl+Il9vZSx/CwbIiX13XMoINbggeYkv8F0ZC/DQEtLptlpq11K5
         bIMEeIEL5O+LvqoEbHZ7xB/0OzGABdcw0uQa6HSQqwHN1K5i0NLdZyDhN6IxgHhnWRCf
         iT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380656; x=1782985456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3w3x8F7EpJJvDzUCzufd3NipAnTez81YBJ5Ga8zCtYk=;
        b=NrFiYYX3m22cRsPBDEl/hnyWpU9aIw8TxS8iH1WZnfDmDFJzOC0+8KC/B6vI8mTEiu
         3j0WC7jT5HGUB2peeSMUXqh84ETpf93ED72v2NxrqzI5m3lkHQTyCAzjVvQ+J6UtpYti
         XcaSm6JTRQIe/LrssqyqMlhtRlsGImuPGSFKyXOwX/F0V2ccF/oBPiJUJaeW6FJon8T8
         rTCAf75ILJgGxCfOOSvDQ5j9kEr+MbQLzKxmPXdnDx+DXL/8BdYUMLk6UQpRh0p1qFgp
         vHvEjo1CHw4AclTY1Q+7th70ubWWlA6jL3dW4mGHAtTN+t4V0TJ3/jYHOvUurO4ijX4k
         Kg1w==
X-Forwarded-Encrypted: i=1; AFNElJ952olTPVclOidQgSHm1Azsh11WFq/Ze/G4REzoXtikztkF1JgITKnfkk1gDIAX4HBlK0BTxEwlySFRWaGw@vger.kernel.org
X-Gm-Message-State: AOJu0YwmZh5uwWl6EkYuCLvE2ix4d4sb4VAjJk40+o4aHlP5byY4/Nj7
	jLhTcuT8ezOB7fQZZddZTrjAZK1FM/PIVubZPfBKiHRtZ054eLzBHPF+XZdjCjwQQ9pFnGAn5mY
	7DIf5ubbpzS5OemgOI8KdkvvHtAKlKSGCVkra9tMEUTzTdxq3jXCzPdk59RB4giCmtn5D
X-Gm-Gg: AfdE7ckPIMfaWC0Yq3WHrabCeTeFDynxZS0Gfm/NwARJjPCcFSlblo4n3do7/PqX2jW
	crM5sIiHHyFB44GJ4zd+eZow3YgWppPZyfrlLcobFFao5asGfnrmu6zAPO1e06pQHddg1JAyg3P
	LWCBPrM7PY5wvy4iZ16JC6zDTt9Ur+n+Ruf3Q9JIf3zt4cz/4BYuErIC9JJGxXNZMFu5PWkBwG0
	meAv0tlO7n2Rj/olRCGMr6UqeRhzktwpgznqDdbJCC2MtXt12s/ON33WCLRDgLByrn4375rV2bH
	fJxRHS+0NdrP5yDGZih3H01GdRNiv/K01RJohiMXVZ1PBsCp1l1Olqqvxk7r7k5LnRFbMBmJUdY
	S3Ybxcg4BafSbTVvqtIa29spivZI3b/BGD/E=
X-Received: by 2002:a05:622a:181c:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51a725f43c5mr14041041cf.0.1782380656066;
        Thu, 25 Jun 2026 02:44:16 -0700 (PDT)
X-Received: by 2002:a05:622a:181c:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51a725f43c5mr14040911cf.0.1782380655656;
        Thu, 25 Jun 2026 02:44:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba8b61sm140319966b.4.2026.06.25.02.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:44:14 -0700 (PDT)
Message-ID: <21bbffb7-ce99-4c38-a5cc-6a3f3c7f48eb@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:44:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: qcom: common: introduce qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>, Saravana Kannan
 <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-2-15f82c64d95c@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-clk-sync-state-v2-2-15f82c64d95c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3cf870 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gxl3bz0cAAAA:8 a=20KFwNOVAAAA:8 a=MT1a_CUJkpGwGtyQXNIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MyBTYWx0ZWRfX/mikjCEfiNUP
 3XT9/n9yABMyl8yrDTszF4D6fQiWUFG9flKJcoKxN6kVmq0tFwRg1t4PKrH2x30Ney/bLar02ji
 YnClFl+i0hzcCf/JH07nahoW9fYldSTZNjl9Uar/5JayxJSiuZypJtkPrtw4bezq+8AF6tbNs7u
 PJ4oxCOcqpDWURLQEZb4qlJ4q0bHAn4DcerFggbxZPzYug5ZTTeEK9vnruq+tOJLlvlDZ3nEk7a
 qiG+ZA4J2vm99tYU+6KjBMi4+BnTlP4cmfKGz5mzrigAbbgEFfNIig7JIIMMKiUXiFlmoKHdYzy
 qt1/meNsoZM/Bh1xfNpdWDFsuEjBkNL3naw04atjM+a9SUdUXObimgVk0xx6U5dTyQ58b8f5tD3
 UzKOMwQfxj58CXdQbXZ0kA7o1ICQ8xAZ6tjX7BBWMoSwsnDj75LXGhiAYeQj0KDRULnLhWXKvsg
 qooj/HYtEoORNifcSJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MyBTYWx0ZWRfX4YN5mx9VwMwN
 L0ycPcf/DkpPISakSBRCjlkeWYW3N0uHOShfVaCxzmAiUG52I/KBrtMN4Q0cmP5OWIAwAXv8Djc
 fSQQhZVo1y9AYi+2TeixTcEghhBncuU=
X-Proofpoint-GUID: nrn0w0-nqGw4U4f9EAwN_o1gmDJzpiBS
X-Proofpoint-ORIG-GUID: nrn0w0-nqGw4U4f9EAwN_o1gmDJzpiBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114493-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oldschoolsolutions.biz:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 6B9136C463A

On 6/16/26 11:09 PM, Brian Masney wrote:
> Several qcom clk providers currently have a sync_state helper set to
> icc_sync_state(). With an upcoming change to the clk framework, if
> sync_state is not defined for the device, then the clk framework sets it
> to clk_sync_state().
> 
> Clk providers that require their own sync_state will need to call the
> framework level clk_sync_state(). Let's introduce a new common helper
> qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/qcom/common.c | 9 +++++++++
>  drivers/clk/qcom/common.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index eec369d2173b..31382c49c948 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -3,12 +3,14 @@
>   * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/export.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk-provider.h>
>  #include <linux/interconnect-clk.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset-controller.h>
>  #include <linux/of.h>
> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>  
> +void qcom_cc_sync_state(struct device *dev)
> +{
> +	icc_sync_state(dev);

As mentioned before, we really need to test for (qcom_cc_desc)->icc_hws
here

If icc_sync_state() is called without an interconnect provider
being registered, the framework state gets messed up:

--- drivers/interconnect/core.c
void icc_sync_state(struct device *dev)
{
	struct icc_provider *p;
	struct icc_node *n;
	static int count; // function-static variable

	count++; // called for every clock controller in this revision

	if (count < providers_count) // kaboom
		return;

	// actual sync_state never happens anymore

Presumably one would pass this through drvdata, but be careful as
some drivers use it for other purposes today

Konrad

