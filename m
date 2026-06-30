Return-Path: <linux-arm-msm+bounces-115357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ehRxNM2XQ2pfcwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:17:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C26E2B89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:17:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pxV1hPM4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gA2dWIYb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115357-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115357-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8417830A73DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1273C3EC2EF;
	Tue, 30 Jun 2026 10:12:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B1B3EBF0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:12:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814337; cv=none; b=p3s6Ab25u/JOIRDfMt0vS5tRZ0qdniCt9/3QlLJiiLzk9yrC7lMqw+gQVLCXyNZt4jnivhIUvdwQmHY3iYGN9xrqU1idBPaqy8t1GOhgAoH6Sv5aW+orhlD8+o9GLh3dyzXERijRT2VYQwErOEmsnPkGdIJevLfsQAou9EsHJnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814337; c=relaxed/simple;
	bh=tPLcI+u4fdxJg60JZI60iQH6kOjAxDYL6VS6LtHZG0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDxB0Mmch22RW92TKgQNkZuCxj/GPBeSHuNVumLErqUggGoDO/STpFT6JO6saIQ1zqzybAvwH2Ts+e0VeOqESoaLjSymVQRt+oimhdQ6/W1+09AhKINcBrmZbq+x7uHwIBGGAhMGeu6ldwB0O3tU6h30VHzdvi56hxH7d4nwzSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxV1hPM4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gA2dWIYb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n4K01508598
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vJf/wa7yHc74ZgiFrSpsTI1e/uwDjYdMLcBdWjlk2y8=; b=pxV1hPM4z+/Eenok
	CkSla+QBI/JXhSz8IqWd/sRx5IIj7E/JQ3+DtbJC9NjT5nC3LCm2PP5MWjCr3nI6
	PexfBWgZ91/Uu99YdoAZyaRCHKVUn9tC2d2fG3o7T/BGnUWj7QyOnJKVX9AYIkmd
	QUZinQ1FUTE2H6VFk3zzlqft6XnaRmQ35u2jprQ8U+6MUjRVLTjB4AfwVJayWha1
	HumNO2NHyHvVjPBiYo2NnY6JZewl94a7PPhmSaA3yQejZerYbMTjq++Cy7eB3zYG
	VsHB81TQ6Z0NGE4RpuzyNwmtdwGsSVVDCJ4SPMfVhAtQFe2j2AFAGP+Jd7ZkKz/J
	KXBIlQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j2wmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:12:15 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-969312a613fso208418241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782814334; x=1783419134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJf/wa7yHc74ZgiFrSpsTI1e/uwDjYdMLcBdWjlk2y8=;
        b=gA2dWIYb6m7m206BS18v/MSnwR1EU6LCf+wEey6NsvHL2H/rWAMpQohMzes1t/6Ih6
         dHSpHi0vpJ6ZdW/5XgUXRosBrvnsA8q6oKNhxXuXyKplck6rmJn9L08OetJ5y0844PE1
         qKO2WMSorjvSxCtnmLUm0e1OxIbhiCKKCyhbsxT25ohR4T8U1t2L8rCmLGwvOrRtgXJM
         HJN0mX3lx+X4KQNcLPdXIsb3whmccHZl9Jy+Bo+/y4eUrpa1jBcK2M/Y2VTFv22KRXw8
         0kpMx3lM4OJvX/UaDEjeql0Vtjdc4IoR2retBAnXtgcRg/1VE5BIEryhlYQd/q9iicok
         BEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814334; x=1783419134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJf/wa7yHc74ZgiFrSpsTI1e/uwDjYdMLcBdWjlk2y8=;
        b=icn6nXgXzhb/J/sxGRm5uQ4Qbk9BqWmx9vCfajCh/ZCkclVJNfChZmqd9jU3AiDF6V
         riBuOzHhki/UM92d3WCGjzoCMVpIZBVs6JKlZyxf/Elp/m/ympbKH2hZDD0gWXKhD4tO
         suAtXZ9KDUu6Gdq6JcFWbdoJ7t5IveYILNn+IM2xOTDUrVP+jHPwtOBnURpoFTLOFsTw
         +TWOaqnPqMYpOEY1zs5tK9O2CnnyOaM+9yLFIN9orhJhHtFYTtbvW+YtUsuwLLcjbYPl
         7KoB0fwGn/2RfOor8P7v4uZkCeZms6FVdRUUifghS2mvnlKwMhYGs8xl1x064j3nN+Ul
         KFig==
X-Gm-Message-State: AOJu0YxhDvgMck5OkE1FlIDbt8UwCq4uKcLo9UyHOWYq+OWc4AxPj9Ng
	MFEUqGwv4HBwflgyxTF+ytmjQUI4gxQIokqI4DTRKWIVDT+vcDj3esga46cSS/QGe9svj7agw+M
	SP6dr1gCeM/qiOyQh8TOpc5iVCJvEMJodPqRj6P68fChya4I3j9jQA7p8MbJBnCGjaIsA
X-Gm-Gg: AfdE7cnBmO3Eyq7uqkCdlPFZPcWos+OfMWjhF8CAzgNu2JQ8AA9uYA4D8X0r3dDfqQn
	3XojCY/I5i3LqUurfQAADvBDIxwP1JaJE1rzH2VEKlwG+ycDJVoaZN0xHu9bAN/UE0Q9qB4+QYy
	mZz2TjOEtKbPbB3pOopI21PLCxXKXlFptO6DWsVDk6V2eKkQnGr/YyBhY9Z1KMMObt8wkiPs7gD
	j1qPN3pn14D8HJ6+1LigJv8NmjVRX6VD69C8d1whm3vtEUCCelefdI1tPm9Fro3fv2x+RsGVg1e
	j0+mk57W8DlVa4gHZ7o6h/YJlGvcVcLuJhVpcBXUVhvmAH3y7yJtBDtNXPGWJGgGaeNXPydZSfe
	xRlSjMJ2nss8ml61W4+9Mo9L7biUMrMT/dJA=
X-Received: by 2002:a05:6102:4415:b0:727:36b9:dee with SMTP id ada2fe7eead31-73a397532camr475315137.8.1782814334323;
        Tue, 30 Jun 2026 03:12:14 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:727:36b9:dee with SMTP id ada2fe7eead31-73a397532camr475307137.8.1782814333824;
        Tue, 30 Jun 2026 03:12:13 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c98927csm905223a12.30.2026.06.30.03.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:12:12 -0700 (PDT)
Message-ID: <569d7a0a-fbde-4e8b-a148-376e93150dbd@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:12:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] firmware: qcom: scm: Fix tzmem state on probe
 retry
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
 <20260629141750.996853-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629141750.996853-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sRbqlZJDrCoMdgHiSs86yXFLKE9R6oF_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5MSBTYWx0ZWRfX6GJMigwqs8Kl
 a7oh7YeS3Nt3Ny2BoEJyka8XzSBWv6rNrreGRY7EsJnBjXaaD7qvAocnVFOuLSR/nO7rc+o2chm
 +mv0TepLOQ9SAh6bTDZq9kLYVfQI8wSWjhxkrD+hs55KA/9GxjnF01QQ74xiu0yIJR6/jcsa1Qt
 HZ/7o6EIBvDZ35V9f6we7H3nYAsjeSgq2JOwqAJYFaHEukLcwooqo2X8ORoOSNAwtN52mnjlIiR
 VS6jraAdX4JnPthiivuS3YvD0hbhcins0MbrM7vJpRCdaMJ6Cp2ZLG5UpxbH6h0j5TFrxo87cj0
 uLR8wDJgRlluZameQqHshfiBfmOXppSdbweYZFC9keVGi5h0v+E+rJvun5khGr8xLQZCzSfknzV
 +pcDhcSkhnt5gnb+4KdTNHRGsUhOv8X1E/Bt9/Ic5muKg2hnXntHcqYqENoJGz0f1dpnPZ9NBd0
 xNsd7AOGSUXGL45YTAw==
X-Proofpoint-GUID: sRbqlZJDrCoMdgHiSs86yXFLKE9R6oF_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5MSBTYWx0ZWRfXzjXvUDtF2P3a
 Qf6rHkAdSBSgB+kROwuqpeq/n81fHLuCzqAU9FQ098Gwx0lHlfNLMt4KRQFka0RbVfCAiTqNm7H
 eL6nvVOUHrMArM8IeU3DbzMYUFOoVVE=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43967f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=W7ye19pv6vkr5SR8RCAA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115357-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux@gurudas.dev,m:sibi.sankar@oss.qualcomm.com,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D4C26E2B89

On 6/29/26 4:17 PM, Mukesh Ojha wrote:
> qcom_tzmem_enable() returns -EBUSY if called a second time, but this
> causes probe retries to fail permanently if a later step in
> qcom_scm_probe() defers after qcom_tzmem_enable() has already succeeded.
> 
> Use DO_ONCE() to ensure qcom_tzmem_init() runs exactly once across all
> calls in a thread-safe manner. qcom_tzmem_dev is set on every call since
> probe retries use the same device pointer. The result of the first
> initialisation is cached and returned to every subsequent caller.
> 
> Fixes: 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem allocator")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

