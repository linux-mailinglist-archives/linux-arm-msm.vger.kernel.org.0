Return-Path: <linux-arm-msm+bounces-114134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wZjUKhBTOmqH6AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:34:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBF86B5D71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:34:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D5pqRZTz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B6QS8S2Q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114134-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114134-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7FD163034BDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672BB3603C3;
	Tue, 23 Jun 2026 09:30:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFDA2472B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:30:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207054; cv=none; b=WMJlPIusk2fYZaygzRwIv40OqCs2kgib+VGli9IieCZnUu39QxNos1ToiU4bpSYbH04BWw67ARtAOPpA0AVGnhpBG5KN3K9EiF+VMQn0W7LbjoU8B4UIVwNE4XfM72gGF57XE1vAnkw1a5idSGHacWNsv8syKPlpNBQdKN3CIYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207054; c=relaxed/simple;
	bh=PVljsgrSet0Sw13LcwwZTMfVebAKG1YbyGt074vVCac=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RfF+TcTa+bXI4QP7J7cAJylvOUjmZERGw9St7Z3zCBcQlHlSqc6HO0EwUF/hfcjfF5cSS8ut10O51l+tLHc5VlVEgGHBOCPL0HhyiAXIid4UF+ITqGaeo86B7yQ1wYgC9ZYnR4XqCvIUR9+NAyQ0FzHGWbKkPlqqr0nWjccvkWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5pqRZTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6QS8S2Q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N9KV5p3919007
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJYEI4YXKhKmSUa7HJKZYu1OYH8EbWwSDKhrtSJcDn4=; b=D5pqRZTzXBf0Wa+4
	oWFHUqWXRifYWOi9LmF02agtJxLkwtMJAKIPXPlZw7nr12QDcyQlZf0B1L4lIS7p
	ORG/VQ60ITd5nRuy2zdF6lxctUsU3kraeI6SnTuLTXthyRTWwWTGm1TR5uD+cY5K
	vlhQDlDIO18nr7AMN+jMFHVpFuGciUZK48ripLlyf3dUYlr/C2ONm7hefI3EcwBr
	88AaJPMLpKH2OSu/HapwcGtjzazOq3vJeo1QBxwfYN2fg1tHeevKE39pOw/Y8qIr
	v0oUHtxVySMqJZc0zlpn/kL7JdUBWiY/ahwQ/slFvcpvmeR2NcgzwJDLpPcuY+RA
	Qeoytg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe681v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:30:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176891d0a9so13253121cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782207051; x=1782811851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MJYEI4YXKhKmSUa7HJKZYu1OYH8EbWwSDKhrtSJcDn4=;
        b=B6QS8S2QdxUC9eTcHEmtpHcWShD7olzG7xYTwV312ioL9spqVPF/8UvC9wFN4vZaLu
         JsQFxKZKXDD5+yXA6fQh9fhh3e16WG5OKKsqfd0rhN1mlLTuSu1wdFYdOl3maGuNYUYq
         v21AcYb2am0/QumG8Ce3FOLadwS0OPzep+Mv+8ubNbsYw21+j+bGOd9/0ir2F0gmaMuR
         RaehBnWGgaWF+3TDZvKQrXqvaFvJvHh2aPsiBnaGU2Xbl4vvBmaVUWuO4LCn3mLwyGy8
         /hWf2FvG+wO0A/1tXdbM29VmkvqmXDm5Ux1c8IrwP43724XN/IxS0JDHlwBCUflkU49e
         5pZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207051; x=1782811851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJYEI4YXKhKmSUa7HJKZYu1OYH8EbWwSDKhrtSJcDn4=;
        b=bFqo16H1GP2Ssr5+LAulM/OHoesrtH8DXnolqzVf042JUY3OXPAvOlXE3sHm0nhI8G
         KOjS1HFLr5SWZki1O9+q/1YZQEoxJqtQpttLd+a5Glf50Os+IdWwRfZilK8V5qM7Jko+
         Pra6gBwWPO+8oM3YMFLdleogsS1XL/cOFtr0FXXHi+iFrrp0VKWRmclQ67TlpDskxBAB
         m/pjirm58KXf/IZ9uHhNeq7KfIQDIpQE1AKGWv4qDurs4KalibhEGewmfRjihz39EMeU
         Q9V+tBfdnCGR6hyDt0GWNKJiXvoycnAmvFkhgCxGSF5eiYG8XmA5zox6MKVax1GqGv3U
         wKcw==
X-Forwarded-Encrypted: i=1; AFNElJ+n4r8baGV3KCi2iiInvBbtaQdkEb07o1wwhx1PW68+oaFMewUlBH5TbdvGVTz9/K6W5ILqLkRPRj92C6mk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Oe6rogfKmVaCCzwr7jfxV/kVitgMNsnjbEz6+Y2KtSbGgNeW
	2069BI5PIu1ldcSj6QjY3XFEBqECQqDru2R5dJWoeS0dA3ses68mAMElUoOwE4syhXQXNH73U5q
	eqPMpWKxBaMn32gHQDtdkUyJyLhNDYusnUfe6HJ7Es4mDODEgd9LLgtKTrqsImVULp42z
X-Gm-Gg: AfdE7cnLJFLGhLj7PpCNgT7O85noWzQPmGPkEymkVdak9pmT+lXwng7Gvnj++oR+rVg
	e/4Bu0nzF3VjrxiUcBOHvM4xpHV53v/TzFbabLylKrbvlVidUJGlsC9YRUCuGuWE2xP1xwf6Ypf
	93LHrs5sWj1jrSgvT+pYj8jKgGRQt3Ufvr5F2WypxdX7PIujS2nWoXcmS5S4noq1ouQZ/6cJeRi
	IIVo6B5AtOiZY5NRG+y74UjQd6azK9iE/eYHYT+I7zsxkRQIwlRI0XjmrhnDfm6DoA5CJeijTkB
	4oYVgs/5Ob6iciZJ6A1+sejxv+E6xrq5Keo0bcu+/IhC9WJrxBSQoLPUwwxLYahRLoNPDfc5gFj
	TIvEKbOHT3gtyiKIMTvpOg3Jjh6NwIQ2EvjQ=
X-Received: by 2002:a05:622a:650:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-51a4f42cacbmr45002511cf.2.1782207050468;
        Tue, 23 Jun 2026 02:30:50 -0700 (PDT)
X-Received: by 2002:a05:622a:650:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-51a4f42cacbmr45002031cf.2.1782207049668;
        Tue, 23 Jun 2026 02:30:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69796c10dbasm3342945a12.8.2026.06.23.02.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:30:48 -0700 (PDT)
Message-ID: <cc9cd039-83c1-479e-bb97-4c3b1345cf35@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:30:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smp2p: fix __iomem annotation on entry->value
 pointer
To: Ben Dooks <ben.dooks@codethink.co.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Lew <christopher.lew@oss.qualcomm.com>
References: <20260623085931.589735-1-ben.dooks@codethink.co.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623085931.589735-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZbuhI09ljvwRo8mOEYMCvBz-EAUJALVv
X-Proofpoint-ORIG-GUID: ZbuhI09ljvwRo8mOEYMCvBz-EAUJALVv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3NiBTYWx0ZWRfXzyRKaSyc3i7O
 BQ+KNHG8o86hQAiWmsbhgwftQqJM93Hy6ggHDZOn+zki3fXeLheB8yKFYoQuPlGUb8QPxU6qcU0
 BegXspcm9fMmDnqWxs9QchNa9WmDx90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3NiBTYWx0ZWRfXyhMQMftvYVbe
 F85X46X6nRErZ52uVfXTDFd/8ziH6x71E2Ki2zt6jcazUEMN1z+RU/UBEol197O10Cuyw9m9Mej
 dyGEl/PSOVAQpCyraRH6BTQfGPzww1uw+x0yxR9rIuLa66FtMb/qQkSCL5ghrBH16A27Uz543Aw
 3QGXhUPCFuzTi2naMR5T5c/+Ut7TywUMeMtEaofrkMbyVwu244XHvChR0ir1OoOKEGZH3lV3Um8
 sc4EtaE07krSIHdX2M+KBXJvgi/h/9yphJcHmXh7VMflwNuC3JCmSe8DXzX9OlmYnm3pH1O8g2P
 Ad4WjGAGjcfmun7zy3a9hhnjJsaq6a+8mSgmd/3qgCRCiLVYKOyyv+ic0qDaByx+EV424Z0zFoO
 pggsTbcdH7o32hq3ARrW8eu6gXn32lUmFSZX9UQQ0T5E4uz1PnqciuxQltPg/1Wmqix6a5dVAj4
 U6C6qLw054Trc7BzGqA==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a524b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=1EsaE_6oAAAA:8 a=6-cX_FYrlKhM5fZ7MtYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=3ZumFrijQQ-2J9H5h8ct:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114134-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ben.dooks@codethink.co.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:christopher.lew@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EBF86B5D71

On 6/23/26 10:59 AM, Ben Dooks wrote:
> The entry->value is passed to readl() so should be marked __iomem
> so remove these sparse warnings by marking it __iomem and do the
> relevant casting to ensure no further warnings:
> 
> drivers/soc/qcom/smp2p.c:280:64: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smp2p.c:280:64:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smp2p.c:280:64:    got unsigned int [usertype] *value
> drivers/soc/qcom/smp2p.c:318:34: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smp2p.c:318:34:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smp2p.c:318:34:    got unsigned int [usertype] *value
> drivers/soc/qcom/smp2p.c:446:26: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smp2p.c:446:26:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smp2p.c:446:26:    got unsigned int [usertype] *value
> drivers/soc/qcom/smp2p.c:501:33: warning: incorrect type in argument 1 (different address spaces)
> drivers/soc/qcom/smp2p.c:501:33:    expected void const volatile [noderef] __iomem *addr
> drivers/soc/qcom/smp2p.c:501:33:    got unsigned int [usertype] *value
> drivers/soc/qcom/smp2p.c:504:26: warning: incorrect type in argument 2 (different address spaces)
> drivers/soc/qcom/smp2p.c:504:26:    expected void volatile [noderef] __iomem *addr
> drivers/soc/qcom/smp2p.c:504:26:    got unsigned int [usertype] *value
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

+Chris, is this actually iomem, or should this be treated as normal
memory (since this is just coming from SMEM, perhaps just memmap()?)

Konrad

>  drivers/soc/qcom/smp2p.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index af0ceeaf6e07..fef6f17c3257 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -102,7 +102,7 @@ struct smp2p_entry {
>  	struct qcom_smp2p *smp2p;
>  
>  	const char *name;
> -	u32 *value;
> +	u32 __iomem *value;
>  	u32 last_value;
>  
>  	struct irq_domain *domain;
> @@ -276,7 +276,7 @@ static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>  		list_for_each_entry(entry, &smp2p->inbound, node) {
>  			memcpy(buf, in->entries[i].name, sizeof(buf));
>  			if (!strcmp(buf, entry->name)) {
> -				entry->value = &in->entries[i].value;
> +				entry->value = (u32 __iomem *)&in->entries[i].value;
>  				entry->last_value = readl(entry->value);
>  				break;
>  			}
> @@ -302,7 +302,7 @@ static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
>  		list_for_each_entry(entry, &smp2p->inbound, node) {
>  			memcpy(buf, in->entries[i].name, sizeof(buf));
>  			if (!strcmp(buf, entry->name)) {
> -				entry->value = &in->entries[i].value;
> +				entry->value = (u32 __iomem *)&in->entries[i].value;
>  				break;
>  			}
>  		}
> @@ -528,7 +528,7 @@ static int qcom_smp2p_outbound_entry(struct qcom_smp2p *smp2p,
>  	memcpy(out->entries[out->valid_entries].name, buf, SMP2P_MAX_ENTRY_NAME);
>  
>  	/* Make the logical entry reference the physical value */
> -	entry->value = &out->entries[out->valid_entries].value;
> +	entry->value = (u32 __iomem *)&out->entries[out->valid_entries].value;
>  
>  	out->valid_entries++;
>  

