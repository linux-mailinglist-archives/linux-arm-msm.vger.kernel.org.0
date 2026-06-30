Return-Path: <linux-arm-msm+bounces-115354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /56ABpmVQ2rRcgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:08:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BF56E2A2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:08:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MuTHaB32;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YxMlBEUK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115354-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115354-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FD7C30073CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A083D3324;
	Tue, 30 Jun 2026 10:07:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C8D3C943F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:07:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814057; cv=none; b=h4ql/xeLaQBBcp+ZjTsnXnEg0+ZK9sRPim3vLukiJW4A3GOOfx6D+rS4SBVHJ1QylV1tu6gAMTSpSjMXQkv/O1NKT3Gl+B4iZk/8mGaqCvDU3gavganrUyIzIN2Kn6FB+7jvRaJbyV4o8U9uPcDoPCjmGeJWBJeajejTlSJj84w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814057; c=relaxed/simple;
	bh=oMLy9f5ov7nQ54i2/cX9N1jmgjm/2oYPTAamP3S/Gfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJFWpD9X8HRLHa2+KNu04vs6yY1rOxcqFx5I22rZdHq4rH/PSn4SaSBLc0LeDkyFZoAJo+DLB5iRYol7zE0WAJBjUwvAGOHjVISmUaUrWwDCVRvU7P4lCIGBY4BQvZg2XfGMs06v4k4337msNsSmzQRjUIpEgu0nQBvID4q7mvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuTHaB32; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxMlBEUK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mqvR1541611
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJXkLtGwrSHNE3iUw3p4RQuRvGoBPC66zF8s3Wn6sdk=; b=MuTHaB32pQHZxDdG
	Uk09Twu/MdLNoQobpYkQSKjt6pSAHvqwUEHSW60AWJrgJ2tLZYyYRgxHAvcRxYTI
	woZaqFuI/dK39FuHDz29kGgm49qS43k7yWUeauyjRbAToZkD9CZEhm0TCFBt5PPi
	Lrs3x/6+ZYUoCwBVWy42N377M4atgkkj0K7ZotJDyDU5EcbTQPvk+NJkY3fXDxxa
	eSg45BzPfuSuQ5iWyj/wTrnmbJTpo/kM9spMQsepCUmfvhrf2l8sC13aHYIkMADm
	ObJatvFgfAzstFVJ4CWSvJXNmcaR+JPshvNeZgHBb+5GW/cS4ITnGxT+9AyCXZOH
	vwcgQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp1tk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:07:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe75b7dbso2718111cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782814050; x=1783418850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJXkLtGwrSHNE3iUw3p4RQuRvGoBPC66zF8s3Wn6sdk=;
        b=YxMlBEUKJXC1h/aFwBvqE7LvyKDglKzW9d0SFyDTMuT0IQFucdE5n+gHTrjI/Zfyv7
         ZrQQvzxV4cImrkZ17BU1j9Bijyn2hdZrMzyQjD/tJPXq2l97/dnDSzLZlA2tA2jzQhea
         WlR4bffNi2tT8koa6bLoLQwEAMufT++ArMbtE8glQn1raeyD2mSjwyP3yNtcaqJjiNjY
         BsOJHJlvWn+r+o63/yRiCmbNYY9rEwCFPbs0dqqup8bexDnK50s2Gvxtqmhk6MCerb9+
         rRTUnMfV8Nm5SDRgltXEhBQfjev/8n3g7kloxMG3vFgP3uopzvq6R3Arj1oSjANHXYgA
         vPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814050; x=1783418850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJXkLtGwrSHNE3iUw3p4RQuRvGoBPC66zF8s3Wn6sdk=;
        b=hA9nBKNSkTAJ8Nb/Ry1iVZcYTnJ8l59qe20dT8IngXRKIOHTEcJaYZxicxGK9TeUDm
         aBLhBiaUci2NfxbdYVbLl8hnMlmce+lqDg9Au66pMTcpWpC27FhLiSebKOW7pa8o1mgy
         o+DS2646kMT1h3eqzkuySmCAC9V1d2q28HBofw4MPf3R9EftuzhmU4ATOXaKka39D5iq
         uOE57l9UVZBnxUwswQbiJO+Db5EtanDNM4Omga0KIK8CCOcQRjZPPZo7SwDSNJshReee
         PhhcgyTNXtVg2+ieis1wqrvaeB/aY/johjoT5cPHLLWp/8TcFHFAOlnvROhlunlNFini
         cehA==
X-Gm-Message-State: AOJu0YwzOaTdanAdxWht9eMmKtW6sYwqcDQrizu426F8GqmYONNERh2N
	bdx2XJpM1srYTM9AYXYhQJkQYU1QsKLZ/Kx7HKiDeQFBetZjb4EvYiaGSppBX7+6ipMDpvLl41P
	AOhT2uudf5hr5EDlg29co1i2CLRYQAkNjfXR9W8non8NPPUQGZBRXH9cWczZjjzx5FJuK
X-Gm-Gg: AfdE7cmTJxSK0x3uyvn9QkYy+00BTyH7kgWHJ5oc27/fJdWNTa71bkheT4HLMCVWMvW
	c9P1JpeL18cVaWDlEsehyb5le9znJhgEv1o6+nsJzygqLKlCAYH/kqSXGDKg+VCmNhn8H51JwuH
	498KnMyfCvzC0dueaJ4s+lF10BXDvWO6Cz0rrosZ09gXxenLAPDpvN90vUXRWC5ecW+wZwkUgYT
	Y5aYUyikZwAeb6VLZhMB2Ikglp2+HYOvVtxsnDXrC58D1Ah7ZwTvolj/1p5WkUAFORCkqfzLBHn
	dGtcmD8HbX/aHc8A/chlWAUd4/FSWFPmsZ7z4TkRxHPCCFRHn2yakESyiqcC9aLF+zuiezfozPZ
	VnQbeeUlSnWSDo4cFUHalHfAd0kWlv5Wj00s=
X-Received: by 2002:a05:622a:a1a:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51c1744f08cmr8810541cf.9.1782814050088;
        Tue, 30 Jun 2026 03:07:30 -0700 (PDT)
X-Received: by 2002:a05:622a:a1a:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51c1744f08cmr8810301cf.9.1782814049619;
        Tue, 30 Jun 2026 03:07:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f47394sm97184266b.43.2026.06.30.03.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:07:28 -0700 (PDT)
Message-ID: <dfa822b8-5bec-4ad3-b9c4-ead79e0c74d6@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:07:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] firmware: qcom: scm: Fix reserved memory cleanup
 on probe failure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629141750.996853-1-mukesh.ojha@oss.qualcomm.com>
 <20260629141750.996853-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629141750.996853-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uRTiXZ4EZRwYRJOhTelb4OvnXdDQNyrn
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a439563 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=u0TfFkBtaRxlmmFmf2QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: uRTiXZ4EZRwYRJOhTelb4OvnXdDQNyrn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5MSBTYWx0ZWRfX+3ehgfyOQhBN
 uZerZszRshOyCLZdKlMxW80gxp15yEKkfKrb5u0X6XMU7D3eZaV9oNqzhk5SkvuU991ZATDZ8Rc
 rq1z6A0ECBriFydRPdTLyNiBka+845ZKhexUa9+k4t9gh8YMI4630qTIxsha635tgCMktdO0rwl
 TNHCXq7TSScP3VSj+Ns2okl9FEKHWJSMhw/DT6V+eebkD53OUvGqta3BCGxzLWqV9itCT1LSc+o
 fU4o/u0Qnfvf1sDzprGmzIY2EQTT00+bPFYjFp9NheO9vsbIuaPtO+hWCc8YDdtDajaIaOSjbWW
 TIILZWW/EiVdeMUJ8LbqfaaMv7NK6K3+g6LU1GfJNYf9U/Oq2NSdwRcr2AG0r9MYhNmmV6ax60z
 kR5kqzVcd8S5EIF3uoUTAmMphUNKtLQS3LG7TArUZapuYbpDx2B5lolDQW0ayJ7Qbk29TTB0Zee
 ULDgKPkVQQZwJ5my0vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5MSBTYWx0ZWRfX6H9RMeX9yA3O
 rt1qk/3BmLzV5hJhendaQ7BL3jjANdgOKpT8mkBEVASrwmTZ523qEBQluMdW5y2+9oq4grxo6p9
 cMb5oHWyeEBgUZIdihVled7MMBU95X4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115354-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux@gurudas.dev,m:sibi.sankar@oss.qualcomm.com,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86BF56E2A2E

On 6/29/26 4:17 PM, Mukesh Ojha wrote:
> of_reserved_mem_device_init() adds an entry to a global list with no
> devres counterpart. If qcom_scm_probe() fails after the call the
> assignment is never cleaned up. A probe retry would add a duplicate
> entry, leaking the original one permanently.
> 
> Add an err_rmem label that calls of_reserved_mem_device_release() and
> route all error paths after of_reserved_mem_device_init() through it.
> of_reserved_mem_device_release() is safe to call unconditionally as it
> simply walks an empty list when nothing was assigned.
> 
> Fixes: a33b2579c8d3 ("firmware: qcom: scm: add support for SHM bridge memory carveout")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 464ae3b4ca43..f0e19fc314b4 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2785,9 +2785,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  				     "Failed to setup the reserved memory region for TZ mem\n");
>  
>  	ret = qcom_tzmem_enable(scm->dev);
> -	if (ret)
> -		return dev_err_probe(scm->dev, ret,
> -				     "Failed to enable the TrustZone memory allocator\n");
> +	if (ret) {
> +		dev_err_probe(scm->dev, ret,
> +			      "Failed to enable the TrustZone memory allocator\n");

Assign ret = dev_err_probe to preserve the usefulness of this API

Alternatively, I cobbled this together, feel free to take it forward
(compile-tested only):

From 917c849fd21c6660ba0bd55f8b6ce4cb5dfc8299 Mon Sep 17 00:00:00 2001
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:02:16 +0200
Subject: [PATCH] of: reserved_mem: Introduce devres-managed initialization
 functions

Introduce devres-based helpers for of_reserved_mem_device_init(_by_idx)
to help fight dangling references and ever so slightly reduce the
number of boilerplate deinitialization calls.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/of/of_reserved_mem.c    | 37 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 25 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 82222bd45ac6..79fa04d4cf04 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -787,6 +787,43 @@ void of_reserved_mem_device_release(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_device_release);
 
+static void devm_of_reserved_mem_device_release(struct device *dev, void *res)
+{
+	of_reserved_mem_device_release(*(struct device **)res);
+}
+
+/**
+ * devm_of_reserved_mem_device_init_by_idx - Resource managed of_reserved_mem_device_init_by_idx()
+ * @dev: Pointer to the device to configure
+ *
+ * This function assigns respective DMA-mapping operations based on the first
+ * reserved memory region specified by 'memory-region' property in device tree
+ * node of the given device.
+ *
+ * Returns: Negative errno on failure or zero on success.
+ */
+int devm_of_reserved_mem_device_init_by_idx(struct device *dev, struct device_node *np, int idx)
+{
+	struct device **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_of_reserved_mem_device_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = of_reserved_mem_device_init_by_idx(dev, np, idx);
+	if (ret) {
+		devres_free(ptr);
+		return ret;
+	}
+
+	*ptr = dev;
+	devres_add(dev, ptr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_of_reserved_mem_device_init_by_idx);
+
 /**
  * of_reserved_mem_lookup() - acquire reserved_mem from a device node
  * @np:		node pointer of the desired reserved-memory region
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..28beeeb91f4e 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -47,6 +47,8 @@ int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
 					      const char *name, struct resource *res);
 int of_reserved_mem_region_count(const struct device_node *np);
 
+int devm_of_reserved_mem_device_init_by_idx(struct device *dev, struct device_node *np, int idx);
+
 #else
 
 #define RESERVEDMEM_OF_DECLARE(name, compat, ops)			\
@@ -91,6 +93,14 @@ static inline int of_reserved_mem_region_count(const struct device_node *np)
 {
 	return 0;
 }
+
+static inline int devm_of_reserved_mem_device_init_by_idx(struct device *dev,
+							  struct device_node *np,
+							  int idx)
+{
+	return -ENOSYS;
+}
+
 #endif
 
 /**
@@ -108,4 +118,19 @@ static inline int of_reserved_mem_device_init(struct device *dev)
 	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
 }
 
+/**
+ * of_reserved_mem_device_init() - Devres-managed version of of_reserved_mem_device_init()
+ * @dev:	Pointer to the device to configure
+ *
+ * This function assigns respective DMA-mapping operations based on the first
+ * reserved memory region specified by 'memory-region' property in device tree
+ * node of the given device.
+ *
+ * Returns error code or zero on success.
+ */
+static inline int devm_of_reserved_mem_device_init(struct device *dev)
+{
+	return devm_of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
+}
+
 #endif /* __OF_RESERVED_MEM_H */
-- 
2.54.0


Konrad

