Return-Path: <linux-arm-msm+bounces-117535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 23TPBff9TWpUBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:36:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C781722B1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 09:36:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IGYc6HUI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KkRWLu2Q;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117535-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117535-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9309B3001465
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 07:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025D63F44E2;
	Wed,  8 Jul 2026 07:35:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C087C3F39D3
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 07:35:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496123; cv=none; b=noe5rA1nQd4YD/AL22NN0euXTOipm+SJL9w/uH1BWnsCZpeqaocksWwdYsVvxtuRZxtaJAlqtcVuFsQr7drKEZFjLq0YvnDhnE4WixHwj3g4wWnWAYE2V5End/4zC6e1FOsNarGHSCcwh57d/sxFQ8usHi0ZRNoKSdRcj2D0GMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496123; c=relaxed/simple;
	bh=bmyLypJ4CyJtELPnoR5vlTsV9uyh+3EsheliTLhID+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lR3LugTb8ATOxXV8g4A+fjczUgJO0nw4hM3Erqpf46ve0joCBfUCUsKDBXWPH0mOOXGfQgaeeS+3rpZjL5RkxeThZDulE+i9gt6bsh4c4fh3tPU5zsgttOW129RXjJLt0Utui/qRtmmGk3BeT8Dn3fy6vL9ZWr5CObsV6cd1cFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGYc6HUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkRWLu2Q; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6684287r1656355
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 07:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oETM6ml01wzq58WtJgDwwWqT8UsCDrD5tXaExKvIQJA=; b=IGYc6HUI+AgTxMWR
	AJ3s9WTaE5GC1W/wcz5qD051LWqxXBxrceqIaPtpUWG0k5tWgIt/Qfkq7Ocbxc6D
	IeTGzPuHTEedKrXMgkVJHiWEqaFdITXnf4PmlLRSw8xp41cjpq+0AbNEgZW+z2n4
	HuQLCQkz8GLo0CvdQyg7pMWrDdpVh5TQ285ziqzgcybtucnmTvVajR3GrLBz3Chm
	NqIPPVR5YBS+ALWKUyj4J0BDXCgNPrBPuxxSftIRBfogLRIrQ/YsK9WSiEKDTdyl
	Qj2C2mGvaHkuCg+MegmNCwljLfJLmwucFvcDc+RPFCOXr47wJWC9/Wc7Az4RszMf
	7Tp3Wg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csss9ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:35:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c890bac374eso527283a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 00:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783496113; x=1784100913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oETM6ml01wzq58WtJgDwwWqT8UsCDrD5tXaExKvIQJA=;
        b=KkRWLu2QHYbqRKQUWpF6kjsnHSo2RGxFFQK8uiLX57RZOM2uZLsYlewtCNnsrQgJKw
         4/Mexl4NhvSiePmOXvNMNCXIDLgdLSZktqLrh9OSoNogNzBCd7f0X0slFWx0r+bW0dEr
         bc6uuPvHcBab8h980ua2pl4G3emnByjJcGk41vyr/LAhABrTkJ74K/EyPZGlsbTLaoFf
         iBLWL5blCtPGjkNgYc11zwwjnYNRtY2WPb2ApdlptQJopBJiSMeQHqJL6pXONrLd81FS
         gAcXA6TH/+pRs205crbqI/fVL9ayg2/2anjaFEPARY0v9aJFoPOUwSL+vEoE80W906wo
         4HOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496113; x=1784100913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oETM6ml01wzq58WtJgDwwWqT8UsCDrD5tXaExKvIQJA=;
        b=dE993jK6VZCsyvmxGGEWXnUm7UtdfffXIJzotewTLWeeN9UOzLklvon2gmniGvTt43
         vM3FNQmhc2huYUDnOrOw3mvDidOiO5IOA7Lu0ICG9M0FUQlDsRJVkwh5XwEcWiRhEkDO
         V5KWNetXHeTm6h0oc+b1lE3f+VL9TaT6Jflu+2TSnkW8nlZl9hBcS0QkmzgTjM5s+UYh
         wEsXF+XHYKm3dQBk5eRQZ6l9fA/czWaYMYHPMpGLMIrLHPai7VEzTtzFkX7HpXRNH/h0
         BoqVl69v1MXwrDzPpd1pAyNYt0S25IUyRZPM4wCj4cWLL+r5/vu2/5iadZyu7hy2N9rC
         jxeg==
X-Gm-Message-State: AOJu0YzvUY2QyC2RydoXC6C3BqV7Z+El4yNmU3gk+EBGdwvI1iVBZeQT
	xbFcHtN4qZc6vlju8E6JR3pYQ2KHCCMM/Bjy85oedLxWPey52jKbtIEUl+OgS7znC0Tf0zKKWin
	XtZgq7ojkE4Loul4DMphPvnsuNslChKHMl/3xRHZkSrvkOP8k0dOcwCIM9mgKI4j6LuV9
X-Gm-Gg: AfdE7cnZfIVi+yamzHbqGILKx6v9RRohbMiAQe67+kQuEl06EAYLNNO/otYwZgak+m9
	yLXN7vxG6wpjmvSCLgWz0njuJKQD2q7ED56mGxhayK9fzYDH+jtPzO4KyF5QgvDSTm35fgpRl/p
	aac36gF77eTYcSLXFSiuv+eovmW50BmGkrmXoQ06A85xEJIo9h4az4kQYe7OiEc7IeqxoTOIEI7
	8qHlWa0MImN0X3ALXsB6lGp9OXVsevS7aM/ntbjAZnmGTtD3xiFTLg33LgVb6owZ8Ao1KKXqK4i
	JXsrsnfG8csYGxa+KBwmypbfi0HTf8fpBi7z/MP7NLG6gJ19VknVvsggCRyyqvY7e0z8P0wgKak
	TjI8/gZR4933AU2YPirpnUsZqcboSy8a08z5Vjs/OROat
X-Received: by 2002:a05:6a21:4902:b0:3b4:8717:1c21 with SMTP id adf61e73a8af0-3c0bcbcadf5mr1714168637.35.1783496112795;
        Wed, 08 Jul 2026 00:35:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:4902:b0:3b4:8717:1c21 with SMTP id adf61e73a8af0-3c0bcbcadf5mr1714136637.35.1783496112386;
        Wed, 08 Jul 2026 00:35:12 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm2067251a12.22.2026.07.08.00.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:35:11 -0700 (PDT)
Message-ID: <5cf8bf42-8293-4672-b6b2-226ec1acdb56@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 13:05:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] i2c: qcom-geni: improve transfer error recovery and
 synchronization
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
References: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-0-dd8f841f36a2@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260708-fix_cancel_sequence_on_failure_for_i2c-v1-0-dd8f841f36a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4dfdb1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6jiF5cv_vgskca90EcIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfX3Jncnb84kk9T
 6TlZBJccOlShesxV5Z5IS+s3vmcoQmemvdGgiovSIMej2tyqDuqS6R1pftOItLKqhRUfgAbKni/
 bwYfT1ZCka/f/8cT0c7gOg5+sJfKuler6Y9f9Gl+6CXdrqQAXz1NQxIlMqb+KEWMorOj1sh8eJ5
 vjQsCF5NuLFQbq3LVmqkcM3IKpcum37eC0IuQyBxxmtOvTOmV+wXocNLtSpkGdP1vYWRbsE1iSK
 f3YpkhH7xMWCTNjWiH5UoHRLda2mpVGj0wueg497MGhZw4p3pDG9kExK7E/xnIRZ5PPVprw9fE4
 ZZP1SaE7JtdrB0ammVGlhnN2a5j4xxUmhoRrriEpi2HTBgKqh+H8bWePMsU91xwD+ZcFk4zG/uG
 wtrHNFMXhcONTasrrbf+YAWsOe7sbn1OcHnufLGbWXkJEJAO/UAYeirRWHKm4BYwpJxTHsA1rll
 Ud8vb4KsSDT7s8gEQBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3MCBTYWx0ZWRfX9m9P3brDgCw/
 jXs3iRd0ehFriSxray1NHSP/PJlBFzbTfdcVgrRa3rabSSbwUd1CqLgEdhKaDNLKbuq3QNw3X0Y
 Ds0f7t8WROT2QkkemesrOt8Ap2mEvLE=
X-Proofpoint-GUID: UZezrNossTz_9i4WGVv-NuGp3TqQt7Ga
X-Proofpoint-ORIG-GUID: UZezrNossTz_9i4WGVv-NuGp3TqQt7Ga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117535-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C781722B1A



On 7/8/2026 11:45 AM, Praveen Talari wrote:
> The GENI I2C driver currently has a few issues in its transfer recovery
has few issues
> and completion handling paths.
> 
> The timeout recovery flow directly aborts outstanding commands, while
> GENI hardware requires command cancellation to be attempted before
> issuing an abort. In addition, multiple operations share a common
> completion object, which can allow unrelated events to wake waiters
> prematurely and lead to incorrect synchronization.
> 
> Address NACK handling can also trigger unnecessary cancel and reset
cancellation and reset operations
> operations even though the transfer has already terminated during the
> address phase.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> Praveen Talari (3):
>        i2c: qcom-geni: use cancel command before abort on transfer timeout
>        i2c: qcom-geni: use dedicated completions for abort and reset events
>        i2c: qcom-geni: Avoid unnecessary transfer cancel on address NACK
> 
>   drivers/i2c/busses/i2c-qcom-geni.c | 100 ++++++++++++++++++++++++-------------
>   1 file changed, 66 insertions(+), 34 deletions(-)
> ---
> base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
> change-id: 20260703-fix_cancel_sequence_on_failure_for_i2c-a868571f77e0
> 
> Best regards,
> --
> Praveen Talari <praveen.talari@oss.qualcomm.com>
> 


