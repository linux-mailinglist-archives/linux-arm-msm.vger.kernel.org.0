Return-Path: <linux-arm-msm+bounces-114236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nDM5LKCrOmr/DAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:52:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD676B874B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:52:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="HT/954ll";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LUqbHVnQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114236-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114236-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59592309401A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619F12EBB8C;
	Tue, 23 Jun 2026 15:44:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E14D2E0902
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:44:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229485; cv=none; b=mBi4bLYi/VElNXUUJf7sqea959q/klJ1+acQMNjKkzfLTW+4peikmddWrGU7Ny7Pd0lxJdz3s6kt2EqHnylhCNb66FTfU0H6D7bVP06Joe54cebbb/Rma+AZw6w+VTt3jScYpD0U08lZDqgyQGvF2hTHa3qEnVbXihZ0Ab4KcR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229485; c=relaxed/simple;
	bh=5ONVug8nAa01E9piHuiJTq5LtimGr/ABGC7Bw9PkVy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIAR47YRP4abRkEDSot8xRG2N7eaEkVaYB8l/40a8fMABPkNWpO32bCzs4T5PHhuhTpRzCbh6JYTj//p4qZmILMaUsHZILWgVRFivrAr+GARJRyzrBhyiTLdLx3eCdJzV6RdsLih0kQyOUNIInJj+z15SyDVhq5vKSYlQbC+lAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HT/954ll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUqbHVnQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXodW3668845
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+HIDiWAGw/56UY/RFo6H6mTV
	4Hx0VKXI9wo+A+8JFSE=; b=HT/954ll6kAYDIoyfPTso1ltgj+faAsNz3AN1rxk
	+sHIgPZcI/Hkuy8p5eOk7RKUrmidOaBg+2hfes/zLjAN289C0fHlJAYd2vpRn2xU
	AYqppqBqRUDRxAedGndDFufnKdRvn6/DWgzee8fdAga3TTN3OqDq1/pT+uWQnCu/
	PAs8KwZgXEdw2H+57a0VZE1K0r5ifPKnhihs1OvX666XlEuFrlDIjJfXbuC5Hz25
	cX416VhTJM2OBu8id/uEIAb9SzzuxTBPXeatxtoZQ6dyv0u61fI7oA5fMi1dbHsR
	CbOSCCnTz+Sw7pSf6aTHWdEtcsigC8eLex3PSqfTYNxlAA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyhtpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:44:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7c7fdca0cso12609605ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782229482; x=1782834282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+HIDiWAGw/56UY/RFo6H6mTV4Hx0VKXI9wo+A+8JFSE=;
        b=LUqbHVnQ/SWeKXTILiY5ws4ySKcWucfgeZ4nXCBQ0kEoC8U++/1bHer05F0DLmeahE
         oHyT006JDwcXVAShdZmxVTN78fEbhPcCOogh6F2p6t1vJPJcRk//XpyIRI+T8KoB6p94
         vxbq04ptRcgkZZLGXX3saLyF/a7locZzObAQXZvfhDfvA8PZRZwyxckKxiKDre9eB1r0
         Bh7wCdyGIhpiBdIkcKOIHrVIXuyzNgXt3C78dHRnNPJ4QMwviicWH75gA5x1/XGe09WE
         kvJv9BdD32ZgDVc7nZSmLXL3nlL2ey5jvQt9YGddU7qyL36RFYH2rWZGIO/CzVzljvQN
         Hx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229482; x=1782834282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HIDiWAGw/56UY/RFo6H6mTV4Hx0VKXI9wo+A+8JFSE=;
        b=XqSc0jaMFOZ4YPrx1C+lH6pzqRC7oihLMC5waZUULsEi14Qdtjl2tYchowKk5rnUHt
         XAu9LHrtFp7bfFYM3SyFITwOZHOqiVI1TDGVOXGtXxgN21ywRL2CMY9BcRrPqiwIn0Ex
         MxMPM6nqoShS1WiiK+lAjsG1aOgWvBH1YyWvaOJKgMUe+k+vdAOhuh/FuU3kw0LTUPuf
         fe1gpJiQ6wKKrcgPq7ZtF3rmBX5Wraf4qiM5VNHmxLlUQaOhSGGSLSofwJCUdOI+4hrb
         YcnZ33vZcP5RDquZuj5oQK5Ht0O2Nk+Vp/2IFnfpv3nbRfDs7gdwTWIp1O3ipznWyuqq
         zVIw==
X-Forwarded-Encrypted: i=1; AHgh+RoYBJFP0DhSHuoQ/jQ3dO6j3a5Elo8PueSlroA0HXfm++LQBAdzQdyoolari+CjbvOc1e4v4b9IIFpOoJEe@vger.kernel.org
X-Gm-Message-State: AOJu0YxwmUXjIza7v/xD7ML3JsLutsEDUplcl2+PNNqelYIkBL+XL0jv
	NnLLqZ92yMwqrOgCjxnDsMEvC17ZkCM/a99fmYjO3lG8XxxDglPDlDjLmKHpmMg2F+LMuhO/ZO8
	eyfM8cL/SDR9ke9i+xWcW9oH3nooweiKwE6gF0g+A7jga35sIqiJ9dB4Bs4vqb+VqhvSq
X-Gm-Gg: AfdE7cmNlgr6TVvLShXkSGaQ4ZDJNby+4Qgnp3Z+5rsxug528utxEOEqw/ZyyJ/6cxp
	hMLxSHIKsPyFr7rp0FEhTVa3BQTHYGTbX9JDoTqGyEYilRpY5fxWJUmAnNM+zSrAjsgJXk5zJO+
	UP/7hqk7G+8qWMnw7bxEqw/4uLHL7L7aDh3Mq8O+qBDA6zVxYgDabITsptC4cyNskcpnDFqhzq6
	/HFgJwM4L4HkE3o8RiDnJN2/M6N1lD+5Rbit+RAt0MqHICLBzdGDPxnFksU3KMQgIhvAOGA14Xo
	p+6ooEgcLEjdE0qDMy7e13Ps6HT14w5bIqhGbWrmKhRWa3k2Mq3UO8YoRerRa9H0sjPzpubH6b4
	ZfXZ0+NvA4FTdE9mF2buWvmOoyEp1Z68IF5xNVw==
X-Received: by 2002:a17:903:3201:b0:2c6:9d3d:dfbd with SMTP id d9443c01a7336-2c7c9968fc3mr33672485ad.16.1782229481828;
        Tue, 23 Jun 2026 08:44:41 -0700 (PDT)
X-Received: by 2002:a17:903:3201:b0:2c6:9d3d:dfbd with SMTP id d9443c01a7336-2c7c9968fc3mr33672105ad.16.1782229481059;
        Tue, 23 Jun 2026 08:44:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f85f1sm115165805ad.42.2026.06.23.08.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 08:44:40 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:14:35 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: Drop unnecessary bitmap_fill() call
Message-ID: <20260623154435.uph27fs2rhbvmrqe@hu-mojha-hyd.qualcomm.com>
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyOSBTYWx0ZWRfX9y//15qCLMVo
 Q5fxpeS4QG4B5VKW+tOjybJUSPou2pshC3Y7J+fk1c9qGbOCYM0lSZufDsHdQ6uSTq23ZiQK2ar
 5m09QVU7MvVSBJOg30QUpq8qIazugpNnH03sNlAOhfbrTD5/5DF2NX+8+qP7K4PlO9FMs3jv5xU
 lRDFe9GlC6CVCgDaCBeGYfFTGPnXS4/0s7OqXFkxfNK8+z9x6J7TYoi09CJa9FHskLA6dhUUR2C
 eL9FMqMGUFncJxjswfg0NN5cZ9wPIQLeW9sdgwOZ/P1mKxKQ/Gxs8hsG/PecflJIMmlVeydW7jY
 cz0dI4s7LG/kpvfcoC7X4G7PQkFzcNc7nmUdsTCZOc0tmph/+jYQQkD65qcJJwppbPpAV7M+J2j
 NtqCaA3KCHAVtH8BgFPjacQU9K6BiA==
X-Proofpoint-GUID: nbHDVaCAXRbQi-1VxrZhIc22KwyZX8By
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3aa9ea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CudRCQxTT4vl8MJ7sxAA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyOSBTYWx0ZWRfX7oPOmBZRANjz
 eVXhUlmVBjGmdPFm5H7ZrXBR/CeX8yigYO8SfIEAqw2EFN9R+DM+pk8pn3unBrAKV/55ge8JglC
 NeE2DGzWsZXw59TXSA8AGcF5+LO/j1c=
X-Proofpoint-ORIG-GUID: nbHDVaCAXRbQi-1VxrZhIc22KwyZX8By
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114236-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-mojha-hyd.qualcomm.com:mid];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BD676B874B

On Tue, Jun 23, 2026 at 02:27:31PM +0200, Hans de Goede wrote:
> Drop an unnecessary bitmap_fill() call from msm_gpio_irq_init_valid_mask(),
> this is unnecessary because gpiochip_allocate_mask() already does this.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index c2938494c6bb..419342ab45e1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1047,8 +1047,6 @@ static void msm_gpio_irq_init_valid_mask(struct gpio_chip *gc,
>  	const struct msm_pingroup *g;
>  	int i;
>  
> -	bitmap_fill(valid_mask, ngpios);
> -
>  	for (i = 0; i < ngpios; i++) {
>  		g = &pctrl->soc->groups[i];
>  

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

