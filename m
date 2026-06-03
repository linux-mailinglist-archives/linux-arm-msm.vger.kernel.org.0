Return-Path: <linux-arm-msm+bounces-110938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UbGSIz0QIGpWvQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:30:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9070E637113
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:30:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P4+I5Msv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dE633e0M;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110938-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110938-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2FD103001397
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0DC358387;
	Wed,  3 Jun 2026 11:19:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1DE3890E7
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:19:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485577; cv=none; b=koWGzGX3Y1p1b5YfHTvJwTKpz2I5ugvCcFWNWLnuAg3QtUdkScYUP+rQ3uf8eiFvJYgzhRoaziw8iFnZXwY2nD7XYoZBojBi31PRaNsSEd6f9We0XNJLwJCiqDl8/Bci3ZTR4nnw/TQ+I65SWoganQaOHMlzv3TJa4sNYKgvLZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485577; c=relaxed/simple;
	bh=kZoUTfsDT+RfT9JubWcPrDJcSQyFYJpzaANhbfZqFts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pA+DZYZDWfBi9hvgdeeEzPeguLBfW2WMAasSqLtuID8ot5/riJRu6owIRtoQQWe63tbqVyksqsXHOYdQKh/2WpwYGA4mCnhQF3AkNlMaclz0qkOwYP/XAHsZAdJa5U4QggDhlk0G+QjXilXML2an3iWLjhH/rr8f+KnpGUNEeEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4+I5Msv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dE633e0M; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536v6671755366
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 11:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCOLHvwV3YQ3YkFnuUfmclvlWehtJAlfoI/KL/kihbE=; b=P4+I5Msv3LWbf+y3
	KtTjVVbUB0Ud1TC8oaSnUQaLwrQVemJZL6Viq1WS9y176RAqyeoG9rPuZuX0zMqd
	CyN7VNWt7sl57aPK5H6ZVUQjL5eyF9qJtZi3RqkXdbmRzj5lhGyUU1y4FJnHriq4
	c4IhzNSlUwOOUTspkM9yn4kpZAmVHY/aKSJ3/W3At9kgADxfT6E2Y5m7EEGe9HAV
	rrGSr4mUIXQidUBRlGpWFBapLq8aZVew7z1ig/HHdZYe3hTQbNSY+5YiiXQaWRYU
	eCec/DIAIHY0n7n+IP6ITLhfo391i81UzrNL/qMOUD5Ki2Wc7tZPF7OHxM+6kwrV
	vWBiPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejff013fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 11:19:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so73418755ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780485574; x=1781090374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCOLHvwV3YQ3YkFnuUfmclvlWehtJAlfoI/KL/kihbE=;
        b=dE633e0MV3xtxjpmUj4hNMLVDM76fUQR/rZiPlULemoaapmjzGqxKD243MfusbaXGY
         zodAxHT0pn3v2n0zlqPy/eNHTkk629ZkWUosJwJE1HeeW4XJUhA1ruttXmlsU2bKD0UP
         6GQ1hP2A26RepJ5tK0gAn1dQZlX6JWQBnewN92GUfNi37dDJxJj9Qpl6LiXS/VJvQH/V
         ARHBSxXZI5t97UOO43e3pMWEY5UrB49llGJxfopoMXG1SObDhPnp47h8OLOxyIfJ/VyP
         k8wEVnl8XFkEq7RGD0jbvSOoIXq3ezb2LcS2cAY9VEh+E3daCDfgEOuA67oGGdbAaOfr
         FllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485574; x=1781090374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCOLHvwV3YQ3YkFnuUfmclvlWehtJAlfoI/KL/kihbE=;
        b=rUJE+CBQrnp2EeZXt7kCFx8+j+rig1i178+oYpHh5r5NkUeeF843JUK3hVyTDhfiKT
         kkbgdf91ygfO/7iPyWrMi0+moCjq4rK6izvgfJtHzCf7v/BCuhPQu3zhH+fyTbQJssNY
         h/Ol80EW+MSs7ATJZzouFwZyf3HC7ORkBE2ELf+/I4BD1msuqzKDjqNAh0J8Q80DwrnN
         pkrAOdhzCslfxAWZvcLDYuYrggrNmzf8u5LB/ejxv0+QkJRpMsmomwdhN29+Ip6uaAln
         HvEL3hb0Bz4X/Juk5Ugoh68JJ6M+le1tR+S47spkC5FdVXykMTviyMc6lEXfcZzDz2q8
         7hxg==
X-Gm-Message-State: AOJu0YzMGqre4rIn+kmGTsLBl04zeoO2VVOObl0Zn7bJk7AXQhhyYFc0
	/UcDqNMVt6kyE2fwcnDYt04cwUZYc0HEkpR/dWLzShETPSq+qdxuHw1fgpM4mQuZqrkRsUCpx/J
	ztRryghWau/2YgoxKZtt6+qMHYKkaI6ASrPhUUQYNCxzWtEai9ZvRRtfOA7Dzk7d4p3T/aK6bMz
	c3
X-Gm-Gg: Acq92OExg55T7oAZUXOelzM6XZQceOESfUs80JWhSl1fjGUvNUDK03P0twCXew7XiCl
	eQ5oUc/FoNfS8H/I7/pjxhqMZfAH8e4TeV/joqcKoEOxSKOLzAls2h/WPEzuYGvupzIurwjgso4
	QuegqSWU+vZnMwHX1Ip9ZnkdY7SjM0VWrivlrqY6N3OTunZlZKee0MG5jBJmkbbiPXYGxJTAfCW
	9W+ae0p9IcSXqw6xju/yanz1ZK3mHY8xnuC5uFBiRjnr7AOiBl1EPodaj6Bt2Ho18RVOYwDQUgq
	rdQ9BJEeHnZsh5w6PrS/3W6HbeEPHL45uyBecBLKZTNkeEX1OHP2tpwkk5juAAwtMglwdEaybW3
	zPfIgsOTDQ4nJigVvX0fisXi5nI0ZvXkbA4K2hAdT6qYJ9SY0uXmyg7W4AIl4iM3+saM=
X-Received: by 2002:a05:6a21:7a97:b0:3b4:82bb:cb67 with SMTP id adf61e73a8af0-3b4978d6511mr3387444637.39.1780485574267;
        Wed, 03 Jun 2026 04:19:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a97:b0:3b4:82bb:cb67 with SMTP id adf61e73a8af0-3b4978d6511mr3387408637.39.1780485573657;
        Wed, 03 Jun 2026 04:19:33 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm1916840a12.26.2026.06.03.04.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 04:19:33 -0700 (PDT)
Message-ID: <ac86f985-7252-41f5-a08a-1a6f7385e25f@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 16:49:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] spi: qcom-geni: Fix cs_change handling on the last
 transfer
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260529-fix-spi-fragmentation-bit-logic-v1-1-3b30f1a3dd7d@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260529-fix-spi-fragmentation-bit-logic-v1-1-3b30f1a3dd7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2QU3DGEM8vdFjgEmVPq79fOFXNQj8FGk
X-Proofpoint-ORIG-GUID: 2QU3DGEM8vdFjgEmVPq79fOFXNQj8FGk
X-Authority-Analysis: v=2.4 cv=LYwMLDfi c=1 sm=1 tr=0 ts=6a200dc7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SmtWm-_bhN_d2ojGWe4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwOCBTYWx0ZWRfX6pRCrUGcIsGj
 jYewmSy51bBBJU38Kp2/yXHao9plbL4kqWJoZVlY/sOzeYwSVHOapISZepjL5UOph6UWrEUjrgu
 jqvzXLxI1z666owjxErYy5enqk02SRB97RDsdn0JO5gqsiXkh6NczE7lE9EO6P5H2WWJCXSflfa
 bKoh005ODNxM6yJ0Ljf/Sw4WtmqJHw1anHbKqu8aFqDUbjgli60M3a6o2lqYHkpLo1geT8rVmc9
 Kdn1nF7vz4Dph8VqCycsRxblrSv3E8BNuqWdV04NTu1ipFzftTqKMKEULKx55K8Vz/KCGyNhmK/
 NKRMarNyuj1Lu6pIkT31oc6eWCOB5Ing6zrxMqmwaRHpTSXWvXELBaKKIenVOxnSKUnii3v+Crk
 kf0gEF5s4ekQL6Ov6V2tQMsWLcVnANZN5km1HK7Me51kLoG39mqT0Aps4nPUEbNUXXI/dIUk1Pr
 6KvzvzHWE5HqL+CTKOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110938-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:viken.dadhaniya@oss.qualcomm.com,m:broonie@kernel.org,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9070E637113



On 5/29/2026 12:33 AM, Viken Dadhaniya wrote:
> Commit b99181cdf9fa ("spi-geni-qcom: remove manual CS control") introduced
> automatic CS control via the FRAGMENTATION bit, but missed the case where
> cs_change is set on the last transfer in a message.
> 
> For the last transfer, cs_change means that CS should remain asserted after
Please make it clear if cs_change = 1 or true ? for CS assertion ?
This is to make it understandable for anyone.

> the message completes. Since GENI SPI controls CS through FRAGMENTATION,
Please provide FRAGMENTION bit information to know what it does when set 
to 1 and 0 ? Same for better clarity.
> set FRAGMENTATION for this case as well as for non-last transfers where
> cs_change is not set.
> 
> Additionally, setup_gsi_xfer() was storing FRAGMENTATION (BIT(2) = 4) in
> peripheral.fragmentation, which is a boolean field consumed by
> gpi_create_spi_tre() via u32_encode_bits(..., TRE_SPI_GO_FRAG). Storing 4
Writing 4 ?
> causes u32_encode_bits to mask it to 0, silently disabling the FRAG bit in
> the GPI TRE regardless of the cs_change logic. Store 1 instead.
> 
confusing  to understand.
> Without these fixes, TPM TIS SPI transfers deassert CS between
> single-transfer messages that use cs_change to keep CS asserted across the
> header, wait-state, and data phases, breaking TCG SPI flow control:
> 
can we also mention scenario like TPM client controls the CS separately 
on its own. so it becomes clear to understand requirement also.
>    tpm_tis_spi: probe of spi11.0 failed with error -110
> 
> Update both setup_se_xfer() and setup_gsi_xfer() to handle this condition.
> 
> Fixes: b99181cdf9fa ("spi-geni-qcom: remove manual CS control")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>   drivers/spi/spi-geni-qcom.c | 27 +++++++++++++++++++--------
>   1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index a04cdc1e5ad4..0618f6bd7878 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -449,10 +449,15 @@ static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas
>   		return ret;
>   	}
>   
> -	if (!xfer->cs_change) {
> -		if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
> -			peripheral.fragmentation = FRAGMENTATION;
> -	}
> +	/*
> +	 * Set fragmentation to keep CS asserted after this transfer when:
> +	 *  - non-last transfer with cs_change=0: keep CS between chained transfers
Seems typo, should be keep CS de-deasserted between....
> +	 *  - last transfer with cs_change=1: keep CS asserted after the message
> +	 *    (e.g. TPM TIS SPI uses cs_change=1 on single-transfer messages to
> +	 *     keep CS asserted across header, wait-state and data phases)
> +	 */
> +	peripheral.fragmentation = list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers) ?
> +				   xfer->cs_change : !xfer->cs_change;
>   
>   	if (peripheral.cmd & SPI_RX) {
>   		dmaengine_slave_config(mas->rx, &config);
> @@ -858,10 +863,16 @@ static int setup_se_xfer(struct spi_transfer *xfer,
>   		mas->cur_xfer_mode = GENI_SE_DMA;
>   	geni_se_select_mode(se, mas->cur_xfer_mode);
>   
> -	if (!xfer->cs_change) {
> -		if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
> -			m_params = FRAGMENTATION;
> -	}
> +	/*
> +	 * Set FRAGMENTATION to keep CS asserted after this transfer when:
> +	 *  - non-last transfer with cs_change=0: keep CS between chained transfers
> +	 *  - last transfer with cs_change=1: keep CS asserted after the message
> +	 *    (e.g. TPM TIS SPI uses cs_change=1 on single-transfer messages to
> +	 *     keep CS asserted across header, wait-state and data phases)
> +	 */
> +	if (list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers) ?
> +	    xfer->cs_change : !xfer->cs_change)
> +		m_params = FRAGMENTATION;
m_params |= FRAGMENTATION ?
>   
>   	/*
>   	 * Lock around right before we start the transfer since our
> 
> ---
> base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
> change-id: 20260528-fix-spi-fragmentation-bit-logic-880394337ff9
> 
> Best regards,
> --
> Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> 
> 


